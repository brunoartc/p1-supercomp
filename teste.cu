#include <thrust/random.h>
#include <thrust/device_vector.h>
#include <thrust/transform.h>
#include <thrust/iterator/counting_iterator.h>

#include <iostream>

struct prg
{
    int n_alunos;
    

    __host__ __device__
    prg(int _n_alunos) : n_alunos(_n_alunos) {};

    __host__ __device__
        int operator()(const unsigned int n) const
        {
            thrust::default_random_engine rng;
            thrust::uniform_int_distribution<int> dist(0, 20);
            rng.discard(n);

            return dist(rng);
        }
};


int main(void)
{
    const int N = 20;

    thrust::device_vector<float> numbers(N);
    thrust::counting_iterator<unsigned int> index_sequence_begin(0);

    thrust::transform(index_sequence_begin,
            index_sequence_begin + N,
            numbers.begin(),
            prg(0,60));

    for(int i = 0; i < N; i++)
    {
        std::cout << numbers[i] << ",";
    }

    std::cout << std::endl;



}