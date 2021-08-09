!PROBLEM 4
! Name: Debasis Buxy
!PRN: 22020004154
!13/7/21
!to check if a given number is prime or composite
program PRIME
    implicit none
    integer :: N, Nsqrt, I, D

    write(*,*) "Enter a number: "
    read(*,*) N

    !check if number is 2, 3 or 5
    if ((N==2) .or. (N==3) .or. (N==5)) then
        write(*,*) N, "is prime"
        stop
    end if
    !divisibility by 2, 3, 5
    if ((mod(N,2) == 0) .or. (mod(N,3) == 0) .or. (mod(N,5) == 0)) then
        write(*,*) N, "is composite"
        stop
    end if
    !divisibility by primes
    I = 5
    D = 2
    Nsqrt = int(sqrt(real(N)))+1
    do
      I = I+D
      if (I>Nsqrt) exit
      if (mod(N,I) == 0) then
        write(*,*) N, "is composite"
        stop
      else
        D=6-D
      end if
    end do
    write(*,*) N, "is prime"
end program PRIME