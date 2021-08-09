subroutine SUBSORT(Y, N)
    implicit none
    integer,intent(in) :: N
    integer,dimension(N),intent(in out) :: Y
    integer :: I, TEMP
    logical :: FLAG

    I = 1
    FLAG = .false.
    do !inf do loop
        if (Y(I) > Y(I+1)) then
            !swap
            TEMP = Y(I)
            Y(I) = Y(I+1)
            Y(I+1) = TEMP
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
end subroutine SUBSORT

program BUBBLESORT
    implicit none
    integer :: I,N
    integer, dimension(10) :: X
    write(*,*) "Enter size ( <=", 10,"): "
    read(*,*) N
    
    write(*,*) "Enter", N, "numbers: "
    read(*,*) (X(I), I = 1, N)
    write(*,*) "Entered numbers: "
    write(*,*) (X(I), I = 1, N)

    call SUBSORT(X, N)
    write(*,*) "Sorted numbers(in ascending order): "
    write(*,*) (X(I), I = 1, N)
end program BUBBLESORT