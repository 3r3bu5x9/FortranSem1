!PROGRAM 7
! Name: Debasis Buxy
!PRN: 22020004154
!to integrate a function numerically using SIMPSON'S 1/3rd RULE
function FUNC(X)
    implicit none
    real :: FUNC, X
    FUNC = exp(x**2)
end function FUNC

function INTEGRATE(A,B)
    implicit none
    real :: INTEGRATE, FUNC, A, B
    real :: H, S1, S2, S3
    integer :: I, N
    N = 100
    H = (B-A)/N
    S1 = FUNC(A)+FUNC(B)
    S2 = 0.0
    S3 = 0.0
    do I = 1, N-1
        if (mod(I,2) /= 0) then
            S2 = S2 + FUNC(A+I*H)
        else
            S3 = S3 + FUNC(A+I*H)
        end if
    end do
    INTEGRATE = (H/3.0)*(S1+4.0*S2+2.0*S3)
end function INTEGRATE

program SIMPSON
    implicit none
    real :: A1, B1, INTEGRATE
    write(*,*) "Enter limits: "
    read(*,*) A1, B1
    write(*,*) "Output: ", INTEGRATE(A1,B1)
end program SIMPSON