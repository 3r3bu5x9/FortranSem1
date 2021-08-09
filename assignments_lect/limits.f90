!Debasis Buxy
!PRN: 22020004154
!to examine the correctness of trig expressions as they
!approach certain limits
program LIMITS
    implicit none
    integer :: I
    real, parameter :: PI = 3.1415927
    real :: X, C, D

    write(*,*) "X -> 0"
    write(*,*) "Expected/correct limit: ", 1./2
    write(*,*) "-----------------------------------------"
    write(*,*) "(1-cos(X))/X**2  (sin(X)/X)**2/(1+cos(X))"
    write(*,*) "-----------------------------------------"
    X = 0.1
    do I=1,5
        C = (1-cos(X))/X**2
        D = (sin(X)/X)**2/(1+cos(X))
        write(*,*) C, D
        X=X/10
    end do
    write(*,*) "-----------------------------------------"
    write(*,*)
    write(*,*) "X -> PI"
    write(*,*) "Expected/correct limit: ", 2/PI**2
    write(*,*) "-----------------------------------------"
    write(*,*) "(1-cos(X))/X**2  (sin(X)/X)**2/(1+cos(X))"
    write(*,*) "-----------------------------------------"
    X = 0.1
    do I=1,5
        C = (1-cos(PI+X))/(PI+X)**2
        D = (sin(PI+X)/(PI+X))**2/(1+cos(PI+X))
        write(*,*) C, D
        X=X/10
    end do
end program LIMITS