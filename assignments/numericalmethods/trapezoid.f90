!PROGRAM 8
! Name: Debasis Buxy
!PRN: 22020004154
!to integrate a function numerically using TRAPEZOID RULE
function FUNC(X)
    implicit none
    real :: FUNC, X
    FUNC = exp(x**2)
end function FUNC

function INTEGRATE(A,B)
    implicit none
    real :: INTEGRATE, FUNC, A, B
    real :: H, S1, S2
    integer :: I, N
    N = 100
    H = (B-A)/N
    S1 = FUNC(A)+FUNC(B)
    S2 = 0.0
    do I = 1, N-1
        S2 = S2 + FUNC(A+I*H)
    end do
    INTEGRATE = H*0.5*(S1+2.0*S2)
end function INTEGRATE

program TRAPEZOID
    implicit none
    real :: A1, B1, INTEGRATE
    write(*,*) "Enter limits: "
    read(*,*) A1, B1
    write(*,*) "Output: ", INTEGRATE(A1,B1)
end program TRAPEZOID