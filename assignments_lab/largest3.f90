!PROBLEM 1
! Name: Debasis Buxy
!PRN: 22020004154
!date: 29/6/21
!to find the largest of three integer numbers
program LARGEST3
    implicit none
    integer :: A, B, C
    integer :: MAXN
    
    write(*,*) "Enter three numbers: "
    read(*,*) A, B, C
    write(*,*) "Entered numbers are: ", A, B, C

    MAXN = A !assume A to be largest
    if ( B > MAXN ) then !compare with B
        MAXN = B
    end if
    if ( C > MAXN ) then !compare with C
        MAXN = C
    end if
    write(*,*) MAXN, "is the largest"
end program LARGEST3