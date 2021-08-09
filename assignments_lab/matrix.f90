!PROBLEM 7
! Name: Debasis Buxy
!PRN: 22020004154
!13/7/21
!find the sum and product of matrics using 2D array
program MATRIX
    implicit none
    integer :: M1, N1, M2, N2, M3, N3, M4, N4, I, J, K
    integer :: A(10,10)
    integer :: B(10,10)
    integer :: C(10,10)
    integer :: D(10,10)

    write(*,*) "Enter dimensions of A"
    read(*,*) M1, N1
    write(*,*) "Enter dimensions of B"
    read(*,*) M2, N2
    
    write(*,*) "Enter elements of A"
    read(*,*) ((A(I,J), J=1,N1), I=1,M1)
    write(*,*) "A = "
        do I=1,M1
            write(*,*) (A(I,J), J=1,N1)
        end do

    write(*,*) "Enter elements of B"
    read(*,*) ((B(I,J), J=1,N2), I=1,M2)
    write(*,*) "B = "
        do I=1,M2
            write(*,*) (B(I,J), J=1,N2)
        end do

    if((M1 /= M2) .or. (N1 /= N2)) then
        write(*,*) "Addition cannot be performed!"
    else 
        !perform addition
        C = 0
        M3 = M1
        N3 = N1
        do I=1,M3
            do J=1,N3
                C(I,J) = A(I,J)+B(I,J)
            end do
        end do

        write(*,*) "A+B = "
        do I=1,M3
            write(*,*) (C(I,J), J=1,N3)
        end do
    end if

    if(N1 /= M2) then
        write(*,*) "Multiplication cannot be performed!"
    else
        !perform multiplication
        D = 0
        M4 = M1
        N4 = N2
        do I=1,M4
            do J=1,N4
                do K=1,N1
                    D(I,J) = D(I,J) + A(I,K)*B(K,J)! use temp to sum
                end do
            end do
        end do
        write(*,*) "A*B = "
        do I=1,M4
            write(*,*) (D(I,J), J=1,N4)
        end do
    end if
end program MATRIX