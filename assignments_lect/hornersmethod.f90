!Debasis Buxy 
!PRN: 22020004154
!14/7/21
!to construct a polynomial using Horner's method
program HORNERSMETHOD
    implicit none
    integer :: X, C, N, I
    integer, dimension(0:10) :: A

    write(*,*) "Enter the degree of polynomial(N<10):"
    read(*,*) N
    write(*,130) "Enter coefficients a0 to a",N,":"
    read(*,*) (A(I), I=0,N)
    write(*,*) "Enter the value of x:"
    read(*,*) X

    write(*,120,advance="no") "F(x) = "
    do I=N,0,-1
        write(*,110,advance="no") A(I)," x^",I
        if (I /= 0) then
            write(*,120,advance="no") " + "
        else
            write(*,*)
        end if
    end do

    C = A(N)
    do I = N-1, 0, -1
        C = C*X + A(I)
    end do

    write(*,100) "F(",X,") = ",C

100 format(A,i0,A,i0)
110 format(i0,A,i0)
120 format(A)
130 format(A,i0,A)
end program HORNERSMETHOD