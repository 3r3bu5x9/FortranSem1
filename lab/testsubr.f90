subroutine SUB(A, B, C, SUM, PROD)
    implicit none
    integer, intent(in) :: A, B, C
    integer, intent(out) :: SUM, PROD
    SUM = A+B+C
    PROD = A*B*C
end subroutine SUB

program SUBTEST
    implicit none
    integer :: A, B, C, SUM, PROD
    write(*,*) "Enter three integers: "
    read(*,*) A, B, C
    call SUB(A, B, C, SUM, PROD)
    write(*,*) "Sum: ", SUM
    write(*,*) "Product: ", PROD
end program SUBTEST