program TEST
    implicit none
    real :: X(10), Y(10), L, X0, S
    integer :: I, K, N
    open(unit=1,file="in.txt")
    open(unit=2,file="out.txt")
    N = 4
    do I = 1, N
        read(1,*) X(I), Y(I)
    end do
    X0 = 2.5
    do I = 1, N
        L = 1.0
        do K = 1, N
            if (I /= K) then
                L = L*(X0-X(K))/(X(I)-X(K))
            end if
        end do
        S = S+L*Y(I)
    end do
    write(2,*) X0, S
end program TEST