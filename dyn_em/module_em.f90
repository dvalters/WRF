






MODULE module_em

   USE module_model_constants
   
   USE module_advect_em, only: advect_u, advect_v, advect_w, advect_scalar, advect_scalar_pd, advect_scalar_mono, &
        advect_weno_u, advect_weno_v, advect_weno_w, advect_scalar_weno,  advect_scalar_wenopd
   
   USE module_big_step_utilities_em, only: grid_config_rec_type, calculate_full, couple_momentum, calc_mu_uv, calc_ww_cp, &
        calc_cq, calc_alt, calc_php, set_tend, rhs_ph, &
   	horizontal_pressure_gradient, pg_buoy_w, w_damp, perturbation_coriolis, coriolis, curvature, horizontal_diffusion, &
        horizontal_diffusion_3dmp, vertical_diffusion_u, &
	vertical_diffusion_v, vertical_diffusion, vertical_diffusion_3dmp, sixth_order_diffusion, rk_rayleigh_damp, &
        theta_relaxation, vertical_diffusion_mp, zero_tend, zero_tend2d
	
   USE module_state_description, only: param_first_scalar, p_qr, p_qv, p_qc, p_qg, p_qi, p_qs, tiedtkescheme,ntiedtkescheme, heldsuarez, &
        positivedef, gdscheme, g3scheme, gfscheme, kfetascheme, mskfscheme, monotonic, wenopd_scalar, weno_scalar, weno_mom
	
   USE module_damping_em, only: held_suarez_damp

   USE module_dm 

   USE module_llxy 

   USE module_domain, ONLY : domain, get_ijk_from_grid

   USE module_configure, ONLY: grid_config_rec_type, model_config_rec, model_to_grid_config_rec

CONTAINS



SUBROUTINE rk_step_prep  ( config_flags, rk_step,           &
                           u, v, w, t, ph, mu,              &
                           moist,                           &
                           ru, rv, rw, ww, php, alt,        &
                           muu, muv,                        &
                           mub, mut, phb, pb, p, al, alb,   &
                           cqu, cqv, cqw,                   &
                           msfux, msfuy,                    &
                           msfvx, msfvx_inv, msfvy,         &
                           msftx, msfty,                    &
                           fnm, fnp, dnw, rdx, rdy,         &
                           n_moist,                         &
                           ids, ide, jds, jde, kds, kde,    &
                           ims, ime, jms, jme, kms, kme,    &
                           its, ite, jts, jte, kts, kte    )

   IMPLICIT NONE


   

   TYPE(grid_config_rec_type   ) ,   INTENT(IN   ) :: config_flags

   INTEGER ,       INTENT(IN   ) :: ids, ide, jds, jde, kds, kde, &
                                    ims, ime, jms, jme, kms, kme, &
                                    its, ite, jts, jte, kts, kte

   INTEGER ,       INTENT(IN   ) :: n_moist, rk_step

   REAL ,          INTENT(IN   ) :: rdx, rdy

   REAL , DIMENSION(  ims:ime , kms:kme, jms:jme ) ,                      &
                                               INTENT(IN   ) ::  u,       &
                                                                 v,       &
                                                                 w,       &
                                                                 t,       &
                                                                 ph,      &
                                                                 phb,     &
                                                                 pb,      &
                                                                 al,      &
                                                                 alb

   REAL , DIMENSION( ims:ime , kms:kme , jms:jme  ) ,                     &
                                               INTENT(  OUT) ::  ru,      &
                                                                 rv,      &
                                                                 rw,      &
                                                                 ww,      &
                                                                 php,     &
                                                                 cqu,     &
                                                                 cqv,     &
                                                                 cqw,     &
                                                                 alt

   REAL , DIMENSION(  ims:ime , kms:kme, jms:jme ) ,                      &
                                               INTENT(IN   ) ::  p
                                                                 



   REAL , DIMENSION( ims:ime, kms:kme, jms:jme, n_moist ), INTENT(   IN) :: &
                                                           moist

   REAL , DIMENSION( ims:ime , jms:jme ) ,    INTENT(IN   ) :: msftx,     &
                                                               msfty,     &
                                                               msfux,     &
                                                               msfuy,     &
                                                               msfvx,     &
                                                               msfvx_inv, &
                                                               msfvy,     &
                                                               mu,        &
                                                               mub

   REAL , DIMENSION( ims:ime , jms:jme ) ,    INTENT(  OUT) :: muu,    &
                                                               muv,    &
                                                               mut

   REAL , DIMENSION( kms:kme ) ,    INTENT(IN   ) :: fnm, fnp, dnw

   integer :: k


























   CALL calculate_full( mut, mub, mu,             &
                        ids, ide, jds, jde, 1, 2, &
                        ims, ime, jms, jme, 1, 1, &
                        its, ite, jts, jte, 1, 1 )

   CALL calc_mu_uv ( config_flags,                  &
                     mu, mub, muu, muv,             &
                     ids, ide, jds, jde, kds, kde,  &
                     ims, ime, jms, jme, kms, kme,  &
                     its, ite, jts, jte, kts, kte  )

   CALL couple_momentum( muu, ru, u, msfuy,             &
                         muv, rv, v, msfvx, msfvx_inv,  &
                         mut, rw, w, msfty,             &
                         ids, ide, jds, jde, kds, kde,  &
                         ims, ime, jms, jme, kms, kme,  &
                         its, ite, jts, jte, kts, kte  )


   CALL calc_ww_cp ( u, v, mu, mub, ww,               &
                     rdx, rdy, msftx, msfty,          &
                     msfux, msfuy, msfvx, msfvx_inv,  &
                     msfvy, dnw,                      &
                     ids, ide, jds, jde, kds, kde,    &
                     ims, ime, jms, jme, kms, kme,    &
                     its, ite, jts, jte, kts, kte    )

   CALL calc_cq ( moist, cqu, cqv, cqw, n_moist, &
                  ids, ide, jds, jde, kds, kde,  &
                  ims, ime, jms, jme, kms, kme,  &
                  its, ite, jts, jte, kts, kte  )

   CALL calc_alt ( alt, al, alb,                 &
                   ids, ide, jds, jde, kds, kde, &
                   ims, ime, jms, jme, kms, kme, &
                   its, ite, jts, jte, kts, kte )

   CALL calc_php ( php, ph, phb,                 &
                   ids, ide, jds, jde, kds, kde, &
                   ims, ime, jms, jme, kms, kme, &
                   its, ite, jts, jte, kts, kte )

END SUBROUTINE rk_step_prep



