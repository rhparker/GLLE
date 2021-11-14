! 4th order GLLE equation

subroutine func(ndim,u,icp,par,ijac,f,dfdu,dfdp)

	implicit none
	integer, intent(in) :: ndim, ijac, icp(*)
	double precision, intent(in) :: u(ndim), par(*)
	double precision, intent(out) :: f(ndim)
	double precision, intent(inout) :: dfdu(ndim,*), dfdp(ndim,*)

	double precision P, L, theta, c, b2
	integer j

	P = par(1)
	theta = par(2)
	c = par(3)
	b2 = par(4)
	L = par(6)

    f(1) = u(3)
    f(2) = u(4)
    f(3) = u(5)
    f(4) = u(6)
    f(5) = u(7)
    f(6) = u(8)
    f(7) = -u(2) + c*u(4) - ( theta - (u(1)**2 + u(2)**2) )*u(1) + b2*u(5)
    f(8) = u(1)  - c*u(3) - ( theta - (u(1)**2 + u(2)**2) )*u(2) - P + b2*u(6)

    ! scaling by period
    do j = 1,ndim
        f(j) = 2*L * f(j)
    end do

end subroutine func

!---------------------------------------------------------------------- 

subroutine stpnt(ndim,u,par,t)

	implicit none
	integer, intent(in) :: ndim
	double precision, intent(inout) :: u(ndim), par(*)
	double precision, intent(in) :: t

	integer j

	double precision P, L, theta, c, b2
	P = 0
	theta = 2
	c = 0
	b2 = 0
	L = 40

    ! initialize to 0 (for now)
    do j = 1,ndim
        u(j) = 0
    end do

	par(1)  = P
	par(2)  = theta
	par(3)  = c
	par(4)  = b2
	par(6)  = L

end subroutine stpnt

!---------------------------------------------------------------------- 

subroutine bcnd(ndim,par,icp,nbc,u0,u1,fb,ijac,dbc)

	implicit none
	integer, intent(in) :: ndim, icp(*), nbc, ijac
	double precision, intent(in) :: par(*), u0(ndim), u1(ndim)
	double precision, intent(out) :: fb(nbc)
	double precision, intent(inout) :: dbc(nbc,*)

	integer j

	! periodic boundary conditions
	do j=1,ndim
		fb(j) = u0(j) - u1(j)
	end do
	
end subroutine bcnd

!---------------------------------------------------------------------- 

subroutine icnd(ndim,par,icp,nint,u,uold,udot,upold,fi,ijac,dint)

	implicit none
	integer, intent(in) :: ndim, icp(*), nint, ijac
	double precision, intent(in) :: par(*)
	double precision, intent(in) :: u(ndim), uold(ndim), udot(ndim), upold(ndim)
	double precision, intent(out) :: fi(nint)
	double precision, intent(inout) :: dint(nint,*)

	! phase condition (since system is translation invariant)
	fi(1) = upold(1)*(u(1)-uold(1))

end subroutine icnd

!---------------------------------------------------------------------- 

subroutine pvls
end subroutine pvls

subroutine fopt
end subroutine fopt

!---------------------------------------------------------------------- 
