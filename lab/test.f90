module comm
    real::x0,x1,error
end module comm

program new_raph
    use comm
    implicit none
    write (*,*)"Enter your initial guess"
    read (*,*) x0
    write (*,*)"Enter error value"
    read (*,*) error
    write (*,*) "Xin= ",x0
    call newraph()
    write(*,*) x1, "is the solution of equation"
    end program new_raph
    
function Y(x)
    implicit none
    real::x,Y
    Y=cos(x)-x
end function Y
    
function Ydiff(x)
    implicit none
    real::x,Ydiff
    Ydiff=-sin(x)-1
end function Ydiff

subroutine newraph()
    use comm
    implicit none
    real::Y,Ydiff
    do
        if (abs(Ydiff(x0))<error) then
        write(*,*) "The root cannot be found"
        exit
        end if
        x1=x0-(Y(x0)/Ydiff(x0))
        write(*,*) x1, Y(x1)
        if (abs(Y(x1))<error) then
            exit
        end if
        x0=x1
    end do
end subroutine newraph