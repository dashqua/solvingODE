module resol
  use functions
  implicit none
  contains
    subroutine setMatrix(a, n)
      real, dimension(:,:), allocatable :: a
      integer :: n, i
      !builds n x n matrix 'a'
      allocate(a(n,n))
      a = 0.0
      do i=2,n-1
         a(i,i-1) = 1
         a(i,i) = -2
         a(i,i+1) = 1
      end do
      a(1,1) = 1
      a(n,n) = 1
    end subroutine setMatrix
    
    subroutine setVector(b, n, L, T)
      real, dimension(:), allocatable :: b
      integer :: n, i, L, T
      real :: h
      !builds n vector 'b'
      allocate(b(n))
      h = float(L)/n
      b = 0.0
      do i=2,n-1
         b(i) = (-h*h/float(T))*f(i*h)
      end do
    end subroutine setVector

    !a(k)= a(i-1,k)
    !b(k)=a(i,k)
    !c(k)=a(i+1,k)
    !r(k)=b(k)
    !s=1
    !e=n

    subroutine tdma(a,b,c,r,x,s,e)
      implicit none
      integer s,e,i
      real, dimension(s:e) ::a,b,c,r,x    

      ! forward elimination phase
      do i=s+1,e
         b(i) = b(i) - a(i)/b(i-1)*c(i-1)
         r(i) = r(i) - a(i)/b(i-1)*r(i-1)
      end do
      ! backward substitution phase 
      x(e) = r(e)/b(e)
      do i=e-1,s,-1
         x(i) = (r(i)-c(i)*x(i+1))/b(i)
      end do
      
    end subroutine tdma
    
end module resol
