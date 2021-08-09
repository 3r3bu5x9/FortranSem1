!Debasis Buxy
!N20021084
program BISECTION
    implicit none
    real :: F, X
    real :: A, B !bounds
    real :: ERR, C
    F(X) = cos(X)-X

    write(*,*) "Enter lower and upper bounds:"
    read(*,*) A, B
    if (F(A)*F(B) > 0.0) then
        write(*,*) "No roots in this interval!"
        stop
    end if
    write(*,*) "Enter max error:"
    read(*,*) ERR

    do
        C = (A+B)/2.0
        if (F(A)*F(C) < 0.0) then
            B = C
        else
            A = C
        end if
        if (abs(A-B) < ERR) exit
    end do

    write(*,*) "The root is:", C
    write(*,*) "The value of the function at the root is", F(C)
end program BISECTION