subroutine SUB1(SIDE1, SIDE2, HYPOTENUSE) !dummy args
implicit none
!dont use read statements
real,intent(in) :: SIDE1, SIDE2 !input parameters
real,intent(out) ::  HYPOTENUSE !output parameters
!intent(in out) can be used for input and output
real :: TEMP !local variable
TEMP = SIDE1**2+SIDE2**2
HYPOTENUSE = sqrt(TEMP)
return !stops execution of subroutine block; optional
end subroutine SUB1
program SUBEX
    implicit none
    real :: SIDE1, SIDE2, HYPOTENUSE
    write(*,*) "Enter side1 and side2:"
    read(*,*) SIDE1, SIDE2
    call SUB1(SIDE1, SIDE2, HYPOTENUSE) !actual args, call by reference
    write(*,*) HYPOTENUSE
end program SUBEX