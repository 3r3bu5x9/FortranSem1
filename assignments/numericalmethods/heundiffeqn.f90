!PROGRAM 10
! Name: Debasis Buxy
!PRN: 22020004154
!to solve a differential equation numerically using HUEN'S METHOD
function FUNC(X,Y)
    implicit none
    real :: FUNC, Y, X
    FUNC = Y
end function FUNC

program HEUN
    implicit none
    real :: FUNC
    real :: H, X0, Y0, X1, Y1, Y1prime
    integer :: I, N
    open(unit=1, file="heunout.txt")
    H = 0.1
    X0 = 0.0
    Y0 = 1.0
    N = 40
    write(1,*) X0, Y0
    do I = 1, N
        X1 = X0 + H
        Y1prime = Y0 + H*FUNC(X0,Y0)
        Y1 = Y0 + H*(FUNC(X0,Y0)+FUNC(X1,Y1prime))*0.5
        write(1,*) X1, Y1
        Y0 = Y1
        X0 = X1
    end do
end program HEUN