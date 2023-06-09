
#include <cstdio>
#include <omp.h>

// ----------------------------------------------------------------------
// main

int main(int argc, char** argv)
{
  printf("Hi, just starting\n");
  int thread, n_threads;

#pragma omp parallel
  {
    thread = omp_get_thread_num();
    n_threads = omp_get_num_threads();
    printf("Hi, I'm thread %d of %d\n", thread, n_threads);
  }

  printf("I'm about to be done.\n");
  return 0;
}
