function FUNC(X)
    implicit none
    real :: X, FUNC
    FUNC = cos(X)-X
end function FUNC

program SECANT
    implicit none
    real :: FUNC
    real :: X0, X1, X2, ERR
    real :: DELX, DELFX
    integer :: N, COUNT

    write(*,*) "Enter init bounds:"
    read(*,*) X0, X1
    write(*,*) "Enter max error:"
    read(*,*) ERR
    write(*,*) "Enter max number of iterations:"
    read(*,*) N

    COUNT = 0
    do 
        COUNT = COUNT+1
        DELX = X1-X0
        DELFX = FUNC(X1)-FUNC(X0)
        if (abs(DELFX) < ERR) then
            write(*,*) "Change in function too small at", X0
            stop
        end if
        X2 = X1 - FUNC(X1)*(DELX/DELFX)
        if(abs(FUNC(X2)) < ERR) exit
        if (COUNT > N) then
            write(*,*) "Exceeded max iterations!"
            stop
        end if
        X0 = X1
        X1 = X2
    end do

    write(*,*) "The root is(X1): ", X2
    write(*,*) "Value at root(F(X1)): ", FUNC(X2)
    write(*,*) "Number of iterations: ", COUNT

end program SECANT