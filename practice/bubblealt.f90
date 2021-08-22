program BUBBLEALT 
    implicit none
    integer :: A(10)
    integer :: I, J, TEMP, N
    write(*,*) "Enter n"
    read(*,*) N
    write(*,*) "Enter numbers"
    read(*,*) (A(I), I=1,N)

    do I = 1, N
        do J = 1, N-I
            if (A(J) > A(J+1)) then
                TEMP = A(J)
                A(J) = A(J+1)
                A(J+1) = TEMP
            end if
        end do    
    end do

    write(*,*) (A(I), I=1,N)
end program BUBBLEALT 