SUBROUTINE rk_tendency ( config_flags, rk_step,                           &
                         ru_tend, rv_tend, rw_tend, ph_tend, t_tend,      &
                         ru_tendf, rv_tendf, rw_tendf, ph_tendf, t_tendf, &
                         mu_tend, u_save, v_save, w_save, ph_save,        &
                         t_save, mu_save, RTHFTEN,                        &
                         ru, rv, rw, ww,                                  &
                         u, v, w, t, ph,                                  &
                         u_old, v_old, w_old, t_old, ph_old,              &
                         h_diabatic, phb,t_init,                          &
                         mu, mut, muu, muv, mub,                          &
                         al, alt, p, pb, php, cqu, cqv, cqw,              &
                         u_base, v_base, t_base, qv_base, z_base,         &
                         msfux, msfuy, msfvx, msfvx_inv,                  &
                         msfvy, msftx, msfty,                             &
                         clat, f, e, sina, cosa,                          &
                         fnm, fnp, rdn, rdnw,                             &
                         dt, rdx, rdy, khdif, kvdif, xkmhd, xkhh,         &
                         diff_6th_opt, diff_6th_factor,                   &
                         adv_opt,                                         &
                         dampcoef,zdamp,damp_opt,rad_nudge,               &
                         cf1, cf2, cf3, cfn, cfn1, n_moist,               &
                         non_hydrostatic, top_lid,                        &
                         u_frame, v_frame,                                &
                         ids, ide, jds, jde, kds, kde,                    &
                         ims, ime, jms, jme, kms, kme,                    &
                         its, ite, jts, jte, kts, kte,                    &
                         max_vert_cfl, max_horiz_cfl)

   IMPLICIT NONE

   

   TYPE(grid_config_rec_type)    ,           INTENT(IN   ) :: config_flags

   INTEGER ,               INTENT(IN   ) :: ids, ide, jds, jde, kds, kde, &
                                            ims, ime, jms, jme, kms, kme, &
                                            its, ite, jts, jte, kts, kte

   LOGICAL ,               INTENT(IN   ) :: non_hydrostatic, top_lid

   INTEGER ,               INTENT(IN   ) :: n_moist, rk_step

   REAL , DIMENSION( ims:ime , kms:kme, jms:jme  ) ,              &
                                        INTENT(IN   ) :: ru,      &
                                                         rv,      &
                                                         rw,      &
                                                         ww,      & 
                                                         u,       &
                                                         v,       &
                                                         w,       &
                                                         t,       &
                                                         ph,      &
                                                         u_old,   &
                                                         v_old,   &
                                                         w_old,   &
                                                         t_old,   &
                                                         ph_old,  &
                                                         phb,     &
                                                         al,      &
                                                         alt,     &
                                                         p,       &
                                                         pb,      &
                                                         php,     &
                                                         cqu,     &
                                                         cqv,     &
                                                         t_init,  &
                                                         xkmhd,   &
                                                         xkhh,    &
                                                         h_diabatic

   REAL , DIMENSION( ims:ime , kms:kme, jms:jme  ) ,              &
                                        INTENT(OUT  ) :: ru_tend, &
                                                         rv_tend, &
                                                         rw_tend, &
                                                         t_tend,  &
                                                         ph_tend, &
                                                         RTHFTEN, &
                                                          u_save, &
                                                          v_save, &
                                                          w_save, &
                                                         ph_save, &
                                                          t_save

   REAL , DIMENSION( ims:ime , kms:kme, jms:jme  ) ,               &
                                        INTENT(INOUT) :: ru_tendf, &
                                                         rv_tendf, &
                                                         rw_tendf, &
                                                         t_tendf,  &
                                                         ph_tendf, &
                                                         cqw

   REAL , DIMENSION( ims:ime , jms:jme ) ,         INTENT(  OUT) :: mu_tend, &
                                                                    mu_save

   REAL , DIMENSION( ims:ime , jms:jme ) ,         INTENT(IN   ) :: msfux,   &
                                                                    msfuy,   &
                                                                    msfvx,   &
                                                                    msfvx_inv,   &
                                                                    msfvy,   &
                                                                    msftx,   &
                                                                    msfty,   &
                                                                    clat,    & 
                                                                    f,       &
                                                                    e,       &
                                                                    sina,    &
                                                                    cosa,    &
                                                                    mu,      &
                                                                    mut,     &
                                                                    mub,     &
                                                                    muu,     &
                                                                    muv

   REAL , DIMENSION( kms:kme ) ,                 INTENT(IN   ) :: fnm,     &
                                                                  fnp,     &
                                                                  rdn,     &
                                                                  rdnw,    &
                                                                  u_base,  &
                                                                  v_base,  &
                                                                  t_base,  &
                                                                  qv_base, &
                                                                  z_base

   REAL ,                                      INTENT(IN   ) :: rdx,     &
                                                                rdy,     &
                                                                dt,      &
                                                                u_frame, &
                                                                v_frame, &
                                                                khdif,   &
                                                                kvdif
   INTEGER, INTENT( IN ) :: diff_6th_opt
   REAL,    INTENT( IN ) :: diff_6th_factor
   INTEGER, INTENT( IN ) :: adv_opt

   INTEGER, INTENT( IN ) :: damp_opt, rad_nudge

   REAL, INTENT( IN ) :: zdamp, dampcoef

   REAL, INTENT( OUT ) :: max_horiz_cfl
   REAL, INTENT( OUT ) :: max_vert_cfl

   REAL    :: kdift, khdq, kvdq, cfn, cfn1, cf1, cf2, cf3
   INTEGER :: i,j,k
   INTEGER :: time_step





















   CALL zero_tend ( ru_tend,                      &
                    ids, ide, jds, jde, kds, kde, &
                    ims, ime, jms, jme, kms, kme, &
                    its, ite, jts, jte, kts, kte )

   CALL zero_tend ( rv_tend,                      &
                    ids, ide, jds, jde, kds, kde, &
                    ims, ime, jms, jme, kms, kme, &
                    its, ite, jts, jte, kts, kte )

   CALL zero_tend ( rw_tend,                      &
                    ids, ide, jds, jde, kds, kde, &
                    ims, ime, jms, jme, kms, kme, &
                    its, ite, jts, jte, kts, kte )

   CALL zero_tend ( t_tend,                       &
                    ids, ide, jds, jde, kds, kde, &
                    ims, ime, jms, jme, kms, kme, &
                    its, ite, jts, jte, kts, kte )

   CALL zero_tend ( ph_tend,                      &
                    ids, ide, jds, jde, kds, kde, &
                    ims, ime, jms, jme, kms, kme, &
                    its, ite, jts, jte, kts, kte )

   CALL zero_tend ( u_save,                       &
                    ids, ide, jds, jde, kds, kde, &
                    ims, ime, jms, jme, kms, kme, &
                    its, ite, jts, jte, kts, kte )

   CALL zero_tend ( v_save,                       &
                    ids, ide, jds, jde, kds, kde, &
                    ims, ime, jms, jme, kms, kme, &
                    its, ite, jts, jte, kts, kte )

   CALL zero_tend ( w_save,                       &
                    ids, ide, jds, jde, kds, kde, &
                    ims, ime, jms, jme, kms, kme, &
                    its, ite, jts, jte, kts, kte )

   CALL zero_tend ( ph_save,                       &
                    ids, ide, jds, jde, kds, kde, &
                    ims, ime, jms, jme, kms, kme, &
                    its, ite, jts, jte, kts, kte )

   CALL zero_tend ( t_save,                       &
                    ids, ide, jds, jde, kds, kde, &
                    ims, ime, jms, jme, kms, kme, &
                    its, ite, jts, jte, kts, kte )

   CALL zero_tend2d( mu_tend,                  &
                    ids, ide, jds, jde, 1, 1, &
                    ims, ime, jms, jme, 1, 1, &
                    its, ite, jts, jte, 1, 1 )

   CALL zero_tend2d( mu_save,                  &
                    ids, ide, jds, jde, 1, 1, &
                    ims, ime, jms, jme, 1, 1, &
                    its, ite, jts, jte, 1, 1 )

   
   CALL nl_get_time_step ( 1, time_step )


    IF( (rk_step == 3) .and. ( adv_opt == WENO_MOM ) ) THEN

     CALL advect_weno_u ( u, u , ru_tend, ru, rv, ww, &
                   mut, time_step, config_flags, &
                   msfux, msfuy, msfvx, msfvy,   &
                   msftx, msfty,                 &
                   fnm, fnp, rdx, rdy, rdnw,     &
                   ids, ide, jds, jde, kds, kde, &
                   ims, ime, jms, jme, kms, kme, &
                   its, ite, jts, jte, kts, kte )

     ELSE
     
     CALL advect_u ( u, u , ru_tend, ru, rv, ww, &
                   mut, time_step, config_flags, &
                   msfux, msfuy, msfvx, msfvy,   &
                   msftx, msfty,                 &
                   fnm, fnp, rdx, rdy, rdnw,     &
                   ids, ide, jds, jde, kds, kde, &
                   ims, ime, jms, jme, kms, kme, &
                   its, ite, jts, jte, kts, kte )
      ENDIF

     IF( (rk_step == 3) .and. ( adv_opt == WENO_MOM ) ) THEN

     CALL advect_weno_v ( v, v , rv_tend, ru, rv, ww,  &
                   mut, time_step, config_flags, &
                   msfux, msfuy, msfvx, msfvy,   &
                   msftx, msfty,                 &
                   fnm, fnp, rdx, rdy, rdnw,     &
                   ids, ide, jds, jde, kds, kde, &
                   ims, ime, jms, jme, kms, kme, &
                   its, ite, jts, jte, kts, kte )

    ELSE
     
     CALL advect_v ( v, v , rv_tend, ru, rv, ww,  &
                   mut, time_step, config_flags, &
                   msfux, msfuy, msfvx, msfvy,   &
                   msftx, msfty,                 &
                   fnm, fnp, rdx, rdy, rdnw,     &
                   ids, ide, jds, jde, kds, kde, &
                   ims, ime, jms, jme, kms, kme, &
                   its, ite, jts, jte, kts, kte )
    ENDIF


   IF (non_hydrostatic) THEN
     IF( (rk_step == 3) .and. ( adv_opt == WENO_MOM ) ) THEN
     CALL advect_weno_w ( w, w, rw_tend, ru, rv, ww,    &
                     mut, time_step, config_flags, &
                     msfux, msfuy, msfvx, msfvy,   &
                     msftx, msfty,                 &
                     fnm, fnp, rdx, rdy, rdn,      &
                     ids, ide, jds, jde, kds, kde, &
                     ims, ime, jms, jme, kms, kme, &
                     its, ite, jts, jte, kts, kte )

     ELSE
     
     CALL advect_w ( w, w, rw_tend, ru, rv, ww,    &
                     mut, time_step, config_flags, &
                     msfux, msfuy, msfvx, msfvy,   &
                     msftx, msfty,                 &
                     fnm, fnp, rdx, rdy, rdn,      &
                     ids, ide, jds, jde, kds, kde, &
                     ims, ime, jms, jme, kms, kme, &
                     its, ite, jts, jte, kts, kte )
     ENDIF
   ENDIF


     CALL advect_scalar ( t, t, t_tend, ru, rv, ww,     &
                          mut, time_step, config_flags, &
                          msfux, msfuy, msfvx, msfvy,   &
                          msftx, msfty, fnm, fnp,       &
                          rdx, rdy, rdnw,               &
                          ids, ide, jds, jde, kds, kde, &
                          ims, ime, jms, jme, kms, kme, &
                          its, ite, jts, jte, kts, kte ) 

     IF ( config_flags%cu_physics == GDSCHEME  .OR.     &
          config_flags%cu_physics == GFSCHEME  .OR.     &
          config_flags%cu_physics == G3SCHEME  .OR.     &
          config_flags%cu_physics == NTIEDTKESCHEME )  THEN     

     

         CALL set_tend( RTHFTEN, t_tend, msfty,          &
                        ids, ide, jds, jde, kds, kde,    &
                        ims, ime, jms, jme, kms, kme,    &
                        its, ite, jts, jte, kts, kte     )

     END IF

     CALL rhs_ph( ph_tend, u, v, ww, ph, ph, phb, w, &
                  mut, muu, muv,                     &
                  fnm, fnp,                          &
                  rdnw, cfn, cfn1, rdx, rdy,         &
                  msfux, msfuy, msfvx,               &
                  msfvx_inv, msfvy,                  &
                  msftx, msfty,                      &
                  non_hydrostatic,                   &
                  config_flags,                      &
                  ids, ide, jds, jde, kds, kde,      &
                  ims, ime, jms, jme, kms, kme,      &
                  its, ite, jts, jte, kts, kte      )

     CALL horizontal_pressure_gradient( ru_tend,rv_tend,                 &
                                         ph,alt,p,pb,al,php,cqu,cqv,     &
                                         muu,muv,mu,fnm,fnp,rdnw,        &
                                         cf1,cf2,cf3,cfn,cfn1,           &
                                         rdx,rdy,msfux,msfuy,            &
                                         msfvx,msfvy,msftx,msfty,        &
                                         config_flags, non_hydrostatic,  &
                                         top_lid,                        &
                                         ids, ide, jds, jde, kds, kde,   &
                                         ims, ime, jms, jme, kms, kme,   &
                                         its, ite, jts, jte, kts, kte   )

     IF (non_hydrostatic) THEN
          CALL pg_buoy_w( rw_tend, p, cqw, mu, mub,       &
                          rdnw, rdn, g, msftx, msfty,     &
                          ids, ide, jds, jde, kds, kde,   &
                          ims, ime, jms, jme, kms, kme,   &
                          its, ite, jts, jte, kts, kte   )
     ENDIF

     CALL w_damp   ( rw_tend, max_vert_cfl,            &
                      max_horiz_cfl,                  &
                      u, v, ww, w, mut, rdnw,         &
                      rdx, rdy, msfux, msfuy, msfvx,  &
                      msfvy, dt, config_flags,        &
                      ids, ide, jds, jde, kds, kde,   &
                      ims, ime, jms, jme, kms, kme,   &
                      its, ite, jts, jte, kts, kte   )

     IF(config_flags%pert_coriolis) THEN

          CALL perturbation_coriolis ( ru, rv, rw,                   &
                                       ru_tend,  rv_tend,  rw_tend,  &
                                       config_flags,                 &
                                       u_base, v_base, z_base,       &
                                       muu, muv, phb, ph,            &
                                       msftx, msfty, msfux, msfuy,   &
                                       msfvx, msfvy,                 &
                                       f, e, sina, cosa, fnm, fnp,   &
                                       ids, ide, jds, jde, kds, kde, &
                                       ims, ime, jms, jme, kms, kme, &
                                       its, ite, jts, jte, kts, kte )
     ELSE
          CALL coriolis ( ru, rv, rw,                   &
                          ru_tend,  rv_tend,  rw_tend,  &
                          config_flags,                 &
                          msftx, msfty, msfux, msfuy,   &
                          msfvx, msfvy,                 &
                          f, e, sina, cosa, fnm, fnp,   &
                          ids, ide, jds, jde, kds, kde, &
                          ims, ime, jms, jme, kms, kme, &
                          its, ite, jts, jte, kts, kte )

     END IF

     CALL curvature ( ru, rv, rw, u, v, w,            &
                       ru_tend,  rv_tend,  rw_tend,    &
                       config_flags,                   &
                       msfux, msfuy, msfvx, msfvy,     &
                       msftx, msfty,                   &
                       clat, fnm, fnp, rdx, rdy,       &
                       ids, ide, jds, jde, kds, kde,   &
                       ims, ime, jms, jme, kms, kme,   &
                       its, ite, jts, jte, kts, kte   )


      IF (config_flags%ra_lw_physics == HELDSUAREZ) THEN
         CALL held_suarez_damp ( ru_tend, rv_tend,               &   
                                 ru,rv,p,pb,                     &
                                 ids, ide, jds, jde, kds, kde,   &
                                 ims, ime, jms, jme, kms, kme,   &
                                 its, ite, jts, jte, kts, kte   )
      END IF








  forward_step: IF( rk_step == 1 ) THEN

    diff_opt1 : IF (config_flags%diff_opt .eq. 1) THEN
   
        CALL horizontal_diffusion ('u', u, ru_tendf, mut, config_flags, &
                                        msfux, msfuy, msfvx, msfvx_inv, &
                                        msfvy,msftx, msfty,             &
                                        khdif, xkmhd, rdx, rdy,         &
                                        ids, ide, jds, jde, kds, kde,   &
                                        ims, ime, jms, jme, kms, kme,   &
                                        its, ite, jts, jte, kts, kte   )

        CALL horizontal_diffusion ('v', v, rv_tendf, mut, config_flags, &
                                        msfux, msfuy, msfvx, msfvx_inv, &
                                        msfvy,msftx, msfty,             &
                                        khdif, xkmhd, rdx, rdy,         &
                                        ids, ide, jds, jde, kds, kde,   &
                                        ims, ime, jms, jme, kms, kme,   &
                                        its, ite, jts, jte, kts, kte   )

        CALL horizontal_diffusion ('w', w, rw_tendf, mut, config_flags, &
                                        msfux, msfuy, msfvx, msfvx_inv, &
                                        msfvy,msftx, msfty,             &
                                        khdif, xkmhd, rdx, rdy,         &
                                        ids, ide, jds, jde, kds, kde,   &
                                        ims, ime, jms, jme, kms, kme,   &
                                        its, ite, jts, jte, kts, kte   )

        khdq = 3.*khdif
        CALL horizontal_diffusion_3dmp ( 'm', t, t_tendf, mut,            &
                                         config_flags, t_init,            &
                                         msfux, msfuy, msfvx, msfvx_inv,  &
                                         msfvy, msftx, msfty,             &
                                         khdq , xkhh, rdx, rdy,           &
                                         ids, ide, jds, jde, kds, kde,    &
                                         ims, ime, jms, jme, kms, kme,    &
                                         its, ite, jts, jte, kts, kte    )

        pbl_test : IF (config_flags%bl_pbl_physics .eq. 0) THEN

          CALL vertical_diffusion_u ( u, ru_tendf, config_flags,      &
                                      u_base,                         &
                                      alt, muu, rdn, rdnw, kvdif,     &
                                      ids, ide, jds, jde, kds, kde,   &
                                      ims, ime, jms, jme, kms, kme,   &
                                      its, ite, jts, jte, kts, kte   )

          CALL vertical_diffusion_v ( v, rv_tendf, config_flags,      &
                                      v_base,                         &
                                      alt, muv, rdn, rdnw, kvdif,     &
                                      ids, ide, jds, jde, kds, kde,   &
                                      ims, ime, jms, jme, kms, kme,   &
                                      its, ite, jts, jte, kts, kte   )

          IF (non_hydrostatic)                                           &
          CALL vertical_diffusion ( 'w', w, rw_tendf, config_flags,      &
                                    alt, mut, rdn, rdnw, kvdif,          &
                                    ids, ide, jds, jde, kds, kde,        &
                                    ims, ime, jms, jme, kms, kme,        &
                                    its, ite, jts, jte, kts, kte        )

          kvdq = 3.*kvdif
          CALL vertical_diffusion_3dmp ( t, t_tendf, config_flags, t_init,     &
                                         alt, mut, rdn, rdnw, kvdq ,           &
                                         ids, ide, jds, jde, kds, kde,         &
                                         ims, ime, jms, jme, kms, kme,         &
                                         its, ite, jts, jte, kts, kte         )

        ENDIF pbl_test

   

    END IF diff_opt1

    IF ( diff_6th_opt .NE. 0 ) THEN

      CALL sixth_order_diffusion( 'u', u, ru_tendf, mut, dt,          &
                                       config_flags,                  &
                                       diff_6th_opt, diff_6th_factor, &
                                       ids, ide, jds, jde, kds, kde,  &
                                       ims, ime, jms, jme, kms, kme,  &
                                       its, ite, jts, jte, kts, kte )

      CALL sixth_order_diffusion( 'v', v, rv_tendf, mut, dt,          &
                                       config_flags,                  &
                                       diff_6th_opt, diff_6th_factor, &
                                       ids, ide, jds, jde, kds, kde,  &
                                       ims, ime, jms, jme, kms, kme,  &
                                       its, ite, jts, jte, kts, kte )

      IF (non_hydrostatic)                                            & 
      CALL sixth_order_diffusion( 'w', w, rw_tendf, mut, dt,          &
                                       config_flags,                  &
                                       diff_6th_opt, diff_6th_factor, &
                                       ids, ide, jds, jde, kds, kde,  &
                                       ims, ime, jms, jme, kms, kme,  &
                                       its, ite, jts, jte, kts, kte )

      CALL sixth_order_diffusion( 'm', t,  t_tendf, mut, dt,          &
                                       config_flags,                  &
                                       diff_6th_opt, diff_6th_factor, &
                                       ids, ide, jds, jde, kds, kde,  &
                                       ims, ime, jms, jme, kms, kme,  &
                                       its, ite, jts, jte, kts, kte )

    ENDIF

    IF( damp_opt .eq. 2 )                                      &
       CALL rk_rayleigh_damp( ru_tendf, rv_tendf,              &
                              rw_tendf, t_tendf,               &
                              u, v, w, t, t_init,              &
                              mut, muu, muv, ph, phb,          &
                              u_base, v_base, t_base, z_base,  &
                              dampcoef, zdamp,                 &
                              ids, ide, jds, jde, kds, kde,    &
                              ims, ime, jms, jme, kms, kme,    &
                              its, ite, jts, jte, kts, kte   )

    IF( rad_nudge .eq. 1 )                                     &
       CALL theta_relaxation( t_tendf, t, t_init,              &
                              mut, ph, phb,                    &
                              t_base, z_base,                  &
                              ids, ide, jds, jde, kds, kde,    &
                              ims, ime, jms, jme, kms, kme,    &
                              its, ite, jts, jte, kts, kte   )

  END IF forward_step

