program test
    implicit none
    integer :: M, N, B, I, J
    integer, dimension(100) :: X
    write(*,*) "Enter a number in base 10: "
    read(*,*) N
    write(*,*) "Enter new base: "
    read(*,*) B

    I = 1
    M = N
    do
        X(I) = mod(M,B)
        M = M/B
        if (M == 0) then
            exit
        else
            I = I+1
        end if
    end do

    write(*,*) "Equivalent number in the new base :"
    do J = I, 1, -1
        if (X(J) < 10) then
            write(*,100,advance='no') X(J)
        else
            write(*,110,advance='no') char(55+X(J))
        end if
    end do

100 format(i1)
110 format(a1)
end program test