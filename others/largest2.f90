!to find the largest of two real numbers
!name: Debasis Buxy
!date: 28/6/21
program LARGEST2
    implicit none
    real :: A, B
    real, parameter :: tol = 1.E-6
    write(*,*) "Enter two numbers: "
    read(*,*) A, B
    write(*,*) "Entered numbers: ", A, B

    if ( abs(A-B) < tol ) then
        write(*,*) "Numbers are equal upto 6 decimal places"
    else if ( A > B ) then
        write(*,*) A, " is the largest"
    else
        write(*,*) B, " is the largest"
    end if
end program LARGEST2