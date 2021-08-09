program WRITE_ARRAY
    implicit none
    integer :: I, J, N, M
    real, dimension(100,100) :: A ! dimensions have to be constant or numbers as compiler need to know it during compilation
    write(*,*) "Enter dimension of A: "
    read(*,*) N, M
    write(*,*) "Enter array elements: "
    read(*,*) ((A(I,J), J=1,M), I=1,N)
    do I=1,N
        write(*,10) (A(I,J), J=1,M)
    end do
10  format(10 f 10.4)
end program WRITE_ARRAY