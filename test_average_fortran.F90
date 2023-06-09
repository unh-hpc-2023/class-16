
! ----------------------------------------------------------------------
! test vector_avg()

program test_vector_average
  implicit none

  integer, parameter :: n = 500000000
  real, allocatable :: cc(:), nc(:)
  real :: dx, pi, x
  real(kind=8) :: tbeg, tend, wtime
  integer :: i

  allocate(cc(0:n-1), nc(0:n))
  pi = 4 * atan(1.)
  dx = 2. * pi / n
  do i = 0, n
     x = i * dx;
     nc(i) = sin(x) + 1./3. * sin(3.*x);
  end do

!   open(11, file="x_nc.asc")
!   do i = 0, n
!      x = i * dx;
!      write(11,*) x, nc(i)
!   end do
!   close(11)

  do i = 1, 5
   tbeg = wtime()
   call vector_average(cc, nc, n)
   tend = wtime()
   print *,'took', tend-tbeg, 'seconds'
  end do

!   open(11, file="x_cc.asc")
!   do i = 0, n-1
!      x = (i + .5) * dx;
!      write(11,*) x, cc(i)
!   end do
!   close(11)

end program test_vector_average

! ----------------------------------------------------------------------
! wtime(): helper function to return current wallclock time
! in seconds

function wtime()
  implicit none

  integer clock_max, clock_rate, clock_reading
  real (kind = 8) wtime

  call system_clock(clock_reading, clock_rate, clock_max)

  wtime = real(clock_reading, kind = 8) / clock_rate

end function
