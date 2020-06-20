#include <iostream>
#include <math.h>
#include <vector>
#include <random>
#include <array>     // std::array
#include <iostream>  // std::cout
#include <algorithm> // std::shuffle
#include <chrono>    // std::chrono::system_clock

struct melhor_obj
{

    int satisfacao_atual = -1;
    std::vector<int> melhor;
};

melhor_obj escolhe_alunos(std::vector<std::vector<int>> prefs, std::vector<int> aluno_projeto, std::vector<int> vagas, int satisfacao_atual, melhor_obj melhor, int i, int n_alunos, int n_projetos)
{

    for (int proj_atual = 0; proj_atual < n_projetos; proj_atual++)
    {
        if (vagas[proj_atual] > 0)
        {
            vagas[proj_atual]--;
            aluno_projeto[i] = proj_atual;
            melhor = escolhe_alunos(prefs, aluno_projeto, vagas, satisfacao_atual + prefs[i][proj_atual], melhor, i + 1, n_alunos, n_projetos);

            aluno_projeto[i]--;
            vagas[proj_atual]++;
        }
    }

    return melhor;
}

melhor_obj local(std::vector<std::vector <int> > prefs, std::vector<int> aluno_projeto, std::vector<int> vagas, melhor_obj best, int satisfacao_atual=0, int i=0){
    int soma = 0;
    for(int p = 0; p < prefs.size(); p++){
        soma += prefs[p][aluno_projeto[p]];
    }
    
    best.satisfacao_atual = soma;
    melhor_obj nova_solucao;
    for (int j=0; j<prefs.size(); j++){
        nova_solucao.melhor.push_back(aluno_projeto[j]); 
        best.melhor[j] = (aluno_projeto[j]); 
    }
    
    for(int p = 0; p < best.melhor.size(); p++){
        for (int k = 0; k < best.melhor.size(); k++){
            if (k != p){
                nova_solucao.melhor[p] = best.melhor[k];
                nova_solucao.melhor[k] = best.melhor[p];
                nova_solucao.satisfacao_atual = 0;
                for(int i = 0; i < best.melhor.size(); i++){
                    nova_solucao.satisfacao_atual += prefs[i][nova_solucao.melhor[i]];
                }
                if (best.satisfacao_atual < nova_solucao.satisfacao_atual){
                    for (int j=0; j<nova_solucao.melhor.size(); j++){
                        best.melhor[j] = nova_solucao.melhor[j]; 
                    }
                    best.satisfacao_atual = nova_solucao.satisfacao_atual;
                    k = 0;
                    p = 0;
                }
                else {
                    nova_solucao.melhor[p] = best.melhor[p];
                    nova_solucao.melhor[k] = best.melhor[k];
                }
            }
        } 
    }
    return best;
}

melhor_obj escolhe_alunos_master(std::vector<std::vector<int>> prefs, std::vector<int> aluno_projeto, std::vector<int> vagas, int satisfacao_atual, melhor_obj melhor, int i, int n_alunos, int n_projetos)
{
}

void random_alunos_dist(std::vector<int> &aluno_projeto, std::vector<int> vagas)
{
    //std::random_device rd; // obtain a random number from hardware
    
    //std::shuffle(begin(aluno_projeto), end(aluno_projeto), rd);
    std::random_shuffle(begin(aluno_projeto), end(aluno_projeto));
}


int myrandom (int i) { return std::rand()%i;}



void random_alunos_dist_full(std::vector<int> &aluno_projeto, std::vector<int> vagas)
{
    int i = 0;
    while (i < aluno_projeto.size())
    {
        int f = rand() % vagas.size();
        int k = 0;
        while (vagas[f] == 0){
            
            f = rand() % vagas.size();
        }
        vagas[f]--;
        aluno_projeto[i] = f;
        i++;
    }
    
    //std::shuffle(begin(aluno_projeto), end(aluno_projeto), rd);
}


int main(int argc, char const *argv[])
{

    if(getenv("SEED")) {
    srand(atoi(getenv("SEED")));
    } else {
        srand(0);
    }

    int n_alunos, n_projetos, n_choices;
    

    std::cin >> n_alunos;
    std::cin >> n_projetos;
    std::cin >> n_choices;

    std::vector<std::vector<int>> prefs(n_alunos);
    for (int i = 0; i < n_alunos; i++)
        prefs[i].resize(n_projetos);

    for (int i = 0; i < n_alunos; i++)
    {

        std::vector<int> prefs_choice;
        int choice;
        for (int i = 0; i < n_choices; i++)
        {
            std::cin >> choice;
            prefs_choice.push_back(choice);
        }
        

        for (int j = 0; j < n_choices; j++)
        {
            prefs[i][prefs_choice[j]] = pow(n_choices - j, 2);
        }
    }

    std::vector<int> vagas(n_projetos, 3); // start with value of n_choices

    std::vector<int> aluno_projeto; // start with value of -1 nao ASSIM EH ERRADO


    for (int i = 0; i < n_projetos; i++) {
        for (int j = 0; j < 3; j++){
            aluno_projeto.push_back(i);
        }
    }

    int iters = 0;
    if(getenv("ITER")) {
    iters = atoi(getenv("ITER"));
    } else {
        iters = 100000;
    }
    

    int maior = 0;
    std::vector<int> aln_proj;
    std::vector<int> aluno_projet = aluno_projeto;

    melhor_obj melhor_global;
    melhor_global.satisfacao_atual = 0;
    melhor_global.melhor = aluno_projet;
    std::vector<int> vagas_g(vagas);
    //srand(time(NULL));
    auto rng = std::default_random_engine {};
    #pragma omp parallel for
    for (int i = 0; i < iters; i++)
    {

        //random_alunos_dist(aluno_projet, vagas_g);
        melhor_obj current_best;
        //random_alunos_dist(aluno_projet, vagas_g);
        
        
        current_best = local(prefs, aluno_projet, vagas, melhor_global);
        int agora = current_best.satisfacao_atual;
        melhor_obj atual_obj;
        std::shuffle ( aluno_projet.begin(), aluno_projet.end() , rng);
        atual_obj = local(prefs, aluno_projet, vagas, melhor_global);
        if (atual_obj.satisfacao_atual > melhor_global.satisfacao_atual){
            //#pragma critical
            melhor_global.satisfacao_atual = atual_obj.satisfacao_atual;
            melhor_global.melhor = atual_obj.melhor;
        }

    }
    

   std::cout << melhor_global.satisfacao_atual  << " 1" << "\n";
    for (int i = 0; i < melhor_global.melhor.size(); i++){
        std::cout << melhor_global.melhor[i] << " ";
    }
    std::cout << "\n";

    
}