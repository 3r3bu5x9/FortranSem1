!PROGRAM 9
! Name: Debasis Buxy
!PRN: 22020004154
!to solve a differential equation numerically using EULER'S METHOD
function FUNC(X,Y)
    implicit none
    real :: FUNC, Y, X
    FUNC = Y
end function FUNC

program EULER
    implicit none
    real :: FUNC
    real :: H, X0, Y0, X1, Y1
    integer :: I, N
    open(unit=1, file="eulerout.txt")
    H = 0.1
    X0 = 0.0
    Y0 = 1.0
    N = 40
    write(1,*) X0, Y0
    do I = 1, N
        Y1 = Y0 + H*FUNC(X0,Y0)
        X1 = X0 + H
        write(1,*) X1, Y1
        Y0 = Y1
        X0 = X1
    end do
end program EULER