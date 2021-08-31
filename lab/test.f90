program formwrite
    implicit none
    integer :: k
    real  :: x
    x = 0.0
    do k = 0, 100, 10
        write(*,10) k, x, sin(x), cos(x)
        x = x+0.1
    end do
10 format(i4,3f8.4)
end program formwrite