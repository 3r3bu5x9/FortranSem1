!PROBLEM 8
! Name: Debasis Buxy
!PRN: 22020004154
!13/7/21
!to find a magic square of odd order
program MAGICSQ
    implicit none
    integer :: N, I, J, K
    integer :: A(10,10)

    write(*,*) "Enter (odd)dimension: "
    read(*,*) N

    if (mod(N,2) == 0) then
        write(*,*) "Even dimension not allowed!"
        stop !terminate if even 
    end if
    A = 0 !initialize array with zero
    I = 1 !init row
    J = (N+1)/2 !init column
    K = 1 !number to be filled
    do
        if (A(I,J) == 0) then !if not filled
            A(I,J) = K !fill
            K = K+1 !increment number to be filled in next cell
            if (K > N**2) exit !if all filled exit
            !go to the adjacent top diagonal cell
            I = I-1 !1 up
            J = J+1 !1 right
        else !if filled
            !go back to prev cell and increment I
            I = I+2 !1 down + 1 down
            J = J-1 !1 left 
        end if

        !adjust I when out of bounds
        if (I < 1) then
            I = I+N
        else if (I > N) then
            I = I-N
        end if
        !adjust J when out of bounds
        if (J < 1) then
            J = J+N
        else if (J > N) then
            J = J-N
        end if
    end do

    do I = 1, N
        write(*,*) (A(I,J), J=1,N)
    end do
end program MAGICSQ