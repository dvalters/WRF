






























































      module parrrsw_f


      save




















      integer , parameter :: mxlay  = 203   
      integer , parameter :: mg     = 16     
      integer , parameter :: nbndsw = 14     
      integer , parameter :: naerec  = 6     
      integer , parameter :: mxmol  = 38
      integer , parameter :: nstr   = 2
      integer , parameter :: nmol   = 7

      integer , parameter :: ngptsw = 112    




      integer , parameter :: jpband   = 29
      integer , parameter :: jpb1     = 16   
      integer , parameter :: jpb2     = 29   

      integer , parameter :: jmcmu    = 32
      integer , parameter :: jmumu    = 32
      integer , parameter :: jmphi    = 3
      integer , parameter :: jmxang   = 4
      integer , parameter :: jmxstr   = 16



      integer , parameter :: ng16 = 6
      integer , parameter :: ng17 = 12
      integer , parameter :: ng18 = 8
      integer , parameter :: ng19 = 8
      integer , parameter :: ng20 = 10
      integer , parameter :: ng21 = 10
      integer , parameter :: ng22 = 2
      integer , parameter :: ng23 = 10
      integer , parameter :: ng24 = 8
      integer , parameter :: ng25 = 6
      integer , parameter :: ng26 = 6
      integer , parameter :: ng27 = 8
      integer , parameter :: ng28 = 6
      integer , parameter :: ng29 = 12

      integer , parameter :: ngs16 = 6
      integer , parameter :: ngs17 = 18
      integer , parameter :: ngs18 = 26
      integer , parameter :: ngs19 = 34
      integer , parameter :: ngs20 = 44
      integer , parameter :: ngs21 = 54
      integer , parameter :: ngs22 = 56
      integer , parameter :: ngs23 = 66
      integer , parameter :: ngs24 = 74
      integer , parameter :: ngs25 = 80
      integer , parameter :: ngs26 = 86
      integer , parameter :: ngs27 = 94
      integer , parameter :: ngs28 = 100
      integer , parameter :: ngs29 = 112

































      real , parameter :: rrsw_scon = 1.36822e+03     
 
      end module parrrsw_f

      module rrsw_aer_f

      use parrrsw_f, only : nbndsw, naerec


      save















































      real  :: rsrtaua(nbndsw,naerec)
      real  :: rsrpiza(nbndsw,naerec)
      real  :: rsrasya(nbndsw,naerec)

      end module rrsw_aer_f

      module rrsw_cld_f


      save





























      real  :: extliq1(58,16:29), ssaliq1(58,16:29), asyliq1(58,16:29)
      real  :: extice2(43,16:29), ssaice2(43,16:29), asyice2(43,16:29)
      real  :: extice3(46,16:29), ssaice3(46,16:29), asyice3(46,16:29)
      real  :: fdlice3(46,16:29)
      real  :: abari(5),bbari(5),cbari(5),dbari(5),ebari(5),fbari(5)

      end module rrsw_cld_f

      module rrsw_con_f


      save



























      real  :: fluxfac, heatfac
      real  :: oneminus, pi, grav
      real  :: planck, boltz, clight
      real  :: avogad, alosmt, gascon
      real  :: radcn1, radcn2
      real  :: sbcnst, secdy

      end module rrsw_con_f

      module rrsw_kg16_f

      use parrrsw_f, only : ng16


      save



















      integer , parameter :: no16 = 16

      real  :: kao(9,5,13,no16)
      real  :: kbo(5,13:59,no16)
      real  :: selfrefo(10,no16), forrefo(3,no16)
      real  :: sfluxrefo(no16)

      integer :: layreffr
      real  :: rayl, strrat1





















      real  :: ka(9,5,13,ng16) , absa(585,ng16)
      real  :: kb(5,13:59,ng16), absb(235,ng16)
      real  :: selfref(10,ng16), forref(3,ng16)
      real  :: sfluxref(ng16)

      equivalence (ka(1,1,1,1),absa(1,1)), (kb(1,13,1),absb(1,1))

      end module rrsw_kg16_f

      module rrsw_kg17_f

      use parrrsw_f, only : ng17


      save



















      integer , parameter :: no17 = 16

      real  :: kao(9,5,13,no17)
      real  :: kbo(5,5,13:59,no17)
      real  :: selfrefo(10,no17), forrefo(4,no17)
      real  :: sfluxrefo(no17,5)

      integer :: layreffr
      real  :: rayl, strrat





















      real  :: ka(9,5,13,ng17) , absa(585,ng17)
      real  :: kb(5,5,13:59,ng17), absb(1175,ng17)
      real  :: selfref(10,ng17), forref(4,ng17)
      real  :: sfluxref(ng17,5)

      equivalence (ka(1,1,1,1),absa(1,1)), (kb(1,1,13,1),absb(1,1))

      end module rrsw_kg17_f

      module rrsw_kg18_f

      use parrrsw_f, only : ng18


      save



















      integer , parameter :: no18 = 16

      real  :: kao(9,5,13,no18)
      real  :: kbo(5,13:59,no18)
      real  :: selfrefo(10,no18), forrefo(3,no18)
      real  :: sfluxrefo(no18,9)

      integer :: layreffr
      real  :: rayl, strrat





















      real  :: ka(9,5,13,ng18), absa(585,ng18)
      real  :: kb(5,13:59,ng18), absb(235,ng18)
      real  :: selfref(10,ng18), forref(3,ng18)
      real  :: sfluxref(ng18,9)

      equivalence (ka(1,1,1,1),absa(1,1)), (kb(1,13,1),absb(1,1))

      end module rrsw_kg18_f

      module rrsw_kg19_f

      use parrrsw_f, only : ng19


      save



















      integer , parameter :: no19 = 16

      real  :: kao(9,5,13,no19)
      real  :: kbo(5,13:59,no19)
      real  :: selfrefo(10,no19), forrefo(3,no19)
      real  :: sfluxrefo(no19,9)

      integer :: layreffr
      real  :: rayl, strrat





















      real  :: ka(9,5,13,ng19), absa(585,ng19)
      real  :: kb(5,13:59,ng19), absb(235,ng19)
      real  :: selfref(10,ng19), forref(3,ng19)
      real  :: sfluxref(ng19,9)

      equivalence (ka(1,1,1,1),absa(1,1)), (kb(1,13,1),absb(1,1))

      end module rrsw_kg19_f

      module rrsw_kg20_f

      use parrrsw_f, only : ng20


      save




















      integer , parameter :: no20 = 16

      real  :: kao(5,13,no20)
      real  :: kbo(5,13:59,no20)
      real  :: selfrefo(10,no20), forrefo(4,no20)
      real  :: sfluxrefo(no20)
      real  :: absch4o(no20)

      integer :: layreffr
      real  :: rayl 






















      real  :: ka(5,13,ng20), absa(65,ng20)
      real  :: kb(5,13:59,ng20), absb(235,ng20)
      real  :: selfref(10,ng20), forref(4,ng20)
      real  :: sfluxref(ng20)
      real  :: absch4(ng20)

      equivalence (ka(1,1,1),absa(1,1)), (kb(1,13,1),absb(1,1))

      end module rrsw_kg20_f

      module rrsw_kg21_f

      use parrrsw_f, only : ng21


      save



















      integer , parameter :: no21 = 16

      real  :: kao(9,5,13,no21)
      real  :: kbo(5,5,13:59,no21)
      real  :: selfrefo(10,no21), forrefo(4,no21)
      real  :: sfluxrefo(no21,9)

      integer :: layreffr
      real  :: rayl, strrat





















      real  :: ka(9,5,13,ng21), absa(585,ng21)
      real  :: kb(5,5,13:59,ng21), absb(1175,ng21)
      real  :: selfref(10,ng21), forref(4,ng21)
      real  :: sfluxref(ng21,9)

      equivalence (ka(1,1,1,1),absa(1,1)), (kb(1,1,13,1),absb(1,1))

      end module rrsw_kg21_f

      module rrsw_kg22_f

      use parrrsw_f, only : ng22


      save



















      integer , parameter :: no22 = 16

      real  :: kao(9,5,13,no22)
      real  :: kbo(5,13:59,no22)
      real  :: selfrefo(10,no22), forrefo(3,no22)
      real  :: sfluxrefo(no22,9)

      integer :: layreffr
      real  :: rayl, strrat





















      real  :: ka(9,5,13,ng22), absa(585,ng22)
      real  :: kb(5,13:59,ng22), absb(235,ng22)
      real  :: selfref(10,ng22), forref(3,ng22)
      real  :: sfluxref(ng22,9)

      equivalence (ka(1,1,1,1),absa(1,1)), (kb(1,13,1),absb(1,1))

      end module rrsw_kg22_f

      module rrsw_kg23_f

      use parrrsw_f, only : ng23


      save



















      integer , parameter :: no23 = 16

      real  :: kao(5,13,no23)
      real  :: selfrefo(10,no23), forrefo(3,no23)
      real  :: sfluxrefo(no23)
      real  :: raylo(no23)

      integer :: layreffr
      real :: givfac





















      real  :: ka(5,13,ng23), absa(65,ng23)
      real  :: selfref(10,ng23), forref(3,ng23)
      real  :: sfluxref(ng23), rayl(ng23)

      equivalence (ka(1,1,1),absa(1,1))

      end module rrsw_kg23_f

      module rrsw_kg24_f

      use parrrsw_f, only : ng24


      save























      integer , parameter :: no24 = 16

      real  :: kao(9,5,13,no24)
      real  :: kbo(5,13:59,no24)
      real  :: selfrefo(10,no24), forrefo(3,no24)
      real  :: sfluxrefo(no24,9)
      real  :: abso3ao(no24), abso3bo(no24)
      real  :: raylao(no24,9), raylbo(no24)

      integer :: layreffr
      real :: strrat

























      real  :: ka(9,5,13,ng24), absa(585,ng24)
      real  :: kb(5,13:59,ng24), absb(235,ng24)
      real  :: selfref(10,ng24), forref(3,ng24)
      real  :: sfluxref(ng24,9)
      real  :: abso3a(ng24), abso3b(ng24)
      real  :: rayla(ng24,9), raylb(ng24)

      equivalence (ka(1,1,1,1),absa(1,1)), (kb(1,13,1),absb(1,1))

      end module rrsw_kg24_f

      module rrsw_kg25_f

      use parrrsw_f, only : ng25


      save



















      integer , parameter :: no25 = 16

      real  :: kao(5,13,no25)
      real  :: sfluxrefo(no25)
      real  :: abso3ao(no25), abso3bo(no25)
      real  :: raylo(no25)

      integer :: layreffr




















      real  :: ka(5,13,ng25), absa(65,ng25)
      real  :: sfluxref(ng25)
      real  :: abso3a(ng25), abso3b(ng25)
      real  :: rayl(ng25)

      equivalence (ka(1,1,1),absa(1,1))

      end module rrsw_kg25_f

      module rrsw_kg26_f

      use parrrsw_f, only : ng26


      save
















      integer , parameter :: no26 = 16

      real  :: sfluxrefo(no26)
      real  :: raylo(no26)
















      real  :: sfluxref(ng26)
      real  :: rayl(ng26)

      end module rrsw_kg26_f

      module rrsw_kg27_f

      use parrrsw_f, only : ng27


      save


















      integer , parameter :: no27 = 16

      real  :: kao(5,13,no27)
      real  :: kbo(5,13:59,no27)
      real  :: sfluxrefo(no27)
      real  :: raylo(no27)

      integer :: layreffr
      real :: scalekur




















      real  :: ka(5,13,ng27), absa(65,ng27)
      real  :: kb(5,13:59,ng27), absb(235,ng27)
      real  :: sfluxref(ng27)
      real  :: rayl(ng27)

      equivalence (ka(1,1,1),absa(1,1)), (kb(1,13,1),absb(1,1))

      end module rrsw_kg27_f

      module rrsw_kg28_f

      use parrrsw_f, only : ng28


      save

















      integer , parameter :: no28 = 16

      real  :: kao(9,5,13,no28)
      real  :: kbo(5,5,13:59,no28)
      real  :: sfluxrefo(no28,5)

      integer :: layreffr
      real  :: rayl, strrat

















      real  :: ka(9,5,13,ng28), absa(585,ng28)
      real  :: kb(5,5,13:59,ng28), absb(1175,ng28)
      real  :: sfluxref(ng28,5)

      equivalence (ka(1,1,1,1),absa(1,1)), (kb(1,1,13,1),absb(1,1))

      end module rrsw_kg28_f

      module rrsw_kg29_f

      use parrrsw_f, only : ng29


      save





















      integer , parameter :: no29 = 16

      real  :: kao(5,13,no29)
      real  :: kbo(5,13:59,no29)
      real  :: selfrefo(10,no29), forrefo(4,no29)
      real  :: sfluxrefo(no29)
      real  :: absh2oo(no29), absco2o(no29)

      integer :: layreffr
      real  :: rayl





















      real  :: ka(5,13,ng29), absa(65,ng29)
      real  :: kb(5,13:59,ng29), absb(235,ng29)
      real  :: selfref(10,ng29), forref(4,ng29)
      real  :: sfluxref(ng29)
      real  :: absh2o(ng29), absco2(ng29)

      equivalence (ka(1,1,1),absa(1,1)), (kb(1,13,1),absb(1,1))

      end module rrsw_kg29_f

      module rrsw_ref_f


      save

















      real  , dimension(59) :: pref
      real  , dimension(59) :: preflog
      real  , dimension(59) :: tref

      end module rrsw_ref_f

      module rrsw_tbl_f


      save





















      integer , parameter :: ntbl = 10000

      real , parameter :: tblint = 10000.0 

      real , parameter :: od_lo = 0.06 

      real :: tau_tbl
      real , dimension(0:ntbl) :: exp_tbl

      real , parameter :: pade = 0.278 
      real :: bpade

      end module rrsw_tbl_f

      module rrsw_vsn_f


      save










































      character*18 hvrrtm,hvrini,hvrcld,hvrclc,hvrrft,hvrspv, &
                   hvrspc,hvrset,hvrtau,hvrvqd,hvratm,hvrutl,hvrext
      character*20 hnamrtm,hnamini,hnamcld,hnamclc,hnamrft,hnamspv, &
                   hnamspc,hnamset,hnamtau,hnamvqd,hnamatm,hnamutl,hnamext

      character*18 hvrkg
      character*20 hnamkg

      end module rrsw_vsn_f

      module rrsw_wvn_f

      use parrrsw_f, only : nbndsw, mg, ngptsw, jpb1, jpb2


      save































      integer  :: ng(jpb1:jpb2)
      integer  :: nspa(jpb1:jpb2)
      integer  :: nspb(jpb1:jpb2)

      real  :: wavenum1(jpb1:jpb2)
      real  :: wavenum2(jpb1:jpb2)
      real  :: delwave(jpb1:jpb2)
      integer :: icxa(jpb1:jpb2)

      integer  :: ngc(nbndsw)
      integer  :: ngs(nbndsw)
      integer  :: ngn(ngptsw)
      integer  :: ngb(ngptsw)
      integer  :: ngm(nbndsw*mg)

      real  :: wt(mg)
      real  :: rwgt(nbndsw*mg)

      end module rrsw_wvn_f


      module mcica_subcol_gen_sw_f

      use parrrsw_f, only : nbndsw, ngptsw
      use rrsw_con_f, only: grav
      use rrsw_wvn_f, only: ngb
      use rrsw_vsn_f

      implicit none

      public :: mcica_sw      
      
      contains

      subroutine mcica_sw(ncol, nlay, nsubcol, icld, irng, play, cld, ciwp, clwp, cswp, &
                          tauc, ssac, asmc, fsfc, cld_stoch, ciwp_stoch, clwp_stoch, cswp_stoch, &
                          tauc_stoch, ssac_stoch, asmc_stoch, fsfc_stoch, changeSeed )


  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

      use mcica_random_numbers_f

      
      

      



      integer , intent(in) :: ncol            
      integer , intent(in) :: nlay            
      integer , intent(in) :: icld            
      integer , intent(inout) :: irng         
                                                      
                                                      
      integer , intent(in) :: nsubcol         
      integer , optional, intent(in) :: changeSeed     


      real , intent(in) :: play(:,:)          
                                                      
      real , intent(in) :: cld(:,:)           
                                                      
      real , intent(in) :: clwp(:,:)          
                                                      
      real , intent(in) :: ciwp(:,:)          
                                                      
      real , intent(in) :: cswp(:,:)          
                                                      
      real , intent(in) :: TAUC(:,:,:)        
                                                      
      real , intent(in) :: SSAC(:,:,:)        
                                                      
      real , intent(in) :: ASMC(:,:,:)        
                                                      
      real , intent(in) :: FSFC(:,:,:)        
                                                      

      real , intent(out) :: CLD_STOCH(:,:,:)  
                                                      
      real , intent(out) :: CLWP_STOCH(:,:,:) 
                                                      
      real , intent(out) :: CIWP_STOCH(:,:,:) 
                                                      
      real , intent(out) :: CSWP_STOCH(:,:,:) 
                                                      
      real , intent(out) :: TAUC_STOCH(:,:,:) 
                                                      
      real , intent(out) :: SSAC_STOCH(:,:,:) 
                                                      
      real , intent(out) :: ASMC_STOCH(:,:,:) 
                                                      
      real , intent(out) :: FSFC_STOCH(:,:,:) 
                                                      
      



      real , parameter :: cldmin = 1.0e-20  



     
      real, dimension(8, nlay, nsubcol)  :: CDF       
      integer, dimension(8) :: seed1, seed2, seed3, seed4  
    
      integer  :: iseed                        

      real  :: kiss



      integer  :: ilev, isubcol, i, n, ngbm, iplon   
      integer :: m, k

      m(k, n) = ieor (k, ishft (k, n) )













      if (icld==1) then
!$acc kernels 
           
         CALL wrf_error_fatal3("<stdin>",1547,&
"icld == 1 not supported in module_ra_rrtmg_swf.F")

!$acc end kernels      
      endif


      if (icld==2) then




           do isubcol = 1,nsubcol
           do ilev = 1,nlay
               do i = 1, 8
                if (ilev.eq.1.and.isubcol.eq.1)then
                  seed1(i) = (play(i,1)*100 - int(play(i,1)*100))  * 1000000000  
                  seed2(i) = (play(i,2)*100 - int(play(i,2)*100))  * 1000000000  
                  seed3(i) = (play(i,3)*100 - int(play(i,3)*100))  * 1000000000  
                  seed4(i) = (play(i,4)*100 - int(play(i,4)*100))  * 1000000000
                     seed1(i) = 69069  * seed1(i) + 1327217885
                     seed2(i) = m (m (m (seed2(i), 13), - 17), 5)
                     seed3(i) = 18000  * iand (seed3(i), 65535 ) + ishft (seed3(i), - 16 )
                     seed4(i) = 30903  * iand (seed4(i), 65535 ) + ishft (seed4(i), - 16 )
                     kiss = seed1(i) + seed2(i) + ishft (seed3(i), 16 ) + seed4(i)
                 endif

                 seed1(i) = 69069  * seed1(i) + 1327217885
                 seed2(i) = m (m (m (seed2(i), 13), - 17), 5)
                 seed3(i) = 18000  * iand (seed3(i), 65535 ) + ishft (seed3(i), - 16 )
                 seed4(i) = 30903  * iand (seed4(i), 65535 ) + ishft (seed4(i), - 16 )
                 kiss = seed1(i) + seed2(i) + ishft (seed3(i), 16 ) + seed4(i)

                 CDF(i,ilev,isubcol) = kiss*2.328306e-10  + 0.5
               end do
            end do
            end do

            do ilev = 2,nlay
               do i = 1, 8
                  do isubcol = 1,nsubcol
                     if (CDF(i,ilev-1,isubcol) > 1.  - cld(i, ilev-1)) then
                        CDF(i,ilev,isubcol) = CDF(i,ilev-1,isubcol)
                     else
                        CDF(i,ilev,isubcol) = CDF(i,ilev,isubcol) * (1. - cld(i, ilev-1))
                     end if
                  end do
               end do
            end do
      endif


      if (icld==3) then
!$acc kernels 
           
         CALL wrf_error_fatal3("<stdin>",1602,&
"icld == 3 not supported in module_ra_rrtmg_swf.F")

!$acc end kernels      
      endif

      ngbm = ngb(1) - 1
!$acc kernels 
      do ilev = 1,nlay
         do i = 1, 8
            do isubcol = 1, nsubcol

               if ( CDF(i,ilev,isubcol)>=(1.0 - cld(i,ilev)) ) then
                  CLD_STOCH(i,isubcol,ilev) = 1.0 
                  CLWP_STOCH(i,isubcol,ilev) = clwp(i,ilev)
                  CIWP_STOCH(i,isubcol,ilev) = ciwp(i,ilev)
                  CSWP_STOCH(i,isubcol,ilev) = cswp(i,ilev)
                  n = ngb(isubcol) - ngbm
                  TAUC_STOCH(i,isubcol,ilev) = TAUC(i,n,ilev)
                  SSAC_STOCH(i,isubcol,ilev) = SSAC(i,n,ilev)
                  ASMC_STOCH(i,isubcol,ilev) = ASMC(i,n,ilev)
                  FSFC_STOCH(i,isubcol,ilev) = FSFC(i,n,ilev)
               else
                  CLD_STOCH(i,isubcol,ilev) = 0. 
                  CLWP_STOCH(i,isubcol,ilev) = 0. 
                  CIWP_STOCH(i,isubcol,ilev) = 0. 
                  CSWP_STOCH(i,isubcol,ilev) = 0. 
                  TAUC_STOCH(i,isubcol,ilev) = 0. 
                  SSAC_STOCH(i,isubcol,ilev) = 1. 
                  ASMC_STOCH(i,isubcol,ilev) = 0. 
                  FSFC_STOCH(i,isubcol,ilev) = 0. 
               endif
            enddo
         enddo
      enddo
!$acc end kernels

      end subroutine mcica_sw

      end module mcica_subcol_gen_sw_f

      module rrtmg_sw_cldprmc_f



      use parrrsw_f, only : ngptsw, jpband, jpb1, jpb2
      use rrsw_cld_f, only : extliq1, ssaliq1, asyliq1, &
                           extice2, ssaice2, asyice2, &
                           extice3, ssaice3, asyice3, fdlice3, &
                           abari, bbari, cbari, dbari, ebari, fbari
      use rrsw_wvn_f, only : wavenum2, ngb, icxa
      use rrsw_vsn_f, only : hvrclc, hnamclc

      implicit none

      contains


      subroutine cldprmc_sw(ncol, nlayers, inflag, iceflag, liqflag, cldfmc, &
                            ciwpmc, clwpmc, cswpmc, reicmc, relqmc, resnmc, &
                            taormc, taucmc, ssacmc, asmcmc, fsfcmc)









      integer , intent(in) :: nlayers         
      integer , intent(in) :: inflag          
      integer , intent(in) :: iceflag         
      integer , intent(in) :: liqflag         
      integer , intent(in) :: ncol

      real , intent(in) :: CLDFMC(:,:,:)          
                                                      
      real , intent(in) :: CIWPMC(:,:,:)          
                                                      
      real , intent(in) :: CLWPMC(:,:,:)          
                                                      
      real , intent(in) :: CSWPMC(:,:,:)          
                                                      
      real , intent(in) :: relqmc(:,:)           
                                                      
      real , intent(in) :: resnmc(:,:)           
                                                      
      real , intent(in) :: reicmc(:,:)           
                                                      
                                                      
                                                      
                                                      
                                                      
                                                      
                                                      
                                                      
                                                      
                                                      
                                                      
      real , intent(in) :: FSFCMC(:,:,:)          
                                                      



      real , intent(inout) :: TAUCMC(:,:,:)       
                                                      
      real , intent(inout) :: SSACMC(:,:,:)       
                                                      
      real , intent(inout) :: ASMCMC(:,:,:)       
                                                      
      real , intent(out) :: TAORMC(:,:,:)         
                                                      




      integer  :: ib, lay, istr, index, icx, ig, iplon

      real , parameter :: eps = 1.e-06      
      real , parameter :: cldmin = 1.e-20   
      real  :: cwp                            
      real  :: radliq                         
      real  :: radice                         
      real  :: radsno                         
      real  :: factor
      real  :: fint

      real  :: taucldorig_a, taucloud_a, ssacloud_a, ffp, ffp1, ffpssa
      real  :: tauiceorig, scatice, ssaice, tauice, tauliqorig, scatliq, ssaliq, tauliq
      real  :: tausnoorig, scatsno, ssasno, tausno

      real  :: fdelta
      real  :: extcoice, gice
      real  :: ssacoice, forwice
      real  :: extcoliq, gliq
      real  :: ssacoliq, forwliq
      real  :: extcosno, gsno
      real  :: ssacosno, forwsno




!$acc kernels

      taormc   = taucmc
  
!$acc end kernels    




!$acc kernels loop present(cldfmc, ciwpmc, clwpmc, cswpmc, relqmc, reicmc, resnmc, fsfcmc,taucmc, ssacmc, asmcmc, taormc)
    do iplon = 1, 8
      !$acc loop 
      do lay = 1, nlayers

         !$acc loop private(fdelta,extcoice,gice,ssacoice,forwice,extcoliq,gliq,ssacoliq,forwliq,gsno,forwsno,scatsno)
         do ig = 1, ngptsw 
            cwp = CIWPMC(iplon,ig,lay) + CLWPMC(iplon,ig,lay) + CSWPMC(iplon,ig,lay)  

            if (CLDFMC(iplon,ig,lay)   .ge. cldmin .and. &
               (cwp .ge. cldmin .or. TAUCMC(iplon,ig,lay)   .ge. cldmin)) then


               if (inflag .eq. 0) then


                  taucldorig_a = TAUCMC(iplon,ig,lay)  
                  ffp = FSFCMC(iplon,ig,lay)  
                  ffp1 = 1.0  - ffp
                  ffpssa = 1.0  - ffp * SSACMC(iplon,ig,lay)  
                  ssacloud_a = ffp1 * SSACMC(iplon,ig,lay)   / ffpssa
                  taucloud_a = ffpssa * taucldorig_a

                  TAORMC(iplon,ig,lay)   = taucldorig_a
                  SSACMC(iplon,ig,lay)   = ssacloud_a
                  TAUCMC(iplon,ig,lay)   = taucloud_a
                  ASMCMC(iplon,ig,lay)   = (ASMCMC(iplon,ig,lay)   - ffp) / (ffp1)


               elseif (inflag .ge. 2) then       
                  radice = reicmc(iplon,lay) 


                  if (CIWPMC(iplon,ig,lay) + CSWPMC(iplon,ig,lay) .eq. 0.0 ) then
                     extcoice = 0.0 
                     ssacoice = 0.0 
                     gice     = 0.0 
                     forwice  = 0.0 

                     extcosno = 0.0
                     ssacosno = 0.0
                     gsno     = 0.0
                     forwsno  = 0.0




                  elseif (iceflag .eq. 1) then
                   
                     ib = ngb(ig )
                     ib = icxa(ib)
  
                     extcoice = (abari(ib) + bbari(ib)/radice)
                     ssacoice = 1.  - cbari(ib) - dbari(ib) * radice
                     gice = ebari(ib) + fbari(ib) * radice

                     if (gice.ge.1. ) gice = 1.  - eps
                     forwice = gice*gice


                     if (extcoice .lt. 0.0) extcoice = 0.0
                     if (ssacoice .gt. 1.0) ssacoice = 1.0
                     if (ssacoice .lt. 0.0) ssacoice = 0.0
                     if (gice .gt. 1.0) gice = 1.0
                     if (gice .lt. 0.0) gice = 0.0
                  



                  elseif (iceflag .eq. 2) then
                     
                     factor = (radice - 2. )/3. 
                     index = int(factor)

                     if (index .le. 0) index = 1
                     if (index .ge. 43) index = 42

                     fint = factor - float(index)
                     ib = ngb(ig)
                     extcoice = extice2(index,ib) + fint * &
                                   (extice2(index+1,ib) -  extice2(index,ib))
                     ssacoice = ssaice2(index,ib) + fint * &
                                   (ssaice2(index+1,ib) -  ssaice2(index,ib))
                     gice = asyice2(index,ib) + fint * &
                                   (asyice2(index+1,ib) -  asyice2(index,ib))
                     forwice = gice*gice


                     if (extcoice .lt. 0.0) extcoice = 0.0
                     if (ssacoice .gt. 1.0) ssacoice = 1.0
                     if (ssacoice .lt. 0.0) ssacoice = 0.0
                     if (gice .gt. 1.0) gice = 1.0
                     if (gice .lt. 0.0) gice = 0.0
                 



                  elseif (iceflag .ge. 3) then
                    
                     factor = (radice - 2. )/3. 
                     index = int(factor)

                     if (index .le. 0) index = 1
                     if (index .ge. 46) index = 45

                     fint = factor - float(index)
                     ib = ngb(ig)
                     extcoice = extice3(index,ib) + fint * &
                                   (extice3(index+1,ib) - extice3(index,ib))
                     ssacoice = ssaice3(index,ib) + fint * &
                                   (ssaice3(index+1,ib) - ssaice3(index,ib))
                     gice = asyice3(index,ib) + fint * &
                               (asyice3(index+1,ib) - asyice3(index,ib))
                     fdelta = fdlice3(index,ib) + fint * &
                                 (fdlice3(index+1,ib) - fdlice3(index,ib))
                  
                     forwice = fdelta + 0.5  / ssacoice

                     if (forwice .gt. gice) forwice = gice


                     if (extcoice .lt. 0.0) extcoice = 0.0
                     if (ssacoice .gt. 1.0) ssacoice = 1.0
                     if (ssacoice .lt. 0.0) ssacoice = 0.0
                     if (gice .gt. 1.0) gice = 1.0
                     if (gice .lt. 0.0) gice = 0.0
                  
                  endif









                  if (CSWPMC(iplon,ig,lay).gt.0.0 .and. iceflag .eq. 5) then
                     radsno = resnmc(iplon,lay)
                     factor = (radsno - 2.)/3.
                     index = int(factor)

                     if (index .le. 0) index = 1
                     if (index .ge. 46) index = 45

                     fint = factor - float(index)
                     ib = ngb(ig)
                     extcosno = extice3(index,ib) + fint * &
                                   (extice3(index+1,ib) - extice3(index,ib))
                     ssacosno = ssaice3(index,ib) + fint * &
                                   (ssaice3(index+1,ib) - ssaice3(index,ib))
                     gsno = asyice3(index,ib) + fint * &
                               (asyice3(index+1,ib) - asyice3(index,ib))
                     fdelta = fdlice3(index,ib) + fint * &
                                 (fdlice3(index+1,ib) - fdlice3(index,ib))
                     forwsno = fdelta + 0.5 / ssacosno

                     if (forwsno .gt. gsno) forwsno = gsno


                     if (extcosno .lt. 0.0) extcosno = 0.0
                     if (ssacosno .gt. 1.0) ssacosno = 1.0
                     if (ssacosno .lt. 0.0) ssacosno = 0.0
                     if (gsno .gt. 1.0) gsno = 1.0
                     if (gsno .lt. 0.0) gsno = 0.0

                  else
                     extcosno = 0.0
                     ssacosno = 0.0
                     gsno     = 0.0
                     forwsno  = 0.0
                  endif


                  if (CLWPMC(iplon,ig,lay)   .eq. 0.0 ) then
                     extcoliq = 0.0 
                     ssacoliq = 0.0 
                     gliq = 0.0 
                     forwliq = 0.0 

                  elseif (liqflag .eq. 1) then
                     radliq = relqmc(iplon,lay) 
                   
                     index = int(radliq - 1.5 )

                     if (index .le. 0) index = 1
                     if (index .ge. 58) index = 57


                     fint = radliq - 1.5  - float(index)
                     ib = ngb(ig)
                     extcoliq = extliq1(index,ib) + fint * &
                                   (extliq1(index+1,ib) - extliq1(index,ib))
                     ssacoliq = ssaliq1(index,ib) + fint * &
                                   (ssaliq1(index+1,ib) - ssaliq1(index,ib))
                     if (fint .lt. 0.  .and. ssacoliq .gt. 1. ) &
                                    ssacoliq = ssaliq1(index,ib)
                     gliq = asyliq1(index,ib) + fint * &
                               (asyliq1(index+1,ib) - asyliq1(index,ib))
                     forwliq = gliq*gliq


                     if (extcoliq .lt. 0.0) extcoliq = 0.0
                     if (ssacoliq .gt. 1.0) ssacoliq = 1.0
                     if (ssacoliq .lt. 0.0) ssacoliq = 0.0
                     if (gliq .gt. 1.0) gliq = 1.0
                     if (gliq .lt. 0.0) gliq = 0.0

                  endif
   
                  if (iceflag .lt. 5) then
                     tauliqorig = CLWPMC(iplon,ig,lay)   * extcoliq
                     tauiceorig = CIWPMC(iplon,ig,lay)   * extcoice
                     TAORMC(iplon,ig,lay)   = tauliqorig + tauiceorig

                     ssaliq = ssacoliq * (1.  - forwliq) / &
                             (1.  - forwliq * ssacoliq)
                     tauliq = (1.  - forwliq * ssacoliq) * tauliqorig
                     ssaice = ssacoice * (1.  - forwice) / &
                             (1.  - forwice * ssacoice)
                     tauice = (1.  - forwice * ssacoice) * tauiceorig

                     scatliq = ssaliq * tauliq
                     scatice = ssaice * tauice
                     TAUCMC(iplon,ig,lay)   = tauliq + tauice
                  else
                     tauliqorig = CLWPMC(iplon,ig,lay)   * extcoliq
                     tauiceorig = CIWPMC(iplon,ig,lay)   * extcoice
                     tausnoorig = CSWPMC(iplon,ig,lay)   * extcosno
                     TAORMC(iplon,ig,lay)   = tauliqorig + tauiceorig + tausnoorig

                     ssaliq = ssacoliq * (1.  - forwliq) / &
                             (1.  - forwliq * ssacoliq)
                     tauliq = (1.  - forwliq * ssacoliq) * tauliqorig
                     ssaice = ssacoice * (1.  - forwice) / &
                             (1.  - forwice * ssacoice)
                     tauice = (1.  - forwice * ssacoice) * tauiceorig
                     ssasno = ssacosno * (1.  - forwsno) / &
                             (1.  - forwsno * ssacosno)
                     tausno = (1.  - forwsno * ssacosno) * tausnoorig

                     scatliq = ssaliq * tauliq
                     scatice = ssaice * tauice
                     scatsno = ssasno * tausno
                     TAUCMC(iplon,ig,lay)   = tauliq + tauice + tausno
                  endif


                  if(TAUCMC(iplon,ig,lay)  .eq.0.) TAUCMC(iplon,ig,lay)   = cldmin
                  if(scatice.eq.0.) scatice = cldmin
                  if(scatsno.eq.0.) scatsno = cldmin

                  if (iceflag .lt. 5) then
                     SSACMC(iplon,ig,lay)   = (scatliq + scatice) / TAUCMC(iplon,ig,lay)  
                  else
                     SSACMC(iplon,ig,lay)   = (scatliq + scatice + scatsno) / TAUCMC(iplon,ig,lay)  
                  endif

                  if (iceflag .eq. 3 .or. iceflag.eq.4) then




                     istr = 1
                     ASMCMC(iplon,ig,lay)   = (1.0 /(scatliq+scatice))* &
                        (scatliq*(gliq**istr - forwliq) / &
                        (1.0  - forwliq) + scatice * ((gice-forwice)/ &
                        (1.0  - forwice))**istr)

                  elseif (iceflag .eq. 5) then
                     istr = 1
                     ASMCMC(iplon,ig,lay) = (1.0 /(scatliq+scatice+scatsno)) * &
                                    (scatliq*(gliq**istr - forwliq)/(1.0 - forwliq)  &
                                    + scatice * ((gice-forwice)/(1.0 - forwice))        &
                                    + scatsno * ((gsno-forwsno)/(1.0 - forwsno))**istr)

                  else 


                     istr = 1
                     ASMCMC(iplon,ig,lay)   = (scatliq *  &
                        (gliq**istr - forwliq) / &
                        (1.0  - forwliq) + scatice * (gice**istr - forwice) / &
                        (1.0  - forwice))/(scatliq + scatice)
                  endif 

               endif

            endif


         enddo


      enddo

      enddo
!$acc end kernels

      end subroutine cldprmc_sw

      end module rrtmg_sw_cldprmc_f

      module rrtmg_sw_setcoef_f



      use parrrsw_f, only : mxmol
      use rrsw_ref_f, only : pref, preflog, tref
      use rrsw_vsn_f, only : hvrset, hnamset

      implicit none

      contains


      subroutine setcoef_sw(ncol, nlayers, pavel, tavel, pz, tz, tbound, coldry, wkl, &
                            laytrop, layswtch, laylow, jp, jt, jt1, &
                            co2mult, colch4, colco2, colh2o, colmol, coln2o, &
                            colo2, colo3, fac00, fac01, fac10, fac11, &
                            selffac, selffrac, indself, forfac, forfrac, indfor)













      integer, intent(in) :: ncol

      integer , intent(in) :: nlayers         
      
      real , intent(in) :: pavel(:,:)            
                                                      
      real , intent(in) :: tavel(:,:)            
                                                      
      real , intent(in) :: pz(:,0:)              
                                                      
      real , intent(in) :: tz(:,0:)              
                                                      
      real , intent(in) :: tbound(:)             
      real , intent(in) :: coldry(:,:)           
                                                      
      real , intent(in) :: wkl(:,:,:)            
                                                      


      integer , intent(out) :: laytrop(:)        
      integer , intent(out) :: layswtch(:)       
      integer , intent(out) :: laylow(:)         

      integer , intent(out) :: jp(:,:)           
                                                      
      integer , intent(out) :: jt(:,:)           
                                                      
      integer , intent(out) :: jt1(:,:)          
                                                      

      real , intent(out) :: colh2o(:,:)          
                                                      
      real , intent(out) :: colco2(:,:)          
                                                      
      real , intent(out) :: colo3(:,:)           
                                                      
      real , intent(out) :: coln2o(:,:)          
                                                      
      real , intent(out) :: colch4(:,:)          
                                                      
      real , intent(out) :: colo2(:,:)           
                                                      
      real , intent(out) :: colmol(:,:)          
                                                      
      real , intent(out) :: co2mult(:,:)         
                                                      

      integer , intent(out) :: indself(:,:) 
                                                      
      integer , intent(out) :: indfor(:,:) 
                                                      
      real , intent(out) :: selffac(:,:) 
                                                      
      real , intent(out) :: selffrac(:,:) 
                                                      
      real , intent(out) :: forfac(:,:) 
                                                      
      real , intent(out) :: forfrac(:,:) 
                                                      

      real , intent(out) :: fac00(:,:) , fac01(:,:) , fac10(:,:) , fac11(:,:)  



      integer  :: indbound
      integer  :: indlev0
      integer  :: lay
      integer  :: jp1
      integer  :: iplon

      real  :: stpfac
      real  :: tbndfrac
      real  :: t0frac
      real  :: plog
      real  :: fp
      real  :: ft
      real  :: ft1
      real  :: water
      real  :: scalefac
      real  :: factor
      real  :: co2reg
      real  :: compfp




      stpfac = 296. /1013. 


!$acc kernels present(pavel, layswtch, laytrop, laylow)
      layswtch = 0
      laytrop = 0
      laylow = 0
      do iplon = 1, 8
         do lay = 1, nlayers
            plog = log(pavel(iplon,lay) )
            if (plog .ge. 4.56) laytrop(iplon) = laytrop(iplon) + 1
            if (plog .ge. 6.62) laylow(iplon) = laylow(iplon) + 1
         end do
      end do
!$acc end kernels


!$acc kernels loop present(pavel, tavel, pz, tz, tbound) &
!$acc present(coldry, wkl, jp, jt, jt1, colh2o, colco2) &
!$acc present(colo3, coln2o, colch4, colo2, colmol, co2mult, indself) &
!$acc present(indfor, selffac, selffrac, forfac, forfrac, fac00, fac01, fac10, fac11)


      do iplon = 1, 8

      indbound = tbound(iplon) - 159. 
      tbndfrac = tbound(iplon) - int(tbound(iplon))
      
      indlev0  = tz(iplon,0)  - 159. 
      t0frac   = tz(iplon,0)  - int(tz(iplon,0) )



       do lay = 1, nlayers





         plog = log(pavel(iplon,lay) )
         jp(iplon,lay)  = int(36.  - 5*(plog+0.04 ))
         if (jp(iplon,lay)  .lt. 1) then
            jp(iplon,lay)  = 1
         elseif (jp(iplon,lay)  .gt. 58) then
            jp(iplon,lay)  = 58
         endif
         jp1 = jp(iplon,lay)  + 1
         fp = 5.  * (preflog(jp(iplon,lay) ) - plog)









         jt(iplon,lay)  = int(3.  + (tavel(iplon,lay) -tref(jp(iplon,lay) ))/15. )
         if (jt(iplon,lay)  .lt. 1) then
            jt(iplon,lay)  = 1
         elseif (jt(iplon,lay)  .gt. 4) then
            jt(iplon,lay)  = 4
         endif
         ft = ((tavel(iplon,lay) -tref(jp(iplon,lay) ))/15. ) - float(jt(iplon,lay) -3)
         jt1(iplon,lay)  = int(3.  + (tavel(iplon,lay) -tref(jp1))/15. )
         if (jt1(iplon,lay)  .lt. 1) then
            jt1(iplon,lay)  = 1
         elseif (jt1(iplon,lay)  .gt. 4) then
            jt1(iplon,lay)  = 4
         endif
         ft1 = ((tavel(iplon,lay) -tref(jp1))/15. ) - float(jt1(iplon,lay) -3)

         water = wkl(iplon,1,lay) /coldry(iplon,lay) 
         scalefac = pavel(iplon,lay)  * stpfac / tavel(iplon,lay) 




         if (plog .le. 4.56 ) then

         forfac(iplon,lay)  = scalefac / (1.+water)
         factor = (tavel(iplon,lay) -188.0 )/36.0 
         indfor(iplon,lay)  = 3
         forfrac(iplon,lay)  = factor - 1.0 



         colh2o(iplon,lay)  = 1.e-20  * wkl(iplon,1,lay) 
         colco2(iplon,lay)  = 1.e-20  * wkl(iplon,2,lay) 
         colo3(iplon,lay)   = 1.e-20  * wkl(iplon,3,lay) 
         coln2o(iplon,lay)  = 1.e-20  * wkl(iplon,4,lay) 
         colch4(iplon,lay)  = 1.e-20  * wkl(iplon,6,lay) 
         colo2(iplon,lay)   = 1.e-20  * wkl(iplon,7,lay) 
         colmol(iplon,lay)  = 1.e-20  * coldry(iplon,lay)  + colh2o(iplon,lay) 
         if (colco2(iplon,lay)  .eq. 0. ) colco2(iplon,lay)  = 1.e-32  * coldry(iplon,lay) 
         if (coln2o(iplon,lay)  .eq. 0. ) coln2o(iplon,lay)  = 1.e-32  * coldry(iplon,lay) 
         if (colch4(iplon,lay)  .eq. 0. ) colch4(iplon,lay)  = 1.e-32  * coldry(iplon,lay) 
         if (colo2(iplon,lay)   .eq. 0. ) colo2(iplon,lay)   = 1.e-32  * coldry(iplon,lay) 
         co2reg = 3.55e-24  * coldry(iplon,lay) 
         co2mult(iplon,lay) = (colco2(iplon,lay)  - co2reg) * &
               272.63 *exp(-1919.4 /tavel(iplon,lay) )/(8.7604e-4 *tavel(iplon,lay) )

         selffac(iplon,lay)  = 0. 
         selffrac(iplon,lay) = 0. 
         indself(iplon,lay)  = 0


         else





         forfac(iplon,lay)  = scalefac / (1.+water)
         factor = (332.0 -tavel(iplon,lay) )/36.0 
         indfor(iplon,lay)  = min(2, max(1, int(factor)))
         forfrac(iplon,lay)  = factor - float(indfor(iplon,lay) )




         selffac(iplon,lay)  = water * forfac(iplon,lay) 
         factor = (tavel(iplon,lay) -188.0 )/7.2 
         indself(iplon,lay)  = min(9, max(1, int(factor)-7))
         selffrac(iplon,lay)  = factor - float(indself(iplon,lay)  + 7)



         colh2o(iplon,lay)  = 1.e-20  * wkl(iplon,1,lay) 
         colco2(iplon,lay)  = 1.e-20  * wkl(iplon,2,lay) 
         colo3(iplon,lay)  = 1.e-20  * wkl(iplon,3,lay) 


         coln2o(iplon,lay)  = 1.e-20  * wkl(iplon,4,lay) 
         colch4(iplon,lay)  = 1.e-20  * wkl(iplon,6,lay) 
         colo2(iplon,lay)  = 1.e-20  * wkl(iplon,7,lay) 
         colmol(iplon,lay)  = 1.e-20  * coldry(iplon,lay)  + colh2o(iplon,lay) 






         if (colco2(iplon,lay)  .eq. 0. ) colco2(iplon,lay)  = 1.e-32  * coldry(iplon,lay) 
         if (coln2o(iplon,lay)  .eq. 0. ) coln2o(iplon,lay)  = 1.e-32  * coldry(iplon,lay) 
         if (colch4(iplon,lay)  .eq. 0. ) colch4(iplon,lay)  = 1.e-32  * coldry(iplon,lay) 
         if (colo2(iplon,lay)  .eq. 0. ) colo2(iplon,lay)  = 1.e-32  * coldry(iplon,lay) 

         co2reg = 3.55e-24  * coldry(iplon,lay) 
         co2mult(iplon,lay) = (colco2(iplon,lay)  - co2reg) * &
               272.63 *exp(-1919.4 /tavel(iplon,lay) )/(8.7604e-4 *tavel(iplon,lay) )
      
         end if







         compfp = 1.  - fp
         fac10(iplon,lay)  = compfp * ft
         fac00(iplon,lay)  = compfp * (1.  - ft)
         fac11(iplon,lay)  = fp * ft1
         fac01(iplon,lay)  = fp * (1.  - ft1)


       end do


      end do
!$acc end kernels

end subroutine setcoef_sw


      subroutine swatmref


      save
 




      pref(:) = (/ &
          1.05363e+03 ,8.62642e+02 ,7.06272e+02 ,5.78246e+02 ,4.73428e+02 , &
          3.87610e+02 ,3.17348e+02 ,2.59823e+02 ,2.12725e+02 ,1.74164e+02 , &
          1.42594e+02 ,1.16746e+02 ,9.55835e+01 ,7.82571e+01 ,6.40715e+01 , &
          5.24573e+01 ,4.29484e+01 ,3.51632e+01 ,2.87892e+01 ,2.35706e+01 , &
          1.92980e+01 ,1.57998e+01 ,1.29358e+01 ,1.05910e+01 ,8.67114e+00 , &
          7.09933e+00 ,5.81244e+00 ,4.75882e+00 ,3.89619e+00 ,3.18993e+00 , &
          2.61170e+00 ,2.13828e+00 ,1.75067e+00 ,1.43333e+00 ,1.17351e+00 , &
          9.60789e-01 ,7.86628e-01 ,6.44036e-01 ,5.27292e-01 ,4.31710e-01 , &
          3.53455e-01 ,2.89384e-01 ,2.36928e-01 ,1.93980e-01 ,1.58817e-01 , &
          1.30029e-01 ,1.06458e-01 ,8.71608e-02 ,7.13612e-02 ,5.84256e-02 , &
          4.78349e-02 ,3.91639e-02 ,3.20647e-02 ,2.62523e-02 ,2.14936e-02 , &
          1.75975e-02 ,1.44076e-02 ,1.17959e-02 ,9.65769e-03  /)

      preflog(:) = (/ &
           6.9600e+00 , 6.7600e+00 , 6.5600e+00 , 6.3600e+00 , 6.1600e+00 , &
           5.9600e+00 , 5.7600e+00 , 5.5600e+00 , 5.3600e+00 , 5.1600e+00 , &
           4.9600e+00 , 4.7600e+00 , 4.5600e+00 , 4.3600e+00 , 4.1600e+00 , &
           3.9600e+00 , 3.7600e+00 , 3.5600e+00 , 3.3600e+00 , 3.1600e+00 , &
           2.9600e+00 , 2.7600e+00 , 2.5600e+00 , 2.3600e+00 , 2.1600e+00 , &
           1.9600e+00 , 1.7600e+00 , 1.5600e+00 , 1.3600e+00 , 1.1600e+00 , &
           9.6000e-01 , 7.6000e-01 , 5.6000e-01 , 3.6000e-01 , 1.6000e-01 , &
          -4.0000e-02 ,-2.4000e-01 ,-4.4000e-01 ,-6.4000e-01 ,-8.4000e-01 , &
          -1.0400e+00 ,-1.2400e+00 ,-1.4400e+00 ,-1.6400e+00 ,-1.8400e+00 , &
          -2.0400e+00 ,-2.2400e+00 ,-2.4400e+00 ,-2.6400e+00 ,-2.8400e+00 , &
          -3.0400e+00 ,-3.2400e+00 ,-3.4400e+00 ,-3.6400e+00 ,-3.8400e+00 , &
          -4.0400e+00 ,-4.2400e+00 ,-4.4400e+00 ,-4.6400e+00  /)




      tref(:) = (/ &
           2.9420e+02 , 2.8799e+02 , 2.7894e+02 , 2.6925e+02 , 2.5983e+02 , &
           2.5017e+02 , 2.4077e+02 , 2.3179e+02 , 2.2306e+02 , 2.1578e+02 , &
           2.1570e+02 , 2.1570e+02 , 2.1570e+02 , 2.1706e+02 , 2.1858e+02 , &
           2.2018e+02 , 2.2174e+02 , 2.2328e+02 , 2.2479e+02 , 2.2655e+02 , &
           2.2834e+02 , 2.3113e+02 , 2.3401e+02 , 2.3703e+02 , 2.4022e+02 , &
           2.4371e+02 , 2.4726e+02 , 2.5085e+02 , 2.5457e+02 , 2.5832e+02 , &
           2.6216e+02 , 2.6606e+02 , 2.6999e+02 , 2.7340e+02 , 2.7536e+02 , &
           2.7568e+02 , 2.7372e+02 , 2.7163e+02 , 2.6955e+02 , 2.6593e+02 , &
           2.6211e+02 , 2.5828e+02 , 2.5360e+02 , 2.4854e+02 , 2.4348e+02 , & 
           2.3809e+02 , 2.3206e+02 , 2.2603e+02 , 2.2000e+02 , 2.1435e+02 , &
           2.0887e+02 , 2.0340e+02 , 1.9792e+02 , 1.9290e+02 , 1.8809e+02 , &
           1.8329e+02 , 1.7849e+02 , 1.7394e+02 , 1.7212e+02  /)

      end subroutine swatmref

      end module rrtmg_sw_setcoef_f

      module rrtmg_sw_taumol_f



      use rrsw_con_f, only: oneminus
      use rrsw_wvn_f, only: nspa, nspb
      use rrsw_vsn_f, only: hvrtau, hnamtau

      implicit none

      contains


      subroutine taumol_sw(ncol, nlayers, &
                           colh2o, colco2, colch4, colo2, colo3, colmol, &
                           laytrop, jp, jt, jt1, &
                           fac00, fac01, fac10, fac11, &
                           selffac, selffrac, indself, forfac, forfrac, indfor, &
                           sfluxzen, taug, taur)


      integer , intent(in) :: ncol
      integer , intent(in) :: nlayers               

      integer , intent(in) :: laytrop(:)            
      integer , intent(in) :: jp(:,:)               
      integer , intent(in) :: jt(:,:)               
      integer , intent(in) :: jt1(:,:)              
                                                    

      real , intent(in) :: colh2o(:,:)              
      real , intent(in) :: colco2(:,:)              
      real , intent(in) :: colo3(:,:)               
      real , intent(in) :: colch4(:,:)              
      real , intent(in) :: colo2(:,:)               
      real , intent(in) :: colmol(:,:)              
                                                    

      integer , intent(in) :: indself(:,:)     
      integer , intent(in) :: indfor(:,:) 
      real , intent(in) :: selffac(:,:) 
      real , intent(in) :: selffrac(:,:) 
      real , intent(in) :: forfac(:,:) 
      real , intent(in) :: forfrac(:,:) 
                                                    

      real , intent(in) :: &                        
                       fac00(:,:) , fac01(:,:) , &  
                       fac10(:,:) , fac11(:,:)  
                                                    


      real , intent(inout)  :: sfluxzen(:,:)   
                                                         
      real , intent(inout)  :: taug(:,:,:)     
                                                         
      real , intent(inout)  :: taur(:,:,:)     
                                                         



      call taumol16(ncol, nlayers, &
                    colh2o, colco2, colch4, colo2, colo3, colmol, &
                    laytrop, jp, jt, jt1, &
                    fac00, fac01, fac10, fac11, &
                    selffac, selffrac, indself, forfac, forfrac, indfor, &
                    sfluxzen, taug, taur)

      call taumol17(ncol, nlayers, &
                    colh2o, colco2, colch4, colo2, colo3, colmol, &
                    laytrop, jp, jt, jt1, &
                    fac00, fac01, fac10, fac11, &
                    selffac, selffrac, indself, forfac, forfrac, indfor, &
                    sfluxzen, taug, taur)

      call taumol18(ncol, nlayers, &
                    colh2o, colco2, colch4, colo2, colo3, colmol, &
                    laytrop, jp, jt, jt1, &
                    fac00, fac01, fac10, fac11, &
                    selffac, selffrac, indself, forfac, forfrac, indfor, &
                    sfluxzen, taug, taur)

      call taumol19(ncol, nlayers, &
                    colh2o, colco2, colch4, colo2, colo3, colmol, &
                    laytrop, jp, jt, jt1, &
                    fac00, fac01, fac10, fac11, &
                    selffac, selffrac, indself, forfac, forfrac, indfor, &
                    sfluxzen, taug, taur)

      call taumol20(ncol, nlayers, &
                    colh2o, colco2, colch4, colo2, colo3, colmol, &
                    laytrop, jp, jt, jt1, &
                    fac00, fac01, fac10, fac11, &
                    selffac, selffrac, indself, forfac, forfrac, indfor, &
                    sfluxzen, taug, taur)

      call taumol21(ncol, nlayers, &
                    colh2o, colco2, colch4, colo2, colo3, colmol, &
                    laytrop, jp, jt, jt1, &
                    fac00, fac01, fac10, fac11, &
                    selffac, selffrac, indself, forfac, forfrac, indfor, &
                    sfluxzen, taug, taur)

      call taumol22(ncol, nlayers, &
                    colh2o, colco2, colch4, colo2, colo3, colmol, &
                    laytrop, jp, jt, jt1, &
                    fac00, fac01, fac10, fac11, &
                    selffac, selffrac, indself, forfac, forfrac, indfor, &
                    sfluxzen, taug, taur)

      call taumol23(ncol, nlayers, &
                    colh2o, colco2, colch4, colo2, colo3, colmol, &
                    laytrop, jp, jt, jt1, &
                    fac00, fac01, fac10, fac11, &
                    selffac, selffrac, indself, forfac, forfrac, indfor, &
                    sfluxzen, taug, taur)

      call taumol24(ncol, nlayers, &
                    colh2o, colco2, colch4, colo2, colo3, colmol, &
                    laytrop, jp, jt, jt1, &
                    fac00, fac01, fac10, fac11, &
                    selffac, selffrac, indself, forfac, forfrac, indfor, &
                    sfluxzen, taug, taur)

      call taumol25(ncol, nlayers, &
                    colh2o, colco2, colch4, colo2, colo3, colmol, &
                    laytrop, jp, jt, jt1, &
                    fac00, fac01, fac10, fac11, &
                    selffac, selffrac, indself, forfac, forfrac, indfor, &
                    sfluxzen, taug, taur)

      call taumol26(ncol, nlayers, &
                    colh2o, colco2, colch4, colo2, colo3, colmol, &
                    laytrop, jp, jt, jt1, &
                    fac00, fac01, fac10, fac11, &
                    selffac, selffrac, indself, forfac, forfrac, indfor, &
                    sfluxzen, taug, taur)

      call taumol27(ncol, nlayers, &
                    colh2o, colco2, colch4, colo2, colo3, colmol, &
                    laytrop, jp, jt, jt1, &
                    fac00, fac01, fac10, fac11, &
                    selffac, selffrac, indself, forfac, forfrac, indfor, &
                    sfluxzen, taug, taur)

      call taumol28(ncol, nlayers, &
                    colh2o, colco2, colch4, colo2, colo3, colmol, &
                    laytrop, jp, jt, jt1, &
                    fac00, fac01, fac10, fac11, &
                    selffac, selffrac, indself, forfac, forfrac, indfor, &
                    sfluxzen, taug, taur)

      call taumol29(ncol, nlayers, &
                    colh2o, colco2, colch4, colo2, colo3, colmol, &
                    laytrop, jp, jt, jt1, &
                    fac00, fac01, fac10, fac11, &
                    selffac, selffrac, indself, forfac, forfrac, indfor, &
                    sfluxzen, taug, taur)

      end subroutine



      subroutine taumol16(ncol, nlayers, &
                          colh2o, colco2, colch4, colo2, colo3, colmol, &
                          laytrop, jp, jt, jt1, &
                          fac00, fac01, fac10, fac11, &
                          selffac, selffrac, indself, forfac, forfrac, indfor, &
                          sfluxzen, taug, taur)








      use parrrsw_f, only : ng16
      use rrsw_kg16_f, only : absa, ka, absb, kb, forref, selfref, &
                            sfluxref, rayl, layreffr, strrat1



      integer , intent(in) :: ncol
      integer , intent(in) :: nlayers               

      integer , intent(in) :: laytrop(:)            
      integer , intent(in) :: jp(:,:)               
      integer , intent(in) :: jt(:,:)               
      integer , intent(in) :: jt1(:,:)              
                                                    

      real , intent(in) :: colh2o(:,:)              
      real , intent(in) :: colco2(:,:)              
      real , intent(in) :: colo3(:,:)               
      real , intent(in) :: colch4(:,:)              
      real , intent(in) :: colo2(:,:)               
      real , intent(in) :: colmol(:,:)              
                                                    

      integer , intent(in) :: indself(:,:)     
      integer , intent(in) :: indfor(:,:) 
      real , intent(in) :: selffac(:,:) 
      real , intent(in) :: selffrac(:,:) 
      real , intent(in) :: forfac(:,:) 
      real , intent(in) :: forfrac(:,:) 
                                                    

      real , intent(in) :: &                        
                       fac00(:,:) , fac01(:,:) , & 
                       fac10(:,:) , fac11(:,:)  
                                                    


      real, intent(inout)  :: sfluxzen(:,:)    
                                                         
      real, intent(inout)  :: taug(:,:,:)             
                                                         
      real, intent(inout)  :: taur(:,:,:)             
                                                         




      integer  :: ig, ind0, ind1, inds, indf, js, lay, laysolfr
      real  :: fac000, fac001, fac010, fac011, fac100, fac101, &
                       fac110, fac111, fs, speccomb, specmult, specparm, &
                       tauray





      integer :: iplon


!$acc kernels 
do lay = 1, nlayers ; do iplon = 1, 8
         if (lay <= laytrop(iplon)) then
         speccomb = colh2o(iplon,lay)  + strrat1*colch4(iplon,lay)
         specparm = colh2o(iplon,lay) /speccomb
         if (specparm .ge. oneminus) specparm = oneminus
         specmult = 8. *(specparm)
         js = 1 + int(specmult)
         fs = mod(specmult, 1.  )
         fac000 = (1.  - fs) * fac00(iplon,lay)
         fac010 = (1.  - fs) * fac10(iplon,lay)
         fac100 = fs * fac00(iplon,lay)
         fac110 = fs * fac10(iplon,lay)
         fac001 = (1.  - fs) * fac01(iplon,lay)
         fac011 = (1.  - fs) * fac11(iplon,lay)
         fac101 = fs * fac01(iplon,lay)
         fac111 = fs * fac11(iplon,lay)
         ind0 = ((jp(iplon,lay) -1)*5+(jt(iplon,lay) -1))*nspa(16) + js
         ind1 = (jp(iplon,lay) *5+(jt1(iplon,lay) -1))*nspa(16) + js
         inds = indself(iplon,lay)
         indf = indfor(iplon,lay)
         tauray = colmol(iplon,lay)  * rayl

         do ig = 1, ng16
            taug(iplon,lay,ig)  = speccomb * &
                (fac000 * absa(ind0   ,ig) + &
                 fac100 * absa(ind0 +1,ig) + &
                 fac010 * absa(ind0 +9,ig) + &
                 fac110 * absa(ind0+10,ig) + &
                 fac001 * absa(ind1   ,ig) + &
                 fac101 * absa(ind1 +1,ig) + &
                 fac011 * absa(ind1 +9,ig) + &
                 fac111 * absa(ind1+10,ig)) + &
                 colh2o(iplon,lay)  * &
                 (selffac(iplon,lay)  * (selfref(inds,ig) + &
                 selffrac(iplon,lay)  * &
                 (selfref(inds+1,ig) - selfref(inds,ig))) + &
                 forfac(iplon,lay)  * (forref(indf,ig) + &
                 forfrac(iplon,lay)  * &
                 (forref(indf+1,ig) - forref(indf,ig)))) 

            taur(iplon,lay,ig)  = tauray
         enddo
         end if
enddo;enddo
do lay=2,nlayers;do iplon=1,8;if(lay>laytrop(iplon))then;laysolfr=nlayers


















         ind0 = ((jp(iplon,lay) -13)*5+(jt(iplon,lay) -1))*nspb(16) + 1
         ind1 = ((jp(iplon,lay) -12)*5+(jt1(iplon,lay) -1))*nspb(16) + 1
         tauray = colmol(iplon,lay)  * rayl

         do ig = 1, ng16
            taug(iplon,lay,ig)  = colch4(iplon,lay)  * &
                (fac00(iplon,lay)  * absb(ind0  ,ig) + &
                 fac10(iplon,lay)  * absb(ind0+1,ig) + &
                 fac01(iplon,lay)  * absb(ind1  ,ig) + &
                 fac11(iplon,lay)  * absb(ind1+1,ig)) 

            if (laysolfr == lay) sfluxzen(iplon,ig)  = sfluxref(ig) 
            taur(iplon,lay,ig)  = tauray  
         enddo
endif;enddo;enddo
!$acc end kernels
 end subroutine taumol16


      subroutine taumol17(ncol, nlayers, &
                          colh2o, colco2, colch4, colo2, colo3, colmol, &
                          laytrop, jp, jt, jt1, &
                          fac00, fac01, fac10, fac11, &
                          selffac, selffrac, indself, forfac, forfrac, indfor, &
                          sfluxzen, taug, taur)








      use parrrsw_f, only : ng17, ngs16
      use rrsw_kg17_f, only : absa, ka, absb, kb, forref, selfref, &
                            sfluxref, rayl, layreffr, strrat




      integer , intent(in) :: ncol
      integer , intent(in) :: nlayers               

      integer , intent(in) :: laytrop(:)            
      integer , intent(in) :: jp(:,:)               
      integer , intent(in) :: jt(:,:)               
      integer , intent(in) :: jt1(:,:)              
                                                    

      real , intent(in) :: colh2o(:,:)              
      real , intent(in) :: colco2(:,:)              
      real , intent(in) :: colo3(:,:)               
      real , intent(in) :: colch4(:,:)              
      real , intent(in) :: colo2(:,:)               
      real , intent(in) :: colmol(:,:)              
                                                    

      integer , intent(in) :: indself(:,:)     
      integer , intent(in) :: indfor(:,:) 
      real , intent(in) :: selffac(:,:) 
      real , intent(in) :: selffrac(:,:) 
      real , intent(in) :: forfac(:,:) 
      real , intent(in) :: forfrac(:,:) 
                                                    

      real , intent(in) :: &                        
                       fac00(:,:) , fac01(:,:) , &
                       fac10(:,:) , fac11(:,:)  
                                                    


      real, intent(out)  :: sfluxzen(:,:)      
                                                         
      real, intent(out)  :: taug(:,:,:)        
                                                         
      real, intent(out)  :: taur(:,:,:)        
                                                         



      integer  :: ig, ind0, ind1, inds, indf, js, lay, laysolfr
      real  :: fac000, fac001, fac010, fac011, fac100, fac101, &
                       fac110, fac111, fs, speccomb, specmult, specparm, &
                       tauray





      integer :: iplon



    
do lay = 1, nlayers ; do iplon = 1, 8
        if (lay <= laytrop(iplon)) then
          
         speccomb = colh2o(iplon,lay)  + strrat*colco2(iplon,lay) 
         specparm = colh2o(iplon,lay) /speccomb 
         if (specparm .ge. oneminus) specparm = oneminus
         specmult = 8. *(specparm)
         js = 1 + int(specmult)
         fs = mod(specmult, 1.  )
         fac000 = (1.  - fs) * fac00(iplon,lay) 
         fac010 = (1.  - fs) * fac10(iplon,lay) 
         fac100 = fs * fac00(iplon,lay) 
         fac110 = fs * fac10(iplon,lay) 
         fac001 = (1.  - fs) * fac01(iplon,lay) 
         fac011 = (1.  - fs) * fac11(iplon,lay) 
         fac101 = fs * fac01(iplon,lay) 
         fac111 = fs * fac11(iplon,lay) 
         ind0 = ((jp(iplon,lay) -1)*5+(jt(iplon,lay) -1))*nspa(17) + js
         ind1 = (jp(iplon,lay) *5+(jt1(iplon,lay) -1))*nspa(17) + js
         inds = indself(iplon,lay) 
         indf = indfor(iplon,lay) 
         tauray = colmol(iplon,lay)  * rayl

         do ig = 1, ng17
            taug(iplon,lay,ngs16+ig)  = speccomb * &
                (fac000 * absa(ind0,ig) + &
                 fac100 * absa(ind0+1,ig) + &
                 fac010 * absa(ind0+9,ig) + &
                 fac110 * absa(ind0+10,ig) + &
                 fac001 * absa(ind1,ig) + &
                 fac101 * absa(ind1+1,ig) + &
                 fac011 * absa(ind1+9,ig) + &
                 fac111 * absa(ind1+10,ig)) + &
                 colh2o(iplon,lay)  * &
                 (selffac(iplon,lay)  * (selfref(inds,ig) + &
                 selffrac(iplon,lay)  * &
                 (selfref(inds+1,ig) - selfref(inds,ig))) + &
                 forfac(iplon,lay)  * (forref(indf,ig) + &
                 forfrac(iplon,lay)  * &
                 (forref(indf+1,ig) - forref(indf,ig)))) 
            taur(iplon,lay,ngs16+ig)  = tauray
         enddo

         else
         
        
         speccomb = colh2o(iplon,lay)  + strrat*colco2(iplon,lay) 
         specparm = colh2o(iplon,lay) /speccomb 
         if (specparm .ge. oneminus) specparm = oneminus
         specmult = 4. *(specparm)
         js = 1 + int(specmult)
         fs = mod(specmult, 1.  )
         fac000 = (1.  - fs) * fac00(iplon,lay) 
         fac010 = (1.  - fs) * fac10(iplon,lay) 
         fac100 = fs * fac00(iplon,lay) 
         fac110 = fs * fac10(iplon,lay) 
         fac001 = (1.  - fs) * fac01(iplon,lay) 
         fac011 = (1.  - fs) * fac11(iplon,lay) 
         fac101 = fs * fac01(iplon,lay) 
         fac111 = fs * fac11(iplon,lay) 
         ind0 = ((jp(iplon,lay) -13)*5+(jt(iplon,lay) -1))*nspb(17) + js
         ind1 = ((jp(iplon,lay) -12)*5+(jt1(iplon,lay) -1))*nspb(17) + js
         indf = indfor(iplon,lay) 
         tauray = colmol(iplon,lay)  * rayl

         do ig = 1, ng17
            taug(iplon,lay,ngs16+ig)  = speccomb * &
                (fac000 * absb(ind0,ig) + &
                 fac100 * absb(ind0+1,ig) + &
                 fac010 * absb(ind0+5,ig) + &
                 fac110 * absb(ind0+6,ig) + &
                 fac001 * absb(ind1,ig) + &
                 fac101 * absb(ind1+1,ig) + &
                 fac011 * absb(ind1+5,ig) + &
                 fac111 * absb(ind1+6,ig)) + &
                 colh2o(iplon,lay)  * &
                 forfac(iplon,lay)  * (forref(indf,ig) + &
                 forfrac(iplon,lay)  * &
                 (forref(indf+1,ig) - forref(indf,ig))) 

           
            taur(iplon,lay,ngs16+ig)  = tauray
         enddo
        endif
      enddo
      enddo
!$acc end kernels

!$acc kernels
do lay=2,nlayers;do iplon=1,8;if(lay>laytrop(iplon))then;laysolfr=nlayers
          
        if ((jp(iplon,lay-1)  .lt. layreffr) .and. (jp(iplon,lay)  .ge. layreffr)) then
            laysolfr = lay
        end if
          
        if (lay == laysolfr) then
              
          speccomb = colh2o(iplon,lay)  + strrat*colco2(iplon,lay) 
          specparm = colh2o(iplon,lay) /speccomb 
          if (specparm .ge. oneminus) specparm = oneminus
          specmult = 4. *(specparm)
          js = 1 + int(specmult)
          fs = mod(specmult, 1.  )
          do ig = 1, ng17 
            sfluxzen(iplon,ngs16+ig)  = sfluxref(ig,js) &
               + fs * (sfluxref(ig,js+1) - sfluxref(ig,js))
          end do
        end if
endif;enddo;enddo
!$acc end kernels      
      end subroutine taumol17


      subroutine taumol18(ncol, nlayers, &
                          colh2o, colco2, colch4, colo2, colo3, colmol, &
                          laytrop, jp, jt, jt1, &
                          fac00, fac01, fac10, fac11, &
                          selffac, selffrac, indself, forfac, forfrac, indfor, &
                          sfluxzen, taug, taur)








      use parrrsw_f, only : ng18, ngs17
      use rrsw_kg18_f, only : absa, ka, absb, kb, forref, selfref, &
                            sfluxref, rayl, layreffr, strrat




      integer , intent(in) :: ncol
      integer , intent(in) :: nlayers               

      integer , intent(in) :: laytrop(:)            
      integer , intent(in) :: jp(:,:)               
      integer , intent(in) :: jt(:,:)               
      integer , intent(in) :: jt1(:,:)              
                                                    

      real , intent(in) :: colh2o(:,:)              
      real , intent(in) :: colco2(:,:)              
      real , intent(in) :: colo3(:,:)               
      real , intent(in) :: colch4(:,:)              
      real , intent(in) :: colo2(:,:)               
      real , intent(in) :: colmol(:,:)              
                                                    

      integer , intent(in) :: indself(:,:)     
      integer , intent(in) :: indfor(:,:) 
      real , intent(in) :: selffac(:,:) 
      real , intent(in) :: selffrac(:,:) 
      real , intent(in) :: forfac(:,:) 
      real , intent(in) :: forfrac(:,:) 
                                                    

      real , intent(in) :: &                        
                       fac00(:,:) , fac01(:,:) , & 
                       fac10(:,:) , fac11(:,:)  
                                                    


      real, intent(out)  :: sfluxzen(:,:)      
                                                         
      real, intent(out)  :: taug(:,:,:)        
                                                         
      real, intent(out)  :: taur(:,:,:)        
                                                         



      integer  :: ig, ind0, ind1, inds, indf, js, lay, laysolfr(8)
      real  :: fac000, fac001, fac010, fac011, fac100, fac101, &
                       fac110, fac111, fs, speccomb, specmult, specparm, &
                       tauray





      integer :: iplon

    


!$acc kernels      

      laysolfr = laytrop
      do lay = 1, nlayers
        do iplon = 1, 8
          if (lay <= laytrop(iplon)) then
              speccomb = colh2o(iplon,lay)  + strrat*colch4(iplon,lay) 
              specparm = colh2o(iplon,lay) /speccomb 
              if (specparm .ge. oneminus) specparm = oneminus
              specmult = 8. *(specparm)
              js = 1 + int(specmult)
              fs = mod(specmult, 1.  )
              if (jp(iplon,lay)  .lt. layreffr .and. jp(iplon,lay+1)  .ge. layreffr) &
              LAYSOLFR(iplon) = min(lay+1,laytrop(iplon) )
              do ig = 1, ng18
                if (lay .eq. LAYSOLFR(iplon)) sfluxzen(iplon,ngs17+ig)  = sfluxref(ig,js) &
                  + fs * (sfluxref(ig,js+1) - sfluxref(ig,js))
              end do
         endif
          end do
      end do
!$acc end kernels
      
!$acc kernels 
do lay = 1, nlayers ; do iplon = 1, 8
        if (lay <= laytrop(iplon)) then
          
       
         speccomb = colh2o(iplon,lay)  + strrat*colch4(iplon,lay) 
         specparm = colh2o(iplon,lay) /speccomb 
         if (specparm .ge. oneminus) specparm = oneminus
         specmult = 8. *(specparm)
         js = 1 + int(specmult)
         fs = mod(specmult, 1.  )
         fac000 = (1.  - fs) * fac00(iplon,lay) 
         fac010 = (1.  - fs) * fac10(iplon,lay) 
         fac100 = fs * fac00(iplon,lay) 
         fac110 = fs * fac10(iplon,lay) 
         fac001 = (1.  - fs) * fac01(iplon,lay) 
         fac011 = (1.  - fs) * fac11(iplon,lay) 
         fac101 = fs * fac01(iplon,lay) 
         fac111 = fs * fac11(iplon,lay) 
         ind0 = ((jp(iplon,lay) -1)*5+(jt(iplon,lay) -1))*nspa(18) + js
         ind1 = (jp(iplon,lay) *5+(jt1(iplon,lay) -1))*nspa(18) + js
         inds = indself(iplon,lay) 
         indf = indfor(iplon,lay) 
         tauray = colmol(iplon,lay)  * rayl

         do ig = 1, ng18
            taug(iplon,lay,ngs17+ig)  = speccomb * &
                (fac000 * absa(ind0,ig) + &
                 fac100 * absa(ind0+1,ig) + &
                 fac010 * absa(ind0+9,ig) + &
                 fac110 * absa(ind0+10,ig) + &
                 fac001 * absa(ind1,ig) + &
                 fac101 * absa(ind1+1,ig) + &
                 fac011 * absa(ind1+9,ig) + &
                 fac111 * absa(ind1+10,ig)) + &
                 colh2o(iplon,lay)  * &
                 (selffac(iplon,lay)  * (selfref(inds,ig) + &
                 selffrac(iplon,lay)  * &
                 (selfref(inds+1,ig) - selfref(inds,ig))) + &
                 forfac(iplon,lay)  * (forref(indf,ig) + &
                 forfrac(iplon,lay)  * &
                 (forref(indf+1,ig) - forref(indf,ig)))) 

        
            taur(iplon,lay,ngs17+ig)  = tauray
         enddo
      
        else


              

         ind0 = ((jp(iplon,lay) -13)*5+(jt(iplon,lay) -1))*nspb(18) + 1
         ind1 = ((jp(iplon,lay) -12)*5+(jt1(iplon,lay) -1))*nspb(18) + 1
         tauray = colmol(iplon,lay)  * rayl

         do ig = 1, ng18
            taug(iplon,lay,ngs17+ig)  = colch4(iplon,lay)  * &
                (fac00(iplon,lay)  * absb(ind0,ig) + &
                 fac10(iplon,lay)  * absb(ind0+1,ig) + &
                 fac01(iplon,lay)  * absb(ind1,ig) + &	  
                 fac11(iplon,lay)  * absb(ind1+1,ig)) 

           taur(iplon,lay,ngs17+ig)  = tauray
         enddo
        end if
enddo;enddo       

!$acc end kernels
      end subroutine taumol18


      subroutine taumol19(ncol, nlayers, &
                          colh2o, colco2, colch4, colo2, colo3, colmol, &
                          laytrop, jp, jt, jt1, &
                          fac00, fac01, fac10, fac11, &
                          selffac, selffrac, indself, forfac, forfrac, indfor, &
                          sfluxzen, taug, taur)








      use parrrsw_f, only : ng19, ngs18
      use rrsw_kg19_f, only : absa, ka, absb, kb, forref, selfref, &
                            sfluxref, rayl, layreffr, strrat




      integer , intent(in) :: ncol
      integer , intent(in) :: nlayers               

      integer , intent(in) :: laytrop(:)            
      integer , intent(in) :: jp(:,:)               
      integer , intent(in) :: jt(:,:)               
      integer , intent(in) :: jt1(:,:)              
                                                    

      real , intent(in) :: colh2o(:,:)              
      real , intent(in) :: colco2(:,:)              
      real , intent(in) :: colo3(:,:)               
      real , intent(in) :: colch4(:,:)              
      real , intent(in) :: colo2(:,:)               
      real , intent(in) :: colmol(:,:)              
                                                    

      integer , intent(in) :: indself(:,:)     
      integer , intent(in) :: indfor(:,:) 
      real , intent(in) :: selffac(:,:) 
      real , intent(in) :: selffrac(:,:) 
      real , intent(in) :: forfac(:,:) 
      real , intent(in) :: forfrac(:,:) 
                                                    

      real , intent(in) :: &                        
                       fac00(:,:) , fac01(:,:) , &  
                       fac10(:,:) , fac11(:,:)  
                                                    


      real, intent(out)  :: sfluxzen(:,:)      
                                                         
      real, intent(out)  :: taug(:,:,:)        
                                                         
      real, intent(out)  :: taur(:,:,:)        
                                                         



      integer  :: ig, ind0, ind1, inds, indf, js, lay, laysolfr(8)
      real  :: fac000, fac001, fac010, fac011, fac100, fac101, &
                  fac110, fac111, fs, speccomb, specmult, specparm, &
                  tauray





      integer :: iplon

	        
      strrat = 5.49281 
      layreffr = 3      
      
      laysolfr = laytrop
      do lay = 1, nlayers
        do iplon = 1, 8
          if (lay <= laytrop(iplon)) then
            
        if (jp(iplon,lay)  .lt. layreffr .and. jp(iplon,lay+1)  .ge. layreffr) &
            LAYSOLFR(iplon) = min(lay+1,laytrop(iplon) )
     
         if (lay .eq. LAYSOLFR(iplon)) then 
                 speccomb = colh2o(iplon,lay)  + strrat*colco2(iplon,lay) 
         specparm = colh2o(iplon,lay) /speccomb 
         if (specparm .ge. oneminus) specparm = oneminus
         specmult = 8. *(specparm)
         js = 1 + int(specmult)
         fs = mod(specmult, 1.  )
        
         do ig = 1 , ng19
            sfluxzen(iplon,ngs18+ig)  = sfluxref(ig,js) &
               + fs * (sfluxref(ig,js+1) - sfluxref(ig,js))
         end do
         endif
         endif

      end do
      end do
!$acc end kernels
      
      
!$acc kernels 
do lay = 1, nlayers ; do iplon = 1, 8






         if (lay <= laytrop(iplon)) then
       
         speccomb = colh2o(iplon,lay)  + strrat*colco2(iplon,lay) 
         specparm = colh2o(iplon,lay) /speccomb 
         if (specparm .ge. oneminus) specparm = oneminus
         specmult = 8. *(specparm)
         js = 1 + int(specmult)
         fs = mod(specmult, 1.  )
         fac000 = (1.  - fs) * fac00(iplon,lay) 
         fac010 = (1.  - fs) * fac10(iplon,lay) 
         fac100 = fs * fac00(iplon,lay) 
         fac110 = fs * fac10(iplon,lay) 
         fac001 = (1.  - fs) * fac01(iplon,lay) 
         fac011 = (1.  - fs) * fac11(iplon,lay) 
         fac101 = fs * fac01(iplon,lay) 
         fac111 = fs * fac11(iplon,lay) 
         ind0 = ((jp(iplon,lay) -1)*5+(jt(iplon,lay) -1))*nspa(19) + js
         ind1 = (jp(iplon,lay) *5+(jt1(iplon,lay) -1))*nspa(19) + js
         inds = indself(iplon,lay) 
         indf = indfor(iplon,lay) 
         tauray = colmol(iplon,lay)  * rayl

         do ig = 1 , ng19
            taug(iplon,lay,ngs18+ig)  = speccomb * &
                (fac000 * absa(ind0,ig) + &
                 fac100 * absa(ind0+1,ig) + &
                 fac010 * absa(ind0+9,ig) + &
                 fac110 * absa(ind0+10,ig) + &
                 fac001 * absa(ind1,ig) + &
                 fac101 * absa(ind1+1,ig) + &
                 fac011 * absa(ind1+9,ig) + &
                 fac111 * absa(ind1+10,ig)) + &
                 colh2o(iplon,lay)  * &
                 (selffac(iplon,lay)  * (selfref(inds,ig) + &
                 selffrac(iplon,lay)  * &
                 (selfref(inds+1,ig) - selfref(inds,ig))) + & 
                 forfac(iplon,lay)  * (forref(indf,ig) + &
                 forfrac(iplon,lay)  * &
                 (forref(indf+1,ig) - forref(indf,ig)))) 

            taur(iplon,lay,ngs18+ig)  = tauray   
         enddo
        else


  
         ind0 = ((jp(iplon,lay) -13)*5+(jt(iplon,lay) -1))*nspb(19) + 1
         ind1 = ((jp(iplon,lay) -12)*5+(jt1(iplon,lay) -1))*nspb(19) + 1
         tauray = colmol(iplon,lay)  * rayl

         do ig = 1 , ng19
            taug(iplon,lay,ngs18+ig)  = colco2(iplon,lay)  * &
                (fac00(iplon,lay)  * absb(ind0,ig) + &
                 fac10(iplon,lay)  * absb(ind0+1,ig) + &
                 fac01(iplon,lay)  * absb(ind1,ig) + &
                 fac11(iplon,lay)  * absb(ind1+1,ig)) 

            taur(iplon,lay,ngs18+ig)  = tauray   
         enddo
        end if
enddo;enddo       
!$acc end kernels
      end subroutine taumol19


      subroutine taumol20(ncol, nlayers, &
                          colh2o, colco2, colch4, colo2, colo3, colmol, &
                          laytrop, jp, jt, jt1, &
                          fac00, fac01, fac10, fac11, &
                          selffac, selffrac, indself, forfac, forfrac, indfor, &
                          sfluxzen, taug, taur)








      use parrrsw_f, only : ng20, ngs19
      use rrsw_kg20_f, only : absa, ka, absb, kb, forref, selfref, &
                            sfluxref, absch4, rayl, layreffr



      implicit none


      integer , intent(in) :: ncol
      integer , intent(in) :: nlayers               

      integer , intent(in) :: laytrop(:)            
      integer , intent(in) :: jp(:,:)               
      integer , intent(in) :: jt(:,:)               
      integer , intent(in) :: jt1(:,:)              
                                                    

      real , intent(in) :: colh2o(:,:)              
      real , intent(in) :: colco2(:,:)              
      real , intent(in) :: colo3(:,:)               
      real , intent(in) :: colch4(:,:)              
      real , intent(in) :: colo2(:,:)               
      real , intent(in) :: colmol(:,:)              
                                                    

      integer , intent(in) :: indself(:,:)     
      integer , intent(in) :: indfor(:,:) 
      real , intent(in) :: selffac(:,:) 
      real , intent(in) :: selffrac(:,:) 
      real , intent(in) :: forfac(:,:) 
      real , intent(in) :: forfrac(:,:) 
                                                    

      real , intent(in) :: &                        
                       fac00(:,:) , fac01(:,:) , &  
                       fac10(:,:) , fac11(:,:)  
                                                    


      real, intent(out)  :: sfluxzen(:,:)      
                                                         
      real, intent(out)  :: taug(:,:,:)        
                                                         
      real, intent(out)  :: taur(:,:,:)        
                                                         


      integer  :: ig, ind0, ind1, inds, indf, js, lay, laysolfr(8)



      real  :: fac000, fac001, fac010, fac011, fac100, fac101, &
                  fac110, fac111, fs, speccomb, specmult, specparm, &
                  tauray
      integer :: iplon



      laysolfr = laytrop
      do lay = 1, nlayers
        do iplon = 1, 8
          if (lay <= laytrop(iplon)) then

         if (jp(iplon,lay)  .lt. layreffr .and. jp(iplon,lay+1)  .ge. layreffr) &
            LAYSOLFR(iplon) = min(lay+1,laytrop(iplon) )
         if (lay .eq. LAYSOLFR(iplon)) then 
             do ig = 1, ng20 
                 sfluxzen(iplon,ngs19+ig)  = sfluxref(ig) 
             end do
         end if
         endif
      end do
      end do
!$acc end kernels
       
!$acc kernels 
do lay = 1, nlayers ; do iplon = 1, 8
         if (lay <= laytrop(iplon)) then
         
         ind0 = ((jp(iplon,lay) -1)*5+(jt(iplon,lay) -1))*nspa(20) + 1
         ind1 = (jp(iplon,lay) *5+(jt1(iplon,lay) -1))*nspa(20) + 1
         inds = indself(iplon,lay) 
         indf = indfor(iplon,lay) 
         tauray = colmol(iplon,lay)  * rayl

         do ig = 1, ng20
            taug(iplon,lay,ngs19+ig)  = colh2o(iplon,lay)  * &
               ((fac00(iplon,lay)  * absa(ind0,ig) + &
                 fac10(iplon,lay)  * absa(ind0+1,ig) + &
                 fac01(iplon,lay)  * absa(ind1,ig) + &
                 fac11(iplon,lay)  * absa(ind1+1,ig)) + &
                 selffac(iplon,lay)  * (selfref(inds,ig) + & 
                 selffrac(iplon,lay)  * &
                 (selfref(inds+1,ig) - selfref(inds,ig))) + &
                 forfac(iplon,lay)  * (forref(indf,ig) + &
                 forfrac(iplon,lay)  * &
                 (forref(indf+1,ig) - forref(indf,ig)))) &
                 + colch4(iplon,lay)  * absch4(ig)

            taur(iplon,lay,ngs19+ig)  = tauray 
           
         enddo
         else


      
         ind0 = ((jp(iplon,lay) -13)*5+(jt(iplon,lay) -1))*nspb(20) + 1
         ind1 = ((jp(iplon,lay) -12)*5+(jt1(iplon,lay) -1))*nspb(20) + 1
         indf = indfor(iplon,lay) 
         tauray = colmol(iplon,lay)  * rayl

         do ig = 1, ng20
            taug(iplon,lay,ngs19+ig)  = colh2o(iplon,lay)  * &
                (fac00(iplon,lay)  * absb(ind0,ig) + &
                 fac10(iplon,lay)  * absb(ind0+1,ig) + &
                 fac01(iplon,lay)  * absb(ind1,ig) + &
                 fac11(iplon,lay)  * absb(ind1+1,ig) + &
                 forfac(iplon,lay)  * (forref(indf,ig) + &
                 forfrac(iplon,lay)  * &
                 (forref(indf+1,ig) - forref(indf,ig)))) + &
                 colch4(iplon,lay)  * absch4(ig)

            taur(iplon,lay,ngs19+ig)  = tauray 
         enddo
         end if
enddo;enddo

!$acc end kernels
      end subroutine taumol20


      subroutine taumol21(ncol, nlayers, &
                          colh2o, colco2, colch4, colo2, colo3, colmol, &
                          laytrop, jp, jt, jt1, &
                          fac00, fac01, fac10, fac11, &
                          selffac, selffrac, indself, forfac, forfrac, indfor, &
                          sfluxzen, taug, taur)








      use parrrsw_f, only : ng21, ngs20
      use rrsw_kg21_f, only : absa, ka, absb, kb, forref, selfref, &
                            sfluxref, rayl, layreffr, strrat




      integer , intent(in) :: ncol
      integer , intent(in) :: nlayers               

      integer , intent(in) :: laytrop(:)            
      integer , intent(in) :: jp(:,:)               
      integer , intent(in) :: jt(:,:)               
      integer , intent(in) :: jt1(:,:)              
                                                    

      real , intent(in) :: colh2o(:,:)              
      real , intent(in) :: colco2(:,:)              
      real , intent(in) :: colo3(:,:)               
      real , intent(in) :: colch4(:,:)              
      real , intent(in) :: colo2(:,:)               
      real , intent(in) :: colmol(:,:)              
                                                    

      integer , intent(in) :: indself(:,:)     
      integer , intent(in) :: indfor(:,:) 
      real , intent(in) :: selffac(:,:) 
      real , intent(in) :: selffrac(:,:) 
      real , intent(in) :: forfac(:,:) 
      real , intent(in) :: forfrac(:,:) 
                                                    

      real , intent(in) :: &                        
                       fac00(:,:) , fac01(:,:) , &  
                       fac10(:,:) , fac11(:,:)  
                                                    


      real, intent(out)  :: sfluxzen(:,:)      
                                                         
      real, intent(out)  :: taug(:,:,:)        
                                                         
      real, intent(out)  :: taur(:,:,:)        
                                                         


      integer  :: ig, ind0, ind1, inds, indf, js, lay, laysolfr(8)

      real  :: fac000, fac001, fac010, fac011, fac100, fac101, &
                  fac110, fac111, fs, speccomb, specmult, specparm, &
                  tauray





      integer :: iplon
        


     
      laysolfr = laytrop
      do lay = 1, nlayers
        do iplon = 1, 8
          if (lay <= laytrop(iplon)) then

         if (jp(iplon,lay)  .lt. layreffr .and. jp(iplon,lay+1)  .ge. layreffr) &
            LAYSOLFR(iplon) = min(lay+1,laytrop(iplon) )
         if (lay .eq. LAYSOLFR(iplon)) then 
                speccomb = colh2o(iplon,lay)  + strrat*colco2(iplon,lay) 
         specparm = colh2o(iplon,lay) /speccomb 
         if (specparm .ge. oneminus) specparm = oneminus
         specmult = 8. *(specparm)
         js = 1 + int(specmult)
         fs = mod(specmult, 1.  )
               do ig = 1, ng21
              sfluxzen(iplon,ngs20+ig)  = sfluxref(ig,js) &
               + fs * (sfluxref(ig,js+1) - sfluxref(ig,js))
               end do
          end if

         endif
      end do
      end do        
!$acc end kernels




      

        
!$acc kernels 
do lay = 1, nlayers ; do iplon = 1, 8
         if (lay <= laytrop(iplon)) then
         speccomb = colh2o(iplon,lay)  + strrat*colco2(iplon,lay) 
         specparm = colh2o(iplon,lay) /speccomb 
         if (specparm .ge. oneminus) specparm = oneminus
         specmult = 8. *(specparm)
         js = 1 + int(specmult)
         fs = mod(specmult, 1.  )
         fac000 = (1.  - fs) * fac00(iplon,lay) 
         fac010 = (1.  - fs) * fac10(iplon,lay) 
         fac100 = fs * fac00(iplon,lay) 
         fac110 = fs * fac10(iplon,lay) 
         fac001 = (1.  - fs) * fac01(iplon,lay) 
         fac011 = (1.  - fs) * fac11(iplon,lay) 
         fac101 = fs * fac01(iplon,lay) 
         fac111 = fs * fac11(iplon,lay) 
         ind0 = ((jp(iplon,lay) -1)*5+(jt(iplon,lay) -1))*nspa(21) + js
         ind1 = (jp(iplon,lay) *5+(jt1(iplon,lay) -1))*nspa(21) + js
         inds = indself(iplon,lay) 
         indf = indfor(iplon,lay) 
         tauray = colmol(iplon,lay)  * rayl

         do ig = 1, ng21
            taug(iplon,lay,ngs20+ig)  = speccomb * &
                (fac000 * absa(ind0,ig) + &
                 fac100 * absa(ind0+1,ig) + &
                 fac010 * absa(ind0+9,ig) + &
                 fac110 * absa(ind0+10,ig) + &
                 fac001 * absa(ind1,ig) + &
                 fac101 * absa(ind1+1,ig) + &
                 fac011 * absa(ind1+9,ig) + &
                 fac111 * absa(ind1+10,ig)) + &
                 colh2o(iplon,lay)  * &
                 (selffac(iplon,lay)  * (selfref(inds,ig) + &
                 selffrac(iplon,lay)  * &
                 (selfref(inds+1,ig) - selfref(inds,ig))) + &
                 forfac(iplon,lay)  * (forref(indf,ig) + &
                 forfrac(iplon,lay)  * &
                 (forref(indf+1,ig) - forref(indf,ig))))

          
            taur(iplon,lay,ngs20+ig)  = tauray
         enddo
        else



         speccomb = colh2o(iplon,lay)  + strrat*colco2(iplon,lay) 
         specparm = colh2o(iplon,lay) /speccomb 
         if (specparm .ge. oneminus) specparm = oneminus
         specmult = 4. *(specparm)
         js = 1 + int(specmult)
         fs = mod(specmult, 1.  )
         fac000 = (1.  - fs) * fac00(iplon,lay) 
         fac010 = (1.  - fs) * fac10(iplon,lay) 
         fac100 = fs * fac00(iplon,lay) 
         fac110 = fs * fac10(iplon,lay) 
         fac001 = (1.  - fs) * fac01(iplon,lay) 
         fac011 = (1.  - fs) * fac11(iplon,lay) 
         fac101 = fs * fac01(iplon,lay) 
         fac111 = fs * fac11(iplon,lay) 
         ind0 = ((jp(iplon,lay) -13)*5+(jt(iplon,lay) -1))*nspb(21) + js
         ind1 = ((jp(iplon,lay) -12)*5+(jt1(iplon,lay) -1))*nspb(21) + js
         indf = indfor(iplon,lay) 
         tauray = colmol(iplon,lay)  * rayl

         do ig = 1, ng21
            taug(iplon,lay,ngs20+ig)  = speccomb * &
                (fac000 * absb(ind0,ig) + &
                 fac100 * absb(ind0+1,ig) + &
                 fac010 * absb(ind0+5,ig) + &
                 fac110 * absb(ind0+6,ig) + &
                 fac001 * absb(ind1,ig) + &
                 fac101 * absb(ind1+1,ig) + &
                 fac011 * absb(ind1+5,ig) + &
                 fac111 * absb(ind1+6,ig)) + &
                 colh2o(iplon,lay)  * &
                 forfac(iplon,lay)  * (forref(indf,ig) + &
                 forfrac(iplon,lay)  * &
                 (forref(indf+1,ig) - forref(indf,ig)))

            taur(iplon,lay,ngs20+ig)  = tauray
         enddo
        end if
enddo;enddo
      
!$acc end kernels
      end subroutine taumol21


      subroutine taumol22(ncol, nlayers, &
                          colh2o, colco2, colch4, colo2, colo3, colmol, &
                          laytrop, jp, jt, jt1, &
                          fac00, fac01, fac10, fac11, &
                          selffac, selffrac, indself, forfac, forfrac, indfor, &
                          sfluxzen, taug, taur)








      use parrrsw_f, only : ng22, ngs21
      use rrsw_kg22_f, only : absa, ka, absb, kb, forref, selfref, &
                            sfluxref, rayl, layreffr, strrat




      integer , intent(in) :: ncol
      integer , intent(in) :: nlayers               

      integer , intent(in) :: laytrop(:)            
      integer , intent(in) :: jp(:,:)               
      integer , intent(in) :: jt(:,:)               
      integer , intent(in) :: jt1(:,:)              
                                                    

      real , intent(in) :: colh2o(:,:)              
      real , intent(in) :: colco2(:,:)              
      real , intent(in) :: colo3(:,:)               
      real , intent(in) :: colch4(:,:)              
      real , intent(in) :: colo2(:,:)               
      real , intent(in) :: colmol(:,:)              
                                                    

      integer , intent(in) :: indself(:,:)     
      integer , intent(in) :: indfor(:,:) 
      real , intent(in) :: selffac(:,:) 
      real , intent(in) :: selffrac(:,:) 
      real , intent(in) :: forfac(:,:) 
      real , intent(in) :: forfrac(:,:) 
                                                    

      real , intent(in) :: &                        
                       fac00(:,:) , fac01(:,:) , &  
                       fac10(:,:) , fac11(:,:)  
                                                    


      real, intent(out)  :: sfluxzen(:,:)      
                                                         
      real, intent(out)  :: taug(:,:,:)        
                                                         
      real, intent(out)  :: taur(:,:,:)        
                                                         


      integer  :: ig, ind0, ind1, inds, indf, js, lay, laysolfr(8)

      real  :: fac000, fac001, fac010, fac011, fac100, fac101, &
                  fac110, fac111, fs, speccomb, specmult, specparm, &
                  tauray, o2adj, o2cont





      integer :: iplon




      o2adj = 1.6 
      






      
      laysolfr = laytrop
      do lay = 1, nlayers
        do iplon = 1, 8
          if (lay <= laytrop(iplon)) then

            if (jp(iplon,lay)  .lt. layreffr .and. jp(iplon,lay+1)  .ge. layreffr) &
            LAYSOLFR(iplon) = min(lay+1,laytrop(iplon) )
                 
            if (lay .eq. LAYSOLFR(iplon)) then 
            speccomb = colh2o(iplon,lay)  + o2adj*strrat*colo2(iplon,lay) 
            specparm = colh2o(iplon,lay) /speccomb 
            if (specparm .ge. oneminus) specparm = oneminus
            specmult = 8. *(specparm)
    
            js = 1 + int(specmult)
            fs = mod(specmult, 1.  )
            do ig = 1, ng22                                 
                                 
               sfluxzen(iplon,ngs21+ig)  = sfluxref(ig,js) &
                + fs * (sfluxref(ig,js+1) - sfluxref(ig,js))
            end do
            end if
         endif
         end do
      end do
 !$acc end kernels
 

!$acc kernels 
do lay = 1, nlayers ; do iplon = 1, 8

         if (lay<=laytrop(iplon)) then
  
         o2cont = 4.35e-4 *colo2(iplon,lay) /(350.0 *2.0 )
         speccomb = colh2o(iplon,lay)  + o2adj*strrat*colo2(iplon,lay) 
         specparm = colh2o(iplon,lay) /speccomb 
         if (specparm .ge. oneminus) specparm = oneminus
         specmult = 8. *(specparm)

         js = 1 + int(specmult)
         fs = mod(specmult, 1.  )
         fac000 = (1.  - fs) * fac00(iplon,lay) 
         fac010 = (1.  - fs) * fac10(iplon,lay) 
         fac100 = fs * fac00(iplon,lay) 
         fac110 = fs * fac10(iplon,lay) 
         fac001 = (1.  - fs) * fac01(iplon,lay) 
         fac011 = (1.  - fs) * fac11(iplon,lay) 
         fac101 = fs * fac01(iplon,lay) 
         fac111 = fs * fac11(iplon,lay) 
         ind0 = ((jp(iplon,lay) -1)*5+(jt(iplon,lay) -1))*nspa(22) + js
         ind1 = (jp(iplon,lay) *5+(jt1(iplon,lay) -1))*nspa(22) + js
         inds = indself(iplon,lay) 
         indf = indfor(iplon,lay) 
         tauray = colmol(iplon,lay)  * rayl

         do ig = 1, ng22
            taug(iplon,lay,ngs21+ig)  = speccomb * &
                (fac000 * absa(ind0,ig) + &
                 fac100 * absa(ind0+1,ig) + &
                 fac010 * absa(ind0+9,ig) + &
                 fac110 * absa(ind0+10,ig) + &
                 fac001 * absa(ind1,ig) + &
                 fac101 * absa(ind1+1,ig) + &
                 fac011 * absa(ind1+9,ig) + &
                 fac111 * absa(ind1+10,ig)) + &
                 colh2o(iplon,lay)  * &
                 (selffac(iplon,lay)  * (selfref(inds,ig) + &
                 selffrac(iplon,lay)  * &
                  (selfref(inds+1,ig) - selfref(inds,ig))) + &
                 forfac(iplon,lay)  * (forref(indf,ig) + &
                 forfrac(iplon,lay)  * &
                 (forref(indf+1,ig) - forref(indf,ig)))) &
                 + o2cont


            taur(iplon,lay,ngs21+ig)  = tauray
         enddo

         else


      
         o2cont = 4.35e-4 *colo2(iplon,lay) /(350.0 *2.0 )
         ind0 = ((jp(iplon,lay) -13)*5+(jt(iplon,lay) -1))*nspb(22) + 1
         ind1 = ((jp(iplon,lay) -12)*5+(jt1(iplon,lay) -1))*nspb(22) + 1
         tauray = colmol(iplon,lay)  * rayl

         do ig = 1, ng22
            taug(iplon,lay,ngs21+ig)  = colo2(iplon,lay)  * o2adj * &
                (fac00(iplon,lay)  * absb(ind0,ig) + &
                 fac10(iplon,lay)  * absb(ind0+1,ig) + &
                 fac01(iplon,lay)  * absb(ind1,ig) + &
                 fac11(iplon,lay)  * absb(ind1+1,ig)) + &
                 o2cont

            taur(iplon,lay,ngs21+ig)  = tauray
         enddo
         end if
enddo;enddo
      
!$acc end kernels
      end subroutine taumol22


      subroutine taumol23(ncol, nlayers, &
                          colh2o, colco2, colch4, colo2, colo3, colmol, &
                          laytrop, jp, jt, jt1, &
                          fac00, fac01, fac10, fac11, &
                          selffac, selffrac, indself, forfac, forfrac, indfor, &
                          sfluxzen, taug, taur)








      use parrrsw_f, only : ng23, ngs22
      use rrsw_kg23_f, only : absa, ka, forref, selfref, &
                            sfluxref, rayl, layreffr, givfac




      integer , intent(in) :: ncol
      integer , intent(in) :: nlayers               

      integer , intent(in) :: laytrop(:)            
      integer , intent(in) :: jp(:,:)               
      integer , intent(in) :: jt(:,:)               
      integer , intent(in) :: jt1(:,:)              
                                                    

      real , intent(in) :: colh2o(:,:)              
      real , intent(in) :: colco2(:,:)              
      real , intent(in) :: colo3(:,:)               
      real , intent(in) :: colch4(:,:)              
      real , intent(in) :: colo2(:,:)               
      real , intent(in) :: colmol(:,:)              
                                                    

      integer , intent(in) :: indself(:,:)     
      integer , intent(in) :: indfor(:,:) 
      real , intent(in) :: selffac(:,:) 
      real , intent(in) :: selffrac(:,:) 
      real , intent(in) :: forfac(:,:) 
      real , intent(in) :: forfrac(:,:) 
                                                    

      real , intent(in) :: &                        
                       fac00(:,:) , fac01(:,:) , &  
                       fac10(:,:) , fac11(:,:)  
                                                    


      real, intent(out)  :: sfluxzen(:,:)      
                                                         
      real, intent(out)  :: taug(:,:,:)        
                                                         
      real, intent(out)  :: taur(:,:,:)        
                                                         


      integer  :: ig, ind0, ind1, inds, indf, js, lay, laysolfr(8)

      real  :: fac000, fac001, fac010, fac011, fac100, fac101, &
                  fac110, fac111, fs, speccomb, specmult, specparm, &
                  tauray





      integer :: iplon










      
      laysolfr = laytrop
      do lay = 1, nlayers
        do iplon = 1, 8
          if (lay <= laytrop(iplon)) then

          if (jp(iplon,lay)  .lt. layreffr .and. jp(iplon,lay+1)  .ge. layreffr) &
            LAYSOLFR(iplon) = min(lay+1,laytrop(iplon) )
         
          if (lay .eq. LAYSOLFR(iplon)) then 
            do ig = 1, ng23
              sfluxzen(iplon,ngs22+ig)  = sfluxref(ig) 
            end do
          end if
         endif
      end do
      end do      
!$acc end kernels   
      


!$acc kernels 
do lay = 1, nlayers ; do iplon = 1, 8
         if (lay <= laytrop(iplon)) then
         if (jp(iplon,lay)  .lt. layreffr .and. jp(iplon,lay+1)  .ge. layreffr) &
            laysolfr = min(lay+1,laytrop(iplon) )
         ind0 = ((jp(iplon,lay) -1)*5+(jt(iplon,lay) -1))*nspa(23) + 1
         ind1 = (jp(iplon,lay) *5+(jt1(iplon,lay) -1))*nspa(23) + 1
         inds = indself(iplon,lay) 
         indf = indfor(iplon,lay) 

         do ig = 1, ng23
            tauray = colmol(iplon,lay)  * rayl(ig)
            taug(iplon,lay,ngs22+ig)  = colh2o(iplon,lay)  * &
                (givfac * (fac00(iplon,lay)  * absa(ind0,ig) + &
                 fac10(iplon,lay)  * absa(ind0+1,ig) + &
                 fac01(iplon,lay)  * absa(ind1,ig) + &
                 fac11(iplon,lay)  * absa(ind1+1,ig)) + &
                 selffac(iplon,lay)  * (selfref(inds,ig) + &
                 selffrac(iplon,lay)  * &
                 (selfref(inds+1,ig) - selfref(inds,ig))) + &
                 forfac(iplon,lay)  * (forref(indf,ig) + &
                 forfrac(iplon,lay)  * &
                 (forref(indf+1,ig) - forref(indf,ig)))) 

           
            taur(iplon,lay,ngs22+ig)  = tauray
         enddo

         else


      
         do ig = 1, ng23


            taug(iplon,lay,ngs22+ig)  = 0. 
            taur(iplon,lay,ngs22+ig)  = colmol(iplon,lay)  * rayl(ig) 
         enddo
         end if

enddo;enddo
      
!$acc end kernels
      end subroutine taumol23


      subroutine taumol24(ncol, nlayers, &
                          colh2o, colco2, colch4, colo2, colo3, colmol, &
                          laytrop, jp, jt, jt1, &
                          fac00, fac01, fac10, fac11, &
                          selffac, selffrac, indself, forfac, forfrac, indfor, &
                          sfluxzen, taug, taur)








      use parrrsw_f, only : ng24, ngs23
      use rrsw_kg24_f, only : absa, ka, absb, kb, forref, selfref, &
                            sfluxref, abso3a, abso3b, rayla, raylb, &
                            layreffr, strrat




      integer , intent(in) :: ncol
      integer , intent(in) :: nlayers               

      integer , intent(in) :: laytrop(:)            
      integer , intent(in) :: jp(:,:)               
      integer , intent(in) :: jt(:,:)               
      integer , intent(in) :: jt1(:,:)              
                                                    

      real , intent(in) :: colh2o(:,:)              
      real , intent(in) :: colco2(:,:)              
      real , intent(in) :: colo3(:,:)               
      real , intent(in) :: colch4(:,:)              
      real , intent(in) :: colo2(:,:)               
      real , intent(in) :: colmol(:,:)              
                                                    

      integer , intent(in) :: indself(:,:)     
      integer , intent(in) :: indfor(:,:) 
      real , intent(in) :: selffac(:,:) 
      real , intent(in) :: selffrac(:,:) 
      real , intent(in) :: forfac(:,:) 
      real , intent(in) :: forfrac(:,:) 
                                                    

      real , intent(in) :: &                        
                       fac00(:,:) , fac01(:,:) , & 
                       fac10(:,:) , fac11(:,:)  
                                                    


      real, intent(out)  :: sfluxzen(:,:)      
                                                         
      real, intent(out)  :: taug(:,:,:)        
                                                         
      real, intent(out)  :: taur(:,:,:)        
                                                         


      integer  :: ig, ind0, ind1, inds, indf, js, lay, laysolfr(8)

      real  :: fac000, fac001, fac010, fac011, fac100, fac101, &
                  fac110, fac111, fs, speccomb, specmult, specparm, &
                  tauray





      integer :: iplon



        
      laysolfr = laytrop
      do lay = 1, nlayers
        do iplon = 1, 8
          if (lay <= laytrop(iplon)) then

          if (jp(iplon,lay)  .lt. layreffr .and. jp(iplon,lay+1)  .ge. layreffr) &
            LAYSOLFR(iplon) = min(lay+1,laytrop(iplon) )
          if (lay .eq. LAYSOLFR(iplon)) then
                 speccomb = colh2o(iplon,lay)  + strrat*colo2(iplon,lay) 
            specparm = colh2o(iplon,lay) /speccomb 
            if (specparm .ge. oneminus) specparm = oneminus
            specmult = 8. *(specparm)
            js = 1 + int(specmult)
            fs = mod(specmult, 1.  )
          do ig = 1, ng24
           sfluxzen(iplon,ngs23+ig)  = sfluxref(ig,js) &
               + fs * (sfluxref(ig,js+1) - sfluxref(ig,js))
          end do
          end if
         endif
      end do
      end do
!$acc end kernels
        
!$acc kernels 
do lay = 1, nlayers ; do iplon = 1, 8





         if (lay <= laytrop(iplon)) then

         speccomb = colh2o(iplon,lay)  + strrat*colo2(iplon,lay) 
         specparm = colh2o(iplon,lay) /speccomb 
         if (specparm .ge. oneminus) specparm = oneminus
         specmult = 8. *(specparm)
         js = 1 + int(specmult)
         fs = mod(specmult, 1.  )
         fac000 = (1.  - fs) * fac00(iplon,lay) 
         fac010 = (1.  - fs) * fac10(iplon,lay) 
         fac100 = fs * fac00(iplon,lay) 
         fac110 = fs * fac10(iplon,lay) 
         fac001 = (1.  - fs) * fac01(iplon,lay) 
         fac011 = (1.  - fs) * fac11(iplon,lay) 
         fac101 = fs * fac01(iplon,lay) 
         fac111 = fs * fac11(iplon,lay) 
         ind0 = ((jp(iplon,lay) -1)*5+(jt(iplon,lay) -1))*nspa(24) + js
         ind1 = (jp(iplon,lay) *5+(jt1(iplon,lay) -1))*nspa(24) + js
         inds = indself(iplon,lay) 
         indf = indfor(iplon,lay) 

         do ig = 1, ng24
            tauray = colmol(iplon,lay)  * (rayla(ig,js) + &
               fs * (rayla(ig,js+1) - rayla(ig,js)))
            taug(iplon,lay,ngs23+ig)  = speccomb * &
                (fac000 * absa(ind0,ig) + &
                 fac100 * absa(ind0+1,ig) + &
                 fac010 * absa(ind0+9,ig) + &
                 fac110 * absa(ind0+10,ig) + &
                 fac001 * absa(ind1,ig) + &
                 fac101 * absa(ind1+1,ig) + &
                 fac011 * absa(ind1+9,ig) + &
                 fac111 * absa(ind1+10,ig)) + &
                 colo3(iplon,lay)  * abso3a(ig) + &
                 colh2o(iplon,lay)  * & 
                 (selffac(iplon,lay)  * (selfref(inds,ig) + &
                 selffrac(iplon,lay)  * &
                 (selfref(inds+1,ig) - selfref(inds,ig))) + &
                 forfac(iplon,lay)  * (forref(indf,ig) + & 
                 forfrac(iplon,lay)  * &
                 (forref(indf+1,ig) - forref(indf,ig))))

           
            taur(iplon,lay,ngs23+ig)  = tauray
         enddo

         else


      
         ind0 = ((jp(iplon,lay) -13)*5+(jt(iplon,lay) -1))*nspb(24) + 1
         ind1 = ((jp(iplon,lay) -12)*5+(jt1(iplon,lay) -1))*nspb(24) + 1

         do ig = 1, ng24
            tauray = colmol(iplon,lay)  * raylb(ig)
            taug(iplon,lay,ngs23+ig)  = colo2(iplon,lay)  * &
                (fac00(iplon,lay)  * absb(ind0,ig) + &
                 fac10(iplon,lay)  * absb(ind0+1,ig) + &
                 fac01(iplon,lay)  * absb(ind1,ig) + &
                 fac11(iplon,lay)  * absb(ind1+1,ig)) + &
                 colo3(iplon,lay)  * abso3b(ig)

            taur(iplon,lay,ngs23+ig)  = tauray
         enddo
         endif

enddo;enddo
      
!$acc end kernels
      end subroutine taumol24


      subroutine taumol25(ncol, nlayers, &
                          colh2o, colco2, colch4, colo2, colo3, colmol, &
                          laytrop, jp, jt, jt1, &
                          fac00, fac01, fac10, fac11, &
                          selffac, selffrac, indself, forfac, forfrac, indfor, &
                          sfluxzen, taug, taur)








      use parrrsw_f, only : ng25, ngs24
      use rrsw_kg25_f, only : absa, ka, &
                            sfluxref, abso3a, abso3b, rayl, layreffr




      integer , intent(in) :: ncol
      integer , intent(in) :: nlayers               

      integer , intent(in) :: laytrop(:)            
      integer , intent(in) :: jp(:,:)               
      integer , intent(in) :: jt(:,:)               
      integer , intent(in) :: jt1(:,:)              
                                                    

      real , intent(in) :: colh2o(:,:)              
      real , intent(in) :: colco2(:,:)              
      real , intent(in) :: colo3(:,:)               
      real , intent(in) :: colch4(:,:)              
      real , intent(in) :: colo2(:,:)               
      real , intent(in) :: colmol(:,:)              
                                                    

      integer , intent(in) :: indself(:,:)     
      integer , intent(in) :: indfor(:,:) 
      real , intent(in) :: selffac(:,:) 
      real , intent(in) :: selffrac(:,:) 
      real , intent(in) :: forfac(:,:) 
      real , intent(in) :: forfrac(:,:) 
                                                    

      real , intent(in) :: &                        
                       fac00(:,:) , fac01(:,:) , &  
                       fac10(:,:) , fac11(:,:)  
                                                    


      real, intent(out)  :: sfluxzen(:,:)      
                                                         
      real, intent(out)  :: taug(:,:,:)        
                                                         
      real, intent(out)  :: taur(:,:,:)        
                                                         


      integer  :: ig, ind0, ind1, inds, indf, js, lay, laysolfr(8)




      real  :: fac000, fac001, fac010, fac011, fac100, fac101, &
                  fac110, fac111, fs, speccomb, specmult, specparm, &
                  tauray
      integer :: iplon

      laysolfr = laytrop
      do lay = 1, nlayers
        do iplon = 1, 8
          if (lay <= laytrop(iplon)) then
         if (jp(iplon,lay)  .lt. layreffr .and. jp(iplon,lay+1)  .ge. layreffr) &
            LAYSOLFR(iplon) = min(lay+1,laytrop(iplon) )
         ind0 = ((jp(iplon,lay) -1)*5+(jt(iplon,lay) -1))*nspa(25) + 1
         ind1 = (jp(iplon,lay) *5+(jt1(iplon,lay) -1))*nspa(25) + 1

         do ig = 1, ng25
            tauray = colmol(iplon,lay)  * rayl(ig)
            taug(iplon,lay,ngs24+ig)  = colh2o(iplon,lay)  * &
                (fac00(iplon,lay)  * absa(ind0,ig) + &
                 fac10(iplon,lay)  * absa(ind0+1,ig) + &
                 fac01(iplon,lay)  * absa(ind1,ig) + &
                 fac11(iplon,lay)  * absa(ind1+1,ig)) + &
                 colo3(iplon,lay)  * abso3a(ig) 

            if (lay .eq. LAYSOLFR(iplon)) sfluxzen(iplon,ngs24+ig)  = sfluxref(ig) 
            taur(iplon,lay,ngs24+ig)  = tauray
         enddo
      else 

         do ig = 1, ng25
            tauray = colmol(iplon,lay)  * rayl(ig)
            taug(iplon,lay,ngs24+ig)  = colo3(iplon,lay)  * abso3b(ig) 

            taur(iplon,lay,ngs24+ig)  = tauray
         enddo
      endif
      enddo
      enddo
      
!$acc end kernels
      end subroutine taumol25


      subroutine taumol26(ncol, nlayers, &
                          colh2o, colco2, colch4, colo2, colo3, colmol, &
                          laytrop, jp, jt, jt1, &
                          fac00, fac01, fac10, fac11, &
                          selffac, selffrac, indself, forfac, forfrac, indfor, &
                          sfluxzen, taug, taur)








      use parrrsw_f, only : ng26, ngs25
      use rrsw_kg26_f, only : sfluxref, rayl


      integer , intent(in) :: ncol
      integer , intent(in) :: nlayers               

      integer , intent(in) :: laytrop(:)            
      integer , intent(in) :: jp(:,:)               
      integer , intent(in) :: jt(:,:)               
      integer , intent(in) :: jt1(:,:)              
                                                    

      real , intent(in) :: colh2o(:,:)              
      real , intent(in) :: colco2(:,:)              
      real , intent(in) :: colo3(:,:)               
      real , intent(in) :: colch4(:,:)              
      real , intent(in) :: colo2(:,:)               
      real , intent(in) :: colmol(:,:)              
                                                    

      integer , intent(in) :: indself(:,:)     
      integer , intent(in) :: indfor(:,:) 
      real , intent(in) :: selffac(:,:) 
      real , intent(in) :: selffrac(:,:) 
      real , intent(in) :: forfac(:,:) 
      real , intent(in) :: forfrac(:,:) 
                                                    

      real , intent(in) :: &                        
                       fac00(:,:) , fac01(:,:) , &  
                       fac10(:,:) , fac11(:,:)  
                                                    


      real, intent(out)  :: sfluxzen(:,:)      
                                                         
      real, intent(out)  :: taug(:,:,:)        
                                                         
      real, intent(out)  :: taur(:,:,:)        
                                                         


      integer  :: ig, ind0, ind1, inds, indf, js, lay, laysolfr(8)

      real  :: fac000, fac001, fac010, fac011, fac100, fac101, &
                  fac110, fac111, fs, speccomb, specmult, specparm, &
                  tauray
      integer :: iplon

      laysolfr = laytrop
      do lay = 1, nlayers
        do iplon = 1, 8
          if (lay <= laytrop(iplon)) then
         do ig = 1, ng26 


            if (lay .eq. LAYSOLFR(iplon)) sfluxzen(iplon,ngs25+ig)  = sfluxref(ig) 
            taug(iplon,lay,ngs25+ig)  = 0. 
            taur(iplon,lay,ngs25+ig)  = colmol(iplon,lay)  * rayl(ig) 
         enddo
      else


         do ig = 1, ng26


            taug(iplon,lay,ngs25+ig)  = 0. 
            taur(iplon,lay,ngs25+ig)  = colmol(iplon,lay)  * rayl(ig) 
         enddo
      endif
      enddo
      enddo
      
!$acc end kernels
      end subroutine taumol26


      subroutine taumol27(ncol, nlayers, &
                          colh2o, colco2, colch4, colo2, colo3, colmol, &
                          laytrop, jp, jt, jt1, &
                          fac00, fac01, fac10, fac11, &
                          selffac, selffrac, indself, forfac, forfrac, indfor, &
                          sfluxzen, taug, taur)








      use parrrsw_f, only : ng27, ngs26
      use rrsw_kg27_f, only : absa, ka, absb, kb, &
                            sfluxref, rayl, layreffr, scalekur



      integer , intent(in) :: ncol
      integer , intent(in) :: nlayers               

      integer , intent(in) :: laytrop(:)            
      integer , intent(in) :: jp(:,:)               
      integer , intent(in) :: jt(:,:)               
      integer , intent(in) :: jt1(:,:)              
                                                    

      real , intent(in) :: colh2o(:,:)              
      real , intent(in) :: colco2(:,:)              
      real , intent(in) :: colo3(:,:)               
      real , intent(in) :: colch4(:,:)              
      real , intent(in) :: colo2(:,:)               
      real , intent(in) :: colmol(:,:)              
                                                    

      integer , intent(in) :: indself(:,:)     
      integer , intent(in) :: indfor(:,:) 
      real , intent(in) :: selffac(:,:) 
      real , intent(in) :: selffrac(:,:) 
      real , intent(in) :: forfac(:,:) 
      real , intent(in) :: forfrac(:,:) 
                                                    

      real , intent(in) :: &                        
                       fac00(:,:) , fac01(:,:) , &  
                       fac10(:,:) , fac11(:,:)  
                                                    


      real, intent(out)  :: sfluxzen(:,:)      
                                                         
      real, intent(out)  :: taug(:,:,:)        
                                                         
      real, intent(out)  :: taur(:,:,:)        
                                                         


      integer  :: ig, ind0, ind1, inds, indf, js, lay, laysolfr(8)

      real  :: fac000, fac001, fac010, fac011, fac100, fac101, &
                  fac110, fac111, fs, speccomb, specmult, specparm, &
                  tauray





      integer :: iplon
       
      laysolfr = nlayers
      do lay = 1, nlayers
        do iplon = 1, 8
          if (lay <= laytrop(iplon)) then
         ind0 = ((jp(iplon,lay) -1)*5+(jt(iplon,lay) -1))*nspa(27) + 1
         ind1 = (jp(iplon,lay) *5+(jt1(iplon,lay) -1))*nspa(27) + 1

         do ig = 1, ng27
            tauray = colmol(iplon,lay)  * rayl(ig)
            taug(iplon,lay,ngs26+ig)  = colo3(iplon,lay)  * &
                (fac00(iplon,lay)  * absa(ind0,ig) + &
                 fac10(iplon,lay)  * absa(ind0+1,ig) + &
                 fac01(iplon,lay)  * absa(ind1,ig) + &
                 fac11(iplon,lay)  * absa(ind1+1,ig))

            taur(iplon,lay,ngs26+ig)  = tauray
         enddo
      else
         if (jp(iplon,lay-1)  .lt. layreffr .and. jp(iplon,lay)  .ge. layreffr) &
            LAYSOLFR(iplon) = lay
         ind0 = ((jp(iplon,lay) -13)*5+(jt(iplon,lay) -1))*nspb(27) + 1
         ind1 = ((jp(iplon,lay) -12)*5+(jt1(iplon,lay) -1))*nspb(27) + 1

         do ig = 1, ng27
            tauray = colmol(iplon,lay)  * rayl(ig)
            taug(iplon,lay,ngs26+ig)  = colo3(iplon,lay)  * &
                (fac00(iplon,lay)  * absb(ind0,ig) + &
                 fac10(iplon,lay)  * absb(ind0+1,ig) + &
                 fac01(iplon,lay)  * absb(ind1,ig) + & 
                 fac11(iplon,lay)  * absb(ind1+1,ig))

            if (lay.eq.LAYSOLFR(iplon)) sfluxzen(iplon,ngs26+ig)  = scalekur * sfluxref(ig) 
            taur(iplon,lay,ngs26+ig)  = tauray
         enddo
      endif
      enddo
      enddo
      
!$acc end kernels
      end subroutine taumol27


      subroutine taumol28(ncol, nlayers, &
                          colh2o, colco2, colch4, colo2, colo3, colmol, &
                          laytrop, jp, jt, jt1, &
                          fac00, fac01, fac10, fac11, &
                          selffac, selffrac, indself, forfac, forfrac, indfor, &
                          sfluxzen, taug, taur)








      use parrrsw_f, only : ng28, ngs27
      use rrsw_kg28_f, only : absa, ka, absb, kb, &
                            sfluxref, rayl, layreffr, strrat



      integer , intent(in) :: ncol
      integer , intent(in) :: nlayers               

      integer , intent(in) :: laytrop(:)            
      integer , intent(in) :: jp(:,:)               
      integer , intent(in) :: jt(:,:)               
      integer , intent(in) :: jt1(:,:)              
                                                    

      real , intent(in) :: colh2o(:,:)              
      real , intent(in) :: colco2(:,:)              
      real , intent(in) :: colo3(:,:)               
      real , intent(in) :: colch4(:,:)              
      real , intent(in) :: colo2(:,:)               
      real , intent(in) :: colmol(:,:)              
                                                    

      integer , intent(in) :: indself(:,:)     
      integer , intent(in) :: indfor(:,:) 
      real , intent(in) :: selffac(:,:) 
      real , intent(in) :: selffrac(:,:) 
      real , intent(in) :: forfac(:,:) 
      real , intent(in) :: forfrac(:,:) 
                                                    

      real , intent(in) :: &                        
                       fac00(:,:) , fac01(:,:) , & 
                       fac10(:,:) , fac11(:,:)  
                                                    


      real, intent(out)  :: sfluxzen(:,:)      
                                                         
      real, intent(out)  :: taug(:,:,:)        
                                                         
      real, intent(out)  :: taur(:,:,:)        
                                                         


      integer  :: ig, ind0, ind1, inds, indf, js, lay, laysolfr(8)

      real  :: fac000, fac001, fac010, fac011, fac100, fac101, &
                  fac110, fac111, fs, speccomb, specmult, specparm, &
                  tauray





      integer :: iplon

      laysolfr = nlayers
      do lay = 1, nlayers
        do iplon = 1, 8
          if (lay <= laytrop(iplon)) then
         speccomb = colo3(iplon,lay)  + strrat*colo2(iplon,lay) 
         specparm = colo3(iplon,lay) /speccomb 
         if (specparm .ge. oneminus) specparm = oneminus
         specmult = 8. *(specparm)
         js = 1 + int(specmult)
         fs = mod(specmult, 1.  )
         fac000 = (1.  - fs) * fac00(iplon,lay) 
         fac010 = (1.  - fs) * fac10(iplon,lay) 
         fac100 = fs * fac00(iplon,lay) 
         fac110 = fs * fac10(iplon,lay) 
         fac001 = (1.  - fs) * fac01(iplon,lay) 
         fac011 = (1.  - fs) * fac11(iplon,lay) 
         fac101 = fs * fac01(iplon,lay) 
         fac111 = fs * fac11(iplon,lay) 
         ind0 = ((jp(iplon,lay) -1)*5+(jt(iplon,lay) -1))*nspa(28) + js
         ind1 = (jp(iplon,lay) *5+(jt1(iplon,lay) -1))*nspa(28) + js
         tauray = colmol(iplon,lay)  * rayl

         do ig = 1, ng28
            taug(iplon,lay,ngs27+ig)  = speccomb * &
                (fac000 * absa(ind0,ig) + &
                 fac100 * absa(ind0+1,ig) + &
                 fac010 * absa(ind0+9,ig) + &
                 fac110 * absa(ind0+10,ig) + &
                 fac001 * absa(ind1,ig) + &
                 fac101 * absa(ind1+1,ig) + &
                 fac011 * absa(ind1+9,ig) + &
                 fac111 * absa(ind1+10,ig)) 

            taur(iplon,lay,ngs27+ig)  = tauray
         enddo
      else
         if (jp(iplon,lay-1)  .lt. layreffr .and. jp(iplon,lay)  .ge. layreffr) &
            LAYSOLFR(iplon) = lay
         speccomb = colo3(iplon,lay)  + strrat*colo2(iplon,lay) 
         specparm = colo3(iplon,lay) /speccomb 
         if (specparm .ge. oneminus) specparm = oneminus
         specmult = 4. *(specparm)
         js = 1 + int(specmult)
         fs = mod(specmult, 1.  )
         fac000 = (1.  - fs) * fac00(iplon,lay) 
         fac010 = (1.  - fs) * fac10(iplon,lay) 
         fac100 = fs * fac00(iplon,lay) 
         fac110 = fs * fac10(iplon,lay) 
         fac001 = (1.  - fs) * fac01(iplon,lay) 
         fac011 = (1.  - fs) * fac11(iplon,lay) 
         fac101 = fs * fac01(iplon,lay) 
         fac111 = fs * fac11(iplon,lay) 
         ind0 = ((jp(iplon,lay) -13)*5+(jt(iplon,lay) -1))*nspb(28) + js
         ind1 = ((jp(iplon,lay) -12)*5+(jt1(iplon,lay) -1))*nspb(28) + js
         tauray = colmol(iplon,lay)  * rayl

         do ig = 1, ng28
            taug(iplon,lay,ngs27+ig)  = speccomb * &
                (fac000 * absb(ind0,ig) + &
                 fac100 * absb(ind0+1,ig) + &
                 fac010 * absb(ind0+5,ig) + &
                 fac110 * absb(ind0+6,ig) + &
                 fac001 * absb(ind1,ig) + &
                 fac101 * absb(ind1+1,ig) + &
                 fac011 * absb(ind1+5,ig) + &
                 fac111 * absb(ind1+6,ig)) 

            if (lay .eq. LAYSOLFR(iplon)) sfluxzen(iplon,ngs27+ig)  = sfluxref(ig,js) &
               + fs * (sfluxref(ig,js+1) - sfluxref(ig,js))
            taur(iplon,lay,ngs27+ig)  = tauray
         enddo
      endif
      enddo
      enddo
      
!$acc end kernels
      end subroutine taumol28


      subroutine taumol29(ncol, nlayers, &
                          colh2o, colco2, colch4, colo2, colo3, colmol, &
                          laytrop, jp, jt, jt1, &
                          fac00, fac01, fac10, fac11, &
                          selffac, selffrac, indself, forfac, forfrac, indfor, &
                          sfluxzen, taug, taur)








      use parrrsw_f, only : ng29, ngs28
      use rrsw_kg29_f, only : absa, ka, absb, kb, forref, selfref, &
                            sfluxref, absh2o, absco2, rayl, layreffr




      integer , intent(in) :: ncol
      integer , intent(in) :: nlayers               

      integer , intent(in) :: laytrop(:)            
      integer , intent(in) :: jp(:,:)               
      integer , intent(in) :: jt(:,:)               
      integer , intent(in) :: jt1(:,:)              
                                                    

      real , intent(in) :: colh2o(:,:)              
      real , intent(in) :: colco2(:,:)              
      real , intent(in) :: colo3(:,:)               
      real , intent(in) :: colch4(:,:)              
      real , intent(in) :: colo2(:,:)               
      real , intent(in) :: colmol(:,:)              
                                                    

      integer , intent(in) :: indself(:,:)     
      integer , intent(in) :: indfor(:,:) 
      real , intent(in) :: selffac(:,:) 
      real , intent(in) :: selffrac(:,:) 
      real , intent(in) :: forfac(:,:) 
      real , intent(in) :: forfrac(:,:) 
                                                    

      real , intent(in) :: &                        
                       fac00(:,:) , fac01(:,:) , &  
                       fac10(:,:) , fac11(:,:)  
                                                    


      real, intent(out)  :: sfluxzen(:,:)      
                                                         
      real, intent(out)  :: taug(:,:,:)        
                                                         
      real, intent(out)  :: taur(:,:,:)        
                                                         


      integer  :: ig, ind0, ind1, inds, indf, js, lay, laysolfr(8)



      real  :: fac000, fac001, fac010, fac011, fac100, fac101, &
                  fac110, fac111, fs, speccomb, specmult, specparm, &
                  tauray
      integer :: iplon


        
      laysolfr = nlayers
      do lay = 1, nlayers
        do iplon = 1, 8
          if (lay > laytrop(iplon)) then
         if (jp(iplon,lay-1)  .lt. layreffr .and. jp(iplon,lay)  .ge. layreffr) &
            LAYSOLFR(iplon) = lay

            if (lay .eq. LAYSOLFR(iplon)) then 
                do ig = 1, ng29
                sfluxzen(iplon,ngs28+ig)  = sfluxref(ig) 
                end do
            end if
         endif
        end do
      end do
!$acc end kernels
       
    do lay = 1, nlayers 
      do iplon=1,8
         if (lay <= laytrop(iplon)) then
         ind0 = ((jp(iplon,lay) -1)*5+(jt(iplon,lay) -1))*nspa(29) + 1
         ind1 = (jp(iplon,lay) *5+(jt1(iplon,lay) -1))*nspa(29) + 1
         inds = indself(iplon,lay) 
         indf = indfor(iplon,lay) 
         tauray = colmol(iplon,lay)  * rayl

         do ig = 1, ng29
            taug(iplon,lay,ngs28+ig)  = colh2o(iplon,lay)  * &
               ((fac00(iplon,lay)  * absa(ind0,ig) + &
                 fac10(iplon,lay)  * absa(ind0+1,ig) + &
                 fac01(iplon,lay)  * absa(ind1,ig) + &
                 fac11(iplon,lay)  * absa(ind1+1,ig)) + &
                 selffac(iplon,lay)  * (selfref(inds,ig) + &
                 selffrac(iplon,lay)  * &
                 (selfref(inds+1,ig) - selfref(inds,ig))) + &
                 forfac(iplon,lay)  * (forref(indf,ig) + & 
                 forfrac(iplon,lay)  * &
                 (forref(indf+1,ig) - forref(indf,ig)))) &
                 + colco2(iplon,lay)  * absco2(ig) 

            taur(iplon,lay,ngs28+ig)  = tauray
         enddo

         else 


         ind0 = ((jp(iplon,lay) -13)*5+(jt(iplon,lay) -1))*nspb(29) + 1
         ind1 = ((jp(iplon,lay) -12)*5+(jt1(iplon,lay) -1))*nspb(29) + 1
         tauray = colmol(iplon,lay)  * rayl

         do ig = 1, ng29
            taug(iplon,lay,ngs28+ig)  = colco2(iplon,lay)  * &
                (fac00(iplon,lay)  * absb(ind0,ig) + &
                 fac10(iplon,lay)  * absb(ind0+1,ig) + &
                 fac01(iplon,lay)  * absb(ind1,ig) + &
                 fac11(iplon,lay)  * absb(ind1+1,ig)) &  
                 + colh2o(iplon,lay)  * absh2o(ig) 

        
            taur(iplon,lay,ngs28+ig)  = tauray
         enddo
         end if

      enddo
      enddo
      
!$acc end kernels
      end subroutine taumol29


      end module rrtmg_sw_taumol_f

      module rrtmg_sw_init_f



      use rrsw_wvn_f
      use rrtmg_sw_setcoef_f, only: swatmref
      
      implicit none

      public rrtmg_sw_ini
      
      contains


      subroutine rrtmg_sw_ini(cpdair)











      use parrrsw_f, only : mg, nbndsw, ngptsw
      use rrsw_tbl_f, only: ntbl, tblint, pade, bpade, tau_tbl, exp_tbl
      use rrsw_vsn_f, only: hvrini, hnamini

      real , intent(in) :: cpdair     
                                      
                                      



      integer  :: ibnd, igc, ig, ind, ipr
      integer  :: igcsm, iprsm
      integer  :: itr

      real  :: wtsum, wtsm(mg)
      real  :: tfn

      real , parameter :: expeps = 1.e-20    









      hvrini = '$Revision: 1.5 $'


      call swdatinit(cpdair)
      call swcmbdat              
      call swaerpr               
      call swcldpr               
      call swatmref              






















      exp_tbl(0) = 1.0 
      exp_tbl(ntbl) = expeps
      bpade = 1.0  / pade
      do itr = 1, ntbl-1
         tfn = float(itr) / float(ntbl)
         tau_tbl = bpade * tfn / (1.  - tfn)
         exp_tbl(itr) = exp(-tau_tbl)
         if (exp_tbl(itr) .le. expeps) exp_tbl(itr) = expeps
      enddo






      igcsm = 0
      do ibnd = 1,nbndsw
         iprsm = 0
         if (ngc(ibnd).lt.mg) then
            do igc = 1,ngc(ibnd)
               igcsm = igcsm + 1
               wtsum = 0.
               do ipr = 1, ngn(igcsm)
                  iprsm = iprsm + 1
                  wtsum = wtsum + wt(iprsm)
               enddo
               wtsm(igc) = wtsum
            enddo
            do ig = 1, ng(ibnd+15)
               ind = (ibnd-1)*mg + ig
               rwgt(ind) = wt(ig)/wtsm(ngm(ind))
            enddo
         else
            do ig = 1, ng(ibnd+15)
               igcsm = igcsm + 1
               ind = (ibnd-1)*mg + ig
               rwgt(ind) = 1.0 
            enddo
         endif
      enddo



      call cmbgb16s
      call cmbgb17
      call cmbgb18
      call cmbgb19
      call cmbgb20
      call cmbgb21
      call cmbgb22
      call cmbgb23
      call cmbgb24
      call cmbgb25
      call cmbgb26
      call cmbgb27
      call cmbgb28
      call cmbgb29

      end subroutine rrtmg_sw_ini


      subroutine swdatinit(cpdair)




      use rrsw_con_f, only: heatfac, grav, planck, boltz, &
                          clight, avogad, alosmt, gascon, radcn1, radcn2, &
                          sbcnst, secdy 
      use rrsw_vsn_f

      save 
 
      real , intent(in) :: cpdair     
                                      
                                      


      wavenum1(:) = (/2600. , 3250. , 4000. , 4650. , 5150. , 6150. , 7700. , &
                      8050. ,12850. ,16000. ,22650. ,29000. ,38000. ,  820. /)
      wavenum2(:) = (/3250. , 4000. , 4650. , 5150. , 6150. , 7700. , 8050. , &
                     12850. ,16000. ,22650. ,29000. ,38000. ,50000. , 2600. /)
      delwave(:) =  (/ 650. ,  750. ,  650. ,  500. , 1000. , 1550. ,  350. , &
                      4800. , 3150. , 6650. , 6350. , 9000. ,12000. , 1780. /)
     

      ng(:) = (/16,16,16,16,16,16,16,16,16,16,16,16,16,16/)
      nspa(:) = (/9,9,9,9,1,9,9,1,9,1,0,1,9,1/)
      nspb(:) = (/1,5,1,1,1,5,1,0,1,0,0,1,5,1/)
      icxa(:) = (/ 5 ,5 ,4 ,4 ,3 ,3 ,2 ,2 ,1 ,1 ,1 ,1 ,1 ,5/)



      grav = 9.8066                         
                                              
      planck = 6.62606876e-27               
                                              
      boltz = 1.3806503e-16                 
                                              
      clight = 2.99792458e+10               
                                              
      avogad = 6.02214199e+23               
                                              
      alosmt = 2.6867775e+19                
                                              
      gascon = 8.31447200e+07               
                                              
      radcn1 = 1.191042772e-12              
                                              
      radcn2 = 1.4387752                    
                                              
      sbcnst = 5.670400e-04                 
                                              
      secdy = 8.6400e4                      
                                              





























      heatfac = grav * secdy / (cpdair * 1.e2 )

      end subroutine swdatinit


      subroutine swcmbdat


      save
 


















      ngc(:) = (/ 6,12, 8, 8,10,10, 2,10, 8, 6, 6, 8, 6,12 /)
      ngs(:) = (/ 6,18,26,34,44,54,56,66,74,80,86,94,100,112 /)
      ngm(:) = (/ 1,1,2,2,3,3,4,4,5,5,5,5,6,6,6,6, &           
                  1,2,3,4,5,6,6,7,8,8,9,10,10,11,12,12, &      
                  1,2,3,4,5,5,6,6,7,7,7,7,8,8,8,8, &           
                  1,2,3,4,5,5,6,6,7,7,7,7,8,8,8,8, &           
                  1,2,3,4,5,6,7,8,9,9,10,10,10,10,10,10, &     
                  1,2,3,4,5,6,7,8,9,9,10,10,10,10,10,10, &     
                  1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2, &           
                  1,1,2,2,3,4,5,6,7,8,9,9,10,10,10,10, &       
                  1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8, &           
                  1,2,3,3,4,4,5,5,5,5,6,6,6,6,6,6, &           
                  1,2,3,3,4,4,5,5,5,5,6,6,6,6,6,6, &           
                  1,2,3,4,5,6,7,7,7,7,8,8,8,8,8,8, &           
                  1,2,3,3,4,4,5,5,5,5,6,6,6,6,6,6, &           
                  1,2,3,4,5,5,6,6,7,7,8,8,9,10,11,12 /)        
      ngn(:) = (/ 2,2,2,2,4,4, &                               
                  1,1,1,1,1,2,1,2,1,2,1,2, &                   
                  1,1,1,1,2,2,4,4, &                           
                  1,1,1,1,2,2,4,4, &                           
                  1,1,1,1,1,1,1,1,2,6, &                       
                  1,1,1,1,1,1,1,1,2,6, &                       
                  8,8, &                                       
                  2,2,1,1,1,1,1,1,2,4, &                       
                  2,2,2,2,2,2,2,2, &                           
                  1,1,2,2,4,6, &                               
                  1,1,2,2,4,6, &                               
                  1,1,1,1,1,1,4,6, &                           
                  1,1,2,2,4,6, &                               
                  1,1,1,1,2,2,2,2,1,1,1,1 /)                   
      ngb(:) = (/ 16,16,16,16,16,16, &                         
                  17,17,17,17,17,17,17,17,17,17,17,17, &       
                  18,18,18,18,18,18,18,18, &                   
                  19,19,19,19,19,19,19,19, &                   
                  20,20,20,20,20,20,20,20,20,20, &             
                  21,21,21,21,21,21,21,21,21,21, &             
                  22,22, &                                     
                  23,23,23,23,23,23,23,23,23,23, &             
                  24,24,24,24,24,24,24,24, &                   
                  25,25,25,25,25,25, &                         
                  26,26,26,26,26,26, &                         
                  27,27,27,27,27,27,27,27, &                   
                  28,28,28,28,28,28, &                         
                  29,29,29,29,29,29,29,29,29,29,29,29 /)       

















































      wt(:) =  (/ 0.1527534276 , 0.1491729617 , 0.1420961469 , &
                  0.1316886544 , 0.1181945205 , 0.1019300893 , &
                  0.0832767040 , 0.0626720116 , 0.0424925000 , &
                  0.0046269894 , 0.0038279891 , 0.0030260086 , &
                  0.0022199750 , 0.0014140010 , 0.0005330000 , &
                  0.0000750000  /)

      end subroutine swcmbdat


      subroutine swaerpr








      use rrsw_aer_f, only : rsrtaua, rsrpiza, rsrasya

      save

      rsrtaua( 1, :) = (/ &
        0.10849 , 0.66699 , 0.65255 , 0.11600 , 0.06529 , 0.04468 /)
      rsrtaua( 2, :) = (/ &
        0.10849 , 0.66699 , 0.65255 , 0.11600 , 0.06529 , 0.04468 /)
      rsrtaua( 3, :) = (/ &
        0.20543 , 0.84642 , 0.84958 , 0.21673 , 0.28270 , 0.10915 /)
      rsrtaua( 4, :) = (/ &
        0.20543 , 0.84642 , 0.84958 , 0.21673 , 0.28270 , 0.10915 /)
      rsrtaua( 5, :) = (/ &
        0.20543 , 0.84642 , 0.84958 , 0.21673 , 0.28270 , 0.10915 /)
      rsrtaua( 6, :) = (/ &
        0.20543 , 0.84642 , 0.84958 , 0.21673 , 0.28270 , 0.10915 /)
      rsrtaua( 7, :) = (/ &
        0.20543 , 0.84642 , 0.84958 , 0.21673 , 0.28270 , 0.10915 /)
      rsrtaua( 8, :) = (/ &
        0.52838 , 0.93285 , 0.93449 , 0.53078 , 0.67148 , 0.46608 /)
      rsrtaua( 9, :) = (/ &
        0.52838 , 0.93285 , 0.93449 , 0.53078 , 0.67148 , 0.46608 /)
      rsrtaua(10, :) = (/ &
        1.69446 , 1.11855 , 1.09212 , 1.72145 , 1.03858 , 1.12044 /)
      rsrtaua(11, :) = (/ &
        1.69446 , 1.11855 , 1.09212 , 1.72145 , 1.03858 , 1.12044 /)
      rsrtaua(12, :) = (/ &
        1.69446 , 1.11855 , 1.09212 , 1.72145 , 1.03858 , 1.12044 /)
      rsrtaua(13, :) = (/ &
        1.69446 , 1.11855 , 1.09212 , 1.72145 , 1.03858 , 1.12044 /)
      rsrtaua(14, :) = (/ &
        0.10849 , 0.66699 , 0.65255 , 0.11600 , 0.06529 , 0.04468 /)
 
      rsrpiza( 1, :) = (/ &
        .5230504 , .7868518 , .8531531 , .4048149 , .8748231 , .2355667 /)
      rsrpiza( 2, :) = (/ &
        .5230504 , .7868518 , .8531531 , .4048149 , .8748231 , .2355667 /)
      rsrpiza( 3, :) = (/ &
        .8287144 , .9949396 , .9279543 , .6765051 , .9467578 , .9955938 /)
      rsrpiza( 4, :) = (/ &
        .8287144 , .9949396 , .9279543 , .6765051 , .9467578 , .9955938 /)
      rsrpiza( 5, :) = (/ &
        .8287144 , .9949396 , .9279543 , .6765051 , .9467578 , .9955938 /)
      rsrpiza( 6, :) = (/ &
        .8287144 , .9949396 , .9279543 , .6765051 , .9467578 , .9955938 /)
      rsrpiza( 7, :) = (/ &
        .8287144 , .9949396 , .9279543 , .6765051 , .9467578 , .9955938 /)
      rsrpiza( 8, :) = (/ &
        .8970131 , .9984940 , .9245594 , .7768385 , .9532763 , .9999999 /)
      rsrpiza( 9, :) = (/ &
        .8970131 , .9984940 , .9245594 , .7768385 , .9532763 , .9999999 /)
      rsrpiza(10, :) = (/ &
        .9148907 , .9956173 , .7504584 , .8131335 , .9401905 , .9999999 /)
      rsrpiza(11, :) = (/ &
        .9148907 , .9956173 , .7504584 , .8131335 , .9401905 , .9999999 /)
      rsrpiza(12, :) = (/ &
        .9148907 , .9956173 , .7504584 , .8131335 , .9401905 , .9999999 /)
      rsrpiza(13, :) = (/ &
        .9148907 , .9956173 , .7504584 , .8131335 , .9401905 , .9999999 /)
      rsrpiza(14, :) = (/ &
        .5230504 , .7868518 , .8531531 , .4048149 , .8748231 , .2355667 /)

      rsrasya( 1, :) = (/ &
        0.700610 , 0.818871 , 0.702399 , 0.689886 , .4629866 , .1907639 /)
      rsrasya( 2, :) = (/ &
        0.700610 , 0.818871 , 0.702399 , 0.689886 , .4629866 , .1907639 /)
      rsrasya( 3, :) = (/ &
        0.636342 , 0.802467 , 0.691305 , 0.627497 , .6105750 , .4760794 /)
      rsrasya( 4, :) = (/ &
        0.636342 , 0.802467 , 0.691305 , 0.627497 , .6105750 , .4760794 /)
      rsrasya( 5, :) = (/ &
        0.636342 , 0.802467 , 0.691305 , 0.627497 , .6105750 , .4760794 /)
      rsrasya( 6, :) = (/ &
        0.636342 , 0.802467 , 0.691305 , 0.627497 , .6105750 , .4760794 /)
      rsrasya( 7, :) = (/ &
        0.636342 , 0.802467 , 0.691305 , 0.627497 , .6105750 , .4760794 /)
      rsrasya( 8, :) = (/ &
        0.668431 , 0.788530 , 0.698682 , 0.657422 , .6735182 , .6519706 /)
      rsrasya( 9, :) = (/ &
        0.668431 , 0.788530 , 0.698682 , 0.657422 , .6735182 , .6519706 /)
      rsrasya(10, :) = (/ &
        0.729019 , 0.803129 , 0.784592 , 0.712208 , .7008249 , .7270548 /)
      rsrasya(11, :) = (/ &
        0.729019 , 0.803129 , 0.784592 , 0.712208 , .7008249 , .7270548 /)
      rsrasya(12, :) = (/ &
        0.729019 , 0.803129 , 0.784592 , 0.712208 , .7008249 , .7270548 /)
      rsrasya(13, :) = (/ &
        0.729019 , 0.803129 , 0.784592 , 0.712208 , .7008249 , .7270548 /)
      rsrasya(14, :) = (/ &
        0.700610 , 0.818871 , 0.702399 , 0.689886 , .4629866 , .1907639 /)

      end subroutine swaerpr
 

      subroutine cmbgb16s


















      use rrsw_kg16_f, only : kao, kbo, selfrefo, forrefo, sfluxrefo, &
                            absa, ka, absb, kb, selfref, forref, sfluxref


      integer  :: jn, jt, jp, igc, ipr, iprsm
      real  :: sumk, sumf


      do jn = 1,9
         do jt = 1,5
            do jp = 1,13
               iprsm = 0
               do igc = 1,ngc(1)
                  sumk = 0.
                  do ipr = 1, ngn(igc)
                     iprsm = iprsm + 1
                     sumk = sumk + kao(jn,jt,jp,iprsm)*rwgt(iprsm)
                  enddo
                  ka(jn,jt,jp,igc) = sumk
               enddo
            enddo
         enddo
      enddo

      do jt = 1,5
         do jp = 13,59
            iprsm = 0
            do igc = 1,ngc(1)
               sumk = 0.
               do ipr = 1, ngn(igc)
                  iprsm = iprsm + 1
                  sumk = sumk + kbo(jt,jp,iprsm)*rwgt(iprsm)
               enddo
               kb(jt,jp,igc) = sumk
            enddo
         enddo
      enddo

      do jt = 1,10
         iprsm = 0
         do igc = 1,ngc(1)
            sumk = 0.
            do ipr = 1, ngn(igc)
               iprsm = iprsm + 1
               sumk = sumk + selfrefo(jt,iprsm)*rwgt(iprsm)
            enddo
            selfref(jt,igc) = sumk
         enddo
      enddo

      do jt = 1,3
         iprsm = 0
         do igc = 1,ngc(1)
            sumk = 0.
            do ipr = 1, ngn(igc)
               iprsm = iprsm + 1
               sumk = sumk + forrefo(jt,iprsm)*rwgt(iprsm)
            enddo
            forref(jt,igc) = sumk
         enddo
      enddo

      iprsm = 0
      do igc = 1,ngc(1)
         sumf = 0.
         do ipr = 1, ngn(igc)
            iprsm = iprsm + 1
            sumf = sumf + sfluxrefo(iprsm)
         enddo
         sfluxref(igc) = sumf
      enddo

      end subroutine cmbgb16s


      subroutine cmbgb17





      use rrsw_kg17_f, only : kao, kbo, selfrefo, forrefo, sfluxrefo, &
                            absa, ka, absb, kb, selfref, forref, sfluxref


      integer  :: jn, jt, jp, igc, ipr, iprsm
      real  :: sumk, sumf


      do jn = 1,9
         do jt = 1,5
            do jp = 1,13
               iprsm = 0
               do igc = 1,ngc(2)
                  sumk = 0.
                  do ipr = 1, ngn(ngs(1)+igc)
                     iprsm = iprsm + 1
                     sumk = sumk + kao(jn,jt,jp,iprsm)*rwgt(iprsm+16)
                  enddo
                  ka(jn,jt,jp,igc) = sumk
               enddo
            enddo
         enddo
      enddo

      do jn = 1,5
         do jt = 1,5
            do jp = 13,59
               iprsm = 0
               do igc = 1,ngc(2)
                  sumk = 0.
                  do ipr = 1, ngn(ngs(1)+igc)
                     iprsm = iprsm + 1
                     sumk = sumk + kbo(jn,jt,jp,iprsm)*rwgt(iprsm+16)
                  enddo
                  kb(jn,jt,jp,igc) = sumk
               enddo
            enddo
         enddo
      enddo

      do jt = 1,10
         iprsm = 0
         do igc = 1,ngc(2)
            sumk = 0.
            do ipr = 1, ngn(ngs(1)+igc)
               iprsm = iprsm + 1
               sumk = sumk + selfrefo(jt,iprsm)*rwgt(iprsm+16)
            enddo
            selfref(jt,igc) = sumk
         enddo
      enddo

      do jt = 1,4
         iprsm = 0
         do igc = 1,ngc(2)
            sumk = 0.
            do ipr = 1, ngn(ngs(1)+igc)
               iprsm = iprsm + 1
               sumk = sumk + forrefo(jt,iprsm)*rwgt(iprsm+16)
            enddo
            forref(jt,igc) = sumk
         enddo
      enddo

      do jp = 1,5
         iprsm = 0
         do igc = 1,ngc(2)
            sumf = 0.
            do ipr = 1, ngn(ngs(1)+igc)
               iprsm = iprsm + 1
               sumf = sumf + sfluxrefo(iprsm,jp)
            enddo
            sfluxref(igc,jp) = sumf
         enddo
      enddo

      end subroutine cmbgb17


      subroutine cmbgb18





      use rrsw_kg18_f, only : kao, kbo, selfrefo, forrefo, sfluxrefo, &
                            absa, ka, absb, kb, selfref, forref, sfluxref


      integer  :: jn, jt, jp, igc, ipr, iprsm
      real  :: sumk, sumf


      do jn = 1,9
         do jt = 1,5
            do jp = 1,13
               iprsm = 0
               do igc = 1,ngc(3)
                  sumk = 0.
                  do ipr = 1, ngn(ngs(2)+igc)
                     iprsm = iprsm + 1
                     sumk = sumk + kao(jn,jt,jp,iprsm)*rwgt(iprsm+32)
                  enddo
                  ka(jn,jt,jp,igc) = sumk
               enddo
            enddo
         enddo
      enddo

      do jt = 1,5
         do jp = 13,59
            iprsm = 0
            do igc = 1,ngc(3)
               sumk = 0.
               do ipr = 1, ngn(ngs(2)+igc)
                  iprsm = iprsm + 1
                  sumk = sumk + kbo(jt,jp,iprsm)*rwgt(iprsm+32)
               enddo
               kb(jt,jp,igc) = sumk
            enddo
         enddo
      enddo

      do jt = 1,10
         iprsm = 0
         do igc = 1,ngc(3)
            sumk = 0.
            do ipr = 1, ngn(ngs(2)+igc)
               iprsm = iprsm + 1
               sumk = sumk + selfrefo(jt,iprsm)*rwgt(iprsm+32)
            enddo
            selfref(jt,igc) = sumk
         enddo
      enddo

      do jt = 1,3
         iprsm = 0
         do igc = 1,ngc(3)
            sumk = 0.
            do ipr = 1, ngn(ngs(2)+igc)
               iprsm = iprsm + 1
               sumk = sumk + forrefo(jt,iprsm)*rwgt(iprsm+32)
            enddo
            forref(jt,igc) = sumk
         enddo
      enddo

      do jp = 1,9
         iprsm = 0
         do igc = 1,ngc(3)
            sumf = 0.
            do ipr = 1, ngn(ngs(2)+igc)
               iprsm = iprsm + 1
               sumf = sumf + sfluxrefo(iprsm,jp)
            enddo
            sfluxref(igc,jp) = sumf
         enddo
      enddo

      end subroutine cmbgb18


      subroutine cmbgb19





      use rrsw_kg19_f, only : kao, kbo, selfrefo, forrefo, sfluxrefo, &
                            absa, ka, absb, kb, selfref, forref, sfluxref


      integer  :: jn, jt, jp, igc, ipr, iprsm
      real  :: sumk, sumf


      do jn = 1,9
         do jt = 1,5
            do jp = 1,13
               iprsm = 0
               do igc = 1,ngc(4)
                  sumk = 0.
                  do ipr = 1, ngn(ngs(3)+igc)
                     iprsm = iprsm + 1
                     sumk = sumk + kao(jn,jt,jp,iprsm)*rwgt(iprsm+48)
                  enddo
                  ka(jn,jt,jp,igc) = sumk
               enddo
            enddo
         enddo
      enddo

      do jt = 1,5
         do jp = 13,59
            iprsm = 0
            do igc = 1,ngc(4)
               sumk = 0.
               do ipr = 1, ngn(ngs(3)+igc)
                  iprsm = iprsm + 1
                  sumk = sumk + kbo(jt,jp,iprsm)*rwgt(iprsm+48)
               enddo
               kb(jt,jp,igc) = sumk
            enddo
         enddo
      enddo

      do jt = 1,10
         iprsm = 0
         do igc = 1,ngc(4)
            sumk = 0.
            do ipr = 1, ngn(ngs(3)+igc)
               iprsm = iprsm + 1
               sumk = sumk + selfrefo(jt,iprsm)*rwgt(iprsm+48)
            enddo
            selfref(jt,igc) = sumk
         enddo
      enddo

      do jt = 1,3
         iprsm = 0
         do igc = 1,ngc(4)
            sumk = 0.
            do ipr = 1, ngn(ngs(3)+igc)
               iprsm = iprsm + 1
               sumk = sumk + forrefo(jt,iprsm)*rwgt(iprsm+48)
            enddo
            forref(jt,igc) = sumk
         enddo
      enddo

      do jp = 1,9
         iprsm = 0
         do igc = 1,ngc(4)
            sumf = 0.
            do ipr = 1, ngn(ngs(3)+igc)
               iprsm = iprsm + 1
               sumf = sumf + sfluxrefo(iprsm,jp)
            enddo
            sfluxref(igc,jp) = sumf
         enddo
      enddo

      end subroutine cmbgb19


      subroutine cmbgb20





      use rrsw_kg20_f, only : kao, kbo, selfrefo, forrefo, sfluxrefo, absch4o, &
                            absa, ka, absb, kb, selfref, forref, sfluxref, absch4


      integer  :: jt, jp, igc, ipr, iprsm
      real  :: sumk, sumf1, sumf2


      do jt = 1,5
         do jp = 1,13
            iprsm = 0
            do igc = 1,ngc(5)
               sumk = 0.
               do ipr = 1, ngn(ngs(4)+igc)
                  iprsm = iprsm + 1
                  sumk = sumk + kao(jt,jp,iprsm)*rwgt(iprsm+64)
               enddo
               ka(jt,jp,igc) = sumk
            enddo
         enddo
         do jp = 13,59
            iprsm = 0
            do igc = 1,ngc(5)
               sumk = 0.
               do ipr = 1, ngn(ngs(4)+igc)
                  iprsm = iprsm + 1
                  sumk = sumk + kbo(jt,jp,iprsm)*rwgt(iprsm+64)
               enddo
               kb(jt,jp,igc) = sumk
            enddo
         enddo
      enddo

      do jt = 1,10
         iprsm = 0
         do igc = 1,ngc(5)
            sumk = 0.
            do ipr = 1, ngn(ngs(4)+igc)
               iprsm = iprsm + 1
               sumk = sumk + selfrefo(jt,iprsm)*rwgt(iprsm+64)
            enddo
            selfref(jt,igc) = sumk
         enddo
      enddo

      do jt = 1,4
         iprsm = 0
         do igc = 1,ngc(5)
            sumk = 0.
            do ipr = 1, ngn(ngs(4)+igc)
               iprsm = iprsm + 1
               sumk = sumk + forrefo(jt,iprsm)*rwgt(iprsm+64)
            enddo
            forref(jt,igc) = sumk
         enddo
      enddo

      iprsm = 0
      do igc = 1,ngc(5)
         sumf1 = 0.
         sumf2 = 0.
         do ipr = 1, ngn(ngs(4)+igc)
            iprsm = iprsm + 1
            sumf1 = sumf1 + sfluxrefo(iprsm)
            sumf2 = sumf2 + absch4o(iprsm)*rwgt(iprsm+64)
         enddo
         sfluxref(igc) = sumf1
         absch4(igc) = sumf2
      enddo

      end subroutine cmbgb20


      subroutine cmbgb21





      use rrsw_kg21_f, only : kao, kbo, selfrefo, forrefo, sfluxrefo, &
                            absa, ka, absb, kb, selfref, forref, sfluxref


      integer  :: jn, jt, jp, igc, ipr, iprsm
      real  :: sumk, sumf


      do jn = 1,9
         do jt = 1,5
            do jp = 1,13
               iprsm = 0
               do igc = 1,ngc(6)
                  sumk = 0.
                  do ipr = 1, ngn(ngs(5)+igc)
                     iprsm = iprsm + 1
                     sumk = sumk + kao(jn,jt,jp,iprsm)*rwgt(iprsm+80)
                  enddo
                  ka(jn,jt,jp,igc) = sumk
               enddo
            enddo
         enddo
      enddo

      do jn = 1,5
         do jt = 1,5
            do jp = 13,59
               iprsm = 0
               do igc = 1,ngc(6)
                  sumk = 0.
                  do ipr = 1, ngn(ngs(5)+igc)
                     iprsm = iprsm + 1
                     sumk = sumk + kbo(jn,jt,jp,iprsm)*rwgt(iprsm+80)
                  enddo
                  kb(jn,jt,jp,igc) = sumk
               enddo
            enddo
         enddo
      enddo

      do jt = 1,10
         iprsm = 0
         do igc = 1,ngc(6)
            sumk = 0.
            do ipr = 1, ngn(ngs(5)+igc)
               iprsm = iprsm + 1
               sumk = sumk + selfrefo(jt,iprsm)*rwgt(iprsm+80)
            enddo
            selfref(jt,igc) = sumk
         enddo
      enddo

      do jt = 1,4
         iprsm = 0
         do igc = 1,ngc(6)
            sumk = 0.
            do ipr = 1, ngn(ngs(5)+igc)
               iprsm = iprsm + 1
               sumk = sumk + forrefo(jt,iprsm)*rwgt(iprsm+80)
            enddo
            forref(jt,igc) = sumk
         enddo
      enddo

      do jp = 1,9
         iprsm = 0
         do igc = 1,ngc(6)
            sumf = 0.
            do ipr = 1, ngn(ngs(5)+igc)
               iprsm = iprsm + 1
               sumf = sumf + sfluxrefo(iprsm,jp)
            enddo
            sfluxref(igc,jp) = sumf
         enddo
      enddo

      end subroutine cmbgb21


      subroutine cmbgb22





      use rrsw_kg22_f, only : kao, kbo, selfrefo, forrefo, sfluxrefo, &
                            absa, ka, absb, kb, selfref, forref, sfluxref


      integer  :: jn, jt, jp, igc, ipr, iprsm
      real  :: sumk, sumf


      do jn = 1,9
         do jt = 1,5
            do jp = 1,13
               iprsm = 0
               do igc = 1,ngc(7)
                  sumk = 0.
                  do ipr = 1, ngn(ngs(6)+igc)
                     iprsm = iprsm + 1
                     sumk = sumk + kao(jn,jt,jp,iprsm)*rwgt(iprsm+96)
                  enddo
                  ka(jn,jt,jp,igc) = sumk
               enddo
            enddo
         enddo
      enddo

      do jt = 1,5
         do jp = 13,59
            iprsm = 0
            do igc = 1,ngc(7)
               sumk = 0.
               do ipr = 1, ngn(ngs(6)+igc)
                  iprsm = iprsm + 1
                  sumk = sumk + kbo(jt,jp,iprsm)*rwgt(iprsm+96)
               enddo
               kb(jt,jp,igc) = sumk
            enddo
         enddo
      enddo

      do jt = 1,10
         iprsm = 0
         do igc = 1,ngc(7)
            sumk = 0.
            do ipr = 1, ngn(ngs(6)+igc)
               iprsm = iprsm + 1
               sumk = sumk + selfrefo(jt,iprsm)*rwgt(iprsm+96)
            enddo
            selfref(jt,igc) = sumk
         enddo
      enddo

      do jt = 1,3
         iprsm = 0
         do igc = 1,ngc(7)
            sumk = 0.
            do ipr = 1, ngn(ngs(6)+igc)
               iprsm = iprsm + 1
               sumk = sumk + forrefo(jt,iprsm)*rwgt(iprsm+96)
            enddo
            forref(jt,igc) = sumk
         enddo
      enddo

      do jp = 1,9
         iprsm = 0
         do igc = 1,ngc(7)
            sumf = 0.
            do ipr = 1, ngn(ngs(6)+igc)
               iprsm = iprsm + 1
               sumf = sumf + sfluxrefo(iprsm,jp)
            enddo
            sfluxref(igc,jp) = sumf
         enddo
      enddo

      end subroutine cmbgb22


      subroutine cmbgb23





      use rrsw_kg23_f, only : kao, selfrefo, forrefo, sfluxrefo, raylo, &
                            absa, ka, selfref, forref, sfluxref, rayl


      integer  :: jt, jp, igc, ipr, iprsm
      real  :: sumk, sumf1, sumf2


      do jt = 1,5
         do jp = 1,13
            iprsm = 0
            do igc = 1,ngc(8)
               sumk = 0.
               do ipr = 1, ngn(ngs(7)+igc)
                  iprsm = iprsm + 1
                  sumk = sumk + kao(jt,jp,iprsm)*rwgt(iprsm+112)
               enddo
               ka(jt,jp,igc) = sumk
            enddo
         enddo
      enddo

      do jt = 1,10
         iprsm = 0
         do igc = 1,ngc(8)
            sumk = 0.
            do ipr = 1, ngn(ngs(7)+igc)
               iprsm = iprsm + 1
               sumk = sumk + selfrefo(jt,iprsm)*rwgt(iprsm+112)
            enddo
            selfref(jt,igc) = sumk
         enddo
      enddo

      do jt = 1,3
         iprsm = 0
         do igc = 1,ngc(8)
            sumk = 0.
            do ipr = 1, ngn(ngs(7)+igc)
               iprsm = iprsm + 1
               sumk = sumk + forrefo(jt,iprsm)*rwgt(iprsm+112)
            enddo
            forref(jt,igc) = sumk
         enddo
      enddo

      iprsm = 0
      do igc = 1,ngc(8)
         sumf1 = 0.
         sumf2 = 0.
         do ipr = 1, ngn(ngs(7)+igc)
            iprsm = iprsm + 1
            sumf1 = sumf1 + sfluxrefo(iprsm)
            sumf2 = sumf2 + raylo(iprsm)*rwgt(iprsm+112)
         enddo
         sfluxref(igc) = sumf1
         rayl(igc) = sumf2
      enddo

      end subroutine cmbgb23


      subroutine cmbgb24





      use rrsw_kg24_f, only : kao, kbo, selfrefo, forrefo, sfluxrefo, &
                            abso3ao, abso3bo, raylao, raylbo, &
                            absa, ka, absb, kb, selfref, forref, sfluxref, &
                            abso3a, abso3b, rayla, raylb


      integer  :: jn, jt, jp, igc, ipr, iprsm
      real  :: sumk, sumf1, sumf2, sumf3


      do jn = 1,9
         do jt = 1,5
            do jp = 1,13
               iprsm = 0
               do igc = 1,ngc(9)
                  sumk = 0.
                  do ipr = 1, ngn(ngs(8)+igc)
                     iprsm = iprsm + 1
                     sumk = sumk + kao(jn,jt,jp,iprsm)*rwgt(iprsm+128)
                  enddo
                  ka(jn,jt,jp,igc) = sumk
               enddo
            enddo
         enddo
      enddo

      do jt = 1,5
         do jp = 13,59
            iprsm = 0
            do igc = 1,ngc(9)
               sumk = 0.
               do ipr = 1, ngn(ngs(8)+igc)
                  iprsm = iprsm + 1
                  sumk = sumk + kbo(jt,jp,iprsm)*rwgt(iprsm+128)
               enddo
               kb(jt,jp,igc) = sumk
            enddo
         enddo
      enddo

      do jt = 1,10
         iprsm = 0
         do igc = 1,ngc(9)
            sumk = 0.
            do ipr = 1, ngn(ngs(8)+igc)
               iprsm = iprsm + 1
               sumk = sumk + selfrefo(jt,iprsm)*rwgt(iprsm+128)
            enddo
            selfref(jt,igc) = sumk
         enddo
      enddo

      do jt = 1,3
         iprsm = 0
         do igc = 1,ngc(9)
            sumk = 0.
            do ipr = 1, ngn(ngs(8)+igc)
               iprsm = iprsm + 1
               sumk = sumk + forrefo(jt,iprsm)*rwgt(iprsm+128)
            enddo
            forref(jt,igc) = sumk
         enddo
      enddo

      iprsm = 0
      do igc = 1,ngc(9)
         sumf1 = 0.
         sumf2 = 0.
         sumf3 = 0.
         do ipr = 1, ngn(ngs(8)+igc)
            iprsm = iprsm + 1
            sumf1 = sumf1 + raylbo(iprsm)*rwgt(iprsm+128)
            sumf2 = sumf2 + abso3ao(iprsm)*rwgt(iprsm+128)
            sumf3 = sumf3 + abso3bo(iprsm)*rwgt(iprsm+128)
         enddo
         raylb(igc) = sumf1
         abso3a(igc) = sumf2
         abso3b(igc) = sumf3
      enddo

      do jp = 1,9
         iprsm = 0
         do igc = 1,ngc(9)
            sumf1 = 0.
            sumf2 = 0.
            do ipr = 1, ngn(ngs(8)+igc)
               iprsm = iprsm + 1
               sumf1 = sumf1 + sfluxrefo(iprsm,jp)
               sumf2 = sumf2 + raylao(iprsm,jp)*rwgt(iprsm+128)
            enddo
            sfluxref(igc,jp) = sumf1
            rayla(igc,jp) = sumf2
         enddo
      enddo

      end subroutine cmbgb24


      subroutine cmbgb25





      use rrsw_kg25_f, only : kao, sfluxrefo, &
                            abso3ao, abso3bo, raylo, &
                            absa, ka, sfluxref, &
                            abso3a, abso3b, rayl


      integer  :: jt, jp, igc, ipr, iprsm
      real  :: sumk, sumf1, sumf2, sumf3, sumf4


      do jt = 1,5
         do jp = 1,13
            iprsm = 0
            do igc = 1,ngc(10)
               sumk = 0.
               do ipr = 1, ngn(ngs(9)+igc)
                  iprsm = iprsm + 1
                  sumk = sumk + kao(jt,jp,iprsm)*rwgt(iprsm+144)
               enddo
               ka(jt,jp,igc) = sumk
            enddo
         enddo
      enddo

      iprsm = 0
      do igc = 1,ngc(10)
         sumf1 = 0.
         sumf2 = 0.
         sumf3 = 0.
         sumf4 = 0.
         do ipr = 1, ngn(ngs(9)+igc)
            iprsm = iprsm + 1
            sumf1 = sumf1 + sfluxrefo(iprsm)
            sumf2 = sumf2 + abso3ao(iprsm)*rwgt(iprsm+144)
            sumf3 = sumf3 + abso3bo(iprsm)*rwgt(iprsm+144)
            sumf4 = sumf4 + raylo(iprsm)*rwgt(iprsm+144)
         enddo
         sfluxref(igc) = sumf1
         abso3a(igc) = sumf2
         abso3b(igc) = sumf3
         rayl(igc) = sumf4
      enddo

      end subroutine cmbgb25


      subroutine cmbgb26





      use rrsw_kg26_f, only : sfluxrefo, raylo, &
                            sfluxref, rayl


      integer  :: igc, ipr, iprsm
      real  :: sumf1, sumf2


      iprsm = 0
      do igc = 1,ngc(11)
         sumf1 = 0.
         sumf2 = 0.
         do ipr = 1, ngn(ngs(10)+igc)
            iprsm = iprsm + 1
            sumf1 = sumf1 + raylo(iprsm)*rwgt(iprsm+160)
            sumf2 = sumf2 + sfluxrefo(iprsm)
         enddo
         rayl(igc) = sumf1
         sfluxref(igc) = sumf2
      enddo

      end subroutine cmbgb26


      subroutine cmbgb27





      use rrsw_kg27_f, only : kao, kbo, sfluxrefo, raylo, &
                            absa, ka, absb, kb, sfluxref, rayl


      integer  :: jt, jp, igc, ipr, iprsm
      real  :: sumk, sumf1, sumf2


      do jt = 1,5
         do jp = 1,13
            iprsm = 0
            do igc = 1,ngc(12)
               sumk = 0.
               do ipr = 1, ngn(ngs(11)+igc)
                  iprsm = iprsm + 1
                  sumk = sumk + kao(jt,jp,iprsm)*rwgt(iprsm+176)
               enddo
               ka(jt,jp,igc) = sumk
            enddo
         enddo
         do jp = 13,59
            iprsm = 0
            do igc = 1,ngc(12)
               sumk = 0.
               do ipr = 1, ngn(ngs(11)+igc)
                  iprsm = iprsm + 1
                  sumk = sumk + kbo(jt,jp,iprsm)*rwgt(iprsm+176)
               enddo
               kb(jt,jp,igc) = sumk
            enddo
         enddo
      enddo

      iprsm = 0
      do igc = 1,ngc(12)
         sumf1 = 0.
         sumf2 = 0.
         do ipr = 1, ngn(ngs(11)+igc)
            iprsm = iprsm + 1
            sumf1 = sumf1 + sfluxrefo(iprsm)
            sumf2 = sumf2 + raylo(iprsm)*rwgt(iprsm+176)
         enddo
         sfluxref(igc) = sumf1
         rayl(igc) = sumf2
      enddo

      end subroutine cmbgb27


      subroutine cmbgb28





      use rrsw_kg28_f, only : kao, kbo, sfluxrefo, &
                            absa, ka, absb, kb, sfluxref


      integer  :: jn, jt, jp, igc, ipr, iprsm
      real  :: sumk, sumf


      do jn = 1,9
         do jt = 1,5
            do jp = 1,13
               iprsm = 0
               do igc = 1,ngc(13)
                  sumk = 0.
                  do ipr = 1, ngn(ngs(12)+igc)
                     iprsm = iprsm + 1
                     sumk = sumk + kao(jn,jt,jp,iprsm)*rwgt(iprsm+192)
                  enddo
                  ka(jn,jt,jp,igc) = sumk
               enddo
            enddo
         enddo
      enddo

      do jn = 1,5
         do jt = 1,5
            do jp = 13,59
               iprsm = 0
               do igc = 1,ngc(13)
                  sumk = 0.
                  do ipr = 1, ngn(ngs(12)+igc)
                     iprsm = iprsm + 1
                     sumk = sumk + kbo(jn,jt,jp,iprsm)*rwgt(iprsm+192)
                  enddo
                  kb(jn,jt,jp,igc) = sumk
               enddo
            enddo
         enddo
      enddo

      do jp = 1,5
         iprsm = 0
         do igc = 1,ngc(13)
            sumf = 0.
            do ipr = 1, ngn(ngs(12)+igc)
               iprsm = iprsm + 1
               sumf = sumf + sfluxrefo(iprsm,jp)
            enddo
            sfluxref(igc,jp) = sumf
         enddo
      enddo

      end subroutine cmbgb28


      subroutine cmbgb29





      use rrsw_kg29_f, only : kao, kbo, selfrefo, forrefo, sfluxrefo, &
                            absh2oo, absco2o, &
                            absa, ka, absb, kb, selfref, forref, sfluxref, &
                            absh2o, absco2


      integer  :: jt, jp, igc, ipr, iprsm
      real  :: sumk, sumf1, sumf2, sumf3


      do jt = 1,5
         do jp = 1,13
            iprsm = 0
            do igc = 1,ngc(14)
               sumk = 0.
               do ipr = 1, ngn(ngs(13)+igc)
                  iprsm = iprsm + 1
                  sumk = sumk + kao(jt,jp,iprsm)*rwgt(iprsm+208)
               enddo
               ka(jt,jp,igc) = sumk
            enddo
         enddo
         do jp = 13,59
            iprsm = 0
            do igc = 1,ngc(14)
               sumk = 0.
               do ipr = 1, ngn(ngs(13)+igc)
                  iprsm = iprsm + 1
                  sumk = sumk + kbo(jt,jp,iprsm)*rwgt(iprsm+208)
               enddo
               kb(jt,jp,igc) = sumk
            enddo
         enddo
      enddo

      do jt = 1,10
         iprsm = 0
         do igc = 1,ngc(14)
            sumk = 0.
            do ipr = 1, ngn(ngs(13)+igc)
               iprsm = iprsm + 1
               sumk = sumk + selfrefo(jt,iprsm)*rwgt(iprsm+208)
            enddo
            selfref(jt,igc) = sumk
         enddo
      enddo

      do jt = 1,4
         iprsm = 0
         do igc = 1,ngc(14)
            sumk = 0.
            do ipr = 1, ngn(ngs(13)+igc)
               iprsm = iprsm + 1
               sumk = sumk + forrefo(jt,iprsm)*rwgt(iprsm+208)
            enddo
            forref(jt,igc) = sumk
         enddo
      enddo

      iprsm = 0
      do igc = 1,ngc(14)
         sumf1 = 0.
         sumf2 = 0.
         sumf3 = 0.
         do ipr = 1, ngn(ngs(13)+igc)
            iprsm = iprsm + 1
            sumf1 = sumf1 + sfluxrefo(iprsm)
            sumf2 = sumf2 + absco2o(iprsm)*rwgt(iprsm+208)
            sumf3 = sumf3 + absh2oo(iprsm)*rwgt(iprsm+208)
         enddo
         sfluxref(igc) = sumf1
         absco2(igc) = sumf2
         absh2o(igc) = sumf3
      enddo

      end subroutine cmbgb29


      subroutine swcldpr








      use rrsw_cld_f, only : extliq1, ssaliq1, asyliq1, &
                           extice2, ssaice2, asyice2, &
                           extice3, ssaice3, asyice3, fdlice3, &
                           abari, bbari, cbari, dbari, ebari, fbari

      save






















































      abari(:) = (/ &
        & 3.448e-03 ,3.448e-03 ,3.448e-03 ,3.448e-03 ,3.448e-03  /)
      bbari(:) = (/ &
        & 2.431e+00 ,2.431e+00 ,2.431e+00 ,2.431e+00 ,2.431e+00  /)
      cbari(:) = (/ &
        & 1.000e-05 ,1.100e-04 ,1.240e-02 ,3.779e-02 ,4.666e-01  /)
      dbari(:) = (/ &
        & 0.000e+00 ,1.405e-05 ,6.867e-04 ,1.284e-03 ,2.050e-05  /)
      ebari(:) = (/ &
        & 7.661e-01 ,7.730e-01 ,7.865e-01 ,8.172e-01 ,9.595e-01  /)
      fbari(:) = (/ &
        & 5.851e-04 ,5.665e-04 ,7.204e-04 ,7.463e-04 ,1.076e-04  /)






      extliq1(:, 16) = (/ &
        & 9.004493E-01,6.366723E-01,4.542354E-01,3.468253E-01,2.816431E-01,&
        & 2.383415E-01,2.070854E-01,1.831854E-01,1.642115E-01,1.487539E-01,&
        & 1.359169E-01,1.250900E-01,1.158354E-01,1.078400E-01,1.008646E-01,&
        & 9.472307E-02,8.928000E-02,8.442308E-02,8.005924E-02,7.612231E-02,&
        & 7.255153E-02,6.929539E-02,6.631769E-02,6.358153E-02,6.106231E-02,&
        & 5.873077E-02,5.656924E-02,5.455769E-02,5.267846E-02,5.091923E-02,&
        & 4.926692E-02,4.771154E-02,4.623923E-02,4.484385E-02,4.351539E-02,&
        & 4.224615E-02,4.103385E-02,3.986538E-02,3.874077E-02,3.765462E-02,&
        & 3.660077E-02,3.557384E-02,3.457615E-02,3.360308E-02,3.265000E-02,&
        & 3.171770E-02,3.080538E-02,2.990846E-02,2.903000E-02,2.816461E-02,&
        & 2.731539E-02,2.648231E-02,2.566308E-02,2.485923E-02,2.407000E-02,&
        & 2.329615E-02,2.253769E-02,2.179615E-02 /)

      extliq1(:, 17) = (/ &
       & 6.741200e-01,5.390739e-01,4.198767e-01,3.332553e-01,2.735633e-01,&
       & 2.317727e-01,2.012760e-01,1.780400e-01,1.596927e-01,1.447980e-01,&
       & 1.324480e-01,1.220347e-01,1.131327e-01,1.054313e-01,9.870534e-02,&
       & 9.278200e-02,8.752599e-02,8.282933e-02,7.860600e-02,7.479133e-02,&
       & 7.132800e-02,6.816733e-02,6.527401e-02,6.261266e-02,6.015934e-02,&
       & 5.788867e-02,5.578134e-02,5.381667e-02,5.198133e-02,5.026067e-02,&
       & 4.864466e-02,4.712267e-02,4.568066e-02,4.431200e-02,4.300867e-02,&
       & 4.176600e-02,4.057400e-02,3.942534e-02,3.832066e-02,3.725068e-02,&
       & 3.621400e-02,3.520533e-02,3.422333e-02,3.326400e-02,3.232467e-02,&
       & 3.140535e-02,3.050400e-02,2.962000e-02,2.875267e-02,2.789800e-02,&
       & 2.705934e-02,2.623667e-02,2.542667e-02,2.463200e-02,2.385267e-02,&
       & 2.308667e-02,2.233667e-02,2.160067e-02 /)

      extliq1(:, 18) = (/ &
       & 9.250861e-01,6.245692e-01,4.347038e-01,3.320208e-01,2.714869e-01,&
       & 2.309516e-01,2.012592e-01,1.783315e-01,1.600369e-01,1.451000e-01,&
       & 1.326838e-01,1.222069e-01,1.132554e-01,1.055146e-01,9.876000e-02,&
       & 9.281386e-02,8.754000e-02,8.283078e-02,7.860077e-02,7.477769e-02,&
       & 7.130847e-02,6.814461e-02,6.524615e-02,6.258462e-02,6.012847e-02,&
       & 5.785462e-02,5.574231e-02,5.378000e-02,5.194461e-02,5.022462e-02,&
       & 4.860846e-02,4.708462e-02,4.564154e-02,4.427462e-02,4.297231e-02,&
       & 4.172769e-02,4.053693e-02,3.939000e-02,3.828462e-02,3.721692e-02,&
       & 3.618000e-02,3.517077e-02,3.418923e-02,3.323077e-02,3.229154e-02,&
       & 3.137154e-02,3.047154e-02,2.959077e-02,2.872308e-02,2.786846e-02,&
       & 2.703077e-02,2.620923e-02,2.540077e-02,2.460615e-02,2.382693e-02,&
       & 2.306231e-02,2.231231e-02,2.157923e-02 /)

      extliq1(:, 19) = (/ &
       & 9.298960e-01,5.776460e-01,4.083450e-01,3.211160e-01,2.666390e-01,&
       & 2.281990e-01,1.993250e-01,1.768080e-01,1.587810e-01,1.440390e-01,&
       & 1.317720e-01,1.214150e-01,1.125540e-01,1.048890e-01,9.819600e-02,&
       & 9.230201e-02,8.706900e-02,8.239698e-02,7.819500e-02,7.439899e-02,&
       & 7.095300e-02,6.780700e-02,6.492900e-02,6.228600e-02,5.984600e-02,&
       & 5.758599e-02,5.549099e-02,5.353801e-02,5.171400e-02,5.000500e-02,&
       & 4.840000e-02,4.688500e-02,4.545100e-02,4.409300e-02,4.279700e-02,&
       & 4.156100e-02,4.037700e-02,3.923800e-02,3.813800e-02,3.707600e-02,&
       & 3.604500e-02,3.504300e-02,3.406500e-02,3.310800e-02,3.217700e-02,&
       & 3.126600e-02,3.036800e-02,2.948900e-02,2.862400e-02,2.777500e-02,&
       & 2.694200e-02,2.612300e-02,2.531700e-02,2.452800e-02,2.375100e-02,&
       & 2.299100e-02,2.224300e-02,2.151201e-02 /)

      extliq1(:, 20) = (/ &
       & 8.780964e-01,5.407031e-01,3.961100e-01,3.166645e-01,2.640455e-01,&
       & 2.261070e-01,1.974820e-01,1.751775e-01,1.573415e-01,1.427725e-01,&
       & 1.306535e-01,1.204195e-01,1.116650e-01,1.040915e-01,9.747550e-02,&
       & 9.164800e-02,8.647649e-02,8.185501e-02,7.770200e-02,7.394749e-02,&
       & 7.053800e-02,6.742700e-02,6.457999e-02,6.196149e-02,5.954450e-02,&
       & 5.730650e-02,5.522949e-02,5.329450e-02,5.148500e-02,4.979000e-02,&
       & 4.819600e-02,4.669301e-02,4.527050e-02,4.391899e-02,4.263500e-02,&
       & 4.140500e-02,4.022850e-02,3.909500e-02,3.800199e-02,3.694600e-02,&
       & 3.592000e-02,3.492250e-02,3.395050e-02,3.300150e-02,3.207250e-02,&
       & 3.116250e-02,3.027100e-02,2.939500e-02,2.853500e-02,2.768900e-02,&
       & 2.686000e-02,2.604350e-02,2.524150e-02,2.445350e-02,2.368049e-02,&
       & 2.292150e-02,2.217800e-02,2.144800e-02 /)

      extliq1(:, 21) = (/ &
       & 7.937480e-01,5.123036e-01,3.858181e-01,3.099622e-01,2.586829e-01,&
       & 2.217587e-01,1.939755e-01,1.723397e-01,1.550258e-01,1.408600e-01,&
       & 1.290545e-01,1.190661e-01,1.105039e-01,1.030848e-01,9.659387e-02,&
       & 9.086775e-02,8.577807e-02,8.122452e-02,7.712711e-02,7.342193e-02,&
       & 7.005387e-02,6.697840e-02,6.416000e-02,6.156903e-02,5.917484e-02,&
       & 5.695807e-02,5.489968e-02,5.298097e-02,5.118806e-02,4.950645e-02,&
       & 4.792710e-02,4.643581e-02,4.502484e-02,4.368547e-02,4.241001e-02,&
       & 4.118936e-02,4.002193e-02,3.889711e-02,3.781322e-02,3.676387e-02,&
       & 3.574549e-02,3.475548e-02,3.379033e-02,3.284678e-02,3.192420e-02,&
       & 3.102032e-02,3.013484e-02,2.926258e-02,2.840839e-02,2.756742e-02,&
       & 2.674258e-02,2.593064e-02,2.513258e-02,2.435000e-02,2.358064e-02,&
       & 2.282581e-02,2.208548e-02,2.135936e-02 /)

      extliq1(:, 22) = (/ &
       & 7.533129e-01,5.033129e-01,3.811271e-01,3.062757e-01,2.558729e-01,&
       & 2.196828e-01,1.924372e-01,1.711714e-01,1.541086e-01,1.401114e-01,&
       & 1.284257e-01,1.185200e-01,1.100243e-01,1.026529e-01,9.620142e-02,&
       & 9.050714e-02,8.544428e-02,8.091714e-02,7.684000e-02,7.315429e-02,&
       & 6.980143e-02,6.673999e-02,6.394000e-02,6.136000e-02,5.897715e-02,&
       & 5.677000e-02,5.472285e-02,5.281286e-02,5.102858e-02,4.935429e-02,&
       & 4.778000e-02,4.629714e-02,4.489142e-02,4.355857e-02,4.228715e-02,&
       & 4.107285e-02,3.990857e-02,3.879000e-02,3.770999e-02,3.666429e-02,&
       & 3.565000e-02,3.466286e-02,3.370143e-02,3.276143e-02,3.184143e-02,&
       & 3.094000e-02,3.005714e-02,2.919000e-02,2.833714e-02,2.750000e-02,&
       & 2.667714e-02,2.586714e-02,2.507143e-02,2.429143e-02,2.352428e-02,&
       & 2.277143e-02,2.203429e-02,2.130857e-02 /)

      extliq1(:, 23) = (/ &
       & 7.079894e-01,4.878198e-01,3.719852e-01,3.001873e-01,2.514795e-01,&
       & 2.163013e-01,1.897100e-01,1.689033e-01,1.521793e-01,1.384449e-01,&
       & 1.269666e-01,1.172326e-01,1.088745e-01,1.016224e-01,9.527085e-02,&
       & 8.966240e-02,8.467543e-02,8.021144e-02,7.619344e-02,7.255676e-02,&
       & 6.924996e-02,6.623030e-02,6.346261e-02,6.091499e-02,5.856325e-02,&
       & 5.638385e-02,5.435930e-02,5.247156e-02,5.070699e-02,4.905230e-02,&
       & 4.749499e-02,4.602611e-02,4.463581e-02,4.331543e-02,4.205647e-02,&
       & 4.085241e-02,3.969978e-02,3.859033e-02,3.751877e-02,3.648168e-02,&
       & 3.547468e-02,3.449553e-02,3.354072e-02,3.260732e-02,3.169438e-02,&
       & 3.079969e-02,2.992146e-02,2.905875e-02,2.821201e-02,2.737873e-02,&
       & 2.656052e-02,2.575586e-02,2.496511e-02,2.418783e-02,2.342500e-02,&
       & 2.267646e-02,2.194177e-02,2.122146e-02 /)

      extliq1(:, 24) = (/ &
       & 6.850164e-01,4.762468e-01,3.642001e-01,2.946012e-01,2.472001e-01,&
       & 2.128588e-01,1.868537e-01,1.664893e-01,1.501142e-01,1.366620e-01,&
       & 1.254147e-01,1.158721e-01,1.076732e-01,1.005530e-01,9.431306e-02,&
       & 8.879891e-02,8.389232e-02,7.949714e-02,7.553857e-02,7.195474e-02,&
       & 6.869413e-02,6.571444e-02,6.298286e-02,6.046779e-02,5.814474e-02,&
       & 5.599141e-02,5.399114e-02,5.212443e-02,5.037870e-02,4.874321e-02,&
       & 4.720219e-02,4.574813e-02,4.437160e-02,4.306460e-02,4.181810e-02,&
       & 4.062603e-02,3.948252e-02,3.838256e-02,3.732049e-02,3.629192e-02,&
       & 3.529301e-02,3.432190e-02,3.337412e-02,3.244842e-02,3.154175e-02,&
       & 3.065253e-02,2.978063e-02,2.892367e-02,2.808221e-02,2.725478e-02,&
       & 2.644174e-02,2.564175e-02,2.485508e-02,2.408303e-02,2.332365e-02,&
       & 2.257890e-02,2.184824e-02,2.113224e-02 /)

      extliq1(:, 25) = (/ &
       & 6.673017e-01,4.664520e-01,3.579398e-01,2.902234e-01,2.439904e-01,&
       & 2.104149e-01,1.849277e-01,1.649234e-01,1.488087e-01,1.355515e-01,&
       & 1.244562e-01,1.150329e-01,1.069321e-01,9.989310e-02,9.372070e-02,&
       & 8.826450e-02,8.340622e-02,7.905378e-02,7.513109e-02,7.157859e-02,&
       & 6.834588e-02,6.539114e-02,6.268150e-02,6.018621e-02,5.788098e-02,&
       & 5.574351e-02,5.375699e-02,5.190412e-02,5.017099e-02,4.854497e-02,&
       & 4.701490e-02,4.557030e-02,4.420249e-02,4.290304e-02,4.166427e-02,&
       & 4.047820e-02,3.934232e-02,3.824778e-02,3.719236e-02,3.616931e-02,&
       & 3.517597e-02,3.420856e-02,3.326566e-02,3.234346e-02,3.144122e-02,&
       & 3.055684e-02,2.968798e-02,2.883519e-02,2.799635e-02,2.717228e-02,&
       & 2.636182e-02,2.556424e-02,2.478114e-02,2.401086e-02,2.325657e-02,&
       & 2.251506e-02,2.178594e-02,2.107301e-02 /)

      extliq1(:, 26) = (/ &
       & 6.552414e-01,4.599454e-01,3.538626e-01,2.873547e-01,2.418033e-01,&
       & 2.086660e-01,1.834885e-01,1.637142e-01,1.477767e-01,1.346583e-01,&
       & 1.236734e-01,1.143412e-01,1.063148e-01,9.933905e-02,9.322026e-02,&
       & 8.780979e-02,8.299230e-02,7.867554e-02,7.478450e-02,7.126053e-02,&
       & 6.805276e-02,6.512143e-02,6.243211e-02,5.995541e-02,5.766712e-02,&
       & 5.554484e-02,5.357246e-02,5.173222e-02,5.001069e-02,4.839505e-02,&
       & 4.687471e-02,4.543861e-02,4.407857e-02,4.278577e-02,4.155331e-02,&
       & 4.037322e-02,3.924302e-02,3.815376e-02,3.710172e-02,3.608296e-02,&
       & 3.509330e-02,3.412980e-02,3.319009e-02,3.227106e-02,3.137157e-02,&
       & 3.048950e-02,2.962365e-02,2.877297e-02,2.793726e-02,2.711500e-02,&
       & 2.630666e-02,2.551206e-02,2.473052e-02,2.396287e-02,2.320861e-02,&
       & 2.246810e-02,2.174162e-02,2.102927e-02 /)

      extliq1(:, 27) = (/ &
       & 6.430901e-01,4.532134e-01,3.496132e-01,2.844655e-01,2.397347e-01,&
       & 2.071236e-01,1.822976e-01,1.627640e-01,1.469961e-01,1.340006e-01,&
       & 1.231069e-01,1.138441e-01,1.058706e-01,9.893678e-02,9.285166e-02,&
       & 8.746871e-02,8.267411e-02,7.837656e-02,7.450257e-02,7.099318e-02,&
       & 6.779929e-02,6.487987e-02,6.220168e-02,5.973530e-02,5.745636e-02,&
       & 5.534344e-02,5.337986e-02,5.154797e-02,4.983404e-02,4.822582e-02,&
       & 4.671228e-02,4.528321e-02,4.392997e-02,4.264325e-02,4.141647e-02,&
       & 4.024259e-02,3.911767e-02,3.803309e-02,3.698782e-02,3.597140e-02,&
       & 3.498774e-02,3.402852e-02,3.309340e-02,3.217818e-02,3.128292e-02,&
       & 3.040486e-02,2.954230e-02,2.869545e-02,2.786261e-02,2.704372e-02,&
       & 2.623813e-02,2.544668e-02,2.466788e-02,2.390313e-02,2.315136e-02,&
       & 2.241391e-02,2.168921e-02,2.097903e-02 /)

      extliq1(:, 28) = (/ &
       & 6.367074e-01,4.495768e-01,3.471263e-01,2.826149e-01,2.382868e-01,&
       & 2.059640e-01,1.813562e-01,1.619881e-01,1.463436e-01,1.334402e-01,&
       & 1.226166e-01,1.134096e-01,1.054829e-01,9.858838e-02,9.253790e-02,&
       & 8.718582e-02,8.241830e-02,7.814482e-02,7.429212e-02,7.080165e-02,&
       & 6.762385e-02,6.471838e-02,6.205388e-02,5.959726e-02,5.732871e-02,&
       & 5.522402e-02,5.326793e-02,5.144230e-02,4.973440e-02,4.813188e-02,&
       & 4.662283e-02,4.519798e-02,4.384833e-02,4.256541e-02,4.134253e-02,&
       & 4.017136e-02,3.904911e-02,3.796779e-02,3.692364e-02,3.591182e-02,&
       & 3.492930e-02,3.397230e-02,3.303920e-02,3.212572e-02,3.123278e-02,&
       & 3.035519e-02,2.949493e-02,2.864985e-02,2.781840e-02,2.700197e-02,&
       & 2.619682e-02,2.540674e-02,2.462966e-02,2.386613e-02,2.311602e-02,&
       & 2.237846e-02,2.165660e-02,2.094756e-02 /)

      extliq1(:, 29) = (/ &
       & 4.298416e-01,4.391639e-01,3.975030e-01,3.443028e-01,2.957345e-01,&
       & 2.556461e-01,2.234755e-01,1.976636e-01,1.767428e-01,1.595611e-01,&
       & 1.452636e-01,1.332156e-01,1.229481e-01,1.141059e-01,1.064208e-01,&
       & 9.968527e-02,9.373833e-02,8.845221e-02,8.372112e-02,7.946667e-02,&
       & 7.561807e-02,7.212029e-02,6.893166e-02,6.600944e-02,6.332277e-02,&
       & 6.084277e-02,5.854721e-02,5.641361e-02,5.442639e-02,5.256750e-02,&
       & 5.082499e-02,4.918556e-02,4.763694e-02,4.617222e-02,4.477861e-02,&
       & 4.344861e-02,4.217999e-02,4.096111e-02,3.978638e-02,3.865361e-02,&
       & 3.755473e-02,3.649028e-02,3.545361e-02,3.444361e-02,3.345666e-02,&
       & 3.249167e-02,3.154722e-02,3.062083e-02,2.971250e-02,2.882083e-02,&
       & 2.794611e-02,2.708778e-02,2.624500e-02,2.541750e-02,2.460528e-02,&
       & 2.381194e-02,2.303250e-02,2.226833e-02 /)



      ssaliq1(:, 16) = (/ &
       & 8.362119e-01,8.098460e-01,7.762291e-01,7.486042e-01,7.294172e-01,&
       & 7.161000e-01,7.060656e-01,6.978387e-01,6.907193e-01,6.843551e-01,&
       & 6.785668e-01,6.732450e-01,6.683191e-01,6.637264e-01,6.594307e-01,&
       & 6.554033e-01,6.516115e-01,6.480295e-01,6.446429e-01,6.414306e-01,&
       & 6.383783e-01,6.354750e-01,6.327068e-01,6.300665e-01,6.275376e-01,&
       & 6.251245e-01,6.228136e-01,6.205944e-01,6.184720e-01,6.164330e-01,&
       & 6.144742e-01,6.125962e-01,6.108004e-01,6.090740e-01,6.074200e-01,&
       & 6.058381e-01,6.043209e-01,6.028681e-01,6.014836e-01,6.001626e-01,&
       & 5.988957e-01,5.976864e-01,5.965390e-01,5.954379e-01,5.943972e-01,&
       & 5.934019e-01,5.924624e-01,5.915579e-01,5.907025e-01,5.898913e-01,&
       & 5.891213e-01,5.883815e-01,5.876851e-01,5.870158e-01,5.863868e-01,&
       & 5.857821e-01,5.852111e-01,5.846579e-01 /)

      ssaliq1(:, 17) = (/ &
       & 6.995459e-01,7.158012e-01,7.076001e-01,6.927244e-01,6.786434e-01,&
       & 6.673545e-01,6.585859e-01,6.516314e-01,6.459010e-01,6.410225e-01,&
       & 6.367574e-01,6.329554e-01,6.295119e-01,6.263595e-01,6.234462e-01,&
       & 6.207274e-01,6.181755e-01,6.157678e-01,6.134880e-01,6.113173e-01,&
       & 6.092495e-01,6.072689e-01,6.053717e-01,6.035507e-01,6.018001e-01,&
       & 6.001134e-01,5.984951e-01,5.969294e-01,5.954256e-01,5.939698e-01,&
       & 5.925716e-01,5.912265e-01,5.899270e-01,5.886771e-01,5.874746e-01,&
       & 5.863185e-01,5.852077e-01,5.841460e-01,5.831249e-01,5.821474e-01,&
       & 5.812078e-01,5.803173e-01,5.794616e-01,5.786443e-01,5.778617e-01,&
       & 5.771236e-01,5.764191e-01,5.757400e-01,5.750971e-01,5.744842e-01,&
       & 5.739012e-01,5.733482e-01,5.728175e-01,5.723214e-01,5.718383e-01,&
       & 5.713827e-01,5.709471e-01,5.705330e-01 /)

      ssaliq1(:, 18) = (/ &
       & 9.929711e-01,9.896942e-01,9.852408e-01,9.806820e-01,9.764512e-01,&
       & 9.725375e-01,9.688677e-01,9.653832e-01,9.620552e-01,9.588522e-01,&
       & 9.557475e-01,9.527265e-01,9.497731e-01,9.468756e-01,9.440270e-01,&
       & 9.412230e-01,9.384592e-01,9.357287e-01,9.330369e-01,9.303778e-01,&
       & 9.277502e-01,9.251546e-01,9.225907e-01,9.200553e-01,9.175521e-01,&
       & 9.150773e-01,9.126352e-01,9.102260e-01,9.078485e-01,9.055057e-01,&
       & 9.031978e-01,9.009306e-01,8.987010e-01,8.965177e-01,8.943774e-01,&
       & 8.922869e-01,8.902430e-01,8.882551e-01,8.863182e-01,8.844373e-01,&
       & 8.826143e-01,8.808499e-01,8.791413e-01,8.774940e-01,8.759019e-01,&
       & 8.743650e-01,8.728941e-01,8.714712e-01,8.701065e-01,8.688008e-01,&
       & 8.675409e-01,8.663295e-01,8.651714e-01,8.640637e-01,8.629943e-01,&
       & 8.619762e-01,8.609995e-01,8.600581e-01 /)

      ssaliq1(:, 19) = (/ &
       & 9.910612e-01,9.854226e-01,9.795008e-01,9.742920e-01,9.695996e-01,&
       & 9.652274e-01,9.610648e-01,9.570521e-01,9.531397e-01,9.493086e-01,&
       & 9.455413e-01,9.418362e-01,9.381902e-01,9.346016e-01,9.310718e-01,&
       & 9.275957e-01,9.241757e-01,9.208038e-01,9.174802e-01,9.142058e-01,&
       & 9.109753e-01,9.077895e-01,9.046433e-01,9.015409e-01,8.984784e-01,&
       & 8.954572e-01,8.924748e-01,8.895367e-01,8.866395e-01,8.837864e-01,&
       & 8.809819e-01,8.782267e-01,8.755231e-01,8.728712e-01,8.702802e-01,&
       & 8.677443e-01,8.652733e-01,8.628678e-01,8.605300e-01,8.582593e-01,&
       & 8.560596e-01,8.539352e-01,8.518782e-01,8.498915e-01,8.479790e-01,&
       & 8.461384e-01,8.443645e-01,8.426613e-01,8.410229e-01,8.394495e-01,&
       & 8.379428e-01,8.364967e-01,8.351117e-01,8.337820e-01,8.325091e-01,&
       & 8.312874e-01,8.301169e-01,8.289985e-01 /)

      ssaliq1(:, 20) = (/ &
       & 9.969802e-01,9.950445e-01,9.931448e-01,9.914272e-01,9.898652e-01,&
       & 9.884250e-01,9.870637e-01,9.857482e-01,9.844558e-01,9.831755e-01,&
       & 9.819068e-01,9.806477e-01,9.794000e-01,9.781666e-01,9.769461e-01,&
       & 9.757386e-01,9.745459e-01,9.733650e-01,9.721953e-01,9.710398e-01,&
       & 9.698936e-01,9.687583e-01,9.676334e-01,9.665192e-01,9.654132e-01,&
       & 9.643208e-01,9.632374e-01,9.621625e-01,9.611003e-01,9.600518e-01,&
       & 9.590144e-01,9.579922e-01,9.569864e-01,9.559948e-01,9.550239e-01,&
       & 9.540698e-01,9.531382e-01,9.522280e-01,9.513409e-01,9.504772e-01,&
       & 9.496360e-01,9.488220e-01,9.480327e-01,9.472693e-01,9.465333e-01,&
       & 9.458211e-01,9.451344e-01,9.444732e-01,9.438372e-01,9.432268e-01,&
       & 9.426391e-01,9.420757e-01,9.415308e-01,9.410102e-01,9.405115e-01,&
       & 9.400326e-01,9.395716e-01,9.391313e-01 /)

      ssaliq1(:, 21) = (/ &
       & 9.980034e-01,9.968572e-01,9.958696e-01,9.949747e-01,9.941241e-01,&
       & 9.933043e-01,9.924971e-01,9.916978e-01,9.909023e-01,9.901046e-01,&
       & 9.893087e-01,9.885146e-01,9.877195e-01,9.869283e-01,9.861379e-01,&
       & 9.853523e-01,9.845715e-01,9.837945e-01,9.830217e-01,9.822567e-01,&
       & 9.814935e-01,9.807356e-01,9.799815e-01,9.792332e-01,9.784845e-01,&
       & 9.777424e-01,9.770042e-01,9.762695e-01,9.755416e-01,9.748152e-01,&
       & 9.740974e-01,9.733873e-01,9.726813e-01,9.719861e-01,9.713010e-01,&
       & 9.706262e-01,9.699647e-01,9.693144e-01,9.686794e-01,9.680596e-01,&
       & 9.674540e-01,9.668657e-01,9.662926e-01,9.657390e-01,9.652019e-01,&
       & 9.646820e-01,9.641784e-01,9.636945e-01,9.632260e-01,9.627743e-01,&
       & 9.623418e-01,9.619227e-01,9.615194e-01,9.611341e-01,9.607629e-01,&
       & 9.604057e-01,9.600622e-01,9.597322e-01 /)

      ssaliq1(:, 22) = (/ &
       & 9.988219e-01,9.981767e-01,9.976168e-01,9.971066e-01,9.966195e-01,&
       & 9.961566e-01,9.956995e-01,9.952481e-01,9.947982e-01,9.943495e-01,&
       & 9.938955e-01,9.934368e-01,9.929825e-01,9.925239e-01,9.920653e-01,&
       & 9.916096e-01,9.911552e-01,9.907067e-01,9.902594e-01,9.898178e-01,&
       & 9.893791e-01,9.889453e-01,9.885122e-01,9.880837e-01,9.876567e-01,&
       & 9.872331e-01,9.868121e-01,9.863938e-01,9.859790e-01,9.855650e-01,&
       & 9.851548e-01,9.847491e-01,9.843496e-01,9.839521e-01,9.835606e-01,&
       & 9.831771e-01,9.827975e-01,9.824292e-01,9.820653e-01,9.817124e-01,&
       & 9.813644e-01,9.810291e-01,9.807020e-01,9.803864e-01,9.800782e-01,&
       & 9.797821e-01,9.794958e-01,9.792179e-01,9.789509e-01,9.786940e-01,&
       & 9.784460e-01,9.782090e-01,9.779789e-01,9.777553e-01,9.775425e-01,&
       & 9.773387e-01,9.771420e-01,9.769529e-01 /)

      ssaliq1(:, 23) = (/ &
       & 9.998902e-01,9.998395e-01,9.997915e-01,9.997442e-01,9.997016e-01,&
       & 9.996600e-01,9.996200e-01,9.995806e-01,9.995411e-01,9.995005e-01,&
       & 9.994589e-01,9.994178e-01,9.993766e-01,9.993359e-01,9.992948e-01,&
       & 9.992533e-01,9.992120e-01,9.991723e-01,9.991313e-01,9.990906e-01,&
       & 9.990510e-01,9.990113e-01,9.989716e-01,9.989323e-01,9.988923e-01,&
       & 9.988532e-01,9.988140e-01,9.987761e-01,9.987373e-01,9.986989e-01,&
       & 9.986597e-01,9.986239e-01,9.985861e-01,9.985485e-01,9.985123e-01,&
       & 9.984762e-01,9.984415e-01,9.984065e-01,9.983722e-01,9.983398e-01,&
       & 9.983078e-01,9.982758e-01,9.982461e-01,9.982157e-01,9.981872e-01,&
       & 9.981595e-01,9.981324e-01,9.981068e-01,9.980811e-01,9.980580e-01,&
       & 9.980344e-01,9.980111e-01,9.979908e-01,9.979690e-01,9.979492e-01,&
       & 9.979316e-01,9.979116e-01,9.978948e-01 /)

      ssaliq1(:, 24) = (/ &
       & 9.999978e-01,9.999948e-01,9.999915e-01,9.999905e-01,9.999896e-01,&
       & 9.999887e-01,9.999888e-01,9.999888e-01,9.999870e-01,9.999854e-01,&
       & 9.999855e-01,9.999856e-01,9.999839e-01,9.999834e-01,9.999829e-01,&
       & 9.999809e-01,9.999816e-01,9.999793e-01,9.999782e-01,9.999779e-01,&
       & 9.999772e-01,9.999764e-01,9.999756e-01,9.999744e-01,9.999744e-01,&
       & 9.999736e-01,9.999729e-01,9.999716e-01,9.999706e-01,9.999692e-01,&
       & 9.999690e-01,9.999675e-01,9.999673e-01,9.999660e-01,9.999654e-01,&
       & 9.999647e-01,9.999647e-01,9.999625e-01,9.999620e-01,9.999614e-01,&
       & 9.999613e-01,9.999607e-01,9.999604e-01,9.999594e-01,9.999589e-01,&
       & 9.999586e-01,9.999567e-01,9.999550e-01,9.999557e-01,9.999542e-01,&
       & 9.999546e-01,9.999539e-01,9.999536e-01,9.999526e-01,9.999523e-01,&
       & 9.999508e-01,9.999534e-01,9.999507e-01 /)

      ssaliq1(:, 25) = (/ &
       & 1.000000e+00,1.000000e+00,1.000000e+00,1.000000e+00,1.000000e+00,&
       & 1.000000e+00,1.000000e+00,1.000000e+00,1.000000e+00,1.000000e+00,&
       & 1.000000e+00,1.000000e+00,1.000000e+00,1.000000e+00,1.000000e+00,&
       & 1.000000e+00,1.000000e+00,1.000000e+00,1.000000e+00,9.999995e-01,&
       & 9.999995e-01,9.999990e-01,9.999991e-01,9.999991e-01,9.999990e-01,&
       & 9.999989e-01,9.999988e-01,9.999988e-01,9.999986e-01,9.999988e-01,&
       & 9.999986e-01,9.999987e-01,9.999986e-01,9.999985e-01,9.999985e-01,&
       & 9.999985e-01,9.999985e-01,9.999983e-01,9.999983e-01,9.999981e-01,&
       & 9.999981e-01,9.999986e-01,9.999985e-01,9.999983e-01,9.999984e-01,&
       & 9.999982e-01,9.999983e-01,9.999982e-01,9.999980e-01,9.999981e-01,&
       & 9.999978e-01,9.999979e-01,9.999985e-01,9.999985e-01,9.999983e-01,&
       & 9.999983e-01,9.999983e-01,9.999983e-01 /)

      ssaliq1(:, 26) = (/ &
       & 1.000000e+00,1.000000e+00,1.000000e+00,1.000000e+00,1.000000e+00,&
       & 1.000000e+00,1.000000e+00,1.000000e+00,1.000000e+00,1.000000e+00,&
       & 1.000000e+00,1.000000e+00,1.000000e+00,1.000000e+00,1.000000e+00,&
       & 1.000000e+00,1.000000e+00,1.000000e+00,1.000000e+00,9.999991e-01,&
       & 9.999990e-01,9.999992e-01,9.999995e-01,9.999986e-01,9.999994e-01,&
       & 9.999985e-01,9.999980e-01,9.999984e-01,9.999983e-01,9.999979e-01,&
       & 9.999969e-01,9.999977e-01,9.999971e-01,9.999969e-01,9.999969e-01,&
       & 9.999965e-01,9.999970e-01,9.999985e-01,9.999973e-01,9.999961e-01,&
       & 9.999968e-01,9.999952e-01,9.999970e-01,9.999974e-01,9.999965e-01,&
       & 9.999969e-01,9.999970e-01,9.999970e-01,9.999960e-01,9.999923e-01,&
       & 9.999958e-01,9.999937e-01,9.999960e-01,9.999953e-01,9.999946e-01,&
       & 9.999946e-01,9.999957e-01,9.999951e-01 /)

      ssaliq1(:, 27) = (/ &
       & 1.000000e+00,1.000000e+00,9.999983e-01,9.999979e-01,9.999965e-01,&
       & 9.999949e-01,9.999948e-01,9.999918e-01,9.999917e-01,9.999923e-01,&
       & 9.999908e-01,9.999889e-01,9.999902e-01,9.999895e-01,9.999881e-01,&
       & 9.999882e-01,9.999876e-01,9.999866e-01,9.999866e-01,9.999858e-01,&
       & 9.999860e-01,9.999852e-01,9.999836e-01,9.999831e-01,9.999818e-01,&
       & 9.999808e-01,9.999816e-01,9.999800e-01,9.999783e-01,9.999780e-01,&
       & 9.999763e-01,9.999746e-01,9.999731e-01,9.999713e-01,9.999762e-01,&
       & 9.999740e-01,9.999670e-01,9.999703e-01,9.999687e-01,9.999666e-01,&
       & 9.999683e-01,9.999667e-01,9.999611e-01,9.999635e-01,9.999600e-01,&
       & 9.999635e-01,9.999594e-01,9.999601e-01,9.999586e-01,9.999559e-01,&
       & 9.999569e-01,9.999558e-01,9.999523e-01,9.999535e-01,9.999529e-01,&
       & 9.999553e-01,9.999495e-01,9.999490e-01 /)

      ssaliq1(:, 28) = (/ &
       & 9.999920e-01,9.999873e-01,9.999855e-01,9.999832e-01,9.999807e-01,&
       & 9.999778e-01,9.999754e-01,9.999721e-01,9.999692e-01,9.999651e-01,&
       & 9.999621e-01,9.999607e-01,9.999567e-01,9.999546e-01,9.999521e-01,&
       & 9.999491e-01,9.999457e-01,9.999439e-01,9.999403e-01,9.999374e-01,&
       & 9.999353e-01,9.999315e-01,9.999282e-01,9.999244e-01,9.999234e-01,&
       & 9.999189e-01,9.999130e-01,9.999117e-01,9.999073e-01,9.999020e-01,&
       & 9.998993e-01,9.998987e-01,9.998922e-01,9.998893e-01,9.998869e-01,&
       & 9.998805e-01,9.998778e-01,9.998751e-01,9.998708e-01,9.998676e-01,&
       & 9.998624e-01,9.998642e-01,9.998582e-01,9.998547e-01,9.998546e-01,&
       & 9.998477e-01,9.998487e-01,9.998466e-01,9.998403e-01,9.998412e-01,&
       & 9.998406e-01,9.998342e-01,9.998326e-01,9.998333e-01,9.998328e-01,&
       & 9.998290e-01,9.998276e-01,9.998249e-01 /)

      ssaliq1(:, 29) = (/ &
       & 8.383753e-01,8.461471e-01,8.373325e-01,8.212889e-01,8.023834e-01,&
       & 7.829501e-01,7.641777e-01,7.466000e-01,7.304023e-01,7.155998e-01,&
       & 7.021259e-01,6.898840e-01,6.787615e-01,6.686479e-01,6.594414e-01,&
       & 6.510417e-01,6.433668e-01,6.363335e-01,6.298788e-01,6.239398e-01,&
       & 6.184633e-01,6.134055e-01,6.087228e-01,6.043786e-01,6.003439e-01,&
       & 5.965910e-01,5.930917e-01,5.898280e-01,5.867798e-01,5.839264e-01,&
       & 5.812576e-01,5.787592e-01,5.764163e-01,5.742189e-01,5.721598e-01,&
       & 5.702286e-01,5.684182e-01,5.667176e-01,5.651237e-01,5.636253e-01,&
       & 5.622228e-01,5.609074e-01,5.596713e-01,5.585089e-01,5.574223e-01,&
       & 5.564002e-01,5.554411e-01,5.545397e-01,5.536914e-01,5.528967e-01,&
       & 5.521495e-01,5.514457e-01,5.507818e-01,5.501623e-01,5.495750e-01,&
       & 5.490192e-01,5.484980e-01,5.480046e-01 /)



      asyliq1(:, 16) = (/ &
       & 8.038165e-01,8.014154e-01,7.942381e-01,7.970521e-01,8.086621e-01,&
       & 8.233392e-01,8.374127e-01,8.495742e-01,8.596945e-01,8.680497e-01,&
       & 8.750005e-01,8.808589e-01,8.858749e-01,8.902403e-01,8.940939e-01,&
       & 8.975379e-01,9.006450e-01,9.034741e-01,9.060659e-01,9.084561e-01,&
       & 9.106675e-01,9.127198e-01,9.146332e-01,9.164194e-01,9.180970e-01,&
       & 9.196658e-01,9.211421e-01,9.225352e-01,9.238443e-01,9.250841e-01,&
       & 9.262541e-01,9.273620e-01,9.284081e-01,9.294002e-01,9.303395e-01,&
       & 9.312285e-01,9.320715e-01,9.328716e-01,9.336271e-01,9.343427e-01,&
       & 9.350219e-01,9.356647e-01,9.362728e-01,9.368495e-01,9.373956e-01,&
       & 9.379113e-01,9.383987e-01,9.388608e-01,9.392986e-01,9.397132e-01,&
       & 9.401063e-01,9.404776e-01,9.408299e-01,9.411641e-01,9.414800e-01,&
       & 9.417787e-01,9.420633e-01,9.423364e-01 /)

      asyliq1(:, 17) = (/ &
       & 8.941000e-01,9.054049e-01,9.049510e-01,9.027216e-01,9.021636e-01,&
       & 9.037878e-01,9.069852e-01,9.109817e-01,9.152013e-01,9.193040e-01,&
       & 9.231177e-01,9.265712e-01,9.296606e-01,9.324048e-01,9.348419e-01,&
       & 9.370131e-01,9.389529e-01,9.406954e-01,9.422727e-01,9.437088e-01,&
       & 9.450221e-01,9.462308e-01,9.473488e-01,9.483830e-01,9.493492e-01,&
       & 9.502541e-01,9.510999e-01,9.518971e-01,9.526455e-01,9.533554e-01,&
       & 9.540249e-01,9.546571e-01,9.552551e-01,9.558258e-01,9.563603e-01,&
       & 9.568713e-01,9.573569e-01,9.578141e-01,9.582485e-01,9.586604e-01,&
       & 9.590525e-01,9.594218e-01,9.597710e-01,9.601052e-01,9.604181e-01,&
       & 9.607159e-01,9.609979e-01,9.612655e-01,9.615184e-01,9.617564e-01,&
       & 9.619860e-01,9.622009e-01,9.624031e-01,9.625957e-01,9.627792e-01,&
       & 9.629530e-01,9.631171e-01,9.632746e-01 /)

      asyliq1(:, 18) = (/ &
       & 8.574638e-01,8.351383e-01,8.142977e-01,8.083068e-01,8.129284e-01,&
       & 8.215827e-01,8.307238e-01,8.389963e-01,8.460481e-01,8.519273e-01,&
       & 8.568153e-01,8.609116e-01,8.643892e-01,8.673941e-01,8.700248e-01,&
       & 8.723707e-01,8.744902e-01,8.764240e-01,8.782057e-01,8.798593e-01,&
       & 8.814063e-01,8.828573e-01,8.842261e-01,8.855196e-01,8.867497e-01,&
       & 8.879164e-01,8.890316e-01,8.900941e-01,8.911118e-01,8.920832e-01,&
       & 8.930156e-01,8.939091e-01,8.947663e-01,8.955888e-01,8.963786e-01,&
       & 8.971350e-01,8.978617e-01,8.985590e-01,8.992243e-01,8.998631e-01,&
       & 9.004753e-01,9.010602e-01,9.016192e-01,9.021542e-01,9.026644e-01,&
       & 9.031535e-01,9.036194e-01,9.040656e-01,9.044894e-01,9.048933e-01,&
       & 9.052789e-01,9.056481e-01,9.060004e-01,9.063343e-01,9.066544e-01,&
       & 9.069604e-01,9.072512e-01,9.075290e-01 /)

      asyliq1(:, 19) = (/ &
       & 8.349569e-01,8.034579e-01,7.932136e-01,8.010156e-01,8.137083e-01,&
       & 8.255339e-01,8.351938e-01,8.428286e-01,8.488944e-01,8.538187e-01,&
       & 8.579255e-01,8.614473e-01,8.645338e-01,8.672908e-01,8.697947e-01,&
       & 8.720843e-01,8.742015e-01,8.761718e-01,8.780160e-01,8.797479e-01,&
       & 8.813810e-01,8.829250e-01,8.843907e-01,8.857822e-01,8.871059e-01,&
       & 8.883724e-01,8.895810e-01,8.907384e-01,8.918456e-01,8.929083e-01,&
       & 8.939284e-01,8.949060e-01,8.958463e-01,8.967486e-01,8.976129e-01,&
       & 8.984463e-01,8.992439e-01,9.000094e-01,9.007438e-01,9.014496e-01,&
       & 9.021235e-01,9.027699e-01,9.033859e-01,9.039772e-01,9.045419e-01,&
       & 9.050819e-01,9.055975e-01,9.060907e-01,9.065607e-01,9.070093e-01,&
       & 9.074389e-01,9.078475e-01,9.082388e-01,9.086117e-01,9.089678e-01,&
       & 9.093081e-01,9.096307e-01,9.099410e-01 /)

      asyliq1(:, 20) = (/ &
       & 8.109692e-01,7.846657e-01,7.881928e-01,8.009509e-01,8.131208e-01,&
       & 8.230400e-01,8.309448e-01,8.372920e-01,8.424837e-01,8.468166e-01,&
       & 8.504947e-01,8.536642e-01,8.564256e-01,8.588513e-01,8.610011e-01,&
       & 8.629122e-01,8.646262e-01,8.661720e-01,8.675752e-01,8.688582e-01,&
       & 8.700379e-01,8.711300e-01,8.721485e-01,8.731027e-01,8.740010e-01,&
       & 8.748499e-01,8.756564e-01,8.764239e-01,8.771542e-01,8.778523e-01,&
       & 8.785211e-01,8.791601e-01,8.797725e-01,8.803589e-01,8.809173e-01,&
       & 8.814552e-01,8.819705e-01,8.824611e-01,8.829311e-01,8.833791e-01,&
       & 8.838078e-01,8.842148e-01,8.846044e-01,8.849756e-01,8.853291e-01,&
       & 8.856645e-01,8.859841e-01,8.862904e-01,8.865801e-01,8.868551e-01,&
       & 8.871182e-01,8.873673e-01,8.876059e-01,8.878307e-01,8.880462e-01,&
       & 8.882501e-01,8.884453e-01,8.886339e-01 /)

      asyliq1(:, 21) = (/ &
       & 7.838510e-01,7.803151e-01,7.980477e-01,8.144160e-01,8.261784e-01,&
       & 8.344240e-01,8.404278e-01,8.450391e-01,8.487593e-01,8.518741e-01,&
       & 8.545484e-01,8.568890e-01,8.589560e-01,8.607983e-01,8.624504e-01,&
       & 8.639408e-01,8.652945e-01,8.665301e-01,8.676634e-01,8.687121e-01,&
       & 8.696855e-01,8.705933e-01,8.714448e-01,8.722454e-01,8.730014e-01,&
       & 8.737180e-01,8.743982e-01,8.750436e-01,8.756598e-01,8.762481e-01,&
       & 8.768089e-01,8.773427e-01,8.778532e-01,8.783434e-01,8.788089e-01,&
       & 8.792530e-01,8.796784e-01,8.800845e-01,8.804716e-01,8.808411e-01,&
       & 8.811923e-01,8.815276e-01,8.818472e-01,8.821504e-01,8.824408e-01,&
       & 8.827155e-01,8.829777e-01,8.832269e-01,8.834631e-01,8.836892e-01,&
       & 8.839034e-01,8.841075e-01,8.843021e-01,8.844866e-01,8.846631e-01,&
       & 8.848304e-01,8.849910e-01,8.851425e-01 /)

      asyliq1(:, 22) = (/ &
       & 7.760783e-01,7.890215e-01,8.090192e-01,8.230252e-01,8.321369e-01,&
       & 8.384258e-01,8.431529e-01,8.469558e-01,8.501499e-01,8.528899e-01,&
       & 8.552899e-01,8.573956e-01,8.592570e-01,8.609098e-01,8.623897e-01,&
       & 8.637169e-01,8.649184e-01,8.660097e-01,8.670096e-01,8.679338e-01,&
       & 8.687896e-01,8.695880e-01,8.703365e-01,8.710422e-01,8.717092e-01,&
       & 8.723378e-01,8.729363e-01,8.735063e-01,8.740475e-01,8.745661e-01,&
       & 8.750560e-01,8.755275e-01,8.759731e-01,8.764000e-01,8.768071e-01,&
       & 8.771942e-01,8.775628e-01,8.779126e-01,8.782483e-01,8.785626e-01,&
       & 8.788610e-01,8.791482e-01,8.794180e-01,8.796765e-01,8.799207e-01,&
       & 8.801522e-01,8.803707e-01,8.805777e-01,8.807749e-01,8.809605e-01,&
       & 8.811362e-01,8.813047e-01,8.814647e-01,8.816131e-01,8.817588e-01,&
       & 8.818930e-01,8.820230e-01,8.821445e-01 /)

      asyliq1(:, 23) = (/ &
       & 7.847907e-01,8.099917e-01,8.257428e-01,8.350423e-01,8.411971e-01,&
       & 8.457241e-01,8.493010e-01,8.522565e-01,8.547660e-01,8.569311e-01,&
       & 8.588181e-01,8.604729e-01,8.619296e-01,8.632208e-01,8.643725e-01,&
       & 8.654050e-01,8.663363e-01,8.671835e-01,8.679590e-01,8.686707e-01,&
       & 8.693308e-01,8.699433e-01,8.705147e-01,8.710490e-01,8.715497e-01,&
       & 8.720219e-01,8.724669e-01,8.728849e-01,8.732806e-01,8.736550e-01,&
       & 8.740099e-01,8.743435e-01,8.746601e-01,8.749610e-01,8.752449e-01,&
       & 8.755143e-01,8.757688e-01,8.760095e-01,8.762375e-01,8.764532e-01,&
       & 8.766579e-01,8.768506e-01,8.770323e-01,8.772049e-01,8.773690e-01,&
       & 8.775226e-01,8.776679e-01,8.778062e-01,8.779360e-01,8.780587e-01,&
       & 8.781747e-01,8.782852e-01,8.783892e-01,8.784891e-01,8.785824e-01,&
       & 8.786705e-01,8.787546e-01,8.788336e-01 /)

      asyliq1(:, 24) = (/ &
       & 8.054324e-01,8.266282e-01,8.378075e-01,8.449848e-01,8.502166e-01,&
       & 8.542268e-01,8.573477e-01,8.598022e-01,8.617689e-01,8.633859e-01,&
       & 8.647536e-01,8.659354e-01,8.669807e-01,8.679143e-01,8.687577e-01,&
       & 8.695222e-01,8.702207e-01,8.708591e-01,8.714446e-01,8.719836e-01,&
       & 8.724812e-01,8.729426e-01,8.733689e-01,8.737665e-01,8.741373e-01,&
       & 8.744834e-01,8.748070e-01,8.751131e-01,8.754011e-01,8.756676e-01,&
       & 8.759219e-01,8.761599e-01,8.763857e-01,8.765984e-01,8.767999e-01,&
       & 8.769889e-01,8.771669e-01,8.773373e-01,8.774969e-01,8.776469e-01,&
       & 8.777894e-01,8.779237e-01,8.780505e-01,8.781703e-01,8.782820e-01,&
       & 8.783886e-01,8.784894e-01,8.785844e-01,8.786736e-01,8.787584e-01,&
       & 8.788379e-01,8.789130e-01,8.789849e-01,8.790506e-01,8.791141e-01,&
       & 8.791750e-01,8.792324e-01,8.792867e-01 /)

      asyliq1(:, 25) = (/ &
       & 8.249534e-01,8.391988e-01,8.474107e-01,8.526860e-01,8.563983e-01,&
       & 8.592389e-01,8.615144e-01,8.633790e-01,8.649325e-01,8.662504e-01,&
       & 8.673841e-01,8.683741e-01,8.692495e-01,8.700309e-01,8.707328e-01,&
       & 8.713650e-01,8.719432e-01,8.724676e-01,8.729498e-01,8.733922e-01,&
       & 8.737981e-01,8.741745e-01,8.745225e-01,8.748467e-01,8.751512e-01,&
       & 8.754315e-01,8.756962e-01,8.759450e-01,8.761774e-01,8.763945e-01,&
       & 8.766021e-01,8.767970e-01,8.769803e-01,8.771511e-01,8.773151e-01,&
       & 8.774689e-01,8.776147e-01,8.777533e-01,8.778831e-01,8.780050e-01,&
       & 8.781197e-01,8.782301e-01,8.783323e-01,8.784312e-01,8.785222e-01,&
       & 8.786096e-01,8.786916e-01,8.787688e-01,8.788411e-01,8.789122e-01,&
       & 8.789762e-01,8.790373e-01,8.790954e-01,8.791514e-01,8.792018e-01,&
       & 8.792517e-01,8.792990e-01,8.793429e-01 /)

      asyliq1(:, 26) = (/ &
       & 8.323091e-01,8.429776e-01,8.498123e-01,8.546929e-01,8.584295e-01,&
       & 8.613489e-01,8.636324e-01,8.654303e-01,8.668675e-01,8.680404e-01,&
       & 8.690174e-01,8.698495e-01,8.705666e-01,8.711961e-01,8.717556e-01,&
       & 8.722546e-01,8.727063e-01,8.731170e-01,8.734933e-01,8.738382e-01,&
       & 8.741590e-01,8.744525e-01,8.747295e-01,8.749843e-01,8.752210e-01,&
       & 8.754437e-01,8.756524e-01,8.758472e-01,8.760288e-01,8.762030e-01,&
       & 8.763603e-01,8.765122e-01,8.766539e-01,8.767894e-01,8.769130e-01,&
       & 8.770310e-01,8.771422e-01,8.772437e-01,8.773419e-01,8.774355e-01,&
       & 8.775221e-01,8.776047e-01,8.776802e-01,8.777539e-01,8.778216e-01,&
       & 8.778859e-01,8.779473e-01,8.780031e-01,8.780562e-01,8.781097e-01,&
       & 8.781570e-01,8.782021e-01,8.782463e-01,8.782845e-01,8.783235e-01,&
       & 8.783610e-01,8.783953e-01,8.784273e-01 /)

      asyliq1(:, 27) = (/ &
       & 8.396448e-01,8.480172e-01,8.535934e-01,8.574145e-01,8.600835e-01,&
       & 8.620347e-01,8.635500e-01,8.648003e-01,8.658758e-01,8.668248e-01,&
       & 8.676697e-01,8.684220e-01,8.690893e-01,8.696807e-01,8.702046e-01,&
       & 8.706676e-01,8.710798e-01,8.714478e-01,8.717778e-01,8.720747e-01,&
       & 8.723431e-01,8.725889e-01,8.728144e-01,8.730201e-01,8.732129e-01,&
       & 8.733907e-01,8.735541e-01,8.737100e-01,8.738533e-01,8.739882e-01,&
       & 8.741164e-01,8.742362e-01,8.743485e-01,8.744530e-01,8.745512e-01,&
       & 8.746471e-01,8.747373e-01,8.748186e-01,8.748973e-01,8.749732e-01,&
       & 8.750443e-01,8.751105e-01,8.751747e-01,8.752344e-01,8.752902e-01,&
       & 8.753412e-01,8.753917e-01,8.754393e-01,8.754843e-01,8.755282e-01,&
       & 8.755662e-01,8.756039e-01,8.756408e-01,8.756722e-01,8.757072e-01,&
       & 8.757352e-01,8.757653e-01,8.757932e-01 /)

      asyliq1(:, 28) = (/ &
       & 8.374590e-01,8.465669e-01,8.518701e-01,8.547627e-01,8.565745e-01,&
       & 8.579065e-01,8.589717e-01,8.598632e-01,8.606363e-01,8.613268e-01,&
       & 8.619560e-01,8.625340e-01,8.630689e-01,8.635601e-01,8.640084e-01,&
       & 8.644180e-01,8.647885e-01,8.651220e-01,8.654218e-01,8.656908e-01,&
       & 8.659294e-01,8.661422e-01,8.663334e-01,8.665037e-01,8.666543e-01,&
       & 8.667913e-01,8.669156e-01,8.670242e-01,8.671249e-01,8.672161e-01,&
       & 8.672993e-01,8.673733e-01,8.674457e-01,8.675103e-01,8.675713e-01,&
       & 8.676267e-01,8.676798e-01,8.677286e-01,8.677745e-01,8.678178e-01,&
       & 8.678601e-01,8.678986e-01,8.679351e-01,8.679693e-01,8.680013e-01,&
       & 8.680334e-01,8.680624e-01,8.680915e-01,8.681178e-01,8.681428e-01,&
       & 8.681654e-01,8.681899e-01,8.682103e-01,8.682317e-01,8.682498e-01,&
       & 8.682677e-01,8.682861e-01,8.683041e-01 /)

      asyliq1(:, 29) = (/ &
       & 7.877069e-01,8.244281e-01,8.367971e-01,8.409074e-01,8.429859e-01,&
       & 8.454386e-01,8.489350e-01,8.534141e-01,8.585814e-01,8.641267e-01,&
       & 8.697999e-01,8.754223e-01,8.808785e-01,8.860944e-01,8.910354e-01,&
       & 8.956837e-01,9.000392e-01,9.041091e-01,9.079071e-01,9.114479e-01,&
       & 9.147462e-01,9.178234e-01,9.206903e-01,9.233663e-01,9.258668e-01,&
       & 9.282006e-01,9.303847e-01,9.324288e-01,9.343418e-01,9.361356e-01,&
       & 9.378176e-01,9.393939e-01,9.408736e-01,9.422622e-01,9.435670e-01,&
       & 9.447900e-01,9.459395e-01,9.470199e-01,9.480335e-01,9.489852e-01,&
       & 9.498782e-01,9.507168e-01,9.515044e-01,9.522470e-01,9.529409e-01,&
       & 9.535946e-01,9.542071e-01,9.547838e-01,9.553256e-01,9.558351e-01,&
       & 9.563139e-01,9.567660e-01,9.571915e-01,9.575901e-01,9.579685e-01,&
       & 9.583239e-01,9.586602e-01,9.589766e-01 /)




      extice2(:, 16) = (/ &

        & 4.101824e-01 ,2.435514e-01 ,1.713697e-01 ,1.314865e-01 ,1.063406e-01 ,&
        & 8.910701e-02 ,7.659480e-02 ,6.711784e-02 ,5.970353e-02 ,5.375249e-02 ,&
        & 4.887577e-02 ,4.481025e-02 ,4.137171e-02 ,3.842744e-02 ,3.587948e-02 ,&
        & 3.365396e-02 ,3.169419e-02 ,2.995593e-02 ,2.840419e-02 ,2.701091e-02 ,&
        & 2.575336e-02 ,2.461293e-02 ,2.357423e-02 ,2.262443e-02 ,2.175276e-02 ,&
        & 2.095012e-02 ,2.020875e-02 ,1.952199e-02 ,1.888412e-02 ,1.829018e-02 ,&
        & 1.773586e-02 ,1.721738e-02 ,1.673144e-02 ,1.627510e-02 ,1.584579e-02 ,&
        & 1.544122e-02 ,1.505934e-02 ,1.469833e-02 ,1.435654e-02 ,1.403251e-02 ,&
        & 1.372492e-02 ,1.343255e-02 ,1.315433e-02  /)
      extice2(:, 17) = (/ &

        & 3.836650e-01 ,2.304055e-01 ,1.637265e-01 ,1.266681e-01 ,1.031602e-01 ,&
        & 8.695191e-02 ,7.511544e-02 ,6.610009e-02 ,5.900909e-02 ,5.328833e-02 ,&
        & 4.857728e-02 ,4.463133e-02 ,4.127880e-02 ,3.839567e-02 ,3.589013e-02 ,&
        & 3.369280e-02 ,3.175027e-02 ,3.002079e-02 ,2.847121e-02 ,2.707493e-02 ,&
        & 2.581031e-02 ,2.465962e-02 ,2.360815e-02 ,2.264363e-02 ,2.175571e-02 ,&
        & 2.093563e-02 ,2.017592e-02 ,1.947015e-02 ,1.881278e-02 ,1.819901e-02 ,&
        & 1.762463e-02 ,1.708598e-02 ,1.657982e-02 ,1.610330e-02 ,1.565390e-02 ,&
        & 1.522937e-02 ,1.482768e-02 ,1.444706e-02 ,1.408588e-02 ,1.374270e-02 ,&
        & 1.341619e-02 ,1.310517e-02 ,1.280857e-02  /)
      extice2(:, 18) = (/ &

        & 4.152673e-01 ,2.436816e-01 ,1.702243e-01 ,1.299704e-01 ,1.047528e-01 ,&
        & 8.756039e-02 ,7.513327e-02 ,6.575690e-02 ,5.844616e-02 ,5.259609e-02 ,&
        & 4.781531e-02 ,4.383980e-02 ,4.048517e-02 ,3.761891e-02 ,3.514342e-02 ,&
        & 3.298525e-02 ,3.108814e-02 ,2.940825e-02 ,2.791096e-02 ,2.656858e-02 ,&
        & 2.535869e-02 ,2.426297e-02 ,2.326627e-02 ,2.235602e-02 ,2.152164e-02 ,&
        & 2.075420e-02 ,2.004613e-02 ,1.939091e-02 ,1.878296e-02 ,1.821744e-02 ,&
        & 1.769015e-02 ,1.719741e-02 ,1.673600e-02 ,1.630308e-02 ,1.589615e-02 ,&
        & 1.551298e-02 ,1.515159e-02 ,1.481021e-02 ,1.448726e-02 ,1.418131e-02 ,&
        & 1.389109e-02 ,1.361544e-02 ,1.335330e-02  /)
      extice2(:, 19) = (/ &

        & 3.873250e-01 ,2.331609e-01 ,1.655002e-01 ,1.277753e-01 ,1.038247e-01 ,&
        & 8.731780e-02 ,7.527638e-02 ,6.611873e-02 ,5.892850e-02 ,5.313885e-02 ,&
        & 4.838068e-02 ,4.440356e-02 ,4.103167e-02 ,3.813804e-02 ,3.562870e-02 ,&
        & 3.343269e-02 ,3.149539e-02 ,2.977414e-02 ,2.823510e-02 ,2.685112e-02 ,&
        & 2.560015e-02 ,2.446411e-02 ,2.342805e-02 ,2.247948e-02 ,2.160789e-02 ,&
        & 2.080438e-02 ,2.006139e-02 ,1.937238e-02 ,1.873177e-02 ,1.813469e-02 ,&
        & 1.757689e-02 ,1.705468e-02 ,1.656479e-02 ,1.610435e-02 ,1.567081e-02 ,&
        & 1.526192e-02 ,1.487565e-02 ,1.451020e-02 ,1.416396e-02 ,1.383546e-02 ,&
        & 1.352339e-02 ,1.322657e-02 ,1.294392e-02  /)
      extice2(:, 20) = (/ &

        & 3.784280e-01 ,2.291396e-01 ,1.632551e-01 ,1.263775e-01 ,1.028944e-01 ,&
        & 8.666975e-02 ,7.480952e-02 ,6.577335e-02 ,5.866714e-02 ,5.293694e-02 ,&
        & 4.822153e-02 ,4.427547e-02 ,4.092626e-02 ,3.804918e-02 ,3.555184e-02 ,&
        & 3.336440e-02 ,3.143307e-02 ,2.971577e-02 ,2.817912e-02 ,2.679632e-02 ,&
        & 2.554558e-02 ,2.440903e-02 ,2.337187e-02 ,2.242173e-02 ,2.154821e-02 ,&
        & 2.074249e-02 ,1.999706e-02 ,1.930546e-02 ,1.866212e-02 ,1.806221e-02 ,&
        & 1.750152e-02 ,1.697637e-02 ,1.648352e-02 ,1.602010e-02 ,1.558358e-02 ,&
        & 1.517172e-02 ,1.478250e-02 ,1.441413e-02 ,1.406498e-02 ,1.373362e-02 ,&
        & 1.341872e-02 ,1.311911e-02 ,1.283371e-02  /)
      extice2(:, 21) = (/ &

        & 3.719909e-01 ,2.259490e-01 ,1.613144e-01 ,1.250648e-01 ,1.019462e-01 ,&
        & 8.595358e-02 ,7.425064e-02 ,6.532618e-02 ,5.830218e-02 ,5.263421e-02 ,&
        & 4.796697e-02 ,4.405891e-02 ,4.074013e-02 ,3.788776e-02 ,3.541071e-02 ,&
        & 3.324008e-02 ,3.132280e-02 ,2.961733e-02 ,2.809071e-02 ,2.671645e-02 ,&
        & 2.547302e-02 ,2.434276e-02 ,2.331102e-02 ,2.236558e-02 ,2.149614e-02 ,&
        & 2.069397e-02 ,1.995163e-02 ,1.926272e-02 ,1.862174e-02 ,1.802389e-02 ,&
        & 1.746500e-02 ,1.694142e-02 ,1.644994e-02 ,1.598772e-02 ,1.555225e-02 ,&
        & 1.514129e-02 ,1.475286e-02 ,1.438515e-02 ,1.403659e-02 ,1.370572e-02 ,&
        & 1.339124e-02 ,1.309197e-02 ,1.280685e-02  /)
      extice2(:, 22) = (/ &

        & 3.713158e-01 ,2.253816e-01 ,1.608461e-01 ,1.246718e-01 ,1.016109e-01 ,&
        & 8.566332e-02 ,7.399666e-02 ,6.510199e-02 ,5.810290e-02 ,5.245608e-02 ,&
        & 4.780702e-02 ,4.391478e-02 ,4.060989e-02 ,3.776982e-02 ,3.530374e-02 ,&
        & 3.314296e-02 ,3.123458e-02 ,2.953719e-02 ,2.801794e-02 ,2.665043e-02 ,&
        & 2.541321e-02 ,2.428868e-02 ,2.326224e-02 ,2.232173e-02 ,2.145688e-02 ,&
        & 2.065899e-02 ,1.992067e-02 ,1.923552e-02 ,1.859808e-02 ,1.800356e-02 ,&
        & 1.744782e-02 ,1.692721e-02 ,1.643855e-02 ,1.597900e-02 ,1.554606e-02 ,&
        & 1.513751e-02 ,1.475137e-02 ,1.438586e-02 ,1.403938e-02 ,1.371050e-02 ,&
        & 1.339793e-02 ,1.310050e-02 ,1.281713e-02  /)
      extice2(:, 23) = (/ &

        & 3.605883e-01 ,2.204388e-01 ,1.580431e-01 ,1.229033e-01 ,1.004203e-01 ,&
        & 8.482616e-02 ,7.338941e-02 ,6.465105e-02 ,5.776176e-02 ,5.219398e-02 ,&
        & 4.760288e-02 ,4.375369e-02 ,4.048111e-02 ,3.766539e-02 ,3.521771e-02 ,&
        & 3.307079e-02 ,3.117277e-02 ,2.948303e-02 ,2.796929e-02 ,2.660560e-02 ,&
        & 2.537086e-02 ,2.424772e-02 ,2.322182e-02 ,2.228114e-02 ,2.141556e-02 ,&
        & 2.061649e-02 ,1.987661e-02 ,1.918962e-02 ,1.855009e-02 ,1.795330e-02 ,&
        & 1.739514e-02 ,1.687199e-02 ,1.638069e-02 ,1.591845e-02 ,1.548276e-02 ,&
        & 1.507143e-02 ,1.468249e-02 ,1.431416e-02 ,1.396486e-02 ,1.363318e-02 ,&
        & 1.331781e-02 ,1.301759e-02 ,1.273147e-02  /)
      extice2(:, 24) = (/ &

        & 3.527890e-01 ,2.168469e-01 ,1.560090e-01 ,1.216216e-01 ,9.955787e-02 ,&
        & 8.421942e-02 ,7.294827e-02 ,6.432192e-02 ,5.751081e-02 ,5.199888e-02 ,&
        & 4.744835e-02 ,4.362899e-02 ,4.037847e-02 ,3.757910e-02 ,3.514351e-02 ,&
        & 3.300546e-02 ,3.111382e-02 ,2.942853e-02 ,2.791775e-02 ,2.655584e-02 ,&
        & 2.532195e-02 ,2.419892e-02 ,2.317255e-02 ,2.223092e-02 ,2.136402e-02 ,&
        & 2.056334e-02 ,1.982160e-02 ,1.913258e-02 ,1.849087e-02 ,1.789178e-02 ,&
        & 1.733124e-02 ,1.680565e-02 ,1.631187e-02 ,1.584711e-02 ,1.540889e-02 ,&
        & 1.499502e-02 ,1.460354e-02 ,1.423269e-02 ,1.388088e-02 ,1.354670e-02 ,&
        & 1.322887e-02 ,1.292620e-02 ,1.263767e-02  /)
      extice2(:, 25) = (/ &

        & 3.477874e-01 ,2.143515e-01 ,1.544887e-01 ,1.205942e-01 ,9.881779e-02 ,&
        & 8.366261e-02 ,7.251586e-02 ,6.397790e-02 ,5.723183e-02 ,5.176908e-02 ,&
        & 4.725658e-02 ,4.346715e-02 ,4.024055e-02 ,3.746055e-02 ,3.504080e-02 ,&
        & 3.291583e-02 ,3.103507e-02 ,2.935891e-02 ,2.785582e-02 ,2.650042e-02 ,&
        & 2.527206e-02 ,2.415376e-02 ,2.313142e-02 ,2.219326e-02 ,2.132934e-02 ,&
        & 2.053122e-02 ,1.979169e-02 ,1.910456e-02 ,1.846448e-02 ,1.786680e-02 ,&
        & 1.730745e-02 ,1.678289e-02 ,1.628998e-02 ,1.582595e-02 ,1.538835e-02 ,&
        & 1.497499e-02 ,1.458393e-02 ,1.421341e-02 ,1.386187e-02 ,1.352788e-02 ,&
        & 1.321019e-02 ,1.290762e-02 ,1.261913e-02  /)
      extice2(:, 26) = (/ &

        & 3.453721e-01 ,2.130744e-01 ,1.536698e-01 ,1.200140e-01 ,9.838078e-02 ,&
        & 8.331940e-02 ,7.223803e-02 ,6.374775e-02 ,5.703770e-02 ,5.160290e-02 ,&
        & 4.711259e-02 ,4.334110e-02 ,4.012923e-02 ,3.736150e-02 ,3.495208e-02 ,&
        & 3.283589e-02 ,3.096267e-02 ,2.929302e-02 ,2.779560e-02 ,2.644517e-02 ,&
        & 2.522119e-02 ,2.410677e-02 ,2.308788e-02 ,2.215281e-02 ,2.129165e-02 ,&
        & 2.049602e-02 ,1.975874e-02 ,1.907365e-02 ,1.843542e-02 ,1.783943e-02 ,&
        & 1.728162e-02 ,1.675847e-02 ,1.626685e-02 ,1.580401e-02 ,1.536750e-02 ,&
        & 1.495515e-02 ,1.456502e-02 ,1.419537e-02 ,1.384463e-02 ,1.351139e-02 ,&
        & 1.319438e-02 ,1.289246e-02 ,1.260456e-02  /)
      extice2(:, 27) = (/ &

        & 3.417883e-01 ,2.113379e-01 ,1.526395e-01 ,1.193347e-01 ,9.790253e-02 ,&
        & 8.296715e-02 ,7.196979e-02 ,6.353806e-02 ,5.687024e-02 ,5.146670e-02 ,&
        & 4.700001e-02 ,4.324667e-02 ,4.004894e-02 ,3.729233e-02 ,3.489172e-02 ,&
        & 3.278257e-02 ,3.091499e-02 ,2.924987e-02 ,2.775609e-02 ,2.640859e-02 ,&
        & 2.518695e-02 ,2.407439e-02 ,2.305697e-02 ,2.212303e-02 ,2.126273e-02 ,&
        & 2.046774e-02 ,1.973090e-02 ,1.904610e-02 ,1.840801e-02 ,1.781204e-02 ,&
        & 1.725417e-02 ,1.673086e-02 ,1.623902e-02 ,1.577590e-02 ,1.533906e-02 ,&
        & 1.492634e-02 ,1.453580e-02 ,1.416571e-02 ,1.381450e-02 ,1.348078e-02 ,&
        & 1.316327e-02 ,1.286082e-02 ,1.257240e-02  /)
      extice2(:, 28) = (/ &

        & 3.416111e-01 ,2.114124e-01 ,1.527734e-01 ,1.194809e-01 ,9.804612e-02 ,&
        & 8.310287e-02 ,7.209595e-02 ,6.365442e-02 ,5.697710e-02 ,5.156460e-02 ,&
        & 4.708957e-02 ,4.332850e-02 ,4.012361e-02 ,3.736037e-02 ,3.495364e-02 ,&
        & 3.283879e-02 ,3.096593e-02 ,2.929589e-02 ,2.779751e-02 ,2.644571e-02 ,&
        & 2.522004e-02 ,2.410369e-02 ,2.308271e-02 ,2.214542e-02 ,2.128195e-02 ,&
        & 2.048396e-02 ,1.974429e-02 ,1.905679e-02 ,1.841614e-02 ,1.781774e-02 ,&
        & 1.725754e-02 ,1.673203e-02 ,1.623807e-02 ,1.577293e-02 ,1.533416e-02 ,&
        & 1.491958e-02 ,1.452727e-02 ,1.415547e-02 ,1.380262e-02 ,1.346732e-02 ,&
        & 1.314830e-02 ,1.284439e-02 ,1.255456e-02  /)
      extice2(:, 29) = (/ &

        & 4.196611e-01 ,2.493642e-01 ,1.761261e-01 ,1.357197e-01 ,1.102161e-01 ,&
        & 9.269376e-02 ,7.992985e-02 ,7.022538e-02 ,6.260168e-02 ,5.645603e-02 ,&
        & 5.139732e-02 ,4.716088e-02 ,4.356133e-02 ,4.046498e-02 ,3.777303e-02 ,&
        & 3.541094e-02 ,3.332137e-02 ,3.145954e-02 ,2.978998e-02 ,2.828419e-02 ,&
        & 2.691905e-02 ,2.567559e-02 ,2.453811e-02 ,2.349350e-02 ,2.253072e-02 ,&
        & 2.164042e-02 ,2.081464e-02 ,2.004652e-02 ,1.933015e-02 ,1.866041e-02 ,&
        & 1.803283e-02 ,1.744348e-02 ,1.688894e-02 ,1.636616e-02 ,1.587244e-02 ,&
        & 1.540539e-02 ,1.496287e-02 ,1.454295e-02 ,1.414392e-02 ,1.376423e-02 ,&
        & 1.340247e-02 ,1.305739e-02 ,1.272784e-02  /)


      ssaice2(:, 16) = (/ &

        & 6.630615e-01 ,6.451169e-01 ,6.333696e-01 ,6.246927e-01 ,6.178420e-01 ,&
        & 6.121976e-01 ,6.074069e-01 ,6.032505e-01 ,5.995830e-01 ,5.963030e-01 ,&
        & 5.933372e-01 ,5.906311e-01 ,5.881427e-01 ,5.858395e-01 ,5.836955e-01 ,&
        & 5.816896e-01 ,5.798046e-01 ,5.780264e-01 ,5.763429e-01 ,5.747441e-01 ,&
        & 5.732213e-01 ,5.717672e-01 ,5.703754e-01 ,5.690403e-01 ,5.677571e-01 ,&
        & 5.665215e-01 ,5.653297e-01 ,5.641782e-01 ,5.630643e-01 ,5.619850e-01 ,&
        & 5.609381e-01 ,5.599214e-01 ,5.589328e-01 ,5.579707e-01 ,5.570333e-01 ,&
        & 5.561193e-01 ,5.552272e-01 ,5.543558e-01 ,5.535041e-01 ,5.526708e-01 ,&
        & 5.518551e-01 ,5.510561e-01 ,5.502729e-01  /)
      ssaice2(:, 17) = (/ &

        & 7.689749e-01 ,7.398171e-01 ,7.205819e-01 ,7.065690e-01 ,6.956928e-01 ,&
        & 6.868989e-01 ,6.795813e-01 ,6.733606e-01 ,6.679838e-01 ,6.632742e-01 ,&
        & 6.591036e-01 ,6.553766e-01 ,6.520197e-01 ,6.489757e-01 ,6.461991e-01 ,&
        & 6.436531e-01 ,6.413075e-01 ,6.391375e-01 ,6.371221e-01 ,6.352438e-01 ,&
        & 6.334876e-01 ,6.318406e-01 ,6.302918e-01 ,6.288315e-01 ,6.274512e-01 ,&
        & 6.261436e-01 ,6.249022e-01 ,6.237211e-01 ,6.225953e-01 ,6.215201e-01 ,&
        & 6.204914e-01 ,6.195055e-01 ,6.185592e-01 ,6.176492e-01 ,6.167730e-01 ,&
        & 6.159280e-01 ,6.151120e-01 ,6.143228e-01 ,6.135587e-01 ,6.128177e-01 ,&
        & 6.120984e-01 ,6.113993e-01 ,6.107189e-01  /)
      ssaice2(:, 18) = (/ &

        & 9.956167e-01 ,9.814770e-01 ,9.716104e-01 ,9.639746e-01 ,9.577179e-01 ,&
        & 9.524010e-01 ,9.477672e-01 ,9.436527e-01 ,9.399467e-01 ,9.365708e-01 ,&
        & 9.334672e-01 ,9.305921e-01 ,9.279118e-01 ,9.253993e-01 ,9.230330e-01 ,&
        & 9.207954e-01 ,9.186719e-01 ,9.166501e-01 ,9.147199e-01 ,9.128722e-01 ,&
        & 9.110997e-01 ,9.093956e-01 ,9.077544e-01 ,9.061708e-01 ,9.046406e-01 ,&
        & 9.031598e-01 ,9.017248e-01 ,9.003326e-01 ,8.989804e-01 ,8.976655e-01 ,&
        & 8.963857e-01 ,8.951389e-01 ,8.939233e-01 ,8.927370e-01 ,8.915785e-01 ,&
        & 8.904464e-01 ,8.893392e-01 ,8.882559e-01 ,8.871951e-01 ,8.861559e-01 ,&
        & 8.851373e-01 ,8.841383e-01 ,8.831581e-01  /)
      ssaice2(:, 19) = (/ &

        & 9.723177e-01 ,9.452119e-01 ,9.267592e-01 ,9.127393e-01 ,9.014238e-01 ,&
        & 8.919334e-01 ,8.837584e-01 ,8.765773e-01 ,8.701736e-01 ,8.643950e-01 ,&
        & 8.591299e-01 ,8.542942e-01 ,8.498230e-01 ,8.456651e-01 ,8.417794e-01 ,&
        & 8.381324e-01 ,8.346964e-01 ,8.314484e-01 ,8.283687e-01 ,8.254408e-01 ,&
        & 8.226505e-01 ,8.199854e-01 ,8.174348e-01 ,8.149891e-01 ,8.126403e-01 ,&
        & 8.103808e-01 ,8.082041e-01 ,8.061044e-01 ,8.040765e-01 ,8.021156e-01 ,&
        & 8.002174e-01 ,7.983781e-01 ,7.965941e-01 ,7.948622e-01 ,7.931795e-01 ,&
        & 7.915432e-01 ,7.899508e-01 ,7.884002e-01 ,7.868891e-01 ,7.854156e-01 ,&
        & 7.839779e-01 ,7.825742e-01 ,7.812031e-01  /)
      ssaice2(:, 20) = (/ &

        & 9.933294e-01 ,9.860917e-01 ,9.811564e-01 ,9.774008e-01 ,9.743652e-01 ,&
        & 9.718155e-01 ,9.696159e-01 ,9.676810e-01 ,9.659531e-01 ,9.643915e-01 ,&
        & 9.629667e-01 ,9.616561e-01 ,9.604426e-01 ,9.593125e-01 ,9.582548e-01 ,&
        & 9.572607e-01 ,9.563227e-01 ,9.554347e-01 ,9.545915e-01 ,9.537888e-01 ,&
        & 9.530226e-01 ,9.522898e-01 ,9.515874e-01 ,9.509130e-01 ,9.502643e-01 ,&
        & 9.496394e-01 ,9.490366e-01 ,9.484542e-01 ,9.478910e-01 ,9.473456e-01 ,&
        & 9.468169e-01 ,9.463039e-01 ,9.458056e-01 ,9.453212e-01 ,9.448499e-01 ,&
        & 9.443910e-01 ,9.439438e-01 ,9.435077e-01 ,9.430821e-01 ,9.426666e-01 ,&
        & 9.422607e-01 ,9.418638e-01 ,9.414756e-01  /)
      ssaice2(:, 21) = (/ &

        & 9.900787e-01 ,9.828880e-01 ,9.779258e-01 ,9.741173e-01 ,9.710184e-01 ,&
        & 9.684012e-01 ,9.661332e-01 ,9.641301e-01 ,9.623352e-01 ,9.607083e-01 ,&
        & 9.592198e-01 ,9.578474e-01 ,9.565739e-01 ,9.553856e-01 ,9.542715e-01 ,&
        & 9.532226e-01 ,9.522314e-01 ,9.512919e-01 ,9.503986e-01 ,9.495472e-01 ,&
        & 9.487337e-01 ,9.479549e-01 ,9.472077e-01 ,9.464897e-01 ,9.457985e-01 ,&
        & 9.451322e-01 ,9.444890e-01 ,9.438673e-01 ,9.432656e-01 ,9.426826e-01 ,&
        & 9.421173e-01 ,9.415684e-01 ,9.410351e-01 ,9.405164e-01 ,9.400115e-01 ,&
        & 9.395198e-01 ,9.390404e-01 ,9.385728e-01 ,9.381164e-01 ,9.376707e-01 ,&
        & 9.372350e-01 ,9.368091e-01 ,9.363923e-01  /)
      ssaice2(:, 22) = (/ &

        & 9.986793e-01 ,9.985239e-01 ,9.983911e-01 ,9.982715e-01 ,9.981606e-01 ,&
        & 9.980562e-01 ,9.979567e-01 ,9.978613e-01 ,9.977691e-01 ,9.976798e-01 ,&
        & 9.975929e-01 ,9.975081e-01 ,9.974251e-01 ,9.973438e-01 ,9.972640e-01 ,&
        & 9.971855e-01 ,9.971083e-01 ,9.970322e-01 ,9.969571e-01 ,9.968830e-01 ,&
        & 9.968099e-01 ,9.967375e-01 ,9.966660e-01 ,9.965951e-01 ,9.965250e-01 ,&
        & 9.964555e-01 ,9.963867e-01 ,9.963185e-01 ,9.962508e-01 ,9.961836e-01 ,&
        & 9.961170e-01 ,9.960508e-01 ,9.959851e-01 ,9.959198e-01 ,9.958550e-01 ,&
        & 9.957906e-01 ,9.957266e-01 ,9.956629e-01 ,9.955997e-01 ,9.955367e-01 ,&
        & 9.954742e-01 ,9.954119e-01 ,9.953500e-01  /)
      ssaice2(:, 23) = (/ &

        & 9.997944e-01 ,9.997791e-01 ,9.997664e-01 ,9.997547e-01 ,9.997436e-01 ,&
        & 9.997327e-01 ,9.997219e-01 ,9.997110e-01 ,9.996999e-01 ,9.996886e-01 ,&
        & 9.996771e-01 ,9.996653e-01 ,9.996533e-01 ,9.996409e-01 ,9.996282e-01 ,&
        & 9.996152e-01 ,9.996019e-01 ,9.995883e-01 ,9.995743e-01 ,9.995599e-01 ,&
        & 9.995453e-01 ,9.995302e-01 ,9.995149e-01 ,9.994992e-01 ,9.994831e-01 ,&
        & 9.994667e-01 ,9.994500e-01 ,9.994329e-01 ,9.994154e-01 ,9.993976e-01 ,&
        & 9.993795e-01 ,9.993610e-01 ,9.993422e-01 ,9.993230e-01 ,9.993035e-01 ,&
        & 9.992837e-01 ,9.992635e-01 ,9.992429e-01 ,9.992221e-01 ,9.992008e-01 ,&
        & 9.991793e-01 ,9.991574e-01 ,9.991352e-01  /)
      ssaice2(:, 24) = (/ &

        & 9.999949e-01 ,9.999947e-01 ,9.999943e-01 ,9.999939e-01 ,9.999934e-01 ,&
        & 9.999927e-01 ,9.999920e-01 ,9.999913e-01 ,9.999904e-01 ,9.999895e-01 ,&
        & 9.999885e-01 ,9.999874e-01 ,9.999863e-01 ,9.999851e-01 ,9.999838e-01 ,&
        & 9.999824e-01 ,9.999810e-01 ,9.999795e-01 ,9.999780e-01 ,9.999764e-01 ,&
        & 9.999747e-01 ,9.999729e-01 ,9.999711e-01 ,9.999692e-01 ,9.999673e-01 ,&
        & 9.999653e-01 ,9.999632e-01 ,9.999611e-01 ,9.999589e-01 ,9.999566e-01 ,&
        & 9.999543e-01 ,9.999519e-01 ,9.999495e-01 ,9.999470e-01 ,9.999444e-01 ,&
        & 9.999418e-01 ,9.999392e-01 ,9.999364e-01 ,9.999336e-01 ,9.999308e-01 ,&
        & 9.999279e-01 ,9.999249e-01 ,9.999219e-01  /)
      ssaice2(:, 25) = (/ &

        & 9.999997e-01 ,9.999997e-01 ,9.999997e-01 ,9.999996e-01 ,9.999996e-01 ,&
        & 9.999995e-01 ,9.999994e-01 ,9.999993e-01 ,9.999993e-01 ,9.999992e-01 ,&
        & 9.999991e-01 ,9.999989e-01 ,9.999988e-01 ,9.999987e-01 ,9.999986e-01 ,&
        & 9.999984e-01 ,9.999983e-01 ,9.999981e-01 ,9.999980e-01 ,9.999978e-01 ,&
        & 9.999976e-01 ,9.999974e-01 ,9.999972e-01 ,9.999971e-01 ,9.999969e-01 ,&
        & 9.999966e-01 ,9.999964e-01 ,9.999962e-01 ,9.999960e-01 ,9.999957e-01 ,&
        & 9.999955e-01 ,9.999953e-01 ,9.999950e-01 ,9.999947e-01 ,9.999945e-01 ,&
        & 9.999942e-01 ,9.999939e-01 ,9.999936e-01 ,9.999934e-01 ,9.999931e-01 ,&
        & 9.999928e-01 ,9.999925e-01 ,9.999921e-01  /)
      ssaice2(:, 26) = (/ &

        & 9.999997e-01 ,9.999996e-01 ,9.999996e-01 ,9.999995e-01 ,9.999994e-01 ,&
        & 9.999993e-01 ,9.999992e-01 ,9.999991e-01 ,9.999990e-01 ,9.999989e-01 ,&
        & 9.999987e-01 ,9.999986e-01 ,9.999984e-01 ,9.999982e-01 ,9.999980e-01 ,&
        & 9.999978e-01 ,9.999976e-01 ,9.999974e-01 ,9.999972e-01 ,9.999970e-01 ,&
        & 9.999967e-01 ,9.999965e-01 ,9.999962e-01 ,9.999959e-01 ,9.999956e-01 ,&
        & 9.999954e-01 ,9.999951e-01 ,9.999947e-01 ,9.999944e-01 ,9.999941e-01 ,&
        & 9.999938e-01 ,9.999934e-01 ,9.999931e-01 ,9.999927e-01 ,9.999923e-01 ,&
        & 9.999920e-01 ,9.999916e-01 ,9.999912e-01 ,9.999908e-01 ,9.999904e-01 ,&
        & 9.999899e-01 ,9.999895e-01 ,9.999891e-01  /)
      ssaice2(:, 27) = (/ &

        & 9.999987e-01 ,9.999987e-01 ,9.999985e-01 ,9.999984e-01 ,9.999982e-01 ,&
        & 9.999980e-01 ,9.999978e-01 ,9.999976e-01 ,9.999973e-01 ,9.999970e-01 ,&
        & 9.999967e-01 ,9.999964e-01 ,9.999960e-01 ,9.999956e-01 ,9.999952e-01 ,&
        & 9.999948e-01 ,9.999944e-01 ,9.999939e-01 ,9.999934e-01 ,9.999929e-01 ,&
        & 9.999924e-01 ,9.999918e-01 ,9.999913e-01 ,9.999907e-01 ,9.999901e-01 ,&
        & 9.999894e-01 ,9.999888e-01 ,9.999881e-01 ,9.999874e-01 ,9.999867e-01 ,&
        & 9.999860e-01 ,9.999853e-01 ,9.999845e-01 ,9.999837e-01 ,9.999829e-01 ,&
        & 9.999821e-01 ,9.999813e-01 ,9.999804e-01 ,9.999796e-01 ,9.999787e-01 ,&
        & 9.999778e-01 ,9.999768e-01 ,9.999759e-01  /)
      ssaice2(:, 28) = (/ &

        & 9.999989e-01 ,9.999989e-01 ,9.999987e-01 ,9.999986e-01 ,9.999984e-01 ,&
        & 9.999982e-01 ,9.999980e-01 ,9.999978e-01 ,9.999975e-01 ,9.999972e-01 ,&
        & 9.999969e-01 ,9.999966e-01 ,9.999962e-01 ,9.999958e-01 ,9.999954e-01 ,&
        & 9.999950e-01 ,9.999945e-01 ,9.999941e-01 ,9.999936e-01 ,9.999931e-01 ,&
        & 9.999925e-01 ,9.999920e-01 ,9.999914e-01 ,9.999908e-01 ,9.999902e-01 ,&
        & 9.999896e-01 ,9.999889e-01 ,9.999883e-01 ,9.999876e-01 ,9.999869e-01 ,&
        & 9.999861e-01 ,9.999854e-01 ,9.999846e-01 ,9.999838e-01 ,9.999830e-01 ,&
        & 9.999822e-01 ,9.999814e-01 ,9.999805e-01 ,9.999796e-01 ,9.999787e-01 ,&
        & 9.999778e-01 ,9.999769e-01 ,9.999759e-01  /)
      ssaice2(:, 29) = (/ &

        & 7.042143e-01 ,6.691161e-01 ,6.463240e-01 ,6.296590e-01 ,6.166381e-01 ,&
        & 6.060183e-01 ,5.970908e-01 ,5.894144e-01 ,5.826968e-01 ,5.767343e-01 ,&
        & 5.713804e-01 ,5.665256e-01 ,5.620867e-01 ,5.579987e-01 ,5.542101e-01 ,&
        & 5.506794e-01 ,5.473727e-01 ,5.442620e-01 ,5.413239e-01 ,5.385389e-01 ,&
        & 5.358901e-01 ,5.333633e-01 ,5.309460e-01 ,5.286277e-01 ,5.263988e-01 ,&
        & 5.242512e-01 ,5.221777e-01 ,5.201719e-01 ,5.182280e-01 ,5.163410e-01 ,&
        & 5.145062e-01 ,5.127197e-01 ,5.109776e-01 ,5.092766e-01 ,5.076137e-01 ,&
        & 5.059860e-01 ,5.043911e-01 ,5.028266e-01 ,5.012904e-01 ,4.997805e-01 ,&
        & 4.982951e-01 ,4.968326e-01 ,4.953913e-01  /)


      asyice2(:, 16) = (/ &

        & 7.946655e-01 ,8.547685e-01 ,8.806016e-01 ,8.949880e-01 ,9.041676e-01 ,&
        & 9.105399e-01 ,9.152249e-01 ,9.188160e-01 ,9.216573e-01 ,9.239620e-01 ,&
        & 9.258695e-01 ,9.274745e-01 ,9.288441e-01 ,9.300267e-01 ,9.310584e-01 ,&
        & 9.319665e-01 ,9.327721e-01 ,9.334918e-01 ,9.341387e-01 ,9.347236e-01 ,&
        & 9.352551e-01 ,9.357402e-01 ,9.361850e-01 ,9.365942e-01 ,9.369722e-01 ,&
        & 9.373225e-01 ,9.376481e-01 ,9.379516e-01 ,9.382352e-01 ,9.385010e-01 ,&
        & 9.387505e-01 ,9.389854e-01 ,9.392070e-01 ,9.394163e-01 ,9.396145e-01 ,&
        & 9.398024e-01 ,9.399809e-01 ,9.401508e-01 ,9.403126e-01 ,9.404670e-01 ,&
        & 9.406144e-01 ,9.407555e-01 ,9.408906e-01  /)
      asyice2(:, 17) = (/ &

        & 9.078091e-01 ,9.195850e-01 ,9.267250e-01 ,9.317083e-01 ,9.354632e-01 ,&
        & 9.384323e-01 ,9.408597e-01 ,9.428935e-01 ,9.446301e-01 ,9.461351e-01 ,&
        & 9.474555e-01 ,9.486259e-01 ,9.496722e-01 ,9.506146e-01 ,9.514688e-01 ,&
        & 9.522476e-01 ,9.529612e-01 ,9.536181e-01 ,9.542251e-01 ,9.547883e-01 ,&
        & 9.553124e-01 ,9.558019e-01 ,9.562601e-01 ,9.566904e-01 ,9.570953e-01 ,&
        & 9.574773e-01 ,9.578385e-01 ,9.581806e-01 ,9.585054e-01 ,9.588142e-01 ,&
        & 9.591083e-01 ,9.593888e-01 ,9.596569e-01 ,9.599135e-01 ,9.601593e-01 ,&
        & 9.603952e-01 ,9.606219e-01 ,9.608399e-01 ,9.610499e-01 ,9.612523e-01 ,&
        & 9.614477e-01 ,9.616365e-01 ,9.618192e-01  /)
      asyice2(:, 18) = (/ &

        & 8.322045e-01 ,8.528693e-01 ,8.648167e-01 ,8.729163e-01 ,8.789054e-01 ,&
        & 8.835845e-01 ,8.873819e-01 ,8.905511e-01 ,8.932532e-01 ,8.955965e-01 ,&
        & 8.976567e-01 ,8.994887e-01 ,9.011334e-01 ,9.026221e-01 ,9.039791e-01 ,&
        & 9.052237e-01 ,9.063715e-01 ,9.074349e-01 ,9.084245e-01 ,9.093489e-01 ,&
        & 9.102154e-01 ,9.110303e-01 ,9.117987e-01 ,9.125253e-01 ,9.132140e-01 ,&
        & 9.138682e-01 ,9.144910e-01 ,9.150850e-01 ,9.156524e-01 ,9.161955e-01 ,&
        & 9.167160e-01 ,9.172157e-01 ,9.176959e-01 ,9.181581e-01 ,9.186034e-01 ,&
        & 9.190330e-01 ,9.194478e-01 ,9.198488e-01 ,9.202368e-01 ,9.206126e-01 ,&
        & 9.209768e-01 ,9.213301e-01 ,9.216731e-01  /)
      asyice2(:, 19) = (/ &

        & 8.116560e-01 ,8.488278e-01 ,8.674331e-01 ,8.788148e-01 ,8.865810e-01 ,&
        & 8.922595e-01 ,8.966149e-01 ,9.000747e-01 ,9.028980e-01 ,9.052513e-01 ,&
        & 9.072468e-01 ,9.089632e-01 ,9.104574e-01 ,9.117713e-01 ,9.129371e-01 ,&
        & 9.139793e-01 ,9.149174e-01 ,9.157668e-01 ,9.165400e-01 ,9.172473e-01 ,&
        & 9.178970e-01 ,9.184962e-01 ,9.190508e-01 ,9.195658e-01 ,9.200455e-01 ,&
        & 9.204935e-01 ,9.209130e-01 ,9.213067e-01 ,9.216771e-01 ,9.220262e-01 ,&
        & 9.223560e-01 ,9.226680e-01 ,9.229636e-01 ,9.232443e-01 ,9.235112e-01 ,&
        & 9.237652e-01 ,9.240074e-01 ,9.242385e-01 ,9.244594e-01 ,9.246708e-01 ,&
        & 9.248733e-01 ,9.250674e-01 ,9.252536e-01  /)
      asyice2(:, 20) = (/ &

        & 8.047113e-01 ,8.402864e-01 ,8.570332e-01 ,8.668455e-01 ,8.733206e-01 ,&
        & 8.779272e-01 ,8.813796e-01 ,8.840676e-01 ,8.862225e-01 ,8.879904e-01 ,&
        & 8.894682e-01 ,8.907228e-01 ,8.918019e-01 ,8.927404e-01 ,8.935645e-01 ,&
        & 8.942943e-01 ,8.949452e-01 ,8.955296e-01 ,8.960574e-01 ,8.965366e-01 ,&
        & 8.969736e-01 ,8.973740e-01 ,8.977422e-01 ,8.980820e-01 ,8.983966e-01 ,&
        & 8.986889e-01 ,8.989611e-01 ,8.992153e-01 ,8.994533e-01 ,8.996766e-01 ,&
        & 8.998865e-01 ,9.000843e-01 ,9.002709e-01 ,9.004474e-01 ,9.006146e-01 ,&
        & 9.007731e-01 ,9.009237e-01 ,9.010670e-01 ,9.012034e-01 ,9.013336e-01 ,&
        & 9.014579e-01 ,9.015767e-01 ,9.016904e-01  /)
      asyice2(:, 21) = (/ &

        & 8.179122e-01 ,8.480726e-01 ,8.621945e-01 ,8.704354e-01 ,8.758555e-01 ,&
        & 8.797007e-01 ,8.825750e-01 ,8.848078e-01 ,8.865939e-01 ,8.880564e-01 ,&
        & 8.892765e-01 ,8.903105e-01 ,8.911982e-01 ,8.919689e-01 ,8.926446e-01 ,&
        & 8.932419e-01 ,8.937738e-01 ,8.942506e-01 ,8.946806e-01 ,8.950702e-01 ,&
        & 8.954251e-01 ,8.957497e-01 ,8.960477e-01 ,8.963223e-01 ,8.965762e-01 ,&
        & 8.968116e-01 ,8.970306e-01 ,8.972347e-01 ,8.974255e-01 ,8.976042e-01 ,&
        & 8.977720e-01 ,8.979298e-01 ,8.980784e-01 ,8.982188e-01 ,8.983515e-01 ,&
        & 8.984771e-01 ,8.985963e-01 ,8.987095e-01 ,8.988171e-01 ,8.989195e-01 ,&
        & 8.990172e-01 ,8.991104e-01 ,8.991994e-01  /)
      asyice2(:, 22) = (/ &

        & 8.169789e-01 ,8.455024e-01 ,8.586925e-01 ,8.663283e-01 ,8.713217e-01 ,&
        & 8.748488e-01 ,8.774765e-01 ,8.795122e-01 ,8.811370e-01 ,8.824649e-01 ,&
        & 8.835711e-01 ,8.845073e-01 ,8.853103e-01 ,8.860068e-01 ,8.866170e-01 ,&
        & 8.871560e-01 ,8.876358e-01 ,8.880658e-01 ,8.884533e-01 ,8.888044e-01 ,&
        & 8.891242e-01 ,8.894166e-01 ,8.896851e-01 ,8.899324e-01 ,8.901612e-01 ,&
        & 8.903733e-01 ,8.905706e-01 ,8.907545e-01 ,8.909265e-01 ,8.910876e-01 ,&
        & 8.912388e-01 ,8.913812e-01 ,8.915153e-01 ,8.916419e-01 ,8.917617e-01 ,&
        & 8.918752e-01 ,8.919829e-01 ,8.920851e-01 ,8.921824e-01 ,8.922751e-01 ,&
        & 8.923635e-01 ,8.924478e-01 ,8.925284e-01  /)
      asyice2(:, 23) = (/ &

        & 8.387642e-01 ,8.569979e-01 ,8.658630e-01 ,8.711825e-01 ,8.747605e-01 ,&
        & 8.773472e-01 ,8.793129e-01 ,8.808621e-01 ,8.821179e-01 ,8.831583e-01 ,&
        & 8.840361e-01 ,8.847875e-01 ,8.854388e-01 ,8.860094e-01 ,8.865138e-01 ,&
        & 8.869634e-01 ,8.873668e-01 ,8.877310e-01 ,8.880617e-01 ,8.883635e-01 ,&
        & 8.886401e-01 ,8.888947e-01 ,8.891298e-01 ,8.893477e-01 ,8.895504e-01 ,&
        & 8.897393e-01 ,8.899159e-01 ,8.900815e-01 ,8.902370e-01 ,8.903833e-01 ,&
        & 8.905214e-01 ,8.906518e-01 ,8.907753e-01 ,8.908924e-01 ,8.910036e-01 ,&
        & 8.911094e-01 ,8.912101e-01 ,8.913062e-01 ,8.913979e-01 ,8.914856e-01 ,&
        & 8.915695e-01 ,8.916498e-01 ,8.917269e-01  /)
      asyice2(:, 24) = (/ &

        & 8.522208e-01 ,8.648132e-01 ,8.711224e-01 ,8.749901e-01 ,8.776354e-01 ,&
        & 8.795743e-01 ,8.810649e-01 ,8.822518e-01 ,8.832225e-01 ,8.840333e-01 ,&
        & 8.847224e-01 ,8.853162e-01 ,8.858342e-01 ,8.862906e-01 ,8.866962e-01 ,&
        & 8.870595e-01 ,8.873871e-01 ,8.876842e-01 ,8.879551e-01 ,8.882032e-01 ,&
        & 8.884316e-01 ,8.886425e-01 ,8.888380e-01 ,8.890199e-01 ,8.891895e-01 ,&
        & 8.893481e-01 ,8.894968e-01 ,8.896366e-01 ,8.897683e-01 ,8.898926e-01 ,&
        & 8.900102e-01 ,8.901215e-01 ,8.902272e-01 ,8.903276e-01 ,8.904232e-01 ,&
        & 8.905144e-01 ,8.906014e-01 ,8.906845e-01 ,8.907640e-01 ,8.908402e-01 ,&
        & 8.909132e-01 ,8.909834e-01 ,8.910507e-01  /)
      asyice2(:, 25) = (/ &

        & 8.578202e-01 ,8.683033e-01 ,8.735431e-01 ,8.767488e-01 ,8.789378e-01 ,&
        & 8.805399e-01 ,8.817701e-01 ,8.827485e-01 ,8.835480e-01 ,8.842152e-01 ,&
        & 8.847817e-01 ,8.852696e-01 ,8.856949e-01 ,8.860694e-01 ,8.864020e-01 ,&
        & 8.866997e-01 ,8.869681e-01 ,8.872113e-01 ,8.874330e-01 ,8.876360e-01 ,&
        & 8.878227e-01 ,8.879951e-01 ,8.881548e-01 ,8.883033e-01 ,8.884418e-01 ,&
        & 8.885712e-01 ,8.886926e-01 ,8.888066e-01 ,8.889139e-01 ,8.890152e-01 ,&
        & 8.891110e-01 ,8.892017e-01 ,8.892877e-01 ,8.893695e-01 ,8.894473e-01 ,&
        & 8.895214e-01 ,8.895921e-01 ,8.896597e-01 ,8.897243e-01 ,8.897862e-01 ,&
        & 8.898456e-01 ,8.899025e-01 ,8.899572e-01  /)
      asyice2(:, 26) = (/ &

        & 8.625615e-01 ,8.713831e-01 ,8.755799e-01 ,8.780560e-01 ,8.796983e-01 ,&
        & 8.808714e-01 ,8.817534e-01 ,8.824420e-01 ,8.829953e-01 ,8.834501e-01 ,&
        & 8.838310e-01 ,8.841549e-01 ,8.844338e-01 ,8.846767e-01 ,8.848902e-01 ,&
        & 8.850795e-01 ,8.852484e-01 ,8.854002e-01 ,8.855374e-01 ,8.856620e-01 ,&
        & 8.857758e-01 ,8.858800e-01 ,8.859759e-01 ,8.860644e-01 ,8.861464e-01 ,&
        & 8.862225e-01 ,8.862935e-01 ,8.863598e-01 ,8.864218e-01 ,8.864800e-01 ,&
        & 8.865347e-01 ,8.865863e-01 ,8.866349e-01 ,8.866809e-01 ,8.867245e-01 ,&
        & 8.867658e-01 ,8.868050e-01 ,8.868423e-01 ,8.868778e-01 ,8.869117e-01 ,&
        & 8.869440e-01 ,8.869749e-01 ,8.870044e-01  /)
      asyice2(:, 27) = (/ &

        & 8.587495e-01 ,8.684764e-01 ,8.728189e-01 ,8.752872e-01 ,8.768846e-01 ,&
        & 8.780060e-01 ,8.788386e-01 ,8.794824e-01 ,8.799960e-01 ,8.804159e-01 ,&
        & 8.807660e-01 ,8.810626e-01 ,8.813175e-01 ,8.815390e-01 ,8.817335e-01 ,&
        & 8.819057e-01 ,8.820593e-01 ,8.821973e-01 ,8.823220e-01 ,8.824353e-01 ,&
        & 8.825387e-01 ,8.826336e-01 ,8.827209e-01 ,8.828016e-01 ,8.828764e-01 ,&
        & 8.829459e-01 ,8.830108e-01 ,8.830715e-01 ,8.831283e-01 ,8.831817e-01 ,&
        & 8.832320e-01 ,8.832795e-01 ,8.833244e-01 ,8.833668e-01 ,8.834071e-01 ,&
        & 8.834454e-01 ,8.834817e-01 ,8.835164e-01 ,8.835495e-01 ,8.835811e-01 ,&
        & 8.836113e-01 ,8.836402e-01 ,8.836679e-01  /)
      asyice2(:, 28) = (/ &

        & 8.561110e-01 ,8.678583e-01 ,8.727554e-01 ,8.753892e-01 ,8.770154e-01 ,&
        & 8.781109e-01 ,8.788949e-01 ,8.794812e-01 ,8.799348e-01 ,8.802952e-01 ,&
        & 8.805880e-01 ,8.808300e-01 ,8.810331e-01 ,8.812058e-01 ,8.813543e-01 ,&
        & 8.814832e-01 ,8.815960e-01 ,8.816956e-01 ,8.817839e-01 ,8.818629e-01 ,&
        & 8.819339e-01 ,8.819979e-01 ,8.820560e-01 ,8.821089e-01 ,8.821573e-01 ,&
        & 8.822016e-01 ,8.822425e-01 ,8.822801e-01 ,8.823150e-01 ,8.823474e-01 ,&
        & 8.823775e-01 ,8.824056e-01 ,8.824318e-01 ,8.824564e-01 ,8.824795e-01 ,&
        & 8.825011e-01 ,8.825215e-01 ,8.825408e-01 ,8.825589e-01 ,8.825761e-01 ,&
        & 8.825924e-01 ,8.826078e-01 ,8.826224e-01  /)
      asyice2(:, 29) = (/ &

        & 8.311124e-01 ,8.688197e-01 ,8.900274e-01 ,9.040696e-01 ,9.142334e-01 ,&
        & 9.220181e-01 ,9.282195e-01 ,9.333048e-01 ,9.375689e-01 ,9.412085e-01 ,&
        & 9.443604e-01 ,9.471230e-01 ,9.495694e-01 ,9.517549e-01 ,9.537224e-01 ,&
        & 9.555057e-01 ,9.571316e-01 ,9.586222e-01 ,9.599952e-01 ,9.612656e-01 ,&
        & 9.624458e-01 ,9.635461e-01 ,9.645756e-01 ,9.655418e-01 ,9.664513e-01 ,&
        & 9.673098e-01 ,9.681222e-01 ,9.688928e-01 ,9.696256e-01 ,9.703237e-01 ,&
        & 9.709903e-01 ,9.716280e-01 ,9.722391e-01 ,9.728258e-01 ,9.733901e-01 ,&
        & 9.739336e-01 ,9.744579e-01 ,9.749645e-01 ,9.754546e-01 ,9.759294e-01 ,&
        & 9.763901e-01 ,9.768376e-01 ,9.772727e-01  /)



      extice3(:, 16) = (/ &

        & 5.194013e-01 ,3.215089e-01 ,2.327917e-01 ,1.824424e-01 ,1.499977e-01 ,&
        & 1.273492e-01 ,1.106421e-01 ,9.780982e-02 ,8.764435e-02 ,7.939266e-02 ,&
        & 7.256081e-02 ,6.681137e-02 ,6.190600e-02 ,5.767154e-02 ,5.397915e-02 ,&
        & 5.073102e-02 ,4.785151e-02 ,4.528125e-02 ,4.297296e-02 ,4.088853e-02 ,&
        & 3.899690e-02 ,3.727251e-02 ,3.569411e-02 ,3.424393e-02 ,3.290694e-02 ,&
        & 3.167040e-02 ,3.052340e-02 ,2.945654e-02 ,2.846172e-02 ,2.753188e-02 ,&
        & 2.666085e-02 ,2.584322e-02 ,2.507423e-02 ,2.434967e-02 ,2.366579e-02 ,&
        & 2.301926e-02 ,2.240711e-02 ,2.182666e-02 ,2.127551e-02 ,2.075150e-02 ,&
        & 2.025267e-02 ,1.977725e-02 ,1.932364e-02 ,1.889035e-02 ,1.847607e-02 ,&
        & 1.807956e-02  /)
      extice3(:, 17) = (/ &

        & 4.901155e-01 ,3.065286e-01 ,2.230800e-01 ,1.753951e-01 ,1.445402e-01 ,&
        & 1.229417e-01 ,1.069777e-01 ,9.469760e-02 ,8.495824e-02 ,7.704501e-02 ,&
        & 7.048834e-02 ,6.496693e-02 ,6.025353e-02 ,5.618286e-02 ,5.263186e-02 ,&
        & 4.950698e-02 ,4.673585e-02 ,4.426164e-02 ,4.203904e-02 ,4.003153e-02 ,&
        & 3.820932e-02 ,3.654790e-02 ,3.502688e-02 ,3.362919e-02 ,3.234041e-02 ,&
        & 3.114829e-02 ,3.004234e-02 ,2.901356e-02 ,2.805413e-02 ,2.715727e-02 ,&
        & 2.631705e-02 ,2.552828e-02 ,2.478637e-02 ,2.408725e-02 ,2.342734e-02 ,&
        & 2.280343e-02 ,2.221264e-02 ,2.165242e-02 ,2.112043e-02 ,2.061461e-02 ,&
        & 2.013308e-02 ,1.967411e-02 ,1.923616e-02 ,1.881783e-02 ,1.841781e-02 ,&
        & 1.803494e-02  /)
      extice3(:, 18) = (/ &

        & 5.056264e-01 ,3.160261e-01 ,2.298442e-01 ,1.805973e-01 ,1.487318e-01 ,&
        & 1.264258e-01 ,1.099389e-01 ,9.725656e-02 ,8.719819e-02 ,7.902576e-02 ,&
        & 7.225433e-02 ,6.655206e-02 ,6.168427e-02 ,5.748028e-02 ,5.381296e-02 ,&
        & 5.058572e-02 ,4.772383e-02 ,4.516857e-02 ,4.287317e-02 ,4.079990e-02 ,&
        & 3.891801e-02 ,3.720217e-02 ,3.563133e-02 ,3.418786e-02 ,3.285686e-02 ,&
        & 3.162569e-02 ,3.048352e-02 ,2.942104e-02 ,2.843018e-02 ,2.750395e-02 ,&
        & 2.663621e-02 ,2.582160e-02 ,2.505539e-02 ,2.433337e-02 ,2.365185e-02 ,&
        & 2.300750e-02 ,2.239736e-02 ,2.181878e-02 ,2.126937e-02 ,2.074699e-02 ,&
        & 2.024968e-02 ,1.977567e-02 ,1.932338e-02 ,1.889134e-02 ,1.847823e-02 ,&
        & 1.808281e-02  /)
      extice3(:, 19) = (/ &

        & 4.881605e-01 ,3.055237e-01 ,2.225070e-01 ,1.750688e-01 ,1.443736e-01 ,&
        & 1.228869e-01 ,1.070054e-01 ,9.478893e-02 ,8.509997e-02 ,7.722769e-02 ,&
        & 7.070495e-02 ,6.521211e-02 ,6.052311e-02 ,5.647351e-02 ,5.294088e-02 ,&
        & 4.983217e-02 ,4.707539e-02 ,4.461398e-02 ,4.240288e-02 ,4.040575e-02 ,&
        & 3.859298e-02 ,3.694016e-02 ,3.542701e-02 ,3.403655e-02 ,3.275444e-02 ,&
        & 3.156849e-02 ,3.046827e-02 ,2.944481e-02 ,2.849034e-02 ,2.759812e-02 ,&
        & 2.676226e-02 ,2.597757e-02 ,2.523949e-02 ,2.454400e-02 ,2.388750e-02 ,&
        & 2.326682e-02 ,2.267909e-02 ,2.212176e-02 ,2.159253e-02 ,2.108933e-02 ,&
        & 2.061028e-02 ,2.015369e-02 ,1.971801e-02 ,1.930184e-02 ,1.890389e-02 ,&
        & 1.852300e-02  /)
      extice3(:, 20) = (/ &

        & 5.103703e-01 ,3.188144e-01 ,2.317435e-01 ,1.819887e-01 ,1.497944e-01 ,&
        & 1.272584e-01 ,1.106013e-01 ,9.778822e-02 ,8.762610e-02 ,7.936938e-02 ,&
        & 7.252809e-02 ,6.676701e-02 ,6.184901e-02 ,5.760165e-02 ,5.389651e-02 ,&
        & 5.063598e-02 ,4.774457e-02 ,4.516295e-02 ,4.284387e-02 ,4.074922e-02 ,&
        & 3.884792e-02 ,3.711438e-02 ,3.552734e-02 ,3.406898e-02 ,3.272425e-02 ,&
        & 3.148038e-02 ,3.032643e-02 ,2.925299e-02 ,2.825191e-02 ,2.731612e-02 ,&
        & 2.643943e-02 ,2.561642e-02 ,2.484230e-02 ,2.411284e-02 ,2.342429e-02 ,&
        & 2.277329e-02 ,2.215686e-02 ,2.157231e-02 ,2.101724e-02 ,2.048946e-02 ,&
        & 1.998702e-02 ,1.950813e-02 ,1.905118e-02 ,1.861468e-02 ,1.819730e-02 ,&
        & 1.779781e-02  /)
      extice3(:, 21) = (/ &

        & 5.031161e-01 ,3.144511e-01 ,2.286942e-01 ,1.796903e-01 ,1.479819e-01 ,&
        & 1.257860e-01 ,1.093803e-01 ,9.676059e-02 ,8.675183e-02 ,7.861971e-02 ,&
        & 7.188168e-02 ,6.620754e-02 ,6.136376e-02 ,5.718050e-02 ,5.353127e-02 ,&
        & 5.031995e-02 ,4.747218e-02 ,4.492952e-02 ,4.264544e-02 ,4.058240e-02 ,&
        & 3.870979e-02 ,3.700242e-02 ,3.543933e-02 ,3.400297e-02 ,3.267854e-02 ,&
        & 3.145345e-02 ,3.031691e-02 ,2.925967e-02 ,2.827370e-02 ,2.735203e-02 ,&
        & 2.648858e-02 ,2.567798e-02 ,2.491555e-02 ,2.419710e-02 ,2.351893e-02 ,&
        & 2.287776e-02 ,2.227063e-02 ,2.169491e-02 ,2.114821e-02 ,2.062840e-02 ,&
        & 2.013354e-02 ,1.966188e-02 ,1.921182e-02 ,1.878191e-02 ,1.837083e-02 ,&
        & 1.797737e-02  /)
      extice3(:, 22) = (/ &

        & 4.949453e-01 ,3.095918e-01 ,2.253402e-01 ,1.771964e-01 ,1.460446e-01 ,&
        & 1.242383e-01 ,1.081206e-01 ,9.572235e-02 ,8.588928e-02 ,7.789990e-02 ,&
        & 7.128013e-02 ,6.570559e-02 ,6.094684e-02 ,5.683701e-02 ,5.325183e-02 ,&
        & 5.009688e-02 ,4.729909e-02 ,4.480106e-02 ,4.255708e-02 ,4.053025e-02 ,&
        & 3.869051e-02 ,3.701310e-02 ,3.547745e-02 ,3.406631e-02 ,3.276512e-02 ,&
        & 3.156153e-02 ,3.044494e-02 ,2.940626e-02 ,2.843759e-02 ,2.753211e-02 ,&
        & 2.668381e-02 ,2.588744e-02 ,2.513839e-02 ,2.443255e-02 ,2.376629e-02 ,&
        & 2.313637e-02 ,2.253990e-02 ,2.197428e-02 ,2.143718e-02 ,2.092649e-02 ,&
        & 2.044032e-02 ,1.997694e-02 ,1.953478e-02 ,1.911241e-02 ,1.870855e-02 ,&
        & 1.832199e-02  /)
      extice3(:, 23) = (/ &

        & 5.052816e-01 ,3.157665e-01 ,2.296233e-01 ,1.803986e-01 ,1.485473e-01 ,&
        & 1.262514e-01 ,1.097718e-01 ,9.709524e-02 ,8.704139e-02 ,7.887264e-02 ,&
        & 7.210424e-02 ,6.640454e-02 ,6.153894e-02 ,5.733683e-02 ,5.367116e-02 ,&
        & 5.044537e-02 ,4.758477e-02 ,4.503066e-02 ,4.273629e-02 ,4.066395e-02 ,&
        & 3.878291e-02 ,3.706784e-02 ,3.549771e-02 ,3.405488e-02 ,3.272448e-02 ,&
        & 3.149387e-02 ,3.035221e-02 ,2.929020e-02 ,2.829979e-02 ,2.737397e-02 ,&
        & 2.650663e-02 ,2.569238e-02 ,2.492651e-02 ,2.420482e-02 ,2.352361e-02 ,&
        & 2.287954e-02 ,2.226968e-02 ,2.169136e-02 ,2.114220e-02 ,2.062005e-02 ,&
        & 2.012296e-02 ,1.964917e-02 ,1.919709e-02 ,1.876524e-02 ,1.835231e-02 ,&
        & 1.795707e-02  /)
      extice3(:, 24) = (/ &

        & 5.042067e-01 ,3.151195e-01 ,2.291708e-01 ,1.800573e-01 ,1.482779e-01 ,&
        & 1.260324e-01 ,1.095900e-01 ,9.694202e-02 ,8.691087e-02 ,7.876056e-02 ,&
        & 7.200745e-02 ,6.632062e-02 ,6.146600e-02 ,5.727338e-02 ,5.361599e-02 ,&
        & 5.039749e-02 ,4.754334e-02 ,4.499500e-02 ,4.270580e-02 ,4.063815e-02 ,&
        & 3.876135e-02 ,3.705016e-02 ,3.548357e-02 ,3.404400e-02 ,3.271661e-02 ,&
        & 3.148877e-02 ,3.034969e-02 ,2.929008e-02 ,2.830191e-02 ,2.737818e-02 ,&
        & 2.651279e-02 ,2.570039e-02 ,2.493624e-02 ,2.421618e-02 ,2.353650e-02 ,&
        & 2.289390e-02 ,2.228541e-02 ,2.170840e-02 ,2.116048e-02 ,2.063950e-02 ,&
        & 2.014354e-02 ,1.967082e-02 ,1.921975e-02 ,1.878888e-02 ,1.837688e-02 ,&
        & 1.798254e-02  /)
      extice3(:, 25) = (/ &

        & 5.022507e-01 ,3.139246e-01 ,2.283218e-01 ,1.794059e-01 ,1.477544e-01 ,&
        & 1.255984e-01 ,1.092222e-01 ,9.662516e-02 ,8.663439e-02 ,7.851688e-02 ,&
        & 7.179095e-02 ,6.612700e-02 ,6.129193e-02 ,5.711618e-02 ,5.347351e-02 ,&
        & 5.026796e-02 ,4.742530e-02 ,4.488721e-02 ,4.260724e-02 ,4.054790e-02 ,&
        & 3.867866e-02 ,3.697435e-02 ,3.541407e-02 ,3.398029e-02 ,3.265824e-02 ,&
        & 3.143535e-02 ,3.030085e-02 ,2.924551e-02 ,2.826131e-02 ,2.734130e-02 ,&
        & 2.647939e-02 ,2.567026e-02 ,2.490919e-02 ,2.419203e-02 ,2.351509e-02 ,&
        & 2.287507e-02 ,2.226903e-02 ,2.169434e-02 ,2.114862e-02 ,2.062975e-02 ,&
        & 2.013578e-02 ,1.966496e-02 ,1.921571e-02 ,1.878658e-02 ,1.837623e-02 ,&
        & 1.798348e-02  /)
      extice3(:, 26) = (/ &

        & 5.068316e-01 ,3.166869e-01 ,2.302576e-01 ,1.808693e-01 ,1.489122e-01 ,&
        & 1.265423e-01 ,1.100080e-01 ,9.728926e-02 ,8.720201e-02 ,7.900612e-02 ,&
        & 7.221524e-02 ,6.649660e-02 ,6.161484e-02 ,5.739877e-02 ,5.372093e-02 ,&
        & 5.048442e-02 ,4.761431e-02 ,4.505172e-02 ,4.274972e-02 ,4.067050e-02 ,&
        & 3.878321e-02 ,3.706244e-02 ,3.548710e-02 ,3.403948e-02 ,3.270466e-02 ,&
        & 3.146995e-02 ,3.032450e-02 ,2.925897e-02 ,2.826527e-02 ,2.733638e-02 ,&
        & 2.646615e-02 ,2.564920e-02 ,2.488078e-02 ,2.415670e-02 ,2.347322e-02 ,&
        & 2.282702e-02 ,2.221513e-02 ,2.163489e-02 ,2.108390e-02 ,2.056002e-02 ,&
        & 2.006128e-02 ,1.958591e-02 ,1.913232e-02 ,1.869904e-02 ,1.828474e-02 ,&
        & 1.788819e-02  /)
      extice3(:, 27) = (/ &

        & 5.077707e-01 ,3.172636e-01 ,2.306695e-01 ,1.811871e-01 ,1.491691e-01 ,&
        & 1.267565e-01 ,1.101907e-01 ,9.744773e-02 ,8.734125e-02 ,7.912973e-02 ,&
        & 7.232591e-02 ,6.659637e-02 ,6.170530e-02 ,5.748120e-02 ,5.379634e-02 ,&
        & 5.055367e-02 ,4.767809e-02 ,4.511061e-02 ,4.280423e-02 ,4.072104e-02 ,&
        & 3.883015e-02 ,3.710611e-02 ,3.552776e-02 ,3.407738e-02 ,3.274002e-02 ,&
        & 3.150296e-02 ,3.035532e-02 ,2.928776e-02 ,2.829216e-02 ,2.736150e-02 ,&
        & 2.648961e-02 ,2.567111e-02 ,2.490123e-02 ,2.417576e-02 ,2.349098e-02 ,&
        & 2.284354e-02 ,2.223049e-02 ,2.164914e-02 ,2.109711e-02 ,2.057222e-02 ,&
        & 2.007253e-02 ,1.959626e-02 ,1.914181e-02 ,1.870770e-02 ,1.829261e-02 ,&
        & 1.789531e-02  /)
      extice3(:, 28) = (/ &

        & 5.062281e-01 ,3.163402e-01 ,2.300275e-01 ,1.807060e-01 ,1.487921e-01 ,&
        & 1.264523e-01 ,1.099403e-01 ,9.723879e-02 ,8.716516e-02 ,7.898034e-02 ,&
        & 7.219863e-02 ,6.648771e-02 ,6.161254e-02 ,5.740217e-02 ,5.372929e-02 ,&
        & 5.049716e-02 ,4.763092e-02 ,4.507179e-02 ,4.277290e-02 ,4.069649e-02 ,&
        & 3.881175e-02 ,3.709331e-02 ,3.552008e-02 ,3.407442e-02 ,3.274141e-02 ,&
        & 3.150837e-02 ,3.036447e-02 ,2.930037e-02 ,2.830801e-02 ,2.738037e-02 ,&
        & 2.651132e-02 ,2.569547e-02 ,2.492810e-02 ,2.420499e-02 ,2.352243e-02 ,&
        & 2.287710e-02 ,2.226604e-02 ,2.168658e-02 ,2.113634e-02 ,2.061316e-02 ,&
        & 2.011510e-02 ,1.964038e-02 ,1.918740e-02 ,1.875471e-02 ,1.834096e-02 ,&
        & 1.794495e-02  /)
      extice3(:, 29) = (/ &

        & 1.338834e-01 ,1.924912e-01 ,1.755523e-01 ,1.534793e-01 ,1.343937e-01 ,&
        & 1.187883e-01 ,1.060654e-01 ,9.559106e-02 ,8.685880e-02 ,7.948698e-02 ,&
        & 7.319086e-02 ,6.775669e-02 ,6.302215e-02 ,5.886236e-02 ,5.517996e-02 ,&
        & 5.189810e-02 ,4.895539e-02 ,4.630225e-02 ,4.389823e-02 ,4.171002e-02 ,&
        & 3.970998e-02 ,3.787493e-02 ,3.618537e-02 ,3.462471e-02 ,3.317880e-02 ,&
        & 3.183547e-02 ,3.058421e-02 ,2.941590e-02 ,2.832256e-02 ,2.729724e-02 ,&
        & 2.633377e-02 ,2.542675e-02 ,2.457136e-02 ,2.376332e-02 ,2.299882e-02 ,&
        & 2.227443e-02 ,2.158707e-02 ,2.093400e-02 ,2.031270e-02 ,1.972091e-02 ,&
        & 1.915659e-02 ,1.861787e-02 ,1.810304e-02 ,1.761055e-02 ,1.713899e-02 ,&
        & 1.668704e-02  /)


      ssaice3(:, 16) = (/ &

        & 6.749442e-01 ,6.649947e-01 ,6.565828e-01 ,6.489928e-01 ,6.420046e-01 ,&
        & 6.355231e-01 ,6.294964e-01 ,6.238901e-01 ,6.186783e-01 ,6.138395e-01 ,&
        & 6.093543e-01 ,6.052049e-01 ,6.013742e-01 ,5.978457e-01 ,5.946030e-01 ,&
        & 5.916302e-01 ,5.889115e-01 ,5.864310e-01 ,5.841731e-01 ,5.821221e-01 ,&
        & 5.802624e-01 ,5.785785e-01 ,5.770549e-01 ,5.756759e-01 ,5.744262e-01 ,&
        & 5.732901e-01 ,5.722524e-01 ,5.712974e-01 ,5.704097e-01 ,5.695739e-01 ,&
        & 5.687747e-01 ,5.679964e-01 ,5.672238e-01 ,5.664415e-01 ,5.656340e-01 ,&
        & 5.647860e-01 ,5.638821e-01 ,5.629070e-01 ,5.618452e-01 ,5.606815e-01 ,&
        & 5.594006e-01 ,5.579870e-01 ,5.564255e-01 ,5.547008e-01 ,5.527976e-01 ,&
        & 5.507005e-01  /)
      ssaice3(:, 17) = (/ &

        & 7.628550e-01 ,7.567297e-01 ,7.508463e-01 ,7.451972e-01 ,7.397745e-01 ,&
        & 7.345705e-01 ,7.295775e-01 ,7.247881e-01 ,7.201945e-01 ,7.157894e-01 ,&
        & 7.115652e-01 ,7.075145e-01 ,7.036300e-01 ,6.999044e-01 ,6.963304e-01 ,&
        & 6.929007e-01 ,6.896083e-01 ,6.864460e-01 ,6.834067e-01 ,6.804833e-01 ,&
        & 6.776690e-01 ,6.749567e-01 ,6.723397e-01 ,6.698109e-01 ,6.673637e-01 ,&
        & 6.649913e-01 ,6.626870e-01 ,6.604441e-01 ,6.582561e-01 ,6.561163e-01 ,&
        & 6.540182e-01 ,6.519554e-01 ,6.499215e-01 ,6.479099e-01 ,6.459145e-01 ,&
        & 6.439289e-01 ,6.419468e-01 ,6.399621e-01 ,6.379686e-01 ,6.359601e-01 ,&
        & 6.339306e-01 ,6.318740e-01 ,6.297845e-01 ,6.276559e-01 ,6.254825e-01 ,&
        & 6.232583e-01  /)
      ssaice3(:, 18) = (/ &

        & 9.924147e-01 ,9.882792e-01 ,9.842257e-01 ,9.802522e-01 ,9.763566e-01 ,&
        & 9.725367e-01 ,9.687905e-01 ,9.651157e-01 ,9.615104e-01 ,9.579725e-01 ,&
        & 9.544997e-01 ,9.510901e-01 ,9.477416e-01 ,9.444520e-01 ,9.412194e-01 ,&
        & 9.380415e-01 ,9.349165e-01 ,9.318421e-01 ,9.288164e-01 ,9.258373e-01 ,&
        & 9.229027e-01 ,9.200106e-01 ,9.171589e-01 ,9.143457e-01 ,9.115688e-01 ,&
        & 9.088263e-01 ,9.061161e-01 ,9.034362e-01 ,9.007846e-01 ,8.981592e-01 ,&
        & 8.955581e-01 ,8.929792e-01 ,8.904206e-01 ,8.878803e-01 ,8.853562e-01 ,&
        & 8.828464e-01 ,8.803488e-01 ,8.778616e-01 ,8.753827e-01 ,8.729102e-01 ,&
        & 8.704421e-01 ,8.679764e-01 ,8.655112e-01 ,8.630445e-01 ,8.605744e-01 ,&
        & 8.580989e-01  /)
      ssaice3(:, 19) = (/ &

        & 9.629413e-01 ,9.517182e-01 ,9.409209e-01 ,9.305366e-01 ,9.205529e-01 ,&
        & 9.109569e-01 ,9.017362e-01 ,8.928780e-01 ,8.843699e-01 ,8.761992e-01 ,&
        & 8.683536e-01 ,8.608204e-01 ,8.535873e-01 ,8.466417e-01 ,8.399712e-01 ,&
        & 8.335635e-01 ,8.274062e-01 ,8.214868e-01 ,8.157932e-01 ,8.103129e-01 ,&
        & 8.050336e-01 ,7.999432e-01 ,7.950294e-01 ,7.902798e-01 ,7.856825e-01 ,&
        & 7.812250e-01 ,7.768954e-01 ,7.726815e-01 ,7.685711e-01 ,7.645522e-01 ,&
        & 7.606126e-01 ,7.567404e-01 ,7.529234e-01 ,7.491498e-01 ,7.454074e-01 ,&
        & 7.416844e-01 ,7.379688e-01 ,7.342485e-01 ,7.305118e-01 ,7.267468e-01 ,&
        & 7.229415e-01 ,7.190841e-01 ,7.151628e-01 ,7.111657e-01 ,7.070811e-01 ,&
        & 7.028972e-01  /)
      ssaice3(:, 20) = (/ &

        & 9.942270e-01 ,9.909206e-01 ,9.876775e-01 ,9.844960e-01 ,9.813746e-01 ,&
        & 9.783114e-01 ,9.753049e-01 ,9.723535e-01 ,9.694553e-01 ,9.666088e-01 ,&
        & 9.638123e-01 ,9.610641e-01 ,9.583626e-01 ,9.557060e-01 ,9.530928e-01 ,&
        & 9.505211e-01 ,9.479895e-01 ,9.454961e-01 ,9.430393e-01 ,9.406174e-01 ,&
        & 9.382288e-01 ,9.358717e-01 ,9.335446e-01 ,9.312456e-01 ,9.289731e-01 ,&
        & 9.267255e-01 ,9.245010e-01 ,9.222980e-01 ,9.201147e-01 ,9.179496e-01 ,&
        & 9.158008e-01 ,9.136667e-01 ,9.115457e-01 ,9.094359e-01 ,9.073358e-01 ,&
        & 9.052436e-01 ,9.031577e-01 ,9.010763e-01 ,8.989977e-01 ,8.969203e-01 ,&
        & 8.948423e-01 ,8.927620e-01 ,8.906778e-01 ,8.885879e-01 ,8.864907e-01 ,&
        & 8.843843e-01  /)
      ssaice3(:, 21) = (/ &

        & 9.934014e-01 ,9.899331e-01 ,9.865537e-01 ,9.832610e-01 ,9.800523e-01 ,&
        & 9.769254e-01 ,9.738777e-01 ,9.709069e-01 ,9.680106e-01 ,9.651862e-01 ,&
        & 9.624315e-01 ,9.597439e-01 ,9.571212e-01 ,9.545608e-01 ,9.520605e-01 ,&
        & 9.496177e-01 ,9.472301e-01 ,9.448954e-01 ,9.426111e-01 ,9.403749e-01 ,&
        & 9.381843e-01 ,9.360370e-01 ,9.339307e-01 ,9.318629e-01 ,9.298313e-01 ,&
        & 9.278336e-01 ,9.258673e-01 ,9.239302e-01 ,9.220198e-01 ,9.201338e-01 ,&
        & 9.182700e-01 ,9.164258e-01 ,9.145991e-01 ,9.127874e-01 ,9.109884e-01 ,&
        & 9.091999e-01 ,9.074194e-01 ,9.056447e-01 ,9.038735e-01 ,9.021033e-01 ,&
        & 9.003320e-01 ,8.985572e-01 ,8.967766e-01 ,8.949879e-01 ,8.931888e-01 ,&
        & 8.913770e-01  /)
      ssaice3(:, 22) = (/ &

        & 9.994833e-01 ,9.992055e-01 ,9.989278e-01 ,9.986500e-01 ,9.983724e-01 ,&
        & 9.980947e-01 ,9.978172e-01 ,9.975397e-01 ,9.972623e-01 ,9.969849e-01 ,&
        & 9.967077e-01 ,9.964305e-01 ,9.961535e-01 ,9.958765e-01 ,9.955997e-01 ,&
        & 9.953230e-01 ,9.950464e-01 ,9.947699e-01 ,9.944936e-01 ,9.942174e-01 ,&
        & 9.939414e-01 ,9.936656e-01 ,9.933899e-01 ,9.931144e-01 ,9.928390e-01 ,&
        & 9.925639e-01 ,9.922889e-01 ,9.920141e-01 ,9.917396e-01 ,9.914652e-01 ,&
        & 9.911911e-01 ,9.909171e-01 ,9.906434e-01 ,9.903700e-01 ,9.900967e-01 ,&
        & 9.898237e-01 ,9.895510e-01 ,9.892784e-01 ,9.890062e-01 ,9.887342e-01 ,&
        & 9.884625e-01 ,9.881911e-01 ,9.879199e-01 ,9.876490e-01 ,9.873784e-01 ,&
        & 9.871081e-01  /)
      ssaice3(:, 23) = (/ &

        & 9.999343e-01 ,9.998917e-01 ,9.998492e-01 ,9.998067e-01 ,9.997642e-01 ,&
        & 9.997218e-01 ,9.996795e-01 ,9.996372e-01 ,9.995949e-01 ,9.995528e-01 ,&
        & 9.995106e-01 ,9.994686e-01 ,9.994265e-01 ,9.993845e-01 ,9.993426e-01 ,&
        & 9.993007e-01 ,9.992589e-01 ,9.992171e-01 ,9.991754e-01 ,9.991337e-01 ,&
        & 9.990921e-01 ,9.990505e-01 ,9.990089e-01 ,9.989674e-01 ,9.989260e-01 ,&
        & 9.988846e-01 ,9.988432e-01 ,9.988019e-01 ,9.987606e-01 ,9.987194e-01 ,&
        & 9.986782e-01 ,9.986370e-01 ,9.985959e-01 ,9.985549e-01 ,9.985139e-01 ,&
        & 9.984729e-01 ,9.984319e-01 ,9.983910e-01 ,9.983502e-01 ,9.983094e-01 ,&
        & 9.982686e-01 ,9.982279e-01 ,9.981872e-01 ,9.981465e-01 ,9.981059e-01 ,&
        & 9.980653e-01  /)
      ssaice3(:, 24) = (/ &

        & 9.999978e-01 ,9.999965e-01 ,9.999952e-01 ,9.999939e-01 ,9.999926e-01 ,&
        & 9.999913e-01 ,9.999900e-01 ,9.999887e-01 ,9.999873e-01 ,9.999860e-01 ,&
        & 9.999847e-01 ,9.999834e-01 ,9.999821e-01 ,9.999808e-01 ,9.999795e-01 ,&
        & 9.999782e-01 ,9.999769e-01 ,9.999756e-01 ,9.999743e-01 ,9.999730e-01 ,&
        & 9.999717e-01 ,9.999704e-01 ,9.999691e-01 ,9.999678e-01 ,9.999665e-01 ,&
        & 9.999652e-01 ,9.999639e-01 ,9.999626e-01 ,9.999613e-01 ,9.999600e-01 ,&
        & 9.999587e-01 ,9.999574e-01 ,9.999561e-01 ,9.999548e-01 ,9.999535e-01 ,&
        & 9.999522e-01 ,9.999509e-01 ,9.999496e-01 ,9.999483e-01 ,9.999470e-01 ,&
        & 9.999457e-01 ,9.999444e-01 ,9.999431e-01 ,9.999418e-01 ,9.999405e-01 ,&
        & 9.999392e-01  /)
      ssaice3(:, 25) = (/ &

        & 9.999994e-01 ,9.999993e-01 ,9.999991e-01 ,9.999990e-01 ,9.999989e-01 ,&
        & 9.999987e-01 ,9.999986e-01 ,9.999984e-01 ,9.999983e-01 ,9.999982e-01 ,&
        & 9.999980e-01 ,9.999979e-01 ,9.999977e-01 ,9.999976e-01 ,9.999975e-01 ,&
        & 9.999973e-01 ,9.999972e-01 ,9.999970e-01 ,9.999969e-01 ,9.999967e-01 ,&
        & 9.999966e-01 ,9.999965e-01 ,9.999963e-01 ,9.999962e-01 ,9.999960e-01 ,&
        & 9.999959e-01 ,9.999957e-01 ,9.999956e-01 ,9.999954e-01 ,9.999953e-01 ,&
        & 9.999952e-01 ,9.999950e-01 ,9.999949e-01 ,9.999947e-01 ,9.999946e-01 ,&
        & 9.999944e-01 ,9.999943e-01 ,9.999941e-01 ,9.999940e-01 ,9.999939e-01 ,&
        & 9.999937e-01 ,9.999936e-01 ,9.999934e-01 ,9.999933e-01 ,9.999931e-01 ,&
        & 9.999930e-01  /)
      ssaice3(:, 26) = (/ &

        & 9.999997e-01 ,9.999995e-01 ,9.999992e-01 ,9.999990e-01 ,9.999987e-01 ,&
        & 9.999985e-01 ,9.999983e-01 ,9.999980e-01 ,9.999978e-01 ,9.999976e-01 ,&
        & 9.999973e-01 ,9.999971e-01 ,9.999969e-01 ,9.999967e-01 ,9.999965e-01 ,&
        & 9.999963e-01 ,9.999960e-01 ,9.999958e-01 ,9.999956e-01 ,9.999954e-01 ,&
        & 9.999952e-01 ,9.999950e-01 ,9.999948e-01 ,9.999946e-01 ,9.999944e-01 ,&
        & 9.999942e-01 ,9.999939e-01 ,9.999937e-01 ,9.999935e-01 ,9.999933e-01 ,&
        & 9.999931e-01 ,9.999929e-01 ,9.999927e-01 ,9.999925e-01 ,9.999923e-01 ,&
        & 9.999920e-01 ,9.999918e-01 ,9.999916e-01 ,9.999914e-01 ,9.999911e-01 ,&
        & 9.999909e-01 ,9.999907e-01 ,9.999905e-01 ,9.999902e-01 ,9.999900e-01 ,&
        & 9.999897e-01  /)
      ssaice3(:, 27) = (/ &

        & 9.999991e-01 ,9.999985e-01 ,9.999980e-01 ,9.999974e-01 ,9.999968e-01 ,&
        & 9.999963e-01 ,9.999957e-01 ,9.999951e-01 ,9.999946e-01 ,9.999940e-01 ,&
        & 9.999934e-01 ,9.999929e-01 ,9.999923e-01 ,9.999918e-01 ,9.999912e-01 ,&
        & 9.999907e-01 ,9.999901e-01 ,9.999896e-01 ,9.999891e-01 ,9.999885e-01 ,&
        & 9.999880e-01 ,9.999874e-01 ,9.999869e-01 ,9.999863e-01 ,9.999858e-01 ,&
        & 9.999853e-01 ,9.999847e-01 ,9.999842e-01 ,9.999836e-01 ,9.999831e-01 ,&
        & 9.999826e-01 ,9.999820e-01 ,9.999815e-01 ,9.999809e-01 ,9.999804e-01 ,&
        & 9.999798e-01 ,9.999793e-01 ,9.999787e-01 ,9.999782e-01 ,9.999776e-01 ,&
        & 9.999770e-01 ,9.999765e-01 ,9.999759e-01 ,9.999754e-01 ,9.999748e-01 ,&
        & 9.999742e-01  /)
      ssaice3(:, 28) = (/ &

        & 9.999975e-01 ,9.999961e-01 ,9.999946e-01 ,9.999931e-01 ,9.999917e-01 ,&
        & 9.999903e-01 ,9.999888e-01 ,9.999874e-01 ,9.999859e-01 ,9.999845e-01 ,&
        & 9.999831e-01 ,9.999816e-01 ,9.999802e-01 ,9.999788e-01 ,9.999774e-01 ,&
        & 9.999759e-01 ,9.999745e-01 ,9.999731e-01 ,9.999717e-01 ,9.999702e-01 ,&
        & 9.999688e-01 ,9.999674e-01 ,9.999660e-01 ,9.999646e-01 ,9.999631e-01 ,&
        & 9.999617e-01 ,9.999603e-01 ,9.999589e-01 ,9.999574e-01 ,9.999560e-01 ,&
        & 9.999546e-01 ,9.999532e-01 ,9.999517e-01 ,9.999503e-01 ,9.999489e-01 ,&
        & 9.999474e-01 ,9.999460e-01 ,9.999446e-01 ,9.999431e-01 ,9.999417e-01 ,&
        & 9.999403e-01 ,9.999388e-01 ,9.999374e-01 ,9.999359e-01 ,9.999345e-01 ,&
        & 9.999330e-01  /)
      ssaice3(:, 29) = (/ &

        & 4.526500e-01 ,5.287890e-01 ,5.410487e-01 ,5.459865e-01 ,5.485149e-01 ,&
        & 5.498914e-01 ,5.505895e-01 ,5.508310e-01 ,5.507364e-01 ,5.503793e-01 ,&
        & 5.498090e-01 ,5.490612e-01 ,5.481637e-01 ,5.471395e-01 ,5.460083e-01 ,&
        & 5.447878e-01 ,5.434946e-01 ,5.421442e-01 ,5.407514e-01 ,5.393309e-01 ,&
        & 5.378970e-01 ,5.364641e-01 ,5.350464e-01 ,5.336582e-01 ,5.323140e-01 ,&
        & 5.310283e-01 ,5.298158e-01 ,5.286914e-01 ,5.276704e-01 ,5.267680e-01 ,&
        & 5.260000e-01 ,5.253823e-01 ,5.249311e-01 ,5.246629e-01 ,5.245946e-01 ,&
        & 5.247434e-01 ,5.251268e-01 ,5.257626e-01 ,5.266693e-01 ,5.278653e-01 ,&
        & 5.293698e-01 ,5.312022e-01 ,5.333823e-01 ,5.359305e-01 ,5.388676e-01 ,&
        & 5.422146e-01  /)


      asyice3(:, 16) = (/ &

        & 8.340752e-01 ,8.435170e-01 ,8.517487e-01 ,8.592064e-01 ,8.660387e-01 ,&
        & 8.723204e-01 ,8.780997e-01 ,8.834137e-01 ,8.882934e-01 ,8.927662e-01 ,&
        & 8.968577e-01 ,9.005914e-01 ,9.039899e-01 ,9.070745e-01 ,9.098659e-01 ,&
        & 9.123836e-01 ,9.146466e-01 ,9.166734e-01 ,9.184817e-01 ,9.200886e-01 ,&
        & 9.215109e-01 ,9.227648e-01 ,9.238661e-01 ,9.248304e-01 ,9.256727e-01 ,&
        & 9.264078e-01 ,9.270505e-01 ,9.276150e-01 ,9.281156e-01 ,9.285662e-01 ,&
        & 9.289806e-01 ,9.293726e-01 ,9.297557e-01 ,9.301435e-01 ,9.305491e-01 ,&
        & 9.309859e-01 ,9.314671e-01 ,9.320055e-01 ,9.326140e-01 ,9.333053e-01 ,&
        & 9.340919e-01 ,9.349861e-01 ,9.360000e-01 ,9.371451e-01 ,9.384329e-01 ,&
        & 9.398744e-01  /)
      asyice3(:, 17) = (/ &

        & 8.728160e-01 ,8.777333e-01 ,8.823754e-01 ,8.867535e-01 ,8.908785e-01 ,&
        & 8.947611e-01 ,8.984118e-01 ,9.018408e-01 ,9.050582e-01 ,9.080739e-01 ,&
        & 9.108976e-01 ,9.135388e-01 ,9.160068e-01 ,9.183106e-01 ,9.204595e-01 ,&
        & 9.224620e-01 ,9.243271e-01 ,9.260632e-01 ,9.276788e-01 ,9.291822e-01 ,&
        & 9.305817e-01 ,9.318853e-01 ,9.331012e-01 ,9.342372e-01 ,9.353013e-01 ,&
        & 9.363013e-01 ,9.372450e-01 ,9.381400e-01 ,9.389939e-01 ,9.398145e-01 ,&
        & 9.406092e-01 ,9.413856e-01 ,9.421511e-01 ,9.429131e-01 ,9.436790e-01 ,&
        & 9.444561e-01 ,9.452517e-01 ,9.460729e-01 ,9.469270e-01 ,9.478209e-01 ,&
        & 9.487617e-01 ,9.497562e-01 ,9.508112e-01 ,9.519335e-01 ,9.531294e-01 ,&
        & 9.544055e-01  /)
      asyice3(:, 18) = (/ &

        & 7.897566e-01 ,7.948704e-01 ,7.998041e-01 ,8.045623e-01 ,8.091495e-01 ,&
        & 8.135702e-01 ,8.178290e-01 ,8.219305e-01 ,8.258790e-01 ,8.296792e-01 ,&
        & 8.333355e-01 ,8.368524e-01 ,8.402343e-01 ,8.434856e-01 ,8.466108e-01 ,&
        & 8.496143e-01 ,8.525004e-01 ,8.552737e-01 ,8.579384e-01 ,8.604990e-01 ,&
        & 8.629597e-01 ,8.653250e-01 ,8.675992e-01 ,8.697867e-01 ,8.718916e-01 ,&
        & 8.739185e-01 ,8.758715e-01 ,8.777551e-01 ,8.795734e-01 ,8.813308e-01 ,&
        & 8.830315e-01 ,8.846799e-01 ,8.862802e-01 ,8.878366e-01 ,8.893534e-01 ,&
        & 8.908350e-01 ,8.922854e-01 ,8.937090e-01 ,8.951099e-01 ,8.964925e-01 ,&
        & 8.978609e-01 ,8.992192e-01 ,9.005718e-01 ,9.019229e-01 ,9.032765e-01 ,&
        & 9.046369e-01  /)
      asyice3(:, 19) = (/ &

        & 7.812615e-01 ,7.887764e-01 ,7.959664e-01 ,8.028413e-01 ,8.094109e-01 ,&
        & 8.156849e-01 ,8.216730e-01 ,8.273846e-01 ,8.328294e-01 ,8.380166e-01 ,&
        & 8.429556e-01 ,8.476556e-01 ,8.521258e-01 ,8.563753e-01 ,8.604131e-01 ,&
        & 8.642481e-01 ,8.678893e-01 ,8.713455e-01 ,8.746254e-01 ,8.777378e-01 ,&
        & 8.806914e-01 ,8.834948e-01 ,8.861566e-01 ,8.886854e-01 ,8.910897e-01 ,&
        & 8.933779e-01 ,8.955586e-01 ,8.976402e-01 ,8.996311e-01 ,9.015398e-01 ,&
        & 9.033745e-01 ,9.051436e-01 ,9.068555e-01 ,9.085185e-01 ,9.101410e-01 ,&
        & 9.117311e-01 ,9.132972e-01 ,9.148476e-01 ,9.163905e-01 ,9.179340e-01 ,&
        & 9.194864e-01 ,9.210559e-01 ,9.226505e-01 ,9.242784e-01 ,9.259476e-01 ,&
        & 9.276661e-01  /)
      asyice3(:, 20) = (/ &

        & 7.640720e-01 ,7.691119e-01 ,7.739941e-01 ,7.787222e-01 ,7.832998e-01 ,&
        & 7.877304e-01 ,7.920177e-01 ,7.961652e-01 ,8.001765e-01 ,8.040551e-01 ,&
        & 8.078044e-01 ,8.114280e-01 ,8.149294e-01 ,8.183119e-01 ,8.215791e-01 ,&
        & 8.247344e-01 ,8.277812e-01 ,8.307229e-01 ,8.335629e-01 ,8.363046e-01 ,&
        & 8.389514e-01 ,8.415067e-01 ,8.439738e-01 ,8.463560e-01 ,8.486568e-01 ,&
        & 8.508795e-01 ,8.530274e-01 ,8.551039e-01 ,8.571122e-01 ,8.590558e-01 ,&
        & 8.609378e-01 ,8.627618e-01 ,8.645309e-01 ,8.662485e-01 ,8.679178e-01 ,&
        & 8.695423e-01 ,8.711251e-01 ,8.726697e-01 ,8.741792e-01 ,8.756571e-01 ,&
        & 8.771065e-01 ,8.785307e-01 ,8.799331e-01 ,8.813169e-01 ,8.826854e-01 ,&
        & 8.840419e-01  /)
      asyice3(:, 21) = (/ &

        & 7.602598e-01 ,7.651572e-01 ,7.699014e-01 ,7.744962e-01 ,7.789452e-01 ,&
        & 7.832522e-01 ,7.874205e-01 ,7.914538e-01 ,7.953555e-01 ,7.991290e-01 ,&
        & 8.027777e-01 ,8.063049e-01 ,8.097140e-01 ,8.130081e-01 ,8.161906e-01 ,&
        & 8.192645e-01 ,8.222331e-01 ,8.250993e-01 ,8.278664e-01 ,8.305374e-01 ,&
        & 8.331153e-01 ,8.356030e-01 ,8.380037e-01 ,8.403201e-01 ,8.425553e-01 ,&
        & 8.447121e-01 ,8.467935e-01 ,8.488022e-01 ,8.507412e-01 ,8.526132e-01 ,&
        & 8.544210e-01 ,8.561675e-01 ,8.578554e-01 ,8.594875e-01 ,8.610665e-01 ,&
        & 8.625951e-01 ,8.640760e-01 ,8.655119e-01 ,8.669055e-01 ,8.682594e-01 ,&
        & 8.695763e-01 ,8.708587e-01 ,8.721094e-01 ,8.733308e-01 ,8.745255e-01 ,&
        & 8.756961e-01  /)
      asyice3(:, 22) = (/ &

        & 7.568957e-01 ,7.606995e-01 ,7.644072e-01 ,7.680204e-01 ,7.715402e-01 ,&
        & 7.749682e-01 ,7.783057e-01 ,7.815541e-01 ,7.847148e-01 ,7.877892e-01 ,&
        & 7.907786e-01 ,7.936846e-01 ,7.965084e-01 ,7.992515e-01 ,8.019153e-01 ,&
        & 8.045011e-01 ,8.070103e-01 ,8.094444e-01 ,8.118048e-01 ,8.140927e-01 ,&
        & 8.163097e-01 ,8.184571e-01 ,8.205364e-01 ,8.225488e-01 ,8.244958e-01 ,&
        & 8.263789e-01 ,8.281993e-01 ,8.299586e-01 ,8.316580e-01 ,8.332991e-01 ,&
        & 8.348831e-01 ,8.364115e-01 ,8.378857e-01 ,8.393071e-01 ,8.406770e-01 ,&
        & 8.419969e-01 ,8.432682e-01 ,8.444923e-01 ,8.456706e-01 ,8.468044e-01 ,&
        & 8.478952e-01 ,8.489444e-01 ,8.499533e-01 ,8.509234e-01 ,8.518561e-01 ,&
        & 8.527528e-01  /)
      asyice3(:, 23) = (/ &

        & 7.575066e-01 ,7.606912e-01 ,7.638236e-01 ,7.669035e-01 ,7.699306e-01 ,&
        & 7.729046e-01 ,7.758254e-01 ,7.786926e-01 ,7.815060e-01 ,7.842654e-01 ,&
        & 7.869705e-01 ,7.896211e-01 ,7.922168e-01 ,7.947574e-01 ,7.972428e-01 ,&
        & 7.996726e-01 ,8.020466e-01 ,8.043646e-01 ,8.066262e-01 ,8.088313e-01 ,&
        & 8.109796e-01 ,8.130709e-01 ,8.151049e-01 ,8.170814e-01 ,8.190001e-01 ,&
        & 8.208608e-01 ,8.226632e-01 ,8.244071e-01 ,8.260924e-01 ,8.277186e-01 ,&
        & 8.292856e-01 ,8.307932e-01 ,8.322411e-01 ,8.336291e-01 ,8.349570e-01 ,&
        & 8.362244e-01 ,8.374312e-01 ,8.385772e-01 ,8.396621e-01 ,8.406856e-01 ,&
        & 8.416476e-01 ,8.425479e-01 ,8.433861e-01 ,8.441620e-01 ,8.448755e-01 ,&
        & 8.455263e-01  /)
      asyice3(:, 24) = (/ &

        & 7.568829e-01 ,7.597947e-01 ,7.626745e-01 ,7.655212e-01 ,7.683337e-01 ,&
        & 7.711111e-01 ,7.738523e-01 ,7.765565e-01 ,7.792225e-01 ,7.818494e-01 ,&
        & 7.844362e-01 ,7.869819e-01 ,7.894854e-01 ,7.919459e-01 ,7.943623e-01 ,&
        & 7.967337e-01 ,7.990590e-01 ,8.013373e-01 ,8.035676e-01 ,8.057488e-01 ,&
        & 8.078802e-01 ,8.099605e-01 ,8.119890e-01 ,8.139645e-01 ,8.158862e-01 ,&
        & 8.177530e-01 ,8.195641e-01 ,8.213183e-01 ,8.230149e-01 ,8.246527e-01 ,&
        & 8.262308e-01 ,8.277483e-01 ,8.292042e-01 ,8.305976e-01 ,8.319275e-01 ,&
        & 8.331929e-01 ,8.343929e-01 ,8.355265e-01 ,8.365928e-01 ,8.375909e-01 ,&
        & 8.385197e-01 ,8.393784e-01 ,8.401659e-01 ,8.408815e-01 ,8.415240e-01 ,&
        & 8.420926e-01  /)
      asyice3(:, 25) = (/ &

        & 7.548616e-01 ,7.575454e-01 ,7.602153e-01 ,7.628696e-01 ,7.655067e-01 ,&
        & 7.681249e-01 ,7.707225e-01 ,7.732978e-01 ,7.758492e-01 ,7.783750e-01 ,&
        & 7.808735e-01 ,7.833430e-01 ,7.857819e-01 ,7.881886e-01 ,7.905612e-01 ,&
        & 7.928983e-01 ,7.951980e-01 ,7.974588e-01 ,7.996789e-01 ,8.018567e-01 ,&
        & 8.039905e-01 ,8.060787e-01 ,8.081196e-01 ,8.101115e-01 ,8.120527e-01 ,&
        & 8.139416e-01 ,8.157764e-01 ,8.175557e-01 ,8.192776e-01 ,8.209405e-01 ,&
        & 8.225427e-01 ,8.240826e-01 ,8.255585e-01 ,8.269688e-01 ,8.283117e-01 ,&
        & 8.295856e-01 ,8.307889e-01 ,8.319198e-01 ,8.329767e-01 ,8.339579e-01 ,&
        & 8.348619e-01 ,8.356868e-01 ,8.364311e-01 ,8.370930e-01 ,8.376710e-01 ,&
        & 8.381633e-01  /)
      asyice3(:, 26) = (/ &

        & 7.491854e-01 ,7.518523e-01 ,7.545089e-01 ,7.571534e-01 ,7.597839e-01 ,&
        & 7.623987e-01 ,7.649959e-01 ,7.675737e-01 ,7.701303e-01 ,7.726639e-01 ,&
        & 7.751727e-01 ,7.776548e-01 ,7.801084e-01 ,7.825318e-01 ,7.849230e-01 ,&
        & 7.872804e-01 ,7.896020e-01 ,7.918862e-01 ,7.941309e-01 ,7.963345e-01 ,&
        & 7.984951e-01 ,8.006109e-01 ,8.026802e-01 ,8.047009e-01 ,8.066715e-01 ,&
        & 8.085900e-01 ,8.104546e-01 ,8.122636e-01 ,8.140150e-01 ,8.157072e-01 ,&
        & 8.173382e-01 ,8.189063e-01 ,8.204096e-01 ,8.218464e-01 ,8.232148e-01 ,&
        & 8.245130e-01 ,8.257391e-01 ,8.268915e-01 ,8.279682e-01 ,8.289675e-01 ,&
        & 8.298875e-01 ,8.307264e-01 ,8.314824e-01 ,8.321537e-01 ,8.327385e-01 ,&
        & 8.332350e-01  /)
      asyice3(:, 27) = (/ &

        & 7.397086e-01 ,7.424069e-01 ,7.450955e-01 ,7.477725e-01 ,7.504362e-01 ,&
        & 7.530846e-01 ,7.557159e-01 ,7.583283e-01 ,7.609199e-01 ,7.634888e-01 ,&
        & 7.660332e-01 ,7.685512e-01 ,7.710411e-01 ,7.735009e-01 ,7.759288e-01 ,&
        & 7.783229e-01 ,7.806814e-01 ,7.830024e-01 ,7.852841e-01 ,7.875246e-01 ,&
        & 7.897221e-01 ,7.918748e-01 ,7.939807e-01 ,7.960380e-01 ,7.980449e-01 ,&
        & 7.999995e-01 ,8.019000e-01 ,8.037445e-01 ,8.055311e-01 ,8.072581e-01 ,&
        & 8.089235e-01 ,8.105255e-01 ,8.120623e-01 ,8.135319e-01 ,8.149326e-01 ,&
        & 8.162626e-01 ,8.175198e-01 ,8.187025e-01 ,8.198089e-01 ,8.208371e-01 ,&
        & 8.217852e-01 ,8.226514e-01 ,8.234338e-01 ,8.241306e-01 ,8.247399e-01 ,&
        & 8.252599e-01  /)
      asyice3(:, 28) = (/ &

        & 7.224533e-01 ,7.251681e-01 ,7.278728e-01 ,7.305654e-01 ,7.332444e-01 ,&
        & 7.359078e-01 ,7.385539e-01 ,7.411808e-01 ,7.437869e-01 ,7.463702e-01 ,&
        & 7.489291e-01 ,7.514616e-01 ,7.539661e-01 ,7.564408e-01 ,7.588837e-01 ,&
        & 7.612933e-01 ,7.636676e-01 ,7.660049e-01 ,7.683034e-01 ,7.705612e-01 ,&
        & 7.727767e-01 ,7.749480e-01 ,7.770733e-01 ,7.791509e-01 ,7.811789e-01 ,&
        & 7.831556e-01 ,7.850791e-01 ,7.869478e-01 ,7.887597e-01 ,7.905131e-01 ,&
        & 7.922062e-01 ,7.938372e-01 ,7.954044e-01 ,7.969059e-01 ,7.983399e-01 ,&
        & 7.997047e-01 ,8.009985e-01 ,8.022195e-01 ,8.033658e-01 ,8.044357e-01 ,&
        & 8.054275e-01 ,8.063392e-01 ,8.071692e-01 ,8.079157e-01 ,8.085768e-01 ,&
        & 8.091507e-01  /)
      asyice3(:, 29) = (/ &

        & 8.850026e-01 ,9.005489e-01 ,9.069242e-01 ,9.121799e-01 ,9.168987e-01 ,&
        & 9.212259e-01 ,9.252176e-01 ,9.289028e-01 ,9.323000e-01 ,9.354235e-01 ,&
        & 9.382858e-01 ,9.408985e-01 ,9.432734e-01 ,9.454218e-01 ,9.473557e-01 ,&
        & 9.490871e-01 ,9.506282e-01 ,9.519917e-01 ,9.531904e-01 ,9.542374e-01 ,&
        & 9.551461e-01 ,9.559298e-01 ,9.566023e-01 ,9.571775e-01 ,9.576692e-01 ,&
        & 9.580916e-01 ,9.584589e-01 ,9.587853e-01 ,9.590851e-01 ,9.593729e-01 ,&
        & 9.596632e-01 ,9.599705e-01 ,9.603096e-01 ,9.606954e-01 ,9.611427e-01 ,&
        & 9.616667e-01 ,9.622826e-01 ,9.630060e-01 ,9.638524e-01 ,9.648379e-01 ,&
        & 9.659788e-01 ,9.672916e-01 ,9.687933e-01 ,9.705014e-01 ,9.724337e-01 ,&
        & 9.746084e-01  /)


      fdlice3(:, 16) = (/ &

        & 4.959277e-02 ,4.685292e-02 ,4.426104e-02 ,4.181231e-02 ,3.950191e-02 ,&
        & 3.732500e-02 ,3.527675e-02 ,3.335235e-02 ,3.154697e-02 ,2.985578e-02 ,&
        & 2.827395e-02 ,2.679666e-02 ,2.541909e-02 ,2.413640e-02 ,2.294378e-02 ,&
        & 2.183639e-02 ,2.080940e-02 ,1.985801e-02 ,1.897736e-02 ,1.816265e-02 ,&
        & 1.740905e-02 ,1.671172e-02 ,1.606585e-02 ,1.546661e-02 ,1.490917e-02 ,&
        & 1.438870e-02 ,1.390038e-02 ,1.343939e-02 ,1.300089e-02 ,1.258006e-02 ,&
        & 1.217208e-02 ,1.177212e-02 ,1.137536e-02 ,1.097696e-02 ,1.057210e-02 ,&
        & 1.015596e-02 ,9.723704e-03 ,9.270516e-03 ,8.791565e-03 ,8.282026e-03 ,&
        & 7.737072e-03 ,7.151879e-03 ,6.521619e-03 ,5.841467e-03 ,5.106597e-03 ,&
        & 4.312183e-03  /)
      fdlice3(:, 17) = (/ &

        & 5.071224e-02 ,5.000217e-02 ,4.933872e-02 ,4.871992e-02 ,4.814380e-02 ,&
        & 4.760839e-02 ,4.711170e-02 ,4.665177e-02 ,4.622662e-02 ,4.583426e-02 ,&
        & 4.547274e-02 ,4.514007e-02 ,4.483428e-02 ,4.455340e-02 ,4.429544e-02 ,&
        & 4.405844e-02 ,4.384041e-02 ,4.363939e-02 ,4.345340e-02 ,4.328047e-02 ,&
        & 4.311861e-02 ,4.296586e-02 ,4.282024e-02 ,4.267977e-02 ,4.254248e-02 ,&
        & 4.240640e-02 ,4.226955e-02 ,4.212995e-02 ,4.198564e-02 ,4.183462e-02 ,&
        & 4.167494e-02 ,4.150462e-02 ,4.132167e-02 ,4.112413e-02 ,4.091003e-02 ,&
        & 4.067737e-02 ,4.042420e-02 ,4.014854e-02 ,3.984840e-02 ,3.952183e-02 ,&
        & 3.916683e-02 ,3.878144e-02 ,3.836368e-02 ,3.791158e-02 ,3.742316e-02 ,&
        & 3.689645e-02  /)
      fdlice3(:, 18) = (/ &

        & 1.062938e-01 ,1.065234e-01 ,1.067822e-01 ,1.070682e-01 ,1.073793e-01 ,&
        & 1.077137e-01 ,1.080693e-01 ,1.084442e-01 ,1.088364e-01 ,1.092439e-01 ,&
        & 1.096647e-01 ,1.100970e-01 ,1.105387e-01 ,1.109878e-01 ,1.114423e-01 ,&
        & 1.119004e-01 ,1.123599e-01 ,1.128190e-01 ,1.132757e-01 ,1.137279e-01 ,&
        & 1.141738e-01 ,1.146113e-01 ,1.150385e-01 ,1.154534e-01 ,1.158540e-01 ,&
        & 1.162383e-01 ,1.166045e-01 ,1.169504e-01 ,1.172741e-01 ,1.175738e-01 ,&
        & 1.178472e-01 ,1.180926e-01 ,1.183080e-01 ,1.184913e-01 ,1.186405e-01 ,&
        & 1.187538e-01 ,1.188291e-01 ,1.188645e-01 ,1.188580e-01 ,1.188076e-01 ,&
        & 1.187113e-01 ,1.185672e-01 ,1.183733e-01 ,1.181277e-01 ,1.178282e-01 ,&
        & 1.174731e-01  /)
      fdlice3(:, 19) = (/ &

        & 1.076195e-01 ,1.065195e-01 ,1.054696e-01 ,1.044673e-01 ,1.035099e-01 ,&
        & 1.025951e-01 ,1.017203e-01 ,1.008831e-01 ,1.000808e-01 ,9.931116e-02 ,&
        & 9.857151e-02 ,9.785939e-02 ,9.717230e-02 ,9.650774e-02 ,9.586322e-02 ,&
        & 9.523623e-02 ,9.462427e-02 ,9.402484e-02 ,9.343544e-02 ,9.285358e-02 ,&
        & 9.227675e-02 ,9.170245e-02 ,9.112818e-02 ,9.055144e-02 ,8.996974e-02 ,&
        & 8.938056e-02 ,8.878142e-02 ,8.816981e-02 ,8.754323e-02 ,8.689919e-02 ,&
        & 8.623517e-02 ,8.554869e-02 ,8.483724e-02 ,8.409832e-02 ,8.332943e-02 ,&
        & 8.252807e-02 ,8.169175e-02 ,8.081795e-02 ,7.990419e-02 ,7.894796e-02 ,&
        & 7.794676e-02 ,7.689809e-02 ,7.579945e-02 ,7.464834e-02 ,7.344227e-02 ,&
        & 7.217872e-02  /)
      fdlice3(:, 20) = (/ &

        & 1.119014e-01 ,1.122706e-01 ,1.126690e-01 ,1.130947e-01 ,1.135456e-01 ,&
        & 1.140199e-01 ,1.145154e-01 ,1.150302e-01 ,1.155623e-01 ,1.161096e-01 ,&
        & 1.166703e-01 ,1.172422e-01 ,1.178233e-01 ,1.184118e-01 ,1.190055e-01 ,&
        & 1.196025e-01 ,1.202008e-01 ,1.207983e-01 ,1.213931e-01 ,1.219832e-01 ,&
        & 1.225665e-01 ,1.231411e-01 ,1.237050e-01 ,1.242561e-01 ,1.247926e-01 ,&
        & 1.253122e-01 ,1.258132e-01 ,1.262934e-01 ,1.267509e-01 ,1.271836e-01 ,&
        & 1.275896e-01 ,1.279669e-01 ,1.283134e-01 ,1.286272e-01 ,1.289063e-01 ,&
        & 1.291486e-01 ,1.293522e-01 ,1.295150e-01 ,1.296351e-01 ,1.297104e-01 ,&
        & 1.297390e-01 ,1.297189e-01 ,1.296480e-01 ,1.295244e-01 ,1.293460e-01 ,&
        & 1.291109e-01  /)
      fdlice3(:, 21) = (/ &

        & 1.133298e-01 ,1.136777e-01 ,1.140556e-01 ,1.144615e-01 ,1.148934e-01 ,&
        & 1.153492e-01 ,1.158269e-01 ,1.163243e-01 ,1.168396e-01 ,1.173706e-01 ,&
        & 1.179152e-01 ,1.184715e-01 ,1.190374e-01 ,1.196108e-01 ,1.201897e-01 ,&
        & 1.207720e-01 ,1.213558e-01 ,1.219389e-01 ,1.225194e-01 ,1.230951e-01 ,&
        & 1.236640e-01 ,1.242241e-01 ,1.247733e-01 ,1.253096e-01 ,1.258309e-01 ,&
        & 1.263352e-01 ,1.268205e-01 ,1.272847e-01 ,1.277257e-01 ,1.281415e-01 ,&
        & 1.285300e-01 ,1.288893e-01 ,1.292173e-01 ,1.295118e-01 ,1.297710e-01 ,&
        & 1.299927e-01 ,1.301748e-01 ,1.303154e-01 ,1.304124e-01 ,1.304637e-01 ,&
        & 1.304673e-01 ,1.304212e-01 ,1.303233e-01 ,1.301715e-01 ,1.299638e-01 ,&
        & 1.296983e-01  /)
      fdlice3(:, 22) = (/ &

        & 1.145360e-01 ,1.153256e-01 ,1.161453e-01 ,1.169929e-01 ,1.178666e-01 ,&
        & 1.187641e-01 ,1.196835e-01 ,1.206227e-01 ,1.215796e-01 ,1.225522e-01 ,&
        & 1.235383e-01 ,1.245361e-01 ,1.255433e-01 ,1.265579e-01 ,1.275779e-01 ,&
        & 1.286011e-01 ,1.296257e-01 ,1.306494e-01 ,1.316703e-01 ,1.326862e-01 ,&
        & 1.336951e-01 ,1.346950e-01 ,1.356838e-01 ,1.366594e-01 ,1.376198e-01 ,&
        & 1.385629e-01 ,1.394866e-01 ,1.403889e-01 ,1.412678e-01 ,1.421212e-01 ,&
        & 1.429469e-01 ,1.437430e-01 ,1.445074e-01 ,1.452381e-01 ,1.459329e-01 ,&
        & 1.465899e-01 ,1.472069e-01 ,1.477819e-01 ,1.483128e-01 ,1.487976e-01 ,&
        & 1.492343e-01 ,1.496207e-01 ,1.499548e-01 ,1.502346e-01 ,1.504579e-01 ,&
        & 1.506227e-01  /)
      fdlice3(:, 23) = (/ &

        & 1.153263e-01 ,1.161445e-01 ,1.169932e-01 ,1.178703e-01 ,1.187738e-01 ,&
        & 1.197016e-01 ,1.206516e-01 ,1.216217e-01 ,1.226099e-01 ,1.236141e-01 ,&
        & 1.246322e-01 ,1.256621e-01 ,1.267017e-01 ,1.277491e-01 ,1.288020e-01 ,&
        & 1.298584e-01 ,1.309163e-01 ,1.319736e-01 ,1.330281e-01 ,1.340778e-01 ,&
        & 1.351207e-01 ,1.361546e-01 ,1.371775e-01 ,1.381873e-01 ,1.391820e-01 ,&
        & 1.401593e-01 ,1.411174e-01 ,1.420540e-01 ,1.429671e-01 ,1.438547e-01 ,&
        & 1.447146e-01 ,1.455449e-01 ,1.463433e-01 ,1.471078e-01 ,1.478364e-01 ,&
        & 1.485270e-01 ,1.491774e-01 ,1.497857e-01 ,1.503497e-01 ,1.508674e-01 ,&
        & 1.513367e-01 ,1.517554e-01 ,1.521216e-01 ,1.524332e-01 ,1.526880e-01 ,&
        & 1.528840e-01  /)
      fdlice3(:, 24) = (/ &

        & 1.160842e-01 ,1.169118e-01 ,1.177697e-01 ,1.186556e-01 ,1.195676e-01 ,&
        & 1.205036e-01 ,1.214616e-01 ,1.224394e-01 ,1.234349e-01 ,1.244463e-01 ,&
        & 1.254712e-01 ,1.265078e-01 ,1.275539e-01 ,1.286075e-01 ,1.296664e-01 ,&
        & 1.307287e-01 ,1.317923e-01 ,1.328550e-01 ,1.339149e-01 ,1.349699e-01 ,&
        & 1.360179e-01 ,1.370567e-01 ,1.380845e-01 ,1.390991e-01 ,1.400984e-01 ,&
        & 1.410803e-01 ,1.420429e-01 ,1.429840e-01 ,1.439016e-01 ,1.447936e-01 ,&
        & 1.456579e-01 ,1.464925e-01 ,1.472953e-01 ,1.480642e-01 ,1.487972e-01 ,&
        & 1.494923e-01 ,1.501472e-01 ,1.507601e-01 ,1.513287e-01 ,1.518511e-01 ,&
        & 1.523252e-01 ,1.527489e-01 ,1.531201e-01 ,1.534368e-01 ,1.536969e-01 ,&
        & 1.538984e-01  /)
      fdlice3(:, 25) = (/ &

        & 1.168725e-01 ,1.177088e-01 ,1.185747e-01 ,1.194680e-01 ,1.203867e-01 ,&
        & 1.213288e-01 ,1.222923e-01 ,1.232750e-01 ,1.242750e-01 ,1.252903e-01 ,&
        & 1.263187e-01 ,1.273583e-01 ,1.284069e-01 ,1.294626e-01 ,1.305233e-01 ,&
        & 1.315870e-01 ,1.326517e-01 ,1.337152e-01 ,1.347756e-01 ,1.358308e-01 ,&
        & 1.368788e-01 ,1.379175e-01 ,1.389449e-01 ,1.399590e-01 ,1.409577e-01 ,&
        & 1.419389e-01 ,1.429007e-01 ,1.438410e-01 ,1.447577e-01 ,1.456488e-01 ,&
        & 1.465123e-01 ,1.473461e-01 ,1.481483e-01 ,1.489166e-01 ,1.496492e-01 ,&
        & 1.503439e-01 ,1.509988e-01 ,1.516118e-01 ,1.521808e-01 ,1.527038e-01 ,&
        & 1.531788e-01 ,1.536037e-01 ,1.539764e-01 ,1.542951e-01 ,1.545575e-01 ,&
        & 1.547617e-01  /)
      fdlice3(:, 26) = (/ &

        & 1.180509e-01 ,1.189025e-01 ,1.197820e-01 ,1.206875e-01 ,1.216171e-01 ,&
        & 1.225687e-01 ,1.235404e-01 ,1.245303e-01 ,1.255363e-01 ,1.265564e-01 ,&
        & 1.275888e-01 ,1.286313e-01 ,1.296821e-01 ,1.307392e-01 ,1.318006e-01 ,&
        & 1.328643e-01 ,1.339284e-01 ,1.349908e-01 ,1.360497e-01 ,1.371029e-01 ,&
        & 1.381486e-01 ,1.391848e-01 ,1.402095e-01 ,1.412208e-01 ,1.422165e-01 ,&
        & 1.431949e-01 ,1.441539e-01 ,1.450915e-01 ,1.460058e-01 ,1.468947e-01 ,&
        & 1.477564e-01 ,1.485888e-01 ,1.493900e-01 ,1.501580e-01 ,1.508907e-01 ,&
        & 1.515864e-01 ,1.522428e-01 ,1.528582e-01 ,1.534305e-01 ,1.539578e-01 ,&
        & 1.544380e-01 ,1.548692e-01 ,1.552494e-01 ,1.555767e-01 ,1.558490e-01 ,&
        & 1.560645e-01  /)
      fdlice3(:, 27) = (/ &

        & 1.200480e-01 ,1.209267e-01 ,1.218304e-01 ,1.227575e-01 ,1.237059e-01 ,&
        & 1.246739e-01 ,1.256595e-01 ,1.266610e-01 ,1.276765e-01 ,1.287041e-01 ,&
        & 1.297420e-01 ,1.307883e-01 ,1.318412e-01 ,1.328988e-01 ,1.339593e-01 ,&
        & 1.350207e-01 ,1.360813e-01 ,1.371393e-01 ,1.381926e-01 ,1.392396e-01 ,&
        & 1.402783e-01 ,1.413069e-01 ,1.423235e-01 ,1.433263e-01 ,1.443134e-01 ,&
        & 1.452830e-01 ,1.462332e-01 ,1.471622e-01 ,1.480681e-01 ,1.489490e-01 ,&
        & 1.498032e-01 ,1.506286e-01 ,1.514236e-01 ,1.521863e-01 ,1.529147e-01 ,&
        & 1.536070e-01 ,1.542614e-01 ,1.548761e-01 ,1.554491e-01 ,1.559787e-01 ,&
        & 1.564629e-01 ,1.568999e-01 ,1.572879e-01 ,1.576249e-01 ,1.579093e-01 ,&
        & 1.581390e-01  /)
      fdlice3(:, 28) = (/ &

        & 1.247813e-01 ,1.256496e-01 ,1.265417e-01 ,1.274560e-01 ,1.283905e-01 ,&
        & 1.293436e-01 ,1.303135e-01 ,1.312983e-01 ,1.322964e-01 ,1.333060e-01 ,&
        & 1.343252e-01 ,1.353523e-01 ,1.363855e-01 ,1.374231e-01 ,1.384632e-01 ,&
        & 1.395042e-01 ,1.405441e-01 ,1.415813e-01 ,1.426140e-01 ,1.436404e-01 ,&
        & 1.446587e-01 ,1.456672e-01 ,1.466640e-01 ,1.476475e-01 ,1.486157e-01 ,&
        & 1.495671e-01 ,1.504997e-01 ,1.514117e-01 ,1.523016e-01 ,1.531673e-01 ,&
        & 1.540073e-01 ,1.548197e-01 ,1.556026e-01 ,1.563545e-01 ,1.570734e-01 ,&
        & 1.577576e-01 ,1.584054e-01 ,1.590149e-01 ,1.595843e-01 ,1.601120e-01 ,&
        & 1.605962e-01 ,1.610349e-01 ,1.614266e-01 ,1.617693e-01 ,1.620614e-01 ,&
        & 1.623011e-01  /)
      fdlice3(:, 29) = (/ &

        & 1.006055e-01 ,9.549582e-02 ,9.063960e-02 ,8.602900e-02 ,8.165612e-02 ,&
        & 7.751308e-02 ,7.359199e-02 ,6.988496e-02 ,6.638412e-02 ,6.308156e-02 ,&
        & 5.996942e-02 ,5.703979e-02 ,5.428481e-02 ,5.169657e-02 ,4.926719e-02 ,&
        & 4.698880e-02 ,4.485349e-02 ,4.285339e-02 ,4.098061e-02 ,3.922727e-02 ,&
        & 3.758547e-02 ,3.604733e-02 ,3.460497e-02 ,3.325051e-02 ,3.197604e-02 ,&
        & 3.077369e-02 ,2.963558e-02 ,2.855381e-02 ,2.752050e-02 ,2.652776e-02 ,&
        & 2.556772e-02 ,2.463247e-02 ,2.371415e-02 ,2.280485e-02 ,2.189670e-02 ,&
        & 2.098180e-02 ,2.005228e-02 ,1.910024e-02 ,1.811781e-02 ,1.709709e-02 ,&
        & 1.603020e-02 ,1.490925e-02 ,1.372635e-02 ,1.247363e-02 ,1.114319e-02 ,&
        & 9.727157e-03  /)

      end subroutine swcldpr

      end module rrtmg_sw_init_f

      module rrtmg_sw_spcvmc_f



      use parrrsw_f, only : nbndsw, ngptsw, mxmol, jpband, mxlay
      use rrsw_tbl_f, only : tblint, bpade, od_lo, exp_tbl
      use rrsw_vsn_f, only : hvrspc, hnamspc
      use rrsw_wvn_f, only : ngc, ngs, ngb
      
      use rrtmg_sw_taumol_f, only: taumol_sw
     
      implicit none

      contains


      subroutine spcvmc_sw &
            (cc,tncol, ncol, nlayers, istart, iend, icpr, idelm, iout, &
             pavel, tavel, pz, tz, tbound, palbd, palbp, &
             pcldfmc, ptaucmc, pasycmc, pomgcmc, ptaormc, &
             ptaua, pasya, pomga, prmu0, coldry,  adjflux, &
             laytrop, layswtch, laylow, jp, jt, jt1, &
             co2mult, colch4, colco2, colh2o, colmol, coln2o, colo2, colo3, &
             fac00, fac01, fac10, fac11, &
             selffac, selffrac, indself, forfac, forfrac, indfor, &
             pbbfd, pbbfu, pbbcd, pbbcu, puvfd, puvcd, pnifd, pnicd, &
             pbbfddir, pbbcddir, puvfddir, puvcddir, pnifddir, pnicddir, &
             zgco,zomco,zrdnd,zref,zrefo,zrefd,zrefdo,ztauo,zdbt,ztdbt, &
             ztra,ztrao,ztrad,ztrado,zfd,zfu,ztaug, ztaur, zsflxzen)




































      integer , intent(in) :: tncol, ncol,cc
      integer , intent(in) :: nlayers
      integer , intent(in) :: istart
      integer , intent(in) :: iend
      integer , intent(in) :: icpr
      integer , intent(in) :: idelm   
                                              
                                              
      integer , intent(in) :: iout
      integer , intent(in) :: laytrop(:)
      integer , intent(in) :: layswtch(:)
      integer , intent(in) :: laylow(:)

      integer , intent(in) :: indfor(:,:) 
      integer , intent(in) :: indself(:,:) 
      integer , intent(in) :: jp(:,:) 
      integer , intent(in) :: jt(:,:) 
      integer , intent(in) :: jt1(:,:) 
                                                          

      real , intent(in) :: pavel(:,:)                     
                                                          
      real , intent(in) :: tavel(:,:)                     
                                                          
      real , intent(in) :: pz(:,0:)                       
                                                          
      real , intent(in) :: tz(:,0:)                       
                                                          
      real , intent(in) :: tbound(:)                      
                                                          
      real , intent(in) :: coldry(:,:)                    
                                                          
      real , intent(in) :: colmol(:,:) 
                                                          
      real , intent(in) :: adjflux(:)                     
                                                          

      real , intent(in) :: palbd(:,:)                     
                                                          
      real , intent(in) :: palbp(:,:)                     
                                                          
      real , intent(in) :: prmu0(:)                       
                                                          

      real , intent(in) :: pCLDFMC(:,:,:)                 
      real , intent(in) :: pTAUCMC(:,:,:)                 
      real , intent(in) :: pASYCMC(:,:,:)                 
      real , intent(in) :: pOMGCMC(:,:,:)                 
      real , intent(in) :: pTAORMC(:,:,:)                 
                                                          
   
      real , intent(in) :: pTAUA(:,:,:)                   
      real , intent(in) :: pASYA(:,:,:)                   
      real , intent(in) :: pOMGA(:,:,:)                   
                                                          
                                                               
      real , intent(in) :: colh2o(:,:) 
      real , intent(in) :: colco2(:,:) 
      real , intent(in) :: colch4(:,:) 
      real , intent(in) :: co2mult(:,:) 
      real , intent(in) :: colo3(:,:) 
      real , intent(in) :: colo2(:,:) 
      real , intent(in) :: coln2o(:,:) 
                                                          

      real , intent(in) :: forfac(:,:) 
      real , intent(in) :: forfrac(:,:) 
      real , intent(in) :: selffac(:,:) 
      real , intent(in) :: selffrac(:,:) 
      real , intent(in) :: fac00(:,:) 
      real , intent(in) :: fac01(:,:) 
      real , intent(in) :: fac10(:,:) 
      real , intent(in) :: fac11(:,:) 
                                                          
                                                               
      real, intent(inout)   :: zgco(tncol,ngptsw,nlayers+1), zomco(tncol,ngptsw,nlayers+1)  
      real, intent(inout)   :: zrdnd(tncol,ngptsw,nlayers+1) 
      real, intent(inout)   :: zref(tncol,ngptsw,nlayers+1)  , zrefo(tncol,ngptsw,nlayers+1)  
      real, intent(inout)   :: zrefd(tncol,ngptsw,nlayers+1)  , zrefdo(tncol,ngptsw,nlayers+1)  
      real, intent(inout)   :: ztauo(tncol,ngptsw,nlayers)  
      real, intent(inout)   :: zdbt(tncol,ngptsw,nlayers+1)  ,ztdbt(tncol,ngptsw,nlayers+1)   
      real, intent(inout)   :: ztra(tncol,ngptsw,nlayers+1)  , ztrao(tncol,ngptsw,nlayers+1)  
      real, intent(inout)   :: ztrad(tncol,ngptsw,nlayers+1)  , ztrado(tncol,ngptsw,nlayers+1)  
      real, intent(inout)   :: zfd(tncol,ngptsw,nlayers+1)  , zfu(tncol,ngptsw,nlayers+1)   
real   :: zcd(tncol,ngptsw,nlayers+1)  , zcu(tncol,ngptsw,nlayers+1)   
      real, intent(inout)  :: ztaur(tncol,nlayers,ngptsw), ztaug(tncol,nlayers,ngptsw) 
      real, intent(inout)  :: zsflxzen(tncol,ngptsw)
   


                                                               
      real , intent(out) :: pbbcd(:,:) 
      real , intent(out) :: pbbcu(:,:) 
      real , intent(out) :: pbbfd(:,:) 
      real , intent(out) :: pbbfu(:,:) 
      real , intent(out) :: pbbfddir(:,:) 
      real , intent(out) :: pbbcddir(:,:) 

      real , intent(out) :: puvcd(:,:) 
      real , intent(out) :: puvfd(:,:) 
      real , intent(out) :: puvcddir(:,:) 
      real , intent(out) :: puvfddir(:,:) 

      real , intent(out) :: pnicd(:,:) 
      real , intent(out) :: pnifd(:,:) 
      real , intent(out) :: pnicddir(:,:) 
      real , intent(out) :: pnifddir(:,:) 
      

  
      integer   :: klev
      integer  :: ibm, ikl, ikp, ikx
      integer  :: iw, jb, jg, jl, jk

      integer  :: itind

      real  :: tblind, ze1
      real  :: zclear, zcloud
        
      real  :: zincflx, ze2

      real  :: zdbtmc, zdbtmo, zf, zgw, zreflect
      real  :: zwf, tauorig, repclc

      real :: zdbt_nodel(tncol,ngptsw,nlayers+1)
      real :: zdbtc_nodel(tncol,ngptsw,nlayers+1)
      real :: ztdbt_nodel(tncol,ngptsw,nlayers+1)
      real :: ztdbtc_nodel(tncol,ngptsw,nlayers+1)



  
      integer :: iplon



!$acc update host(pomga, ptaua)
  




!$acc kernels     
         pbbcd =0. 
         pbbcu =0. 
         pbbfd =0. 
         pbbfu =0. 
         pbbcddir =0. 
         pbbfddir =0. 
         puvcd =0. 
         puvfd =0. 
         puvcddir =0. 
         puvfddir =0. 
         pnicd =0. 
         pnifd =0. 
         pnicddir =0. 
         pnifddir =0.
         zsflxzen = 0.






         klev = nlayers
!$acc end kernels      


         

      call taumol_sw(8,nlayers, &
                     colh2o , colco2 , colch4 , colo2 , &
                     colo3 , colmol , &
                     laytrop , jp , jt , jt1 , &
                     fac00 , fac01 , fac10 , fac11 , &
                     selffac , selffrac , indself , forfac , forfrac ,&
                     indfor , &
                     zsflxzen , ztaug, ztaur)

      
      repclc = 1.e-12 


   
!$acc kernels 

      
      do iw = 1, 112

        
        do iplon = 1, 8



          jb = ngb(iw)
          ibm = jb-15
          


           
          ztdbtc_nodel(iplon,iw,1)=1.0  
           


          ztrao(iplon,iw,klev+1)   =0.0 
          ztrado(iplon,iw,klev+1)  =0.0 
          zrefo(iplon,iw,klev+1)   =palbp(iplon,ibm) 
          zrefdo(iplon,iw,klev+1)  =palbd(iplon,ibm) 
           


          ztdbt(iplon,iw,1)  =1.0 
          ztdbt_nodel(iplon,iw,1)=1.0

    

          zdbt(iplon,iw,klev+1)   =0.0 
          ztra(iplon,iw,klev+1)   =0.0 
          ztrad(iplon,iw,klev+1)  =0.0 
          zref(iplon,iw,klev+1)   =palbp(iplon,ibm) 
          zrefd(iplon,iw,klev+1)  =palbd(iplon,ibm) 
    
        enddo
      enddo

!$acc end kernels     


!$acc kernels loop 

       
!$acc loop private(zf, zwf, ibm, ikl, jb)
         
            !$acc loop seq
            do jk=1,klev

               ikl=klev+1-jk
       do iw = 1, 112
               jb = ngb(iw)
               ibm = jb-15
         do iplon = 1, 8
               
               ztauo(iplon,iw,jk)   = ztaur(iplon,ikl,iw)  + ztaug(iplon,ikl,iw) + pTAUA(iplon,ibm,ikl)      



               zclear = 1.0  - pCLDFMC(iplon,iw,ikl)
               zcloud =  pCLDFMC(iplon,iw,ikl)

               ze1 = ztauo(iplon,iw,jk) / prmu0(iplon)  
               if (ze1 .le. od_lo) then
                  zdbtmc = 1. - ze1 + 0.5 * ze1 * ze1
               else
                  tblind = ze1 / (bpade + ze1)
                  itind = tblint * tblind + 0.5
                  zdbtmc = exp_tbl(itind)
               endif

               zdbtc_nodel(iplon,iw,jk) = zdbtmc
               ztdbtc_nodel(iplon,iw,jk+1) = zdbtc_nodel(iplon,iw,jk) * ztdbtc_nodel(iplon,iw,jk)

               tauorig = ztauo(iplon,iw,jk) + pTAORMC(iplon,iw,ikl)    
               ze1 = tauorig / prmu0(iplon)
               if (ze1 .le. od_lo) then
                  zdbtmo = 1. - ze1 + 0.5 * ze1 * ze1
               else
                  tblind = ze1 / (bpade + ze1)
                  itind = tblint * tblind + 0.5
                  zdbtmo = exp_tbl(itind)
               endif

               zdbt_nodel(iplon,iw,jk) = zclear*zdbtmc + zcloud*zdbtmo
               ztdbt_nodel(iplon,iw,jk+1) = zdbt_nodel(iplon,iw,jk) * ztdbt_nodel(iplon,iw,jk)


               zomco(iplon,iw,jk)   = ztaur(iplon,ikl,iw) + pTAUA(iplon,ibm,ikl) * pOMGA(iplon,ibm,ikl)
               zgco(iplon,iw,jk) = pASYA(iplon,ibm,ikl) * pOMGA(iplon,ibm,ikl) * pTAUA(iplon,ibm,ikl) / zomco(iplon,iw,jk)   
               zomco(iplon,iw,jk)   = zomco(iplon,iw,jk) / ztauo(iplon,iw,jk)
               
               zf = zgco(iplon, iw, jk)
               zf = zf * zf
               zwf = zomco(iplon, iw, jk) * zf

               ztauo(iplon, iw, jk) = (1.0 - zwf) * ztauo(iplon, iw, jk)
               zomco(iplon, iw, jk) = (zomco(iplon, iw, jk) - zwf) / (1.0 - zwf)
               zgco(iplon, iw, jk) = (zgco(iplon, iw, jk) - zf) / (1.0 - zf)
               
           end do    
        end do
      end do
!$acc end kernels               



      call reftra_sw (8, nlayers, &
                      pcldfmc, zgco, prmu0, ztauo, zomco, &
                      zrefo, zrefdo, ztrao, ztrado, 1)
                        

!$acc kernels loop    
       



!$acc loop
       
            
!$acc loop seq
            do jk=1,klev

       do iw = 1, 112
       do iplon = 1, 8

               



               ze1 = (ztauo(iplon,iw,jk))  / prmu0(iplon)      
               ze1 = ztauo(iplon,iw,jk) / prmu0(iplon)
               if (ze1 .le. od_lo) then
                  zdbtmc = 1. - ze1 + 0.5 * ze1 * ze1
               else
                  tblind = ze1 / (bpade + ze1)
                  itind = tblint * tblind + 0.5
                  zdbtmc = exp_tbl(itind)
               endif
               zdbt(iplon,iw,jk)   = zdbtmc
               ztdbt(iplon,iw,jk+1)   = zdbt(iplon,iw,jk)  *ztdbt(iplon,iw,jk)  

           end do          
        end do
      end do
!$acc end kernels



                 


!$acc kernels 
       
        
       do iw = 1, 112
          jb = ngb(iw)
          ibm = jb-15
        do iplon = 1, 8




          zgco(iplon,iw,klev+1)   =palbp(iplon,ibm) 
          zomco(iplon,iw,klev+1)  =palbd(iplon,ibm) 
    
        end do
      end do
!$acc end kernels  


            call vrtqdr_sw(8, klev, &
                           zrefo  , zrefdo  , ztrao  , ztrado  , &
                           zdbt , zrdnd  , zgco, zomco, ztdbt  , &
                           zcd , zcu  , ztra)
            

!$acc kernels loop
       
    
!$acc loop    
        do ikl=1,klev+1
            
      !$acc loop seq
          do iw = 1, 112
             jb = ngb(iw)
      
             jk=klev+2-ikl
             ibm = jb-15
!DIR$ SIMD
          do iplon = 1, 8
             zincflx = adjflux(jb)  * zsflxzen(iplon,iw)   * prmu0(iplon)           


              
             pbbcu(iplon,ikl)  = pbbcu(iplon,ikl)  + zincflx*zcu(iplon,iw,jk)  
             pbbcd(iplon,ikl)  = pbbcd(iplon,ikl)  + zincflx*zcd(iplon,iw,jk)  
             pbbcddir(iplon,ikl)  = pbbcddir(iplon,ikl)  + zincflx*ztdbtc_nodel(iplon,iw,jk)  
              


             if (ibm >= 10 .and. ibm <= 13) then
                puvcd(iplon,ikl)  = puvcd(iplon,ikl)  + zincflx*zcd(iplon,iw,jk)  
                puvcddir(iplon,ikl)  = puvcddir(iplon,ikl)  + zincflx*ztdbtc_nodel(iplon,iw,jk)  
                 

             else if (ibm == 14 .or. ibm <= 9) then  
                pnicd(iplon,ikl)  = pnicd(iplon,ikl)  + zincflx*zcd(iplon,iw,jk)  
                pnicddir(iplon,ikl)  = pnicddir(iplon,ikl)  + zincflx*ztdbtc_nodel(iplon,iw,jk)  
                 
             endif

          enddo          


        enddo


      enddo               
!$acc end kernels



      if (cc==2) then

!$acc kernels 
        
          
            do jk=1,klev

               ikl=klev+1-jk
          do iw = 1, 112
               jb = ngb(iw)
               ibm = jb-15
!DIR$ SIMD
           do iplon = 1, 8
               
               
               ze1 = ztaur(iplon,ikl,iw) + pTAUA(iplon,ibm,ikl) * pOMGA(iplon, ibm, ikl) 
               ze2 = pASYA(iplon, ibm, ikl) * pOMGA(iplon, ibm, ikl) * pTAUA(iplon, ibm, ikl) / ze1
               ze1 = ze1/ (ztaur(iplon,ikl,iw)  + ztaug(iplon,ikl,iw) + pTAUA(iplon,ibm,ikl)  )
               
               
               zf = ze2*ze2
               zwf = ze1*zf
               ze1 = (ze1 - zwf) / (1.0 - zwf)
               ze2 = (ze2 - zf) / (1.0 - zf)

               
               zomco(iplon,iw,jk)   = (ztauo(iplon,iw,jk) * ze1  + pTAUCMC(iplon,iw,ikl)  * pOMGCMC(iplon,iw,ikl))
               
               zgco(iplon, iw, jk) =  (pTAUCMC(iplon,iw,ikl)  * pOMGCMC(iplon,iw,ikl)  * pASYCMC(iplon,iw,ikl) ) + &
                                      (ztauo(iplon, iw, jk) * ze1 * ze2)
               
               ztauo(iplon,iw,jk)   = ztauo(iplon,iw,jk) + pTAUCMC(iplon,iw,ikl) 

               zgco(iplon,iw,jk)   = zgco(iplon, iw, jk) / zomco(iplon, iw, jk)
               zomco(iplon,iw,jk)  = zomco(iplon,iw,jk) / ztauo(iplon,iw,jk)
             
            end do    
          end do
        end do
!$acc end kernels



        call reftra_sw (8, nlayers, &
                        pcldfmc, zgco, prmu0, ztauo, zomco, &
                        zref, zrefd, ztra, ztrad, 0)
            

        klev = nlayers


!$acc kernels loop    
        

!$acc loop
          
            
!$acc loop seq
            do jk=1,klev


               ikl = klev+1-jk 
          do iw = 1, 112
            do iplon = 1, 8
               zclear = 1.0  - pCLDFMC(iplon,iw,ikl) 
               zcloud = pCLDFMC(iplon,iw,ikl) 

               zref(iplon,iw,jk)   = zclear*zrefo(iplon,iw,jk)   + zcloud*zref(iplon,iw,jk)  
               zrefd(iplon,iw,jk)  = zclear*zrefdo(iplon,iw,jk)   + zcloud*zrefd(iplon,iw,jk)  
               ztra(iplon,iw,jk)   = zclear*ztrao(iplon,iw,jk)   + zcloud*ztra(iplon,iw,jk)  
               ztrad(iplon,iw,jk)  = zclear*ztrado(iplon,iw,jk)   + zcloud*ztrad(iplon,iw,jk)  



               ze1 = ztauo(iplon,iw,jk )   / prmu0(iplon)   
              if (ze1 .le. od_lo) then
                  zdbtmo = 1. - ze1 + 0.5 * ze1 * ze1
               else
                  tblind = ze1 / (bpade + ze1)
                  itind = tblint * tblind + 0.5
                  zdbtmo = exp_tbl(itind)
               endif
               ze1 = (ztauo(iplon,iw,jk) - pTAUCMC(iplon,iw,ikl))  / prmu0(iplon)           
               if (ze1 .le. od_lo) then
                  zdbtmc = 1. - ze1 + 0.5 * ze1 * ze1
               else
                  tblind = ze1 / (bpade + ze1)
                  itind = tblint * tblind + 0.5
                  zdbtmc = exp_tbl(itind)
               endif
            
               zdbt(iplon,iw,jk)   = zclear*zdbtmc + zcloud*zdbtmo
               ztdbt(iplon,iw,jk+1)   = zdbt(iplon,iw,jk)  *ztdbt(iplon,iw,jk)  

            enddo          
          end do
        end do
!$acc end kernels

!$acc kernels
        zrdnd = 0.0
        zgco = 0.0
        zomco = 0.0
        zfd = 0.0
        zfu = 0.0
!$acc end kernels


!$acc kernels 
        
          



        do iw = 1, 112
            jb = ngb(iw)
            ibm = jb-15
          do iplon = 1, 8

            zgco(iplon,iw,klev+1)   =palbp(iplon,ibm) 
            zomco(iplon,iw,klev+1)  =palbd(iplon,ibm) 
    
          end do
        end do
!$acc end kernels  





        call vrtqdr_sw(8, klev, &
                       zref  , zrefd  , ztra  , ztrad , &
                       zdbt , zrdnd  , zgco, zomco , ztdbt  , &
                       zfd , zfu  ,  ztrao)





        klev = nlayers
        repclc = 1.e-12 

!$acc kernels loop
        
    
!$acc loop    
          do ikl=1,klev+1
!$acc loop seq
          
          do iw = 1, 112
               jb = ngb(iw)
               jk=klev+2-ikl
               ibm = jb-15
            do iplon = 1, 8
               zincflx = adjflux(jb)  * zsflxzen(iplon,iw)   * prmu0(iplon)           


               pbbfu(iplon,ikl)  = pbbfu(iplon,ikl)  + zincflx*zfu(iplon,iw,jk)  
               pbbfd(iplon,ikl)  = pbbfd(iplon,ikl)  + zincflx*zfd(iplon,iw,jk)              
               pbbfddir(iplon,ikl)  = pbbfddir(iplon,ikl)  + zincflx*ztdbt_nodel(iplon,iw,jk)  


               if (ibm >= 10 .and. ibm <= 13) then
                 
                  puvfd(iplon,ikl)  = puvfd(iplon,ikl)  + zincflx*zfd(iplon,iw,jk)  
                  puvfddir(iplon,ikl)  = puvfddir(iplon,ikl)  + zincflx*ztdbt_nodel(iplon,iw,jk)  
                 
                 

               else if (ibm == 14 .or. ibm <= 9) then  
                
                  pnifd(iplon,ikl)  = pnifd(iplon,ikl)  + zincflx*zfd(iplon,iw,jk)  
                  pnifddir(iplon,ikl)  = pnifddir(iplon,ikl)  + zincflx*ztdbt_nodel(iplon,iw,jk)  
                   
                 
               endif

            enddo          


          enddo


        enddo               
!$acc end kernels


      else      
!$acc kernels
         pbbfd = pbbcd
         pbbfu = pbbcu
         puvfd = puvcd
         puvfddir = puvcddir
         pnifd = pnicd
         pnifddir = pnicddir
!$acc end kernels    
      end if    


!$acc kernels
      
         
      do iw = 1, 112
            jb = ngb(iw)
            ibm = jb - 15
         do iplon = 1, 8
            zincflx = adjflux(jb)  * zsflxzen(iplon,iw)   * prmu0(iplon)    
            
         end do
      end do
!$acc end kernels

!!$acc end data
         




      end subroutine spcvmc_sw
             

      subroutine reftra_sw(ncol, nlayers, pcldfmc, pgg, prmuzl, ptau, pw, &
                           pref, prefd, ptra, ptrad, ac)

  
















































      integer , intent(in) :: nlayers
      integer , intent(in) :: ncol

      real,  intent(in) :: pCLDFMC(:,:,:)                      
                                                               
                                                               

      real , intent(in)  :: pgg(:,:,:)               
      real , intent(in)  :: ptau(:,:,:)              
      real , intent(in)  :: pw(:,:,:)                
                                                               

      real ,  intent(in) :: prmuzl(:)                          
                                                               
      integer, intent(in) :: ac



      real , intent(out)  :: pref(:,:,:)             
      real , intent(out)  :: prefd(:,:,:)            
      real , intent(out)  :: ptra(:,:,:)             
      real , intent(out)  :: ptrad(:,:,:)            
                                                               



      integer  :: jk, jl, kmodts
      integer  :: itind, iplon, iw

      real  :: tblind
      real  :: za, za1, za2
      real  :: zbeta, zdend, zdenr, zdent
      real  :: ze1, ze2, zem1, zem2, zemm, zep1, zep2
      real  :: zg, zg3, zgamma1, zgamma2, zgamma3, zgamma4, zgt
      real  :: zr1, zr2, zr3, zr4, zr5
      real  :: zrk, zrk2, zrkg, zrm1, zrp, zrp1, zrpp
      real  :: zsr3, zt1, zt2, zt3, zt4, zt5, zto1
      real  :: zw, zwcrit, zwo, prmuz

      real , parameter :: eps = 1.e-08 





      zsr3=sqrt(3. )
      zwcrit=0.9999995 
      kmodts=2
      
!$acc kernels loop
      do iplon=1,ncol
!$acc loop
        do iw=1,112
!$acc loop private(zgamma1, zgamma2, zgamma3, zgamma4)
          do jk=1, nlayers
             prmuz = prmuzl(iplon)
             if ((.not.(pCLDFMC(iplon,iw,nlayers+1-jk))  > 1.e-12) .and. ac==0  ) then
               pref(iplon,iw,jk)   =0. 
               ptra(iplon,iw,jk)   =1. 
               prefd(iplon,iw,jk)  =0. 
               ptrad(iplon,iw,jk)  =1. 
             else
               zto1=ptau(iplon,iw,jk)  
               zw  =pw(iplon,iw,jk)  
               zg  =pgg(iplon,iw,jk)    



               zg3= 3.  * zg
           
               zgamma1= (8.  - zw * (5.  + zg3)) * 0.25 
               zgamma2=  3.  *(zw * (1.  - zg )) * 0.25 
               zgamma3= (2.  - zg3 * prmuz ) * 0.25 
       
               zgamma4= 1.  - zgamma3
    


               zwo= zw / (1.  - (1.  - zw) * (zg / (1.  - zg))**2)
    
               if (zwo >= zwcrit) then


                  za  = zgamma1 * prmuz 
                  za1 = za - zgamma3
                  zgt = zgamma1 * zto1
        



                  ze1 = min ( zto1 / prmuz , 500. )


                  ze2 = exp(-ze1)
                  pref(iplon,iw,jk)   = (zgt - za1 * (1.  - ze2)) / (1.  + zgt)
                  ptra(iplon,iw,jk)   = 1.  - pref(iplon,iw,jk)  



                  prefd(iplon,iw,jk)   = zgt / (1.  + zgt)
                  ptrad(iplon,iw,jk)   = 1.  - prefd(iplon,iw,jk)          




                  if (ze2 .eq. 1.0 ) then 
                     pref(iplon,iw,jk)   = 0.0 
                     ptra(iplon,iw,jk)   = 1.0 
                     prefd(iplon,iw,jk)   = 0.0 
                     ptrad(iplon,iw,jk)   = 1.0 
                  endif

               else


                  za1 = zgamma1 * zgamma4 + zgamma2 * zgamma3
                  za2 = zgamma1 * zgamma3 + zgamma2 * zgamma4
                  zrk = sqrt ( zgamma1**2 - zgamma2**2)
                  zrp = zrk * prmuz               
                  zrp1 = 1.  + zrp
                  zrm1 = 1.  - zrp
                  zrk2 = 2.  * zrk
                  zrpp = 1.  - zrp*zrp
                  zrkg = zrk + zgamma1
                  zr1  = zrm1 * (za2 + zrk * zgamma3)
                  zr2  = zrp1 * (za2 - zrk * zgamma3)
                  zr3  = zrk2 * (zgamma3 - za2 * prmuz )
                  zr4  = zrpp * zrkg
                  zr5  = zrpp * (zrk - zgamma1)
                  zt1  = zrp1 * (za1 + zrk * zgamma4)
                  zt2  = zrm1 * (za1 - zrk * zgamma4)
                  zt3  = zrk2 * (zgamma4 + za1 * prmuz )
                  zt4  = zr4
                  zt5  = zr5



                  zbeta = (zgamma1 - zrk) / zrkg

        


                  ze1 = min ( zrk * zto1, 5. )
                  ze2 = min ( zto1 / prmuz , 5. )
           


                  if (ze1 .le. od_lo) then 
                     zem1 = 1.  - ze1 + 0.5  * ze1 * ze1
                     zep1 = 1.  / zem1
                  else
                     zem1 = exp(-ze1)
                     zep1 = 1.  / zem1
                  endif
                  if (ze2 .le. od_lo) then 
                     zem2 = 1.  - ze2 + 0.5  * ze2 * ze2
                     zep2 = 1.  / zem2
                  else
                     zem2 = exp(-ze2)
                     zep2 = 1.  / zem2
                  endif

                  zdenr = zr4*zep1 + zr5*zem1
                  zdent = zt4*zep1 + zt5*zem1
                  if (zdenr .ge. -eps .and. zdenr .le. eps) then
                     pref(iplon,iw,jk)   = eps
                     ptra(iplon,iw,jk)   = zem2
                  else 
                     pref(iplon,iw,jk)   = zw * (zr1*zep1 - zr2*zem1 - zr3*zem2) / zdenr
                     ptra(iplon,iw,jk)   = zem2 - zem2 * zw * (zt1*zep1 - zt2*zem1 - zt3*zep2) / zdent
                  endif



                  zemm = zem1*zem1
                  zdend = 1.  / ( (1.  - zbeta*zemm ) * zrkg)
                  prefd(iplon,iw,jk)   =  zgamma2 * (1.  - zemm) * zdend
                  ptrad(iplon,iw,jk)   =  zrk2*zem1*zdend

               endif

            endif         

          end do  
        end do
      end do
!$acc end kernels

      end subroutine reftra_sw
                           

      subroutine vrtqdr_sw(ncol, klev, &
                           pref, prefd, ptra, ptrad, &
                           pdbt, prdnd, prup, prupd, ptdbt, &
                           pfd, pfu, ztdn)

 
















      integer , intent (in) :: klev                           
      integer , intent (in) :: ncol
    

      real , intent(in) :: pref(8,112,klev+1)             
      real , intent(in) :: prefd(8,112,klev+1)            
      real , intent(in) :: ptra(8,112,klev+1)             
      real , intent(in) :: ptrad(8,112,klev+1)            
      real , intent(in) :: pdbt(8,112,klev+1)
      real , intent(in) :: ptdbt(8,112,klev+1)
      real , intent(out) :: prdnd(8,112,klev+1)
      real , intent(inout) :: prup(8,112,klev+1)
      real , intent(inout)  :: prupd(8,112,klev+1)
      real, intent(inout) :: ztdn(8,112,klev+1)
                                                              


      real , intent(out)   :: pfd(8,112,klev+1)            
                                                              
      real , intent(inout)   :: pfu(8,112,klev+1)          
                                                              
                                                              



      integer  :: ikp, ikx, jk, iplon, iw



      real  :: zreflect, zreflectj






     











                   
















!DIR$ ASSUME_ALIGNED pref:64,prefd:64,ptra:64,ptrad:64
!DIR$ ASSUME_ALIGNED pdbt:64,ptdbt:64,prdnd:64,prup:64,prupd:64,ztdn:64,pfd:64,pfu:64




!$acc kernels loop
      

!$acc loop private(zreflect)
        
         do iw = 1, 112
!DIR$ VECTOR ALIGNED
           do iplon = 1, 8
            zreflect = 1.  / (1.  - prefd(iplon,iw,klev+1)   * prefd(iplon,iw,klev)  )
            prup(iplon,iw,klev)   = pref(iplon,iw,klev)   + (ptrad(iplon,iw,klev)   * &
                 ((ptra(iplon,iw,klev)   - pdbt(iplon,iw,klev)  ) * prefd(iplon,iw,klev+1)   + &
                   pdbt(iplon,iw,klev)   * pref(iplon,iw,klev+1)  )) * zreflect
            prupd(iplon,iw,klev)   = prefd(iplon,iw,klev)   + ptrad(iplon,iw,klev)   * ptrad(iplon,iw,klev)   * &
                    prefd(iplon,iw,klev+1)   * zreflect
           enddo
         
        enddo
      
!$acc end kernels
      

!$acc kernels loop
      

!$acc loop    
       

!$acc loop seq 
            do jk = 1,klev-1
               ikp = klev+1-jk                       
               ikx = ikp-1
         do iw = 1, 112
!DIR$ VECTOR ALIGNED
           do iplon = 1, 8
               zreflectj = 1.  / (1.  -prupd(iplon,iw,ikp)   * prefd(iplon,iw,ikx)  )
               prup(iplon,iw,ikx)   = pref(iplon,iw,ikx)   + (ptrad(iplon,iw,ikx)   * &
                   ((ptra(iplon,iw,ikx)   - pdbt(iplon,iw,ikx)  ) * prupd(iplon,iw,ikp)   + &
                     pdbt(iplon,iw,ikx)   * prup(iplon,iw,ikp)  )) * zreflectj
               prupd(iplon,iw,ikx)   = prefd(iplon,iw,ikx)   + ptrad(iplon,iw,ikx)   * ptrad(iplon,iw,ikx)   * &
                      prupd(iplon,iw,ikp)   * zreflectj
           enddo
         enddo
            end do
       
      
!$acc end kernels

!$acc kernels loop
      
!$acc loop
        
         do iw = 1, 112


!DIR$ VECTOR ALIGNED
           do iplon = 1, 8
            ztdn(iplon, iw, 1) = 1. 
            prdnd(iplon,iw,1)   = 0. 
            ztdn(iplon, iw, 2) = ptra(iplon,iw,1)  
            prdnd(iplon,iw,2)   = prefd(iplon,iw,1)  
           enddo
         
        enddo
      
!$acc end kernels      
      
!$acc kernels loop
      
!$acc loop
       


!$acc loop seq
            do jk = 2,klev
               ikp = jk+1
         do iw = 1, 112
!DIR$ VECTOR ALIGNED
           do iplon = 1, 8
               zreflect = 1.  / (1.  - prefd(iplon,iw,jk)   * prdnd(iplon,iw,jk)  )
               ztdn(iplon, iw, ikp) = ptdbt(iplon,iw,jk)   * ptra(iplon,iw,jk)   + &
                    (ptrad(iplon,iw,jk)   * ((ztdn(iplon, iw, jk) - ptdbt(iplon,iw,jk)  ) + &
                     ptdbt(iplon,iw,jk)   * pref(iplon,iw,jk)   * prdnd(iplon,iw,jk)  )) * zreflect
               prdnd(iplon,iw,ikp)   = prefd(iplon,iw,jk)   + ptrad(iplon,iw,jk)   * ptrad(iplon,iw,jk)   * &
                      prdnd(iplon,iw,jk)   * zreflect
           enddo
         enddo
            end do
       
      
!$acc end kernels
    


!$acc kernels loop
      
!$acc loop
       
!$acc loop 
            do jk = 1,klev+1
         do iw = 1, 112
!DIR$ VECTOR ALIGNED
           do iplon = 1, 8
               zreflect = 1.  / (1.  - prdnd(iplon,iw,jk)   * prupd(iplon,iw,jk)  )
               pfu(iplon,iw,jk)   = (ptdbt(iplon,iw,jk)   * prup(iplon,iw,jk)   + &
                      (ztdn(iplon, iw, jk) - ptdbt(iplon,iw,jk)  ) * prupd(iplon,iw,jk)  ) * zreflect
               pfd(iplon,iw,jk)   = ptdbt(iplon,iw,jk)   + (ztdn(iplon, iw, jk) - ptdbt(iplon,iw,jk)  + &
                      ptdbt(iplon,iw,jk)   * prup(iplon,iw,jk)   * prdnd(iplon,iw,jk)  ) * zreflect
           enddo
         enddo
            end do
       
      
!$acc end kernels
      
      end subroutine vrtqdr_sw

      end module rrtmg_sw_spcvmc_f

      module rrtmg_sw_rad_f




































    


      use rrsw_vsn_f
      use mcica_subcol_gen_sw_f, only: mcica_sw
      use rrtmg_sw_cldprmc_f, only: cldprmc_sw
      use rrtmg_sw_setcoef_f, only: setcoef_sw
      use rrtmg_sw_spcvmc_f, only: spcvmc_sw

      implicit none

      public :: rrtmg_sw,  earth_sun

      INTEGER, PARAMETER :: debug_level_swf=100

      contains
    
      subroutine rrtmg_sw &
            (rpart   ,ncol    ,nlay    ,icld    ,iaer   , &
             play    ,plev    ,tlay    ,tlev    ,tsfc   , &
             h2ovmr  ,o3vmr   ,co2vmr  ,ch4vmr  ,n2ovmr ,o2vmr , &
             asdir   ,asdif   ,aldir   ,aldif   , &
             coszen  ,adjes   ,dyofyr  ,scon    , &
             inflgsw ,iceflgsw,liqflgsw,cld     , &
             tauc    ,ssac    ,asmc    ,fsfc    , &
             ciwp    ,clwp    ,cswp    ,rei     ,rel    ,res   , &
             tauaer  ,ssaaer  ,asmaer  ,ecaer   , &
             swuflx  ,swdflx  ,swhr    ,swuflxc ,swdflxc,swhrc , &


             sibvisdir, sibvisdif, sibnirdir, sibnirdif,         &

             swdkdir,   swdkdif                                  & 
                                )


      use parrrsw_f, only : nbndsw, ngptsw, naerec, nstr, nmol, mxmol, &
                          jpband, jpb1, jpb2, rrsw_scon
      use rrsw_aer_f, only : rsrtaua, rsrpiza, rsrasya
      use rrsw_con_f, only : heatfac, oneminus, pi,  grav, avogad
      use rrsw_wvn_f, only : wavenum1, wavenum2
      use rrsw_cld_f, only : extliq1, ssaliq1, asyliq1, &
                           extice2, ssaice2, asyice2, &
                           extice3, ssaice3, asyice3, fdlice3, &
                           abari, bbari, cbari, dbari, ebari, fbari
      use rrsw_wvn_f, only : wavenum2, ngb
      use rrsw_ref_f, only : preflog, tref





      integer , intent(in) :: rpart           
      integer , intent(in) :: ncol            
      integer , intent(in) :: nlay            
      integer , intent(inout) :: icld         
                                              
                                              
                                              
                                              
      integer , intent(in) :: iaer            
      real , intent(in) :: play(:,:)          
                                              
      real , intent(in) :: plev(:,:)          
                                              
      real , intent(in) :: tlay(:,:)          
                                              
      real , intent(in) :: tlev(:,:)          
                                              
      real , intent(in) :: tsfc(:)            
                                              
      real , intent(in) :: h2ovmr(:,:)        
                                              
      real , intent(in) :: o3vmr(:,:)         
                                              
      real , intent(in) :: co2vmr(:,:)        
                                              
      real , intent(in) :: ch4vmr(:,:)        
                                              
      real , intent(in) :: n2ovmr(:,:)        
                                              
      real , intent(in) :: o2vmr(:,:)         
                                              
      real , intent(in) :: asdir(:)           
                                              
      real , intent(in) :: aldir(:)           
                                              
      real , intent(in) :: asdif(:)           
                                              
      real , intent(in) :: aldif(:)           
                                              

      integer , intent(in) :: dyofyr          
                                              
      real , intent(in) :: adjes              
      real , intent(in) :: coszen(:)          
                                              
      real , intent(in) :: scon               

      integer , intent(in) :: inflgsw         
      integer , intent(in) :: iceflgsw        
      integer , intent(in) :: liqflgsw        

      real , intent(in) :: cld(:,:)           
                                              
      real , intent(in) :: TAUC(:,:,:)        
                                              
      real , intent(in) :: SSAC(:,:,:)        
                                              
      real , intent(in) :: ASMC(:,:,:)        
                                              
      real , intent(in) :: FSFC(:,:,:)        
                                              
      real , intent(in) :: ciwp(:,:)          
                                              
      real , intent(in) :: clwp(:,:)          
                                              
      real , intent(in) :: cswp(:,:)          
                                              
      real , intent(in) :: rei(:,:)           
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
                                              
      real , intent(in) :: rel(:,:)           
                                              
      real , intent(in) :: res(:,:)           
                                              
      real , intent(in) :: tauaer(:,:,:)      
                                              
                                              
      real , intent(in) :: ssaaer(:,:,:)      
                                              
                                              
      real , intent(in) :: asmaer(:,:,:)      
                                              
                                              
      real , intent(in) :: ecaer(:,:,:)       
                                              
                                              
                                              


      real , intent(out) :: swuflx(:,:)       
                                              
      real , intent(out) :: swdflx(:,:)       
                                              
      real , intent(out) :: swhr(:,:)         
                                              
      real , intent(out) :: swuflxc(:,:)      
                                              
      real , intent(out) :: swdflxc(:,:)      
                                              
      real , intent(out) :: swhrc(:,:)        
                                              

      real, intent(out) :: sibvisdir(:,:)      
                                               
      real, intent(out) :: sibvisdif(:,:)      
                                               
      real, intent(out) :: sibnirdir(:,:)      
                                               
      real, intent(out) :: sibnirdif(:,:)      
                                               
      real, intent(out) :: swdkdir(:,:)        
                                               
      real, intent(out) :: swdkdif(:,:)        
                                               

      integer :: npart, pncol, ns
      CHARACTER(LEN=256) :: message


      real :: t1, t2
      

      if (rpart > 0) then
         pncol = rpart
      else

      pncol = 2
      pncol = 4

      
          
      end if

      WRITE(message,*)'RRTMG_SWF: Number of columns is               ',ncol
      call wrf_debug( debug_level_swf, message)
      WRITE(message,*)'RRTMG_SWF: Number of columns per partition is ',pncol
      call wrf_debug( debug_level_swf, message)
      ns = ceiling( real(ncol) / real(pncol) )
      WRITE(message,*)'RRTMG_SWF: Number of partitions is            ',ns
      call wrf_debug( debug_level_swf, message)

      call cpu_time(t1)
                                                      
      call rrtmg_sw_sub &
            (pncol   ,ncol    ,nlay    ,icld    ,iaer   , &
             play    ,plev    ,tlay    ,tlev    ,tsfc   , &
             h2ovmr  ,o3vmr   ,co2vmr  ,ch4vmr  ,n2ovmr ,o2vmr , &
             asdir   ,asdif   ,aldir   ,aldif   , &
             coszen  ,adjes   ,dyofyr  ,scon    , &
             inflgsw ,iceflgsw,liqflgsw,cld     , &
             tauc    ,ssac    ,asmc    ,fsfc    , &
             ciwp    ,clwp    ,cswp    ,rei     ,rel    ,res   , &
             tauaer  ,ssaaer  ,asmaer  ,ecaer   , &
             swuflx  ,swdflx  ,swhr    ,swuflxc ,swdflxc ,swhrc, &
             sibvisdir, sibvisdif, sibnirdir, sibnirdif,         &
             swdkdir  , swdkdif                                  & 
                                )
      call cpu_time(t2)
      WRITE(message,*)'------------------------------------------------'
      call wrf_debug( debug_level_swf, message)
      WRITE(message,*)'TOTAL RRTMG_SWF RUN TIME IS   ', t2-t1
      call wrf_debug( debug_level_swf, message)
      WRITE(message,*)'------------------------------------------------'
      call wrf_debug( debug_level_swf, message)
                                                      
      end subroutine rrtmg_sw                                                     


      subroutine rrtmg_sw_sub &
            (ncol    ,gncol   ,nlay    ,icld    ,iaer    , &
             gplay   ,gplev   ,gtlay   ,gtlev   ,gtsfc   , &
             gh2ovmr ,go3vmr  ,gco2vmr ,gch4vmr ,gn2ovmr ,go2vmr , &
             gasdir  ,gasdif  ,galdir  ,galdif  , &
             gcoszen ,adjes   ,dyofyr  ,scon    , &
             inflgsw ,iceflgsw,liqflgsw,gcld    , &
             gtauc   ,gssac   ,gasmc   ,gfsfc   , &
             gciwp   ,gclwp   ,gcswp   ,grei    ,grel    ,gres   , &
             gtauaer ,gssaaer ,gasmaer ,gecaer  , &
             swuflx  ,swdflx  ,swhr    ,swuflxc ,swdflxc ,swhrc, &
             sibvisdir, sibvisdif, sibnirdir, sibnirdif,         &
             swdkdir  , swdkdif                                  & 
                                )
      use parrrsw_f, only : nbndsw, ngptsw, naerec, nstr, nmol, mxmol, &
                          jpband, jpb1, jpb2, rrsw_scon
      use rrsw_aer_f, only : rsrtaua, rsrpiza, rsrasya
      use rrsw_con_f, only : heatfac, oneminus, pi,  grav, avogad
      use rrsw_wvn_f, only : wavenum1, wavenum2
      use rrsw_cld_f, only : extliq1, ssaliq1, asyliq1, &
                           extice2, ssaice2, asyice2, &
                           extice3, ssaice3, asyice3, fdlice3, &
                           abari, bbari, cbari, dbari, ebari, fbari
      use rrsw_wvn_f, only : wavenum2, ngb, icxa, nspa, nspb
      use rrsw_ref_f, only : preflog, tref
      use rrsw_kg16_f, kao16 => kao, kbo16 => kbo, selfrefo16 => selfrefo, forrefo16 => forrefo, sfluxrefo16 => sfluxrefo
      use rrsw_kg16_f, ka16 => ka, kb16 => kb, selfref16 => selfref, forref16 => forref, sfluxref16 => sfluxref

      use rrsw_kg17_f, kao17 => kao, kbo17 => kbo, selfrefo17 => selfrefo, forrefo17 => forrefo, sfluxrefo17 => sfluxrefo
      use rrsw_kg17_f, ka17 => ka, kb17 => kb, selfref17 => selfref, forref17 => forref, sfluxref17 => sfluxref

      use rrsw_kg18_f, kao18 => kao, kbo18 => kbo, selfrefo18 => selfrefo, forrefo18 => forrefo, sfluxrefo18 => sfluxrefo
      use rrsw_kg18_f, ka18 => ka, kb18 => kb, selfref18 => selfref, forref18 => forref, sfluxref18 => sfluxref

      use rrsw_kg19_f, kao19 => kao, kbo19 => kbo, selfrefo19 => selfrefo, forrefo19 => forrefo, sfluxrefo19 => sfluxrefo
      use rrsw_kg19_f, ka19 => ka, kb19 => kb, selfref19 => selfref, forref19 => forref, sfluxref19 => sfluxref

      use rrsw_kg20_f, kao20 => kao, kbo20 => kbo, selfrefo20 => selfrefo, forrefo20 => forrefo, &
          sfluxrefo20 => sfluxrefo, absch4o20 => absch4o
      use rrsw_kg20_f, ka20 => ka, kb20 => kb, selfref20 => selfref, forref20 => forref, &
          sfluxref20 => sfluxref, absch420 => absch4

      use rrsw_kg21_f, kao21 => kao, kbo21 => kbo, selfrefo21 => selfrefo, forrefo21 => forrefo, sfluxrefo21 => sfluxrefo
      use rrsw_kg21_f, ka21 => ka, kb21 => kb, selfref21 => selfref, forref21 => forref, sfluxref21 => sfluxref

      use rrsw_kg22_f, kao22 => kao, kbo22 => kbo, selfrefo22 => selfrefo, forrefo22 => forrefo, sfluxrefo22 => sfluxrefo
      use rrsw_kg22_f, ka22 => ka, kb22 => kb, selfref22 => selfref, forref22 => forref, sfluxref22 => sfluxref

      use rrsw_kg23_f, kao23 => kao, selfrefo23 => selfrefo, forrefo23 => forrefo, sfluxrefo23 => sfluxrefo, raylo23 => raylo
      use rrsw_kg23_f, ka23 => ka, selfref23 => selfref, forref23 => forref, sfluxref23 => sfluxref, rayl23 => rayl

      use rrsw_kg24_f, kao24 => kao, kbo24 => kbo, selfrefo24 => selfrefo, forrefo24 => forrefo, sfluxrefo24 => sfluxrefo
      use rrsw_kg24_f, abso3ao24 => abso3ao, abso3bo24 => abso3bo, raylao24 => raylao, raylbo24 => raylbo
      use rrsw_kg24_f, ka24 => ka, kb24 => kb, selfref24 => selfref, forref24 => forref, sfluxref24 => sfluxref
      use rrsw_kg24_f, abso3a24 => abso3a, abso3b24 => abso3b, rayla24 => rayla, raylb24 => raylb

      use rrsw_kg25_f, kao25 => kao, sfluxrefo25=>sfluxrefo
      use rrsw_kg25_f, abso3ao25 => abso3ao, abso3bo25 => abso3bo, raylo25 => raylo
      use rrsw_kg25_f, ka25 => ka, sfluxref25=>sfluxref
      use rrsw_kg25_f, abso3a25 => abso3a, abso3b25 => abso3b, rayl25 => rayl
     
      use rrsw_kg26_f, sfluxrefo26 => sfluxrefo
      use rrsw_kg26_f, sfluxref26 => sfluxref

      use rrsw_kg27_f, kao27 => kao, kbo27 => kbo, sfluxrefo27 => sfluxrefo, rayl27=>rayl
      use rrsw_kg27_f, ka27 => ka, kb27 => kb, sfluxref27 => sfluxref, raylo27=>raylo

      use rrsw_kg28_f, kao28 => kao, kbo28 => kbo, sfluxrefo28 => sfluxrefo
      use rrsw_kg28_f, ka28 => ka, kb28 => kb, sfluxref28 => sfluxref

      use rrsw_kg29_f, kao29 => kao, kbo29 => kbo, selfrefo29 => selfrefo, forrefo29 => forrefo, sfluxrefo29 => sfluxrefo
      use rrsw_kg29_f, absh2oo29 => absh2oo, absco2o29 => absco2o
      use rrsw_kg29_f, ka29 => ka, kb29 => kb, selfref29 => selfref, forref29 => forref, sfluxref29 => sfluxref
      use rrsw_kg29_f, absh2o29 => absh2o, absco229 => absco2



      integer , intent(in) :: ncol
      integer , intent(in) :: gncol                   
      integer , intent(in) :: nlay                    
      integer , intent(inout) :: icld                 
                                                      
                                                      
                                                      
                                                      
      integer , intent(in) :: iaer
      integer , intent(in) :: dyofyr                  
                                                      
      real , intent(in) :: adjes                      
      real , intent(in) :: scon                       

      integer , intent(in) :: inflgsw                 
      integer , intent(in) :: iceflgsw                
      integer , intent(in) :: liqflgsw                
      
      real , intent(in) :: gcld(gncol, nlay)          
                                                      
      real , intent(in) :: gtauc(gncol,nlay,nbndsw)   
                                                      
      real , intent(in) :: gssac(gncol,nlay,nbndsw)   
                                                      
      real , intent(in) :: gasmc(gncol,nlay,nbndsw)   
                                                      
      real , intent(in) :: gfsfc(gncol,nlay,nbndsw)   
                                                      
      real , intent(in) :: gciwp(gncol, nlay)         
                                                      
      real , intent(in) :: gclwp(gncol, nlay)         
                                                      
      real , intent(in) :: gcswp(gncol, nlay)         
                                                      
                                                      
      real , intent(in) :: grei(gncol, nlay)          
                                                      
      real , intent(in) :: grel(gncol, nlay)          
                                                      
      real , intent(in) :: gres(gncol, nlay)          
                                                      
                                                      
      
      real , intent(in) :: gplay(gncol,nlay)          
                                                      
      real , intent(in) :: gplev(gncol,nlay+1)        
                                                      
      real , intent(in) :: gtlay(gncol,nlay)          
                                                      
      real , intent(in) :: gtlev(gncol,nlay+1)        
                                                      
      real , intent(in) :: gtsfc(gncol)               
                                                      
      real , intent(in) :: gh2ovmr(gncol,nlay)        
                                                      
      real , intent(in) :: go3vmr(gncol,nlay)         
                                                      
      real , intent(in) :: gco2vmr(gncol,nlay)        
                                                      
      real , intent(in) :: gch4vmr(gncol,nlay)        
                                                      
      real , intent(in) :: gn2ovmr(gncol,nlay)        
                                                      
      real , intent(in) :: go2vmr(gncol,nlay)         
                                                      
      real , intent(in) :: gasdir(gncol)              
                                                      
      real , intent(in) :: galdir(gncol)              
                                                      
      real , intent(in) :: gasdif(gncol)              
                                                      
      real , intent(in) :: galdif(gncol)              
                                                      

      
      real , intent(in) :: gcoszen(gncol)             
                                                      
    
      real , intent(in) :: gtauaer(gncol,nlay,nbndsw) 
                                                      
                                                      
      real , intent(in) :: gssaaer(gncol,nlay,nbndsw) 
                                                      
                                                      
      real , intent(in) :: gasmaer(gncol,nlay,nbndsw) 
                                                      
                                                      
      real , intent(in) :: gecaer(:,:,:)              
                                                      
                                                      

                                                       
                                                       



      real , intent(out) :: swuflx(:,:)               
                                                      
      real , intent(out) :: swdflx(:,:)               
                                                      
      real , intent(out) :: swhr(:,:)                 
                                                      
      real , intent(out) :: swuflxc(:,:)              
                                                      
      real , intent(out) :: swdflxc(:,:)              
                                                      
      real , intent(out) :: swhrc(:,:)                
                                                      

      real, intent(out) :: sibvisdir(:,:)              
                                                       
      real, intent(out) :: sibvisdif(:,:)              
                                                       
      real, intent(out) :: sibnirdir(:,:)              
                                                       
      real, intent(out) :: sibnirdif(:,:)              
                                                       
      real, intent(out) :: swdkdir(:,:)                
                                                       
      real, intent(out) :: swdkdif(:,:)                
                                                       




     
      integer  :: istart                      
      integer  :: iend                        
      integer  :: icpr                        
      integer  :: iout                        
  
      integer  :: idelm                       
                                              
                                              
                                              
      integer  :: isccos                      
      integer  :: iplon                       
      integer  :: i                           
      integer  :: ib                          
      integer  :: ia, ig                      
      integer  :: k                           
      integer  :: ims                         
      integer  :: imca                        

      real  :: zepsec, zepzen                 
      real  :: zdpgcp                         




      real  :: coldry(8,nlay+1)            
      real  :: wkl(8,mxmol,nlay)           

      real  :: cossza(8)                   
      real  :: adjflux(jpband)                
      
                                              
      real  :: albdir(8,nbndsw)            
      real  :: albdif(8,nbndsw)            
      



      integer  :: laytrop(8)               
      integer  :: layswtch(8)              
      integer  :: laylow(8)                
      integer  :: jp(8,nlay+1)             
      integer  :: jt(8,nlay+1)             
      integer  :: jt1(8,nlay+1)            

      real  :: colh2o(8,nlay+1)            
      real  :: colco2(8,nlay+1)            
      real  :: colo3(8,nlay+1)             
      real  :: coln2o(8,nlay+1)            
      real  :: colch4(8,nlay+1)            
      real  :: colo2(8,nlay+1)             
      real  :: colmol(8,nlay+1)            
      real  :: co2mult(8,nlay+1)           

      integer  :: indself(8,nlay+1) 
      integer  :: indfor(8,nlay+1) 
      real  :: selffac(8,nlay+1) 
      real  :: selffrac(8,nlay+1) 
      real  :: forfac(8,nlay+1) 
      real  :: forfrac(8,nlay+1) 

      real  :: &                              
                         fac00(8,nlay+1) , fac01(8,nlay+1) , &
                         fac10(8,nlay+1) , fac11(8,nlay+1)  
      
      real :: play(8,nlay)                 
                                              
      real :: plev(8,nlay+1)               
                                              
      real :: tlay(8,nlay)                 
                                              
      real :: tlev(8,nlay+1)               
                                              
      real :: tsfc(8)                      
                                              
      real :: coszen(8)   


      integer  :: ncbands                     

      real   :: cld(8,nlay)                
      real   :: TAUC(8,nbndsw,nlay)        
      real   :: SSAC(8,nbndsw,nlay)        
      real   :: ASMC(8,nbndsw,nlay)        
      real   :: FSFC(8,nbndsw,nlay)        
      real   :: ciwp(8,nlay)               
      real   :: clwp(8,nlay)               
      real   :: cswp(8,nlay)               
      real   :: rei(8,nlay)                
      real   :: rel(8,nlay)                
      real   :: res(8,nlay)                
      
      real  :: TAUCMC(8,ngptsw,nlay+1)     
      real  :: TAORMC(8,ngptsw,nlay+1)     
      real  :: SSACMC(8,ngptsw,nlay+1)     
      real  :: ASMCMC(8,ngptsw,nlay+1)     
      real  :: FSFCMC(8,ngptsw,nlay+1)     
      
      real :: CLDFMCL(8,ngptsw,nlay+1)     
      real :: CIWPMCL(8,ngptsw,nlay+1)     
      real :: CLWPMCL(8,ngptsw,nlay+1)     
      real :: CSWPMCL(8,ngptsw,nlay+1)     
                                                     

      real  :: ztauc(8,nlay+1,nbndsw)      
      real  :: ztaucorig(8,nlay+1,nbndsw)  
      real  :: zasyc(8,nlay+1,nbndsw)      
                                              
      real  :: zomgc(8,nlay+1,nbndsw)      
   
      real  :: TAUA(8, nbndsw, nlay+1)
      real  :: ASYA(8, nbndsw, nlay+1)
      real  :: OMGA(8, nbndsw, nlay+1)
   
      real  :: zbbfu(8,nlay+2)             
      real  :: zbbfd(8,nlay+2)             
      real  :: zbbcu(8,nlay+2)             
      real  :: zbbcd(8,nlay+2)             
      real  :: zbbfddir(8,nlay+2)          
      real  :: zbbcddir(8,nlay+2)          
      real  :: zuvfd(8,nlay+2)             
      real  :: zuvcd(8,nlay+2)             
      real  :: zuvfddir(8,nlay+2)          
      real  :: zuvcddir(8,nlay+2)          
      real  :: znifd(8,nlay+2)             
      real  :: znicd(8,nlay+2)             
      real  :: znifddir(8,nlay+2)          
      real  :: znicddir(8,nlay+2)          


      real  :: swnflx(8,nlay+2)            
      real  :: swnflxc(8,nlay+2)           
      real  :: dirdflux(8,nlay+2)          
      real  :: difdflux(8,nlay+2)          
      real  :: uvdflx(8,nlay+2)            
      real  :: nidflx(8,nlay+2)            
      real  :: dirdnuv(8,nlay+2)           
      real  :: difdnuv(8,nlay+2)           
      real  :: dirdnir(8,nlay+2)           
      real  :: difdnir(8,nlay+2)           
      
      real  :: zgco(8,ngptsw,nlay+1)  , zomco(8,ngptsw,nlay+1)  
      real  :: zrdnd(8,ngptsw,nlay+1) 
      real  :: zref(8,ngptsw,nlay+1)  , zrefo(8,ngptsw,nlay+1)  
      real  :: zrefd(8,ngptsw,nlay+1) , zrefdo(8,ngptsw,nlay+1)  
      real  :: ztauo(8,ngptsw,nlay)  
      real  :: zdbt(8,ngptsw,nlay+1)  , ztdbt(8,ngptsw,nlay+1)   
      real  :: ztra(8,ngptsw,nlay+1)  , ztrao(8,ngptsw,nlay+1)  
      real  :: ztrad(8,ngptsw,nlay+1) , ztrado(8,ngptsw,nlay+1)  
      real  :: zfd(8,ngptsw,nlay+1)   , zfu(8,ngptsw,nlay+1)  
      real  :: zsflxzen(8,ngptsw)
      real  :: ztaur(8,nlay,ngptsw)   , ztaug(8,nlay,ngptsw) 

      integer :: npartc, npart, npartb, cldflag(gncol), profic(gncol), profi(gncol)

      real , parameter :: amd = 28.9660       
      real , parameter :: amw = 18.0160       



      real , parameter :: amdw = 1.607793   
      real , parameter :: amdc = 0.658114   
      real , parameter :: amdo = 0.603428   
      real , parameter :: amdm = 1.805423   
      real , parameter :: amdn = 0.658090   
      real , parameter :: amdo2 = 0.905140  

      real , parameter :: sbc = 5.67e-08    
      integer ii,jj,kk,iw
      integer  :: isp, l, ix, n, imol  
      real  :: amm, summol                      
      real  :: adjflx                           
      integer :: prt
      integer :: piplon
      
      integer :: ipart, cols, cole, colr, ncolc, ncolb
      integer :: irng, cc, ncolst


      
      zepsec = 1.e-06 
      zepzen = 1.e-10 
      oneminus = 1.0  - zepsec
      pi = 2.  * asin(1. )
      irng = 0

      istart = jpb1
      iend = jpb2
      iout = 0
      icpr = 1
      ims = 2
      
      adjflx = adjes
      if (dyofyr .gt. 0) then
         adjflx = earth_sun(dyofyr)
      endif
  
      do ib = jpb1, jpb2
         adjflux(ib) = adjflx * scon / rrsw_scon
      end do

      if (icld.lt.0.or.icld.gt.3) icld = 2
    
      

      cldflag=0
      do iplon = 1, gncol
        if (any(gcld(iplon,:) > 0)) cldflag(iplon)=1
      end do



      cols = 0
      cole = 0

      do iplon = 1, gncol
        if (cldflag(iplon)==1) then
            cole=cole+1
            profi(cole) = iplon
        else
            cols=cols+1
            profic(cols) = iplon
        end if
      end do
        

!$acc data copyout(swuflxc, swdflxc, swuflx, swdflx, swnflxc, swnflx, swhrc, swhr) &
!$acc create(laytrop, layswtch, laylow, jp, jt, jt1, &
!$acc co2mult, colch4, colco2, colh2o, colmol, coln2o, &
!$acc colo2, colo3, fac00, fac01, fac10, fac11, &
!$acc selffac, selffrac, indself, forfac, forfrac, indfor, &
!$acc zbbfu, zbbfd, zbbcu, zbbcd,zbbfddir, zbbcddir, zuvfd, zuvcd, zuvfddir, &
!$acc zuvcddir, znifd, znicd, znifddir,znicddir, &
!$acc cldfmcl, ciwpmcl, clwpmcl, cswpmcl, &
!$acc taormc, taucmc, ssacmc, asmcmc, fsfcmc) &
!$acc deviceptr(zref,zrefo,zrefd,zrefdo,&
!$acc ztauo,ztdbt,&
!$acc ztra,ztrao,ztrad,ztrado,&
!$acc zfd,zfu,zdbt,zgco,&
!$acc zomco,zrdnd,ztaug, ztaur,zsflxzen)&
!$acc create(ciwp, clwp, cswp, cld, tauc, ssac, asmc, fsfc, rei, rel, res) &
!$acc create(play, tlay, plev, tlev, tsfc, cldflag, coszen) &
!$acc create(coldry, wkl) &
!$acc create(extliq1, ssaliq1, asyliq1, extice2, ssaice2, asyice2) &
!$acc create(extice3, ssaice3, asyice3, fdlice3, abari, bbari, cbari, dbari, ebari, fbari) &
!$acc create(taua, asya, omga,gtauaer,gssaaer,gasmaer) &
!$acc copyin(wavenum2, ngb) &
!$acc copyin(tref, preflog, albdif, albdir, cossza)&
!$acc copyin(icxa, adjflux, nspa, nspb)&
!$acc copyin(kao16,kbo16,selfrefo16,forrefo16,sfluxrefo16)&
!$acc copyin(ka16,kb16,selfref16,forref16,sfluxref16)&
!$acc copyin(kao17,kbo17,selfrefo17,forrefo17,sfluxrefo17)&
!$acc copyin(ka17,kb17,selfref17,forref17,sfluxref17)&
!$acc copyin(kao18,kbo18,selfrefo18,forrefo18,sfluxrefo18)&
!$acc copyin(ka18,kb18,selfref18,forref18,sfluxref18)&
!$acc copyin(kao19,kbo19,selfrefo19,forrefo19,sfluxrefo19)&
!$acc copyin(ka19,kb19,selfref19,forref19,sfluxref19)&
!$acc copyin(kao20,kbo20,selfrefo20,forrefo20,sfluxrefo20,absch4o20)&
!$acc copyin(ka20,kb20,selfref20,forref20,sfluxref20,absch420)&
!$acc copyin(kao21,kbo21,selfrefo21,forrefo21,sfluxrefo21)&
!$acc copyin(ka21,kb21,selfref21,forref21,sfluxref21)&
!$acc copyin(kao22,kbo22,selfrefo22,forrefo22,sfluxrefo22)&
!$acc copyin(ka22,kb22,selfref22,forref22,sfluxref22)&
!$acc copyin(kao23,selfrefo23,forrefo23,sfluxrefo23,raylo23)&
!$acc copyin(ka23,selfref23,forref23,sfluxref23,rayl23)&
!$acc copyin(kao24,kbo24,selfrefo24,forrefo24,sfluxrefo24,abso3ao24,abso3bo24,raylao24,raylbo24)&
!$acc copyin(ka24,kb24,selfref24,forref24,sfluxref24,abso3a24,abso3b24,rayla24,raylb24)&
!$acc copyin(kao25,sfluxrefo25,abso3ao25,abso3bo25,raylo25)&
!$acc copyin(ka25,sfluxref25,abso3a25,abso3b25,rayl25)&
!$acc copyin(sfluxrefo26)&
!$acc copyin(sfluxref26)&
!$acc copyin(kao27,kbo27,sfluxrefo27, raylo27)&
!$acc copyin(ka27,kb27,sfluxref27, rayl27)&
!$acc copyin(kao28,kbo28,sfluxrefo28)&
!$acc copyin(ka28,kb28,sfluxref28,gtauc, gssac, gasmc, gfsfc)&
!$acc copyin(kao29,kbo29,selfrefo29,forrefo29,sfluxrefo29,absh2oo29,absco2o29)&
!$acc copyin(ka29,kb29,selfref29,forref29,sfluxref29,absh2o29,absco229)&
!$acc copyin(gh2ovmr, gco2vmr, go3vmr, gn2ovmr, gch4vmr, go2vmr)&
!$acc copyin(gcld, gciwp, gclwp, gcswp, grei, grel, gres, gplay, gplev, gtlay, gtlev, gtsfc)&
!$acc copyin(gasdir, galdir, gasdif, galdif,profi,profic,gcoszen)&
!$acc copyout(sibvisdir,sibvisdif,sibnirdir,sibnirdif,swdkdir,swdkdif)

!$acc update device(extliq1, ssaliq1, asyliq1, extice2, ssaice2, asyice2) &
!$acc device(extice3, ssaice3, asyice3, fdlice3, abari, bbari, cbari, dbari, ebari, fbari) &
!$acc device(preflog)


      ncolc = cols
      ncolb = cole

      npartc = ceiling( real(ncolc) / real(ncol) )
      npartb = ceiling( real(ncolb) / real(ncol) )


!$acc kernels    
      cldfmcl = 0.0
      ciwpmcl = 0.0
      clwpmcl = 0.0     
      cswpmcl = 0.0     
!$acc end kernels
  
      idelm = 1
      
!$acc kernels
      taua = 0.0
      asya = 0.0
      omga = 1.0
!$acc end kernels

      if (iaer==10) then

!$acc update device(gtauaer,gssaaer,gasmaer)

      end if





      do cc = 1, 2

        if (cc==1) then 
         
          npart = npartc
          ncolst = ncolc

        else
        
          npart = npartb
          ncolst = ncolb
         
        end if
     
        do ipart = 0,npart-1





          cols = ipart * ncol + 1
          cole = (ipart + 1) * ncol
          if (cole>ncolst) cole=ncolst
          colr = cole - cols + 1

!$acc kernels            
          taormc = 0.0 
          taucmc = 0.0
          ssacmc = 1.0
          asmcmc = 0.0
          fsfcmc = 0.0
!$acc end kernels            
 

          if (cc==1) then    
!$acc kernels loop private(piplon)
             do iplon = 1, colr
               piplon = profic(iplon + cols - 1)
     
               do ib=1,8
                 albdir(iplon,ib)  = galdir(piplon)
                 albdif(iplon,ib)  = galdif(piplon)
               enddo
               albdir(iplon,nbndsw)  = galdir(piplon)
               albdif(iplon,nbndsw)  = galdif(piplon)

     
               do ib=10,13
                 albdir(iplon,ib)  = gasdir(piplon)
                 albdif(iplon,ib)  = gasdif(piplon)
               enddo


               albdir(iplon, 9) = (gasdir(piplon)+galdir(piplon))/2.
               albdif(iplon, 9) = (gasdif(piplon)+galdif(piplon))/2.
             end do
!$acc end kernels      

!$acc kernels 
             do iplon = 1, colr
               piplon = profic(iplon + cols - 1)
               play(iplon,:) = gplay(piplon, 1:nlay)
               plev(iplon,:) = gplev(piplon, 1:nlay+1)
               tlay(iplon,:) = gtlay(piplon, 1:nlay)
               tlev(iplon,:) = gtlev(piplon, 1:nlay+1)
               tsfc(iplon)   = gtsfc(piplon)
             end do
!$acc end kernels

             if (iaer==10) then
!$acc kernels
               do iw=1,nbndsw
               do kk=1,nlay
               do iplon = 1, colr
                 piplon = profic(iplon + cols - 1)
                 TAUA(iplon, iw, kk) = gtauaer(piplon, kk, iw)
                 ASYA(iplon, iw, kk) = gasmaer(piplon, kk, iw)
                 OMGA(iplon, iw, kk) = gssaaer(piplon, kk, iw)
               end do
               end do
               end do
!$acc end kernels
             end if

!$acc kernels
             do iplon = 1, colr
               piplon = profic(iplon + cols - 1)
               wkl(iplon,1,:) = gh2ovmr(piplon,1:nlay)
               wkl(iplon,2,:) = gco2vmr(piplon,1:nlay)
               wkl(iplon,3,:) = go3vmr(piplon,1:nlay)
               wkl(iplon,4,:) = gn2ovmr(piplon,1:nlay)
               wkl(iplon,5,:) = 0.0
               wkl(iplon,6,:) = gch4vmr(piplon,1:nlay)
               wkl(iplon,7,:) = go2vmr(piplon,1:nlay)   
               coszen(iplon)  = gcoszen(piplon)
             end do
!$acc end kernels


          else   
          
!$acc kernels loop private(piplon)
            do iplon = 1, colr
              piplon = profi(iplon + cols - 1)

              do ib=1,8
                albdir(iplon,ib)  = galdir(piplon)
                albdif(iplon,ib)  = galdif(piplon)
              enddo
              albdir(iplon,nbndsw)  = galdir(piplon)
              albdif(iplon,nbndsw)  = galdif(piplon)


              do ib=10,13
                 albdir(iplon,ib)  = gasdir(piplon)
                 albdif(iplon,ib)  = gasdif(piplon)
              enddo


              albdir(iplon, 9) = (gasdir(piplon)+galdir(piplon))/2.
              albdif(iplon, 9) = (gasdif(piplon)+galdif(piplon))/2.
            end do
!$acc end kernels               
          
!$acc kernels 
            do iplon = 1, colr
              piplon = profi(iplon + cols - 1)
              play(iplon,:) = gplay(piplon, 1:nlay)
              plev(iplon,:) = gplev(piplon, 1:nlay+1)
              tlay(iplon,:) = gtlay(piplon, 1:nlay)
              tlev(iplon,:) = gtlev(piplon, 1:nlay+1)
              tsfc(iplon) = gtsfc(piplon)
              cld(iplon,:) = gcld(piplon, 1:nlay)
              ciwp(iplon,:) = gciwp(piplon, 1:nlay)
              clwp(iplon,:) = gclwp(piplon, 1:nlay)
              cswp(iplon,:) = gcswp(piplon, 1:nlay)
              rei(iplon,:) = grei(piplon, 1:nlay) 
              rel(iplon,:) = grel(piplon, 1:nlay)
              res(iplon,:) = gres(piplon, 1:nlay)
            end do

!$acc end kernels
            if (iaer==10) then

!$acc kernels    
              do iw=1,nbndsw
              do kk=1,nlay
              do iplon = 1, colr
                piplon = profi(iplon + cols - 1)
                TAUA(iplon, iw, kk) = gtauaer(piplon, kk, iw)
                ASYA(iplon, iw, kk) = gasmaer(piplon, kk, iw)
                OMGA(iplon, iw, kk) = gssaaer(piplon, kk, iw)
              end do
              end do
              end do
!$acc end kernels
            end if






!$acc kernels 
            do iw=1,nbndsw
            do kk=1,nlay
            do iplon = 1, colr
              piplon = profi(iplon + cols - 1)
              TAUC(iplon, iw, kk) = gtauc(piplon, kk, iw)
              SSAC(iplon, iw, kk) = gssac(piplon, kk, iw)
              ASMC(iplon, iw, kk) = gasmc(piplon, kk, iw)
              FSFC(iplon, iw, kk) = gfsfc(piplon, kk, iw)
            end do
            end do
            end do
!$acc end kernels

!$acc kernels
            do iplon = 1, colr
              piplon = profi(iplon + cols - 1)
              wkl(iplon,1,:) = gh2ovmr(piplon,1:nlay)
              wkl(iplon,2,:) = gco2vmr(piplon,1:nlay)
              wkl(iplon,3,:) = go3vmr(piplon,1:nlay)
              wkl(iplon,4,:) = gn2ovmr(piplon,1:nlay)
              wkl(iplon,5,:) = 0.0
              wkl(iplon,6,:) = gch4vmr(piplon,1:nlay)
              wkl(iplon,7,:) = go2vmr(piplon,1:nlay)  
              coszen(iplon)  = gcoszen(piplon)
            end do
!$acc end kernels
          end if    

!$acc kernels
          cossza = max(zepzen,coszen)
!$acc end kernels  

!$acc kernels
          do iplon = 1,colr
            do l = 1,nlay
              coldry(iplon, l) = (plev(iplon, l)-plev(iplon, l+1)) * 1.e3  * avogad / &
                 (1.e2  * grav * ((1.  - wkl(iplon, 1,l)) * amd + wkl(iplon, 1,l) * amw) * &
                 (1.  + wkl(iplon, 1,l)))
            end do
          end do
!$acc end kernels

!$acc kernels
          do iplon = 1,colr
            do l = 1,nlay
              do imol = 1, nmol
                wkl(iplon,imol,l) = coldry(iplon,l) * wkl(iplon,imol,l)
              end do
            end do
          end do
!$acc end kernels




      IF ( colr < 8 ) THEN

        DO jj = 1,ngptsw
        DO kk = 1,nlay+1
        DO ii = colr+1, 8
           TAORMC(ii,jj,kk) = TAORMC(colr,jj,kk)
           TAUCMC(ii,jj,kk) = TAUCMC(colr,jj,kk)
           SSACMC(ii,jj,kk) = SSACMC(colr,jj,kk)
           ASMCMC(ii,jj,kk) = ASMCMC(colr,jj,kk)
           FSFCMC(ii,jj,kk) = FSFCMC(colr,jj,kk)
        ENDDO
        ENDDO
        ENDDO
        DO ib = 1,13
        DO ii = colr+1, 8
           albdir(ii,ib) = albdir(colr,ib)
           albdif(ii,ib) = albdif(colr,ib)
        ENDDO
        ENDDO
        DO kk = 1,nlay+1
        DO ii = colr+1, 8
           plev(ii,kk) = plev(colr,kk)
           tlev(ii,kk) = tlev(colr,kk)
           coldry(ii,kk) = coldry(colr,kk)
        ENDDO
        ENDDO
        DO kk = 1,nlay
        DO ii = colr+1, 8
           play(ii,kk) = play(colr,kk)
           tlay(ii,kk) = tlay(colr,kk)
           cld(ii,kk)  = cld(colr,kk)
           ciwp(ii,kk) = ciwp(colr,kk)
           clwp(ii,kk) = clwp(colr,kk)
           cswp(ii,kk) = cswp(colr,kk)
           rei(ii,kk) = rei(colr,kk)
           rel(ii,kk) = rel(colr,kk)
           res(ii,kk) = res(colr,kk)
        ENDDO
        ENDDO
        DO ii = colr+1, 8
           tsfc(ii) = tsfc(colr)
        ENDDO
        IF ( iaer==10 ) THEN
         DO jj = 1,nbndsw
         DO kk = 1,nlay+1
         DO ii = colr+1, 8
           TAUA(ii,jj,kk) = TAUA(colr,jj,kk)
           ASYA(ii,jj,kk) = ASYA(colr,jj,kk)
           OMGA(ii,jj,kk) = OMGA(colr,jj,kk)
         ENDDO
         ENDDO
         ENDDO
        ENDIF
        DO jj = 1,nbndsw
        DO kk = 1,nlay
        DO ii = colr+1, 8
           TAUC(ii,jj,kk) = TAUC(colr,jj,kk)
           SSAC(ii,jj,kk) = SSAC(colr,jj,kk)
           ASMC(ii,jj,kk) = ASMC(colr,jj,kk)
           FSFC(ii,jj,kk) = FSFC(colr,jj,kk)
        ENDDO
        ENDDO
        ENDDO
        DO kk = 1,nlay
        DO jj = 1,mxmol
        DO ii = colr+1, 8
           wkl(ii,jj,kk) = wkl(colr,jj,kk)
        ENDDO
        ENDDO
        ENDDO
        DO ii = colr+1, 8
           coszen(ii) = coszen(colr)
        ENDDO

      ENDIF


          if (cc==2) then   
            call mcica_sw(8, nlay, 112, icld, irng, play, &
                          cld, ciwp, clwp, cswp, tauc, ssac, asmc, fsfc, &
                          cldfmcl, ciwpmcl, clwpmcl, cswpmcl, &
                          taucmc, ssacmc, asmcmc, fsfcmc, 1 ) 
          end if   

          if (cc==2) then   
            call cldprmc_sw(8, nlay, inflgsw, iceflgsw, liqflgsw,  &
                            cldfmcl, ciwpmcl, clwpmcl, cswpmcl, rei, rel, res, &
                            taormc, taucmc, ssacmc, asmcmc, fsfcmc)
          end if

          call setcoef_sw(8, nlay, play , tlay , plev , tlev , tsfc , &
                          coldry , wkl , &
                          laytrop, layswtch, laylow, jp , jt , jt1 , &
                          co2mult , colch4 , colco2 , colh2o , colmol , coln2o , &
                          colo2 , colo3 , fac00 , fac01 , fac10 , fac11 , &
                          selffac , selffrac , indself , forfac , forfrac , indfor )

          call spcvmc_sw(cc, ncol, 8, nlay, istart, iend, icpr, idelm, iout, &
                         play, tlay, plev, tlev, &
                         tsfc, albdif, albdir, &
                         cldfmcl, taucmc, asmcmc, ssacmc, taormc, &
                         taua, asya, omga, cossza, coldry, adjflux, &	 
                         laytrop, layswtch, laylow, jp, jt, jt1, &
                         co2mult, colch4, colco2, colh2o, colmol, &
                         coln2o, colo2, colo3, &
                         fac00, fac01, fac10, fac11, &
                         selffac, selffrac, indself, forfac, forfrac, indfor, &
                         zbbfd, zbbfu, zbbcd, zbbcu, zuvfd, &
                         zuvcd, znifd, znicd, &
                         zbbfddir, zbbcddir, zuvfddir, zuvcddir, znifddir, znicddir,&
                         zgco,zomco,zrdnd,zref,zrefo,zrefd,zrefdo,ztauo,zdbt,ztdbt,&
                         ztra,ztrao,ztrad,ztrado,zfd,zfu,ztaug, ztaur, zsflxzen)

   



          if (cc==1) then   
!$acc kernels loop independent
            do iplon = 1, colr
              piplon = profic(iplon + cols - 1)
        
              do i = 1, nlay+1
                swuflxc(piplon,i) = zbbcu(iplon,i) 
                swdflxc(piplon,i) = zbbcd(iplon,i) 
                swuflx(piplon,i) = zbbfu(iplon,i) 
                swdflx(piplon,i) = zbbfd(iplon,i) 


                swdkdir(piplon,i) = zbbfddir(iplon,i)
                swdkdif(piplon,i) = zbbfd(iplon,i) - zbbfddir(iplon,i)

                sibvisdir(piplon,i) = zuvfddir(iplon,i)
                sibvisdif(piplon,i) = zuvfd(iplon,i) - zuvfddir(iplon,i)

                sibnirdir(piplon,i) = znifddir(iplon,i)
                sibnirdif(piplon,i) = znifd(iplon,i) - znifddir(iplon,i)
              enddo



              do i = 1, nlay+1
                swnflxc(iplon,i)  = swdflxc(piplon,i) - swuflxc(piplon,i)
                swnflx(iplon,i)  = swdflx(piplon,i) - swuflx(piplon,i)
              enddo



              do i = 1, nlay
                zdpgcp = heatfac / (plev(iplon, i) - plev(iplon, i+1))
                swhrc(piplon,i) = (swnflxc(iplon,i+1)  - swnflxc(iplon,i) ) * zdpgcp
                swhr(piplon,i) = (swnflx(iplon,i+1)  - swnflx(iplon,i) ) * zdpgcp
              enddo
              swhrc(piplon,nlay) = 0. 
              swhr(piplon,nlay) = 0. 
       

            enddo
!$acc end kernels 

          else     
!$acc kernels loop independent
            do iplon = 1, colr
              piplon = profi(iplon + cols - 1)

              do i = 1, nlay+1
                swuflxc(piplon,i) = zbbcu(iplon,i) 
                swdflxc(piplon,i) = zbbcd(iplon,i) 
                swuflx(piplon,i) = zbbfu(iplon,i) 
                swdflx(piplon,i) = zbbfd(iplon,i) 


                swdkdir(piplon,i) = zbbfddir(iplon,i)
                swdkdif(piplon,i) = zbbfd(iplon,i) - zbbfddir(iplon,i)

                sibvisdir(piplon,i) = zuvfddir(iplon,i)
                sibvisdif(piplon,i) = zuvfd(iplon,i) - zuvfddir(iplon,i)

                sibnirdir(piplon,i) = znifddir(iplon,i)
                sibnirdif(piplon,i) = znifd(iplon,i) - znifddir(iplon,i)
              enddo



              do i = 1, nlay+1
                swnflxc(iplon,i)  = swdflxc(piplon,i) - swuflxc(piplon,i)
                swnflx(iplon,i)  = swdflx(piplon,i) - swuflx(piplon,i)
              enddo



              do i = 1, nlay
                zdpgcp = heatfac / (plev(iplon, i) - plev(iplon, i+1))
                swhrc(piplon,i) = (swnflxc(iplon,i+1)  - swnflxc(iplon,i) ) * zdpgcp
                swhr(piplon,i) = (swnflx(iplon,i+1)  - swnflx(iplon,i) ) * zdpgcp
              enddo
              swhrc(piplon,nlay) = 0. 
              swhr(piplon,nlay) = 0. 
         

            enddo
!$acc end kernels 

          end if   


        end do
        
      end do

!$acc end data

      end subroutine rrtmg_sw_sub


      real  function earth_sun(idn)










      use rrsw_con_f, only : pi

      integer , intent(in) :: idn

      real  :: gamma

      gamma = 2. *pi*(idn-1)/365. 



      earth_sun = 1.000110  + .034221  * cos(gamma) + .001289  * sin(gamma) + &
                   .000719  * cos(2. *gamma) + .000077  * sin(2. *gamma)

      end function earth_sun

      end module rrtmg_sw_rad_f


      MODULE module_ra_rrtmg_swf

      use module_model_constants, only : cp
      USE module_wrf_error


      use parrrsw_f, only : nbndsw, ngptsw, naerec
      use rrtmg_sw_init_f, only: rrtmg_sw_ini
      use rrtmg_sw_rad_f, only: rrtmg_sw


      use module_ra_rrtmg_lwf, only : inirad, o3data, relcalc, reicalc, retab



      CONTAINS


      SUBROUTINE RRTMG_SWRAD_FAST(                                &
                       rthratensw,                                &
                       swupt, swuptc, swdnt, swdntc,              &
                       swupb, swupbc, swdnb, swdnbc,              &

                       swcf, gsw,                                 &
                       xtime, gmt, xlat, xlong,                   &
                       radt, degrad, declin,                      &
                       coszr, julday, solcon,                     &
                       albedo, t3d, t8w, tsk,                     &
                       p3d, p8w, pi3d, rho3d,                     &
                       dz8w, cldfra3d, lradius, iradius,          & 
                       is_cammgmp_used, r, g,                     &
                       re_cloud,re_ice,re_snow,                   &
                       has_reqc,has_reqi,has_reqs,                &
                       icloud, warm_rain,                         &
                       f_ice_phy, f_rain_phy,                     &
                       xland, xice, snow,                         &
                       qv3d, qc3d, qr3d,                          &
                       qi3d, qs3d, qg3d,                          &
                       o3input, o33d,                             &
                       aer_opt, aerod, no_src,                    &
                       alswvisdir, alswvisdif,                    &  
                       alswnirdir, alswnirdif,                    &  
                       swvisdir, swvisdif,                        &  
                       swnirdir, swnirdif,                        &  
                       sf_surface_physics,                        &  
                       f_qv, f_qc, f_qr, f_qi, f_qs, f_qg,        &
                       tauaer300,tauaer400,tauaer600,tauaer999,   & 
                       gaer300,gaer400,gaer600,gaer999,           & 
                       waer300,waer400,waer600,waer999,           & 
                       aer_ra_feedback,                           &

                       progn,                                     &
                       qndrop3d,f_qndrop,                         & 
                       ids,ide, jds,jde, kds,kde,                 & 
                       ims,ime, jms,jme, kms,kme,                 &
                       its,ite, jts,jte, kts,kte,                 &
                       swupflx, swupflxc, swdnflx, swdnflxc,      &
                       tauaer3d_sw,ssaaer3d_sw,asyaer3d_sw,       & 
                       swddir, swddni, swddif,                    & 
                       xcoszen,julian                             & 
                                                                  )

      IMPLICIT NONE

   LOGICAL, INTENT(IN )      ::        warm_rain
   LOGICAL, INTENT(IN )      ::   is_CAMMGMP_used 

   INTEGER, INTENT(IN )      ::        ids,ide, jds,jde, kds,kde, &
                                       ims,ime, jms,jme, kms,kme, &
                                       its,ite, jts,jte, kts,kte

   INTEGER, INTENT(IN )      ::        ICLOUD

   REAL, DIMENSION( ims:ime, kms:kme, jms:jme )                 , &
         INTENT(IN   ) ::                                   dz8w, &
                                                             t3d, &
                                                             t8w, &
                                                             p3d, &
                                                             p8w, &
                                                            pi3d, &
                                                           rho3d

   REAL, DIMENSION( ims:ime, kms:kme, jms:jme )                 , &
         INTENT(INOUT)  ::                            RTHRATENSW

   REAL, DIMENSION( ims:ime, jms:jme )                          , &
         INTENT(INOUT)  ::                                   GSW, &
                                                            SWCF, &
                                                           COSZR

   INTEGER, INTENT(IN  )     ::                           JULDAY
   REAL, INTENT(IN    )      ::                      RADT,DEGRAD, &
                                         XTIME,DECLIN,SOLCON,GMT

   REAL, DIMENSION( ims:ime, jms:jme )                          , &
         INTENT(IN   )  ::                                  XLAT, &
                                                           XLONG, &
                                                           XLAND, &
                                                            XICE, &
                                                            SNOW, &
                                                             TSK, &
                                                          ALBEDO


   REAL, DIMENSION( ims:ime, jms:jme )                          , &
         OPTIONAL                                               , &
         INTENT(IN)     ::                            ALSWVISDIR, &     
                                                      ALSWVISDIF, &
                                                      ALSWNIRDIR, &
                                                      ALSWNIRDIF

   REAL, DIMENSION( ims:ime, jms:jme )                          , &
         OPTIONAL                                               , &
         INTENT(OUT)    ::                              SWVISDIR, &
                                                        SWVISDIF, &
                                                        SWNIRDIR, &
                                                        SWNIRDIF        
   INTEGER, INTENT(IN) :: sf_surface_physics                            





   real, dimension(ims:ime,jms:jme), intent(out) :: &
         swddir,  &  
         swddni,  &  
         swddif      
   real, optional, intent(in) :: &
         julian      
   real, dimension(ims:ime,jms:jme), optional, intent(in) :: &
         xcoszen     
   real, dimension(:,:,:,:), pointer :: tauaer3d_sw,ssaaer3d_sw,asyaer3d_sw



   REAL, INTENT(IN  )   ::                                   R,G



   REAL, DIMENSION( ims:ime, kms:kme, jms:jme )                 , &
         OPTIONAL                                               , &
         INTENT(IN   ) ::                                         &
                                                        CLDFRA3D, &
                                                         LRADIUS, &
                                                         IRADIUS, &
                                                            QV3D, &
                                                            QC3D, &
                                                            QR3D, &
                                                            QI3D, &
                                                            QS3D, &
                                                            QG3D, &
                                                        QNDROP3D


   REAL, DIMENSION(ims:ime, kms:kme, jms:jme), INTENT(IN)::       &
                                                        RE_CLOUD, &
                                                          RE_ICE, &
                                                         RE_SNOW
   INTEGER, INTENT(IN):: has_reqc, has_reqi, has_reqs

   real pi,third,relconst,lwpmin,rhoh2o

   REAL, DIMENSION( ims:ime, kms:kme, jms:jme )                 , &
         OPTIONAL                                               , &
         INTENT(IN   ) ::                                         &
                                                       F_ICE_PHY, &
                                                      F_RAIN_PHY

   LOGICAL, OPTIONAL, INTENT(IN)   ::                             &
                          F_QV,F_QC,F_QR,F_QI,F_QS,F_QG,F_QNDROP


   REAL, DIMENSION( ims:ime, kms:kme, jms:jme ), OPTIONAL ,       &
       INTENT(IN    ) :: tauaer300,tauaer400,tauaer600,tauaer999, & 
                                 gaer300,gaer400,gaer600,gaer999, & 
                                 waer300,waer400,waer600,waer999    

   INTEGER,    INTENT(IN  ), OPTIONAL   ::       aer_ra_feedback

   INTEGER,    INTENT(IN  ), OPTIONAL   ::       progn

   REAL, DIMENSION( ims:ime, kms:kme, jms:jme )                 , &
         OPTIONAL                                               , &
         INTENT(IN   ) :: O33D
   INTEGER, OPTIONAL, INTENT(IN ) :: o3input

   INTEGER,           INTENT(IN ) :: no_src
   REAL, DIMENSION( ims:ime, kms:kme, jms:jme, 1:no_src )       , &
         OPTIONAL                                               , &
         INTENT(IN   ) :: aerod
   INTEGER, OPTIONAL, INTENT(IN ) :: aer_opt


   real, save :: wavemin(nbndsw) 
   data wavemin /3.077,2.500,2.150,1.942,1.626,1.299, &
   1.242,0.778,0.625,0.442,0.345,0.263,0.200,3.846/
   real, save :: wavemax(nbndsw) 
   data wavemax/3.846,3.077,2.500,2.150,1.942,1.626, &
   1.299,1.242,0.778,0.625,0.442,0.345,0.263,12.195/
   real wavemid(nbndsw) 
   real, parameter :: thresh=1.e-9
   real ang,slope
   character(len=200) :: msg


   REAL, DIMENSION( ims:ime, jms:jme ),                           &
         OPTIONAL, INTENT(INOUT) ::                               &
                                       SWUPT,SWUPTC,SWDNT,SWDNTC, &
                                       SWUPB,SWUPBC,SWDNB,SWDNBC



   REAL, DIMENSION( ims:ime, kms:kme+2, jms:jme ),                &
         OPTIONAL, INTENT(OUT) ::                                 &
                               SWUPFLX,SWUPFLXC,SWDNFLX,SWDNFLXC


 
   REAL, DIMENSION( kts:kte+1 ) ::                          Pw1D, &
                                                            Tw1D

   REAL, DIMENSION( kts:kte ) ::                          TTEN1D, &
                                                        CLDFRA1D, &
                                                            DZ1D, &
                                                             P1D, &
                                                             T1D, &
                                                            QV1D, &
                                                            QC1D, &
                                                            QR1D, &
                                                            QI1D, &
                                                            QS1D, &
                                                            QG1D, &
                                                            O31D, &
                                                        qndrop1d 


    integer ::                                              ncol, &
                                                            nlay, &
                                                            icld, &
                                                            iaer, &
                                                         inflgsw, &
                                                        iceflgsw, &
                                                        liqflgsw

    real, dimension( (jte-jts+1)*(ite-its+1), kts:kte+2 )  ::                  plev, &
                                                            tlev
    real, dimension( (jte-jts+1)*(ite-its+1), kts:kte+1 )  ::                  play, &
                                                            tlay, &
                                                          h2ovmr, &
                                                           o3vmr, &
                                                          co2vmr, &
                                                           o2vmr, &
                                                          ch4vmr, &
                                                          n2ovmr
    real, dimension( kts:kte+1 )  ::                       o3mmr


    real, dimension( (jte-jts+1)*(ite-its+1) )  ::                            asdir, &
                                                           asdif, &
                                                           aldir, &
                                                           aldif


    real, dimension( (jte-jts+1)*(ite-its+1), kts:kte+1 )  ::                clwpth, &
                                                          ciwpth, &
                                                          cswpth, &
                                                             rel, &
                                                             rei, &
                                                             res, &
                                                         cldfrac




    real, dimension( (jte-jts+1)*(ite-its+1), kts:kte+1, nbndsw )  ::        taucld, &
                                                          ssacld, &
                                                          asmcld, &
                                                          fsfcld








    real, dimension( (jte-jts+1)*(ite-its+1), kts:kte+1, nbndsw )  ::        tauaer, &
                                                          ssaaer, &
                                                          asmaer   
    real, dimension( (jte-jts+1)*(ite-its+1), kts:kte+1, naerec )  ::         ecaer


    real, dimension( (jte-jts+1)*(ite-its+1), kts:kte+2 )  ::                swuflx, &
                                                          swdflx, &
                                                         swuflxc, &
                                                         swdflxc, &
                                                       sibvisdir, &  
                                                       sibvisdif, &
                                                       sibnirdir, &
                                                       sibnirdif     

    real, dimension( (jte-jts+1)*(ite-its+1), kts:kte+2 ) ::                swdkdir, &  
                                                         swdkdif     

    real, dimension( (jte-jts+1)*(ite-its+1), kts:kte+1 )  ::                  swhr, &
                                                           swhrc

    real, dimension ( (jte-jts+1)*(ite-its+1) ) ::                             tsfc, &
                                                              ps, &
                                                          coszen
    real ::                                                   ro, &
                                                              dz, &
                                                           adjes, &
                                                            scon, &  
                                                snow_mass_factor
    integer ::                                            dyofyr

    integer:: idx_rei
    real:: corr



    real :: co2
    data co2 / 379.e-6 / 

    real :: ch4
    data ch4 / 1774.e-9 / 

    real :: n2o
    data n2o / 319.e-9 / 

    real :: o2
    data o2 / 0.209488 /

    integer :: iplon, irng, permuteseed
    integer :: nb



















                                                                                 
    real :: amdw     
    real :: amdo     
    real :: amdo2    
    data amdw /  1.607793 /                                                    
    data amdo /  0.603461 /
    data amdo2 / 0.905190 /
    

    real, dimension((jte-jts+1)*(ite-its+1), 1:kte-kts+1 )  :: pdel          

    real, dimension((jte-jts+1)*(ite-its+1), 1:kte-kts+1) ::   cicewp, &     
                                            cliqwp, &     
                                            csnowp, &     
                                             reliq, &     
                                             reice        
    real, dimension((jte-jts+1)*(ite-its+1), 1:kte-kts+1):: recloud1d, &
                                           reice1d, &
                                          resnow1d
    real :: gliqwp, gicewp, gsnowp, gravmks



    REAL   ::  FP


    real :: coszrs                      
    logical :: dorrsw                   

    real, dimension ((jte-jts+1)*(ite-its+1)) :: landfrac, landm, snowh, icefrac

    integer :: pcols, pver
    integer :: icol
    integer :: rpart

    REAL :: XT24, TLOCTM, HRANG, XXLAT

    INTEGER :: i,j,K, na
    LOGICAL :: predicate

    REAL :: da, eot 

    integer :: icnt









      rpart = 8








      if (present(xcoszen)) then
         call wrf_debug(100,'coszen from radiation driver')
      end if


   ncol = (jte-jts+1)*(ite-its+1)

   icnt = 0

   j_loop: do j = jts,jte


      i_loop: do i = its,ite

         icol = i-its+1 + (j-jts)*(ite-its+1)


         dorrsw = .true.








         if (present(xcoszen)) then
            coszr(i,j)=xcoszen(i,j)
            coszrs=xcoszen(i,j)
         else



            xt24 = mod(xtime+radt*0.5,1440.)+eot
            tloctm = gmt + xt24/60. + xlong(i,j)/15.
            hrang = 15. * (tloctm-12.) * degrad
            xxlat = xlat(i,j) * degrad
            coszrs = sin(xxlat) * sin(declin) &
                   + cos(xxlat) * cos(declin) * cos(hrang)
            coszr(i,j) = coszrs
         end if


         if (coszrs .gt. 0.0) icnt = icnt + 1







         if (dorrsw) then

         do k=kts,kte+1
            Pw1D(K) = p8w(I,K,J)/100.
            Tw1D(K) = t8w(I,K,J)
         enddo

         DO K=kts,kte
            QV1D(K)=0.
            QC1D(K)=0.
            QR1D(K)=0.
            QI1D(K)=0.
            QS1D(K)=0.
            CLDFRA1D(k)=0.
            QNDROP1D(k)=0.
         ENDDO

         DO K=kts,kte
            QV1D(K)=QV3D(I,K,J)
            QV1D(K)=max(0.,QV1D(K))
         ENDDO

         IF (PRESENT(O33D)) THEN
            DO K=kts,kte
               O31D(K)=O33D(I,K,J)
            ENDDO
         ELSE
            DO K=kts,kte
               O31D(K)=0.0
            ENDDO
         ENDIF

         DO K=kts,kte
            TTEN1D(K)=0.
            T1D(K)=t3d(I,K,J)
            P1D(K)=p3d(I,K,J)/100.
            DZ1D(K)=dz8w(I,K,J)
         ENDDO



         IF (ICLOUD .ne. 0) THEN
            IF ( PRESENT( CLDFRA3D ) ) THEN
              DO K=kts,kte
                 CLDFRA1D(k)=CLDFRA3D(I,K,J)
              ENDDO
            ENDIF

            IF (PRESENT(F_QC) .AND. PRESENT(QC3D)) THEN
              IF ( F_QC) THEN
                 DO K=kts,kte
                    QC1D(K)=QC3D(I,K,J)
                    QC1D(K)=max(0.,QC1D(K))
                 ENDDO
              ENDIF
            ENDIF

            IF (PRESENT(F_QR) .AND. PRESENT(QR3D)) THEN
              IF ( F_QR) THEN
                 DO K=kts,kte
                    QR1D(K)=QR3D(I,K,J)
                    QR1D(K)=max(0.,QR1D(K))
                 ENDDO
              ENDIF
            ENDIF

            IF ( PRESENT(F_QNDROP).AND.PRESENT(QNDROP3D)) THEN
             IF (F_QNDROP) THEN
              DO K=kts,kte
               qndrop1d(K)=qndrop3d(I,K,J)
              ENDDO
             ENDIF
            ENDIF





            IF ( PRESENT ( F_QI ) ) THEN
              predicate = F_QI
            ELSE
              predicate = .FALSE.
            ENDIF


            IF (.NOT. predicate .and. .not. warm_rain) THEN
               DO K=kts,kte
                  IF (T1D(K) .lt. 273.15) THEN
                  QI1D(K)=QC1D(K)
                  QS1D(K)=QR1D(K)
                  QC1D(K)=0.
                  QR1D(K)=0.
                  ENDIF
               ENDDO
            ENDIF

            IF (PRESENT(F_QI) .AND. PRESENT(QI3D)) THEN
               IF (F_QI) THEN
                  DO K=kts,kte
                     QI1D(K)=QI3D(I,K,J)
                     QI1D(K)=max(0.,QI1D(K))
                  ENDDO
               ENDIF
            ENDIF

            IF (PRESENT(F_QS) .AND. PRESENT(QS3D)) THEN
               IF (F_QS) THEN
                  DO K=kts,kte
                     QS1D(K)=QS3D(I,K,J)
                     QS1D(K)=max(0.,QS1D(K))
                  ENDDO
               ENDIF
            ENDIF

            IF (PRESENT(F_QG) .AND. PRESENT(QG3D)) THEN
               IF (F_QG) THEN
                  DO K=kts,kte
                     QG1D(K)=QG3D(I,K,J)
                     QG1D(K)=max(0.,QG1D(K))
                  ENDDO
               ENDIF
            ENDIF


            IF ( PRESENT(F_QI) .and. PRESENT(F_QC) .and. PRESENT(F_QS) .and. PRESENT(F_ICE_PHY) ) THEN
               IF ( F_QC .and. .not. F_QI .and. F_QS ) THEN
                  DO K=kts,kte
                     qi1d(k) = 0.1*qs3d(i,k,j)
                     qs1d(k) = 0.9*qs3d(i,k,j)
                     qc1d(k) = qc3d(i,k,j)
                     qi1d(k) = max(0.,qi1d(k))
                     qc1d(k) = max(0.,qc1d(k))
                  ENDDO
               ENDIF
            ENDIF

         ENDIF





         DO K=kts,kte
            QV1D(K)=AMAX1(QV1D(K),1.E-12) 
         ENDDO




         nlay = (kte - kts + 1) + 1








         icld = 2
         inflgsw = 2
         iceflgsw = 3
         liqflgsw = 1


         IF (ICLOUD .ne. 0) THEN
            IF ( has_reqc .ne. 0) THEN
               inflgsw = 3
               DO K=kts,kte
                  recloud1D(icol,K) = MAX(2.5, re_cloud(I,K,J)*1.E6)
                  if (recloud1D(icol,K).LE.2.5.AND.cldfra3d(i,k,j).gt.0. &
     &                            .AND. (XLAND(I,J)-1.5).GT.0.) then      
                     recloud1D(icol,K) = 10.5
                  elseif (recloud1D(icol,K).LE.2.5.AND.cldfra3d(i,k,j).gt.0. &
     &                            .AND. (XLAND(I,J)-1.5).LT.0.) then      
                     recloud1D(icol,K) = 7.5
                  endif
               ENDDO
            ELSE
               DO K=kts,kte
                  recloud1D(icol,K) = 5.0
               ENDDO
            ENDIF

            IF ( has_reqi .ne. 0) THEN
               inflgsw  = 4
               iceflgsw = 4
               DO K=kts,kte
                  reice1D(icol,K) = MAX(5., re_ice(I,K,J)*1.E6)
                  if (reice1D(icol,K).LE.5..AND.cldfra3d(i,k,j).gt.0.) then
                     idx_rei = int(t3d(i,k,j)-179.)
                     idx_rei = min(max(idx_rei,1),75)
                     corr = t3d(i,k,j) - int(t3d(i,k,j))
                     reice1D(icol,K) = retab(idx_rei)*(1.-corr) +      &
     &                                 retab(idx_rei+1)*corr
                     reice1D(icol,K) = MAX(reice1D(icol,K), 5.0)
                  endif
               ENDDO
            ELSE
               DO K=kts,kte
                  reice1D(icol,K) = 10.0
               ENDDO
            ENDIF

            IF ( has_reqs .ne. 0) THEN
               inflgsw  = 5
               iceflgsw = 5
               DO K=kts,kte
                  resnow1D(icol,K) = MAX(10., re_snow(I,K,J)*1.E6)
               ENDDO
            ELSE
               DO K=kts,kte
                  resnow1D(icol,K) = 10.
               ENDDO
            ENDIF
         ENDIF


         coszen(icol) = coszrs

         scon = solcon





         dyofyr = 0
         adjes = 1.0 




         plev(icol,1) = pw1d(1)
         tlev(icol,1) = tw1d(1)
         tsfc(icol) = tsk(i,j)
         do k = kts, kte
            play(icol,k) = p1d(k)
            plev(icol,k+1) = pw1d(k+1)
            pdel(icol,k) = plev(icol,k) - plev(icol,k+1)
            tlay(icol,k) = t1d(k)
            tlev(icol,k+1) = tw1d(k+1)
            h2ovmr(icol,k) = qv1d(k) * amdw
            co2vmr(icol,k) = co2
            o2vmr(icol,k) = o2
            ch4vmr(icol,k) = ch4
            n2ovmr(icol,k) = n2o
         enddo







         play(icol,kte+1) = 0.5 * plev(icol,kte+1)
         tlay(icol,kte+1) = tlev(icol,kte+1) + 0.0
         plev(icol,kte+2) = 1.0e-5
         tlev(icol,kte+2) = tlev(icol,kte+1) + 0.0
         tlev(icol,kte+2) = tlev(icol,kte+1) + 0.0
         h2ovmr(icol,kte+1) = h2ovmr(icol,kte) 
         co2vmr(icol,kte+1) = co2vmr(icol,kte) 
         o2vmr(icol,kte+1) = o2vmr(icol,kte) 
         ch4vmr(icol,kte+1) = ch4vmr(icol,kte) 
         n2ovmr(icol,kte+1) = n2ovmr(icol,kte) 



         call inirad (o3mmr,plev(icol,:),kts,kte)

        if(present(o33d)) then
         do k = kts, kte+1
            o3vmr(icol,k) = o3mmr(k) * amdo
            IF ( PRESENT( O33D ) ) THEN
            if(o3input .eq. 2)then
               if(k.le.kte)then
                 o3vmr(icol,k) = o31d(k)
               else

                 o3vmr(icol,k) = o31d(kte) - o3mmr(kte)*amdo + o3mmr(k)*amdo
                 if(o3vmr(icol,k) .le. 0.)o3vmr(icol,k) = o3mmr(k)*amdo
               endif
            endif
            ENDIF
         enddo
        else
         do k = kts, kte+1
            o3vmr(icol,k) = o3mmr(k) * amdo
         enddo
        endif













    IF ( sf_surface_physics .eq. 8 .AND. XLAND(i,j) .LT. 1.5) THEN
         asdir(icol) = ALSWVISDIR(I,J)
         asdif(icol) = ALSWVISDIF(I,J)
         aldir(icol) = ALSWNIRDIR(I,J)
         aldif(icol) = ALSWNIRDIF(I,J)
    ELSE
         asdir(icol) = albedo(i,j)
         asdif(icol) = albedo(i,j)
         aldir(icol) = albedo(i,j)
         aldif(icol) = albedo(i,j)
    ENDIF









         if (inflgsw .eq. 0) then


            do k = kts, kte
               cldfrac(icol,k) = cldfra1d(k)
               do nb = 1, nbndsw
                  taucld(icol,k,nb) = 0.0
                  ssacld(icol,k,nb) = 1.0
                  asmcld(icol,k,nb) = 0.0
                  fsfcld(icol,k,nb) = 0.0
               enddo
            enddo



            do k = kts, kte
               clwpth(icol,k) = 0.0
               ciwpth(icol,k) = 0.0
               rel(icol,k) = 10.0
               rei(icol,k) = 10.
            enddo
         endif




         if (inflgsw .gt. 0) then 
            do k = kts, kte
               cldfrac(icol,k) = cldfra1d(k)
            enddo


            pcols = ncol
            pver = kte - kts + 1
            gravmks = g
            landfrac(icol) = 2.-XLAND(I,J)
            landm(icol) = landfrac(icol)
            snowh(icol) = 0.001*SNOW(I,J)
            icefrac(icol) = XICE(I,J)





            do k = kts, kte
               gicewp = (qi1d(k)+qs1d(k)) * pdel(icol,k)*100.0 / gravmks * 1000.0     
               gliqwp = qc1d(k) * pdel(icol,k)*100.0 / gravmks * 1000.0     
               cicewp(icol,k) = gicewp / max(0.01,cldfrac(icol,k))               
               cliqwp(icol,k) = gliqwp / max(0.01,cldfrac(icol,k))               
            end do





           if(iceflgsw.ge.4)then 
              do k = kts, kte
                     gicewp = qi1d(k) * pdel(icol,k)*100.0 / gravmks * 1000.0     
                     cicewp(icol,k) = gicewp / max(0.01,cldfrac(icol,k))               
              end do
           end if









           if(iceflgsw.eq.5)then
              do k = kts, kte
                 snow_mass_factor = 1.0                 
                 if (resnow1d(icol,k) .gt. 130.)then 
                     snow_mass_factor = (130.0/resnow1d(icol,k))*(130.0/resnow1d(icol,k))
                     resnow1d(icol,k)   = 130.0
                 endif
                 gsnowp = qs1d(k) * snow_mass_factor * pdel(icol,k)*100.0 / gravmks * 1000.0     
                 csnowp(icol,k) = gsnowp / max(0.01,cldfrac(icol,k))
              end do
           end if



  if( PRESENT( progn ) ) then
    if (progn == 1) then


      pi = 4.*atan(1.0)
      third=1./3.
      rhoh2o=1.e3
      relconst=3/(4.*pi*rhoh2o)


      lwpmin=3.e-5
      do k = kts, kte
         reliq(icol,k) = 10.
         if( PRESENT( F_QNDROP ) ) then
            if( F_QNDROP ) then
              if ( qc1d(k)*pdel(icol,k).gt.lwpmin.and. &
                   qndrop1d(k).gt.1000. ) then
               reliq(icol,k)=(relconst*qc1d(k)/qndrop1d(k))**third 

               reliq(icol,k)=1.1*reliq(icol,k)
               reliq(icol,k)=reliq(icol,k)*1.e6 
               reliq(icol,k)=max(reliq(icol,k),4.)
               reliq(icol,k)=min(reliq(icol,k),20.)
              end if
            end if
         end if
      end do





    else  
      call relcalc(icol, pcols, pver, tlay, landfrac, landm, icefrac, reliq, snowh)
    endif
  else   
      call relcalc(icol, pcols, pver, tlay, landfrac, landm, icefrac, reliq, snowh)
  endif


      call reicalc(icol, pcols, pver, tlay, reice)






      if (inflgsw .ge. 3) then
         do k = kts, kte
            reliq(icol,k) = recloud1d(icol,k)
         end do
      endif
      if (iceflgsw .ge. 4) then
         do k = kts, kte
            reice(icol,k) = reice1d(icol,k)
         end do
      endif




            if (iceflgsw .eq. 3) then
               do k = kts, kte
                  reice(icol,k) = reice(icol,k) * 1.0315
                  reice(icol,k) = min(140.0,reice(icol,k))
               end do
            endif



            if(is_CAMMGMP_used) then
               do k = kts, kte
                  if ( qi1d(k) .gt. 1.e-20 .or. qs1d(k) .gt. 1.e-20) then
                     reice(icol,k) = iradius(i,k,j)
                  else
                     reice(icol,k) = 25.
                  end if
                  reice(icol,k) = max(5., min(140.0,reice(icol,k)))
                  if ( qc1d(k) .gt. 1.e-20) then
                     reliq(icol,k) = lradius(i,k,j)
                  else
                     reliq(icol,k) = 10.
                  end if
                  reliq(icol,k) = max(2.5, min(60.0,reliq(icol,k)))
               enddo
            endif


            do k = kts, kte
               clwpth(icol,k) = cliqwp(icol,k)
               ciwpth(icol,k) = cicewp(icol,k)
               rel(icol,k) = reliq(icol,k)
               rei(icol,k) = reice(icol,k)
            enddo


            if (inflgsw .eq. 5) then
               do k = kts, kte
                  cswpth(icol,k) = csnowp(icol,k)
                  res(icol,k) = resnow1d(icol,k)
               end do
            else
               do k = kts, kte
                  cswpth(icol,k) = 0.0
                  res(icol,k) = 10.0
               end do
            endif


            do k = kts, kte
               do nb = 1, nbndsw
                  taucld(icol,k,nb) = 0.0
                  ssacld(icol,k,nb) = 1.0
                  asmcld(icol,k,nb) = 0.0
                  fsfcld(icol,k,nb) = 0.0
               enddo
            enddo
         endif


         clwpth(icol,kte+1) = 0.
         ciwpth(icol,kte+1) = 0.
         cswpth(icol,kte+1) = 0.
         rel(icol,kte+1) = 10.
         rei(icol,kte+1) = 10.
         res(icol,kte+1) = 10.
         cldfrac(icol,kte+1) = 0.
         do nb = 1, nbndsw
            taucld(icol,kte+1,nb) = 0.
            ssacld(icol,kte+1,nb) = 1.
            asmcld(icol,kte+1,nb) = 0.
            fsfcld(icol,kte+1,nb) = 0.
         enddo


























      do nb = 1, nbndsw
      do k = kts,kte+1
         tauaer(icol,k,nb) = 0.
         ssaaer(icol,k,nb) = 1.
         asmaer(icol,k,nb) = 0.
      end do
      end do

      if ( associated (tauaer3d_sw) ) then

            do nb=1,nbndsw
               do k=kts,kte
                  tauaer(icol,k,nb)=tauaer3d_sw(i,k,j,nb)
                  ssaaer(icol,k,nb)=ssaaer3d_sw(i,k,j,nb)
                  asmaer(icol,k,nb)=asyaer3d_sw(i,k,j,nb)
               end do
            end do
      end if





      iaer = 0
      do na = 1, naerec
         do k = kts, kte+1
            ecaer(icol,k,na) = 0.
         enddo
      enddo

      IF ( PRESENT( aerod ) ) THEN
      if ( aer_opt .eq. 0 .or. aer_opt .eq. 2 .or. aer_opt .eq. 3 ) then
         iaer = 10
         do na = 1, naerec
            do k = kts, kte+1
               ecaer(icol,k,na) = 0.
            enddo
         enddo
      else if ( aer_opt .eq. 1 ) then
         iaer = 6
         do na = 1, naerec
            do k = kts, kte
               ecaer(icol,k,na) = aerod(i,k,j,na)
            enddo


            ecaer(icol,kte+1,na) = 0.
         enddo
      endif
      ENDIF


      endif

      enddo i_loop
   enddo j_loop                                           




      if (icnt .eq. 0) dorrsw = .false.
      if (dorrsw) then

         call rrtmg_sw &
            (rpart   ,ncol    ,nlay    ,icld    ,iaer   , &
             play    ,plev    ,tlay    ,tlev    ,tsfc   , &
             h2ovmr  ,o3vmr   ,co2vmr  ,ch4vmr  ,n2ovmr ,o2vmr , &
             asdir   ,asdif   ,aldir   ,aldif   , &
             coszen  ,adjes   ,dyofyr  ,scon    , &
             inflgsw ,iceflgsw,liqflgsw,cldfrac , &
             taucld  ,ssacld  ,asmcld  ,fsfcld  , &
             ciwpth  ,clwpth  ,cswpth  ,rei     ,rel     ,res, &
             tauaer  ,ssaaer  ,asmaer  ,ecaer   , &
             swuflx  ,swdflx  ,swhr    ,swuflxc ,swdflxc ,swhrc, &

             sibvisdir, sibvisdif, sibnirdir, sibnirdif,         &

             swdkdir, swdkdif                      &  
                                                  )

      endif






   j_loop2: do j = jts,jte

      i_loop2: do i = its,ite


      dorrsw = .true.
      if (coszr(i,j).le.0.0) dorrsw = .false.

      if (dorrsw) then

         if (present(xcoszen)) then
            coszr(i,j)=xcoszen(i,j)
            coszrs=xcoszen(i,j)
         else
            call wrf_error_fatal3("<stdin>",11598,&
'xcoszen must be passed into RRTMG_SWRAD_FAST')
         endif


         icol = i-its+1 + (j-jts)*(ite-its+1)

         gsw(i,j) = swdflx(icol,1) - swuflx(icol,1)
         swcf(i,j) = (swdflx(icol,kte+2) - swuflx(icol,kte+2)) - (swdflxc(icol,kte+2) - swuflxc(icol,kte+2))





         if (present(swupt)) then 

            swupt(i,j)     = swuflx(icol,kte+2)
            swuptc(i,j)    = swuflxc(icol,kte+2)
            swdnt(i,j)     = swdflx(icol,kte+2)
            swdntc(i,j)    = swdflxc(icol,kte+2)

            swupb(i,j)     = swuflx(icol,1)
            swupbc(i,j)    = swuflxc(icol,1)
            swdnb(i,j)     = swdflx(icol,1)

            swvisdir(i,j)  = sibvisdir(icol,1)
            swvisdif(i,j)  = sibvisdif(icol,1)
            swnirdir(i,j)  = sibnirdir(icol,1)
            swnirdif(i,j)  = sibnirdif(icol,1)

            swdnbc(i,j)    = swdflxc(icol,1)
         endif
            swddir(i,j)    = swdkdir(icol,1)       
            swddni(i,j)    = swddir(i,j) / coszrs  
            swddif(i,j)    = swdkdif(icol,1)          



         if ( present (swupflx) ) then
         do k=kts,kte+2
            swupflx(i,k,j)  = swuflx(icol,k)
            swupflxc(i,k,j) = swuflxc(icol,k)
            swdnflx(i,k,j)  = swdflx(icol,k)
            swdnflxc(i,k,j) = swdflxc(icol,k)
         enddo
         endif



         do k=kts,kte 
            tten1d(k) = swhr(icol,k)/86400.
            rthratensw(i,k,j) = tten1d(k)/pi3d(i,k,j)
         enddo

      else
         if (present(swupt)) then 

            swupt(i,j)     = 0.
            swuptc(i,j)    = 0.
            swdnt(i,j)     = 0.
            swdntc(i,j)    = 0.

            swupb(i,j)     = 0.
            swupbc(i,j)    = 0.
            swdnb(i,j)     = 0.
            swdnbc(i,j)    = 0.
            swvisdir(i,j)  = 0.  
            swvisdif(i,j)  = 0.
            swnirdir(i,j)  = 0.
            swnirdif(i,j)  = 0.  
         endif
            swddir(i,j)    = 0.  
            swddni(i,j)    = 0.  
            swddif(i,j)    = 0.  

      endif

      end do i_loop2
   end do j_loop2                                           












   END SUBROUTINE RRTMG_SWRAD_FAST

 

   SUBROUTINE rrtmg_swinit_fast(                                         &
                       allowed_to_read ,                            &
                       ids, ide, jds, jde, kds, kde,                &
                       ims, ime, jms, jme, kms, kme,                &
                       its, ite, jts, jte, kts, kte                 )

   IMPLICIT NONE


   LOGICAL , INTENT(IN)           :: allowed_to_read
   INTEGER , INTENT(IN)           :: ids, ide, jds, jde, kds, kde,  &
                                     ims, ime, jms, jme, kms, kme,  &
                                     its, ite, jts, jte, kts, kte


   IF ( allowed_to_read ) THEN
     CALL rrtmg_swlookuptable
   ENDIF



   call rrtmg_sw_ini(cp)

   END SUBROUTINE rrtmg_swinit_fast



      SUBROUTINE rrtmg_swlookuptable


      IMPLICIT NONE


      INTEGER :: i
      LOGICAL                 :: opened
      LOGICAL , EXTERNAL      :: wrf_dm_on_monitor

      CHARACTER*80 errmess
      INTEGER rrtmg_unit

      IF ( wrf_dm_on_monitor() ) THEN
        DO i = 10,99
          INQUIRE ( i , OPENED = opened )
          IF ( .NOT. opened ) THEN
            rrtmg_unit = i
            GOTO 2010
          ENDIF
        ENDDO
        rrtmg_unit = -1
 2010   CONTINUE
      ENDIF
      CALL wrf_dm_bcast_bytes ( rrtmg_unit , 4 )
      IF ( rrtmg_unit < 0 ) THEN
        CALL wrf_error_fatal3("<stdin>",11746,&
'module_ra_rrtmg_swf: rrtm_swlookuptable: Can not '// &
                               'find unused fortran unit to read in lookup table.' )
      ENDIF

      IF ( wrf_dm_on_monitor() ) THEN
        OPEN(rrtmg_unit,FILE='RRTMG_SW_DATA',                  &
             FORM='UNFORMATTED',STATUS='OLD',ERR=9009)
      ENDIF

      call sw_kgb16(rrtmg_unit)
      call sw_kgb17(rrtmg_unit)
      call sw_kgb18(rrtmg_unit)
      call sw_kgb19(rrtmg_unit)
      call sw_kgb20(rrtmg_unit)
      call sw_kgb21(rrtmg_unit)
      call sw_kgb22(rrtmg_unit)
      call sw_kgb23(rrtmg_unit)
      call sw_kgb24(rrtmg_unit)
      call sw_kgb25(rrtmg_unit)
      call sw_kgb26(rrtmg_unit)
      call sw_kgb27(rrtmg_unit)
      call sw_kgb28(rrtmg_unit)
      call sw_kgb29(rrtmg_unit)

      IF ( wrf_dm_on_monitor() ) CLOSE (rrtmg_unit)

      RETURN
9009  CONTINUE
      WRITE( errmess , '(A,I4)' ) 'module_ra_rrtmg_swf: error opening '// &
                                  'RRTMG_SW_DATA on unit ',rrtmg_unit
      CALL wrf_error_fatal3("<stdin>",11777,&
errmess)

      END SUBROUTINE rrtmg_swlookuptable



















      subroutine sw_kgb16(rrtmg_unit)


      use rrsw_kg16_f, only : kao, kbo, selfrefo, forrefo, sfluxrefo, &
                            rayl, strrat1, layreffr



      implicit none
      save


      integer, intent(in) :: rrtmg_unit


      character*80 errmess
      logical, external  :: wrf_dm_on_monitor














































      IF ( wrf_dm_on_monitor() ) READ (rrtmg_unit,ERR=9010) &
         rayl, strrat1, layreffr, kao, kbo, selfrefo, forrefo, sfluxrefo
      CALL wrf_dm_bcast_real ( rayl , 1 )
      CALL wrf_dm_bcast_real ( strrat1 , 1 )
      CALL wrf_dm_bcast_integer ( layreffr , 1 )
      CALL wrf_dm_bcast_bytes ( kao , size ( kao ) * 4 )
      CALL wrf_dm_bcast_bytes ( kbo , size ( kbo ) * 4 )
      CALL wrf_dm_bcast_bytes ( selfrefo , size ( selfrefo ) * 4 )
      CALL wrf_dm_bcast_bytes ( forrefo , size ( forrefo ) * 4 )
      CALL wrf_dm_bcast_bytes ( sfluxrefo , size ( sfluxrefo ) * 4 )

      RETURN
9010  CONTINUE
      WRITE( errmess , '(A,I4)' ) 'module_ra_rrtmg_swf: error reading '// &
                                  'RRTMG_SW_DATA on unit ',rrtmg_unit
      CALL wrf_error_fatal3("<stdin>",11878,&
errmess)

      end subroutine sw_kgb16


      subroutine sw_kgb17(rrtmg_unit)


      use rrsw_kg17_f, only : kao, kbo, selfrefo, forrefo, sfluxrefo, &
                            rayl, strrat, layreffr



      implicit none
      save


      integer, intent(in) :: rrtmg_unit


      character*80 errmess
      logical, external  :: wrf_dm_on_monitor














































      IF ( wrf_dm_on_monitor() ) READ (rrtmg_unit,ERR=9010) &
         rayl, strrat, layreffr, kao, kbo, selfrefo, forrefo, sfluxrefo
      CALL wrf_dm_bcast_real ( rayl , 1 )
      CALL wrf_dm_bcast_real ( strrat , 1 )
      CALL wrf_dm_bcast_integer ( layreffr , 1 )
      CALL wrf_dm_bcast_bytes ( kao , size ( kao ) * 4 )
      CALL wrf_dm_bcast_bytes ( kbo , size ( kbo ) * 4 )
      CALL wrf_dm_bcast_bytes ( selfrefo , size ( selfrefo ) * 4 )
      CALL wrf_dm_bcast_bytes ( forrefo , size ( forrefo ) * 4 )
      CALL wrf_dm_bcast_bytes ( sfluxrefo , size ( sfluxrefo ) * 4 )

      RETURN
9010  CONTINUE
      WRITE( errmess , '(A,I4)' ) 'module_ra_rrtmg_swf: error reading '// &
                                  'RRTMG_SW_DATA on unit ',rrtmg_unit
      CALL wrf_error_fatal3("<stdin>",11962,&
errmess)

      end subroutine sw_kgb17


      subroutine sw_kgb18(rrtmg_unit)


      use rrsw_kg18_f, only : kao, kbo, selfrefo, forrefo, sfluxrefo, &
                            rayl, strrat, layreffr



      implicit none
      save


      integer, intent(in) :: rrtmg_unit


      character*80 errmess
      logical, external  :: wrf_dm_on_monitor














































      IF ( wrf_dm_on_monitor() ) READ (rrtmg_unit,ERR=9010) &
         rayl, strrat, layreffr, kao, kbo, selfrefo, forrefo, sfluxrefo
      CALL wrf_dm_bcast_real ( rayl , 1 )
      CALL wrf_dm_bcast_real ( strrat , 1 )
      CALL wrf_dm_bcast_integer ( layreffr , 1 )
      CALL wrf_dm_bcast_bytes ( kao , size ( kao ) * 4 )
      CALL wrf_dm_bcast_bytes ( kbo , size ( kbo ) * 4 )
      CALL wrf_dm_bcast_bytes ( selfrefo , size ( selfrefo ) * 4 )
      CALL wrf_dm_bcast_bytes ( forrefo , size ( forrefo ) * 4 )
      CALL wrf_dm_bcast_bytes ( sfluxrefo , size ( sfluxrefo ) * 4 )

      RETURN
9010  CONTINUE
      WRITE( errmess , '(A,I4)' ) 'module_ra_rrtmg_swf: error reading '// &
                                  'RRTMG_SW_DATA on unit ',rrtmg_unit
      CALL wrf_error_fatal3("<stdin>",12046,&
errmess)

      end subroutine sw_kgb18 


      subroutine sw_kgb19(rrtmg_unit)


      use rrsw_kg19_f, only : kao, kbo, selfrefo, forrefo, sfluxrefo, &
                            rayl, strrat, layreffr



      implicit none
      save


      integer, intent(in) :: rrtmg_unit


      character*80 errmess
      logical, external  :: wrf_dm_on_monitor














































      IF ( wrf_dm_on_monitor() ) READ (rrtmg_unit,ERR=9010) &
         rayl, strrat, layreffr, kao, kbo, selfrefo, forrefo, sfluxrefo
      CALL wrf_dm_bcast_real ( rayl , 1 )
      CALL wrf_dm_bcast_real ( strrat , 1 )
      CALL wrf_dm_bcast_integer ( layreffr , 1 )
      CALL wrf_dm_bcast_bytes ( kao , size ( kao ) * 4 )
      CALL wrf_dm_bcast_bytes ( kbo , size ( kbo ) * 4 )
      CALL wrf_dm_bcast_bytes ( selfrefo , size ( selfrefo ) * 4 )
      CALL wrf_dm_bcast_bytes ( forrefo , size ( forrefo ) * 4 )
      CALL wrf_dm_bcast_bytes ( sfluxrefo , size ( sfluxrefo ) * 4 )

      RETURN
9010  CONTINUE
      WRITE( errmess , '(A,I4)' ) 'module_ra_rrtmg_swf: error reading '// &
                                  'RRTMG_SW_DATA on unit ',rrtmg_unit
      CALL wrf_error_fatal3("<stdin>",12130,&
errmess)

      end subroutine sw_kgb19


      subroutine sw_kgb20(rrtmg_unit)


      use rrsw_kg20_f, only : kao, kbo, selfrefo, forrefo, sfluxrefo, &
                            absch4o, rayl, layreffr




      implicit none
      save


      integer, intent(in) :: rrtmg_unit


      character*80 errmess
      logical, external  :: wrf_dm_on_monitor
















































      IF ( wrf_dm_on_monitor() ) READ (rrtmg_unit,ERR=9010) &
         rayl, layreffr, absch4o, kao, kbo, selfrefo, forrefo, sfluxrefo
      CALL wrf_dm_bcast_real ( rayl , 1 )
      CALL wrf_dm_bcast_integer ( layreffr , 1 )
      CALL wrf_dm_bcast_bytes ( absch4o , size ( absch4o ) * 4 )
      CALL wrf_dm_bcast_bytes ( kao , size ( kao ) * 4 )
      CALL wrf_dm_bcast_bytes ( kbo , size ( kbo ) * 4 )
      CALL wrf_dm_bcast_bytes ( selfrefo , size ( selfrefo ) * 4 )
      CALL wrf_dm_bcast_bytes ( forrefo , size ( forrefo ) * 4 )
      CALL wrf_dm_bcast_bytes ( sfluxrefo , size ( sfluxrefo ) * 4 )

      RETURN
9010  CONTINUE
      WRITE( errmess , '(A,I4)' ) 'module_ra_rrtmg_swf: error reading '// &
                                  'RRTMG_SW_DATA on unit ',rrtmg_unit
      CALL wrf_error_fatal3("<stdin>",12217,&
errmess)

      end subroutine sw_kgb20


      subroutine sw_kgb21(rrtmg_unit)


      use rrsw_kg21_f, only : kao, kbo, selfrefo, forrefo, sfluxrefo, &
                            rayl, strrat, layreffr



      implicit none
      save


      integer, intent(in) :: rrtmg_unit


      character*80 errmess
      logical, external  :: wrf_dm_on_monitor














































      IF ( wrf_dm_on_monitor() ) READ (rrtmg_unit,ERR=9010) &
         rayl, strrat, layreffr, kao, kbo, selfrefo, forrefo, sfluxrefo
      CALL wrf_dm_bcast_real ( rayl , 1 )
      CALL wrf_dm_bcast_real ( strrat , 1 )
      CALL wrf_dm_bcast_integer ( layreffr , 1 )
      CALL wrf_dm_bcast_bytes ( kao , size ( kao ) * 4 )
      CALL wrf_dm_bcast_bytes ( kbo , size ( kbo ) * 4 )
      CALL wrf_dm_bcast_bytes ( selfrefo , size ( selfrefo ) * 4 )
      CALL wrf_dm_bcast_bytes ( forrefo , size ( forrefo ) * 4 )
      CALL wrf_dm_bcast_bytes ( sfluxrefo , size ( sfluxrefo ) * 4 )

      RETURN
9010  CONTINUE
      WRITE( errmess , '(A,I4)' ) 'module_ra_rrtmg_swf: error reading '// &
                                  'RRTMG_SW_DATA on unit ',rrtmg_unit
      CALL wrf_error_fatal3("<stdin>",12301,&
errmess)

      end subroutine sw_kgb21


      subroutine sw_kgb22(rrtmg_unit)


      use rrsw_kg22_f, only : kao, kbo, selfrefo, forrefo, sfluxrefo, &
                            rayl, strrat, layreffr



      implicit none
      save


      integer, intent(in) :: rrtmg_unit


      character*80 errmess
      logical, external  :: wrf_dm_on_monitor














































      IF ( wrf_dm_on_monitor() ) READ (rrtmg_unit,ERR=9010) &
         rayl, strrat, layreffr, kao, kbo, selfrefo, forrefo, sfluxrefo
      CALL wrf_dm_bcast_real ( rayl , 1 )
      CALL wrf_dm_bcast_real ( strrat , 1 )
      CALL wrf_dm_bcast_integer ( layreffr , 1 )
      CALL wrf_dm_bcast_bytes ( kao , size ( kao ) * 4 )
      CALL wrf_dm_bcast_bytes ( kbo , size ( kbo ) * 4 )
      CALL wrf_dm_bcast_bytes ( selfrefo , size ( selfrefo ) * 4 )
      CALL wrf_dm_bcast_bytes ( forrefo , size ( forrefo ) * 4 )
      CALL wrf_dm_bcast_bytes ( sfluxrefo , size ( sfluxrefo ) * 4 )

      RETURN
9010  CONTINUE
      WRITE( errmess , '(A,I4)' ) 'module_ra_rrtmg_swf: error reading '// &
                                  'RRTMG_SW_DATA on unit ',rrtmg_unit
      CALL wrf_error_fatal3("<stdin>",12385,&
errmess)

      end subroutine sw_kgb22


      subroutine sw_kgb23(rrtmg_unit)


      use rrsw_kg23_f, only : kao, selfrefo, forrefo, sfluxrefo, &
                            raylo, givfac, layreffr



      implicit none
      save


      integer, intent(in) :: rrtmg_unit


      character*80 errmess
      logical, external  :: wrf_dm_on_monitor




































      IF ( wrf_dm_on_monitor() ) READ (rrtmg_unit,ERR=9010) &
         raylo, givfac, layreffr, kao, selfrefo, forrefo, sfluxrefo
      CALL wrf_dm_bcast_bytes ( raylo , size ( raylo ) * 4 )
      CALL wrf_dm_bcast_real ( givfac , 1 )
      CALL wrf_dm_bcast_integer ( layreffr , 1 )
      CALL wrf_dm_bcast_bytes ( kao , size ( kao ) * 4 )
      CALL wrf_dm_bcast_bytes ( selfrefo , size ( selfrefo ) * 4 )
      CALL wrf_dm_bcast_bytes ( forrefo , size ( forrefo ) * 4 )
      CALL wrf_dm_bcast_bytes ( sfluxrefo , size ( sfluxrefo ) * 4 )

      RETURN
9010  CONTINUE
      WRITE( errmess , '(A,I4)' ) 'module_ra_rrtmg_swf: error reading '// &
                                  'RRTMG_SW_DATA on unit ',rrtmg_unit
      CALL wrf_error_fatal3("<stdin>",12458,&
errmess)

      end subroutine sw_kgb23


      subroutine sw_kgb24(rrtmg_unit)


      use rrsw_kg24_f, only : kao, kbo, selfrefo, forrefo, sfluxrefo, &
                            raylao, raylbo, abso3ao, abso3bo, strrat, layreffr




      implicit none
      save


      integer, intent(in) :: rrtmg_unit


      character*80 errmess
      logical, external  :: wrf_dm_on_monitor


















































      IF ( wrf_dm_on_monitor() ) READ (rrtmg_unit,ERR=9010) &
         raylao, raylbo, strrat, layreffr, abso3ao, abso3bo, kao, kbo, selfrefo, &
         forrefo, sfluxrefo
      CALL wrf_dm_bcast_bytes ( raylao , size ( raylao ) * 4 )
      CALL wrf_dm_bcast_bytes ( raylbo , size ( raylbo ) * 4 )
      CALL wrf_dm_bcast_real ( strrat , 1 )
      CALL wrf_dm_bcast_integer ( layreffr , 1 )
      CALL wrf_dm_bcast_bytes ( abso3ao , size ( abso3ao ) * 4 )
      CALL wrf_dm_bcast_bytes ( abso3bo , size ( abso3bo ) * 4 )
      CALL wrf_dm_bcast_bytes ( kao , size ( kao ) * 4 )
      CALL wrf_dm_bcast_bytes ( kbo , size ( kbo ) * 4 )
      CALL wrf_dm_bcast_bytes ( selfrefo , size ( selfrefo ) * 4 )
      CALL wrf_dm_bcast_bytes ( forrefo , size ( forrefo ) * 4 )
      CALL wrf_dm_bcast_bytes ( sfluxrefo , size ( sfluxrefo ) * 4 )

      RETURN
9010  CONTINUE
      WRITE( errmess , '(A,I4)' ) 'module_ra_rrtmg_swf: error reading '// &
                                  'RRTMG_SW_DATA on unit ',rrtmg_unit
      CALL wrf_error_fatal3("<stdin>",12551,&
errmess)

      end subroutine sw_kgb24


      subroutine sw_kgb25(rrtmg_unit)


      use rrsw_kg25_f, only : kao, sfluxrefo, &
                            raylo, abso3ao, abso3bo, layreffr



      implicit none
      save


      integer, intent(in) :: rrtmg_unit


      character*80 errmess
      logical, external  :: wrf_dm_on_monitor

























      IF ( wrf_dm_on_monitor() ) READ (rrtmg_unit,ERR=9010) &
         raylo, layreffr, abso3ao, abso3bo, kao, sfluxrefo
      CALL wrf_dm_bcast_bytes ( raylo , size ( raylo ) * 4 )
      CALL wrf_dm_bcast_integer ( layreffr , 1 )
      CALL wrf_dm_bcast_bytes ( abso3ao , size ( abso3ao ) * 4 )
      CALL wrf_dm_bcast_bytes ( abso3bo , size ( abso3bo ) * 4 )
      CALL wrf_dm_bcast_bytes ( kao , size ( kao ) * 4 )
      CALL wrf_dm_bcast_bytes ( sfluxrefo , size ( sfluxrefo ) * 4 )

      RETURN
9010  CONTINUE
      WRITE( errmess , '(A,I4)' ) 'module_ra_rrtmg_swf: error reading '// &
                                  'RRTMG_SW_DATA on unit ',rrtmg_unit
      CALL wrf_error_fatal3("<stdin>",12612,&
errmess)

      end subroutine sw_kgb25


      subroutine sw_kgb26(rrtmg_unit)


      use rrsw_kg26_f, only : sfluxrefo, raylo

      implicit none
      save


      integer, intent(in) :: rrtmg_unit


      character*80 errmess
      logical, external  :: wrf_dm_on_monitor






      IF ( wrf_dm_on_monitor() ) READ (rrtmg_unit,ERR=9010) &
         raylo, sfluxrefo
      CALL wrf_dm_bcast_bytes ( raylo , size ( raylo ) * 4 )
      CALL wrf_dm_bcast_bytes ( sfluxrefo , size ( sfluxrefo ) * 4 )

      RETURN
9010  CONTINUE
      WRITE( errmess , '(A,I4)' ) 'module_ra_rrtmg_swf: error reading '// &
                                  'RRTMG_SW_DATA on unit ',rrtmg_unit
      CALL wrf_error_fatal3("<stdin>",12647,&
errmess)

      end subroutine sw_kgb26


      subroutine sw_kgb27(rrtmg_unit)


      use rrsw_kg27_f, only : kao, kbo, sfluxrefo, raylo, &
                            scalekur, layreffr



      implicit none
      save


      integer, intent(in) :: rrtmg_unit


      character*80 errmess
      logical, external  :: wrf_dm_on_monitor







































      IF ( wrf_dm_on_monitor() ) READ (rrtmg_unit,ERR=9010) &
         raylo, scalekur, layreffr, kao, kbo, sfluxrefo
      CALL wrf_dm_bcast_bytes ( raylo , size ( raylo ) * 4 )
      CALL wrf_dm_bcast_real ( scalekur , 1 )
      CALL wrf_dm_bcast_integer ( layreffr , 1 )
      CALL wrf_dm_bcast_bytes ( kao , size ( kao ) * 4 )
      CALL wrf_dm_bcast_bytes ( kbo , size ( kbo ) * 4 )
      CALL wrf_dm_bcast_bytes ( sfluxrefo , size ( sfluxrefo ) * 4 )

      RETURN
9010  CONTINUE
      WRITE( errmess , '(A,I4)' ) 'module_ra_rrtmg_swf: error reading '// &
                                  'RRTMG_SW_DATA on unit ',rrtmg_unit
      CALL wrf_error_fatal3("<stdin>",12722,&
errmess)

      end subroutine sw_kgb27


      subroutine sw_kgb28(rrtmg_unit)


      use rrsw_kg28_f, only : kao, kbo, sfluxrefo, &
                            rayl, strrat, layreffr



      implicit none
      save


      integer, intent(in) :: rrtmg_unit


      character*80 errmess
      logical, external  :: wrf_dm_on_monitor


































      IF ( wrf_dm_on_monitor() ) READ (rrtmg_unit,ERR=9010) &
         rayl, strrat, layreffr, kao, kbo, sfluxrefo
      CALL wrf_dm_bcast_real ( rayl , 1 )
      CALL wrf_dm_bcast_real ( strrat , 1 )
      CALL wrf_dm_bcast_integer ( layreffr , 1 )
      CALL wrf_dm_bcast_bytes ( kao , size ( kao ) * 4 )
      CALL wrf_dm_bcast_bytes ( kbo , size ( kbo ) * 4 )
      CALL wrf_dm_bcast_bytes ( sfluxrefo , size ( sfluxrefo ) * 4 )

      RETURN
9010  CONTINUE
      WRITE( errmess , '(A,I4)' ) 'module_ra_rrtmg_swf: error reading '// &
                                  'RRTMG_SW_DATA on unit ',rrtmg_unit
      CALL wrf_error_fatal3("<stdin>",12792,&
errmess)

      end subroutine sw_kgb28


      subroutine sw_kgb29(rrtmg_unit)


      use rrsw_kg29_f, only : kao, kbo, selfrefo, forrefo, sfluxrefo, &
                            absh2oo, absco2o, rayl, layreffr




      implicit none
      save


      integer, intent(in) :: rrtmg_unit


      character*80 errmess
      logical, external  :: wrf_dm_on_monitor


















































      IF ( wrf_dm_on_monitor() ) READ (rrtmg_unit,ERR=9010) &
         rayl, layreffr, absh2oo, absco2o, kao, kbo, selfrefo, forrefo, sfluxrefo
      CALL wrf_dm_bcast_real ( rayl , 1 )
      CALL wrf_dm_bcast_integer ( layreffr , 1 )
      CALL wrf_dm_bcast_bytes ( absh2oo , size ( absh2oo ) * 4 )
      CALL wrf_dm_bcast_bytes ( absco2o , size ( absco2o ) * 4 )
      CALL wrf_dm_bcast_bytes ( kao , size ( kao ) * 4 )
      CALL wrf_dm_bcast_bytes ( kbo , size ( kbo ) * 4 )
      CALL wrf_dm_bcast_bytes ( selfrefo , size ( selfrefo ) * 4 )
      CALL wrf_dm_bcast_bytes ( forrefo , size ( forrefo ) * 4 )
      CALL wrf_dm_bcast_bytes ( sfluxrefo , size ( sfluxrefo ) * 4 )

      RETURN
9010  CONTINUE
      WRITE( errmess , '(A,I4)' ) 'module_ra_rrtmg_swf: error reading '// &
                                  'RRTMG_SW_DATA on unit ',rrtmg_unit
      CALL wrf_error_fatal3("<stdin>",12882,&
errmess)

      end subroutine sw_kgb29



      END MODULE module_ra_rrtmg_swf