END SUBROUTINE rk_tendency



SUBROUTINE rk_addtend_dry ( ru_tend, rv_tend, rw_tend, ph_tend, t_tend,      &
                            ru_tendf, rv_tendf, rw_tendf, ph_tendf, t_tendf, &
                            u_save, v_save, w_save, ph_save, t_save,         &
                            mu_tend, mu_tendf, rk_step,                      &
                            h_diabatic, mut, msftx, msfty, msfux, msfuy,     &
                            msfvx, msfvx_inv, msfvy,                         &
                            ids,ide, jds,jde, kds,kde,                       &
                            ims,ime, jms,jme, kms,kme,                       &
                            ips,ipe, jps,jpe, kps,kpe,                       &
                            its,ite, jts,jte, kts,kte                       )

   IMPLICIT NONE

   

   INTEGER ,               INTENT(IN   ) :: ids, ide, jds, jde, kds, kde, &
                                            ims, ime, jms, jme, kms, kme, &
                                            ips, ipe, jps, jpe, kps, kpe, &
                                            its, ite, jts, jte, kts, kte
   INTEGER ,               INTENT(IN   ) :: rk_step

   REAL , DIMENSION( ims:ime , kms:kme, jms:jme  ) , INTENT(INOUT) :: ru_tend, &
                                                                      rv_tend, &
                                                                      rw_tend, &
                                                                      ph_tend, &
                                                                      t_tend,  &
                                                                      ru_tendf, &
                                                                      rv_tendf, &
                                                                      rw_tendf, &
                                                                      ph_tendf, &
                                                                      t_tendf

   REAL , DIMENSION( ims:ime , jms:jme  ) , INTENT(INOUT) :: mu_tend, &
                                                             mu_tendf

   REAL , DIMENSION( ims:ime , kms:kme, jms:jme  ) , INTENT(IN   ) ::  u_save,  &
                                                                       v_save,  &
                                                                       w_save,  &
                                                                      ph_save,  &
                                                                       t_save,  &
                                                                      h_diabatic

   REAL , DIMENSION( ims:ime , jms:jme ) ,         INTENT(IN   ) :: mut,       &
                                                                    msftx,     &
                                                                    msfty,     &
                                                                    msfux,     &
                                                                    msfuy,     &
                                                                    msfvx,     &
                                                                    msfvx_inv, &
                                                                    msfvy



   INTEGER :: i, j, k























   DO j = jts,MIN(jte,jde-1)
   DO k = kts,kte-1
   DO i = its,ite
     
     IF(rk_step == 1)ru_tendf(i,k,j) = ru_tendf(i,k,j) +  u_save(i,k,j)*msfuy(i,j)
     
     ru_tend(i,k,j) = ru_tend(i,k,j) + ru_tendf(i,k,j)/msfuy(i,j)
   ENDDO
   ENDDO
   ENDDO

   DO j = jts,jte
   DO k = kts,kte-1
   DO i = its,MIN(ite,ide-1)
     
     IF(rk_step == 1)rv_tendf(i,k,j) = rv_tendf(i,k,j) +  v_save(i,k,j)*msfvx(i,j)
     
     rv_tend(i,k,j) = rv_tend(i,k,j) + rv_tendf(i,k,j)*msfvx_inv(i,j)
   ENDDO
   ENDDO
   ENDDO

   DO j = jts,MIN(jte,jde-1)
   DO k = kts,kte
   DO i = its,MIN(ite,ide-1)
     
     IF(rk_step == 1)rw_tendf(i,k,j) = rw_tendf(i,k,j) +  w_save(i,k,j)*msfty(i,j)
     
     rw_tend(i,k,j) = rw_tend(i,k,j) + rw_tendf(i,k,j)/msfty(i,j)
     IF(rk_step == 1)ph_tendf(i,k,j) = ph_tendf(i,k,j) +  ph_save(i,k,j)
     
     ph_tend(i,k,j) = ph_tend(i,k,j) + ph_tendf(i,k,j)/msfty(i,j)
   ENDDO
   ENDDO
   ENDDO

   DO j = jts,MIN(jte,jde-1)
   DO k = kts,kte-1
   DO i = its,MIN(ite,ide-1)
     IF(rk_step == 1)t_tendf(i,k,j) = t_tendf(i,k,j) +  t_save(i,k,j)
     
      t_tend(i,k,j) =  t_tend(i,k,j) +  t_tendf(i,k,j)/msfty(i,j)  &
                                     +  mut(i,j)*h_diabatic(i,k,j)/msfty(i,j)
     
   ENDDO
   ENDDO
   ENDDO

   DO j = jts,MIN(jte,jde-1)
   DO i = its,MIN(ite,ide-1)

      mu_tend(i,j) =  mu_tend(i,j) +  mu_tendf(i,j)
   ENDDO
   ENDDO

END SUBROUTINE rk_addtend_dry



