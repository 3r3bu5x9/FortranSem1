!PROGRAM 13
! Name: Debasis Buxy
!PRN: 22020004154
!to solve a set of linear equations using GAUSS ELIMINATION METHOD
module GE
    real :: A(10,10)
    integer :: N
end module

subroutine SWAP(I,J)
    use GE
    implicit none
    integer :: I,J,K
    real :: TEMP
    do K = 1, N+1
        TEMP = A(I,K)
        A(I,K) = A(J,K)
        A(J,K) = TEMP
    end do
end subroutine SWAP

program GAUSSELIM
    use GE
    implicit none
    integer :: I, J, K, L
    real :: X(10), DET, ZERO, SUM, LAMBDA

    open(unit=1, file="gauss1.dat")

    read(1,*) N
    do I = 1, N
        read(1,*) (A(I,J),J=1,N+1)
        write(*,100) (A(I,J),J=1,N+1)
    end do

    ZERO = 0.0001
    do I = 1, N-1
        if (abs(A(I,I))<ZERO) then
            L = I+1
            do
                if (abs(A(L,I)) > ZERO) then
                    call SWAP(I,L)
                    exit
                end if
                L = L+1
                if (L > N) then
                    write(*,*) "No solution!"
                    stop
                end if
            end do
        end if
        do J = I+1, N
            LAMBDA = A(J,I)/A(I,I)
            do K = I, N+1
                A(J,K) = A(J,K) - A(I,K)*LAMBDA
            end do
        end do
    end do

    write(*,*) "Triangle matrix: "
    do I = 1, N
        write(*,100) (A(I,J), J=1,N+1)
    end do

    ZERO = 1E-4
    DET = 1.0
    do I = 1, N
        DET = DET*A(I,I)
    end do

    write(*,*) "Determinant of the triangle matrix: ", DET
    if(abs(DET) < ZERO) then
        write(*,*) "Determinant too small"
        stop
    end if

    do I = N, 1, -1
        SUM = 0.0
        do J = I+1, N
            SUM = SUM + A(I,J)*X(J)
        end do
        X(I) = (A(I,N+1)-SUM)/A(I,I)
    end do
    
    do I=1,N
        write(*,110) I,X(I)
    end do
100 format(10f7.2)
110 format("X",I0," = ",f7.2)
end program GAUSSELIM