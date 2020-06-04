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

melhor_obj escolhe_alunos_master(std::vector<std::vector<int>> prefs, std::vector<int> aluno_projeto, std::vector<int> vagas, int satisfacao_atual, melhor_obj melhor, int i, int n_alunos, int n_projetos)
{
}

void random_alunos_dist(std::vector<int> &aluno_projeto, std::vector<int> vagas)
{
    std::random_device rd; // obtain a random number from hardware

    for (int proj = 0; proj < vagas.size(); proj++)
    {
        while (vagas[proj] > 0)
        {
            aluno_projeto.push_back(proj);
            vagas[proj] -= 1;
        }
    }
    std::shuffle(begin(aluno_projeto), end(aluno_projeto), rd);
}

int main(int argc, char const *argv[])
{
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
        

        for (int j = 0; j < 3; j++)
        {
            prefs[i][prefs_choice[j]] = pow(n_choices - j, 2);
        }
    }

    std::vector<int> vagas(n_projetos, 3); // start with value of 3

    std::vector<int> aluno_projeto(n_alunos, -1); // start with value of -1 nao ASSIM EH ERRADO


    int i = 0;
    int f = 0;
    while (i < n_alunos)
    {
        f=0;
        int k = 0;
        while (f < vagas[k])
        {
            // projeto i
            aluno_projeto[i] = f;
            i++;

            f++;
        }
        k++;
    }

    for (int i = 0; i < n_alunos; i++)
    {
        //std::cout << aluno_projeto[i];
    }
    

    int maior = 0;
    std::vector<int> aln_proj;

    #pragma omp parallel for
    for (int i = 0; i < 400000; i++)
    {
        //std::cout << i;
        
        
        std::vector<int> aluno_projet = aluno_projeto;
        random_alunos_dist(aluno_projet, vagas);

        int agora = 0;
        for (int i = 0; i < n_alunos; i++)
        {
            agora += prefs[i][aluno_projet[i]];
            
        }
        if (agora > maior){
                #pragma critical
                maior = agora;
                #pragma critical
                aln_proj = aluno_projet;
                std::cerr << "Iter: " << maior << " ";
                for (int i = 0; i < aluno_projeto.size(); i++)
                {
                    std::cerr << aluno_projeto[i] << " ";
                }
                std::cerr << "\n";
            }

    }
    

   std::cout << maior << " " << 1 << "\n";
    for (int i = 0; i < aln_proj.size(); i++)
    {
        std::cout << aln_proj[i] << " ";
    }
    std::cout << "\n";
}