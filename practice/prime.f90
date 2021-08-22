function CHECKPRIME(N)
    implicit none
    integer :: I,K,LIM,N
    logical :: CHECKPRIME
    if (N == 2 .OR. N == 3) then
        CHECKPRIME = .TRUE.
        return
    else if (mod(N,2) == 0 .OR. mod(N,3) == 0) then
        CHECKPRIME = .FALSE.
        return
    end if

    I=5
    K=4
    LIM = int(sqrt(real(N)))
    do
      if (I > LIM) exit
      if (mod(N,I) == 0) then
        CHECKPRIME = .FALSE.
        return
      end if
      K = 6-K
      I = I+K
    end do
    CHECKPRIME = .TRUE.
    return
end function CHECKPRIME
program PRIME
    implicit none
    integer :: N
    logical :: CHECKPRIME
    write(*,*) "Enter a number"
    read(*,*) N

    if(CHECKPRIME(N)) then
        write(*,*) "Is prime"
    else
        write(*,*) "Is composite"
    end if
end program PRIME