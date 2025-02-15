





MODULE module_microphysics_zero_out
CONTAINS

SUBROUTINE microphysics_zero_outa (                                      &
                       moist_new , n_moist                               &
                      ,config_flags                                      &
                      ,ids,ide, jds,jde, kds,kde                         &
                      ,ims,ime, jms,jme, kms,kme                         &
                      ,its,ite, jts,jte, kts,kte                         )


   USE module_state_description
   USE module_configure
   USE module_wrf_error

   IMPLICIT NONE
   TYPE (grid_config_rec_type) , INTENT(IN)          :: config_flags
   INTEGER,      INTENT(IN   )    ::       ids,ide, jds,jde, kds,kde
   INTEGER,      INTENT(IN   )    ::       ims,ime, jms,jme, kms,kme
   INTEGER,      INTENT(IN   )    ::       its,ite, jts,jte, kts,kte

   INTEGER,      INTENT(IN   )    :: n_moist

   REAL, DIMENSION( ims:ime, kms:kme, jms:jme, n_moist ) :: moist_new



   INTEGER i,j,k,n


   

   IF ( config_flags%mp_zero_out .EQ. 0 ) THEN
      
   ELSE IF ( config_flags%mp_zero_out .EQ. 1 ) THEN
      
      
      CALL wrf_debug ( 100 , 'zero out small condensates, vapor not included')
      DO n = PARAM_FIRST_SCALAR,n_moist
         IF ( n .NE. P_QV ) THEN
            DO j = jts, jte
            DO k = kts, kte
            DO i = its, ite
               IF ( moist_new(i,k,j,n) .LT. config_flags%mp_zero_out_thresh )  moist_new(i,k,j,n) =0.
            ENDDO
            ENDDO
            ENDDO
         END IF
      ENDDO
   ELSE IF ( config_flags%mp_zero_out .EQ. 2 ) then
      
      
      CALL wrf_debug ( 100 , 'zero out small condensates, zero out negative vapor')
      DO n = PARAM_FIRST_SCALAR,n_moist
         IF ( n .NE. P_QV ) THEN
            DO j = jts, jte
            DO k = kts, kte
            DO i = its, ite
               IF ( moist_new(i,k,j,n) .LT. config_flags%mp_zero_out_thresh )  moist_new(i,k,j,n) =0.
            ENDDO
            ENDDO
            ENDDO
         ELSE IF ( n .EQ. P_QV ) THEN
            DO j = jts, jte
            DO k = kts, kte
            DO i = its, ite
               moist_new(i,k,j,n) = MAX ( moist_new(i,k,j,n) , 0. )
            ENDDO
            ENDDO
            ENDDO
         END IF
      ENDDO
   END IF
END SUBROUTINE microphysics_zero_outa

SUBROUTINE microphysics_zero_outb (                                      &
                       moist_new , n_moist                               &
                      ,config_flags                                      &
                      ,ids,ide, jds,jde, kds,kde                         &
                      ,ims,ime, jms,jme, kms,kme                         &
                      ,its,ite, jts,jte, kts,kte                         )


   USE module_state_description
   USE module_configure
   USE module_wrf_error

   IMPLICIT NONE
   TYPE (grid_config_rec_type) , INTENT(IN)          :: config_flags
   INTEGER,      INTENT(IN   )    ::       ids,ide, jds,jde, kds,kde
   INTEGER,      INTENT(IN   )    ::       ims,ime, jms,jme, kms,kme
   INTEGER,      INTENT(IN   )    ::       its,ite, jts,jte, kts,kte

   INTEGER,      INTENT(IN   )    :: n_moist

   REAL, DIMENSION( ims:ime, kms:kme, jms:jme, n_moist ) :: moist_new



   INTEGER i,j,k,n

   
   

   IF ( config_flags%mp_zero_out .NE. 0 ) THEN
      DO n = PARAM_FIRST_SCALAR,n_moist
         
         j = jds
         IF ( ( j .GE. jts ) .AND. ( j .LE. MIN( jte , jde-1) ) ) THEN
            DO k = kts, kte
            DO i = its , MIN ( ite , ide-1 )
               moist_new(i,k,j,n) = MAX ( moist_new(i,k,j,n) , 0. )
            ENDDO
            ENDDO
         END IF
         
         j = jde-1
         IF ( ( j .GE. jts ) .AND. ( j .LE. MIN( jte , jde-1) ) ) THEN
            DO k = kts, kte
            DO i = its , MIN ( ite , ide-1 )
               moist_new(i,k,j,n) = MAX ( moist_new(i,k,j,n) , 0. )
            ENDDO
            ENDDO
         END IF
         
         i = ids
         IF ( ( i .GE. its ) .AND. ( i .LE. MIN( ite , ide-1) ) ) THEN
            DO j = jts , MIN ( jte , jde-1 )
            DO k = kts, kte
               moist_new(i,k,j,n) = MAX ( moist_new(i,k,j,n) , 0. )
            ENDDO
            ENDDO
         END IF
         
         i = ide-1
         IF ( ( i .GE. its ) .AND. ( i .LE. MIN( ite , ide-1) ) ) THEN
            DO j = jts , MIN ( jte , jde-1 )
            DO k = kts, kte
               moist_new(i,k,j,n) = MAX ( moist_new(i,k,j,n) , 0. )
            ENDDO
            ENDDO
         END IF
      ENDDO
   END IF

   RETURN

   END SUBROUTINE microphysics_zero_outb

END MODULE module_microphysics_zero_out



