!PROBLEM 2
! Name: Debasis Buxy
!PRN: 22020004154
! Date: 5/7/21
! to find the largest number from a list of numbers

program LARGEST
    implicit none
    integer :: X(10)
    integer :: I, N
    integer :: MAXN

    write(*,*) "Enter size ( <", 10,"): "
    read(*,*) N
    
    write(*,*) "Enter", N, "numbers: "
    read(*,*) (X(I), I = 1, N)
    write(*,*) "Entered numbers: "
    write(*,*) (X(I), I = 1, N)
    
    !do I = 1, N
    !    write(*,*) "Enter a number: "
    !    read(*,*) X(I)
    !    write(*,*) X(I), "entered!"
    !end do

    MAXN = X(1)
    do I = 2, N
        if (X(I) > MAXN) then
            MAXN = X(I)
        end if
    end do

    write(*,*) MAXN, "is the largest number"
end program LARGEST