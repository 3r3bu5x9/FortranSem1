module MOD1
    integer :: X(10), Y(10)
end module MOD1

subroutine SUB1()
    use MOD1
    implicit none
    integer :: I
    do I = 1, 10
        X(I) = I
        Y(I) = 2*X(I)
    end do
end subroutine SUB1

program MODUSE
    use MOD1
    implicit none
    integer :: I
    write(*,*) "Multiplication table of 2"
    call SUB1()
    do I = 1, 10
        write(*,*) X(I), Y(I)
    end do
end program MODUSE