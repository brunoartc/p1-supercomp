#include <thrust/random.h>
#include <thrust/device_vector.h>
#include <thrust/transform.h>
#include <thrust/iterator/counting_iterator.h>

#include <iostream>




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