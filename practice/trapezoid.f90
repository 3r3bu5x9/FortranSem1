program TRAPEZOID
    implicit none
    real :: F, X
    real, parameter :: VAL = 0.74682413281242702540
    real :: A, B, H, H0, ERR, ERR0, S1, S2, S
    integer :: I,K,N
    F(X) = exp(-X**2)
    open(unit=1, file="outtrapezoid.txt")
    A = 0.0
    B = 1.0
    S1 = F(A)+F(B)
    write(1,100) "n","h","I","ERR", "ERR0/ERR", "power"
    do K = 0, 3
        N = 10*2**K
        H = (B-A)/N
        S2 = 0.0
        do I = 1, N-1
            S2 = S2 + F(A+I*H)
        end do
        S = H*0.5*(S1+2*S2)
        ERR = abs(VAL-S)
        if (N == 10) then
            ERR0 = ERR
            H0 = H
        end if
        write(1,110) N, H, S, ERR, ERR0/ERR, log(ERR0/ERR)/log(H0/H)
    end do
    100 format(T1, A3, T6, A8,   T16, A8,   T26, A10,   T38, A8,   T48, A6)
    110 format(T1, I3, T6, F8.6, T16, F8.6, T26, F10.8, T38, F8.2, T48, F6.2)
end program TRAPEZOID