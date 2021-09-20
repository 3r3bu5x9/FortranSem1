	!Gauss elimination for linear equations
	program gauss
	implicit none	
	real :: a(10,10), x(10), temp(10), sum_i, eps, det
	integer :: i, j, k, n

	open(unit = 1, file = "gauss.dat")

	print*,	"n: "
	read*, n


	eps = 1e-4

	do i = 1, n
		read(1, *) (a(i,j), j=1, n+1)
		write(*,  "(5f7.2)" ) (a(i,j), j=1, n+1)
	end do

	do i = 1, n-1

		do j = i+1, n
			if( abs(a(i,i)) < eps) then
				print*,	"diagonal element too small", i
				stop
			end if
			a(j, :) = a(j, :) - ( a(i, :)*a(j,i)/a(i,i)  )
		end do

	end do

	write(*,*) "Triangle matrix: "
	do i = 1, n
		write(*, "(5f7.2)" ) (a(i,j), j=1, n+1)
	end do

	det = 1.0
	do i = 1, n
		det = det*a(i,i)
	end do

	write(*,*) "Determinant of the triangle matrix: ", det
	if(abs(det) < eps) then
		print*,	"Determinant of the matrix too small"
		stop
	end if


	do i = n, 1, -1
		
			sum_i = 0.0

			do j = i+1, n
				sum_i = sum_i + a(i,j)*x(j)
			end do

			x(i) = (a(i, n+1) - sum_i) /a(i,i) 

	end do

	write(*, "(5f7.2)") (x(i), i=1,n)

	end program gauss

