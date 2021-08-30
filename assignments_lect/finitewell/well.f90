module MODwell
    implicit none
    real, parameter :: TOL = 0.0001
    real, parameter :: ZERO = 0.0000001
    real, parameter :: MAXN = 50 !max number of iterations
    real, parameter :: DEL = 0.1
    real, parameter :: C1 = 1.88972599 !angstrom -> atomic unit
    real, parameter :: C2 = 0.03674931 !eV -> hartree
    real :: A, V0, lambda
end module MODwell

function FUNC(Z)
    use MODwell
    implicit none
    real :: FUNC, Z
    FUNC = (Z/cos(Z))**2 - lambda
end function FUNC

subroutine BOUNDS(B1,B2)
    use MODwell
    implicit none
    real, intent(out) :: B1, B2
    real :: FUNC,Z
    Z = ZERO
    do
        if (FUNC(Z)*FUNC(Z+DEL) < 0.0) then
            B1 = Z
            B2 = Z+DEL
            exit
        end  if
        Z = Z+DEL
    end do
end subroutine BOUNDS

function FINDROOT() !0 -> even, 1 -> odd
    use MODwell
    implicit none
    real :: FINDROOT, FUNC, A1, A2, A3
    integer :: N
    N = 0
    call BOUNDS(A1,A2)
    do
        N = N+1
        A3 = (A1+A2)/2.0
        if (N > MAXN) then
            FINDROOT = A3
            write(*,100) "Execeeded max iteration in interval", A1, A2
            return
        end if
        if (abs(A1-A2) < TOL) then
            FINDROOT = A3
            write(*,100) "Root found in ",N," iterations"
            return
        end if
        if (FUNC(A1)*FUNC(A3) < 0.0) then
            A2 = A3
        else
            A1 = A3
        end if
    end do
100 format(A,I0,A)
end function FINDROOT

function U1sq(X)
    implicit none
    real :: U1sq, X
    U1sq = exp(2*X)
end function U1sq

function I1(D1,D2)
    implicit none
    real :: I1, U1sq, D1, D2
    real :: H, S1, S2, S3
    integer :: I,N
    S1 = U1sq(D1)+U1sq(D2)
    N = 100
    H = (D2-D1)/N
    S2 = 0.0
    S3 = 0.0
    do I = 1, N-1
        if (mod(I,2) /= 0) then
            S2 = S2 + U1sq(D1+I*H)
        else
            S3 = S3 + U1sq(D1+I*H)
        end if
    end do
    I1 = (H/3.0)*(S1+4*S2+2*S3)
end function I1

function U2sq(X)
    implicit none
    real :: U2sq, X
    U2sq = (cos(X))**2
end function U2sq

function I2(D1,D2)
    implicit none
    real :: I2, U2sq, D1, D2
    real :: H, S1, S2, S3
    integer :: I,N
    S1 = U2sq(D1)+U2sq(D2)
    N = 100
    H = (D2-D1)/N
    S2 = 0.0
    S3 = 0.0
    do I = 1, N-1
        if (mod(I,2) /= 0) then
            S2 = S2 + U2sq(D1+I*H)
        else
            S3 = S3 + U2sq(D1+I*H)
        end if
    end do
    I2 = (H/3.0)*(S1+4*S2+2*S3)
end function I2

function U3sq(X)
    implicit none
    real :: U3sq, X
    U3sq = exp(-2*X)
end function U3sq

function I3(D1,D2)
    implicit none
    real :: I3, U3sq, D1, D2
    real :: H, S1, S2, S3
    integer :: I,N
    S1 = U3sq(D1)+U3sq(D2)
    N = 100
    H = (D2-D1)/N
    S2 = 0.0
    S3 = 0.0
    do I = 1, N-1
        if (mod(I,2) /= 0) then
            S2 = S2 + U3sq(D1+I*H)
        else
            S3 = S3 + U3sq(D1+I*H)
        end if
    end do
    I3 = (H/3.0)*(S1+4*S2+2*S3)
end function I3

program FINITEWELL
    use MODwell
    implicit none
    real :: FINDROOT, FUNC, X0, Y0, I1, I2, I3
    real :: ENERGY, CbyD, L1, L2, C, D, X ,delX
    real :: ALPHA, BETA ! alpha, q
    real :: P, Q, R, Itotal
    real :: WIDTH = 1 !in angstrom
    real :: HEIGHT = 5 !in eV

    open(unit=1, file="wellout.txt")

    A = WIDTH*C1 !in au
    V0 = HEIGHT*C2 !in hartree
    lambda = 2*A**2*V0 !lambda = Z0**2, Z0 = sqrt(2mV0)*(A/h')**2, m->1, h'->1
    Y0 = FINDROOT()
    X0 = Y0*tan(Y0)
    ALPHA = X0/A
    BETA = Y0/A
    ENERGY = 0.5*(2*V0 - (BETA)**2)/C2
    CbyD = cos(Y0)*exp(X0)
    L1 = ALPHA*A
    L2 = BETA*A
    P = I1(-5*L1, -1*L1)
    Q = I2(-L2,L2)
    R = I3(L1, 5*L1)
    Itotal = ((CbyD**2/ALPHA)*(P+R))+(Q/BETA)
    D = 1.0/sqrt(Itotal)
    C = CbyD*D
    delX = 0.01
    X = -10*A
    do
        if (X > -1*A) exit
        write(1,*) X, (C*exp(ALPHA*X))
        X = X+delX
    end do
    do
        if (X > A) exit
        write(1,*) X, (D*cos(BETA*X))
        X = X+delX
    end do
    do
        if (X > 10*A) exit
        write(1,*) X, (C*exp(-1*ALPHA*X))
        X = X+delX
    end do

    write(*,110) "a(angstrom)", WIDTH
    write(*,110) "V0(eV)", HEIGHT
    write(*,110) "a(au)", A
    write(*,110) "V0(hartree)", V0
    write(*,110) "lambda", lambda
    write(*,110) "Root", Y0
    write(*,110) "F(root)", FUNC(Y0)
    write(*,110) "Energy(eV)", ENERGY
    write(*,110) "q**2+a**2", (BETA**2+ALPHA**2)
    write(*,110) "2*V0", 2*V0
    write(*,110) "C/A", CbyD
    write(*,110) "C", C
    write(*,110) "A", D
    write(*,110) "alpha", ALPHA
    write(*,110) "q", BETA
110 format(A,T16,':',F10.6)
end program FINITEWELL