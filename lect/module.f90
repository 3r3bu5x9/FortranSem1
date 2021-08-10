module MOD1
    real :: x
end module MOD1

subroutine SUB1(b)
    use MOD1
    implicit none
    real,intent(out) :: b
    b = x**2
end subroutine SUB1

program ABC
    use MOD1
    implicit none
    real :: y
    write(*,*) "Enter x:"
    read(*,*) x
    call SUB1(y)
    write(*,*) "x: ", x
    write(*,*) "y: ", y
end program ABC