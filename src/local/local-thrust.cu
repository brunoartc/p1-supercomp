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
#include <thrust/extrema.h>



/*
struct shuffle
{
    int n_alunos, total;
    int* ptr;
    thrust::uniform_int_distribution<int> dist;

    __host__ __device__
    shuffle(int _n_alunos, int _total, int* _ptr,  thrust::uniform_int_distribution<int> _dist) : n_alunos(_n_alunos), total(_total), ptr(_ptr), dist(_dist){};

    __host__ __device__
        thrust::uniform_int_distribution<int> dist;
        int operator()(const unsigned int N) const
        {
            thrust::default_random_engine rng(N);
                

            int random;
            random = dist(rng);
            //rng.discard(N);
            const int index = (((int) N/n_alunos) * n_alunos);


            int temp = ptr[index];
            //ptr[index] = ptr[N];
            //ptr[N] = 2;



            return index;//return temp;//return ptr[dist(rng)/n_alunos];//return dist(rng);//ptr[dist(rng)/n_alunos];
            
            
        }
};

 //old gold*/


 struct shuffle{
    int n_alunos;
    int total;
    int *ptr;
    int *prefs;
    
    int seed;
    thrust::uniform_int_distribution<int> dist;
    
    shuffle ( int _n_alunos, int _total, int *_ptr,
                    thrust::uniform_int_distribution<int> dist, int *_prefs) :
                                                                  n_alunos(_n_alunos),
                                                                  total(_total),
                                                                  ptr(_ptr),
                                                                  dist(dist),
                                                                  prefs(_prefs){};

    __device__ __host__
    int operator()(const int &i) {
        thrust::default_random_engine rgn(i);
        /*rgn.discard(i);
        int randommm;
        randommm = dist(rgn);
        const int index = ( i * n_alunos) + randommm;// * n_alunos) + randommm;
        int old = ptr[index];
        ptr[index] = ptr[i];
        ptr[i] = old;*/   //old


        for(int j=0; j < n_alunos; j++){
            int randommm = dist(rgn);
            int old = ptr[j+i*n_alunos];
            ptr[j+i*n_alunos] = ptr[randommm+i*n_alunos]; //faz trocas no aluno projeto aleatoriamente
            ptr[randommm+i*n_alunos] = old;
        }
        int ful_sat = 0;
        for(int j=0; j < n_alunos; j++){
            ful_sat += prefs[j+i*n_alunos + ptr[j+i*n_alunos]];
        }

        return ful_sat;
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

    thrust::host_vector<int> prefs(n_alunos*n_choices);

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
            prefs[i + prefs_choice[j]] = pow(n_choices - j, 2);
        }
    }
    
    thrust::device_vector<int> dprefs = prefs;

    std::vector<int> vagas(n_projetos, n_choices); // start with value of n_choices
    const int inters = 200000;
    const int N = n_alunos * inters;
    thrust::host_vector<int> A(N);   

    thrust::host_vector<int> santax(N);
    thrust::host_vector<int> santax2(N);

    thrust::device_vector<int> satis(N);

    
    thrust::tabulate(A.begin(), A.end(), make_init(n_projetos));


    thrust::device_vector<int> d_vec = A;
    thrust::device_vector<int> st = A;
    int initila = 0;
    /*for (int i = initila; i < initila +9; i++)
    {
        std::cout << A[i] << "\n";
    }*/


    thrust::counting_iterator<unsigned int> index_sequence_begin(0);
    

    int* dv_ptr = thrust::raw_pointer_cast(d_vec.data());
    int* dv_prefs_ptr = thrust::raw_pointer_cast(d_vec.data());


    thrust::uniform_int_distribution<int> dist(0,n_projetos - 1);


    thrust::transform(index_sequence_begin,
            index_sequence_begin + inters,
            satis.begin(),
            shuffle(n_alunos, N, dv_ptr, dist, dv_prefs_ptr));


    

    

    thrust::copy(satis.begin(), satis.end(), santax.begin());

    thrust::copy(d_vec.begin(), d_vec.end(), santax2.begin());
    
    int* vec = santax.data();

    int indexx  = std::distance(vec, std::max_element(vec, vec + N));


    std::cout << vec[indexx] << " 1" << "\n";
    for (int i = 0; i < n_alunos-1; i++)
    {
        std::cout << santax2[indexx*n_alunos + i] << " ";
    }
    std::cout << santax2[indexx*n_alunos + n_alunos];

    /*for (int i = initila; i < initila +9; i++)
    {
        std::cout << "i:" << i<<" <-> " << santax[i] << " " << max << "\n";
    }*/

    
}