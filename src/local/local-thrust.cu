#include <iostream>
#include <math.h>
#include <vector>
#include <random>
#include <tuple> // for tuple
#include <array>     // std::array
#include <iostream>  // std::cout
#include <algorithm> // std::shuffle
#include <chrono>    // std::chrono::system_clock
#include <thrust/tabulate.h>
#include <thrust/functional.h>
#include <thrust/execution_policy.h>
#include <thrust/device_vector.h>
#include <thrust/random.h>
#include <thrust/device_vector.h>
#include <thrust/transform.h>
#include <thrust/iterator/counting_iterator.h>


struct shuffle
{
    int n_alunos, total;
    

    __host__ __device__
    shuffle(int _n_alunos, int _total) : n_alunos(_n_alunos), total(_total) {};

    __host__ __device__
        int operator()(const unsigned int *N) const
        {
            for (int i = 0; i < total/n_alunos; i++)
            {
                thrust::minstd_rand rng;
                
                for (int j = 0; i < n_alunos; i++)
                {
                    thrust::uniform_int_distribution<int> dist(0, 20);
                    rng.discard(i);
                    ptr[i*j] = ptr[i*dist(i)];
                }
                
                


            }
            
            
        }
};





struct make_init : public thrust::unary_function<int,int>
{
  int _a;
  make_init(int a) : _a(a) {}
  int operator()(int i) const { return i % this->_a; }
};


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
        

        for (int j = 0; j < n_choices; j++)
        {
            prefs[i][prefs_choice[j]] = pow(n_choices - j, 2);
        }
    }

    std::vector<int> vagas(n_projetos, n_choices); // start with value of n_choices
    const int N = n_alunos * 200000;
    thrust::host_vector<int> A(N);   

    
    thrust::tabulate(A.begin(), A.end(), make_init(n_projetos));


    thrust::device_vector<int> d_vec = A;

    for (int i = 0; i < 10; i++)
    {
        std::cout << A[i] << "\n";
    }


    thrust::counting_iterator<unsigned int> index_sequence_begin(0);
    

    /*thrust::transform(index_sequence_begin,
            index_sequence_begin + N,
            d_vec.begin(),
            shuffle(n_alunos, N));*/
    
    
    

    
}