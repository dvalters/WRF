




































































































       

module module_interp_nmm
  use module_model_constants, only: g, R_D, p608
  implicit none

  private
  public :: interp_T_PD_Q, find_kpres

  public :: nmm_interp_pd, nmm_keep_pd, nmm_method_linear

  public :: c2b_fulldom, c2n_fulldom, n2c_fulldom
  public :: n2c_max2d, n2c_max3d
  public :: c2b_fulldom_new, n2c_fulldom_new
  public :: c2b_mass, c2n_mass, n2c_mass
  public :: c2n_massikj, n2c_massikj
  public :: c2b_copy3d, c2n_copy3d, n2c_copy3d

  public :: c2b_copy2d, c2n_copy2d, n2c_copy2d, c2n_copy2d_nomask
  public :: c2b_near2d, c2n_near2d, n2c_near2d
  public :: c2b_inear2d, c2n_inear2d, n2c_inear2d

  public :: c2n_near3dikj, c2n_sst, c2n_near3d








  integer, parameter :: nmm_method_linear = 1

  integer, parameter :: nmm_interp_pd = 1
  integer, parameter :: nmm_keep_pd = 0

  
  REAL, PARAMETER :: LAPSR=6.5E-3, GI=1./G,D608=0.608
  REAL, PARAMETER :: COEF3=287.05*GI*LAPSR, COEF2=-1./COEF3
  REAL, PARAMETER :: TRG=2.0*R_D*GI,LAPSI=1.0/LAPSR
  REAL, PARAMETER :: P_REF=103000.

  integer, parameter :: EConst=0, ECopy=1, EExtrap=2 