SUBROUTINE rk_scalar_tend ( scs, sce, config_flags,          &
                            tenddec,                        & 
                            rk_step, dt,                     &
                            ru, rv, ww, mut, mub, mu_old,    &
                            alt,                             &
                            scalar_old, scalar,              &
                            scalar_tends, advect_tend,       &
                            h_tendency, z_tendency,          & 
                            RQVFTEN,                         &
                            base, moist_step, fnm, fnp,      &
                            msfux, msfuy, msfvx, msfvx_inv,  &
                            msfvy, msftx, msfty,             &
                            rdx, rdy, rdn, rdnw,             &
                            khdif, kvdif, xkmhd,             &
                            diff_6th_opt, diff_6th_factor,   &
                            adv_opt,                         &
                            ids, ide, jds, jde, kds, kde,    &
                            ims, ime, jms, jme, kms, kme,    &
                            its, ite, jts, jte, kts, kte    )

   IMPLICIT NONE

   

   TYPE(grid_config_rec_type   ) ,   INTENT(IN   ) :: config_flags

   LOGICAL ,                INTENT(IN   ) :: tenddec 

   INTEGER ,                INTENT(IN   ) :: rk_step, scs, sce
   INTEGER ,                INTENT(IN   ) :: ids, ide, jds, jde, kds, kde, &
                                             ims, ime, jms, jme, kms, kme, &
                                             its, ite, jts, jte, kts, kte

   LOGICAL , INTENT(IN   ) :: moist_step

   REAL, DIMENSION(ims:ime, kms:kme, jms:jme , scs:sce ),                &
                                         INTENT(IN   )  :: scalar, scalar_old

   REAL, DIMENSION(ims:ime, kms:kme, jms:jme , scs:sce ),                      &
                                         INTENT(INOUT)  :: scalar_tends
                                                    
   REAL, DIMENSION(ims:ime, kms:kme, jms:jme  ), INTENT(INOUT) :: advect_tend
   REAL, DIMENSION(ims:ime, kms:kme, jms:jme  ), INTENT(  OUT) :: h_tendency, z_tendency 

   REAL, DIMENSION(ims:ime, kms:kme, jms:jme  ), INTENT(OUT  ) :: RQVFTEN

   REAL, DIMENSION(ims:ime, kms:kme, jms:jme  ), INTENT(IN   ) ::     ru,  &
                                                                      rv,  &
                                                                      ww,  &
                                                                      xkmhd,  &
                                                                      alt


   REAL , DIMENSION( kms:kme ) ,                 INTENT(IN   ) :: fnm,  &
                                                                  fnp,  &
                                                                  rdn,  &
                                                                  rdnw, &
                                                                  base

   REAL , DIMENSION( ims:ime , jms:jme ) ,       INTENT(IN   ) :: msfux,    &
                                                                  msfuy,    &
                                                                  msfvx,    &
                                                                  msfvx_inv,    &
                                                                  msfvy,    &
                                                                  msftx,    &
                                                                  msfty,    &
                                                                  mub,     &
                                                                  mut,     &
                                                                  mu_old

   REAL ,                                        INTENT(IN   ) :: rdx,     &
                                                                  rdy,     &
                                                                  khdif,   &
                                                                  kvdif

   INTEGER, INTENT( IN ) :: diff_6th_opt
   REAL,    INTENT( IN ) :: diff_6th_factor

   REAL ,                                        INTENT(IN   ) :: dt

   INTEGER, INTENT(IN   ) :: adv_opt          

   
  
   INTEGER :: im, i,j,k
   INTEGER :: time_step

   REAL    :: khdq, kvdq, tendency









   khdq = khdif/prandtl
   kvdq = kvdif/prandtl

   scalar_loop : DO im = scs, sce

     CALL zero_tend ( advect_tend(ims,kms,jms),     &
                      ids, ide, jds, jde, kds, kde, &
                      ims, ime, jms, jme, kms, kme, &
                      its, ite, jts, jte, kts, kte )

     CALL zero_tend ( h_tendency(ims,kms,jms),      &
                      ids, ide, jds, jde, kds, kde, &
                      ims, ime, jms, jme, kms, kme, &
                      its, ite, jts, jte, kts, kte )

     CALL zero_tend ( z_tendency(ims,kms,jms),      &
                      ids, ide, jds, jde, kds, kde, &
                      ims, ime, jms, jme, kms, kme, &
                      its, ite, jts, jte, kts, kte )

     CALL nl_get_time_step ( 1, time_step )

      IF( (rk_step == 3) .and. (adv_opt == POSITIVEDEF) ) THEN

        CALL advect_scalar_pd       ( scalar(ims,kms,jms,im),             &
                                      scalar_old(ims,kms,jms,im),         &
                                      advect_tend(ims,kms,jms),           &
                                      h_tendency(ims,kms,jms),            & 
                                      z_tendency(ims,kms,jms),            & 
                                      ru, rv, ww, mut, mub, mu_old,       &
                                      time_step, config_flags, tenddec,   & 
                                      msfux, msfuy, msfvx, msfvy,         &
                                      msftx, msfty, fnm, fnp,             &
                                      rdx, rdy, rdnw,dt,                  &
                                      ids, ide, jds, jde, kds, kde,       &
                                      ims, ime, jms, jme, kms, kme,       &
                                      its, ite, jts, jte, kts, kte     )

      ELSE IF( (rk_step == 3) .and. (adv_opt == MONOTONIC) ) THEN

        CALL advect_scalar_mono       ( scalar(ims,kms,jms,im),             &
                                        scalar_old(ims,kms,jms,im),         &
                                        advect_tend(ims,kms,jms),           &
                                        h_tendency(ims,kms,jms),            & 
                                        z_tendency(ims,kms,jms),            & 
                                        ru, rv, ww, mut, mub, mu_old,       &
                                        config_flags, tenddec,              & 
                                        msfux, msfuy, msfvx, msfvy,         &
                                        msftx, msfty, fnm, fnp,             &
                                        rdx, rdy, rdnw,dt,                  &
                                        ids, ide, jds, jde, kds, kde,       &
                                        ims, ime, jms, jme, kms, kme,       &
                                        its, ite, jts, jte, kts, kte     )

      ELSE IF( (rk_step == 3) .and. (adv_opt == WENO_SCALAR) ) THEN

        CALL advect_scalar_weno ( scalar(ims,kms,jms,im),        &
                                 scalar(ims,kms,jms,im),        &
                                 advect_tend(ims,kms,jms),      &
                                 ru, rv, ww, mut, time_step,    &
                                 config_flags,                  &
                                 msfux, msfuy, msfvx, msfvy,    &
                                 msftx, msfty, fnm, fnp,        &
                                 rdx, rdy, rdnw,                &
                                 ids, ide, jds, jde, kds, kde,  &
                                 ims, ime, jms, jme, kms, kme,  &
                                 its, ite, jts, jte, kts, kte  )

      ELSEIF( (rk_step == 3) .and. (adv_opt == WENOPD_SCALAR) ) THEN

        CALL advect_scalar_wenopd   ( scalar(ims,kms,jms,im),             &
                                      scalar_old(ims,kms,jms,im),         &
                                      advect_tend(ims,kms,jms),           &
                                      ru, rv, ww, mut, mub, mu_old,       &
                                      time_step, config_flags,            &
                                      msfux, msfuy, msfvx, msfvy,         &
                                      msftx, msfty, fnm, fnp,             &
                                      rdx, rdy, rdnw,dt,                  &
                                      ids, ide, jds, jde, kds, kde,       &
                                      ims, ime, jms, jme, kms, kme,       &
                                      its, ite, jts, jte, kts, kte     )

      ELSE

        CALL advect_scalar     ( scalar(ims,kms,jms,im),        &
                                 scalar(ims,kms,jms,im),        &
                                 advect_tend(ims,kms,jms),      &
                                 ru, rv, ww, mut, time_step,    &
                                 config_flags,                  &
                                 msfux, msfuy, msfvx, msfvy,    &
                                 msftx, msfty, fnm, fnp,        &
                                 rdx, rdy, rdnw,                &
                                 ids, ide, jds, jde, kds, kde,  &
                                 ims, ime, jms, jme, kms, kme,  &
                                 its, ite, jts, jte, kts, kte  )

      END IF

     IF((config_flags%cu_physics == GDSCHEME .OR. config_flags%cu_physics == G3SCHEME .OR. &
         config_flags%cu_physics == GFSCHEME .OR.    & 
         config_flags%cu_physics == KFETASCHEME .OR. config_flags%cu_physics == MSKFSCHEME .OR. &
         config_flags%cu_physics == TIEDTKESCHEME .OR. config_flags%cu_physics == NTIEDTKESCHEME  ) &      
                     .and. moist_step .and. ( im == P_QV) ) THEN

        CALL set_tend( RQVFTEN, advect_tend, msfty,    &
                       ids, ide, jds, jde, kds, kde,   &
                       ims, ime, jms, jme, kms, kme,   &
                       its, ite, jts, jte, kts, kte      )
     ENDIF

     rk_step_1: IF( rk_step == 1 ) THEN

       diff_opt1 : IF (config_flags%diff_opt .eq. 1) THEN

       CALL horizontal_diffusion ( 'm', scalar(ims,kms,jms,im),            &
                                        scalar_tends(ims,kms,jms,im), mut, &
                                        config_flags,                      &
                                        msfux, msfuy, msfvx, msfvx_inv,    &
                                        msfvy, msftx, msfty,               &
                                        khdq , xkmhd, rdx, rdy,            &
                                        ids, ide, jds, jde, kds, kde,      &
                                        ims, ime, jms, jme, kms, kme,      &
                                        its, ite, jts, jte, kts, kte      )

       pbl_test : IF (config_flags%bl_pbl_physics .eq. 0) THEN

         IF( (moist_step) .and. ( im == P_QV)) THEN

            CALL vertical_diffusion_mp ( scalar(ims,kms,jms,im),       &
                                         scalar_tends(ims,kms,jms,im), &
                                         config_flags, base,           &
                                         alt, mut, rdn, rdnw, kvdq ,   &
                                         ids, ide, jds, jde, kds, kde, &
                                         ims, ime, jms, jme, kms, kme, &
                                         its, ite, jts, jte, kts, kte )

         ELSE 

            CALL vertical_diffusion (  'm', scalar(ims,kms,jms,im),       &
                                            scalar_tends(ims,kms,jms,im), &
                                            config_flags,                 &
                                            alt, mut, rdn, rdnw, kvdq,    &
                                            ids, ide, jds, jde, kds, kde, &
                                            ims, ime, jms, jme, kms, kme, &
                                            its, ite, jts, jte, kts, kte )

         END IF

      ENDIF pbl_test

    ENDIF diff_opt1

    IF ( diff_6th_opt .NE. 0 )                                        &
      CALL sixth_order_diffusion( 'm', scalar(ims,kms,jms,im),        &
                                       scalar_tends(ims,kms,jms,im),  &
                                       mut, dt, config_flags,         &
                                       diff_6th_opt, diff_6th_factor, &
                                       ids, ide, jds, jde, kds, kde,  &
                                       ims, ime, jms, jme, kms, kme,  &
                                       its, ite, jts, jte, kts, kte )

  ENDIF rk_step_1

 END DO scalar_loop

END SUBROUTINE rk_scalar_tend



SUBROUTINE q_diabatic_add ( scs, sce,           &
                            dt, mu,                    &
                            qv_diabatic, qc_diabatic,        &
                            scalar_tends,              &
                            ids, ide, jds, jde, kds, kde,    &
                            ims, ime, jms, jme, kms, kme,    &
                            its, ite, jts, jte, kts, kte    )

   IMPLICIT NONE

   

   INTEGER ,                INTENT(IN   ) :: scs, sce
   INTEGER ,                INTENT(IN   ) :: ids, ide, jds, jde, kds, kde, &
                                             ims, ime, jms, jme, kms, kme, &
                                             its, ite, jts, jte, kts, kte

   REAL,     DIMENSION( ims:ime, jms:jme )                        , &
             INTENT(IN   )   ::                                 mu

   REAL, DIMENSION(ims:ime, kms:kme, jms:jme ),                &
                                         INTENT(IN   )  :: qv_diabatic, qc_diabatic

   REAL, DIMENSION(ims:ime, kms:kme, jms:jme , scs:sce ),                &
                                         INTENT(INOUT)  :: scalar_tends

   REAL ,                                        INTENT(IN   ) :: dt

   
  
   INTEGER :: im, i,j,k










   scalar_loop : DO im = scs, sce

     IF( im.eq.p_qv )THEN

       DO j = jts,MIN(jte,jde-1)
       DO k = kts,kte-1
       DO i = its,MIN(ite,ide-1)
         scalar_tends(i,k,j,im) = scalar_tends(i,k,j,im) + qv_diabatic(i,k,j)*mu(I,J)
       ENDDO
       ENDDO
       ENDDO
     ENDIF
     IF( im.eq.p_qc )THEN

       DO j = jts,MIN(jte,jde-1)
       DO k = kts,kte-1
       DO i = its,MIN(ite,ide-1)
         scalar_tends(i,k,j,im) = scalar_tends(i,k,j,im) + qc_diabatic(i,k,j)*mu(I,J)
       ENDDO
       ENDDO
       ENDDO
     ENDIF

   END DO scalar_loop

END SUBROUTINE q_diabatic_add



SUBROUTINE q_diabatic_subtr( scs, sce,                       &
                            dt,                     &
                            qv_diabatic, qc_diabatic,        &
                            scalar,              &
                            ids, ide, jds, jde, kds, kde,    &
                            ims, ime, jms, jme, kms, kme,    &
                            its, ite, jts, jte, kts, kte    )

   IMPLICIT NONE

   

   INTEGER ,                INTENT(IN   ) :: scs, sce
   INTEGER ,                INTENT(IN   ) :: ids, ide, jds, jde, kds, kde, &
                                             ims, ime, jms, jme, kms, kme, &
                                             its, ite, jts, jte, kts, kte

   REAL, DIMENSION(ims:ime, kms:kme, jms:jme ),                &
                                         INTENT(IN   )  :: qv_diabatic, qc_diabatic

   REAL, DIMENSION(ims:ime, kms:kme, jms:jme , scs:sce ),                &
                                         INTENT(INOUT)  :: scalar

   REAL ,                                        INTENT(IN   ) :: dt

   
  
   INTEGER :: im, i,j,k











   scalar_loop : DO im = scs, sce

     IF( im.eq.p_qv )THEN

       DO j = jts,MIN(jte,jde-1)
       DO k = kts,kte-1
       DO i = its,MIN(ite,ide-1)
         scalar(i,k,j,im) = scalar(i,k,j,im) - dt*qv_diabatic(i,k,j)
       ENDDO
       ENDDO
       ENDDO
     ENDIF
     IF( im.eq.p_qc )THEN

       DO j = jts,MIN(jte,jde-1)
       DO k = kts,kte-1
       DO i = its,MIN(ite,ide-1)
         scalar(i,k,j,im) = scalar(i,k,j,im) - dt*qc_diabatic(i,k,j)
       ENDDO
       ENDDO
       ENDDO
     ENDIF

   END DO scalar_loop

END SUBROUTINE q_diabatic_subtr




