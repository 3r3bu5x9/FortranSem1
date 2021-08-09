program PRIMEGEN
    implicit none
    integer :: N, Nsqrt, Cmax, I, D, C
    logical :: FLAG

    C=0
    Cmax=200
    N=2
    open(unit=1, file="primes.txt")
    write(1,*) "First 200 prime numbers: "
    do
        FLAG = .true.
        !check if number is 2, 3 or 5
        if ((N==2) .or. (N==3) .or. (N==5)) then
        !divisibility by 2, 3, 5
        else if ((mod(N,2) == 0) .or. (mod(N,3) == 0) .or. (mod(N,5) == 0)) then
            FLAG = .false.
        else
            !divisibility by primes
            I = 5
            D = 2
            Nsqrt = int(sqrt(real(N)))+1
            do
              I = I+D
              if (I>Nsqrt) exit
              if (mod(N,I) == 0) then
                FLAG = .false.
                exit
              else
                D=6-D !alternate increment between 2 and 4
              end if
            end do
        end if
        if(FLAG) then
            if (C == Cmax) exit !exit if count reaches 200
            C = C+1
            !write(1,100) N !print vertically
            write(1,100, advance="no") N !print horizontally
        end if
        N=N+1 !increment N
    end do
100 format(i0,' ')
end program PRIMEGEN