contains
  
  
  
  
  

  subroutine c2b_near2d (inear,jnear,cfield,         &
       fbxs,fbxe,fbys,fbye,                  &
       cims, cime, cjms, cjme,   &
       nids, nide, njds, njde,   &
       nims, nime, njms, njme,   &
       nits, nite, njts, njte)
    implicit none
    integer, parameter :: bdyw = 1

    integer, intent(in):: &
         cims, cime, cjms, cjme,   &
         nids, nide, njds, njde,   &
         nims, nime, njms, njme,   &
         nits, nite, njts, njte

    integer, intent(in), dimension(nims:nime,njms:njme) :: inear,jnear
    real, intent(in) :: cfield(cims:cime,cjms:cjme)

    
    real,dimension(nims:nime,bdyw) :: fbys,fbye
    real,dimension(njms:njme,bdyw) :: fbxs,fbxe

    integer :: j,i,a,nx,nz,ck,k,j1,j2,add
    real :: weight

    nx=min(nide-1,nite)-max(nids,nits)+1

    j1=max(njts-1,njds)
    if(mod(j1,2)/=1)   j1=j1+1

    j2=min(njte+1,njde-1)
    if(mod(j2,2)/=1)   j2=j2-1

    if(nits==1) then
       i=1
       do j=j1,j2,2
          fbxs(j,1)=cfield(inear(i,j),jnear(i,j))
       enddo
    endif
    if(nite>=nide-1) then
       i=nide-1
       do j=j1,j2,2
          fbxe(j,1)=cfield(inear(i,j),jnear(i,j))
       enddo
    endif
    if(njts==1) then
       j=1
       do i=max(nits-1,nids),min(nite+1,nide-1)
          fbys(i,1)=cfield(inear(i,j),jnear(i,j))
       enddo
    endif
    if(njte>=njde-1) then
       j=njde-1
       do i=max(nits-1,nids),min(nite+1,nide-1)
          fbye(i,1)=cfield(inear(i,j),jnear(i,j))
       enddo
    endif
  end subroutine c2b_near2d

  subroutine n2c_near2d (&
       cfield,nfield,ipos,jpos,  &
       cids, cide, cjds, cjde,   &
       cims, cime, cjms, cjme,   &
       cits, cite, cjts, cjte,   &
       nids, nide, njds, njde,   &
       nims, nime, njms, njme,   &
       nits, nite, njts, njte)
    implicit none
    integer, intent(in) :: &
         cids, cide, cjds, cjde,   &
         cims, cime, cjms, cjme,   &
         cits, cite, cjts, cjte,   &
         nids, nide, njds, njde,   &
         nims, nime, njms, njme,   &
         nits, nite, njts, njte,   &
         ipos,jpos
    real, intent(out) :: cfield(cims:cime,cjms:cjme)
    real, intent(in) :: nfield(nims:nime,njms:njme)

    integer, parameter :: nri=3, nrj=3 
    integer :: nz,jstart,jend,istart,iend,ni,nj,a,i,j

    jstart=MAX(jpos+1,cjts)
    jend=MIN(jpos+(njde-njds)/nrj-1,cjte)

    bigj: do j=jstart,jend
       a=mod(j,2)
       istart=MAX(ipos+a,cits)
       iend=MIN(ipos+(nide-nids)/nri-1,cite)
       nj = (j-jpos)*nrj + 1

       iloop: do i=istart,iend
          ni = (i-ipos)*nri + 2 - a
          cfield(i,j)=nfield(ni,nj)
       enddo iloop
    enddo bigj
  end subroutine n2c_near2d

    subroutine c2n_near2d (inear,jnear,    &
       cfield,nfield,imask,     &
       cims, cime, cjms, cjme,   &
       nids, nide, njds, njde,   &
       nims, nime, njms, njme,   &
       nits, nite, njts, njte)
    implicit none

    integer, intent(in), dimension(nims:nime,njms:njme) :: inear,jnear

    integer, intent(in):: cims, cime, cjms, cjme,   &
         nids, nide, njds, njde,   &
         nims, nime, njms, njme,   &
         nits, nite, njts, njte
    integer, intent(in), dimension(nims:nime,njms:njme) :: imask
    real, intent(in) :: cfield(cims:cime,cjms:cjme)
    real, intent(out) :: nfield(nims:nime,njms:njme)

    integer :: j,i,a,nx

    nx=min(nide-1,nite)-max(nids,nits)+1

    bigj: do j=max(njds,njts),min(njde-1,njte)
       interploop: do i=max(nids,nits),min(nide-1,nite)
          if(imask(i,j)/=0) cycle interploop
          nfield(i,j)=cfield(inear(i,j),jnear(i,j))
       enddo interploop
    end do bigj
  end subroutine c2n_near2d

    subroutine c2n_near3d (inear,jnear,    &
       cfield,nfield,imask,     &
       cims, cime, cjms, cjme, ckms, ckme,   &
       nids, nide, njds, njde, nkds, nkde,   &
       nims, nime, njms, njme, nkms, nkme,   &
       nits, nite, njts, njte, nkts, nkte)
    implicit none

    integer, intent(in), dimension(nims:nime,njms:njme) :: inear,jnear

    integer, intent(in):: cims, cime, cjms, cjme, ckms, ckme,   &
         nids, nide, njds, njde, nkds, nkde,   &
         nims, nime, njms, njme, nkms, nkme,   &
         nits, nite, njts, njte, nkts, nkte
    integer, intent(in), dimension(nims:nime,njms:njme) :: imask
    real, intent(in) :: cfield(cims:cime,cjms:cjme,ckms:ckme)
    real, intent(out) :: nfield(nims:nime,njms:njme,nkms:nkme)

    integer :: j,i,a,nx,k

    nx=min(nide-1,nite)-max(nids,nits)+1

    bigk: do k=nkds,nkde
       bigj: do j=max(njds,njts),min(njde-1,njte)
          interploop: do i=max(nids,nits),min(nide-1,nite)
             if(imask(i,j)/=0) cycle interploop
             nfield(i,j,k)=cfield(inear(i,j),jnear(i,j),k)
          enddo interploop
       end do bigj
    enddo bigk
  end subroutine c2n_near3d

    subroutine c2n_near3dikj (inear,jnear,    &
       cfield,nfield,imask,     &
       cims, cime, cjms, cjme, ckms, ckme,   &
       nids, nide, njds, njde, nkds, nkde,   &
       nims, nime, njms, njme, nkms, nkme,   &
       nits, nite, njts, njte, nkts, nkte)
    implicit none

    integer, intent(in), dimension(nims:nime,njms:njme) :: inear,jnear

    integer, intent(in):: cims, cime, cjms, cjme, ckms, ckme,   &
         nids, nide, njds, njde, nkds, nkde,   &
         nims, nime, njms, njme, nkms, nkme,   &
         nits, nite, njts, njte, nkts, nkte
    integer, intent(in), dimension(nims:nime,njms:njme) :: imask
    real, intent(in) :: cfield(cims:cime,ckms:ckme,cjms:cjme)
    real, intent(out) :: nfield(nims:nime,nkms:nkme,njms:njme)

    integer :: j,i,a,nx,k

    nx=min(nide-1,nite)-max(nids,nits)+1

    bigj: do j=max(njds,njts),min(njde-1,njte)
       bigk: do k=nkds,nkde
          interploop: do i=max(nids,nits),min(nide-1,nite)
             if(imask(i,j)/=0) cycle interploop
             nfield(i,k,j)=cfield(inear(i,j),k,jnear(i,j))
          enddo interploop
       enddo bigk
    end do bigj
  end subroutine c2n_near3dikj

    subroutine c2n_sst (inear,jnear,    &
       cfield,nfield,     &
       cims, cime, cjms, cjme,   &
       nids, nide, njds, njde,   &
       nims, nime, njms, njme,   &
       nits, nite, njts, njte)
    implicit none

    integer, intent(in), dimension(nims:nime,njms:njme) :: inear,jnear

    integer, intent(in):: cims, cime, cjms, cjme,   &
         nids, nide, njds, njde,   &
         nims, nime, njms, njme,   &
         nits, nite, njts, njte
    real, intent(in) :: cfield(cims:cime,cjms:cjme)
    real, intent(out) :: nfield(nims:nime,njms:njme)

    integer :: j,i,a,nx

    nx=min(nide-1,nite)-max(nids,nits)+1

    bigj: do j=max(njds,njts),min(njde-1,njte)
       interploop: do i=max(nids,nits),min(nide-1,nite)
          nfield(i,j)=cfield(inear(i,j),jnear(i,j))
       enddo interploop
    end do bigj
  end subroutine c2n_sst

  
  
  
  
  

  subroutine c2b_inear2d (inear,jnear,cfield,         &
       fbxs,fbxe,fbys,fbye,                  &
       cims, cime, cjms, cjme,   &
       nids, nide, njds, njde,   &
       nims, nime, njms, njme,   &
       nits, nite, njts, njte)
    implicit none
    integer, parameter :: bdyw = 1

    integer, intent(in):: &
         cims, cime, cjms, cjme,   &
         nids, nide, njds, njde,   &
         nims, nime, njms, njme,   &
         nits, nite, njts, njte

    integer, intent(in), dimension(nims:nime,njms:njme) :: inear,jnear
    integer, intent(in) :: cfield(cims:cime,cjms:cjme)

    
    integer,dimension(nims:nime,bdyw) :: fbys,fbye
    integer,dimension(njms:njme,bdyw) :: fbxs,fbxe

    integer :: j,i,a,nx,nz,ck,k,j1,j2,add

    nx=min(nide-1,nite)-max(nids,nits)+1

    j1=max(njts-1,njds)
    if(mod(j1,2)/=1)   j1=j1+1

    j2=min(njte+1,njde-1)
    if(mod(j2,2)/=1)   j2=j2-1

    if(nits==1) then
       i=1
       do j=j1,j2,2
          fbxs(j,1)=cfield(inear(i,j),jnear(i,j))
       enddo
    endif
    if(nite>=nide-1) then
       i=nide-1
       do j=j1,j2,2
          fbxe(j,1)=cfield(inear(i,j),jnear(i,j))
       enddo
    endif
    if(njts==1) then
       j=1
       do i=max(nits-1,nids),min(nite+1,nide-1)
          fbys(i,1)=cfield(inear(i,j),jnear(i,j))
       enddo
    endif
    if(njte>=njde-1) then
       j=njde-1
       do i=max(nits-1,nids),min(nite+1,nide-1)
          fbye(i,1)=cfield(inear(i,j),jnear(i,j))
       enddo
    endif
  end subroutine c2b_inear2d

  subroutine n2c_inear2d (&
       cfield,nfield,ipos,jpos,  &
       cids, cide, cjds, cjde,   &
       cims, cime, cjms, cjme,   &
       cits, cite, cjts, cjte,   &
       nids, nide, njds, njde,   &
       nims, nime, njms, njme,   &
       nits, nite, njts, njte)
    implicit none
    integer, intent(in) :: &
         cids, cide, cjds, cjde,   &
         cims, cime, cjms, cjme,   &
         cits, cite, cjts, cjte,   &
         nids, nide, njds, njde,   &
         nims, nime, njms, njme,   &
         nits, nite, njts, njte,   &
         ipos,jpos
    integer, intent(out) :: cfield(cims:cime,cjms:cjme)
    integer, intent(in) :: nfield(nims:nime,njms:njme)

    integer, parameter :: nri=3, nrj=3 
    integer :: nz,jstart,jend,istart,iend,ni,nj,a,i,j

    jstart=MAX(jpos+1,cjts)
    jend=MIN(jpos+(njde-njds)/nrj-1,cjte)

    bigj: do j=jstart,jend
       a=mod(j,2)
       istart=MAX(ipos+a,cits)
       iend=MIN(ipos+(nide-nids)/nri-1,cite)
       nj = (j-jpos)*nrj + 1

       iloop: do i=istart,iend
          ni = (i-ipos)*nri + 2 - a
          cfield(i,j)=nfield(ni,nj)
       enddo iloop
    enddo bigj
  end subroutine n2c_inear2d

    subroutine c2n_inear2d (inear,jnear,    &
       cfield,nfield,imask,     &
       cims, cime, cjms, cjme,   &
       nids, nide, njds, njde,   &
       nims, nime, njms, njme,   &
       nits, nite, njts, njte)
    implicit none

    integer, intent(in), dimension(nims:nime,njms:njme) :: inear,jnear

    integer, intent(in):: cims, cime, cjms, cjme,   &
         nids, nide, njds, njde,   &
         nims, nime, njms, njme,   &
         nits, nite, njts, njte
    integer, intent(in), dimension(nims:nime,njms:njme) :: imask
    integer, intent(in) :: cfield(cims:cime,cjms:cjme)
    integer, intent(out) :: nfield(nims:nime,njms:njme)

    integer :: j,i,a,nx

    nx=min(nide-1,nite)-max(nids,nits)+1

    bigj: do j=max(njds,njts),min(njde-1,njte)
       interploop: do i=max(nids,nits),min(nide-1,nite)
          if(imask(i,j)/=0) cycle interploop
          nfield(i,j)=cfield(inear(i,j),jnear(i,j))
       enddo interploop
    end do bigj
  end subroutine c2n_inear2d

  
  
  
  

  subroutine c2b_copy2d (II,JJ,W1,W2,W3,W4,cfield,         &
       fbxs,fbxe,fbys,fbye,                  &
       cims, cime, cjms, cjme,   &
       nids, nide, njds, njde,   &
       nims, nime, njms, njme,   &
       nits, nite, njts, njte, hgrid)
    implicit none
    integer, parameter :: bdyw = 1

    integer, intent(in):: &
         cims, cime, cjms, cjme,   &
         nids, nide, njds, njde,   &
         nims, nime, njms, njme,   &
         nits, nite, njts, njte
    logical, intent(in) :: hgrid
    real, intent(in), dimension(nims:nime,njms:njme) :: &
         W1,W2,W3,W4
    integer, intent(in), dimension(nims:nime,njms:njme) :: II,JJ
    real, intent(in) :: cfield(cims:cime,cjms:cjme)

    
    real,dimension(nims:nime,bdyw) :: fbys,fbye
    real,dimension(njms:njme,bdyw) :: fbxs,fbxe

    integer :: j,i,a,nx,nz,ck,k,j1,j2,add
    real :: weight

    nx=min(nide-1,nite)-max(nids,nits)+1

    if(hgrid) then
       a=1
    else
       a=0
    endif

    j1=max(njts-1,njds)
    if(mod(j1,2)/=a)   j1=j1+1

    j2=min(njte+1,njde-1)
    if(mod(j2,2)/=a)   j2=j2-1

    if(nits==1) then
       i=1
       do j=j1,j2,2
          if(hgrid) then
             a=1-mod(JJ(i,j),2)
          else
             a=mod(JJ(i,j),2)
          endif
          fbxs(j,1)=(W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  )    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  )    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1))
       enddo
    endif
    if(nite>=nide-1) then
       i=nide-1
       do j=j1,j2,2
          if(hgrid) then
             a=1-mod(JJ(i,j),2)
          else
             a=mod(JJ(i,j),2)
          endif
          fbxe(j,1)=(W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  )    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  )    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1))
       enddo
    endif
    if(njts==1) then
       j=1
       do i=max(nits-1,nids),min(nite+1,nide-1)
          if(hgrid) then
             a=1-mod(JJ(i,j),2)
          else
             a=mod(JJ(i,j),2)
          endif
          fbys(i,1)=(W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  )    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  )    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1))
       enddo
    endif
    if(njte>=njde-1) then
       j=njde-1
       do i=max(nits-1,nids),min(nite+1,nide-1)
          if(hgrid) then
             a=1-mod(JJ(i,j),2)
          else
             a=mod(JJ(i,j),2)
          endif
          fbye(i,1)=(W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  )    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  )    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1))
       enddo
    endif
  end subroutine c2b_copy2d
  subroutine n2c_copy2d (&
       cfield,nfield,ipos,jpos,  &
       cids, cide, cjds, cjde,   &
       cims, cime, cjms, cjme,   &
       cits, cite, cjts, cjte,   &
       nids, nide, njds, njde,   &
       nims, nime, njms, njme,   &
       nits, nite, njts, njte, &
       hgrid)
    implicit none
    integer, intent(in) :: &
         cids, cide, cjds, cjde,   &
         cims, cime, cjms, cjme,   &
         cits, cite, cjts, cjte,   &
         nids, nide, njds, njde,   &
         nims, nime, njms, njme,   &
         nits, nite, njts, njte,   &
         ipos,jpos
    real, intent(out) :: cfield(cims:cime,cjms:cjme)
    real, intent(in) :: nfield(nims:nime,njms:njme)
    logical, intent(in) :: hgrid

    integer, parameter :: nri=3, nrj=3 
    integer :: nz,jstart,jend,istart,iend,ni,nj,a,i,j

    jstart=MAX(jpos+1,cjts)
    jend=MIN(jpos+(njde-njds)/nrj-1,cjte)

    bigj: do j=jstart,jend
          a=mod(j,2)
          if(.not.hgrid) then
             a=1-a
          endif
       istart=MAX(ipos+a,cits)
       iend=MIN(ipos+(nide-nids)/nri-1,cite)
       nj = (j-jpos)*nrj + 1

       iloop: do i=istart,iend
          ni = (i-ipos)*nri + 2 - a
          cfield(i,j)=(nfield(ni,nj+2)  + nfield(ni-a  ,nj+1)+ nfield(ni+1-a,nj+1) + nfield(ni-1,nj  )  + nfield(ni,nj  )  + nfield(ni+1,nj  ) + nfield(ni-a  ,nj-1)+ nfield(ni+1-a,nj-1) +  nfield(ni,nj-2)   ) / 9
       enddo iloop
    enddo bigj 
 end subroutine n2c_copy2d

  subroutine n2c_max2d (&
       cfield,nfield,ipos,jpos,  &
       cids, cide, cjds, cjde,   &
       cims, cime, cjms, cjme,   &
       cits, cite, cjts, cjte,   &
       nids, nide, njds, njde,   &
       nims, nime, njms, njme,   &
       nits, nite, njts, njte, &
       hgrid)
    implicit none
    integer, intent(in) :: &
         cids, cide, cjds, cjde,   &
         cims, cime, cjms, cjme,   &
         cits, cite, cjts, cjte,   &
         nids, nide, njds, njde,   &
         nims, nime, njms, njme,   &
         nits, nite, njts, njte,   &
         ipos,jpos
    real, intent(out) :: cfield(cims:cime,cjms:cjme)
    real, intent(in) :: nfield(nims:nime,njms:njme)
    logical, intent(in) :: hgrid

    integer, parameter :: nri=3, nrj=3 
    integer :: nz,jstart,jend,istart,iend,ni,nj,a,i,j

    jstart=MAX(jpos+1,cjts)
    jend=MIN(jpos+(njde-njds)/nrj-1,cjte)

    bigj: do j=jstart,jend
          a=mod(j,2)
          if(.not.hgrid) then
             a=1-a
          endif
       istart=MAX(ipos+a,cits)
       iend=MIN(ipos+(nide-nids)/nri-1,cite)
       nj = (j-jpos)*nrj + 1

       iloop: do i=istart,iend
          ni = (i-ipos)*nri + 2 - a
          cfield(i,j)=max(cfield(i,j), max(nfield(ni,nj+2), max(nfield(ni-1,nj  ),max(nfield(ni,nj  ),  max(nfield(ni+1,nj  ),     max(nfield(ni-a  ,nj-1),max(nfield(ni+1-a,nj-1),     nfield(ni,nj-2) )))))))
       enddo iloop
    enddo bigj 
  end subroutine n2c_max2d

    subroutine c2n_copy2d (II,JJ,W1,W2,W3,W4,    &
       cfield,nfield,imask,     &
       cims, cime, cjms, cjme,   &
       nids, nide, njds, njde,   &
       nims, nime, njms, njme,   &
       nits, nite, njts, njte, hgrid)
    implicit none
    logical, intent(in) :: hgrid
    real, intent(in), dimension(nims:nime,njms:njme) :: &
         W1,W2,W3,W4
    integer, intent(in), dimension(nims:nime,njms:njme) :: II,JJ

    integer, intent(in):: cims, cime, cjms, cjme,   &
         nids, nide, njds, njde,   &
         nims, nime, njms, njme,   &
         nits, nite, njts, njte
    integer, intent(in), dimension(nims:nime,njms:njme) :: imask
    real, intent(in) :: cfield(cims:cime,cjms:cjme)
    real, intent(out) :: nfield(nims:nime,njms:njme)

    integer :: j,i,a,nx

    nx=min(nide-1,nite)-max(nids,nits)+1

    bigj: do j=max(njds,njts),min(njde-1,njte)
       interploop: do i=max(nids,nits),min(nide-1,nite)
          if(imask(i,j)/=0) cycle interploop
          if(hgrid) then
             a=1-mod(JJ(i,j),2)
          else
             a=mod(JJ(i,j),2)
          endif
          nfield(i,j)=(W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  )    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  )    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1))
       enddo interploop
    end do bigj
  end subroutine c2n_copy2d

    subroutine c2n_copy2d_nomask (II,JJ,W1,W2,W3,W4,    &
       cfield,nfield,     &
       cims, cime, cjms, cjme,   &
       nids, nide, njds, njde,   &
       nims, nime, njms, njme,   &
       nits, nite, njts, njte, hgrid)
    implicit none
    logical, intent(in) :: hgrid
    real, intent(in), dimension(nims:nime,njms:njme) :: &
         W1,W2,W3,W4
    integer, intent(in), dimension(nims:nime,njms:njme) :: II,JJ

    integer, intent(in):: cims, cime, cjms, cjme,   &
         nids, nide, njds, njde,   &
         nims, nime, njms, njme,   &
         nits, nite, njts, njte
    real, intent(in) :: cfield(cims:cime,cjms:cjme)
    real, intent(out) :: nfield(nims:nime,njms:njme)

    integer :: j,i,a,nx

    nx=min(nide-1,nite)-max(nids,nits)+1

    bigj: do j=max(njds,njts),min(njde-1,njte)
       interploop: do i=max(nids,nits),min(nide-1,nite)
          if(hgrid) then
             a=1-mod(JJ(i,j),2)
          else
             a=mod(JJ(i,j),2)
          endif
          nfield(i,j)=(W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  )    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  )    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1))
       enddo interploop
    end do bigj
  end subroutine c2n_copy2d_nomask


  
  
  
  

  subroutine c2b_copy3d  (II,JJ,W1,W2,W3,W4,cfield,         &
       fbxs,fbxe,fbys,fbye,                  &
       cims, cime, cjms, cjme, ckms, ckme,   &
       nids, nide, njds, njde, nkds, nkde,   &
       nims, nime, njms, njme, nkms, nkme,   &
       nits, nite, njts, njte, nkts, nkte, hgrid)
    implicit none
    integer, parameter :: bdyw = 1
    logical, intent(in) :: hgrid
    integer, intent(in):: &
         cims, cime, cjms, cjme, ckms, ckme,   &
         nids, nide, njds, njde, nkds, nkde,   &
         nims, nime, njms, njme, nkms, nkme,   &
         nits, nite, njts, njte, nkts, nkte

    real, intent(in), dimension(nims:nime,njms:njme) :: &
         W1,W2,W3,W4
    integer, intent(in), dimension(nims:nime,njms:njme) :: II,JJ
    real, intent(in) :: cfield(cims:cime,cjms:cjme,ckms:ckme)

    
    real,dimension(nims:nime,nkms:nkme,bdyw) :: fbys,fbye
    real,dimension(njms:njme,nkms:nkme,bdyw) :: fbxs,fbxe

    integer :: j,i,a,nx,nz,ck,k,j1,j2
    real :: weight

    nx=min(nide-1,nite)-max(nids,nits)+1
    nz=nkde-nkds+1

    j1=max(njts-1,njds)
    if(mod(j1,2)/=0)   j1=j1+1

    j2=min(njte+1,njde-1)
    if(mod(j2,2)/=0)   j2=j2-1

    if(nits==1) then
       i=1
       do j=j1,j2,2
          if(hgrid) then
             a=1-mod(JJ(i,j),2)
          else
             a=mod(JJ(i,j),2)
          endif
          kloop1: do k=nkds,min(nkde,nkte)
             fbxs(j,k,1)=(W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,k)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,k)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,k)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,k))
          enddo kloop1
       enddo
    endif
    if(nite>=nide-1) then
       i=nide-1
       do j=j1,j2,2
          if(hgrid) then
             a=1-mod(JJ(i,j),2)
          else
             a=mod(JJ(i,j),2)
          endif
          kloop2: do k=nkds,min(nkde,nkte)
             fbxe(j,k,1)=(W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,k)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,k)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,k)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,k))
          enddo kloop2
       enddo
    endif
    if(njts==1) then
       j=1
       do i=max(nits-1,nids),min(nite+1,nide-1)
          if(hgrid) then
             a=1-mod(JJ(i,j),2)
          else
             a=mod(JJ(i,j),2)
          endif
          kloop3: do k=nkts,min(nkde,nkte)
             fbys(i,k,1)=(W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,k)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,k)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,k)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,k))
          enddo kloop3
       enddo
    endif
    if(njte>=njde-1) then
       j=njde-1
       do i=max(nits-1,nids),min(nite+1,nide-1)
          if(hgrid) then
             a=1-mod(JJ(i,j),2)
          else
             a=mod(JJ(i,j),2)
          endif
          kloop4: do k=nkts,min(nkde,nkte)
             fbye(i,k,1)=(W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,k)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,k)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,k)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,k))
          enddo kloop4
       enddo
    endif
  end subroutine c2b_copy3d
  
  subroutine n2c_copy3d (&
       cfield,nfield,ipos,jpos,  &
       cids, cide, cjds, cjde, ckds, ckde,   &
       cims, cime, cjms, cjme, ckms, ckme,   &
       cits, cite, cjts, cjte, ckts, ckte,   &
       nids, nide, njds, njde, nkds, nkde,   &
       nims, nime, njms, njme, nkms, nkme,   &
       nits, nite, njts, njte, nkts, nkte,   &
       hgrid)
    implicit none
    logical, intent(in) :: hgrid
    integer, intent(in) :: &
         cids, cide, cjds, cjde, ckds, ckde,   &
         cims, cime, cjms, cjme, ckms, ckme,   &
         cits, cite, cjts, cjte, ckts, ckte,   &
         nids, nide, njds, njde, nkds, nkde,   &
         nims, nime, njms, njme, nkms, nkme,   &
         nits, nite, njts, njte, nkts, nkte,   &
         ipos,jpos
    real, intent(out) :: cfield(cims:cime,cjms:cjme,ckms:ckme)
    real, intent(in) :: nfield(nims:nime,njms:njme,nkms:nkme)

    integer, parameter :: nri=3, nrj=3 
    integer :: nx,nz,jstart,jend,istart,iend,ni,nj,a,i,j,k,nk
    real :: weight

    nx=min(nide-2,nite)-max(nids+1,nits)+1
    nz=nkde-nkds+1

    jstart=MAX(jpos+1,cjts)
    jend=MIN(jpos+(njde-njds)/nrj-1,cjte)

    bigj: do j=jstart,jend
       if(hgrid) then
          a=mod(j,2)
       else
          a=1-mod(j,2)
       endif
       istart=MAX(ipos+a,cits)
       iend=MIN(ipos+(nide-nids)/nri-1,cite)
       nj = (j-jpos)*nrj + 1

       iloop: do i=istart,iend
          do k=nkds,nkde
             ni = (i-ipos)*nri + 2 - a
             cfield(i,j,k)=(nfield(ni,nj+2,k)  + nfield(ni-a  ,nj+1,k)+ nfield(ni+1-a,nj+1,k) + nfield(ni-1,nj  ,k)  + nfield(ni,nj  ,k)  + nfield(ni+1,nj  ,k) + nfield(ni-a  ,nj-1,k)+ nfield(ni+1-a,nj-1,k) +  nfield(ni,nj-2,k)   ) / 9
          enddo
       enddo iloop
    enddo bigj
  end subroutine n2c_copy3d

  subroutine n2c_max3d (&
       cfield,nfield,ipos,jpos,  &
       cids, cide, cjds, cjde, ckds, ckde,   &
       cims, cime, cjms, cjme, ckms, ckme,   &
       cits, cite, cjts, cjte, ckts, ckte,   &
       nids, nide, njds, njde, nkds, nkde,   &
       nims, nime, njms, njme, nkms, nkme,   &
       nits, nite, njts, njte, nkts, nkte,   &
       hgrid)
    implicit none
    logical, intent(in) :: hgrid
    integer, intent(in) :: &
         cids, cide, cjds, cjde, ckds, ckde,   &
         cims, cime, cjms, cjme, ckms, ckme,   &
         cits, cite, cjts, cjte, ckts, ckte,   &
         nids, nide, njds, njde, nkds, nkde,   &
         nims, nime, njms, njme, nkms, nkme,   &
         nits, nite, njts, njte, nkts, nkte,   &
         ipos,jpos
    real, intent(out) :: cfield(cims:cime,cjms:cjme,ckms:ckme)
    real, intent(in) :: nfield(nims:nime,njms:njme,nkms:nkme)

    integer, parameter :: nri=3, nrj=3 
    integer :: nx,nz,jstart,jend,istart,iend,ni,nj,a,i,j,k,nk
    real :: weight

    nx=min(nide-2,nite)-max(nids+1,nits)+1
    nz=nkde-nkds+1

    jstart=MAX(jpos+1,cjts)
    jend=MIN(jpos+(njde-njds)/nrj-1,cjte)

    bigj: do j=jstart,jend
       if(hgrid) then
          a=mod(j,2)
       else
          a=1-mod(j,2)
       endif
       istart=MAX(ipos+a,cits)
       iend=MIN(ipos+(nide-nids)/nri-1,cite)
       nj = (j-jpos)*nrj + 1

       iloop: do i=istart,iend
          do k=nkds,nkde
             ni = (i-ipos)*nri + 2 - a
             cfield(i,j,k)=max(cfield(i,j,k),max(nfield(ni,nj+2,k),     max(nfield(ni-1,nj  ,k),max(nfield(ni,nj  ,k),  max(nfield(ni+1,nj  ,k),  max(nfield(ni-a  ,nj-1,k),max(nfield(ni+1-a,nj-1,k), nfield(ni,nj-2,k) )))))))
          enddo
       enddo iloop
    enddo bigj
  end subroutine n2c_max3d

  subroutine c2n_copy3d (II,JJ,W1,W2,W3,W4,    &
       cfield,nfield,imask,      &
       cims, cime, cjms, cjme, ckms, ckme,   &
       nids, nide, njds, njde, nkds, nkde,   &
       nims, nime, njms, njme, nkms, nkme,   &
       nits, nite, njts, njte, nkts, nkte,   &
       hgrid)
    implicit none
    real, intent(in), dimension(nims:nime,njms:njme) :: &
         W1,W2,W3,W4
    integer, intent(in), dimension(nims:nime,njms:njme) :: II,JJ
    logical, intent(in) :: hgrid
    integer, intent(in):: cims, cime, cjms, cjme, ckms, ckme,   &
         nids, nide, njds, njde, nkds, nkde,   &
         nims, nime, njms, njme, nkms, nkme,   &
         nits, nite, njts, njte, nkts, nkte
    integer, intent(in), dimension(nims:nime,njms:njme) :: imask
    real, intent(in) :: cfield(cims:cime,cjms:cjme,ckms:ckme)
    real, intent(out) :: nfield(nims:nime,njms:njme,nkms:nkme)

    integer :: j,i,a,nx,nz,k

    nx=min(nide-1,nite)-max(nids,nits)+1
    nz=nkde-nkds+1

    bigj: do j=max(njds,njts),min(njde-1,njte)
       interploop: do i=max(nids,nits),min(nide-1,nite)
          if(imask(i,j)/=0) cycle interploop
          kinterploop: do k=nkds,nkde
             if(hgrid) then
                a=1-mod(JJ(i,j),2)
             else
                a=mod(JJ(i,j),2)
             endif
             nfield(i,j,k) = (W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,k)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,k)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,k)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,k))
          enddo kinterploop
       enddo interploop
    end do bigj
  end subroutine c2n_copy3d

  
  
  
  
  

  subroutine c2b_mass (II,JJ,W1,W2,W3,W4,cfield,         &
       ibxs,ibxe,ibys,ibye,                  &
       wbxs,wbxe,wbys,wbye,                  &
       fbxs,fbxe,fbys,fbye,                  &
       emethod,evalue,                       &
       cims, cime, cjms, cjme, ckms, ckme,   &
       nids, nide, njds, njde, nkds, nkde,   &
       nims, nime, njms, njme, nkms, nkme,   &
       nits, nite, njts, njte, nkts, nkte)
    use module_interp_store, only: kpres
    implicit none
    integer, parameter :: bdyw = 1

    integer, intent(in):: &
         cims, cime, cjms, cjme, ckms, ckme,   &
         nids, nide, njds, njde, nkds, nkde,   &
         nims, nime, njms, njme, nkms, nkme,   &
         nits, nite, njts, njte, nkts, nkte

    integer, intent(in) :: emethod 
    real, intent(in) :: evalue
    real, intent(in), dimension(nims:nime,njms:njme) :: &
         W1,W2,W3,W4
    integer, intent(in), dimension(nims:nime,njms:njme) :: II,JJ
    real, intent(in) :: cfield(cims:cime,cjms:cjme,ckms:ckme)

    
    real,dimension(nims:nime,nkms:nkme,bdyw) :: fbys,fbye
    real,dimension(njms:njme,nkms:nkme,bdyw) :: fbxs,fbxe

    
    real,dimension(nims:nime,nkms:nkme,bdyw) :: wbys,wbye
    real,dimension(njms:njme,nkms:nkme,bdyw) :: wbxs,wbxe
    integer,dimension(nims:nime,nkms:nkme,bdyw) :: ibys,ibye
    integer,dimension(njms:njme,nkms:nkme,bdyw) :: ibxs,ibxe

    integer :: j,i,a,nx,nz,ck,k,j1,j2
    real :: weight

    nx=min(nide-1,nite)-max(nids,nits)+1
    nz=nkde-nkds+1

    j1=max(njts-1,njds)
    if(mod(j1,2)/=1)   j1=j1+1

    j2=min(njte+1,njde-1)
    if(mod(j2,2)/=1)   j2=j2-1

    if(nits==1) then
       i=1
       do j=j1,j2,2
          a=1-mod(JJ(i,j),2)
          kcopy1: do k=min(nkde,nkte),kpres+1,-1
             fbxs(j,k,1) = (W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,k)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,k)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,k)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,k))
          enddo kcopy1
          kloop1: do k=kpres,nkds,-1
             weight=wbxs(j,k,1)
             ck=ibxs(j,k,1)
             
             if(ck>1) then
                fbxs(j,k,1) = &
                     (W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,ck)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,ck)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,ck)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,ck))   * weight + &
                     (W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,ck-1)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,ck-1)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,ck-1)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,ck-1)) * (1.0-weight)
             else
                
                if(emethod==EConst) then
                   fbxs(j,k,1)=evalue
                else if(emethod==ECopy) then
                   fbxs(j,k,1)=(W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,1)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,1)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,1)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,1))
                else 
                   fbxs(j,k,1)=evalue * weight + &
                               (W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,1)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,1)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,1)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,1)) * (1.0-weight)
                endif
             endif
          enddo kloop1
       enddo
    endif
    if(nite>=nide-1) then
       i=nide-1
       do j=j1,j2,2
          a=1-mod(JJ(i,j),2)
          kcopy2: do k=min(nkde,nkte),kpres+1,-1
             fbxe(j,k,1)=(W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,k)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,k)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,k)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,k))
          enddo kcopy2
          kloop2: do k=kpres,nkds,-1
             weight=wbxe(j,k,1)
             ck=ibxe(j,k,1)

             if(ck>1) then
                fbxe(j,k,1) = &
                     (W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,ck)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,ck)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,ck)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,ck))   * weight + &
                     (W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,ck-1)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,ck-1)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,ck-1)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,ck-1)) * (1.0-weight)
             else
                
                if(emethod==EConst) then
                   fbxe(j,k,1)=evalue
                else if(emethod==ECopy) then
                   fbxe(j,k,1)=(W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,1)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,1)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,1)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,1))
                else 
                   fbxe(j,k,1)=evalue * weight + &
                        (W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,1)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,1)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,1)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,1)) * (1.0-weight)
                endif
             endif
          enddo kloop2
       enddo
    endif
    if(njts==1) then
       j=1
       do i=max(nits-1,nids),min(nite+1,nide-1)
          a=1-mod(JJ(i,j),2)
          kcopy3: do k=min(nkde,nkte),kpres+1,-1
             fbys(i,k,1) = (W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,k)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,k)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,k)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,k))
          enddo kcopy3
          kloop3: do k=kpres,nkds,-1
             weight=wbys(i,k,1)
             ck=ibys(i,k,1)

             if(ck>1) then
                fbys(i,k,1) = &
                     (W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,ck)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,ck)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,ck)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,ck))   * weight + &
                     (W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,ck-1)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,ck-1)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,ck-1)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,ck-1)) * (1.0-weight)
             else
                
                if(emethod==EConst) then
                   fbys(i,k,1)=evalue
                else if(emethod==ECopy) then
                   fbys(i,k,1)=(W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,1)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,1)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,1)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,1))
                else 
                   fbys(i,k,1)=evalue*weight + &
                        (W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,1)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,1)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,1)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,1))*(1.0-weight)
                endif
             endif
          enddo kloop3
       enddo
    endif
    if(njte>=njde-1) then
       j=njde-1
       do i=max(nits-1,nids),min(nite+1,nide-1)
          a=1-mod(JJ(i,j),2)
          kcopy4: do k=min(nkde,nkte),kpres+1,-1
             fbye(i,k,1) = (W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,k)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,k)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,k)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,k))
          enddo kcopy4
          kloop4: do k=kpres,nkds,-1
             weight=wbye(i,k,1)
             ck=ibye(i,k,1)

             if(ck>1) then
                fbye(i,k,1) = &
                     (W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,ck)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,ck)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,ck)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,ck))   * weight + &
                     (W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,ck-1)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,ck-1)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,ck-1)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,ck-1)) * (1.0-weight)
             else
                if(emethod==EConst) then
                   fbye(i,k,1)=evalue
                else if(emethod==ECopy) then
                   fbye(i,k,1)=(W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,1)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,1)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,1)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,1))
                else 
                   fbye(i,k,1)=evalue*weight + &
                        (W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,1)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,1)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,1)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,1))*(1.0-weight)
                endif
             endif
          enddo kloop4
       enddo
    endif

  end subroutine c2b_mass

  subroutine n2c_mass (&
       cfield,nfield,iinfo,winfo,ipos,jpos,  &
       emethod, evalue,                      &
       cids, cide, cjds, cjde, ckds, ckde,   &
       cims, cime, cjms, cjme, ckms, ckme,   &
       cits, cite, cjts, cjte, ckts, ckte,   &
       nids, nide, njds, njde, nkds, nkde,   &
       nims, nime, njms, njme, nkms, nkme,   &
       nits, nite, njts, njte, nkts, nkte)
    use module_interp_store, only: kpres
    implicit none
    integer, intent(in) :: &
         cids, cide, cjds, cjde, ckds, ckde,   &
         cims, cime, cjms, cjme, ckms, ckme,   &
         cits, cite, cjts, cjte, ckts, ckte,   &
         nids, nide, njds, njde, nkds, nkde,   &
         nims, nime, njms, njme, nkms, nkme,   &
         nits, nite, njts, njte, nkts, nkte,   &
         ipos,jpos, emethod
    real, intent(in) :: evalue
    real, intent(in), dimension(cims:cime,cjms:cjme,ckms:ckme) :: winfo
    integer, intent(in), dimension(cims:cime,cjms:cjme,ckms:ckme) :: iinfo
    real, intent(out) :: cfield(cims:cime,cjms:cjme,ckms:ckme)
    real, intent(in) :: nfield(nims:nime,njms:njme,nkms:nkme)

    integer, parameter :: nri=3, nrj=3 
    integer :: nz,jstart,jend,istart,iend,ni,nj,a,i,j,k,nk
    real :: weight

    nz=nkde-nkds+1

    jstart=MAX(jpos+1,cjts)
    jend=MIN(jpos+(njde-njds)/nrj-1,cjte)

    kcopy: do k=ckde,kpres+1,-1
       jcopy: do j=jstart,jend
          a=mod(j,2)
          istart=MAX(ipos+a,cits)
          iend=MIN(ipos+(nide-nids)/nri-1,cite)
          nj = (j-jpos)*nrj + 1
          icopy: do i=istart,iend
             ni = (i-ipos)*nri + 2 - a
             cfield(i,j,k) = (nfield(ni,nj+2,k)  + nfield(ni-a  ,nj+1,k)+ nfield(ni+1-a,nj+1,k) + nfield(ni-1,nj  ,k)  + nfield(ni,nj  ,k)  + nfield(ni+1,nj  ,k) + nfield(ni-a  ,nj-1,k)+ nfield(ni+1-a,nj-1,k) +  nfield(ni,nj-2,k)   ) / 9
          enddo icopy
       enddo jcopy
    enddo kcopy

    bigj: do j=jstart,jend
          a=mod(j,2)
       istart=MAX(ipos+a,cits)
       iend=MIN(ipos+(nide-nids)/nri-1,cite)
       nj = (j-jpos)*nrj + 1

       iloop: do i=istart,iend
          ni = (i-ipos)*nri + 2 - a
          kinterploop: do k=kpres,ckds,-1
             weight=winfo(i,j,k)
             nk=iinfo(i,j,k)

             if(nk>1) then
                cfield(i,j,k) = &
                     (nfield(ni,nj+2,nk)  + nfield(ni-a  ,nj+1,nk)+ nfield(ni+1-a,nj+1,nk) + nfield(ni-1,nj  ,nk)  + nfield(ni,nj  ,nk)  + nfield(ni+1,nj  ,nk) + nfield(ni-a  ,nj-1,nk)+ nfield(ni+1-a,nj-1,nk) +  nfield(ni,nj-2,nk)   ) / 9   * weight + &

             (nfield(ni,nj+2,nk-1)  + nfield(ni-a  ,nj+1,nk-1)+ nfield(ni+1-a,nj+1,nk-1) + nfield(ni-1,nj  ,nk-1)  + nfield(ni,nj  ,nk-1)  + nfield(ni+1,nj  ,nk-1) + nfield(ni-a  ,nj-1,nk-1)+ nfield(ni+1-a,nj-1,nk-1) +  nfield(ni,nj-2,nk-1)   ) / 9 &
             * (1.0-weight)
             else
                
                if(emethod==EConst) then
                   cfield(i,j,k)=evalue
                elseif(emethod==ECopy) then
                   cfield(i,j,k)=(nfield(ni,nj+2,1)  + nfield(ni-a  ,nj+1,1)+ nfield(ni+1-a,nj+1,1) + nfield(ni-1,nj  ,1)  + nfield(ni,nj  ,1)  + nfield(ni+1,nj  ,1) + nfield(ni-a  ,nj-1,1)+ nfield(ni+1-a,nj-1,1) +  nfield(ni,nj-2,1)   ) / 9
                else 
                   cfield(i,j,k)=evalue*weight + &
                        (nfield(ni,nj+2,1)  + nfield(ni-a  ,nj+1,1)+ nfield(ni+1-a,nj+1,1) + nfield(ni-1,nj  ,1)  + nfield(ni,nj  ,1)  + nfield(ni+1,nj  ,1) + nfield(ni-a  ,nj-1,1)+ nfield(ni+1-a,nj-1,1) +  nfield(ni,nj-2,1)   ) / 9*(1.0-weight)
                endif
             endif
          end do kinterploop
       enddo iloop
    enddo bigj
  end subroutine n2c_mass

  subroutine n2c_massikj (&
       cfield,nfield,iinfo,winfo,ipos,jpos,  &
       emethod, evalue,                      &
       cids, cide, cjds, cjde, ckds, ckde,   &
       cims, cime, cjms, cjme, ckms, ckme,   &
       cits, cite, cjts, cjte, ckts, ckte,   &
       nids, nide, njds, njde, nkds, nkde,   &
       nims, nime, njms, njme, nkms, nkme,   &
       nits, nite, njts, njte, nkts, nkte)
    use module_interp_store, only: kpres
    implicit none
    integer, intent(in) :: &
         cids, cide, cjds, cjde, ckds, ckde,   &
         cims, cime, cjms, cjme, ckms, ckme,   &
         cits, cite, cjts, cjte, ckts, ckte,   &
         nids, nide, njds, njde, nkds, nkde,   &
         nims, nime, njms, njme, nkms, nkme,   &
         nits, nite, njts, njte, nkts, nkte,   &
         ipos,jpos, emethod
    real, intent(in) :: evalue
    real, intent(in), dimension(cims:cime,cjms:cjme,ckms:ckme) :: winfo
    integer, intent(in), dimension(cims:cime,cjms:cjme,ckms:ckme) :: iinfo
    real, intent(out) :: cfield(cims:cime,ckms:ckme,cjms:cjme)
    real, intent(in) :: nfield(nims:nime,nkms:nkme,njms:njme)

    integer, parameter :: nri=3, nrj=3 
    integer :: nz,jstart,jend,istart,iend,ni,nj,a,i,j,k,nk
    real :: weight

    nz=nkde-nkds+1

    jstart=MAX(jpos+1,cjts)
    jend=MIN(jpos+(njde-njds)/nrj-1,cjte)

    bigj: do j=jstart,jend
          a=mod(j,2)
       istart=MAX(ipos+a,cits)
       iend=MIN(ipos+(nide-nids)/nri-1,cite)
       nj = (j-jpos)*nrj + 1

       kcopyloop: do k=nkde,kpres+1,-1
          icopyloop: do i=istart,iend
             ni = (i-ipos)*nri + 2 - a
             cfield(i,k,j) = (nfield(ni,k,nj+2)  + nfield(ni-a  ,k,nj+1)+ nfield(ni+1-a,k,nj+1)    + nfield(ni-1,k,nj  )  + nfield(ni,k,nj  )  + nfield(ni+1,k,nj  ) + nfield(ni-a  ,k,nj-1)+ nfield(ni+1-a,k,nj-1) +  nfield(ni,k,nj-2)   ) / 9
          enddo icopyloop
       enddo kcopyloop

       kinterploop: do k=kpres+1,nkds,-1
          iloop: do i=istart,iend
             ni = (i-ipos)*nri + 2 - a
             weight=winfo(i,j,k)
             nk=iinfo(i,j,k)

             if(nk>1) then
                cfield(i,k,j) = &
                     (nfield(ni,nk,nj+2)  + nfield(ni-a  ,nk,nj+1)+ nfield(ni+1-a,nk,nj+1)    + nfield(ni-1,nk,nj  )  + nfield(ni,nk,nj  )  + nfield(ni+1,nk,nj  ) + nfield(ni-a  ,nk,nj-1)+ nfield(ni+1-a,nk,nj-1) +  nfield(ni,nk,nj-2)   ) / 9 * weight + &

             (nfield(ni,nk-1,nj+2)  + nfield(ni-a  ,nk-1,nj+1)+ nfield(ni+1-a,nk-1,nj+1)    + nfield(ni-1,nk-1,nj  )  + nfield(ni,nk-1,nj  )  + nfield(ni+1,nk-1,nj  ) + nfield(ni-a  ,nk-1,nj-1)+ nfield(ni+1-a,nk-1,nj-1) +  nfield(ni,nk-1,nj-2)   ) / 9 &
             * (1.0-weight)
             else
                
                if(emethod==EConst) then
                   cfield(i,k,j)=evalue
                elseif(emethod==ECopy) then
                   cfield(i,k,j)=(nfield(ni,1,nj+2)  + nfield(ni-a  ,1,nj+1)+ nfield(ni+1-a,1,nj+1)    + nfield(ni-1,1,nj  )  + nfield(ni,1,nj  )  + nfield(ni+1,1,nj  ) + nfield(ni-a  ,1,nj-1)+ nfield(ni+1-a,1,nj-1) +  nfield(ni,1,nj-2)   ) / 9
                else 
                   cfield(i,k,j)=evalue*weight + &
                        (nfield(ni,1,nj+2)  + nfield(ni-a  ,1,nj+1)+ nfield(ni+1-a,1,nj+1)    + nfield(ni-1,1,nj  )  + nfield(ni,1,nj  )  + nfield(ni+1,1,nj  ) + nfield(ni-a  ,1,nj-1)+ nfield(ni+1-a,1,nj-1) +  nfield(ni,1,nj-2)   ) / 9*(1.0-weight)
                endif
             endif
          enddo iloop
       end do kinterploop
    enddo bigj
  end subroutine n2c_massikj

  subroutine c2n_mass (II,JJ,W1,W2,W3,W4,    &
       cfield,nfield,iinfo,winfo,imask,      &
       emethod, evalue,                      &
       cims, cime, cjms, cjme, ckms, ckme,   &
       nids, nide, njds, njde, nkds, nkde,   &
       nims, nime, njms, njme, nkms, nkme,   &
       nits, nite, njts, njte, nkts, nkte)
    use module_interp_store, only: kpres
    implicit none
    real, intent(in), dimension(nims:nime,njms:njme) :: &
         W1,W2,W3,W4
    integer, intent(in), dimension(nims:nime,njms:njme) :: II,JJ

    integer, intent(in):: cims, cime, cjms, cjme, ckms, ckme,   &
         nids, nide, njds, njde, nkds, nkde,   &
         nims, nime, njms, njme, nkms, nkme,   &
         nits, nite, njts, njte, nkts, nkte, emethod
    real, intent(in) :: evalue
    real, intent(in), dimension(nims:nime,njms:njme,nkms:nkme) :: winfo
    integer, intent(in), dimension(nims:nime,njms:njme,nkms:nkme) :: iinfo
    integer, intent(in), dimension(nims:nime,njms:njme) :: imask
    real, intent(in) :: cfield(cims:cime,cjms:cjme,ckms:ckme)
    real, intent(out) :: nfield(nims:nime,njms:njme,nkms:nkme)
    character*255 :: message
    integer :: j,i,a,nx,nz,ck,k
    real :: weight

    nx=min(nide-1,nite)-max(nids,nits)+1
    nz=nkde-nkds+1
    if(kpres<=nkds .or. kpres>=nkde) then
       call wrf_error_fatal3("<stdin>",1351,&
'invalid kpres: outside domain bounds')
    end if
    bigj: do j=max(njds,njts),min(njde-1,njte)
       interploop: do i=max(nids,nits),min(nide-1,nite)
          if(imask(i,j)/=0) cycle interploop
          a=1-mod(JJ(i,j),2)
          kcopyloop: do k=nkde,kpres+1,-1
             nfield(i,j,k)=(W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,k)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,k)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,k)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,k))
             
             ck=iinfo(i,j,k)










          enddo kcopyloop
          kinterploop: do k=kpres,nkds,-1
             weight=winfo(i,j,k)
             ck=iinfo(i,j,k)

             if(ck>1) then
                nfield(i,j,k) = &
                     (W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,ck)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,ck)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,ck)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,ck))   * weight + &
                     (W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,ck-1)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,ck-1)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,ck-1)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,ck-1)) * (1.0-weight)
             else                
                
                if(emethod==EConst) then
                   nfield(i,j,k)=evalue
                elseif(emethod==ECopy) then
                   nfield(i,j,k)=(W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,1)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,1)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,1)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,1))
                else 
                   nfield(i,j,k)=evalue*weight + &
                        (W1(i,j)*cfield(II(i,j)  ,JJ(i,j)  ,1)    + W2(i,j)*cfield(II(i,j)+1,JJ(i,j)  ,1)    + W3(i,j)*cfield(II(i,j)+a,JJ(i,j)-1,1)    + W4(i,j)*cfield(II(i,j)+a,JJ(i,j)+1,1))*(1.0-weight)
                endif
             endif
          enddo kinterploop
       enddo interploop
    end do bigj

  end subroutine c2n_mass

  subroutine c2n_massikj (II,JJ,W1,W2,W3,W4, &
       cfield,nfield,iinfo,winfo,imask,      &
       emethod, evalue,                      &
       cims, cime, cjms, cjme, ckms, ckme,   &
       nids, nide, njds, njde, nkds, nkde,   &
       nims, nime, njms, njme, nkms, nkme,   &
       nits, nite, njts, njte, nkts, nkte)
    use module_interp_store, only: kpres
    implicit none
    real, intent(in), dimension(nims:nime,njms:njme) :: &
         W1,W2,W3,W4
    integer, intent(in), dimension(nims:nime,njms:njme) :: II,JJ

    integer, intent(in):: cims, cime, cjms, cjme, ckms, ckme,   &
         nids, nide, njds, njde, nkds, nkde,   &
         nims, nime, njms, njme, nkms, nkme,   &
         nits, nite, njts, njte, nkts, nkte, emethod
    real, intent(in), dimension(nims:nime,njms:njme,nkms:nkme) :: winfo
    integer, intent(in), dimension(nims:nime,njms:njme,nkms:nkme) :: iinfo
    integer, intent(in), dimension(nims:nime,njms:njme) :: imask
    real, intent(in) :: cfield(cims:cime,ckms:ckme,cjms:cjme)
    real, intent(out) :: nfield(nims:nime,nkms:nkme,njms:njme)
    real, intent(In) :: evalue

    integer :: j,i,a,nx,nz,ck,k
    real :: weight

    nx=min(nide-1,nite)-max(nids,nits)+1
    nz=nkde-nkds+1

    bigj: do j=max(njds,njts),min(njde-1,njte)
       interploop: do i=max(nids,nits),min(nide-1,nite)
          if(imask(i,j)/=0) cycle interploop
          a=1-mod(JJ(i,j),2)
          kcopyloop: do k=nkde,kpres+1,-1
             nfield(i,k,j)=(W1(i,j)*cfield(II(i,j)  ,k,JJ(i,j)  )    + W2(i,j)*cfield(II(i,j)+1,k,JJ(i,j)  )    + W3(i,j)*cfield(II(i,j)+a,k,JJ(i,j)-1)    + W4(i,j)*cfield(II(i,j)+a,k,JJ(i,j)+1))
          end do kcopyloop
          kinterploop: do k=kpres,nkds,-1
             weight=winfo(i,j,k)
             ck=iinfo(i,j,k)

             if(ck>1) then
                nfield(i,k,j) = &
                     (W1(i,j)*cfield(II(i,j)  ,ck,JJ(i,j)  )    + W2(i,j)*cfield(II(i,j)+1,ck,JJ(i,j)  )    + W3(i,j)*cfield(II(i,j)+a,ck,JJ(i,j)-1)    + W4(i,j)*cfield(II(i,j)+a,ck,JJ(i,j)+1))   * weight + &
                     (W1(i,j)*cfield(II(i,j)  ,ck-1,JJ(i,j)  )    + W2(i,j)*cfield(II(i,j)+1,ck-1,JJ(i,j)  )    + W3(i,j)*cfield(II(i,j)+a,ck-1,JJ(i,j)-1)    + W4(i,j)*cfield(II(i,j)+a,ck-1,JJ(i,j)+1)) * (1.0-weight)
             else
                
                if(emethod==EConst) then
                   nfield(i,k,j)=evalue
                elseif(emethod==ECopy) then
                   nfield(i,k,j)=(W1(i,j)*cfield(II(i,j)  ,1,JJ(i,j)  )    + W2(i,j)*cfield(II(i,j)+1,1,JJ(i,j)  )    + W3(i,j)*cfield(II(i,j)+a,1,JJ(i,j)-1)    + W4(i,j)*cfield(II(i,j)+a,1,JJ(i,j)+1))
                else 
                   nfield(i,k,j)=evalue * weight + &
                               (W1(i,j)*cfield(II(i,j)  ,1,JJ(i,j)  )    + W2(i,j)*cfield(II(i,j)+1,1,JJ(i,j)  )    + W3(i,j)*cfield(II(i,j)+a,1,JJ(i,j)-1)    + W4(i,j)*cfield(II(i,j)+a,1,JJ(i,j)+1)) * (1.0-weight)
                endif
             endif
          enddo kinterploop
       enddo interploop
    end do bigj

  end subroutine c2n_massikj

  subroutine find_kpres(kpres, eta2, kds,kde, kms,kme)
    
    
    
    integer, intent(out) :: kpres
    real, intent(in) :: eta2(kms:kme)
    integer, intent(in) :: kds,kde, kms,kme

    integer :: k

    k=kde-1
    do while(eta2(k) < 1e-5 .and. eta2(k-1) < 1e-5)
       k=k-1
       if(k<=kds) then
          call wrf_error_fatal3("<stdin>",1474,&
'New NMM interpolation routines do not work in a constant pressure space.')
       endif
    enddo
    kpres=k
  end subroutine find_kpres

  
  
  
  
  

  subroutine n2c_fulldom  (                  &
       deta1,deta2, eta1,eta2, ptop,pdtop,   &
       cfis,cpint,ct,cpd,cq,                 &
       cids, cide, cjds, cjde, ckds, ckde,   &
       cims, cime, cjms, cjme, ckms, ckme,   &
       cits, cite, cjts, cjte, ckts, ckte,   &
       nfis,npint,nt,npd,nq,                 &
       ipos,jpos,                            &

       out_iinfo,out_winfo,                  &
       nids, nide, njds, njde, nkds, nkde,   &
       nims, nime, njms, njme, nkms, nkme,   &
       nits, nite, njts, njte, nkts, nkte, kpres)

    implicit none

    integer, intent(in) :: ipos,jpos

    integer, parameter :: nri=3, nrj=3 

    integer, intent(in):: &
         nids, nide, njds, njde, nkds, nkde,   &
         nims, nime, njms, njme, nkms, nkme,   &
         nits, nite, njts, njte, nkts, nkte,   kpres
    integer, intent(in):: &
         cids, cide, cjds, cjde, ckds, ckde,   &
         cims, cime, cjms, cjme, ckms, ckme,   &
         cits, cite, cjts, cjte, ckts, ckte
    real, intent(out), dimension(cims:cime,cjms:cjme,ckms:ckme) :: cT,cQ,cPINT
    real, intent(inout), dimension(cims:cime,cjms:cjme,1) :: cPD,cFIS

    real, intent(out), dimension(cims:cime,cjms:cjme,ckms:ckme) :: out_winfo
    integer, intent(out), dimension(cims:cime,cjms:cjme,ckms:ckme) :: out_iinfo

    real, intent(in), dimension(nims:nime,njms:njme,nkms:nkme) :: nT,nQ
    real, intent(in), dimension(nims:nime,njms:njme,nkms:nkme) :: nPINT
    real, intent(in), dimension(nims:nime,njms:njme,1) :: nFIS
    real, intent(in), dimension(nims:nime,njms:njme,1) :: nPD

    real, intent(in), dimension(nkms:nkme) :: eta1,eta2,deta1,deta2
    real, intent(in) :: ptop,pdtop

    real, dimension(1,nite-nits+1) :: inFIS,inPD,icFIS,icPD
    real, dimension(nkde-1,nite-nits+1) :: inT0,inQ,icT,icQ, qinfo,winfo
    real, dimension(nkde,nite-nits+1) :: inPINT,icPINT
    integer, dimension(nkde-1,nite-nits+1) :: iinfo
    integer :: nx,nz,k,i,a,j, istart,iend,jstart,jend, ni,nj,jprint,itest,jtest
    character*255 :: message
    logical bad

    nx=min(cide-2,cite)-max(cids+1,cits)+1
    nz=ckde-ckds+1

    jstart=MAX(jpos+1,cjts)
    jend=MIN(jpos+(njde-njds)/nrj-1,cjte)

    bigj: do j=jstart,jend
       nj = (j-jpos)*nrj + 1

       a=mod(j,2)
       istart=MAX(ipos+a,cits)
       iend=MIN(ipos+(nide-nids)/nri-1,cite)
       nx=iend-istart+1

       
       
       qtloop: do k=ckts,ckte-1
          do i=istart,iend
             ni = (i-ipos)*nri + 2 - a

             inT0(k,i-istart+1)=(nT(ni,nj+2,k)  + nT(ni-a  ,nj+1,k)+ nT(ni+1-a,nj+1,k)  + nT(ni-1,nj  ,k)+ nT(ni,nj  ,k)  + nT(ni+1,nj  ,k)  + nT(ni-a  ,nj-1,k)+ nT(ni+1-a,nj-1,k)  +  nT(ni,nj-2,k)   ) / 9
             inQ(k,i-istart+1)=(nQ(ni,nj+2,k)  + nQ(ni-a  ,nj+1,k)+ nQ(ni+1-a,nj+1,k)  + nQ(ni-1,nj  ,k)+ nQ(ni,nj  ,k)  + nQ(ni+1,nj  ,k)  + nQ(ni-a  ,nj-1,k)+ nQ(ni+1-a,nj-1,k)  +  nQ(ni,nj-2,k)   ) / 9
             inPINT(k,i-istart+1)=(nPINT(ni,nj+2,k)  + nPINT(ni-a  ,nj+1,k)+ nPINT(ni+1-a,nj+1,k)  + nPINT(ni-1,nj  ,k)+ nPINT(ni,nj  ,k)  + nPINT(ni+1,nj  ,k)  + nPINT(ni-a  ,nj-1,k)+ nPINT(ni+1-a,nj-1,k)  +  nPINT(ni,nj-2,k)   ) / 9
          enddo
       enddo qtloop

       k=nkte
       loop2d: do i=istart,iend
          ni = (i-ipos)*nri + 2 - a

          inPINT(k,i-istart+1)=(nPINT(ni,nj+2,k)  + nPINT(ni-a  ,nj+1,k)+ nPINT(ni+1-a,nj+1,k)  + nPINT(ni-1,nj  ,k)+ nPINT(ni,nj  ,k)  + nPINT(ni+1,nj  ,k)  + nPINT(ni-a  ,nj-1,k)+ nPINT(ni+1-a,nj-1,k)  +  nPINT(ni,nj-2,k)   ) / 9
          inPD(1,i-istart+1)=(nPD(ni,nj+2,1)  + nPD(ni-a  ,nj+1,1)+ nPD(ni+1-a,nj+1,1)  + nPD(ni-1,nj  ,1)+ nPD(ni,nj  ,1)  + nPD(ni+1,nj  ,1)  + nPD(ni-a  ,nj-1,1)+ nPD(ni+1-a,nj-1,1)  +  nPD(ni,nj-2,1)   ) / 9
          inFIS(1,i-istart+1)=(nFIS(ni,nj+2,1)  + nFIS(ni-a  ,nj+1,1)+ nFIS(ni+1-a,nj+1,1)  + nFIS(ni-1,nj  ,1)+ nFIS(ni,nj  ,1)  + nFIS(ni+1,nj  ,1)  + nFIS(ni-a  ,nj-1,1)+ nFIS(ni+1-a,nj-1,1)  +  nFIS(ni,nj-2,1)   ) / 9

          icPD(1,i-istart+1)=cPD(i,j,1)

          icFIS(1,i-istart+1)=cFIS(i,j,1)
       enddo loop2d

       
       
       call interp_T_PD_Q(nmm_method_linear, nmm_keep_pd, nx,nz, &
            deta1,deta2,eta1,eta2,ptop,pdtop, kpres, &
            inFIS,icFIS, inPINT,icPINT, inT0, icT, inPD,icPD, inQ,icQ, &
            iinfo, winfo)

       

       qtloop2: do k=ckts,max(ckte-1,ckde-1)
          do i=istart,iend
             cT(i,j,k)=icT(k,i-istart+1)
             cQ(i,j,k)=icQ(k,i-istart+1)
          enddo
       enddo qtloop2

       izloop: do k=ckts,max(ckte-1,ckde-1)
          ixloop: do i=istart,iend
             out_iinfo(i,j,k)=iinfo(k,i-istart+1)
             out_winfo(i,j,k)=winfo(k,i-istart+1)
          enddo ixloop
       enddo izloop

       iendloop: do i=istart,iend
          out_iinfo(i,j,nkde)=nkde
          out_winfo(i,j,nkde)=1.0
       end do iendloop

       k=nkte+1
       loop2d2: do i=istart,iend
          cPD(i,j,1)=icPD(1,i-istart+1)
       enddo loop2d2
    end do bigj
  end subroutine n2c_fulldom

  subroutine n2c_fulldom_new (               &
       deta1,deta2, eta1,eta2, ptop,pdtop,   &
       cfis,cpint,ct,cpd,cq,                 &
       cids, cide, cjds, cjde, ckds, ckde,   &
       cims, cime, cjms, cjme, ckms, ckme,   &
       cits, cite, cjts, cjte, ckts, ckte,   &
       nfis,npint,nt,npd,nq,                 &
       ipos,jpos,                            &

       out_iinfo,out_winfo,                  &
       nids, nide, njds, njde, nkds, nkde,   &
       nims, nime, njms, njme, nkms, nkme,   &
       nits, nite, njts, njte, nkts, nkte, kpres)

    implicit none

    integer, intent(in) :: ipos,jpos

    integer, parameter :: nri=3, nrj=3 

    integer, intent(in):: &
         nids, nide, njds, njde, nkds, nkde,   &
         nims, nime, njms, njme, nkms, nkme,   &
         nits, nite, njts, njte, nkts, nkte,   kpres
    integer, intent(in):: &
         cids, cide, cjds, cjde, ckds, ckde,   &
         cims, cime, cjms, cjme, ckms, ckme,   &
         cits, cite, cjts, cjte, ckts, ckte
    real, intent(out), dimension(cims:cime,cjms:cjme,ckms:ckme) :: cT,cQ,cPINT
    real, intent(inout), dimension(cims:cime,cjms:cjme,1) :: cPD,cFIS

    real, intent(out), dimension(cims:cime,cjms:cjme,ckms:ckme) :: out_winfo
    integer, intent(out), dimension(cims:cime,cjms:cjme,ckms:ckme) :: out_iinfo

    real, intent(in), dimension(nims:nime,njms:njme,nkms:nkme) :: nT,nQ
    real, intent(in), dimension(nims:nime,njms:njme,nkms:nkme) :: nPINT
    real, intent(in), dimension(nims:nime,njms:njme,1) :: nFIS
    real, intent(in), dimension(nims:nime,njms:njme,1) :: nPD

    real, intent(in), dimension(nkms:nkme) :: eta1,eta2,deta1,deta2
    real, intent(in) :: ptop,pdtop

    real, dimension(1,nite-nits+1) :: inFIS,inPD,icFIS,icPD
    real, dimension(kpres+1,nite-nits+1) :: inT0,inQ,icT,icQ, qinfo,winfo
    real, dimension(kpres+2,nite-nits+1) :: inPINT,icPINT
    integer, dimension(kpres+1,nite-nits+1) :: iinfo
    integer :: nx,nz,k,i,a,j, istart,iend,jstart,jend, ni,nj,jprint,itest,jtest
    character*255 :: message
    logical bad

    nx=min(cide-2,cite)-max(cids+1,cits)+1
    nz=ckde-ckds+1

    jstart=MAX(jpos+1,cjts)
    jend=MIN(jpos+(njde-njds)/nrj-1,cjte)

    bigj: do j=jstart,jend
       nj = (j-jpos)*nrj + 1

       a=mod(j,2)
       istart=MAX(ipos+a,cits)
       iend=MIN(ipos+(nide-nids)/nri-1,cite)
       nx=iend-istart+1

       
       
       qtloop: do k=ckts,kpres+1
          do i=istart,iend
             ni = (i-ipos)*nri + 2 - a

             inT0(k,i-istart+1)=(nT(ni,nj+2,k)  + nT(ni-a  ,nj+1,k)+ nT(ni+1-a,nj+1,k)  + nT(ni-1,nj  ,k)+ nT(ni,nj  ,k)  + nT(ni+1,nj  ,k)  + nT(ni-a  ,nj-1,k)+ nT(ni+1-a,nj-1,k)  +  nT(ni,nj-2,k)   ) / 9
             inQ(k,i-istart+1)=(nQ(ni,nj+2,k)  + nQ(ni-a  ,nj+1,k)+ nQ(ni+1-a,nj+1,k)  + nQ(ni-1,nj  ,k)+ nQ(ni,nj  ,k)  + nQ(ni+1,nj  ,k)  + nQ(ni-a  ,nj-1,k)+ nQ(ni+1-a,nj-1,k)  +  nQ(ni,nj-2,k)   ) / 9
             inPINT(k,i-istart+1)=(nPINT(ni,nj+2,k)  + nPINT(ni-a  ,nj+1,k)+ nPINT(ni+1-a,nj+1,k)  + nPINT(ni-1,nj  ,k)+ nPINT(ni,nj  ,k)  + nPINT(ni+1,nj  ,k)  + nPINT(ni-a  ,nj-1,k)+ nPINT(ni+1-a,nj-1,k)  +  nPINT(ni,nj-2,k)   ) / 9
          enddo
       enddo qtloop

       k=kpres+1
       loop2d: do i=istart,iend
          ni = (i-ipos)*nri + 2 - a

          inPINT(k,i-istart+1)=(nPINT(ni,nj+2,k)  + nPINT(ni-a  ,nj+1,k)+ nPINT(ni+1-a,nj+1,k)  + nPINT(ni-1,nj  ,k)+ nPINT(ni,nj  ,k)  + nPINT(ni+1,nj  ,k)  + nPINT(ni-a  ,nj-1,k)+ nPINT(ni+1-a,nj-1,k)  +  nPINT(ni,nj-2,k)   ) / 9
          inPD(1,i-istart+1)=(nPD(ni,nj+2,1)  + nPD(ni-a  ,nj+1,1)+ nPD(ni+1-a,nj+1,1)  + nPD(ni-1,nj  ,1)+ nPD(ni,nj  ,1)  + nPD(ni+1,nj  ,1)  + nPD(ni-a  ,nj-1,1)+ nPD(ni+1-a,nj-1,1)  +  nPD(ni,nj-2,1)   ) / 9
          inFIS(1,i-istart+1)=(nFIS(ni,nj+2,1)  + nFIS(ni-a  ,nj+1,1)+ nFIS(ni+1-a,nj+1,1)  + nFIS(ni-1,nj  ,1)+ nFIS(ni,nj  ,1)  + nFIS(ni+1,nj  ,1)  + nFIS(ni-a  ,nj-1,1)+ nFIS(ni+1-a,nj-1,1)  +  nFIS(ni,nj-2,1)   ) / 9

          icPD(1,i-istart+1)=cPD(i,j,1)

          icFIS(1,i-istart+1)=cFIS(i,j,1)
       enddo loop2d

       
       
       call interp_T_PD_Q_kpres(nmm_method_linear, nmm_keep_pd, nx,nz, &
            deta1,deta2,eta1,eta2,ptop,pdtop, kpres, kpres+2, &
            inFIS,icFIS, inPINT,icPINT, inT0, icT, inPD,icPD, inQ,icQ, &
            iinfo, winfo)

       

       qtloop2: do k=ckts,kpres+1
          do i=istart,iend
             cT(i,j,k)=icT(k,i-istart+1)
             cQ(i,j,k)=icQ(k,i-istart+1)
          enddo
       enddo qtloop2

       izloop: do k=ckts,kpres+1
          ixloop: do i=istart,iend
             out_iinfo(i,j,k)=iinfo(k,i-istart+1)
             out_winfo(i,j,k)=winfo(k,i-istart+1)
          enddo ixloop
       enddo izloop

       k=nkte+1
       loop2d2: do i=istart,iend
          cPD(i,j,1)=icPD(1,i-istart+1)
       enddo loop2d2
    end do bigj

    kcopy: do k=kpres+1,ckde-1
       jcopy: do j=jstart,jend
          nj = (j-jpos)*nrj + 1
          
          a=mod(j,2)
          istart=MAX(ipos+a,cits)
          iend=MIN(ipos+(nide-nids)/nri-1,cite)
          icopy: do i=istart,iend
             ni = (i-ipos)*nri + 2 - a
             cT(i,j,k)=(nT(ni,nj+2,k)  + nT(ni-a  ,nj+1,k)+ nT(ni+1-a,nj+1,k) + nT(ni-1,nj  ,k)  + nT(ni,nj  ,k)  + nT(ni+1,nj  ,k) + nT(ni-a  ,nj-1,k)+ nT(ni+1-a,nj-1,k) +  nT(ni,nj-2,k)   ) / 9
             cQ(i,j,k)=(nQ(ni,nj+2,k)  + nQ(ni-a  ,nj+1,k)+ nQ(ni+1-a,nj+1,k) + nQ(ni-1,nj  ,k)  + nQ(ni,nj  ,k)  + nQ(ni+1,nj  ,k) + nQ(ni-a  ,nj-1,k)+ nQ(ni+1-a,nj-1,k) +  nQ(ni,nj-2,k)   ) / 9
             out_iinfo(i,j,k)=k
             out_winfo(i,j,k)=1.0
          enddo icopy
          if(k==ckde-1) then
             icopy2: do i=istart,iend
                out_iinfo(i,j,nkde)=nkde
                out_winfo(i,j,nkde)=1.0
             enddo icopy2
          endif
       end do jcopy
    end do kcopy
  end subroutine n2c_fulldom_new

  subroutine c2b_fulldom  (II,JJ,W1,W2,W3,W4,&
       deta1,deta2, eta1,eta2, ptop,pdtop,   &
       cfis,cpint,ct,cpd,cq,    nfis,        &
       cims, cime, cjms, cjme, ckms, ckme,   &
       nids, nide, njds, njde, nkds, nkde,   &
       nims, nime, njms, njme, nkms, nkme,   &
       nits, nite, njts, njte, nkts, nkte,   &
       kpres,                                &
       ibxs,    ibxe,    ibys,    ibye,      &
       wbxs,    wbxe,    wbys,    wbye,      &
       pdbxs,   pdbxe,   pdbys,   pdbye,     &
       tbxs,    tbxe,    tbys,    tbye,      &
       qbxs,    qbxe,    qbys,    qbye)
    implicit none
    integer, intent(in):: &
         cims, cime, cjms, cjme, ckms, ckme,   &
         nids, nide, njds, njde, nkds, nkde,   &
         nims, nime, njms, njme, nkms, nkme,   &
         nits, nite, njts, njte, nkts, nkte

    integer, parameter :: bdyw=1

    
    real, intent(in), dimension(nims:nime,njms:njme) :: W1,W2,W3,W4
    integer, intent(in), dimension(nims:nime,njms:njme) :: II,JJ
    real, intent(in), dimension(nkms:nkme) :: eta1,eta2,deta1,deta2
    real, intent(in) :: ptop,pdtop
    integer, intent(in) :: kpres

    
    real, intent(in), dimension(cims:cime,cjms:cjme,ckms:ckme) :: cT,cQ,cPINT
    real, intent(in), dimension(cims:cime,cjms:cjme,1) :: cPD,cFIS

    
    real, intent(in), dimension(nims:nime,njms:njme,1) :: nFIS

    
    real,dimension(nims:nime,nkms:nkme,bdyw) :: tbys,tbye,qbys,qbye
    real,dimension(njms:njme,nkms:nkme,bdyw) :: tbxs,tbxe,qbxs,qbxe
    real,dimension(nims:nime,1,bdyw) :: pdbys,pdbye
    real,dimension(njms:njme,1,bdyw) :: pdbxs,pdbxe

    
    real,dimension(nims:nime,nkms:nkme,bdyw) :: wbys,wbye
    real,dimension(njms:njme,nkms:nkme,bdyw) :: wbxs,wbxe
    integer,dimension(nims:nime,nkms:nkme,bdyw) :: ibys,ibye
    integer,dimension(njms:njme,nkms:nkme,bdyw) :: ibxs,ibxe

    integer :: i,j,k,a,b,nx,nz,used,j1,j2,used1

    real, dimension(1,2*(nite-nits+5)+2*(njte-njts+5)) :: inFIS,inPD,icFIS,icPD
    real, dimension(nkde-1,2*(nite-nits+5)+2*(njte-njts+5)) :: inT,inQ,icT,icQ,winfo
    integer, dimension(nkde-1,2*(nite-nits+5)+2*(njte-njts+5)) :: iinfo
    real, dimension(nkde,2*(nite-nits+5)+2*(njte-njts+5)) :: inPINT,icPINT

    nx=min(nide-1,nite)-max(nids,nits)+1
    nz=nkde-nkds+1

    j1=max(njts-1,njds)
    if(mod(j1,2)/=1)   j1=j1+1

    j2=min(njte+1,njde-1)
    if(mod(j2,2)/=1)   j2=j2-1

    used=0
    bdyloop: do b=1,4
       if_xbdy: if(b==1 .or. b==2) then
          if(b==1) then
             if(nits/=1) cycle bdyloop
             i=1
          endif
          if(b==2) then
             if(nite<nide-1) cycle bdyloop
             i=nide-1
          endif
          do j=j1,j2,2
             a=1-mod(JJ(i,j),2)
             used=used+1
             do k=nkts,nkte-1
                icT(k,used)=W1(i,j)*cT(II(i,j)  ,JJ(i,j)  ,k)    +W2(i,j)*cT(II(i,j)+1,JJ(i,j)  ,k)    +W3(i,j)*cT(II(i,j)+a,JJ(i,j)-1,k)    +W4(i,j)*cT(II(i,j)+a,JJ(i,j)+1,k)
                icQ(k,used)=W1(i,j)*cQ(II(i,j)  ,JJ(i,j)  ,k)    +W2(i,j)*cQ(II(i,j)+1,JJ(i,j)  ,k)    +W3(i,j)*cQ(II(i,j)+a,JJ(i,j)-1,k)    +W4(i,j)*cQ(II(i,j)+a,JJ(i,j)+1,k)
                icPINT(k,used)=W1(i,j)*cPINT(II(i,j)  ,JJ(i,j)  ,k)    +W2(i,j)*cPINT(II(i,j)+1,JJ(i,j)  ,k)    +W3(i,j)*cPINT(II(i,j)+a,JJ(i,j)-1,k)    +W4(i,j)*cPINT(II(i,j)+a,JJ(i,j)+1,k)
             enddo
                
             k=nkte
             a=1-mod(JJ(i,j),2)

             icPINT(k,used)=W1(i,j)*cPINT(II(i,j)  ,JJ(i,j)  ,k)    +W2(i,j)*cPINT(II(i,j)+1,JJ(i,j)  ,k)    +W3(i,j)*cPINT(II(i,j)+a,JJ(i,j)-1,k)    +W4(i,j)*cPINT(II(i,j)+a,JJ(i,j)+1,k)
             icPD(1,used)=W1(i,j)*cPD(II(i,j)  ,JJ(i,j)  ,1)    +W2(i,j)*cPD(II(i,j)+1,JJ(i,j)  ,1)    +W3(i,j)*cPD(II(i,j)+a,JJ(i,j)-1,1)    +W4(i,j)*cPD(II(i,j)+a,JJ(i,j)+1,1)
             icFIS(1,used)=W1(i,j)*cFIS(II(i,j)  ,JJ(i,j)  ,1)    +W2(i,j)*cFIS(II(i,j)+1,JJ(i,j)  ,1)    +W3(i,j)*cFIS(II(i,j)+a,JJ(i,j)-1,1)    +W4(i,j)*cFIS(II(i,j)+a,JJ(i,j)+1,1)

             inFIS(1,used)=nFIS(i,j,1)

          enddo
       endif if_xbdy
       if_ybdy: if(b==3 .or. b==4) then
          if(b==3) then
             if(njts/=1) cycle bdyloop
             j=1
          endif
          if(b==4) then
             if(njte<njde-1) cycle bdyloop
             j=njde-1
          endif
          do i=max(nits-1,nids),min(nite+1,nide-1)
             used=used+1
             do k=nkts,nkte-1
                a=1-mod(JJ(i,j),2)
                icT(k,used)=W1(i,j)*cT(II(i,j)  ,JJ(i,j)  ,k)    +W2(i,j)*cT(II(i,j)+1,JJ(i,j)  ,k)    +W3(i,j)*cT(II(i,j)+a,JJ(i,j)-1,k)    +W4(i,j)*cT(II(i,j)+a,JJ(i,j)+1,k)
                icQ(k,used)=W1(i,j)*cQ(II(i,j)  ,JJ(i,j)  ,k)    +W2(i,j)*cQ(II(i,j)+1,JJ(i,j)  ,k)    +W3(i,j)*cQ(II(i,j)+a,JJ(i,j)-1,k)    +W4(i,j)*cQ(II(i,j)+a,JJ(i,j)+1,k)
                icPINT(k,used)=W1(i,j)*cPINT(II(i,j)  ,JJ(i,j)  ,k)    +W2(i,j)*cPINT(II(i,j)+1,JJ(i,j)  ,k)    +W3(i,j)*cPINT(II(i,j)+a,JJ(i,j)-1,k)    +W4(i,j)*cPINT(II(i,j)+a,JJ(i,j)+1,k)
             enddo
                
             k=nkte
             a=1-mod(JJ(i,j),2)

             icPINT(k,used)=W1(i,j)*cPINT(II(i,j)  ,JJ(i,j)  ,k)    +W2(i,j)*cPINT(II(i,j)+1,JJ(i,j)  ,k)    +W3(i,j)*cPINT(II(i,j)+a,JJ(i,j)-1,k)    +W4(i,j)*cPINT(II(i,j)+a,JJ(i,j)+1,k)
             icPD(1,used)=W1(i,j)*cPD(II(i,j)  ,JJ(i,j)  ,1)    +W2(i,j)*cPD(II(i,j)+1,JJ(i,j)  ,1)    +W3(i,j)*cPD(II(i,j)+a,JJ(i,j)-1,1)    +W4(i,j)*cPD(II(i,j)+a,JJ(i,j)+1,1)
             icFIS(1,used)=W1(i,j)*cFIS(II(i,j)  ,JJ(i,j)  ,1)    +W2(i,j)*cFIS(II(i,j)+1,JJ(i,j)  ,1)    +W3(i,j)*cFIS(II(i,j)+a,JJ(i,j)-1,1)    +W4(i,j)*cFIS(II(i,j)+a,JJ(i,j)+1,1)

             inFIS(1,used)=nFIS(i,j,1)
          enddo
       endif if_ybdy
    enddo bdyloop

    if(used==0) then
       
       return
    endif

    call interp_T_PD_Q_kpres(nmm_method_linear, nmm_interp_pd, used,nz, &
         deta1,deta2,eta1,eta2,ptop,pdtop, kpres, nz, &
         icFIS,inFIS, icPINT,inPINT, icT, inT, icPD,inPD, icQ,inQ, &
         iinfo, winfo)

    used1=used
    used=0

    if_bxs: if(nits==1) then
       i=1
       do j=j1,j2,2
          used=used+1
          do k=nkts,nkte-1
             tbxs(j,k,1)=inT(k,used)
             qbxs(j,k,1)=inQ(k,used)
             ibxs(j,k,1)=iinfo(k,used)
             wbxs(j,k,1)=winfo(k,used)
          enddo
          ibxs(j,nkde,1)=nkde
          wbxs(j,nkde,1)=1.0
          pdbxs(j,1,1)=inPD(1,used)
       enddo
    endif if_bxs

    if_bxe: if(nite>=nide-1) then
       i=nide-1
       do j=j1,j2,2
          used=used+1
          do k=nkts,nkte-1
             tbxe(j,k,1)=inT(k,used)
             qbxe(j,k,1)=inQ(k,used)
             ibxe(j,k,1)=iinfo(k,used)
             wbxe(j,k,1)=winfo(k,used)
          enddo
          ibxe(j,nkde,1)=nkde
          wbxe(j,nkde,1)=1.0
          pdbxe(j,1,1)=inPD(1,used)
       enddo
    endif if_bxe

    if_bys: if(njts==1) then
       j=1
       do i=max(nits-1,nids),min(nite+1,nide-1)
          used=used+1
          do k=nkts,nkte-1
             tbys(i,k,1)=inT(k,used)
             qbys(i,k,1)=inQ(k,used)
             ibys(i,k,1)=iinfo(k,used)
             wbys(i,k,1)=winfo(k,used)
          enddo
          ibys(i,nkde,1)=nkde
          wbys(i,nkde,1)=1.0
          pdbys(i,1,1)=inPD(1,used)
       enddo
    endif if_bys

    if_bye: if(njte>=njde-1) then
       j=njde-1
       do i=max(nits-1,nids),min(nite+1,nide-1)
          used=used+1
          do k=nkts,nkte-1
             tbye(i,k,1)=inT(k,used)
             qbye(i,k,1)=inQ(k,used)
             ibye(i,k,1)=iinfo(k,used)
             wbye(i,k,1)=winfo(k,used)
          enddo
          ibye(i,nkde,1)=nkde
          wbye(i,nkde,1)=1.0
          pdbye(i,1,1)=inPD(1,used)
       enddo
    endif if_bye

    if(used/=used1) then
       call wrf_error_fatal3("<stdin>",1956,&
'Number of input and output points does not match.')
    endif

  end subroutine c2b_fulldom

  

  subroutine c2b_fulldom_new  (II,JJ,W1,W2,W3,W4,&
       deta1,deta2, eta1,eta2, ptop,pdtop,   &
       cfis,cpint,ct,cpd,cq,    nfis,        &
       cims, cime, cjms, cjme, ckms, ckme,   &
       nids, nide, njds, njde, nkds, nkde,   &
       nims, nime, njms, njme, nkms, nkme,   &
       nits, nite, njts, njte, nkts, nkte,   &
       kpres,                                &
       ibxs,    ibxe,    ibys,    ibye,      &
       wbxs,    wbxe,    wbys,    wbye,      &
       pdbxs,   pdbxe,   pdbys,   pdbye,     &
       tbxs,    tbxe,    tbys,    tbye,      &
       qbxs,    qbxe,    qbys,    qbye)
    implicit none
    integer, intent(in):: &
         cims, cime, cjms, cjme, ckms, ckme,   &
         nids, nide, njds, njde, nkds, nkde,   &
         nims, nime, njms, njme, nkms, nkme,   &
         nits, nite, njts, njte, nkts, nkte

    integer, parameter :: bdyw=1

    
    real, intent(in), dimension(nims:nime,njms:njme) :: W1,W2,W3,W4
    integer, intent(in), dimension(nims:nime,njms:njme) :: II,JJ
    real, intent(in), dimension(nkms:nkme) :: eta1,eta2,deta1,deta2
    real, intent(in) :: ptop,pdtop
    integer, intent(in) :: kpres

    
    real, intent(in), dimension(cims:cime,cjms:cjme,ckms:ckme) :: cT,cQ,cPINT
    real, intent(in), dimension(cims:cime,cjms:cjme,1) :: cPD,cFIS

    
    real, intent(in), dimension(nims:nime,njms:njme,1) :: nFIS

    
    real,dimension(nims:nime,nkms:nkme,bdyw) :: tbys,tbye,qbys,qbye
    real,dimension(njms:njme,nkms:nkme,bdyw) :: tbxs,tbxe,qbxs,qbxe
    real,dimension(nims:nime,1,bdyw) :: pdbys,pdbye
    real,dimension(njms:njme,1,bdyw) :: pdbxs,pdbxe

    
    real,dimension(nims:nime,nkms:nkme,bdyw) :: wbys,wbye
    real,dimension(njms:njme,nkms:nkme,bdyw) :: wbxs,wbxe
    integer,dimension(nims:nime,nkms:nkme,bdyw) :: ibys,ibye
    integer,dimension(njms:njme,nkms:nkme,bdyw) :: ibxs,ibxe

    integer :: i,j,k,a,b,nx,nz,used,j1,j2,used1

    real, dimension(1,2*(nite-nits+5)+2*(njte-njts+5)) :: inFIS,inPD,icFIS,icPD
    real, dimension(kpres+1,2*(nite-nits+5)+2*(njte-njts+5)) :: inT,inQ,icT,icQ,winfo
    integer, dimension(kpres+1,2*(nite-nits+5)+2*(njte-njts+5)) :: iinfo
    real, dimension(kpres+2,2*(nite-nits+5)+2*(njte-njts+5)) :: inPINT,icPINT

    nx=min(nide-1,nite)-max(nids,nits)+1
    nz=nkde-nkds+1

    j1=max(njts-1,njds)
    if(mod(j1,2)/=1)   j1=j1+1

    j2=min(njte+1,njde-1)
    if(mod(j2,2)/=1)   j2=j2-1

    used=0
    bdyloop: do b=1,4
       if_xbdy: if(b==1 .or. b==2) then
          if(b==1) then
             if(nits/=1) cycle bdyloop
             i=1
          endif
          if(b==2) then
             if(nite<nide-1) cycle bdyloop
             i=nide-1
          endif
          do j=j1,j2,2
             used=used+1
             do k=nkts,kpres+1
                a=1-mod(JJ(i,j),2)
                icT(k,used)=W1(i,j)*cT(II(i,j)  ,JJ(i,j)  ,k)    +W2(i,j)*cT(II(i,j)+1,JJ(i,j)  ,k)    +W3(i,j)*cT(II(i,j)+a,JJ(i,j)-1,k)    +W4(i,j)*cT(II(i,j)+a,JJ(i,j)+1,k)
                icQ(k,used)=W1(i,j)*cQ(II(i,j)  ,JJ(i,j)  ,k)    +W2(i,j)*cQ(II(i,j)+1,JJ(i,j)  ,k)    +W3(i,j)*cQ(II(i,j)+a,JJ(i,j)-1,k)    +W4(i,j)*cQ(II(i,j)+a,JJ(i,j)+1,k)
                icPINT(k,used)=W1(i,j)*cPINT(II(i,j)  ,JJ(i,j)  ,k)    +W2(i,j)*cPINT(II(i,j)+1,JJ(i,j)  ,k)    +W3(i,j)*cPINT(II(i,j)+a,JJ(i,j)-1,k)    +W4(i,j)*cPINT(II(i,j)+a,JJ(i,j)+1,k)
             enddo
                
             k=kpres+2
             a=1-mod(JJ(i,j),2)

             icPINT(k,used)=W1(i,j)*cPINT(II(i,j)  ,JJ(i,j)  ,k)    +W2(i,j)*cPINT(II(i,j)+1,JJ(i,j)  ,k)    +W3(i,j)*cPINT(II(i,j)+a,JJ(i,j)-1,k)    +W4(i,j)*cPINT(II(i,j)+a,JJ(i,j)+1,k)
             icPD(1,used)=W1(i,j)*cPD(II(i,j)  ,JJ(i,j)  ,1)    +W2(i,j)*cPD(II(i,j)+1,JJ(i,j)  ,1)    +W3(i,j)*cPD(II(i,j)+a,JJ(i,j)-1,1)    +W4(i,j)*cPD(II(i,j)+a,JJ(i,j)+1,1)
             icFIS(1,used)=W1(i,j)*cFIS(II(i,j)  ,JJ(i,j)  ,1)    +W2(i,j)*cFIS(II(i,j)+1,JJ(i,j)  ,1)    +W3(i,j)*cFIS(II(i,j)+a,JJ(i,j)-1,1)    +W4(i,j)*cFIS(II(i,j)+a,JJ(i,j)+1,1)

             inFIS(1,used)=nFIS(i,j,1)

          enddo
       endif if_xbdy
       if_ybdy: if(b==3 .or. b==4) then
          if(b==3) then
             if(njts/=1) cycle bdyloop
             j=1
          endif
          if(b==4) then
             if(njte<njde-1) cycle bdyloop
             j=njde-1
          endif
          do i=max(nits-1,nids),min(nite+1,nide-1)
             used=used+1
             do k=nkts,kpres+1
                a=1-mod(JJ(i,j),2)
                icT(k,used)=W1(i,j)*cT(II(i,j)  ,JJ(i,j)  ,k)    +W2(i,j)*cT(II(i,j)+1,JJ(i,j)  ,k)    +W3(i,j)*cT(II(i,j)+a,JJ(i,j)-1,k)    +W4(i,j)*cT(II(i,j)+a,JJ(i,j)+1,k)
                icQ(k,used)=W1(i,j)*cQ(II(i,j)  ,JJ(i,j)  ,k)    +W2(i,j)*cQ(II(i,j)+1,JJ(i,j)  ,k)    +W3(i,j)*cQ(II(i,j)+a,JJ(i,j)-1,k)    +W4(i,j)*cQ(II(i,j)+a,JJ(i,j)+1,k)
                icPINT(k,used)=W1(i,j)*cPINT(II(i,j)  ,JJ(i,j)  ,k)    +W2(i,j)*cPINT(II(i,j)+1,JJ(i,j)  ,k)    +W3(i,j)*cPINT(II(i,j)+a,JJ(i,j)-1,k)    +W4(i,j)*cPINT(II(i,j)+a,JJ(i,j)+1,k)
             enddo
                
             k=kpres+2
             a=1-mod(JJ(i,j),2)

             icPINT(k,used)=W1(i,j)*cPINT(II(i,j)  ,JJ(i,j)  ,k)    +W2(i,j)*cPINT(II(i,j)+1,JJ(i,j)  ,k)    +W3(i,j)*cPINT(II(i,j)+a,JJ(i,j)-1,k)    +W4(i,j)*cPINT(II(i,j)+a,JJ(i,j)+1,k)
             icPD(1,used)=W1(i,j)*cPD(II(i,j)  ,JJ(i,j)  ,1)    +W2(i,j)*cPD(II(i,j)+1,JJ(i,j)  ,1)    +W3(i,j)*cPD(II(i,j)+a,JJ(i,j)-1,1)    +W4(i,j)*cPD(II(i,j)+a,JJ(i,j)+1,1)
             icFIS(1,used)=W1(i,j)*cFIS(II(i,j)  ,JJ(i,j)  ,1)    +W2(i,j)*cFIS(II(i,j)+1,JJ(i,j)  ,1)    +W3(i,j)*cFIS(II(i,j)+a,JJ(i,j)-1,1)    +W4(i,j)*cFIS(II(i,j)+a,JJ(i,j)+1,1)

             inFIS(1,used)=nFIS(i,j,1)
          enddo
       endif if_ybdy
    enddo bdyloop

    if(used==0) then
       
       return
    endif

    call interp_T_PD_Q_kpres(nmm_method_linear, nmm_interp_pd, used,nz, &
         deta1,deta2,eta1,eta2,ptop,pdtop, kpres, kpres+2, &
         icFIS,inFIS, icPINT,inPINT, icT, inT, icPD,inPD, icQ,inQ, &
         iinfo, winfo)

    used1=used
    used=0

    if_bxs: if(nits==1) then
       i=1
       do j=j1,j2,2
          used=used+1
          do k=nkts,kpres
             tbxs(j,k,1)=inT(k,used)
             qbxs(j,k,1)=inQ(k,used)
             ibxs(j,k,1)=iinfo(k,used)
             wbxs(j,k,1)=winfo(k,used)
          enddo
          ibxs(j,nkde,1)=nkde
          wbxs(j,nkde,1)=1.0
          pdbxs(j,1,1)=inPD(1,used)
       enddo
       do k=kpres+1,nkde-1
          do j=j1,j2,2
             a=1-mod(JJ(i,j),2)
             tbxs(j,k,1)=(W1(i,j)*cT(II(i,j)  ,JJ(i,j)  ,k)    + W2(i,j)*cT(II(i,j)+1,JJ(i,j)  ,k)    + W3(i,j)*cT(II(i,j)+a,JJ(i,j)-1,k)    + W4(i,j)*cT(II(i,j)+a,JJ(i,j)+1,k))
             qbxs(j,k,1)=(W1(i,j)*cQ(II(i,j)  ,JJ(i,j)  ,k)    + W2(i,j)*cQ(II(i,j)+1,JJ(i,j)  ,k)    + W3(i,j)*cQ(II(i,j)+a,JJ(i,j)-1,k)    + W4(i,j)*cQ(II(i,j)+a,JJ(i,j)+1,k))
             ibxs(j,k,1)=k
             wbxs(j,k,1)=1.0
          enddo
       enddo
    endif if_bxs

    if_bxe: if(nite>=nide-1) then
       i=nide-1
       do j=j1,j2,2
          used=used+1
          do k=nkts,kpres
             tbxe(j,k,1)=inT(k,used)
             qbxe(j,k,1)=inQ(k,used)
             ibxe(j,k,1)=iinfo(k,used)
             wbxe(j,k,1)=winfo(k,used)
          enddo
          ibxe(j,nkde,1)=nkde
          wbxe(j,nkde,1)=1.0
          pdbxe(j,1,1)=inPD(1,used)
       enddo
       do k=kpres+1,nkde-1
          do j=j1,j2,2
             a=1-mod(JJ(i,j),2)
             tbxe(j,k,1)=(W1(i,j)*cT(II(i,j)  ,JJ(i,j)  ,k)    + W2(i,j)*cT(II(i,j)+1,JJ(i,j)  ,k)    + W3(i,j)*cT(II(i,j)+a,JJ(i,j)-1,k)    + W4(i,j)*cT(II(i,j)+a,JJ(i,j)+1,k))
             qbxe(j,k,1)=(W1(i,j)*cQ(II(i,j)  ,JJ(i,j)  ,k)    + W2(i,j)*cQ(II(i,j)+1,JJ(i,j)  ,k)    + W3(i,j)*cQ(II(i,j)+a,JJ(i,j)-1,k)    + W4(i,j)*cQ(II(i,j)+a,JJ(i,j)+1,k))
             ibxe(j,k,1)=k
             wbxe(j,k,1)=1.0
          enddo
       enddo
    endif if_bxe

    if_bys: if(njts==1) then
       j=1
       do i=max(nits-1,nids),min(nite+1,nide-1)
          used=used+1
          do k=nkts,kpres
             tbys(i,k,1)=inT(k,used)
             qbys(i,k,1)=inQ(k,used)
             ibys(i,k,1)=iinfo(k,used)
             wbys(i,k,1)=winfo(k,used)
          enddo
          ibys(i,nkde,1)=nkde
          wbys(i,nkde,1)=1.0
          pdbys(i,1,1)=inPD(1,used)
       enddo
       do k=kpres+1,nkde-1
          do i=max(nits-1,nids),min(nite+1,nide-1)
             a=1-mod(JJ(i,j),2)
             tbys(i,k,1)=(W1(i,j)*cT(II(i,j)  ,JJ(i,j)  ,k)    + W2(i,j)*cT(II(i,j)+1,JJ(i,j)  ,k)    + W3(i,j)*cT(II(i,j)+a,JJ(i,j)-1,k)    + W4(i,j)*cT(II(i,j)+a,JJ(i,j)+1,k))
             qbys(i,k,1)=(W1(i,j)*cQ(II(i,j)  ,JJ(i,j)  ,k)    + W2(i,j)*cQ(II(i,j)+1,JJ(i,j)  ,k)    + W3(i,j)*cQ(II(i,j)+a,JJ(i,j)-1,k)    + W4(i,j)*cQ(II(i,j)+a,JJ(i,j)+1,k))
             ibys(i,k,1)=k
             wbys(i,k,1)=1.0
          enddo
       enddo
    endif if_bys

    if_bye: if(njte>=njde-1) then
       j=njde-1
       do i=max(nits-1,nids),min(nite+1,nide-1)
          used=used+1
          do k=nkts,kpres
             tbye(i,k,1)=inT(k,used)
             qbye(i,k,1)=inQ(k,used)
             ibye(i,k,1)=iinfo(k,used)
             wbye(i,k,1)=winfo(k,used)
          enddo
          ibye(i,nkde,1)=nkde
          wbye(i,nkde,1)=1.0
          pdbye(i,1,1)=inPD(1,used)
       enddo
       do k=kpres+1,nkde-1
          do i=max(nits-1,nids),min(nite+1,nide-1)
             a=1-mod(JJ(i,j),2)
             tbye(i,k,1)=(W1(i,j)*cT(II(i,j)  ,JJ(i,j)  ,k)    + W2(i,j)*cT(II(i,j)+1,JJ(i,j)  ,k)    + W3(i,j)*cT(II(i,j)+a,JJ(i,j)-1,k)    + W4(i,j)*cT(II(i,j)+a,JJ(i,j)+1,k))
             qbye(i,k,1)=(W1(i,j)*cQ(II(i,j)  ,JJ(i,j)  ,k)    + W2(i,j)*cQ(II(i,j)+1,JJ(i,j)  ,k)    + W3(i,j)*cQ(II(i,j)+a,JJ(i,j)-1,k)    + W4(i,j)*cQ(II(i,j)+a,JJ(i,j)+1,k))
             ibye(i,k,1)=k
             wbye(i,k,1)=1.0
          enddo
       enddo
    endif if_bye

    if(used/=used1) then
       call wrf_error_fatal3("<stdin>",2203,&
'Number of input and output points does not match.')
    endif

  end subroutine c2b_fulldom_new

  

  subroutine c2n_fulldom  (II,JJ,W1,W2,W3,W4,&
       deta1,deta2, eta1,eta2, ptop,pdtop,   &
       cfis,cpint,ct,cpd,cq,                 &
       cims, cime, cjms, cjme, ckms, ckme,   &
       nfis,npint,nt,npd,nq,                 &
       out_iinfo,out_winfo,imask,&
       nids, nide, njds, njde, nkds, nkde,   &
       nims, nime, njms, njme, nkms, nkme,   &
       nits, nite, njts, njte, nkts, nkte, kpres)
    implicit none
    integer, intent(in):: cims, cime, cjms, cjme, ckms, ckme,   &
         nids, nide, njds, njde, nkds, nkde,   &
         nims, nime, njms, njme, nkms, nkme,   &
         nits, nite, njts, njte, nkts, nkte, kpres
    real, intent(in), dimension(cims:cime,cjms:cjme,ckms:ckme) :: cT,cQ,cPINT
    real, intent(in), dimension(cims:cime,cjms:cjme,1) :: cPD,cFIS

    real, intent(out), dimension(nims:nime,njms:njme,nkms:nkme) :: out_winfo
    integer, intent(out), dimension(nims:nime,njms:njme,nkms:nkme) :: out_iinfo

    real, intent(out), dimension(nims:nime,njms:njme,nkms:nkme) :: nT,nQ
    real, intent(in), dimension(nims:nime,njms:njme,nkms:nkme) :: nPINT
    real, intent(in), dimension(nims:nime,njms:njme,1) :: nFIS
    real, intent(inout), dimension(nims:nime,njms:njme,1) :: nPD
    integer, intent(in), dimension(nims:nime,njms:njme) :: imask

    real, intent(in), dimension(nims:nime,njms:njme) :: &
         W1,W2,W3,W4
    integer, intent(in), dimension(nims:nime,njms:njme) :: II,JJ

    real, intent(in), dimension(nkms:nkme) :: eta1,eta2,deta1,deta2
    real, intent(in) :: ptop,pdtop

    real, dimension(1,nite-nits+1) :: inFIS,inPD,icFIS,icPD
    real, dimension(nkde-1,nite-nits+1) :: inT,inQ,icT,icQ,winfo
    integer, dimension(nkde-1,nite-nits+1) :: iinfo
    real, dimension(nkde,nite-nits+1) :: inPINT,icPINT

    real :: pdcheck
    integer :: i,j,k,a, nx,nz,used
    logical :: badbad

    nx=min(nide-1,nite)-max(nids,nits)+1
    nz=nkde-nkds+1

    bigj: do j=max(njds,njts),min(njde-1,njte)
       
       
       used=0
       iloop1: do i=max(nids,nits),min(nide-1,nite)
          if(imask(i,j)/=0) cycle iloop1
          used=used+1

          qtloop: do k=nkts,nkte-1
             a=1-mod(JJ(i,j),2)
             icT(k,used)=W1(i,j)*cT(II(i,j)  ,JJ(i,j)  ,k)    +W2(i,j)*cT(II(i,j)+1,JJ(i,j)  ,k)    +W3(i,j)*cT(II(i,j)+a,JJ(i,j)-1,k)    +W4(i,j)*cT(II(i,j)+a,JJ(i,j)+1,k)
             icQ(k,used)=W1(i,j)*cQ(II(i,j)  ,JJ(i,j)  ,k)    +W2(i,j)*cQ(II(i,j)+1,JJ(i,j)  ,k)    +W3(i,j)*cQ(II(i,j)+a,JJ(i,j)-1,k)    +W4(i,j)*cQ(II(i,j)+a,JJ(i,j)+1,k)
             icPINT(k,used)=W1(i,j)*cPINT(II(i,j)  ,JJ(i,j)  ,k)    +W2(i,j)*cPINT(II(i,j)+1,JJ(i,j)  ,k)    +W3(i,j)*cPINT(II(i,j)+a,JJ(i,j)-1,k)    +W4(i,j)*cPINT(II(i,j)+a,JJ(i,j)+1,k)
          enddo qtloop

          k=nkte
          a=1-mod(JJ(i,j),2)

          icPINT(k,used)=W1(i,j)*cPINT(II(i,j)  ,JJ(i,j)  ,k)    +W2(i,j)*cPINT(II(i,j)+1,JJ(i,j)  ,k)    +W3(i,j)*cPINT(II(i,j)+a,JJ(i,j)-1,k)    +W4(i,j)*cPINT(II(i,j)+a,JJ(i,j)+1,k)
          icPD(1,used)=W1(i,j)*cPD(II(i,j)  ,JJ(i,j)  ,1)    +W2(i,j)*cPD(II(i,j)+1,JJ(i,j)  ,1)    +W3(i,j)*cPD(II(i,j)+a,JJ(i,j)-1,1)    +W4(i,j)*cPD(II(i,j)+a,JJ(i,j)+1,1)
          icFIS(1,used)=W1(i,j)*cFIS(II(i,j)  ,JJ(i,j)  ,1)    +W2(i,j)*cFIS(II(i,j)+1,JJ(i,j)  ,1)    +W3(i,j)*cFIS(II(i,j)+a,JJ(i,j)-1,1)    +W4(i,j)*cFIS(II(i,j)+a,JJ(i,j)+1,1)


 
 
 
 
 
          inPD(1,used)=nPD(i,j,1)
          inFIS(1,used)=nFIS(i,j,1)
       enddo iloop1

       
       
       
       if(used==0) then
          
          
          cycle bigj
       else
          call interp_T_PD_Q(nmm_method_linear, nmm_interp_pd, used,nz, &
               deta1,deta2,eta1,eta2,ptop,pdtop,kpres, &
               icFIS,inFIS, icPINT,inPINT, icT, inT, icPD,inPD, icQ,inQ, &
               iinfo, winfo)
       endif

       
       used=0
       iloop2: do i=max(nids,nits),min(nide-1,nite)
          if(imask(i,j)/=0) cycle iloop2
          used=used+1

          qtloop2: do k=nkts,nkte-1
             nT(i,j,k)=inT(k,used)
             nQ(i,j,k)=inQ(k,used)
             nQ(i,j,k)=inQ(k,used)
          enddo qtloop2

          izloop: do k=nkts,nkte-1
             out_iinfo(i,j,k)=iinfo(k,used)
             out_winfo(i,j,k)=winfo(k,used)
          enddo izloop
          out_iinfo(i,j,nkde)=nkde
          out_winfo(i,j,nkde)=1.0

          k=nkte+1
          a=1-mod(JJ(i,j),2)
          nPD(i,j,1)=inPD(1,used)
          pdcheck=npd(i,j,1)+ptop+pdtop
 
 
 
 
 
       enddo iloop2
    enddo bigj

  end subroutine c2n_fulldom

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

  subroutine interp_T_PD_Q(method, pd_interp, nx, nz, &
       deta1,deta2, eta1,eta2, ptop,pdtop, kpres,     &
       fisA,fisB, pintA,pintB, tA,tB, pdA,pdB, qA,qB, &
       iinfo, winfo)
    implicit none

    integer, intent(in) :: pd_interp,method, kpres
    

    
    real, intent(in) :: deta1(nz),deta2(nz),eta1(nz),eta2(nz),ptop,pdtop
    integer, intent(in) :: nx,nz

    
    real, intent(in) :: fisA(nx),tA(nz-1,nx),pdA(nx),qA(nz-1,nx),pintA(nz,nx)

    
    real, intent(inout) :: fisB(nx),tB(nz-1,nx),pdB(nx),qB(nz-1,nx),pintB(nz,nx)

    
    
    real, intent(out) :: winfo(nz-1,nx)
    integer, intent(out) :: iinfo(nz-1,nx)

    

    character*255 :: message
    integer :: ix,iz,izA,izB,xpr
    real :: zA,zB,znext,apelp,rtopp,dz,weight,A,B,pstd1,z,pstd2,pstd12
    real :: tsfc(nx), slp(nx), zmslp(nx), z0mid(nx), zbelow(nx), &
            tbelow(nx), RHbelow(nx)
    real :: pb,pb1,pb2,pa,pa1,pa2,pnext,pa3, wnum,wdenom, QC, P0

    
    real, parameter :: PQ0=379.90516
    real, parameter :: A2=17.2693882
    real, parameter :: A3=273.16
    real, parameter :: A4=35.86
    real, parameter :: RHmin=1.0E-6     

    if(method/=nmm_method_linear) then
       call wrf_error_fatal3("<stdin>",2398,&
'only linear interpolation is supported')
    endif

    
    
    



    pstd1=p_ref 
    
    pstd2=eta1(2)*pdtop + eta2(2)*(p_ref-pdtop-ptop) + ptop
    pstd12=exp((alog(pstd1)+alog(pstd2))*0.5)

    do ix=1,nx
       
       APELP    = (pintA(2,ix)+pintA(1,ix))
       RTOPP    = TRG*tA(1,ix)*(1.0+qA(1,ix)*P608)/APELP
       DZ       = RTOPP*(DETA1(1)*PDTOP+DETA2(1)*pdA(ix))

       Z0MID(ix) = fisA(ix)/g + dz/2

       zA=fisA(ix)/g

       TSFC(ix) = TA(1,ix)*(1.+D608*QA(1,ix)) &
            + LAPSR*(zA + zA+dz)*0.5

       A         = LAPSR*zA/TSFC(ix)
       SLP(ix)  = PINTA(1,ix)*(1-A)**COEF2    
       B         = (pstd1/SLP(ix))**COEF3
       ZMSLP(ix)= TSFC(ix)*LAPSI*(1.0 - B)   

       TBELOW(ix) = TA(1,ix) + LAPSR*(Z0MID(ix)-ZMSLP(ix))
       
       
       
       P0=pdA(ix)+ptop+pdtop 
       QC=PQ0/P0*EXP(A2*(TA(1,ix)-A3)/(TA(1,ix)-A4))
       RHbelow(ix)=max(RHmin,min(1.0,QA(1,ix)/QC))
    enddo



    
    
    



    if_pd_interp: if(pd_interp==nmm_keep_pd) then
       
    elseif(pd_interp==nmm_interp_pd) then
       
       
       
       
       xloop: do ix=1,nx
          if(pintA(1,ix)>p_ref) then
             
             
             
             
             WRITE(0,*)'WARNING: NESTED DOMAIN PRESSURE AT LOWEST LEVEL HIGHER THAN PSTD'
             WRITE(0,*)'PINT(1),PD(1),PSTD(1)',pintA(1,ix),pdA(ix),p_ref
             pdB(ix)=pdA(ix)
             cycle xloop
          endif

          zA=fisA(ix)/g
          zB=fisB(ix)/g

          if(zB<zA) then
             
             
             
             iz=1
             weight=abs((zB-zmslp(ix))/(zA-zmslp(ix)))
             pdB(ix) = exp(weight*log(pdA(ix)+pdtop+ptop) + &
                        (1.0-weight)*log(P_REF)) &
                        - pdtop - ptop



             cycle xloop
          endif

          
          
          
          znext=-9e9
          z=zA
          do iz=1,nz-1
             
             APELP    = (pintA(iz+1,ix)+pintA(iz,ix))
             RTOPP    = TRG*tA(iz,ix)*(1.0+qA(iz,ix)*P608)/APELP
             DZ       = RTOPP*(DETA1(iz)*PDTOP+DETA2(iz)*pdA(ix))
             znext=z+dz

             if(znext>zB) then
                
                weight=(zB-z)/dz
                pdB(ix) = exp(weight*log(pintA(iz+1,ix)) + &
                              (1.0-weight)*log(pintA(iz,ix))) &
                      - pdtop - ptop





                cycle xloop
             else
                z=znext
             endif

          enddo

