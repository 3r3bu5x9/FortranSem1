!program to read data from a file
program TEST
    implicit none
    real :: X(100), Y(100)
    integer :: I, N
    open(unit=1, file="xyz.dat")
    read(1,*) N
    read(1,*) (X(I), Y(I), I=1,N)
    do I = 1, N
        write(*,*) X(I), Y(I)
    end do
end program TEST