!Debsis Buxy
!21-7-21
!check if a number is prime or not
program PRIME
    implicit none
    integer :: N, I
    logical :: FLAG
    write(*,*) "Enter a number:"
    read(*,*) N

    FLAG = .true.
    do I = 2, N-1
        if (mod(N,I) == 0) then
            FLAG = .false.
            exit
        end if
    end do

    if (FLAG) then
        write(*,*) N, "is a prime number"
    else
        write(*,*) N, "is a composite number"
    end if

end program PRIME