function FUNC(X)
    implicit none
    real :: FUNC,X
    FUNC = cos(X)-X
end function FUNC

function FINDROOT(A,B,TOL)
    implicit none
    real :: FINDROOT, FUNC, A, B, TOL
    real :: C
    if (FUNC(A)*FUNC(B) > 0) then
        stop "No root in interval"
    end if
    do
        C = (A+B)/2
        
        if (abs(A-B) < TOL) then
            FINDROOT = C
            return
        end if

        if (FUNC(A)*FUNC(C) < 0) then
            B = C
        else
            A = C
        end if
    end do  
end function FINDROOT

program BISEC
    implicit none
    real :: A1, B1, FINDROOT, FUNC, X, TOL
    write(*,*) "Enter interval"
    read(*,*) A1, B1
    write(*,*) "Enter tolerance"
    read(*,*) TOL
    X = FINDROOT(A1,B1,TOL)
    write(*,*) "Root is ", X
    write(*,*) "Value at root is ", FUNC(X) 
end program BISEC