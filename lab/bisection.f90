!Debasis Buxy
!N20021084
program REGULAF
    implicit none
    real :: FUNC, X
    real :: A, B !bounds
    real :: ERR, C
    FUNC(X) = cos(X)-X

    write(*,*) "Enter lower and upper bounds:"
    read(*,*) A, B
    if (FUNC(A)*FUNC(B) > 0.0) then
        write(*,*) "No roots in this interval!"
        stop
    end if
    write(*,*) "Enter max error:"
    read(*,*) ERR

    do
        C = (A+B)/2.0
        if (FUNC(A)*FUNC(C) < 0.0) then
            B = C
        else
            A = C
        end if
        if (abs(A-B) < ERR) exit
    end do

    write(*,*) "The root is:", C
    write(*,*) "The value of the function at the root is", FUNC(C)
end program REGULAF