201       format('interp_T_PD_Q: Target domain surface height ',F0.4,'m is higher than the model top ',F0.4,'m of the source domain.  ABORTING')
          write(message,201) zB,znext
          call wrf_error_fatal3("<stdin>",2517,&
message)
       enddo xloop
    else
202    format('Invalid value ',I0,' for pd_interp in interp_T_PD_Q')
       write(message,202) pd_interp
       call wrf_error_fatal3("<stdin>",2523,&
message)
    endif if_pd_interp



    
    
    



    outer: do ix=1,nx
       
       iz=nz-1
       copyloop: do while(iz>kpres)
          tB(iz,ix)=tA(iz,ix)
          qB(iz,ix)=qA(iz,ix)

          
          iinfo(iz,ix)=iz
          winfo(iz,ix)=1.0

          iz=iz-1
       enddo copyloop

       
       
       
       izA=iz
       izB=iz

       
       if(iz>nz) then
          
          call wrf_error_fatal3("<stdin>",2558,&
'ERROR: WRF-NMM does not support pure sigma levels (only sigma-pressure hybrid)')
       endif

       pB2=log(eta1(izB)*pdtop + eta2(izB)*pdB(ix) + ptop)
       pB1=log(eta1(izB+1)*pdtop + eta2(izB+1)*pdB(ix) + ptop)
       pB=(pB2+pB1)*0.5

       pA2=log(eta1(izA)*pdtop + eta2(izA)*pdA(ix) + ptop)
       pA1=log(eta1(izA+1)*pdtop + eta2(izA+1)*pdA(ix) + ptop)
       pA=(pA2+pA1)*0.5

       
       interpinit: do while(izA>1)
          pA3=log(eta1(izA-1)*pdtop + eta2(izA-1)*pdA(ix) + ptop)
          pnext=(pA2+pA3)*0.5
          wdenom=pnext-pA
          wnum=pnext-pb
          if(pA<=pB .and. wnum>1e-5) then
             exit interpinit
          else
             pA1=pA2
             pA2=pa3
             izA=izA-1
             pA=pnext
          endif
       enddo interpinit

       
       interploop: do while(izB>0 .and. izA>1)
          
          zinterp: do while(izA>1)
             if(pnext>=pB) then
                
                
                weight=max(0.,wnum/wdenom)
                tB(izB,ix)=weight*tA(izA,ix) + (1.0-weight)*tA(izA-1,ix)
                qB(izB,ix)=weight*qA(izA,ix) + (1.0-weight)*qA(izA-1,ix)

                
                iinfo(izB,ix)=izA    
                winfo(izB,ix)=weight 

                
                pB1=pB2
                izB=izB-1
                if(izB>0) then
                   pB2=log(eta1(izB)*pdtop + eta2(izB)*pdB(ix) + ptop)
                   pB=(pb1+pb2)*0.5
                else
                   exit interploop
                endif
                wnum=pnext-pb
                
                exit zinterp
             else
                izA=izA-1
                pA1=pA2
                pA2=pa3
                pA=pnext
                if(izA>1) then
                   pA3=log(eta1(izA-1)*pdtop + eta2(izA-1)*pdA(ix) + ptop)
                   pnext=(pA2+pA3)*0.5
                   wdenom=pnext-pa
                   wnum=pnext-pb
                else
                   exit interploop
                endif
             endif
          enddo zinterp
       enddo interploop

       
       
       
       
       extraploop: do while(izB>=1)
          
          weight=(pB-pA)/(pstd12-pA)

          
          

          
          

          
          tB(izB,ix)=weight*tbelow(ix) + (1.0-weight)*tA(1,ix)

          
          
          
          P0=eta1(izB)*pdtop + eta2(izB)*pdB(ix) + ptop
          QC=PQ0/P0*EXP(A2*(TB(izB,ix)-A3)/(TB(izB,ix)-A4))
          QB(izB,ix)=QC*RHbelow(ix)

          
          iinfo(izB,ix)=0
          winfo(izB,ix)=weight

          
          izB=izB-1
          if(izB>0) then
             pB1=pB2
             pB2=log(eta1(izB)*pdtop + eta2(izB)*pdB(ix) + ptop)
             pB=(pb1+pb2)*0.5
          endif
       enddo extraploop
    enddo outer
  end subroutine interp_T_PD_Q

  subroutine interp_T_PD_Q_kpres(method, pd_interp, nx, nz, &
       deta1,deta2, eta1,eta2, ptop,pdtop, kpres, nz2,     &
       fisA,fisB, pintA,pintB, tA,tB, pdA,pdB, qA,qB, &
       iinfo, winfo)
    implicit none

    integer, intent(in) :: pd_interp,method, kpres, nz2
    

    
    real, intent(in) :: deta1(nz),deta2(nz),eta1(nz),eta2(nz),ptop,pdtop
    integer, intent(in) :: nx,nz

    
    real, intent(in) :: fisA(nx),tA(nz2-1,nx),pdA(nx),qA(nz2-1,nx),pintA(nz2,nx)

    
    real, intent(inout) :: fisB(nx),tB(nz2-1,nx),pdB(nx),qB(nz2-1,nx),pintB(nz2,nx)

    
    
    real, intent(out) :: winfo(nz2-1,nx)
    integer, intent(out) :: iinfo(nz2-1,nx)

    

    character*255 :: message
    integer :: ix,iz,izA,izB,xpr
    real :: zA,zB,znext,apelp,rtopp,dz,weight,A,B,pstd1,z,pstd2,pstd12
    real :: tsfc(nx), slp(nx), zmslp(nx), z0mid(nx), zbelow(nx), &
            tbelow(nx), RHbelow(nx)
    real :: pb,pb1,pb2,pa,pa1,pa2,pnext,pa3, wnum,wdenom, QC, P0

    
    real, parameter :: PQ0=379.90516
    real, parameter :: A2=17.2693882
    real, parameter :: A3=273.16
    real, parameter :: A4=35.86
    real, parameter :: RHmin=1.0E-6     

    if(method/=nmm_method_linear) then
       call wrf_error_fatal3("<stdin>",2710,&
'only linear interpolation is supported')
    endif

    
    
    



    pstd1=p_ref 
    
    pstd2=eta1(2)*pdtop + eta2(2)*(p_ref-pdtop-ptop) + ptop
    pstd12=exp((alog(pstd1)+alog(pstd2))*0.5)

    do ix=1,nx
       
       APELP    = (pintA(2,ix)+pintA(1,ix))
       RTOPP    = TRG*tA(1,ix)*(1.0+qA(1,ix)*P608)/APELP
       DZ       = RTOPP*(DETA1(1)*PDTOP+DETA2(1)*pdA(ix))

       Z0MID(ix) = fisA(ix)/g + dz/2

       zA=fisA(ix)/g

       TSFC(ix) = TA(1,ix)*(1.+D608*QA(1,ix)) &
            + LAPSR*(zA + zA+dz)*0.5

       A         = LAPSR*zA/TSFC(ix)
       SLP(ix)  = PINTA(1,ix)*(1-A)**COEF2    
       B         = (pstd1/SLP(ix))**COEF3
       ZMSLP(ix)= TSFC(ix)*LAPSI*(1.0 - B)   

       TBELOW(ix) = TA(1,ix) + LAPSR*(Z0MID(ix)-ZMSLP(ix))
       
       
       
       P0=pdA(ix)+ptop+pdtop 
       QC=PQ0/P0*EXP(A2*(TA(1,ix)-A3)/(TA(1,ix)-A4))
       RHbelow(ix)=max(RHmin,min(1.0,QA(1,ix)/QC))
    enddo



    
    
    



    if_pd_interp: if(pd_interp==nmm_keep_pd) then
       
    elseif(pd_interp==nmm_interp_pd) then
       
       
       
       
       xloop: do ix=1,nx
          if(pintA(1,ix)>p_ref) then
             
             
             
             
             WRITE(0,*)'WARNING: NESTED DOMAIN PRESSURE AT LOWEST LEVEL HIGHER THAN PSTD'
             WRITE(0,*)'PINT(1),PD(1),PSTD(1)',pintA(1,ix),pdA(ix),p_ref
             pdB(ix)=pdA(ix)
             cycle xloop
          endif

          zA=fisA(ix)/g
          zB=fisB(ix)/g

          if(zB<zA) then
             
             
             
             iz=1
             weight=abs((zB-zmslp(ix))/(zA-zmslp(ix)))
             pdB(ix) = exp(weight*log(pdA(ix)+pdtop+ptop) + &
                        (1.0-weight)*log(P_REF)) &
                        - pdtop - ptop



             cycle xloop
          endif

          
          
          
          znext=-9e9
          z=zA
          do iz=1,nz2-1
             
             APELP    = (pintA(iz+1,ix)+pintA(iz,ix))
             RTOPP    = TRG*tA(iz,ix)*(1.0+qA(iz,ix)*P608)/APELP
             DZ       = RTOPP*(DETA1(iz)*PDTOP+DETA2(iz)*pdA(ix))
             znext=z+dz

             if(znext>zB) then
                
                weight=(zB-z)/dz
                pdB(ix) = exp(weight*log(pintA(iz+1,ix)) + &
                              (1.0-weight)*log(pintA(iz,ix))) &
                      - pdtop - ptop





                cycle xloop
             else
                z=znext
             endif

          enddo

