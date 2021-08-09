!Debasis Buxy
!N20021084
program INTERPOLATION
    implicit none
    real :: X(100), Y(100)
    real :: Z
    real :: L, P
    integer :: N, I, K

    open(unit=1,file="lagrangein.txt")
    read(1,*) N
    read(1,*) (X(I), Y(I), I=1,N)
    write(*,*) "Enter the value X0:"
    read(*,*) Z

    P = 0.0
    do K = 1, N
        L = 1.0
        do I = 1, N
            if (I /= K) then
                L = L*((Z-X(I))/(X(K)-X(I)))
            end if
        end do
        P = P + Y(K)*L
    end do

    write(*,*) "The value at X0 is:", P
end program INTERPOLATION