SUBROUTINE rk_update_scalar( scs, sce,                      &
                             scalar_1, scalar_2, sc_tend,   &
                             advh_t, advz_t,                & 
                             advect_tend,                   &
                             h_tendency, z_tendency,        & 
                             msftx, msfty,                  &
                             mu_old, mu_new, mu_base,       &
                             rk_step, dt, spec_zone,        &
                             config_flags,                  &
                             tenddec,                      & 
                             ids, ide, jds, jde, kds, kde,  &
                             ims, ime, jms, jme, kms, kme,  &
                             its, ite, jts, jte, kts, kte  )

   IMPLICIT NONE

   

   TYPE(grid_config_rec_type   ) ,   INTENT(IN   ) :: config_flags

   LOGICAL ,                INTENT(IN   ) :: tenddec 

   INTEGER ,                INTENT(IN   ) :: scs, sce, rk_step, spec_zone
   INTEGER ,                INTENT(IN   ) :: ids, ide, jds, jde, kds, kde, &
                                             ims, ime, jms, jme, kms, kme, &
                                             its, ite, jts, jte, kts, kte

   REAL,                    INTENT(IN   ) :: dt

   REAL, DIMENSION(ims:ime, kms:kme, jms:jme , scs:sce),                &
         INTENT(INOUT)                                  :: scalar_1,    &
                                                           scalar_2

   REAL, DIMENSION(ims:ime, kms:kme, jms:jme , scs:sce),                &
         INTENT(IN)                                     :: sc_tend

   REAL, DIMENSION(ims:ime, kms:kme, jms:jme ),                &
         INTENT(IN)                                  :: advect_tend

   REAL, DIMENSION(ims:ime, kms:kme, jms:jme ), INTENT(INOUT) , OPTIONAL :: advh_t,  advz_t 
   REAL, DIMENSION(ims:ime, kms:kme, jms:jme ), INTENT(IN   ) :: h_tendency, z_tendency 

   REAL, DIMENSION(ims:ime, jms:jme  ), INTENT(IN   ) ::  mu_old,  &
                                                          mu_new,  &
                                                          mu_base, &
                                                          msftx,   &
                                                          msfty

   INTEGER :: i,j,k,im
   REAL    :: sc_middle, msfsq
   REAL, DIMENSION(its:ite) :: muold, r_munew

   REAL, DIMENSION(its:ite, kts:kte, jts:jte  ) :: tendency

   INTEGER :: i_start,i_end,j_start,j_end,k_start,k_end
   INTEGER :: i_start_spc,i_end_spc,j_start_spc,j_end_spc,k_start_spc,k_end_spc












      i_start = its
      i_end   = min(ite,ide-1)
      j_start = jts
      j_end   = min(jte,jde-1)
      k_start = kts
      k_end   = kte-1

      i_start_spc = i_start
      i_end_spc   = i_end
      j_start_spc = j_start
      j_end_spc   = j_end
      k_start_spc = k_start
      k_end_spc   = k_end

    IF( config_flags%nested .or. config_flags%specified ) THEN
      IF( .NOT. config_flags%periodic_x)i_start = max( its,ids+spec_zone )
      IF( .NOT. config_flags%periodic_x)i_end   = min( ite,ide-spec_zone-1 )
      j_start = max( jts,jds+spec_zone )
      j_end   = min( jte,jde-spec_zone-1 )
      k_start = kts
      k_end   = min( kte, kde-1 )
    ENDIF

    IF ( rk_step == 1 ) THEN

      
      

      DO  im = scs,sce

       DO  j = jts, min(jte,jde-1)
       DO  k = kts, min(kte,kde-1)
       DO  i = its, min(ite,ide-1)
           tendency(i,k,j) = 0.
       ENDDO
       ENDDO
       ENDDO
   
       DO  j = j_start,j_end
       DO  k = k_start,k_end
       DO  i = i_start,i_end
          
           tendency(i,k,j) = advect_tend(i,k,j) * msfty(i,j)
       ENDDO
       ENDDO
       ENDDO
   
       DO  j = j_start_spc,j_end_spc
       DO  k = k_start_spc,k_end_spc
       DO  i = i_start_spc,i_end_spc
           tendency(i,k,j) = tendency(i,k,j) + sc_tend(i,k,j,im)
       ENDDO
       ENDDO
       ENDDO
   
      DO  j = jts, min(jte,jde-1)

      DO  i = its, min(ite,ide-1)
        muold(i) = mu_old(i,j) + mu_base(i,j)
        r_munew(i) = 1./(mu_new(i,j) + mu_base(i,j))
      ENDDO

      DO  k = kts, min(kte,kde-1)
      DO  i = its, min(ite,ide-1)

        scalar_1(i,k,j,im) = scalar_2(i,k,j,im)
        scalar_2(i,k,j,im) = (muold(i)*scalar_1(i,k,j,im)   &
                             + dt*tendency(i,k,j))*r_munew(i)

      ENDDO
      ENDDO
      ENDDO

      ENDDO

    ELSE

      

      DO  im = scs, sce

       DO  j = jts, min(jte,jde-1)
       DO  k = kts, min(kte,kde-1)
       DO  i = its, min(ite,ide-1)
           tendency(i,k,j) = 0.
       ENDDO
       ENDDO
       ENDDO
   
       DO  j = j_start,j_end
       DO  k = k_start,k_end
       DO  i = i_start,i_end
           
           tendency(i,k,j) = advect_tend(i,k,j) * msfty(i,j)
       ENDDO
       ENDDO
       ENDDO
   
       DO  j = j_start_spc,j_end_spc
       DO  k = k_start_spc,k_end_spc
       DO  i = i_start_spc,i_end_spc
           tendency(i,k,j) = tendency(i,k,j) + sc_tend(i,k,j,im)
       ENDDO
       ENDDO
       ENDDO

      DO  j = jts, min(jte,jde-1)

      DO  i = its, min(ite,ide-1)
        muold(i) = mu_old(i,j) + mu_base(i,j)
        r_munew(i) = 1./(mu_new(i,j) + mu_base(i,j))
      ENDDO

      DO  k = kts, min(kte,kde-1)
      DO  i = its, min(ite,ide-1)

        scalar_2(i,k,j,im) = (muold(i)*scalar_1(i,k,j,im)   &
                             + dt*tendency(i,k,j))*r_munew(i)

      ENDDO
      ENDDO

      
      IF ( PRESENT(advh_t) .AND. PRESENT(advz_t) ) THEN
        IF(tenddec.and.rk_step.eq.config_flags%rk_ord) THEN
          DO  k = kts, min(kte,kde-1)
          DO  i = its, min(ite,ide-1)

            advh_t(i,k,j) = advh_t(i,k,j) + (dt*h_tendency(i,k,j)* msfty(i,j))*r_munew(i)
            advz_t(i,k,j) = advz_t(i,k,j) + (dt*z_tendency(i,k,j)* msfty(i,j))*r_munew(i)

          ENDDO
          ENDDO
        END IF
      END IF
      
      ENDDO

      ENDDO

    END IF

END SUBROUTINE rk_update_scalar



SUBROUTINE rk_update_scalar_pd( scs, sce,                      &
                                scalar, sc_tend,               &
                                mu_old, mu_new, mu_base,       &
                                rk_step, dt, spec_zone,        &
                                config_flags,                  &
                                ids, ide, jds, jde, kds, kde,  &
                                ims, ime, jms, jme, kms, kme,  &
                                its, ite, jts, jte, kts, kte  )

   IMPLICIT NONE

   

   TYPE(grid_config_rec_type   ) ,   INTENT(IN   ) :: config_flags

   INTEGER ,                INTENT(IN   ) :: scs, sce, rk_step, spec_zone
   INTEGER ,                INTENT(IN   ) :: ids, ide, jds, jde, kds, kde, &
                                             ims, ime, jms, jme, kms, kme, &
                                             its, ite, jts, jte, kts, kte

   REAL,                    INTENT(IN   ) :: dt

   REAL, DIMENSION(ims:ime, kms:kme, jms:jme , scs:sce),                &
         INTENT(INOUT)                                  :: scalar,      &
                                                           sc_tend

   REAL, DIMENSION(ims:ime, jms:jme  ), INTENT(IN   ) ::  mu_old,  &
                                                          mu_new,  &
                                                          mu_base

   INTEGER :: i,j,k,im
   REAL    :: sc_middle, msfsq
   REAL, DIMENSION(its:ite) :: muold, r_munew

   REAL, DIMENSION(its:ite, kts:kte, jts:jte  ) :: tendency

   INTEGER :: i_start,i_end,j_start,j_end,k_start,k_end
   INTEGER :: i_start_spc,i_end_spc,j_start_spc,j_end_spc,k_start_spc,k_end_spc












      i_start = its
      i_end   = min(ite,ide-1)
      j_start = jts
      j_end   = min(jte,jde-1)
      k_start = kts
      k_end   = kte-1

      i_start_spc = i_start
      i_end_spc   = i_end
      j_start_spc = j_start
      j_end_spc   = j_end
      k_start_spc = k_start
      k_end_spc   = k_end

    IF( config_flags%nested .or. config_flags%specified ) THEN
      IF( .NOT. config_flags%periodic_x)i_start = max( its,ids+spec_zone )
      IF( .NOT. config_flags%periodic_x)i_end   = min( ite,ide-spec_zone-1 )
      j_start = max( jts,jds+spec_zone )
      j_end   = min( jte,jde-spec_zone-1 )
      k_start = kts
      k_end   = min( kte, kde-1 )
    ENDIF

      DO  im = scs, sce

       DO  j = jts, min(jte,jde-1)
       DO  k = kts, min(kte,kde-1)
       DO  i = its, min(ite,ide-1)
           tendency(i,k,j) = 0.
       ENDDO
       ENDDO
       ENDDO
   
       DO  j = j_start_spc,j_end_spc
       DO  k = k_start_spc,k_end_spc
       DO  i = i_start_spc,i_end_spc
           tendency(i,k,j) = tendency(i,k,j) + sc_tend(i,k,j,im)
           sc_tend(i,k,j,im) = 0.
       ENDDO
       ENDDO
       ENDDO

      DO  j = jts, min(jte,jde-1)

      DO  i = its, min(ite,ide-1)
        muold(i) = mu_old(i,j) + mu_base(i,j)
        r_munew(i) = 1./(mu_new(i,j) + mu_base(i,j))
      ENDDO

      DO  k = kts, min(kte,kde-1)
      DO  i = its, min(ite,ide-1)

        scalar(i,k,j,im) = (muold(i)*scalar(i,k,j,im)   &
                             + dt*tendency(i,k,j))*r_munew(i)
      ENDDO
      ENDDO
      ENDDO

      ENDDO

END SUBROUTINE rk_update_scalar_pd



SUBROUTINE init_zero_tendency(ru_tendf, rv_tendf, rw_tendf, ph_tendf,  &
                              t_tendf,  tke_tendf, mu_tendf,           &
                              moist_tendf,chem_tendf,scalar_tendf,     &
                              tracer_tendf,n_tracer,                   &
                              n_moist,n_chem,n_scalar,rk_step,         &
                              ids, ide, jds, jde, kds, kde,            &
                              ims, ime, jms, jme, kms, kme,            &
                              its, ite, jts, jte, kts, kte             )

   IMPLICIT NONE


   INTEGER ,       INTENT(IN   ) :: ids, ide, jds, jde, kds, kde, &
                                    ims, ime, jms, jme, kms, kme, &
                                    its, ite, jts, jte, kts, kte

   INTEGER ,       INTENT(IN   ) :: n_moist,n_chem,n_scalar,n_tracer,rk_step

   REAL , DIMENSION( ims:ime , kms:kme, jms:jme  ) , INTENT(INOUT) ::  &
                                                             ru_tendf, &
                                                             rv_tendf, &
                                                             rw_tendf, &
                                                             ph_tendf, &
                                                              t_tendf, &
                                                            tke_tendf

   REAL , DIMENSION( ims:ime , jms:jme  ) , INTENT(INOUT) ::  mu_tendf

   REAL , DIMENSION(ims:ime, kms:kme, jms:jme, n_moist),INTENT(INOUT)::&
                                                          moist_tendf

   REAL , DIMENSION(ims:ime, kms:kme, jms:jme, n_chem ),INTENT(INOUT)::&
                                                          chem_tendf
   REAL , DIMENSION(ims:ime, kms:kme, jms:jme, n_tracer ),INTENT(INOUT)::&
                                                          tracer_tendf

   REAL , DIMENSION(ims:ime, kms:kme, jms:jme, n_scalar ),INTENT(INOUT)::&
                                                          scalar_tendf



   INTEGER :: im, ic, is









   CALL zero_tend ( ru_tendf,                        &
                    ids, ide, jds, jde, kds, kde,    &
                    ims, ime, jms, jme, kms, kme,    &
                    its, ite, jts, jte, kts, kte     )

   CALL zero_tend ( rv_tendf,                        &
                    ids, ide, jds, jde, kds, kde,    &
                    ims, ime, jms, jme, kms, kme,    &
                    its, ite, jts, jte, kts, kte     )

   CALL zero_tend ( rw_tendf,                        &
                    ids, ide, jds, jde, kds, kde,    &
                    ims, ime, jms, jme, kms, kme,    &
                    its, ite, jts, jte, kts, kte     )

   CALL zero_tend ( ph_tendf,                        &
                    ids, ide, jds, jde, kds, kde,    &
                    ims, ime, jms, jme, kms, kme,    &
                    its, ite, jts, jte, kts, kte     )

   CALL zero_tend ( t_tendf,                         &
                    ids, ide, jds, jde, kds, kde,    &
                    ims, ime, jms, jme, kms, kme,    &
                    its, ite, jts, jte, kts, kte     )

   CALL zero_tend ( tke_tendf,                       &
                    ids, ide, jds, jde, kds, kde,    &
                    ims, ime, jms, jme, kms, kme,    &
                    its, ite, jts, jte, kts, kte     )

   CALL zero_tend2d( mu_tendf,                        &
                    ids, ide, jds, jde, kds, kds,    &
                    ims, ime, jms, jme, kms, kms,    &
                    its, ite, jts, jte, kts, kts     )


   DO im=1,n_moist                      
      CALL zero_tend ( moist_tendf(ims,kms,jms,im),  &
                       ids, ide, jds, jde, kds, kde, &
                       ims, ime, jms, jme, kms, kme, &
                       its, ite, jts, jte, kts, kte  )
   ENDDO


   DO ic=1,n_chem                       
      CALL zero_tend ( chem_tendf(ims,kms,jms,ic),   &
                       ids, ide, jds, jde, kds, kde, &
                       ims, ime, jms, jme, kms, kme, &
                       its, ite, jts, jte, kts, kte  )
   ENDDO


   DO ic=1,n_tracer                     
      CALL zero_tend ( tracer_tendf(ims,kms,jms,ic), &
                       ids, ide, jds, jde, kds, kde, &
                       ims, ime, jms, jme, kms, kme, &
                       its, ite, jts, jte, kts, kte  )
   ENDDO


   DO ic=1,n_scalar                       
      CALL zero_tend ( scalar_tendf(ims,kms,jms,ic),   &
                       ids, ide, jds, jde, kds, kde, &
                       ims, ime, jms, jme, kms, kme, &
                       its, ite, jts, jte, kts, kte  )
   ENDDO

