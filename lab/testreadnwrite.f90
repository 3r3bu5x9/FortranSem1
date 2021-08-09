!program read from a file and write data to a file
program TEST
    implicit none
    real :: X(100), Y(100)
    integer :: I, N
    open(unit=1, file="in.dat")!input file
    open(unit=2, file="out.dat")!output file
    read(1,*) N
    do I = 1, N
        read(1,*) X(I), Y(I)
    end do
    do I = 1, N
        write(2,*) X(I), Y(I)
    end do
end program TEST