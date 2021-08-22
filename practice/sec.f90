function FUNC(X)
    implicit none
    real :: FUNC,X
    FUNC = cos(X)-X
end function FUNC

function FINDROOT(X0,X1,TOL,N)
    implicit none
    real :: FINDROOT, FUNC, X0, X1, X2, TOL
    integer :: N, COUNT
    COUNT = 0
    do
        COUNT = COUNT + 1

        if (COUNT > N) then
            stop "Exceeded max iterations"
        end if
        if (abs(FUNC(X1)-FUNC(X0)) < TOL) then
            write(*,*) "diff of derivative zero at", X0
            stop
        end if

        X2 = X1 - FUNC(X1)*((X1-X0)/(FUNC(X1)-FUNC(X0))) 

        if (abs(FUNC(X2)) < TOL) then
            FINDROOT = X2
        return
        end if
        X0 = X1
        X1 = X2
    end do  
end function FINDROOT

program SECANT
    implicit none
    real :: X0, X1 ,FINDROOT, FUNC, X, TOL
    integer :: N
    write(*,*) "Enter init bounds"
    read(*,*) X0, X1
    write(*,*) "Enter tolerance"
    read(*,*) TOL
    write(*,*) "Enter max iterations"
    read(*,*) N
    X = FINDROOT(X0, X1, TOL, N)
    write(*,*) "Root is ", X
    write(*,*) "Value at root is ", FUNC(X) 
end program SECANT