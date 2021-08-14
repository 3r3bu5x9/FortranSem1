program TEST
    implicit none
    integer :: A(10), I, J, N, M, TEMP
    write(*,*) "Enter N"
    read(*,*) N
    write(*,*) "Enter nums"
    read(*,*) (A(I), I=1,N)
    M = N
    do I = 1, M-1
        do J = 1, M-1
            if(A(J)>A(J+1)) then
                TEMP = A(J)
                A(J) = A(J+1)
                A(J+1) = TEMP
            end if
        end do
        M = M-1
    end do
    write(*,*) (A(I), I=1,N)
end program TEST