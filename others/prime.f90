!Debasis 
!PRN: 22020004154
!12/7/21
!to find if a given integer is prime or not
program PRIME
    implicit none
    integer :: N !number to be checked
    integer :: DIV !divisor
    integer :: REM !remainder
    integer :: Nsqrt !squareroot of N

    write(*,*) "Enter a number: "
    read(*,*) N
    write(*,*) "Entered number is ", N

    !check exceptions
    if (N == 2 .or. N == 3) then
        write(*,*) N, " is a prime number"
        stop
    end if
    Nsqrt = int(sqrt(real(N)))+1
    !check if N is even
    REM = mod(N,2)
    if (REM == 0) then
        write(*,*) N, " is not a prime number"
        stop
    !check if N is divisible by odd numbers
    else
        do DIV = 3, Nsqrt, 2
            REM = mod(N,DIV)
            if (REM == 0) then
                write(*,*) N, " is not a prime number"
                stop
            end if 
        end do
    end if 
    write(*,*) N, "is a prime number"
end program PRIME