201       format('interp_T_PD_Q_kpres: Target domain surface height ',F0.4,'m is higher than the model top ',F0.4,'m of the source domain.  ABORTING')
          write(message,201) zB,znext
          call wrf_error_fatal3("<stdin>",2829,&
message)
       enddo xloop
    else
202    format('Invalid value ',I0,' for pd_interp in interp_T_PD_Q')
       write(message,202) pd_interp
       call wrf_error_fatal3("<stdin>",2835,&
message)
    endif if_pd_interp



    
    
    



    outer: do ix=1,nx
       
       iz=nz2-1
       copyloop: do while(iz>kpres)
          tB(iz,ix)=tA(iz,ix)
          qB(iz,ix)=qA(iz,ix)

          
          iinfo(iz,ix)=iz
          winfo(iz,ix)=1.0

          iz=iz-1
       enddo copyloop

       
       
       
       izA=iz
       izB=iz

       
       if(iz>nz2) then
          
          call wrf_error_fatal3("<stdin>",2870,&
'ERROR: WRF-NMM does not support pure sigma levels (only sigma-pressure hybrid)')
       endif

       pB2=log(eta1(izB)*pdtop + eta2(izB)*pdB(ix) + ptop)
       pB1=log(eta1(izB+1)*pdtop + eta2(izB+1)*pdB(ix) + ptop)
       pB=(pB2+pB1)*0.5

       pA2=log(eta1(izA)*pdtop + eta2(izA)*pdA(ix) + ptop)
       pA1=log(eta1(izA+1)*pdtop + eta2(izA+1)*pdA(ix) + ptop)
       pA=(pA2+pA1)*0.5

       
       interpinit: do while(izA>1)
          pA3=log(eta1(izA-1)*pdtop + eta2(izA-1)*pdA(ix) + ptop)
          pnext=(pA2+pA3)*0.5
          wdenom=pnext-pA
          wnum=pnext-pb
          if(pA<=pB .and. wnum>1e-5) then
             exit interpinit
          else
             pA1=pA2
             pA2=pa3
             izA=izA-1
             pA=pnext
          endif
       enddo interpinit

       
       interploop: do while(izB>0 .and. izA>1)
          
          zinterp: do while(izA>1)
             if(pnext>=pB) then
                
                
                weight=max(0.,wnum/wdenom)
                tB(izB,ix)=weight*tA(izA,ix) + (1.0-weight)*tA(izA-1,ix)
                qB(izB,ix)=weight*qA(izA,ix) + (1.0-weight)*qA(izA-1,ix)

                
                iinfo(izB,ix)=izA    
                winfo(izB,ix)=weight 

                
                pB1=pB2
                izB=izB-1
                if(izB>0) then
                   pB2=log(eta1(izB)*pdtop + eta2(izB)*pdB(ix) + ptop)
                   pB=(pb1+pb2)*0.5
                else
                   exit interploop
                endif
                wnum=pnext-pb
                
                exit zinterp
             else
                izA=izA-1
                pA1=pA2
                pA2=pa3
                pA=pnext
                if(izA>1) then
                   pA3=log(eta1(izA-1)*pdtop + eta2(izA-1)*pdA(ix) + ptop)
                   pnext=(pA2+pA3)*0.5
                   wdenom=pnext-pa
                   wnum=pnext-pb
                else
                   exit interploop
                endif
             endif
          enddo zinterp
       enddo interploop

       
       
       
       
       extraploop: do while(izB>=1)
          
          weight=(pB-pA)/(pstd12-pA)

          
          

          
          

          
          tB(izB,ix)=weight*tbelow(ix) + (1.0-weight)*tA(1,ix)

          
          
          
          P0=eta1(izB)*pdtop + eta2(izB)*pdB(ix) + ptop
          QC=PQ0/P0*EXP(A2*(TB(izB,ix)-A3)/(TB(izB,ix)-A4))
          QB(izB,ix)=QC*RHbelow(ix)

          
          iinfo(izB,ix)=0
          winfo(izB,ix)=weight

          
          izB=izB-1
          if(izB>0) then
             pB1=pB2
             pB2=log(eta1(izB)*pdtop + eta2(izB)*pdB(ix) + ptop)
             pB=(pb1+pb2)*0.5
          endif
       enddo extraploop
    enddo outer
  end subroutine interp_T_PD_Q_kpres
