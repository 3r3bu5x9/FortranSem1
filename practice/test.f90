program MIRROR
    implicit none
    integer :: M, N, S, TEMP
    write(*,*) "Enter a number:"
    read(*,*) M
    S = 0
    N = M
    do
        if (N == 0) exit
        TEMP = mod(N,10)
        N = N/10
        S = S*10 + TEMP
    end do
    write(*,*) S
end program MIRROR