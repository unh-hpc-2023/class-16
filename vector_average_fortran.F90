! ----------------------------------------------------------------------
! calculate vector average (nc -> cc)

subroutine vector_average(cc, nc, n)
  implicit none

  integer :: n
  real :: cc(0:n-1), nc(0:n)

  integer :: i

  !$omp parallel do
  do i = 0, n-1
     cc(i) = .5 * (nc(i) + nc(i+1))
  end do
  !$omp end parallel do

end subroutine vector_average