end module module_interp_nmm








subroutine ext_c2n_fulldom  (II,JJ,W1,W2,W3,W4,&
       deta1,deta2, eta1,eta2, ptop,pdtop,   &
       cpint,ct,cpd,cq,                 &
       cims, cime, cjms, cjme, ckms, ckme,   &
       npint,nt,npd,nq,                 &
       out_iinfo,out_winfo,imask,&
       nids, nide, njds, njde, nkds, nkde,   &
       nims, nime, njms, njme, nkms, nkme,   &
       nits, nite, njts, njte, nkts, nkte)
  
  
  use module_interp_store, only: parent_fis, nest_fis, kpres
  use module_interp_nmm, only: c2n_fulldom, find_kpres
  implicit none
  integer, intent(in):: cims, cime, cjms, cjme, ckms, ckme,   &
       nids, nide, njds, njde, nkds, nkde,   &
       nims, nime, njms, njme, nkms, nkme,   &
       nits, nite, njts, njte, nkts, nkte
  real, intent(in), dimension(cims:cime,cjms:cjme,ckms:ckme) :: cT,cQ,cPINT
  real, intent(in), dimension(cims:cime,cjms:cjme,1) :: cPD

  real, intent(out), dimension(nims:nime,njms:njme,nkms:nkme) :: out_winfo
  integer, intent(out), dimension(nims:nime,njms:njme,nkms:nkme) :: out_iinfo

  real, intent(out), dimension(nims:nime,njms:njme,nkms:nkme) :: nT,nQ
  real, intent(in), dimension(nims:nime,njms:njme,nkms:nkme) :: nPINT
  real, intent(inout), dimension(nims:nime,njms:njme,1) :: nPD
  integer, intent(in), dimension(nims:nime,njms:njme) :: imask

  real, intent(in), dimension(nims:nime,njms:njme) :: &
       W1,W2,W3,W4
  integer, intent(in), dimension(nims:nime,njms:njme) :: II,JJ

  real, intent(in), dimension(nkms:nkme) :: eta1,eta2,deta1,deta2
  real, intent(in) :: ptop,pdtop
  integer :: i,j,k
  logical :: badbad

  call find_kpres(kpres,eta2,nkds,nkde,nkms,nkme)
  call c2n_fulldom(II,JJ,W1,W2,W3,W4,&
       deta1,deta2, eta1,eta2, ptop,pdtop,   &
       parent_fis,cpint,ct,cpd,cq,           &
       cims, cime, cjms, cjme, ckms, ckme,   &
       nest_fis,npint,nt,npd,nq,             &
       out_iinfo,out_winfo,imask,            &
       nids, nide, njds, njde, nkds, nkde,   &
       nims, nime, njms, njme, nkms, nkme,   &
       nits, nite, njts, njte, nkts, nkte,   &
       kpres)

