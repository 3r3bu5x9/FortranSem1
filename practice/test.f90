program regula
    implicit none
    real::x0,x1,x2,error,f
    integer::n,i
    
    write(*,*) "give the values of x0 and x1"
    read(*,*) x0,x1
    write(*,*) "enter error"
    read(*,*) error
    write(*,*) "enter n"
    read(*,*) n
    
    if(f(x0)*f(x1)>0.0)then
      write(*,*)"no root"
      stop
    end if
    
    do
      x2=(x0*f(x1)-x1*f(x0))/(f(x1)-f(x0))
      if (f(x0)*f(x1)<0.0)then
       x1=x2
      else
       x0=x2
      end if
      
      if(abs(f(x2))<error)exit
    end do
    
    write(*,*)"ans of root is",x2
    write(*,*)"value of fun. is",f(x2)
    
end program regula 
    
function f(x)
    implicit none
    real::x,f
    f=cos(x)-x
end function f