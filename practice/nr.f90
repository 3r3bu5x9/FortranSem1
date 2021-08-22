function FUNC(X)
    implicit none
    real :: FUNC,X
    FUNC = cos(X)-X
end function FUNC

function FUNC1(X)
    implicit none
    real :: FUNC1,X
    FUNC1 = -sin(X)-1
end function FUNC1

function FINDROOT(X0,TOL,N)
    implicit none
    real :: FINDROOT, FUNC, FUNC1, X0, X1, TOL
    integer :: N, COUNT
    COUNT = 0
    do
        COUNT = COUNT + 1

        if (COUNT > N) then
            stop "Exceeded max iterations"
        end if
        if (abs(FUNC1(X0)) < TOL) then
            write(*,*) "Derivative zero at", X0
            stop
        end if

        X1 = X0 - FUNC(X0)/FUNC1(X0)

        if (abs(FUNC(X1)) < TOL) then
            FINDROOT = X1
        return
        end if
        X0 = X1
    end do  
end function FINDROOT

program SECANT
    implicit none
    real :: X0, FINDROOT, FUNC, X, TOL
    integer :: N
    write(*,*) "Enter init val"
    read(*,*) X0 
    write(*,*) "Enter tolerance"
    read(*,*) TOL
    write(*,*) "Enter max iterations"
    read(*,*) N
    X = FINDROOT(X0, TOL, N)
    write(*,*) "Root is ", X
    write(*,*) "Value at root is ", FUNC(X) 
end program SECANT