end subroutine ext_c2n_fulldom

subroutine ext_n2c_fulldom  ( &
       deta1,deta2, eta1,eta2, ptop,pdtop,   &
       cpint,ct,cpd,cq,                 &
       cids, cide, cjds, cjde, ckds, ckde,   &
       cims, cime, cjms, cjme, ckms, ckme,   &
       cits, cite, cjts, cjte, ckts, ckte,   &
       npint,nt,npd,nq,                 &
       ipos,jpos,                            &
       out_iinfo,out_winfo,      &
       nids, nide, njds, njde, nkds, nkde,   &
       nims, nime, njms, njme, nkms, nkme,   &
       nits, nite, njts, njte, nkts, nkte)
  
  
  use module_interp_store, only: parent_fis, nest_fis, kpres
  use module_interp_nmm, only: n2c_fulldom, find_kpres, n2c_fulldom_new
  implicit none
  integer, intent(in):: cims, cime, cjms, cjme, ckms, ckme,   &
       cids, cide, cjds, cjde, ckds, ckde,   &
       cits, cite, cjts, cjte, ckts, ckte,   &
       nids, nide, njds, njde, nkds, nkde,   &
       nims, nime, njms, njme, nkms, nkme,   &
       nits, nite, njts, njte, nkts, nkte,   &
       ipos, jpos 
  real, intent(out), dimension(cims:cime,cjms:cjme,ckms:ckme) :: cT,cQ,cPINT
  real, intent(inout), dimension(cims:cime,cjms:cjme,1) :: cPD

  real, intent(out), dimension(cims:cime,cjms:cjme,ckms:ckme) :: out_winfo
  integer, intent(out), dimension(cims:cime,cjms:cjme,ckms:ckme) :: out_iinfo

  real, intent(in), dimension(nims:nime,njms:njme,nkms:nkme) :: nT,nQ
  real, intent(in), dimension(nims:nime,njms:njme,nkms:nkme) :: nPINT
  real, intent(in), dimension(nims:nime,njms:njme,1) :: nPD

  real, intent(in), dimension(nkms:nkme) :: eta1,eta2,deta1,deta2
  real, intent(in) :: ptop,pdtop

  call find_kpres(kpres,eta2,nkds,nkde,nkms,nkme)
  call n2c_fulldom_new( &
       deta1,deta2, eta1,eta2, ptop,pdtop,   &
       parent_fis,cpint,ct,cpd,cq,           &
       cids, cide, cjds, cjde, ckds, ckde,   &
       cims, cime, cjms, cjme, ckms, ckme,   &
       cits, cite, cjts, cjte, ckts, ckte,   &
       nest_fis,npint,nt,npd,nq,             &
       ipos,jpos,                            &
       out_iinfo,out_winfo,                  &
       nids, nide, njds, njde, nkds, nkde,   &
       nims, nime, njms, njme, nkms, nkme,   &
       nits, nite, njts, njte, nkts, nkte, kpres)
