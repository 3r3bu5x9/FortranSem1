!Debasis Buxy
!N20021084
program LEASTSQFIT
    implicit none
    real :: X(100), Y(100)
    real :: Sx, Sy, Sxx, Sxy, Yest
    real A, B
    integer :: I, N

    open(unit=1,file="leastsqdata.txt") !input
    open(unit=2,file="leastsqout.txt") !output
    read(1,*) N
    read(1,*) (X(i), Y(i), I=1,N)

    Sx = 0.0
    Sy = 0.0
    Sxx = 0.0
    Sxy = 0.0
    do I = 1, N
        Sx = Sx + X(I)
        Sy = Sy + Y(I)
        Sxx = Sxx + X(I)*X(I)
        Sxy = Sxy + X(I)*Y(I)
    end do

    A = (N*Sxy-Sx*Sy)/(N*Sxx-Sx**2)
    B = (Sxx*Sy-Sxy*Sx)/(N*Sxx-Sx**2)

    write(2,*) "      X                Y             Y(est.)"
    write(2,*) "  --------------------------------------------"
    do I = 1, N
        Yest = A*X(I)+B
        write(2,*) X(I), Y(I), Yest
    end do
    write(2,*)
    write(2,*) "A = ", A
    write(2,*) "B = ", B
end program LEASTSQFIT