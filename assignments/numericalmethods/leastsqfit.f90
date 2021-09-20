!PROGRAM 6
! Name: Debasis Buxy
!PRN: 22020004154
!to fit data points using THE METHOD OF LEAST SQUARES
module MODLSF
    real :: X(100), Y(100), Yest(100)
end module MODLSF

subroutine SUBLSF(N,A,B)
    use MODLSF
    implicit none
    integer, intent(in) :: N
    real, intent(out) :: A, B
    real :: Sx, Sy, Sxx, Sxy
    integer :: I
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

    do I = 1, N
        Yest(I) = A*X(I)+B
    end do
end subroutine SUBLSF

program LEASTSQFIT
    use MODLSF
    implicit none
    real :: A1, B1
    integer :: I, N1
    open(unit=1,file="leastsqdata.txt") !input
    open(unit=2,file="leastsqout.txt") !output
    read(1,*) N1
    read(1,*) (X(I), Y(I), I=1,N1)

    call SUBLSF(N1,A1,B1)
    write(2,*) "      X                Y             Y(est.)"
    write(2,*) "  --------------------------------------------"
    do I = 1, N1
        write(2,*) X(I), Y(I), Yest(I)
    end do
    write(*,*) "A(slope) = ", A1
    write(*,*) "B(intercept) = ", B1
end program LEASTSQFIT