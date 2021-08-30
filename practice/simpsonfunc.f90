function FUNC(X)
    implicit none
    real :: FUNC, X
    FUNC = exp(-2*X)
end function FUNC

function INTEGRATE(D1,D2)
    implicit none
    real :: INTEGRATE, FUNC, D1, D2
    real :: H, S1, S2, S3
    integer :: I,N
    S1 = FUNC(D1)+FUNC(D2)
    N = 100
    H = (D2-D1)/N
    S2 = 0.0
    S3 = 0.0
    do I = 1, N-1
        if (mod(I,2) /= 0) then
            S2 = S2 + FUNC(D1+I*H)
        else
            S3 = S3 + FUNC(D1+I*H)
        end if
    end do
    INTEGRATE = (H/3.0)*(S1+4*S2+2*S3)
end function INTEGRATE