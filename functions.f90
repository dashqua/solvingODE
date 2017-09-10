module functions
  implicit none
  contains
    function f(x)
      real :: f, x
      f = -1 + 0*x
    end function f
    
    function freal(x)
      real :: freal, x
      freal = x*x/2 - x/2
    end function freal

    subroutine display(a, n)
      !display a n x n matrix
      real, dimension(:,:), allocatable :: a
      integer :: n, i
      print *, "Displaying the matrix..."
      do, i=1,n
         write(*,*) a(i,1:n) 
      end do
    end subroutine display

    subroutine matToBand(mat, a, b, c, n)
      integer :: n, i
      real, dimension(:,:) :: mat
      real, dimension(:), allocatable :: a, b, c
      allocate(a(n),b(n),c(n))
      a(1) = 0.0
      b(1) = mat(1,1)
      c(1) = mat(1,2)
      do i=2,n-1
         a(i) = mat(i,i-1)
         b(i) = mat(i,i)
         c(i) = mat(i,i+1)
      end do
      a(n) = mat(n,n-1)
      b(n) = mat(n,n)
      c(n) =  0.0
    end subroutine matToBand

    function scalarproduct(a,b,n) result(res)
      integer :: n,i
      real, dimension(n) :: a, b
      real :: res
      res = 0.0
      do i=1,n
         res = res + a(i)*b(i)
      end do
    end function scalarproduct
    
    function matvectproduct(mat, vect, n) result(res)
      integer :: n, i
      real, dimension(n,n) :: mat
      real, dimension(n) :: vect, res
      do i=1,n
         res(i) = scalarproduct( mat(i,1:n), vect, n )
      end do
    end function matvectproduct

    function copyVector(x,n) result(res)
      integer ::n, i
      real, dimension(n) :: x, res
      do i=1,n
         res(i) = x(i)
      end do
    end function copyVector

    function copyMatrix(a, n) result(b)
      integer :: n, i, j
      real, dimension(n,n) :: a, b
      do j=1,n
         do i=1,n
            b(i,j) = a(i,j)
         end do
      end do
    end function copyMatrix
end module functions