END SUBROUTINE init_zero_tendency




SUBROUTINE dump_data( a, field, io_unit,            &
                      ims, ime, jms, jme, kms, kme, &
                      ids, ide, jds, jde, kds, kde )
implicit none
integer ::  ims, ime, jms, jme, kms, kme, &
            ids, ide, jds, jde, kds, kde 
real, dimension(ims:ime, kms:kme, jds:jde) :: a
character :: field
integer :: io_unit

integer :: is,ie,js,je,ks,ke







is = ids
ie = ide-1
js = jds
je = jde-1
ks = kds
ke = kde-1

if(field == 'u') ie = ide
if(field == 'v') je = jde
if(field == 'w') ke = kde

write(io_unit) is,ie,ks,ke,js,je
write(io_unit) a(is:ie, ks:ke, js:je)

end subroutine dump_data



SUBROUTINE calculate_phy_tend (config_flags,mu,muu,muv,pi3d,           &
                     RTHRATEN,                                         &
                     RUBLTEN,RVBLTEN,RTHBLTEN,                         &
                     RQVBLTEN,RQCBLTEN,RQIBLTEN,                       &
                     RUCUTEN,RVCUTEN,RTHCUTEN,                         &
                     RQVCUTEN,RQCCUTEN,RQRCUTEN,                       &
                     RQICUTEN,RQSCUTEN,                                &
                     RUSHTEN,RVSHTEN,RTHSHTEN,                         &
                     RQVSHTEN,RQCSHTEN,RQRSHTEN,                       &
                     RQISHTEN,RQSSHTEN,RQGSHTEN,                       &
                     RUNDGDTEN,RVNDGDTEN,RTHNDGDTEN,RQVNDGDTEN,        &
                     RMUNDGDTEN,                                       &
                     scalar, scalar_tend, num_scalar,                  &
                     tracer, tracer_tend, num_tracer,                  &
                     ids,ide, jds,jde, kds,kde,                        &
                     ims,ime, jms,jme, kms,kme,                        &
                     its,ite, jts,jte, kts,kte                         )

      IMPLICIT NONE

      TYPE(grid_config_rec_type), INTENT(IN)     ::      config_flags

      INTEGER,  INTENT(IN   )   ::          num_scalar, num_tracer
      INTEGER,  INTENT(IN   )   ::          ids,ide, jds,jde, kds,kde, &
                                            ims,ime, jms,jme, kms,kme, &
                                            its,ite, jts,jte, kts,kte

      REAL,     DIMENSION( ims:ime, kms:kme, jms:jme )               , &
                INTENT(IN   )   ::                               pi3d
                                                                 
      REAL,     DIMENSION( ims:ime, jms:jme )                        , &
                INTENT(IN   )   ::                                 mu, &
                                                                  muu, &
                                                                  muv
      
                                                           


      REAL,     DIMENSION( ims:ime, kms:kme, jms:jme ),                &
                INTENT(INOUT)   ::                           RTHRATEN



      REAL,     DIMENSION( ims:ime , kms:kme , jms:jme ),              &
                INTENT(INOUT)   ::                                     &
                                                              RUCUTEN, &
                                                              RVCUTEN, &
                                                             RTHCUTEN, &
                                                             RQVCUTEN, &
                                                             RQCCUTEN, &
                                                             RQRCUTEN, &
                                                             RQICUTEN, &
                                                             RQSCUTEN, &
                                                              RUSHTEN, &
                                                              RVSHTEN, &
                                                             RTHSHTEN, &
                                                             RQVSHTEN, &
                                                             RQCSHTEN, &
                                                             RQRSHTEN, &
                                                             RQISHTEN, &
                                                             RQSSHTEN, &
                                                             RQGSHTEN



      REAL,     DIMENSION( ims:ime, kms:kme, jms:jme )               , &
                INTENT(INOUT)   ::                            RUBLTEN, &
                                                              RVBLTEN, &
                                                             RTHBLTEN, &
                                                             RQVBLTEN, &
                                                             RQCBLTEN, &
                                                             RQIBLTEN



      REAL,     DIMENSION( ims:ime, kms:kme, jms:jme )               , &
                INTENT(INOUT)   ::                            RUNDGDTEN, &
                                                              RVNDGDTEN, &
                                                             RTHNDGDTEN, &
                                                             RQVNDGDTEN
      REAL,     DIMENSION( ims:ime, jms:jme )               , &
                INTENT(INOUT)   ::                           RMUNDGDTEN



    REAL    ,DIMENSION(ims:ime,kms:kme,jms:jme,num_tracer),INTENT(INOUT)   :: tracer
    REAL    ,DIMENSION(ims:ime,kms:kme,jms:jme,num_tracer),INTENT(INOUT)   :: tracer_tend
    REAL    ,DIMENSION(ims:ime,kms:kme,jms:jme,num_scalar),INTENT(INOUT)   :: scalar
    REAL    ,DIMENSION(ims:ime,kms:kme,jms:jme,num_scalar),INTENT(INOUT)   :: scalar_tend

      INTEGER :: i,k,j, im
      INTEGER :: itf,ktf,jtf,itsu,jtsv











      itf=MIN(ite,ide-1)
      jtf=MIN(jte,jde-1)
      ktf=MIN(kte,kde-1)
      itsu=MAX(its,ids+1)
      jtsv=MAX(jts,jds+1)



   IF (config_flags%ra_lw_physics .gt. 0 .or. config_flags%ra_sw_physics .gt. 0) THEN

      DO J=jts,jtf
      DO K=kts,ktf
      DO I=its,itf
         RTHRATEN(I,K,J)=mu(I,J)*RTHRATEN(I,K,J)
      ENDDO
      ENDDO
      ENDDO

   ENDIF



   IF (config_flags%cu_physics .gt. 0) THEN

      DO J=jts,jtf
      DO I=its,itf
      DO K=kts,ktf
         RUCUTEN(I,K,J) =mu(I,J)*RUCUTEN(I,K,J)
         RVCUTEN(I,K,J) =mu(I,J)*RVCUTEN(I,K,J)
         RTHCUTEN(I,K,J)=mu(I,J)*RTHCUTEN(I,K,J)
         RQVCUTEN(I,K,J)=mu(I,J)*RQVCUTEN(I,K,J)
      ENDDO
      ENDDO
      ENDDO

      IF (P_QC .ge. PARAM_FIRST_SCALAR)THEN
         DO J=jts,jtf
         DO I=its,itf
         DO K=kts,ktf
            RQCCUTEN(I,K,J)=mu(I,J)*RQCCUTEN(I,K,J)
         ENDDO
         ENDDO
         ENDDO
      ENDIF

      IF (P_QR .ge. PARAM_FIRST_SCALAR)THEN
         DO J=jts,jtf
         DO I=its,itf
         DO K=kts,ktf
            RQRCUTEN(I,K,J)=mu(I,J)*RQRCUTEN(I,K,J)
         ENDDO
         ENDDO
         ENDDO
      ENDIF

      IF (P_QI .ge. PARAM_FIRST_SCALAR)THEN
         DO J=jts,jtf
         DO I=its,itf
         DO K=kts,ktf
            RQICUTEN(I,K,J)=mu(I,J)*RQICUTEN(I,K,J)
         ENDDO
         ENDDO
         ENDDO
      ENDIF

      IF(P_QS .ge. PARAM_FIRST_SCALAR)THEN
         DO J=jts,jtf
         DO I=its,itf
         DO K=kts,ktf
            RQSCUTEN(I,K,J)=mu(I,J)*RQSCUTEN(I,K,J)
         ENDDO
         ENDDO
         ENDDO
      ENDIF

   ENDIF



   IF (config_flags%shcu_physics .gt. 0) THEN

      DO J=jts,jtf
      DO I=its,itf
      DO K=kts,ktf
         RUSHTEN(I,K,J) =mu(I,J)*RUSHTEN(I,K,J)
         RVSHTEN(I,K,J) =mu(I,J)*RVSHTEN(I,K,J)
         RTHSHTEN(I,K,J)=mu(I,J)*RTHSHTEN(I,K,J)
         RQVSHTEN(I,K,J)=mu(I,J)*RQVSHTEN(I,K,J)
      ENDDO
      ENDDO
      ENDDO

      IF (P_QC .ge. PARAM_FIRST_SCALAR)THEN
         DO J=jts,jtf
         DO I=its,itf
         DO K=kts,ktf
            RQCSHTEN(I,K,J)=mu(I,J)*RQCSHTEN(I,K,J)
         ENDDO
         ENDDO
         ENDDO
      ENDIF

      IF (P_QR .ge. PARAM_FIRST_SCALAR)THEN
         DO J=jts,jtf
         DO I=its,itf
         DO K=kts,ktf
            RQRSHTEN(I,K,J)=mu(I,J)*RQRSHTEN(I,K,J)
         ENDDO
         ENDDO
         ENDDO
      ENDIF

      IF (P_QI .ge. PARAM_FIRST_SCALAR)THEN
         DO J=jts,jtf
         DO I=its,itf
         DO K=kts,ktf
            RQISHTEN(I,K,J)=mu(I,J)*RQISHTEN(I,K,J)
         ENDDO
         ENDDO
         ENDDO
      ENDIF

      IF(P_QS .ge. PARAM_FIRST_SCALAR)THEN
         DO J=jts,jtf
         DO I=its,itf
         DO K=kts,ktf
            RQSSHTEN(I,K,J)=mu(I,J)*RQSSHTEN(I,K,J)
         ENDDO
         ENDDO
         ENDDO
      ENDIF

      IF(P_QG .ge. PARAM_FIRST_SCALAR)THEN
         DO J=jts,jtf
         DO I=its,itf
         DO K=kts,ktf
            RQGSHTEN(I,K,J)=mu(I,J)*RQGSHTEN(I,K,J)
         ENDDO
         ENDDO
         ENDDO
      ENDIF

   ENDIF



   IF (config_flags%bl_pbl_physics .gt. 0) THEN

      DO J=jts,jtf
      DO K=kts,ktf
      DO I=its,itf
         RUBLTEN(I,K,J) =mu(I,J)*RUBLTEN(I,K,J)
         RVBLTEN(I,K,J) =mu(I,J)*RVBLTEN(I,K,J)
         RTHBLTEN(I,K,J)=mu(I,J)*RTHBLTEN(I,K,J)
      ENDDO
      ENDDO
      ENDDO

      IF (P_QV .ge. PARAM_FIRST_SCALAR) THEN
         DO J=jts,jtf
         DO K=kts,ktf
         DO I=its,itf
            RQVBLTEN(I,K,J)=mu(I,J)*RQVBLTEN(I,K,J)
         ENDDO
         ENDDO
         ENDDO
      ENDIF

      IF (P_QC .ge. PARAM_FIRST_SCALAR) THEN
         DO J=jts,jtf
         DO K=kts,ktf
         DO I=its,itf
           RQCBLTEN(I,K,J)=mu(I,J)*RQCBLTEN(I,K,J)
         ENDDO
         ENDDO
         ENDDO
      ENDIF

      IF (P_QI .ge. PARAM_FIRST_SCALAR) THEN
         DO J=jts,jtf
         DO K=kts,ktf
         DO I=its,itf
            RQIBLTEN(I,K,J)=mu(I,J)*RQIBLTEN(I,K,J)
         ENDDO
         ENDDO
         ENDDO
      ENDIF

    ENDIF





   IF (config_flags%grid_fdda .gt. 0) THEN

      DO J=jts,jtf
      DO K=kts,ktf
      DO I=itsu,itf


         RUNDGDTEN(I,K,J) =muu(I,J)*RUNDGDTEN(I,K,J)





      ENDDO
      ENDDO
      ENDDO

      DO J=jtsv,jtf
      DO K=kts,ktf
      DO I=its,itf
         RVNDGDTEN(I,K,J) =muv(I,J)*RVNDGDTEN(I,K,J)
      ENDDO
      ENDDO
      ENDDO
      DO J=jts,jtf
      DO K=kts,ktf
      DO I=its,itf


         RTHNDGDTEN(I,K,J)=mu(I,J)*RTHNDGDTEN(I,K,J)



      ENDDO
      ENDDO
      ENDDO

      IF (P_QV .ge. PARAM_FIRST_SCALAR) THEN
         DO J=jts,jtf
         DO K=kts,ktf
         DO I=its,itf
            RQVNDGDTEN(I,K,J)=mu(I,J)*RQVNDGDTEN(I,K,J)
         ENDDO
         ENDDO
         ENDDO
      ENDIF

    ENDIF



   DO im = PARAM_FIRST_SCALAR,num_scalar
         DO J=jts,jtf
         DO K=kts,ktf
         DO I=its,itf
            scalar_tend(I,K,J,im)=mu(I,J)*scalar_tend(I,K,J,im)
         ENDDO
         ENDDO
         ENDDO
   ENDDO

   DO im = PARAM_FIRST_SCALAR,num_tracer
         DO J=jts,jtf
         DO K=kts,ktf
         DO I=its,itf
            tracer_tend(I,K,J,im)=mu(I,J)*tracer_tend(I,K,J,im)
         ENDDO
         ENDDO
         ENDDO
   ENDDO


