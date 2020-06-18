#include <string>
#include <iostream>
#include <vector>
#include <tuple>
#include <stdio.h>
#include <math.h>
using namespace std;



struct melhor_obj
{

    int satisfacao_atual = -1;
    std::vector<int> melhor;
};

void print_melhor(melhor_obj melhor) {
  cerr << "Melhor: " << (melhor.satisfacao_atual) << " ";

  for (int i = 0; i < (melhor.melhor).size(); i++){
    cerr << (melhor.melhor)[i];
    if (i < (melhor.melhor).size() - 1) {
      cerr << " ";
    }
  }
  cerr << "\n";
}

melhor_obj escolhe_alunos(vector<vector<int>> prefs, vector<int> aluno_projeto, vector<int> vagas, int satisfacao_atual, melhor_obj melhor, int i) {

  if (i == aluno_projeto.size()) {

    if (melhor.melhor.empty()) {
      melhor.melhor = aluno_projeto;
      melhor.satisfacao_atual = satisfacao_atual;
      print_melhor(melhor);
    }

    if (melhor.satisfacao_atual < satisfacao_atual) {
      melhor.melhor = aluno_projeto;
      melhor.satisfacao_atual = satisfacao_atual;
      print_melhor(melhor);
    }

    return melhor;
  }

  int bound = satisfacao_atual + (25 * (aluno_projeto.size() - i));

  if (melhor.satisfacao_atual > bound) {
    cerr << "Bound: " << melhor.satisfacao_atual << " " << bound << "\n";
    return melhor;
  }

  for (unsigned int proj_atual = 0; proj_atual < prefs[0].size(); proj_atual++)
  {
    if (vagas[proj_atual] > 0)
    {

      vagas[proj_atual] -= 1;
      aluno_projeto[i] = proj_atual;

      melhor = escolhe_alunos(prefs, aluno_projeto, vagas, satisfacao_atual + prefs[i][proj_atual], melhor, i + 1);

      aluno_projeto[i] -= 1;
      vagas[proj_atual] += 1;

    }
  }

  return melhor;
}

melhor_obj escolhe_alunos_busca_local(vector<vector<int>> prefs, vector<int> aluno_projeto, vector<int> vagas, int satisfacao_atual, melhor_obj melhor, int i) {

  for (unsigned int proj_atual = 0; proj_atual < prefs[0].size(); proj_atual++)
  {
    if (vagas[proj_atual] > 0)
    {

      vagas[proj_atual] -= 1;
      aluno_projeto[i] = proj_atual;

      melhor = escolhe_alunos(prefs, aluno_projeto, vagas, satisfacao_atual + prefs[i][proj_atual], melhor, i + 1);

      aluno_projeto[i] -= 1;
      vagas[proj_atual] += 1;

    }
  }

  return melhor;
}

int main() {

  int n_alunos, n_projetos, n_choices;

  cin >> n_alunos;
  cin >> n_projetos;
  cin >> n_choices;

  vector<vector<int>> prefs;

  for (int j = 0; j < n_alunos; j++) {
    vector<int> temp;
    for (int i = 0; i < n_projetos; i++) {
      temp.push_back(0);
    }
    prefs.push_back(temp);
  }

  for (int j = 0; j < n_alunos; j++) {
    vector<int> projs;
    for (int i = 0; i < n_choices; i++) {
      int input;
      cin >> input;
      projs.push_back(input);
    }

    for (int i = 0; i < n_choices; i++) {
      prefs[j][projs[i]] = pow(n_choices - i, 2);
    }

  }

  vector<int> vagas (n_projetos, 3);
  vector<int> aluno_projeto (n_alunos, -1);

  melhor_obj melhor_local;

  melhor_obj melhor_global = escolhe_alunos(prefs, aluno_projeto, vagas, 0, melhor_local, 0);

  //cout << (melhor_global.satisfacao_atual) << " 1" << "\n";

  std::cout << melhor_global.satisfacao_atual << " 1" << "\n";
    for (int i = 0; i < melhor_global.melhor.size(); i++)
    {
        std::cout << melhor_global.melhor[i] << " ";
    }
    std::cout << "\n";

}