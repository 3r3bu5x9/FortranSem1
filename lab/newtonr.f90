function FUNC(X)
    implicit none
    real :: X, FUNC
    FUNC = cos(X)-X
end function FUNC

function DFUNC(X)
    implicit none
    real :: X, DFUNC
    DFUNC = -sin(X)-1
end function DFUNC

program NR
    implicit none
    real :: FUNC, DFUNC
    real :: X0, X1, ERR, N, COUNT

    write(*,*) "Enter init guess:"
    read(*,*) X0
    write(*,*) "Enter max error:"
    read(*,*) ERR
    write(*,*) "Enter max number of iterations:"
    read(*,*) N

    COUNT = 0
    do 
        COUNT = COUNT+1
        if (abs(DFUNC(X0)) < ERR) then
            write(*,*) "Derivative too small at", X0
            stop
        end if
        X1 = X0 - (FUNC(X0)/DFUNC(X0))
        if(abs(FUNC(X1)) < ERR) exit
        if (COUNT > N) then
            write(*,*) "Exceeded max iterations!"
            stop
        end if
        X0 = X1
    end do

    write(*,*) "The root is(X1): ", X1
    write(*,*) "Value at root(F(X1)): ", FUNC(X1)

end program NR