END SUBROUTINE calculate_phy_tend



SUBROUTINE positive_definite_filter ( a,                          &
                                      ids,ide, jds,jde, kds,kde,  &
                                      ims,ime, jms,jme, kms,kme,  &
                                      its,ite, jts,jte, kts,kte  )

  IMPLICIT NONE

  INTEGER,  INTENT(IN   )   ::          ids,ide, jds,jde, kds,kde, &
                                        ims,ime, jms,jme, kms,kme, &
                                        its,ite, jts,jte, kts,kte

  REAL, DIMENSION( ims:ime , kms:kme , jms:jme  ), INTENT(INOUT) :: a

  INTEGER :: i,k,j







  DO j=jts,min(jte,jde-1)
  DO k=kts,kte-1
  DO i=its,min(ite,ide-1)

    a(i,k,j) = min(1000.,max(a(i,k,j),0.))
  ENDDO
  ENDDO
  ENDDO

  END SUBROUTINE positive_definite_filter



SUBROUTINE bound_tke ( tke, tke_upper_bound,       &
                       ids,ide, jds,jde, kds,kde,  &
                       ims,ime, jms,jme, kms,kme,  &
                       its,ite, jts,jte, kts,kte  )

  IMPLICIT NONE

  INTEGER,  INTENT(IN   )   ::          ids,ide, jds,jde, kds,kde, &
                                        ims,ime, jms,jme, kms,kme, &
                                        its,ite, jts,jte, kts,kte

  REAL, DIMENSION( ims:ime , kms:kme , jms:jme  ), INTENT(INOUT) :: tke
  REAL, INTENT(   IN) :: tke_upper_bound

  INTEGER :: i,k,j







  DO j=jts,min(jte,jde-1)
  DO k=kts,kte-1
  DO i=its,min(ite,ide-1)
    tke(i,k,j) = min(tke_upper_bound,max(tke(i,k,j),0.))
  ENDDO
  ENDDO
  ENDDO

  END SUBROUTINE bound_tke





subroutine trajectory (     grid,config_flags,               &
                            dt,itimestep,ru_m, rv_m, ww_m, mut,muu,muv,&
                            rdx, rdy, rdn, rdnw,rdzw,        &
                            traj_i,traj_j,traj_k,            &
                            traj_long,traj_lat,              &
                            xlong,xlat,                      &
                            msft,msfu,msfv,                  &
                            ids, ide, jds, jde, kds, kde,    &
                            ims, ime, jms, jme, kms, kme,    &
                            its, ite, jts, jte, kts, kte    )


  implicit none














  TYPE(proj_info) :: proj
  TYPE(domain), INTENT(IN) :: grid
  TYPE (grid_config_rec_type) , INTENT(IN)          :: config_flags
  INTEGER ,                INTENT(IN   ) :: ids, ide, jds, jde, kds, kde, &
                                             ims, ime, jms, jme, kms, kme, &
                                             its, ite, jts, jte, kts, kte
   INTEGER ,                                      INTENT(IN   ) :: itimestep
   REAL ,                                      INTENT(IN   ) :: rdx,     &
                                                                rdy,     &
                                                                dt
   REAL , DIMENSION( kms:kme ) ,               INTENT(IN   ) :: rdn,     &
                                                                rdnw

   REAL , DIMENSION( ims:ime , kms:kme, jms:jme  ) ,              &
                                        INTENT(IN   ) :: ru_m,     &
                                                         rv_m,     &
                                                         ww_m
   REAL , DIMENSION( ims:ime , jms:jme  ) ,              &
                                        INTENT(IN   ) ::xlong, xlat

  real, dimension(1:config_flags%num_traj), intent(inout) :: traj_i,traj_j,traj_k
  real, dimension(1:config_flags%num_traj), intent(inout) :: traj_long,traj_lat
  real, dimension(ims:ime,kms:kme,jms:jme),intent(in) :: rdzw
  real, dimension(ims:ime,kms:kme,jms:jme)::u,v,w
  real, dimension(ims:ime,jms:jme),intent(in)::msft,msfu,msfv
  real, dimension(ims:ime,jms:jme),intent(in)::muu,muv,mut
  integer :: i_traj,j_traj,k_traj,tjk,k
  real :: traj_u,traj_v,traj_w
  real :: rdx_grid,rdy_grid,rdz_grid
  real :: deltx, delty, deltz,ax
  real :: const1
  real :: temp_i,temp_j
  integer :: i_u,j_v,k_w
  real :: u_a,u_b,u_c,u_d,v_a,v_b,v_c,v_d,w_a,w_b,w_c,w_d
  real :: d_a,d_b,d_c,d_d
  real :: u_temp_upper,u_temp_lower
  real :: v_temp_upper,v_temp_lower
  real :: w_temp_upper,w_temp_lower
  real :: eta_old, eta_new
  integer :: keta, keta_temp

  real:: known_lat, known_lon
  TYPE (grid_config_rec_type)                       :: config_flags_temp

  config_flags_temp = config_flags
  call trajmapproj(grid, config_flags_temp,proj)



   const1=1.0/2.0/sqrt(2.0)
do k=kms,kme
   u(:,k,:)=ru_m(:,k,:)/muu(:,:)*msfu(:,:)
   v(:,k,:)=rv_m(:,k,:)/muv(:,:)*msfv(:,:)
   w(:,k,:)=ww_m(:,k,:)/mut(:,:)*msft(:,:)
