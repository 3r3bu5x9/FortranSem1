module MOD2
    real :: X, A(100), B(100), C(100)
end module MOD2

subroutine SUB1()
    use MOD2
    implicit none
    real :: K
    integer :: I
    X = 0.0
    K = 0.1
    I = 1
    do I = 1, 11
        A(I) = X
        B(I) = sin(X)
        C(I) = cos(X)
        X = X+K
    end do
end subroutine SUB1

program TEST
    use MOD2
    implicit none
    integer :: I
    write(*,*) "      X              sin(X)          cos(X)"
    write(*,*) " ---------------------------------------------"
    call SUB1()
    do I = 1, 11
        write(*,*) A(I), B(I), C(I)
    end do 
end program TEST