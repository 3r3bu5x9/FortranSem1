!PROGRAM 3
! Name: Debasis Buxy
!PRN: 22020004154
!to find the root of an equation using REGULA FALSI METHOD
function FUNC(X)
    implicit none
    real :: X, FUNC
    FUNC = cos(X)-X
end function FUNC

program REGULAF
    implicit none
    real :: FUNC
    real :: A, B !bounds
    real :: ERR, C

    write(*,*) "Enter lower and upper bound:"
    read(*,*) A, B
    if (FUNC(A)*FUNC(B) > 0.0) then
        write(*,*) "No roots in this interval!"
        stop
    end if
    write(*,*) "Enter max error:"
    read(*,*) ERR

    do
        C = (A*FUNC(B)-B*FUNC(A))/(FUNC(B)-FUNC(A))
        if (FUNC(A)*FUNC(C) < 0.0) then
            B = C
        else
            A = C
        end if
        if (abs(FUNC(C)) < ERR) exit
        if (abs(A-B) < ERR) exit
    end do

    write(*,*) "The root is:", C
    write(*,*) "The value of the function at the root is", FUNC(C)
end program REGULAF