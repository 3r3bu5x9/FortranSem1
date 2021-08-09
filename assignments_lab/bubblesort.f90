!PROBLEM 3
! Name: Debasis Buxy
!PRN: 22020004154
!date: 6/7/21
!sort array in ascending order using bubble sort
program BUBBLESORT
    implicit none
    integer, dimension(10) :: X
    integer :: I, N
    logical :: FLAG
    integer :: TEMP

    write(*,*) "Enter size ( <=", 10,"): "
    read(*,*) N
    
    write(*,*) "Enter", N, "numbers: "
    read(*,*) (X(I), I = 1, N)
    write(*,*) "Entered numbers: "
    write(*,*) (X(I), I = 1, N)

    I = 1
    FLAG = .false.
    do !inf do loop
        if (X(I) > X(I+1)) then
            !swap
            TEMP = X(I)
            X(I) = X(I+1)
            X(I+1) = TEMP
            FLAG = .true.
        end if
        I = I+1 !increment index
        
        if (I == N) then !end of array checking
            if (FLAG) then !if atleast one swap took place
                I = 1 !set index to beginning
                FLAG = .false. !reset flag
            else !no swap took place
                exit !exit loop
            end if
        end if
    end do
    write(*,*) "Sorted numbers(in ascending order): "
    write(*,*) (X(I), I = 1, N)
end program BUBBLESORT