program main
  use resol
  implicit none

  integer :: L, T, n, i
  real :: h, t1, t2, error
  real, dimension(:,:), allocatable :: a
  real, dimension(:), allocatable :: x, b, ca, cb, cc, copy_of_b

  L = 1
  T = 1

  ! faire bouger n ici
  do i=10,10000,10

     call cpu_time(t1)

     n = i
     h = L/n

     call setMatrix(a, n)
     !  call display(a, n)

     call setVector(b, n, L, T)
     allocate(copy_of_b(n))
     copy_of_b = copyVector(b,n)
     !  print *, "Displaying the vector..."
     !  print *, b

     call matToBand(a, ca, cb, cc, n)
     !  print *, "Displaying the band vectors..."
     !  print *, ca
     !  print *, cb
     !  print *, cc

     allocate(x(n))
     call tdma(ca,cb,cc,b,x,1,n)
     !  print *, "Displaying the solution..."
     !  print *, x
     !  print *, b

     !  print *, "Test de la solution :"
     !  print *, matvectproduct(a, x, n) - copy_of_b

     error = norm2( matvectproduct(a, x, n) - copy_of_b )

     call cpu_time(t2)

     !Sortie du programme à chaque boucleOutput of the program at every loop end :
     ! n, erreur, cpu_time
     print *, n, error, t2 - t1, log(error), log(t2-t1)

     !deallocation
     deallocate( x, b, ca, cb, cc, copy_of_b, a)
     
     !end of loop
  end do
end program main
