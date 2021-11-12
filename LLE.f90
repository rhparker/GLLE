! 2nd order GLLE equation

subroutine func(ndim,u,icp,par,ijac,f,dfdu,dfdp)

	implicit none
	integer, intent(in) :: ndim, ijac, icp(*)
	double precision, intent(in) :: u(ndim), par(*)
	double precision, intent(out) :: f(ndim)
	double precision, intent(inout) :: dfdu(ndim,*), dfdp(ndim,*)

	double precision P, L, theta
	integer j

	P = par(1)
	theta = par(2)
	L = par(3)


    f(1) = u(3)
    f(2) = u(4)
    f(3) = u(2)  + ( theta - (u(1)**2 + u(2)**2) )*u(1)
    f(4) = -u(1) + ( theta - (u(1)**2 + u(2)**2) )*u(2) + P


    ! scaling by period
    do j = 1,ndim
        f(j) = L * f(j)
    end do

end subroutine func

!---------------------------------------------------------------------- 

subroutine stpnt(ndim,u,par,t)

	implicit none
	integer, intent(in) :: ndim
	double precision, intent(inout) :: u(ndim), par(*)
	double precision, intent(in) :: t

	double precision P, L, theta
	P = 0
	theta = 9
	L = 40

	u(1) = 0
	u(2) = 0
	u(3) = 0  
	u(4) = 0

	par(1)  = P
	par(2)  = theta
	par(3)  = L

end subroutine stpnt

!---------------------------------------------------------------------- 

subroutine bcnd(ndim,par,icp,nbc,u0,u1,fb,ijac,dbc)

	implicit none
	integer, intent(in) :: ndim, icp(*), nbc, ijac
	double precision, intent(in) :: par(*), u0(ndim), u1(ndim)
	double precision, intent(out) :: fb(nbc)
	double precision, intent(inout) :: dbc(nbc,*)

	integer j

	! Neumann BCs
	fb(1) = u0(3)
	fb(2) = u0(4)
	fb(3) = u1(3)
	fb(4) = u1(4)

	! ! periodic boundary conditions
	! do j=1,ndim
	! 	fb(j) = u0(j) - u1(j)
	! end do
	
end subroutine bcnd

!---------------------------------------------------------------------- 

subroutine icnd(ndim,par,icp,nint,u,uold,udot,upold,fi,ijac,dint)

	implicit none
	integer, intent(in) :: ndim, icp(*), nint, ijac
	double precision, intent(in) :: par(*)
	double precision, intent(in) :: u(ndim), uold(ndim), udot(ndim), upold(ndim)
	double precision, intent(out) :: fi(nint)
	double precision, intent(inout) :: dint(nint,*)

	! fi(1) = upold(27)*(u(27)-uold(27))		! phase condition

end subroutine icnd

!---------------------------------------------------------------------- 

subroutine pvls
end subroutine pvls

subroutine fopt
end subroutine fopt

!---------------------------------------------------------------------- 