enddo
do tjk = 1,config_flags%num_traj
    eta_old = 0.0
    eta_new = 0.0
    keta=0
    keta_temp=0
    if (traj_i(tjk) .ne. -9999.0) then                                                         
      if ( ( proj%code .EQ. PROJ_LC           ) .OR. &
           ( proj%code .EQ. PROJ_PS           ) .OR. &
           ( proj%code .EQ. PROJ_PS_WGS84     ) .OR. &
           ( proj%code .EQ. PROJ_ALBERS_NAD83 ) .OR. &
           ( proj%code .EQ. PROJ_MERC         ) .OR. &
           ( proj%code .EQ. PROJ_LATLON       ) .OR. &
           ( proj%code .EQ. PROJ_CYL          ) .OR. &
           ( proj%code .EQ. PROJ_CASSINI      ) .OR. &
           ( proj%code .EQ. PROJ_GAUSS        ) .OR. &
           ( proj%code .EQ. PROJ_ROTLL        ) ) THEN
         call latlon_to_ij (proj, traj_lat(tjk),traj_long(tjk),traj_i(tjk),traj_j(tjk))
      end if
      i_traj=floor(traj_i(tjk)) 
      j_traj=floor(traj_j(tjk)) 
      k_traj=floor(traj_k(tjk)) 
       if ((i_traj .ge. its .and. i_traj .le. ite .and. i_traj .lt. ide) .and. &
           (j_traj .ge. jts .and. j_traj .le. jte .and. j_traj .lt. jde) .and. &
           (k_traj .le. kte .and. k_traj .lt. kde)) then


        if (traj_i(tjk)-real(floor(traj_i(tjk))) .ge. 0.5 ) then
          i_u=floor(traj_i(tjk)) + 1
        else
          i_u=floor(traj_i(tjk))
        endif

      if (k_traj .ge. 1 ) then
        u_a=u(i_u  ,k_traj,j_traj+1)
        u_b=u(i_u  ,k_traj,j_traj  )
        u_c=u(i_u+1,k_traj,j_traj  )
        u_d=u(i_u+1,k_traj,j_traj+1)
      else
        u_a=0.0
        u_b=0.0
        u_c=0.0
        u_d=0.0
      endif
        d_a=abs((real(i_u+1)-(traj_i(tjk)+0.5))*(real(j_traj  )-traj_j(tjk)))
        d_b=abs((real(i_u+1)-(traj_i(tjk)+0.5))*(real(j_traj+1)-traj_j(tjk)))
        d_c=abs((real(i_u  )-(traj_i(tjk)+0.5))*(real(j_traj+1)-traj_j(tjk)))
        d_d=abs((real(i_u  )-(traj_i(tjk)+0.5))*(real(j_traj  )-traj_j(tjk)))
        u_temp_lower=(u_a*d_a+u_b*d_b+u_c*d_c+u_d*d_d)/(d_a+d_b+d_c+d_d)


        u_a=u(i_u  ,k_traj+1,j_traj+1)
        u_b=u(i_u  ,k_traj+1,j_traj  )
        u_c=u(i_u+1,k_traj+1,j_traj  )
        u_d=u(i_u+1,k_traj+1,j_traj+1)
        d_a=abs((real(i_u+1)-(traj_i(tjk)+0.5))*(real(j_traj  )-traj_j(tjk)))
        d_b=abs((real(i_u+1)-(traj_i(tjk)+0.5))*(real(j_traj+1)-traj_j(tjk)))
        d_c=abs((real(i_u  )-(traj_i(tjk)+0.5))*(real(j_traj+1)-traj_j(tjk)))
        d_d=abs((real(i_u  )-(traj_i(tjk)+0.5))*(real(j_traj  )-traj_j(tjk)))
        u_temp_upper=(u_a*d_a+u_b*d_b+u_c*d_c+u_d*d_d)/(d_a+d_b+d_c+d_d)

        traj_u=u_temp_upper*abs(real(k_traj)-traj_k(tjk))+u_temp_lower*abs(real(k_traj+1)-traj_k(tjk))


        if (traj_j(tjk)-real(floor(traj_j(tjk))) .ge. 0.5 ) then
          j_v=floor(traj_j(tjk)) + 1
        else
          j_v=floor(traj_j(tjk))
        endif

      if (k_traj .ge. 1 ) then
        v_a=v(i_traj  ,k_traj,j_v+1)
        v_b=v(i_traj  ,k_traj,j_v  )
        v_c=v(i_traj+1,k_traj,j_v  )
        v_d=v(i_traj+1,k_traj,j_v+1)
      else
        v_a=0.0
        v_b=0.0
        v_c=0.0
        v_d=0.0
      endif
        d_a=abs((real(i_traj+1)-traj_i(tjk))*(real(j_v  )-(traj_j(tjk)+0.5)))
        d_b=abs((real(i_traj+1)-traj_i(tjk))*(real(j_v+1)-(traj_j(tjk)+0.5)))
        d_c=abs((real(i_traj  )-traj_i(tjk))*(real(j_v+1)-(traj_j(tjk)+0.5)))
        d_d=abs((real(i_traj  )-traj_i(tjk))*(real(j_v  )-(traj_j(tjk)+0.5)))
        v_temp_lower=(v_a*d_a+v_b*d_b+v_c*d_c+v_d*d_d)/(d_a+d_b+d_c+d_d)

        v_a=v(i_traj  ,k_traj+1,j_v+1)
        v_b=v(i_traj  ,k_traj+1,j_v  )
        v_c=v(i_traj+1,k_traj+1,j_v  )
        v_d=v(i_traj+1,k_traj+1,j_v+1)
        d_a=abs((real(i_traj+1)-traj_i(tjk))*(real(j_v  )-(traj_j(tjk)+0.5)))
        d_b=abs((real(i_traj+1)-traj_i(tjk))*(real(j_v+1)-(traj_j(tjk)+0.5)))
        d_c=abs((real(i_traj  )-traj_i(tjk))*(real(j_v+1)-(traj_j(tjk)+0.5)))
        d_d=abs((real(i_traj  )-traj_i(tjk))*(real(j_v  )-(traj_j(tjk)+0.5)))
        v_temp_upper=(v_a*d_a+v_b*d_b+v_c*d_c+v_d*d_d)/(d_a+d_b+d_c+d_d)

        traj_v=v_temp_upper*abs(real(k_traj)-traj_k(tjk))+v_temp_lower*abs(real(k_traj+1)-traj_k(tjk))



        if (traj_k(tjk)-real(floor(traj_k(tjk))) .ge. 0.5 ) then
          k_w=floor(traj_k(tjk)) + 1
        else
          k_w=floor(traj_k(tjk))
        endif

        if (k_w .ge. 1) then
          w_b=w(i_traj  ,k_w  ,j_traj)
          w_c=w(i_traj+1,k_w  ,j_traj)
        else
          w_b=0.0
          w_c=0.0
        endif
        w_a=w(i_traj  ,k_w+1,j_traj)
        w_d=w(i_traj+1,k_w+1,j_traj)
        d_a=abs((real(i_traj+1)-traj_i(tjk))*(real(k_w  )-(traj_k(tjk)+0.5)))
        d_b=abs((real(i_traj+1)-traj_i(tjk))*(real(k_w+1)-(traj_k(tjk)+0.5)))
        d_c=abs((real(i_traj  )-traj_i(tjk))*(real(k_w+1)-(traj_k(tjk)+0.5)))
        d_d=abs((real(i_traj  )-traj_i(tjk))*(real(k_w  )-(traj_k(tjk)+0.5)))
        w_temp_lower=(w_a*d_a+w_b*d_b+w_c*d_c+w_d*d_d)/(d_a+d_b+d_c+d_d)

        if (k_w .ge. 1) then
          w_b=w(i_traj  ,k_w  ,j_traj+1)
          w_c=w(i_traj+1,k_w  ,j_traj+1)
        else
          w_b=0.0
          w_c=0.0
        endif
        w_a=w(i_traj  ,k_w+1,j_traj+1)
        w_d=w(i_traj+1,k_w+1,j_traj+1)
        d_a=abs((real(i_traj+1)-traj_i(tjk))*(real(k_w  )-(traj_k(tjk)+0.5)))
        d_b=abs((real(i_traj+1)-traj_i(tjk))*(real(k_w+1)-(traj_k(tjk)+0.5)))
        d_c=abs((real(i_traj  )-traj_i(tjk))*(real(k_w+1)-(traj_k(tjk)+0.5)))
        d_d=abs((real(i_traj  )-traj_i(tjk))*(real(k_w  )-(traj_k(tjk)+0.5)))
        w_temp_upper=(w_a*d_a+w_b*d_b+w_c*d_c+w_d*d_d)/(d_a+d_b+d_c+d_d)

        traj_w=w_temp_upper*abs(real(j_traj)-traj_j(tjk))+w_temp_lower*abs(real(j_traj+1)-traj_j(tjk))

        eta_old=grid%znw(k_w+1)*abs(traj_k(tjk)+0.5-real(k_w))+grid%znw(k_w)*abs(traj_k(tjk)+0.5-real(k_w+1))

        rdx_grid=rdx*msft(i_traj,j_traj)
        rdy_grid=rdy*msft(i_traj,j_traj)
        rdz_grid=rdnw(k_traj)
        deltx=traj_u*DT
        delty=traj_v*DT
        deltz=traj_w*DT
        traj_i(tjk)=traj_i(tjk)+deltx*rdx_grid
        traj_j(tjk)=traj_j(tjk)+delty*rdy_grid
        eta_new=eta_old+deltz

        keta_temp = 0
        do keta=1, kme-1
          if (eta_new .le. grid%znw(keta) .and. eta_new .gt. grid%znw(keta+1)) then
           keta_temp=keta
          endif
        enddo
        if (keta_temp .eq. 0)  then
            traj_k(tjk) = traj_k(tjk)
        else
            traj_k(tjk) = (real(keta_temp)*abs(eta_new-grid%znw(keta_temp+1))+ &
                           real(keta_temp+1)*abs(eta_new-grid%znw(keta_temp))) &
                           /(grid%znw(keta_temp)-grid%znw(keta_temp+1))
            traj_k(tjk) = traj_k(tjk)-0.5
        endif

      if ( ( proj%code .EQ. PROJ_LC           ) .OR. &
           ( proj%code .EQ. PROJ_PS           ) .OR. &
           ( proj%code .EQ. PROJ_PS_WGS84     ) .OR. &
           ( proj%code .EQ. PROJ_ALBERS_NAD83 ) .OR. &
           ( proj%code .EQ. PROJ_MERC         ) .OR. &
           ( proj%code .EQ. PROJ_LATLON       ) .OR. &
           ( proj%code .EQ. PROJ_CYL          ) .OR. &
           ( proj%code .EQ. PROJ_CASSINI      ) .OR. &
           ( proj%code .EQ. PROJ_GAUSS        ) .OR. &
           ( proj%code .EQ. PROJ_ROTLL        ) ) THEN
         call ij_to_latlon (proj, traj_i(tjk), traj_j(tjk),traj_lat(tjk),traj_long(tjk))
      end if
     else
        traj_i(tjk) = -9999.0
        traj_j(tjk) = -9999.0
        traj_k(tjk) = -9999.0
        traj_long(tjk) = -9999.0
        traj_lat(tjk) = -9999.0
     endif
 endif
    traj_i(tjk) = wrf_dm_max_real(traj_i(tjk))
    traj_j(tjk) = wrf_dm_max_real(traj_j(tjk))
    traj_k(tjk) = wrf_dm_max_real(traj_k(tjk))
    traj_long(tjk) = wrf_dm_max_real(traj_long(tjk))
    traj_lat(tjk) = wrf_dm_max_real(traj_lat(tjk))
enddo                                                                                            


END SUBROUTINE trajectory




subroutine trajmapproj (grid,config_flags,ts_proj)




   IMPLICIT NONE


   
   TYPE (domain), INTENT(IN) :: grid
   TYPE (grid_config_rec_type) , INTENT(IN)  :: config_flags
   
   LOGICAL, EXTERNAL :: wrf_dm_on_monitor
   INTEGER, EXTERNAL :: get_unused_unit


   
   INTEGER :: ntsloc_temp
   INTEGER :: i, k, iunit
   REAL :: ts_rx, ts_ry, ts_xlat, ts_xlong, ts_hgt
   REAL :: known_lat, known_lon
   CHARACTER (LEN=132) :: message
   TYPE (PROJ_INFO), INTENT(out) :: ts_proj


   INTEGER :: ids, ide, jds, jde, kds, kde,        &
              ims, ime, jms, jme, kms, kme,        &
              ips, ipe, jps, jpe, kps, kpe,        &
              imsx, imex, jmsx, jmex, kmsx, kmex,  &
              ipsx, ipex, jpsx, jpex, kpsx, kpex,  &
              imsy, imey, jmsy, jmey, kmsy, kmey,  &
              ipsy, ipey, jpsy, jpey, kpsy, kpey
   TYPE (grid_config_rec_type)               :: config_flags_temp


   config_flags_temp = config_flags

     CALL get_ijk_from_grid ( grid ,                               &
                               ids, ide, jds, jde, kds, kde,        &
                               ims, ime, jms, jme, kms, kme,        &
                               ips, ipe, jps, jpe, kps, kpe,        &
                               imsx, imex, jmsx, jmex, kmsx, kmex,  &
                               ipsx, ipex, jpsx, jpex, kpsx, kpex,  &
                               imsy, imey, jmsy, jmey, kmsy, kmey,  &
                               ipsy, ipey, jpsy, jpey, kpsy, kpey )

     CALL model_to_grid_config_rec ( grid%id , model_config_rec , config_flags_temp )


      
      CALL map_init(ts_proj)


      IF (ips <= 1 .AND. 1 <= ipe .AND. &
          jps <= 1 .AND. 1 <= jpe) THEN
         known_lat = grid%xlat(1,1)
         known_lon = grid%xlong(1,1)
      ELSE
         known_lat = 9999.
         known_lon = 9999.
      END IF
      known_lat = wrf_dm_min_real(known_lat)
      known_lon = wrf_dm_min_real(known_lon)


      
      IF (config_flags%map_proj == PROJ_MERC) THEN
         CALL map_set(PROJ_MERC, ts_proj,               &
                      truelat1 = config_flags%truelat1, &
                      lat1     = known_lat,             &
                      lon1     = known_lon,             &
                      knowni   = 1.,                    &
                      knownj   = 1.,                    &
                      dx       = config_flags%dx)
      
      ELSE IF (config_flags%map_proj == PROJ_LC) THEN
      CALL map_set(PROJ_LC, ts_proj,                  &
                      truelat1 = config_flags%truelat1,  &
                      truelat2 = config_flags%truelat2,  &
                      stdlon   = config_flags%stand_lon, &
                      lat1     = known_lat,              &
                      lon1     = known_lon,              &
                      knowni   = 1.,                     &
                      knownj   = 1.,                     &
                      dx       = config_flags%dx)
      
      ELSE IF (config_flags%map_proj == PROJ_PS) THEN
         CALL map_set(PROJ_PS, ts_proj,                  &
                      truelat1 = config_flags%truelat1,  &
                      stdlon   = config_flags%stand_lon, &
                      lat1     = known_lat,              &
                      lon1     = known_lon,              &
                      knowni   = 1.,                     &
                      knownj   = 1.,                     &
                      dx       = config_flags%dx)


      
      ELSE IF (config_flags%map_proj == PROJ_CASSINI) THEN
         CALL map_set(PROJ_CASSINI, ts_proj,                            &
                      latinc   = grid%dy*360.0/(2.0*EARTH_RADIUS_M*PI), &
                      loninc   = grid%dx*360.0/(2.0*EARTH_RADIUS_M*PI), &
                      lat1     = known_lat,                             &
                      lon1     = known_lon,                             &


                      lat0     = 90.0,                                  &
                      lon0     = 0.0,                                   &
                      knowni   = 1.,                                    &
                      knownj   = 1.,                                    &
                      stdlon   = config_flags%stand_lon)


      
      ELSE IF (config_flags%map_proj == PROJ_ROTLL) THEN
         CALL map_set(PROJ_ROTLL, ts_proj,                      &

                      ixdim    = grid%e_we-1,                   &
                      jydim    = grid%e_sn-1,                   &
                      phi      = real(grid%e_sn-2)*grid%dy/2.0, &
                      lambda   = real(grid%e_we-2)*grid%dx,     &
                      lat1     = config_flags%cen_lat,          &
                      lon1     = config_flags%cen_lon,          &
                      latinc   = grid%dy,                       &
                      loninc   = grid%dx,                       &
                      stagger  = HH)


      END IF


end subroutine trajmapproj

END MODULE module_em
