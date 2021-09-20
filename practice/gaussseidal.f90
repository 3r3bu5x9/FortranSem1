module MODGS
    real :: A(10,10), X(10), Xtemp(10)
    integer :: N
    real, parameter :: ZERO = 0.0001
end module MODGS

subroutine PRINTSOL()
    use MODGS
    implicit none
    integer :: I
    write(*,100) (I,X(I), I=1,N)
100 format('X',I0,' = ',F8.4)
end subroutine PRINTSOL

subroutine COPYSOL()
    use MODGS
    integer :: I
    do I = 1, N
        X(I) = Xtemp(I)
    end do
end subroutine COPYSOL

function CHECKDIFF()
    use MODGS
    logical :: CHECKDIFF
    integer :: I
    real :: SUM
    CHECKDIFF = .FALSE.
    SUM = 0.0
    do I = 1, N
        SUM = abs(X(I)-Xtemp(I))
    end do
    if (SUM < ZERO) then
        CHECKDIFF = .TRUE.
    end if
end function CHECKDIFF

program GAUSSSEIDAL
    use MODGS
    implicit none
    real :: TEMP
    integer :: I, K
    logical :: CHECKDIFF
    write(*,*) "Enter dimension N"
    read(*,*) N
    write(*,*) "Enter augmented matrix"
    read(*,*) ((A(I,K), K=1,N+1), I=1,N)
    write(*,*) "Augmented matrix:"
    do I = 1, N
        write(*,110) (A(I,K), K=1,N+1)
    end do
    X = 0.0
    Xtemp = 0.0
    do
        do I = 1, N
            TEMP = 0.0
            do K = 1, N
                if (I/=K) then
                    TEMP = TEMP + A(I,K)*Xtemp(K)
                end if
            end do
            Xtemp(I) = (A(I,N+1)-TEMP)/A(I,I)
        end do
        if (CHECKDIFF()) exit
        call COPYSOL()
    end do
    110 format(10f6.2)
    call PRINTSOL()
end program GAUSSSEIDAL