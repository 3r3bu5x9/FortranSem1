integer function FUNC1(arg)
    implicit none
    integer :: arg
    FUNC1 = arg**2+3
end function FUNC1

!arithmetic statement function
program FUNTYPE
    implicit none
    integer :: arg = 2, arg1, arg2, arg3
    integer FUNC1, FUNC2
    FUNC2(arg2) = arg2*2+3
    arg1 = FUNC1(arg)
    arg3 = FUNC2(arg)
    write(*,*) arg1, arg3
end program FUNTYPE