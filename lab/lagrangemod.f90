!Debasis Buxy
!N20021084
!Lanrange interpolation using modules and subroutines
module MODLI
    real :: X(100), Y(100)
end module MODLI

subroutine SUBLI(N, X0, Y0)
    use MODLI
    implicit none
    integer, intent(in) :: N
    real,intent(in) :: X0
    real,intent(out) :: Y0
    real :: L, P
    integer :: I, K
    P = 0.0
    do K = 1, N
        L = 1.0
        do I = 1, N
            if (I /= K) then
                L = L*((X0-X(I))/(X(K)-X(I)))
            end if
        end do
        P = P + Y(K)*L
    end do
    Y0 = P
end subroutine SUBLI

program INTERPOLATION
    use MODLI
    implicit none
    real :: X1, Y1
    integer :: N1, I

    open(unit=1,file="lagrangein.txt")
    open(unit=2,file="lagrangeout.txt")
    read(1,*) N1
    read(1,*) (X(I), Y(I), I=1,N1)
    write(*,*) "Enter the value X:"
    read(*,*) X1

    call SUBLI(N1, X1, Y1)
    write(*,*) "The value at X is:", Y1
    write(2,*) X1, Y1
end program INTERPOLATION