!PROBLEM 6
! Name: Debasis Buxy
!PRN: 22020004154
!to find the roots of a quadratic equation
program QUADROOT
    implicit none
    real :: A, B, C, D, X1, X2, ReX, ImX1, ImX2
    write(*,*) "Ax^2+Bx+C"
    write(*,*) "Enter coefficients A, B, C"
    read(*,*) A, B, C

    D = B**2 - 4.0*A*C
    if (abs(D) < 1.E-4) then
        X1 = -B/(2.0*A)
        write(*,*) "Roots: ", X1, X1
    else if (D > 0) then
        X1 = (-B+sqrt(D))/(2.0*A)
        X2 = (-B-sqrt(D))/(2.0*A)
        write(*,*) "Roots: ", X1, X2
    else 
        ReX = -B/(2.0*A)
        ImX1 = sqrt(-D)/(2.0*A)
        ImX2 = -sqrt(-D)/(2.0*A)
        write(*,*) "Roots: "
        write(*,*) "(", ReX, ",", ImX1, ")"
        write(*,*) "(", ReX, ",", ImX2, ")"
    end if
end program QUADROOT