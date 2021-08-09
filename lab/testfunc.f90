!Debasis Buxy
!N20021084
function FUNC1(X)
    implicit none
    real :: X, FUNC1
    FUNC1 = log(1+3*exp(x))
end function FUNC1

function FUNC2(X)
    implicit none
    real :: X, FUNC2
    real S
    integer :: I
    S = 0.0
    do I = 0, 5
        S = S+X**I
    end do
    FUNC2 = log(S)
end function FUNC2

program FUNCTEST
    implicit none
    real :: FUNC1, FUNC2, X
    write(*,*) "Enter X:"
    read(*,*) X
    write(*,*) "log(1+3*exp(x)) = ", FUNC1(X)
    write(*,*) "log(1+x+x^2+x^3+x^4+x^5) = ", FUNC2(X)
end program FUNCTEST