end subroutine ext_n2c_fulldom

subroutine ext_c2b_fulldom  (II,JJ,W1,W2,W3,W4,&
     deta1,deta2, eta1,eta2, ptop,pdtop,   &
     cpint,ct,cpd,cq,                      &
     cims, cime, cjms, cjme, ckms, ckme,   &
     nids, nide, njds, njde, nkds, nkde,   &
     nims, nime, njms, njme, nkms, nkme,   &
     nits, nite, njts, njte, nkts, nkte,   &
     ibxs,    ibxe,    ibys,    ibye,      &
     wbxs,    wbxe,    wbys,    wbye,      &
     pdbxs,   pdbxe,   pdbys,   pdbye,     &
     tbxs,    tbxe,    tbys,    tbye,      &
     qbxs,    qbxe,    qbys,    qbye)
  use module_interp_nmm, only: c2b_fulldom, find_kpres, c2b_fulldom_new
  use module_interp_store, only: parent_fis, nest_fis, kpres
  implicit none
  integer, intent(in):: &
       cims, cime, cjms, cjme, ckms, ckme,   &
       nids, nide, njds, njde, nkds, nkde,   &
       nims, nime, njms, njme, nkms, nkme,   &
       nits, nite, njts, njte, nkts, nkte
  integer, parameter :: bdyw = 1
  
  real, intent(in), dimension(nims:nime,njms:njme) :: W1,W2,W3,W4
  integer, intent(in), dimension(nims:nime,njms:njme) :: II,JJ
  real, intent(in), dimension(nkms:nkme) :: eta1,eta2,deta1,deta2
  real, intent(in) :: ptop,pdtop

  
  real, intent(in), dimension(cims:cime,cjms:cjme,ckms:ckme) :: cT,cQ,cPINT
  real, intent(in), dimension(cims:cime,cjms:cjme,1) :: cPD

  
  real,dimension(nims:nime,nkms:nkme,bdyw) :: tbys,tbye,qbys,qbye
  real,dimension(njms:njme,nkms:nkme,bdyw) :: tbxs,tbxe,qbxs,qbxe
  real,dimension(nims:nime,1,bdyw) :: pdbys,pdbye
  real,dimension(njms:njme,1,bdyw) :: pdbxs,pdbxe
  
  
  real,dimension(nims:nime,nkms:nkme,bdyw) :: wbys,wbye
  real,dimension(njms:njme,nkms:nkme,bdyw) :: wbxs,wbxe
  integer,dimension(nims:nime,nkms:nkme,bdyw) :: ibys,ibye
  integer,dimension(njms:njme,nkms:nkme,bdyw) :: ibxs,ibxe

  call find_kpres(kpres,eta2,nkds,nkde,nkms,nkme)
  call c2b_fulldom_new    (II,JJ,W1,W2,W3,W4,&
       deta1,deta2, eta1,eta2, ptop,pdtop,   &
       parent_fis,cpint,ct,cpd,cq,nest_fis,  &
       cims, cime, cjms, cjme, ckms, ckme,   &
       nids, nide, njds, njde, nkds, nkde,   &
       nims, nime, njms, njme, nkms, nkme,   &
       nits, nite, njts, njte, nkts, nkte,   &
       kpres,                                &
       ibxs,    ibxe,    ibys,    ibye,      &
       wbxs,    wbxe,    wbys,    wbye,      &
       pdbxs,   pdbxe,   pdbys,   pdbye,     &
       tbxs,    tbxe,    tbys,    tbye,      &
       qbxs,    qbxe,    qbys,    qbye)
end subroutine ext_c2b_fulldom
