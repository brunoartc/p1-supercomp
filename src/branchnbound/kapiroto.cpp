#include <iostream>
#include <math.h>
#include <vector>

int max_thread=8;

struct melhor_obj
{

    int satisfacao_atual = 0;
    std::vector<int> melhor;
};



melhor_obj *escolhe_alunos(std::vector<std::vector<int>> prefs, std::vector<int> aluno_projeto, std::vector<int> vagas, int satisfacao_atual, melhor_obj *melhor, int i, int n_alunos, int n_projetos)
{

    if (i == n_alunos)
    {
        if (melhor->satisfacao_atual == -1)
        {
            melhor->satisfacao_atual = satisfacao_atual;
            melhor->melhor = aluno_projeto;
            std::cerr << "Melhor: " << satisfacao_atual << " ";
            for (int i = 0; i < aluno_projeto.size(); i++)
            {
                std::cerr << aluno_projeto[i] << " ";
            }
            std::cerr << "\n";
        }

        if (satisfacao_atual > melhor->satisfacao_atual)
        {

            melhor->satisfacao_atual = satisfacao_atual;
            melhor->melhor = aluno_projeto;
            std::cerr << "Melhor: " << satisfacao_atual << " ";
            for (int i = 0; i < aluno_projeto.size(); i++)
            {
                std::cerr << aluno_projeto[i] << " ";
            }
            std::cerr << "\n";
        }
        return melhor;
    }
    int alunos_restantes = aluno_projeto.size() - i;
    if (satisfacao_atual + alunos_restantes*25 < melhor->satisfacao_atual){
        std::cerr << "Bound: " << melhor->satisfacao_atual << " " << satisfacao_atual << "\n";
        return melhor;

    }
    for (int proj_atual = 0; proj_atual < n_projetos; proj_atual++)
    {
        if (vagas[proj_atual] > 0)
        {
            vagas[proj_atual]--;
            aluno_projeto[i] = proj_atual;
            
            
            escolhe_alunos(prefs, aluno_projeto, vagas, satisfacao_atual + prefs[i][proj_atual], melhor, i + 1, n_alunos, n_projetos);
            
            aluno_projeto[i]--;
            vagas[proj_atual]++;
        }
    }



    
    #pragma omp taskwait
    return melhor;
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
        

        for (int j = 0; j < n_choices; j++) // tava preso em 3? n_choices
        {
            prefs[i][prefs_choice[j]] = pow(n_choices - j, 2);
        }
    }

    std::vector<int> vagas(n_projetos, 3);

    std::vector<int> aluno_projeto(n_alunos, -1);

    melhor_obj melhor_result;
#pragma omp parallel
    {
#pragma omp master
        escolhe_alunos(prefs, aluno_projeto, vagas, 0, &melhor_result, 0, n_alunos, n_projetos);
    }

    std::cout << melhor_result.satisfacao_atual << " 1" << "\n";
    for (int i = 0; i < melhor_result.melhor.size(); i++)
    {
        std::cout << melhor_result.melhor[i] << " ";
    }
    std::cout << "\n";

}