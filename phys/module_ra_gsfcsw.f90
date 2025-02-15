






MODULE module_ra_gsfcsw

   REAL,    PARAMETER, PRIVATE ::   thresh=1.e-9
   REAL,    SAVE               ::   center_lat



   REAL,    PARAMETER, PRIVATE ::   co2   = 300.e-6

CONTAINS

   SUBROUTINE GSFCSWRAD(rthraten,gsw                              & 
                   ,dz8w,rho_phy                                  &
                   ,alb,t3d,qv3d,qc3d,qr3d                        &
                   ,qi3d,qs3d,qg3d,qndrop3d                       &
                   ,p3d,p8w3d,pi3d,cldfra3d,rswtoa                &
                   ,cp,g,julday,solcon                            & 
                   ,taucldi,taucldc,warm_rain                     & 
                   ,tauaer300,tauaer400,tauaer600,tauaer999       & 
                   ,gaer300,gaer400,gaer600,gaer999               & 
                   ,waer300,waer400,waer600,waer999               & 
                   ,aer_ra_feedback                               &
                   ,f_qv,f_qc,f_qr,f_qi,f_qs,f_qg,f_qndrop        &
                   ,coszen                                        & 
                   ,ids,ide, jds,jde, kds,kde                     & 
                   ,ims,ime, jms,jme, kms,kme                     &
                   ,its,ite, jts,jte, kts,kte                     ) 

   IMPLICIT NONE

   INTEGER,    PARAMETER     ::        np    = 75

   INTEGER,    INTENT(IN   ) ::        ids,ide, jds,jde, kds,kde, &
                                       ims,ime, jms,jme, kms,kme, &
                                       its,ite, jts,jte, kts,kte
   LOGICAL,    INTENT(IN   ) ::        warm_rain

   INTEGER,    INTENT(IN  )  ::                           JULDAY  

   REAL, INTENT(IN    )      ::        SOLCON




   REAL, DIMENSION( ims:ime, kms:kme, jms:jme ),                  &
         INTENT(IN    ) ::                                   P3D, &
                                                           P8W3D, &
                                                            pi3D, &
                                                             T3D, &
                                                            dz8w, &
                                                         rho_phy, &
                                                        CLDFRA3D


   REAL, DIMENSION( ims:ime, kms:kme, jms:jme ),                  &
         INTENT(INOUT)  ::                              RTHRATEN
   REAL, DIMENSION( ims:ime, kms:kme, jms:jme ),                  &
         OPTIONAL,                                                &
         INTENT(INOUT)  ::                               taucldi, &
                                                         taucldc

   REAL, DIMENSION( ims:ime, jms:jme ),                           &
         INTENT(IN   )  ::                                   ALB





   REAL, DIMENSION( ims:ime, jms:jme ),                           &
         INTENT(INOUT)  ::                                   GSW, &
                                                          RSWTOA



   REAL, INTENT(IN   )  ::                              CP,G





   REAL, DIMENSION( ims:ime, kms:kme, jms:jme ), OPTIONAL ,       &
         INTENT(IN    ) :: tauaer300,tauaer400,tauaer600,tauaer999, & 
                                 gaer300,gaer400,gaer600,gaer999, & 
                                 waer300,waer400,waer600,waer999    

   INTEGER,    INTENT(IN  ), OPTIONAL   ::       aer_ra_feedback

   REAL, DIMENSION( ims:ime, kms:kme, jms:jme ),                  &
         OPTIONAL,                                                &           
         INTENT(IN    ) ::                                        &
                                                            QV3D, &
                                                            QC3D, &
                                                            QR3D, &
                                                            QI3D, &
                                                            QS3D, &
                                                            QG3D, &
                                                        QNDROP3D

   LOGICAL, OPTIONAL, INTENT(IN ) ::    &
                                   F_QV,F_QC,F_QR,F_QI,F_QS,F_QG, &
                                                        F_QNDROP



   REAL, DIMENSION( ims:ime, jms:jme), INTENT(IN) :: COSZEN


 
   REAL, DIMENSION( its:ite ) ::                                  &
                                                              ts, &
                                                            cosz, &
                                                              fp, &
                                                          rsuvbm, &
                                                          rsuvdf, &
                                                          rsirbm, &
                                                          rsirdf, &
                                                            p400, &
                                                            p700

   INTEGER, DIMENSION( its:ite ) ::                               &
                                                             ict, &
                                                             icb   

   REAL, DIMENSION( its:ite, kts-1:kte, 2 ) ::            taucld

   REAL, DIMENSION( its:ite, kts-1:kte+1 )  ::               flx, &
                                                            flxd

   REAL, DIMENSION( its:ite, kts-1:kte ) ::                     O3

   REAL, DIMENSION( its:ite, kts-1:kte, 11 ) ::                   &
                                                           taual, &
                                                           ssaal, &
                                                           asyal

   REAL, DIMENSION( its:ite, kts-1:kte, 2 ) ::                    &
                                                            reff, &    
                                                             cwc    
   REAL, DIMENSION( its: ite, kts-1:kte+1 ) ::                    &
                                                           P8W2D
   REAL, DIMENSION( its: ite, kts-1:kte ) ::                      &
                                                          TTEN2D, &
                                                        qndrop2d, &
                                                            SH2D, &
                                                             P2D, &
                                                             T2D, &
                                                          fcld2D

   REAL, DIMENSION( np, 5 ) ::                              pres, &
                                                           ozone
   REAL, DIMENSION( np )    ::                                 p

   LOGICAL :: cldwater,overcast, predicate

   INTEGER :: i,j,K,NK,ib,kk,mix,mkx








   INTEGER  ::                                             iprof, &
                                                       is_summer, &
                                                       ie_summer, &
                                                          lattmp





   REAL    :: fac,latrmp



   real, dimension(11) :: midbands  
   data midbands/.2,.235,.27,.2875,.3025,.305,.3625,.55,1.92,1.745,6.135/   
   real :: ang,slope 
   character(len=200) :: msg 
   real pi, third, relconst, lwpmin, rhoh2o






      data (pres(i,1),i=1,np)/ &
          0.0006244,   0.0008759,   0.0012286,   0.0017234,   0.0024174, &
          0.0033909,   0.0047565,   0.0066720,   0.0093589,   0.0131278, &
          0.0184145,   0.0258302,   0.0362323,   0.0508234,   0.0712906, &
          0.1000000,   0.1402710,   0.1967600,   0.2759970,   0.3871430, &
          0.5430,    0.7617,    1.0685,    1.4988,    2.1024,    2.9490, &
          4.1366,    5.8025,    8.1392,   11.4170,   16.0147,   22.4640, &
         31.5105,   44.2001,   62.0000,   85.7750,  109.5500,  133.3250, &
        157.1000,  180.8750,  204.6500,  228.4250,  252.2000,  275.9750, &
        299.7500,  323.5250,  347.3000,  371.0750,  394.8500,  418.6250, &
        442.4000,  466.1750,  489.9500,  513.7250,  537.5000,  561.2750, &
        585.0500,  608.8250,  632.6000,  656.3750,  680.1500,  703.9250, &
        727.7000,  751.4750,  775.2500,  799.0250,  822.8000,  846.5750, &
        870.3500,  894.1250,  917.9000,  941.6750,  965.4500,  989.2250, &
       1013.0000/

      data (ozone(i,1),i=1,np)/ &
        0.1793E-06,  0.2228E-06,  0.2665E-06,  0.3104E-06,  0.3545E-06, &
        0.3989E-06,  0.4435E-06,  0.4883E-06,  0.5333E-06,  0.5786E-06, &
        0.6241E-06,  0.6698E-06,  0.7157E-06,  0.7622E-06,  0.8557E-06, &
        0.1150E-05,  0.1462E-05,  0.1793E-05,  0.2143E-05,  0.2512E-05, &
        0.2902E-05,  0.3313E-05,  0.4016E-05,  0.5193E-05,  0.6698E-05, &
        0.8483E-05,  0.9378E-05,  0.9792E-05,  0.1002E-04,  0.1014E-04, &
        0.9312E-05,  0.7834E-05,  0.6448E-05,  0.5159E-05,  0.3390E-05, &
        0.1937E-05,  0.1205E-05,  0.8778E-06,  0.6935E-06,  0.5112E-06, &
        0.3877E-06,  0.3262E-06,  0.2770E-06,  0.2266E-06,  0.2020E-06, &
        0.1845E-06,  0.1679E-06,  0.1519E-06,  0.1415E-06,  0.1317E-06, &
        0.1225E-06,  0.1137E-06,  0.1055E-06,  0.1001E-06,  0.9487E-07, &
        0.9016E-07,  0.8641E-07,  0.8276E-07,  0.7930E-07,  0.7635E-07, &
        0.7347E-07,  0.7065E-07,  0.6821E-07,  0.6593E-07,  0.6368E-07, &
        0.6148E-07,  0.5998E-07,  0.5859E-07,  0.5720E-07,  0.5582E-07, &
        0.5457E-07,  0.5339E-07,  0.5224E-07,  0.5110E-07,  0.4999E-07/






      data (pres(i,2),i=1,np)/ &
          0.0006244,   0.0008759,   0.0012286,   0.0017234,   0.0024174, &
          0.0033909,   0.0047565,   0.0066720,   0.0093589,   0.0131278, &
          0.0184145,   0.0258302,   0.0362323,   0.0508234,   0.0712906, &
          0.1000000,   0.1402710,   0.1967600,   0.2759970,   0.3871430, &
          0.5430,    0.7617,    1.0685,    1.4988,    2.1024,    2.9490, &
          4.1366,    5.8025,    8.1392,   11.4170,   16.0147,   22.4640, &
         31.5105,   44.2001,   62.0000,   85.9000,  109.8000,  133.7000, &
        157.6000,  181.5000,  205.4000,  229.3000,  253.2000,  277.1000, &
        301.0000,  324.9000,  348.8000,  372.7000,  396.6000,  420.5000, &
        444.4000,  468.3000,  492.2000,  516.1000,  540.0000,  563.9000, &
        587.8000,  611.7000,  635.6000,  659.5000,  683.4000,  707.3000, &
        731.2000,  755.1000,  779.0000,  802.9000,  826.8000,  850.7000, &
        874.6000,  898.5000,  922.4000,  946.3000,  970.2000,  994.1000, &
       1018.0000/

      data (ozone(i,2),i=1,np)/ &
        0.2353E-06,  0.3054E-06,  0.3771E-06,  0.4498E-06,  0.5236E-06, &
        0.5984E-06,  0.6742E-06,  0.7511E-06,  0.8290E-06,  0.9080E-06, &
        0.9881E-06,  0.1069E-05,  0.1152E-05,  0.1319E-05,  0.1725E-05, &
        0.2145E-05,  0.2581E-05,  0.3031E-05,  0.3497E-05,  0.3980E-05, &
        0.4478E-05,  0.5300E-05,  0.6725E-05,  0.8415E-05,  0.1035E-04, &
        0.1141E-04,  0.1155E-04,  0.1143E-04,  0.1093E-04,  0.1060E-04, &
        0.9720E-05,  0.8849E-05,  0.7424E-05,  0.6023E-05,  0.4310E-05, &
        0.2820E-05,  0.1990E-05,  0.1518E-05,  0.1206E-05,  0.9370E-06, &
        0.7177E-06,  0.5450E-06,  0.4131E-06,  0.3277E-06,  0.2563E-06, &
        0.2120E-06,  0.1711E-06,  0.1524E-06,  0.1344E-06,  0.1199E-06, &
        0.1066E-06,  0.9516E-07,  0.8858E-07,  0.8219E-07,  0.7598E-07, &
        0.6992E-07,  0.6403E-07,  0.5887E-07,  0.5712E-07,  0.5540E-07, &
        0.5370E-07,  0.5214E-07,  0.5069E-07,  0.4926E-07,  0.4785E-07, &
        0.4713E-07,  0.4694E-07,  0.4676E-07,  0.4658E-07,  0.4641E-07, &
        0.4634E-07,  0.4627E-07,  0.4619E-07,  0.4612E-07,  0.4605E-07/







      data (pres(i,3),i=1,np)/ &
          0.0006244,   0.0008759,   0.0012286,   0.0017234,   0.0024174, &
          0.0033909,   0.0047565,   0.0066720,   0.0093589,   0.0131278, &
          0.0184145,   0.0258302,   0.0362323,   0.0508234,   0.0712906, &
          0.1000000,   0.1402710,   0.1967600,   0.2759970,   0.3871430, &
          0.5430,    0.7617,    1.0685,    1.4988,    2.1024,    2.9490, &
          4.1366,    5.8025,    8.1392,   11.4170,   16.0147,   22.4640, &
         31.5105,   44.2001,   62.0000,   85.7000,  109.4000,  133.1000, &
        156.8000,  180.5000,  204.2000,  227.9000,  251.6000,  275.3000, &
        299.0000,  322.7000,  346.4000,  370.1000,  393.8000,  417.5000, &
        441.2000,  464.9000,  488.6000,  512.3000,  536.0000,  559.7000, &
        583.4000,  607.1000,  630.8000,  654.5000,  678.2000,  701.9000, &
        725.6000,  749.3000,  773.0000,  796.7000,  820.4000,  844.1000, &
        867.8000,  891.5000,  915.2000,  938.9000,  962.6000,  986.3000, &
       1010.0000/

      data (ozone(i,3),i=1,np)/ &
        0.1728E-06,  0.2131E-06,  0.2537E-06,  0.2944E-06,  0.3353E-06, &
        0.3764E-06,  0.4176E-06,  0.4590E-06,  0.5006E-06,  0.5423E-06, &
        0.5842E-06,  0.6263E-06,  0.6685E-06,  0.7112E-06,  0.7631E-06, &
        0.1040E-05,  0.1340E-05,  0.1660E-05,  0.2001E-05,  0.2362E-05, &
        0.2746E-05,  0.3153E-05,  0.3762E-05,  0.4988E-05,  0.6518E-05, &
        0.8352E-05,  0.9328E-05,  0.9731E-05,  0.8985E-05,  0.7632E-05, &
        0.6814E-05,  0.6384E-05,  0.5718E-05,  0.4728E-05,  0.4136E-05, &
        0.3033E-05,  0.2000E-05,  0.1486E-05,  0.1121E-05,  0.8680E-06, &
        0.6474E-06,  0.5164E-06,  0.3921E-06,  0.2996E-06,  0.2562E-06, &
        0.2139E-06,  0.1723E-06,  0.1460E-06,  0.1360E-06,  0.1267E-06, &
        0.1189E-06,  0.1114E-06,  0.1040E-06,  0.9678E-07,  0.8969E-07, &
        0.8468E-07,  0.8025E-07,  0.7590E-07,  0.7250E-07,  0.6969E-07, &
        0.6694E-07,  0.6429E-07,  0.6208E-07,  0.5991E-07,  0.5778E-07, &
        0.5575E-07,  0.5403E-07,  0.5233E-07,  0.5067E-07,  0.4904E-07, &
        0.4721E-07,  0.4535E-07,  0.4353E-07,  0.4173E-07,  0.3997E-07/







      data (pres(i,4),i=1,np)/ &
          0.0006244,   0.0008759,   0.0012286,   0.0017234,   0.0024174, &
          0.0033909,   0.0047565,   0.0066720,   0.0093589,   0.0131278, &
          0.0184145,   0.0258302,   0.0362323,   0.0508234,   0.0712906, &
          0.1000000,   0.1402710,   0.1967600,   0.2759970,   0.3871430, &
          0.5430,    0.7617,    1.0685,    1.4988,    2.1024,    2.9490, &
          4.1366,    5.8025,    8.1392,   11.4170,   16.0147,   22.4640, &
         31.5105,   44.2001,   62.0000,   85.7750,  109.5500,  133.3250, &
        157.1000,  180.8750,  204.6500,  228.4250,  252.2000,  275.9750, &
        299.7500,  323.5250,  347.3000,  371.0750,  394.8500,  418.6250, &
        442.4000,  466.1750,  489.9500,  513.7250,  537.5000,  561.2750, &
        585.0500,  608.8250,  632.6000,  656.3750,  680.1500,  703.9250, &
        727.7000,  751.4750,  775.2500,  799.0250,  822.8000,  846.5750, &
        870.3500,  894.1250,  917.9000,  941.6750,  965.4500,  989.2250, &
       1013.0000/

      data (ozone(i,4),i=1,np)/ &
        0.2683E-06,  0.3562E-06,  0.4464E-06,  0.5387E-06,  0.6333E-06, &
        0.7301E-06,  0.8291E-06,  0.9306E-06,  0.1034E-05,  0.1140E-05, &
        0.1249E-05,  0.1360E-05,  0.1474E-05,  0.1855E-05,  0.2357E-05, &
        0.2866E-05,  0.3383E-05,  0.3906E-05,  0.4437E-05,  0.4975E-05, &
        0.5513E-05,  0.6815E-05,  0.8157E-05,  0.1008E-04,  0.1200E-04, &
        0.1242E-04,  0.1250E-04,  0.1157E-04,  0.1010E-04,  0.9063E-05, &
        0.8836E-05,  0.8632E-05,  0.8391E-05,  0.7224E-05,  0.6054E-05, &
        0.4503E-05,  0.3204E-05,  0.2278E-05,  0.1833E-05,  0.1433E-05, &
        0.9996E-06,  0.7440E-06,  0.5471E-06,  0.3944E-06,  0.2852E-06, &
        0.1977E-06,  0.1559E-06,  0.1333E-06,  0.1126E-06,  0.9441E-07, &
        0.7678E-07,  0.7054E-07,  0.6684E-07,  0.6323E-07,  0.6028E-07, &
        0.5746E-07,  0.5468E-07,  0.5227E-07,  0.5006E-07,  0.4789E-07, &
        0.4576E-07,  0.4402E-07,  0.4230E-07,  0.4062E-07,  0.3897E-07, &
        0.3793E-07,  0.3697E-07,  0.3602E-07,  0.3506E-07,  0.3413E-07, &
        0.3326E-07,  0.3239E-07,  0.3153E-07,  0.3069E-07,  0.2987E-07/ 






      data (pres(i,5),i=1,np)/ &
          0.0006244,   0.0008759,   0.0012286,   0.0017234,   0.0024174, &
          0.0033909,   0.0047565,   0.0066720,   0.0093589,   0.0131278, &
          0.0184145,   0.0258302,   0.0362323,   0.0508234,   0.0712906, &
          0.1000000,   0.1402710,   0.1967600,   0.2759970,   0.3871430, &
          0.5430,    0.7617,    1.0685,    1.4988,    2.1024,    2.9490, &
          4.1366,    5.8025,    8.1392,   11.4170,   16.0147,   22.4640, &
         31.5105,   44.2001,   62.0000,   85.7750,  109.5500,  133.3250, &
        157.1000,  180.8750,  204.6500,  228.4250,  252.2000,  275.9750, &
        299.7500,  323.5250,  347.3000,  371.0750,  394.8500,  418.6250, &
        442.4000,  466.1750,  489.9500,  513.7250,  537.5000,  561.2750, &
        585.0500,  608.8250,  632.6000,  656.3750,  680.1500,  703.9250, &
        727.7000,  751.4750,  775.2500,  799.0250,  822.8000,  846.5750, &
        870.3500,  894.1250,  917.9000,  941.6750,  965.4500,  989.2250, &
       1013.0000/

      data (ozone(i,5),i=1,np)/ &
        0.1993E-06,  0.2521E-06,  0.3051E-06,  0.3585E-06,  0.4121E-06, &
        0.4661E-06,  0.5203E-06,  0.5748E-06,  0.6296E-06,  0.6847E-06, &
        0.7402E-06,  0.7959E-06,  0.8519E-06,  0.9096E-06,  0.1125E-05, &
        0.1450E-05,  0.1794E-05,  0.2156E-05,  0.2538E-05,  0.2939E-05, &
        0.3362E-05,  0.3785E-05,  0.4753E-05,  0.6005E-05,  0.7804E-05, &
        0.9635E-05,  0.1023E-04,  0.1067E-04,  0.1177E-04,  0.1290E-04, &
        0.1134E-04,  0.9223E-05,  0.6667E-05,  0.3644E-05,  0.1545E-05, &
        0.5355E-06,  0.2523E-06,  0.2062E-06,  0.1734E-06,  0.1548E-06, &
        0.1360E-06,  0.1204E-06,  0.1074E-06,  0.9707E-07,  0.8960E-07, &
        0.8419E-07,  0.7962E-07,  0.7542E-07,  0.7290E-07,  0.7109E-07, &
        0.6940E-07,  0.6786E-07,  0.6635E-07,  0.6500E-07,  0.6370E-07, &
        0.6244E-07,  0.6132E-07,  0.6022E-07,  0.5914E-07,  0.5884E-07, &
        0.5855E-07,  0.5823E-07,  0.5772E-07,  0.5703E-07,  0.5635E-07, &
        0.5570E-07,  0.5492E-07,  0.5412E-07,  0.5335E-07,  0.5260E-07, &
        0.5167E-07,  0.5063E-07,  0.4961E-07,  0.4860E-07,  0.4761E-07/



   cldwater = .true.
   overcast = .false.

   mix=ite-its+1 
   mkx=kte-kts+1 

   is_summer=80
   ie_summer=265








   IF (abs(center_lat) .le. 30. ) THEN 
      iprof = 5
   ELSE
      IF (center_lat .gt.  0.) THEN
         IF (center_lat .gt. 60. ) THEN 
            IF (JULDAY .gt. is_summer .and. JULDAY .lt. ie_summer ) THEN
               
               iprof = 3
            ELSE
               
               iprof = 4
            ENDIF
         ELSE        
            IF (JULDAY .gt. is_summer .and. JULDAY .lt. ie_summer ) THEN
               
               iprof = 1
            ELSE
               
               iprof = 2
            ENDIF
         ENDIF

      ELSE
         IF (center_lat .lt. -60. ) THEN 
            IF (JULDAY .lt. is_summer .or. JULDAY .gt. ie_summer ) THEN
               
               iprof = 3
            ELSE
               
               iprof = 4
            ENDIF
         ELSE        
            IF (JULDAY .lt. is_summer .or. JULDAY .gt. ie_summer ) THEN
               
               iprof = 1
            ELSE
               
               iprof = 2
            ENDIF
         ENDIF

      ENDIF
   ENDIF


   j_loop: DO J=jts,jte

      DO K=kts,kte          
      DO I=its,ite          
         cwc(i,k,1) = 0.
         cwc(i,k,2) = 0.
      ENDDO
      ENDDO

      DO K=1,np
         p(k)=pres(k,iprof)
      ENDDO



      DO K=kts,kte+1
      DO I=its,ite
         NK=kme-K+kms
         P8W2D(I,K)=p8w3d(i,nk,j)*0.01   
      ENDDO
      ENDDO

      DO I=its,ite
         P8W2D(I,0)=.0
      ENDDO

      DO K=kts,kte
      DO I=its,ite
         NK=kme-1-K+kms
         TTEN2D(I,K)=0.
         T2D(I,K)=T3D(I,NK,J)


         SH2D(I,K)=QV3D(I,NK,J)/(1.+QV3D(I,NK,J))
         SH2D(I,K)=max(0.,SH2D(I,K))
         cwc(I,K,2)=QC3D(I,NK,J)
         cwc(I,K,2)=max(0.,cwc(I,K,2))

         P2D(I,K)=p3d(i,nk,j)*0.01      
         fcld2D(I,K)=CLDFRA3D(I,NK,J)
      ENDDO
      ENDDO





      IF ( PRESENT ( F_QI ) ) THEN
         predicate = F_QI
      ELSE
        predicate = .FALSE.
      ENDIF

      IF (.NOT. warm_rain .AND. .NOT. predicate ) THEN
         DO K=kts,kte
         DO I=its,ite
            IF (T2D(I,K) .lt. 273.15) THEN
               cwc(I,K,1)=cwc(I,K,2)
               cwc(I,K,2)=0.
            ENDIF
         ENDDO
         ENDDO
      ENDIF

       IF ( PRESENT( F_QNDROP ) ) THEN
         IF ( F_QNDROP ) THEN
            DO K=kts,kte
               DO I=its,ite
                  NK=kme-1-K+kms
                  qndrop2d(I,K)=qndrop3d(I,NK,j)
               ENDDO
            ENDDO
            qndrop2d(:,kts-1)=0.
         END IF
      END IF

     DO I=its,ite
         TTEN2D(I,0)=0.
         T2D(I,0)=T2D(I,1)

         SH2D(I,0)=0.5*SH2D(i,1)
         cwc(I,0,2)=0.
         cwc(I,0,1)=0.
         P2D(I,0)=0.5*(P8W2D(I,0)+P8W2D(I,1))
         fcld2D(I,0)=0.
      ENDDO

      IF ( PRESENT( F_QI ) .AND. PRESENT( qi3d)  ) THEN
	 IF ( (F_QI) ) THEN
            DO K=kts,kte          
            DO I=its,ite          
               NK=kme-1-K+kms
               cwc(I,K,1)=QI3D(I,NK,J)
               cwc(I,K,1)=max(0.,cwc(I,K,1))
            ENDDO
            ENDDO
         ENDIF
      ENDIF



      call o3prof (np, p, ozone(1,iprof), its, ite, kts-1, kte, P2D, O3)



      pi = 4.*atan(1.0)
      third=1./3.
      rhoh2o=1.e3
      relconst=3/(4.*pi*rhoh2o)


      lwpmin=3.e-5
      do k = kts-1, kte
      do i = its, ite
         reff(i,k,2) = 10.
         if( PRESENT( F_QNDROP ) ) then
            if( F_QNDROP ) then
              if ( cwc(i,k,2)*(P8W2D(I,K+1)-P8W2D(I,K)).gt.lwpmin.and. &
                   qndrop2d(i,k).gt.1000. ) then
               reff(i,k,2)=(relconst*cwc(i,k,2)/qndrop2d(i,k))**third 

               reff(i,k,2)=1.1*reff(i,k,2)
               reff(i,k,2)=reff(i,k,2)*1.e6 
               reff(i,k,2)=max(reff(i,k,2),4.)
               reff(i,k,2)=min(reff(i,k,2),20.)
              end if
            end if
         end if
         reff(i,k,1) = 80.
      end do
      end do



      do i = its, ite
         p400(i) = 1.e5
         p700(i) = 1.e5
      enddo

      do k = kts-1,kte+1
         do i = its, ite
            if (abs(P8W2D(i,k) - 400.) .lt. p400(i)) then
               p400(i) = abs(P8W2D(i,k) - 400.)
               ict(i) = k
            endif
            if (abs(P8W2D(i,k) - 700.) .lt. p700(i)) then
               p700(i) = abs(P8W2D(i,k) - 700.)
               icb(i) = k
            endif
        end do
      end do




      do ib = 1, 11
      do k = kts-1,kte
      do i = its,ite
         taual(i,k,ib) = 0.
         ssaal(i,k,ib) = 0.
         asyal(i,k,ib) = 0.
      end do
      end do
      end do




      do ib = 1, 2
      do k = kts-1, kte
      do i = its, ite
         taucld(i,k,ib) = 0.
      end do
      end do
      end do

      do k = kts-1,kte+1
      do i = its,ite
         flx(i,k)   = 0.
         flxd(i,k)  = 0.
      end do
      end do



      do i = its,ite

         cosz(i)=coszen(i,j)






        rsuvbm(i) = ALB(i,j)
        rsuvdf(i) = ALB(i,j)
        rsirbm(i) = ALB(i,j)
        rsirdf(i) = ALB(i,j)
      end do
                                  
      call sorad (mix,1,1,mkx+1,p8w2D,t2D,sh2D,o3,                 &
                  overcast,cldwater,cwc,taucld,reff,fcld2D,ict,icb,&
                  taual,ssaal,asyal,                               &
                  cosz,rsuvbm,rsuvdf,rsirbm,rsirdf,                &
                  flx,flxd)



      do k = kts, kte
      do i = its, ite
         nk=kme-1-k+kms
         if(present(taucldc)) taucldc(i,nk,j)=taucld(i,k,2)
         if(present(taucldi)) taucldi(i,nk,j)=taucld(i,k,1)
      enddo
      enddo
 
      do k = kts, kte+1
        do i = its, ite
          if (cosz(i) .lt. thresh) then
            flx(i,k) = 0.
          else
            flx(i,k) = flx(i,k) * SOLCON * cosz(i)
          endif
        end do
      end do



      fac = .01 * g / Cp
      do k = kts, kte
      do i = its, ite
         if (cosz(i) .gt. thresh) then
             TTEN2D(i,k) = - fac * (flx(i,k) - flx(i,k+1))/ &
                           (p8w2d(i,k)-p8w2d(i,k+1))
         endif
      end do
      end do


      do i = its, ite
        if (cosz(i) .le. thresh) then
          RSWTOA(i,j) = 0.
        else
          RSWTOA(i,j) = flx(i,kts) - flxd(i,kts) * SOLCON * cosz(i)
        endif
      end do



      do i = its, ite
        if (cosz(i) .le. thresh) then
          GSW(i,j) = 0.
        else
          GSW(i,j) = (1. - rsuvbm(i)) * flxd(i,kte+1) * SOLCON * cosz(i)
        endif
      end do

      DO K=kts,kte          
         NK=kme-1-K+kms
         DO I=its,ite

            TTEN2D(I,NK)=MAX(TTEN2D(I,NK),0.)
            RTHRATEN(I,K,J)=RTHRATEN(I,K,J)+TTEN2D(I,NK)/pi3D(I,K,J)
         ENDDO
      ENDDO

   ENDDO j_loop                                          

   END SUBROUTINE GSFCSWRAD



      subroutine sorad (m,n,ndim,np,pl,ta,wa,oa,                        &
                        overcast,cldwater,cwc,taucld,reff,fcld,ict,icb, &
                        taual,ssaal,asyal,                              &
                        cosz,rsuvbm,rsuvdf,rsirbm,rsirdf,               &
                        flx,flxd)


























































































































































      implicit none




      integer m,n,ndim,np
      integer ict(m,ndim),icb(m,ndim)
      real pl(m,ndim,np+1),ta(m,ndim,np),wa(m,ndim,np),oa(m,ndim,np)
      real cwc(m,ndim,np,2),taucld(m,ndim,np,2),reff(m,ndim,np,2), &
             fcld(m,ndim,np)
      real taual(m,ndim,np,11),ssaal(m,ndim,np,11),asyal(m,ndim,np,11)
      real cosz(m,ndim),rsuvbm(m,ndim),rsuvdf(m,ndim), &
             rsirbm(m,ndim),rsirdf(m,ndim)           
      logical overcast,cldwater



      real flx(m,ndim,np+1),flc(m,ndim,np+1)
      real flxu(m,ndim,np+1),flxd(m,ndim,np+1)
      real fdiruv (m,ndim),fdifuv (m,ndim)
      real fdirpar(m,ndim),fdifpar(m,ndim)
      real fdirir (m,ndim),fdifir (m,ndim)


 
      integer i,j,k
      real cwp(m,n,np,2)
      real dp(m,n,np),wh(m,n,np),oh(m,n,np),scal(m,n,np)
      real swh(m,n,np+1),so2(m,n,np+1),df(m,n,np+1)
      real sdf(m,n),sclr(m,n),csm(m,n),x
 
      do j= 1, n 
       do i= 1, m 
          if (pl(i,j,1) .eq. 0.0) then
              pl(i,j,1)=1.0e-4
          endif
       enddo
      enddo

      do j= 1, n 
       do i= 1, m 

         swh(i,j,1)=0. 
         so2(i,j,1)=0. 



 
         csm(i,j)=35./sqrt(1224.*cosz(i,j)*cosz(i,j)+1.)

       enddo 
      enddo

      do k= 1, np
       do j= 1, n
         do i= 1, m




 
          dp(i,j,k)=pl(i,j,k+1)-pl(i,j,k)
          scal(i,j,k)=dp(i,j,k)*(.5*(pl(i,j,k)+pl(i,j,k+1))/300.)**.8
 




          wh(i,j,k)=1.02*wa(i,j,k)*scal(i,j,k)* &
                    (1.+0.00135*(ta(i,j,k)-240.)) +1.e-11
          swh(i,j,k+1)=swh(i,j,k)+wh(i,j,k)



 
          oh(i,j,k)=1.02*oa(i,j,k)*dp(i,j,k)*466.7 +1.e-11




          cwp(i,j,k,1)=1.02*10000.*cwc(i,j,k,1)*dp(i,j,k)
          cwp(i,j,k,2)=1.02*10000.*cwc(i,j,k,2)*dp(i,j,k)

        enddo
       enddo
      enddo




      do k=1, np+1
       do j=1, n
        do i=1, m
          flx(i,j,k)=0.
          flc(i,j,k)=0.
          flxu(i,j,k)=0.
          flxd(i,j,k)=0.
          df(i,j,k)=0.
        enddo
       enddo
      enddo



      call soluv (m,n,ndim,np,oh,dp,overcast,cldwater,  &
                  cwp,taucld,reff,ict,icb,fcld,cosz,    &
                  taual,ssaal,asyal,csm,rsuvbm,rsuvdf,  &
                  flx,flc,flxu,flxd,fdiruv,fdifuv,fdirpar,fdifpar)



      call solir (m,n,ndim,np,wh,overcast,cldwater,     &
                  cwp,taucld,reff,ict,icb,fcld,cosz,    &
                  taual,ssaal,asyal,csm,rsirbm,rsirdf,  &
                  flx,flc,flxu,flxd,fdirir,fdifir)



      do k= 1, np
       do j= 1, n
        do i= 1, m
          so2(i,j,k+1)=so2(i,j,k)+165.22*scal(i,j,k)
        enddo
       enddo
      enddo





       do k= 2, np+1
        do j= 1, n
         do i= 1, m
           x=so2(i,j,k)*csm(i,j)
           df(i,j,k)=df(i,j,k)+0.0287*(1.-exp(-0.00027*sqrt(x)))
         enddo
        enddo
       enddo          



      do k= 1, np
       do j= 1, n
        do i= 1, m
         so2(i,j,k+1)=so2(i,j,k)+co2*789.*scal(i,j,k)+1.e-11
        enddo
       enddo
      enddo




      call flxco2(m,n,np,so2,swh,csm,df)



      do k= 2, np+1
       do j= 1, n
        do i= 1, m
          flc(i,j,k)=flc(i,j,k)-df(i,j,k)
        enddo
       enddo
      enddo





      do j=1,n
       do i=1,m
        sdf(i,j)=0.0
        sclr(i,j)=1.0
       enddo
      enddo

      do k=1,np
       do j=1,n
        do i=1,m




         if(fcld(i,j,k).gt.0.01) then
          sdf(i,j)=sdf(i,j)+df(i,j,k)*sclr(i,j)*fcld(i,j,k)
          sclr(i,j)=sclr(i,j)*(1.-fcld(i,j,k))
         endif
          flx(i,j,k+1)=flx(i,j,k+1)-sdf(i,j)-df(i,j,k+1)*sclr(i,j)
          flxu(i,j,k+1)=flxu(i,j,k+1)-sdf(i,j)-df(i,j,k+1)*sclr(i,j)
          flxd(i,j,k+1)=flxd(i,j,k+1)-sdf(i,j)-df(i,j,k+1)*sclr(i,j) 

        enddo
       enddo
      enddo



      do j= 1, n
       do i= 1, m
        flc(i,j,np+1)=flc(i,j,np+1)+df(i,j,np+1)*rsirbm(i,j)
        flx(i,j,np+1)=flx(i,j,np+1)+(sdf(i,j)+ &
                         df(i,j,np+1)*sclr(i,j))*rsirbm(i,j)
        flxu(i,j,np+1)=flxu(i,j,np+1)+(sdf(i,j)+ &
                         df(i,j,np+1)*sclr(i,j))*rsirbm(i,j)
        flxd(i,j,np+1)=flxd(i,j,np+1)+(sdf(i,j)+ &
                         df(i,j,np+1)*sclr(i,j))*rsirbm(i,j)
        fdirir(i,j)=fdirir(i,j)-(sdf(i,j)+df(i,j,np+1)*sclr(i,j))
       enddo
      enddo

      end subroutine sorad 



      subroutine soluv (m,n,ndim,np,oh,dp,overcast,cldwater,            &
                cwp,taucld,reff,ict,icb,fcld,cosz,                      &
                taual,ssaal,asyal,csm,rsuvbm,rsuvdf,                    &
                flx,flc,flxu,flxd,fdiruv,fdifuv,fdirpar,fdifpar)
















































































      implicit none




      integer m,n,ndim,np
      integer ict(m,ndim),icb(m,ndim)
      real taucld(m,ndim,np,2),reff(m,ndim,np,2),fcld(m,ndim,np)
      real cc(m,n,3),cosz(m,ndim)
      real cwp(m,n,np,2),oh(m,n,np),dp(m,n,np)
      real taual(m,ndim,np,11),ssaal(m,ndim,np,11),asyal(m,ndim,np,11)
      real rsuvbm(m,ndim),rsuvdf(m,ndim),csm(m,n)
      logical overcast,cldwater



      real flx(m,ndim,np+1),flc(m,ndim,np+1)
      real flxu(m,ndim,np+1),flxd(m,ndim,np+1)
      real fdiruv (m,ndim),fdifuv (m,ndim)
      real fdirpar(m,ndim),fdifpar(m,ndim)



      integer nband
      parameter (nband=8)
      real hk(nband),xk(nband),ry(nband)
      real aig(3),awg(3)



      integer i,j,k,ib
      real tauclb(m,n,np),tauclf(m,n,np),asycl(m,n,np)
      real taurs,tauoz,tausto,ssatau,asysto,tauto,ssato,asyto
      real taux,reff1,reff2,g1,g2
      real td(m,n,np+1,2),rr(m,n,np+1,2),tt(m,n,np+1,2), &
             rs(m,n,np+1,2),ts(m,n,np+1,2)
      real fall(m,n,np+1),fclr(m,n,np+1),fsdir(m,n),fsdif(m,n)
      real fallu(m,n,np+1),falld(m,n,np+1)
      real asyclt(m,n)
      real rr1t(m,n),tt1t(m,n),td1t(m,n),rs1t(m,n),ts1t(m,n)
      real rr2t(m,n),tt2t(m,n),td2t(m,n),rs2t(m,n),ts2t(m,n)




      data hk/.00057, .00367, .00083, .00417,  &
              .00600, .00556, .05913, .39081/



      data xk /30.47, 187.2,  301.9,   42.83, &
               7.09,  1.25,   0.0345,  0.0539/




      data ry /.00604, .00170, .00222, .00132, &
               .00107, .00091, .00055, .00012/





      data aig/.74625000,.00105410,-.00000264/





      data awg/.82562000,.00529000,-.00014866/



            
      do j= 1, n
       do i= 1, m                    
         fdiruv(i,j)=0.0
         fdifuv(i,j)=0.0
         rr(i,j,np+1,1)=rsuvbm(i,j)
         rr(i,j,np+1,2)=rsuvbm(i,j)
         rs(i,j,np+1,1)=rsuvdf(i,j)
         rs(i,j,np+1,2)=rsuvdf(i,j)
         td(i,j,np+1,1)=0.0
         td(i,j,np+1,2)=0.0
         tt(i,j,np+1,1)=0.0
         tt(i,j,np+1,2)=0.0
         ts(i,j,np+1,1)=0.0
         ts(i,j,np+1,2)=0.0
         cc(i,j,1)=0.0
         cc(i,j,2)=0.0
         cc(i,j,3)=0.0
       enddo
      enddo




      if (cldwater) then

       do k= 1, np
        do j= 1, n
         do i= 1, m
          taucld(i,j,k,1)=cwp(i,j,k,1)*( 3.33e-4+2.52/reff(i,j,k,1))
          taucld(i,j,k,2)=cwp(i,j,k,2)*(-6.59e-3+1.65/reff(i,j,k,2))
         enddo
        enddo
       enddo

      endif



      if (overcast) then

       do k= 1, np
        do j= 1, n
         do i= 1, m
          tauclb(i,j,k)=taucld(i,j,k,1)+taucld(i,j,k,2)
          tauclf(i,j,k)=tauclb(i,j,k)
         enddo
        enddo
       enddo

       do k= 1, 3
        do j= 1, n
         do i= 1, m
           cc(i,j,k)=1.0
         enddo
        enddo
       enddo

      else






       call cldscale(m,n,ndim,np,cosz,fcld,taucld,ict,icb,  &
                    cc,tauclb,tauclf)

      endif




      do k= 1, np

       do j= 1, n
        do i= 1, m

           asyclt(i,j)=1.0

           taux=taucld(i,j,k,1)+taucld(i,j,k,2)
          if (taux.gt.0.05 .and. fcld(i,j,k).gt.0.01) then

           reff1=min(reff(i,j,k,1),130.)
           reff2=min(reff(i,j,k,2),20.0)

           g1=(aig(1)+(aig(2)+aig(3)*reff1)*reff1)*taucld(i,j,k,1)
           g2=(awg(1)+(awg(2)+awg(3)*reff2)*reff2)*taucld(i,j,k,2)
           asyclt(i,j)=(g1+g2)/taux

          endif

        enddo
       enddo

       do j=1,n
        do i=1,m
           asycl(i,j,k)=asyclt(i,j)
        enddo
       enddo

      enddo



      do 100 ib=1,nband

       do 300 k= 1, np

        do j= 1, n
         do i= 1, m



          taurs=ry(ib)*dp(i,j,k)
          tauoz=xk(ib)*oh(i,j,k)
 



          tausto=taurs+tauoz+taual(i,j,k,ib)+1.0e-8
          ssatau=ssaal(i,j,k,ib)*taual(i,j,k,ib)+taurs
          asysto=asyal(i,j,k,ib)*ssaal(i,j,k,ib)*taual(i,j,k,ib)

          tauto=tausto
          ssato=ssatau/tauto+1.0e-8
          ssato=min(ssato,0.999999)
          asyto=asysto/(ssato*tauto)





          call deledd (tauto,ssato,asyto,csm(i,j),  &
                       rr1t(i,j),tt1t(i,j),td1t(i,j))



          call sagpol (tauto,ssato,asyto,rs1t(i,j),ts1t(i,j))



         if (tauclb(i,j,k).lt.0.01 .or. fcld(i,j,k).lt.0.01) then

          rr2t(i,j)=rr1t(i,j)
          tt2t(i,j)=tt1t(i,j)
          td2t(i,j)=td1t(i,j)
          rs2t(i,j)=rs1t(i,j)
          ts2t(i,j)=ts1t(i,j)

         else



          tauto=tausto+tauclb(i,j,k)
          ssato=(ssatau+tauclb(i,j,k))/tauto+1.0e-8
          ssato=min(ssato,0.999999)
          asyto=(asysto+asycl(i,j,k)*tauclb(i,j,k))/(ssato*tauto)

          call deledd (tauto,ssato,asyto,csm(i,j),  &
                       rr2t(i,j),tt2t(i,j),td2t(i,j))



          tauto=tausto+tauclf(i,j,k)
          ssato=(ssatau+tauclf(i,j,k))/tauto+1.0e-8
          ssato=min(ssato,0.999999)
          asyto=(asysto+asycl(i,j,k)*tauclf(i,j,k))/(ssato*tauto)

          call sagpol (tauto,ssato,asyto,rs2t(i,j),ts2t(i,j))

         endif

        enddo
       enddo

        do j=1,n
         do i=1,m
            rr(i,j,k,1)=rr1t(i,j)
         enddo
        enddo
        do j=1,n
         do i=1,m
            tt(i,j,k,1)=tt1t(i,j)
         enddo
        enddo
        do j=1,n
         do i=1,m
            td(i,j,k,1)=td1t(i,j)
         enddo
        enddo
        do j=1,n
         do i=1,m
            rs(i,j,k,1)=rs1t(i,j)
         enddo
        enddo
        do j=1,n
         do i=1,m
            ts(i,j,k,1)=ts1t(i,j)
         enddo
        enddo

        do j=1,n
         do i=1,m
            rr(i,j,k,2)=rr2t(i,j)
         enddo
        enddo
        do j=1,n
         do i=1,m
            tt(i,j,k,2)=tt2t(i,j)
         enddo
        enddo
        do j=1,n
         do i=1,m
            td(i,j,k,2)=td2t(i,j)
         enddo
        enddo
        do j=1,n
         do i=1,m
            rs(i,j,k,2)=rs2t(i,j)
         enddo
        enddo
        do j=1,n
         do i=1,m
            ts(i,j,k,2)=ts2t(i,j)
         enddo
        enddo

 300  continue


 
        call cldflx (m,n,np,ict,icb,overcast,cc,rr,tt,td,rs,ts, &
                     fclr,fall,fallu,falld,fsdir,fsdif)

       do k= 1, np+1
        do j= 1, n
         do i= 1, m
          flx(i,j,k)=flx(i,j,k)+fall(i,j,k)*hk(ib)
          flxu(i,j,k)=flxu(i,j,k)+fallu(i,j,k)*hk(ib)
          flxd(i,j,k)=flxd(i,j,k)+falld(i,j,k)*hk(ib)
         enddo
        enddo
        do j= 1, n
         do i= 1, m
          flc(i,j,k)=flc(i,j,k)+fclr(i,j,k)*hk(ib)
         enddo
        enddo
       enddo



       if(ib.lt.8) then
         do j=1,n
          do i=1,m
           fdiruv(i,j)=fdiruv(i,j)+fsdir(i,j)*hk(ib)
           fdifuv(i,j)=fdifuv(i,j)+fsdif(i,j)*hk(ib)
         enddo
        enddo
       else
         do j=1,n
          do i=1,m
           fdirpar(i,j)=fsdir(i,j)*hk(ib)
           fdifpar(i,j)=fsdif(i,j)*hk(ib)
         enddo
        enddo
       endif

 100  continue

      end subroutine soluv



      subroutine solir (m,n,ndim,np,wh,overcast,cldwater,               &
                        cwp,taucld,reff,ict,icb,fcld,cosz,              &
                        taual,ssaal,asyal,csm,rsirbm,rsirdf,            &
                        flx,flc,flxu,flxd,fdirir,fdifir)































































      implicit none




      integer m,n,ndim,np
      integer ict(m,ndim),icb(m,ndim)
      real cwp(m,n,np,2),taucld(m,ndim,np,2),reff(m,ndim,np,2)
      real fcld(m,ndim,np),cc(m,n,3),cosz(m,ndim)
      real rsirbm(m,ndim),rsirdf(m,ndim)
      real taual(m,ndim,np,11),ssaal(m,ndim,np,11),asyal(m,ndim,np,11)
      real wh(m,n,np),csm(m,n)
      logical overcast,cldwater



      real flx(m,ndim,np+1),flc(m,ndim,np+1)
      real flxu(m,ndim,np+1),flxd(m,ndim,np+1)
      real fdirir(m,ndim),fdifir(m,ndim)



      integer nk,nband
      parameter (nk=10,nband=3)
      real xk(nk),hk(nband,nk),aib(nband,2),awb(nband,2)
      real aia(nband,3),awa(nband,3),aig(nband,3),awg(nband,3)



      integer ib,iv,ik,i,j,k
      real tauclb(m,n,np),tauclf(m,n,np)
      real ssacl(m,n,np),asycl(m,n,np)
      real rr(m,n,np+1,2),tt(m,n,np+1,2),td(m,n,np+1,2), &
             rs(m,n,np+1,2),ts(m,n,np+1,2)
      real fall(m,n,np+1),fclr(m,n,np+1)
      real fallu(m,n,np+1),falld(m,n,np+1)
      real fsdir(m,n),fsdif(m,n)

      real tauwv,tausto,ssatau,asysto,tauto,ssato,asyto
      real taux,reff1,reff2,w1,w2,g1,g2
      real ssaclt(m,n),asyclt(m,n)
      real rr1t(m,n),tt1t(m,n),td1t(m,n),rs1t(m,n),ts1t(m,n)
      real rr2t(m,n),tt2t(m,n),td2t(m,n),rs2t(m,n),ts2t(m,n)




      data xk/  &
        0.0010, 0.0133, 0.0422, 0.1334, 0.4217, &
        1.334,  5.623,  31.62,  177.8,  1000.0/  




      data hk/  &
       .20673,.08236,.01074,  .03497,.01157,.00360, &
       .03011,.01133,.00411,  .02260,.01143,.00421, &
       .01336,.01240,.00389,  .00696,.01258,.00326, &
       .00441,.01381,.00499,  .00115,.00650,.00465, &
       .00026,.00244,.00245,  .00000,.00094,.00145/




      data aib/ &
        .000333, .000333, .000333, &
           2.52,    2.52,    2.52/




      data awb/ &
        -0.0101, -0.0166, -0.0339, &
           1.72,    1.85,    2.16/





      data aia/ &
       -.00000260, .00215346, .08938331, &
        .00000746, .00073709, .00299387, &
        .00000000,-.00000134,-.00001038/




      data awa/ &
        .00000007,-.00019934, .01209318, &
        .00000845, .00088757, .01784739, &
       -.00000004,-.00000650,-.00036910/




      data aig/ &
        .74935228, .76098937, .84090400, &
        .00119715, .00141864, .00126222, &
       -.00000367,-.00000396,-.00000385/




      data awg/ &
        .79375035, .74513197, .83530748, &
        .00832441, .01370071, .00257181, &
       -.00023263,-.00038203, .00005519/




      do j= 1, n
       do i= 1, m
         fdirir(i,j)=0.0
         fdifir(i,j)=0.0
         rr(i,j,np+1,1)=rsirbm(i,j)
         rr(i,j,np+1,2)=rsirbm(i,j)
         rs(i,j,np+1,1)=rsirdf(i,j)
         rs(i,j,np+1,2)=rsirdf(i,j)
         td(i,j,np+1,1)=0.0
         td(i,j,np+1,2)=0.0
         tt(i,j,np+1,1)=0.0
         tt(i,j,np+1,2)=0.0
         ts(i,j,np+1,1)=0.0
         ts(i,j,np+1,2)=0.0
         cc(i,j,1)=0.0
         cc(i,j,2)=0.0
         cc(i,j,3)=0.0
       enddo
      enddo



      do 100 ib=1,nband

       iv=ib+8



      if (cldwater) then

       do k= 1, np
        do j= 1, n
         do i= 1, m
          taucld(i,j,k,1)=cwp(i,j,k,1)*(aib(ib,1) &
                          +aib(ib,2)/reff(i,j,k,1))
          taucld(i,j,k,2)=cwp(i,j,k,2)*(awb(ib,1) &
                          +awb(ib,2)/reff(i,j,k,2))
         enddo
        enddo
       enddo

      endif



      if (overcast) then

       do k= 1, np
        do j= 1, n
         do i= 1, m
          tauclb(i,j,k)=taucld(i,j,k,1)+taucld(i,j,k,2)
          tauclf(i,j,k)=tauclb(i,j,k)
         enddo
        enddo
       enddo

       do k= 1, 3
        do j= 1, n
         do i= 1, m
           cc(i,j,k)=1.0
         enddo
        enddo
       enddo

      else






       call cldscale(m,n,ndim,np,cosz,fcld,taucld,ict,icb, &
                    cc,tauclb,tauclf)

      endif




       do k= 1, np

        do j= 1, n
         do i= 1, m

           ssaclt(i,j)=1.0
           asyclt(i,j)=1.0

           taux=taucld(i,j,k,1)+taucld(i,j,k,2)
          if (taux.gt.0.05 .and. fcld(i,j,k).gt.0.01) then

           reff1=min(reff(i,j,k,1),130.)
           reff2=min(reff(i,j,k,2),20.0)

           w1=(1.-(aia(ib,1)+(aia(ib,2)+ &
               aia(ib,3)*reff1)*reff1))*taucld(i,j,k,1)
           w2=(1.-(awa(ib,1)+(awa(ib,2)+ &
               awa(ib,3)*reff2)*reff2))*taucld(i,j,k,2)
           ssaclt(i,j)=(w1+w2)/taux

           g1=(aig(ib,1)+(aig(ib,2)+aig(ib,3)*reff1)*reff1)*w1
           g2=(awg(ib,1)+(awg(ib,2)+awg(ib,3)*reff2)*reff2)*w2
           asyclt(i,j)=(g1+g2)/(w1+w2)

          endif

         enddo
        enddo

        do j=1,n
         do i=1,m
            ssacl(i,j,k)=ssaclt(i,j)
         enddo
        enddo
        do j=1,n
         do i=1,m
            asycl(i,j,k)=asyclt(i,j)
         enddo
        enddo

       enddo



         do 200 ik=1,nk

          do 300 k= 1, np

           do j= 1, n
            do i= 1, m

             tauwv=xk(ik)*wh(i,j,k)
 


 
             tausto=tauwv+taual(i,j,k,iv)+1.0e-8
             ssatau=ssaal(i,j,k,iv)*taual(i,j,k,iv)
             asysto=asyal(i,j,k,iv)*ssaal(i,j,k,iv)*taual(i,j,k,iv)
 


             tauto=tausto
             ssato=ssatau/tauto+1.0e-8

            if (ssato .gt. 0.001) then

             ssato=min(ssato,0.999999)
             asyto=asysto/(ssato*tauto)



             call deledd (tauto,ssato,asyto,csm(i,j),  &
                          rr1t(i,j),tt1t(i,j),td1t(i,j))



             call sagpol (tauto,ssato,asyto,rs1t(i,j),ts1t(i,j))

            else

             td1t(i,j)=exp(-tauto*csm(i,j))
             ts1t(i,j)=exp(-1.66*tauto)
             tt1t(i,j)=0.0
             rr1t(i,j)=0.0
             rs1t(i,j)=0.0

            endif



            if (tauclb(i,j,k).lt.0.01 .or. fcld(i,j,k).lt.0.01) then

             rr2t(i,j)=rr1t(i,j)
             tt2t(i,j)=tt1t(i,j)
             td2t(i,j)=td1t(i,j)
             rs2t(i,j)=rs1t(i,j)
             ts2t(i,j)=ts1t(i,j)

            else



             tauto=tausto+tauclb(i,j,k)
             ssato=(ssatau+ssacl(i,j,k)*tauclb(i,j,k))/tauto+1.0e-8
             ssato=min(ssato,0.999999)
             asyto=(asysto+asycl(i,j,k)*ssacl(i,j,k)*tauclb(i,j,k))/ &
                   (ssato*tauto)

             call deledd (tauto,ssato,asyto,csm(i,j),  &
                          rr2t(i,j),tt2t(i,j),td2t(i,j))



             tauto=tausto+tauclf(i,j,k)
             ssato=(ssatau+ssacl(i,j,k)*tauclf(i,j,k))/tauto+1.0e-8
             ssato=min(ssato,0.999999)
             asyto=(asysto+asycl(i,j,k)*ssacl(i,j,k)*tauclf(i,j,k))/ &
                   (ssato*tauto)

             call sagpol (tauto,ssato,asyto,rs2t(i,j),ts2t(i,j))

            endif

           enddo
          enddo

           do j=1,n
            do i=1,m
               rr(i,j,k,1)=rr1t(i,j)
            enddo
           enddo
           do j=1,n
            do i=1,m
               tt(i,j,k,1)=tt1t(i,j)
            enddo
           enddo
           do j=1,n
            do i=1,m
               td(i,j,k,1)=td1t(i,j)
            enddo
           enddo
           do j=1,n
            do i=1,m
               rs(i,j,k,1)=rs1t(i,j)
            enddo
           enddo
           do j=1,n
            do i=1,m
               ts(i,j,k,1)=ts1t(i,j)
            enddo
           enddo
 
           do j=1,n
            do i=1,m
               rr(i,j,k,2)=rr2t(i,j)
            enddo
           enddo
           do j=1,n
            do i=1,m
               tt(i,j,k,2)=tt2t(i,j)
            enddo
           enddo
           do j=1,n
            do i=1,m
               td(i,j,k,2)=td2t(i,j)
            enddo
           enddo
           do j=1,n
            do i=1,m
               rs(i,j,k,2)=rs2t(i,j)
            enddo
           enddo
           do j=1,n
            do i=1,m
               ts(i,j,k,2)=ts2t(i,j)
            enddo
           enddo

 300  continue



        call cldflx (m,n,np,ict,icb,overcast,cc,rr,tt,td,rs,ts, &
                     fclr,fall,fallu,falld,fsdir,fsdif)

       do k= 1, np+1
        do j= 1, n
         do i= 1, m
          flx(i,j,k) = flx(i,j,k)+fall(i,j,k)*hk(ib,ik)
          flxu(i,j,k) = flxu(i,j,k)+fallu(i,j,k)*hk(ib,ik)
          flxd(i,j,k) = flxd(i,j,k)+falld(i,j,k)*hk(ib,ik)
         enddo
        enddo
        do j= 1, n
         do i= 1, m
          flc(i,j,k) = flc(i,j,k)+fclr(i,j,k)*hk(ib,ik)
         enddo
        enddo
       enddo



       do j= 1, n
        do i= 1, m
          fdirir(i,j) = fdirir(i,j)+fsdir(i,j)*hk(ib,ik)
          fdifir(i,j) = fdifir(i,j)+fsdif(i,j)*hk(ib,ik)
        enddo
       enddo

  200 continue
  100 continue
 
      end subroutine solir 



      subroutine cldscale (m,n,ndim,np,cosz,fcld,taucld,ict,icb,    &
                           cc,tauclb,tauclf)





































      implicit none




      integer m,n,ndim,np
      integer ict(m,ndim),icb(m,ndim)
      real cosz(m,ndim),fcld(m,ndim,np),taucld(m,ndim,np,2)



      real cc(m,n,3),tauclb(m,n,np),tauclf(m,n,np)



      integer i,j,k,im,it,ia,kk
      real  fm,ft,fa,xai,taux



      integer   nm,nt,na
      parameter (nm=11,nt=9,na=11) 
      real  dm,dt,da,t1,caib(nm,nt,na),caif(nt,na)
      parameter (dm=0.1,dt=0.30103,da=0.1,t1=-0.9031)








      data ((caib(1,i,j),j=1,11),i=1,9)/  &
       .000,0.068,0.140,0.216,0.298,0.385,0.481,0.586,0.705,0.840,1.000, &
       .000,0.052,0.106,0.166,0.230,0.302,0.383,0.478,0.595,0.752,1.000, &
       .000,0.038,0.078,0.120,0.166,0.218,0.276,0.346,0.438,0.582,1.000, &
       .000,0.030,0.060,0.092,0.126,0.164,0.206,0.255,0.322,0.442,1.000, &
       .000,0.025,0.051,0.078,0.106,0.136,0.170,0.209,0.266,0.462,1.000, &
       .000,0.023,0.046,0.070,0.095,0.122,0.150,0.187,0.278,0.577,1.000, &
       .000,0.022,0.043,0.066,0.089,0.114,0.141,0.187,0.354,0.603,1.000, &
       .000,0.021,0.042,0.063,0.086,0.108,0.135,0.214,0.349,0.565,1.000, &
       .000,0.021,0.041,0.062,0.083,0.105,0.134,0.202,0.302,0.479,1.000/
      data ((caib(2,i,j),j=1,11),i=1,9)/ &
       .000,0.088,0.179,0.272,0.367,0.465,0.566,0.669,0.776,0.886,1.000, &
       .000,0.079,0.161,0.247,0.337,0.431,0.531,0.637,0.749,0.870,1.000, &
       .000,0.065,0.134,0.207,0.286,0.372,0.466,0.572,0.692,0.831,1.000, &
       .000,0.049,0.102,0.158,0.221,0.290,0.370,0.465,0.583,0.745,1.000, &
       .000,0.037,0.076,0.118,0.165,0.217,0.278,0.354,0.459,0.638,1.000, &
       .000,0.030,0.061,0.094,0.130,0.171,0.221,0.286,0.398,0.631,1.000, &
       .000,0.026,0.052,0.081,0.111,0.146,0.189,0.259,0.407,0.643,1.000, &
       .000,0.023,0.047,0.072,0.098,0.129,0.170,0.250,0.387,0.598,1.000, &
       .000,0.022,0.044,0.066,0.090,0.118,0.156,0.224,0.328,0.508,1.000/
      data ((caib(3,i,j),j=1,11),i=1,9)/ &
       .000,0.094,0.189,0.285,0.383,0.482,0.582,0.685,0.788,0.894,1.000, &
       .000,0.088,0.178,0.271,0.366,0.465,0.565,0.669,0.776,0.886,1.000, &
       .000,0.079,0.161,0.247,0.337,0.431,0.531,0.637,0.750,0.870,1.000, &
       .000,0.066,0.134,0.209,0.289,0.375,0.470,0.577,0.697,0.835,1.000, &
       .000,0.050,0.104,0.163,0.227,0.300,0.383,0.483,0.606,0.770,1.000, &
       .000,0.038,0.080,0.125,0.175,0.233,0.302,0.391,0.518,0.710,1.000, &
       .000,0.031,0.064,0.100,0.141,0.188,0.249,0.336,0.476,0.689,1.000, &
       .000,0.026,0.054,0.084,0.118,0.158,0.213,0.298,0.433,0.638,1.000, &
       .000,0.023,0.048,0.074,0.102,0.136,0.182,0.254,0.360,0.542,1.000/
      data ((caib(4,i,j),j=1,11),i=1,9)/ &
       .000,0.096,0.193,0.290,0.389,0.488,0.589,0.690,0.792,0.896,1.000, &
       .000,0.092,0.186,0.281,0.378,0.477,0.578,0.680,0.785,0.891,1.000, &
       .000,0.086,0.174,0.264,0.358,0.455,0.556,0.660,0.769,0.882,1.000, &
       .000,0.074,0.153,0.235,0.323,0.416,0.514,0.622,0.737,0.862,1.000, &
       .000,0.061,0.126,0.195,0.271,0.355,0.449,0.555,0.678,0.823,1.000, &
       .000,0.047,0.098,0.153,0.215,0.286,0.370,0.471,0.600,0.770,1.000, &
       .000,0.037,0.077,0.120,0.170,0.230,0.303,0.401,0.537,0.729,1.000, &
       .000,0.030,0.062,0.098,0.138,0.187,0.252,0.343,0.476,0.673,1.000, &
       .000,0.026,0.053,0.082,0.114,0.154,0.207,0.282,0.391,0.574,1.000/
      data ((caib(5,i,j),j=1,11),i=1,9)/ &
       .000,0.097,0.194,0.293,0.392,0.492,0.592,0.693,0.794,0.897,1.000, &
       .000,0.094,0.190,0.286,0.384,0.483,0.584,0.686,0.789,0.894,1.000, &
       .000,0.090,0.181,0.274,0.370,0.468,0.569,0.672,0.778,0.887,1.000, &
       .000,0.081,0.165,0.252,0.343,0.439,0.539,0.645,0.757,0.874,1.000, &
       .000,0.069,0.142,0.218,0.302,0.392,0.490,0.598,0.717,0.850,1.000, &
       .000,0.054,0.114,0.178,0.250,0.330,0.422,0.529,0.656,0.810,1.000, &
       .000,0.042,0.090,0.141,0.200,0.269,0.351,0.455,0.589,0.764,1.000, &
       .000,0.034,0.070,0.112,0.159,0.217,0.289,0.384,0.515,0.703,1.000, &
       .000,0.028,0.058,0.090,0.128,0.174,0.231,0.309,0.420,0.602,1.000/
      data ((caib(6,i,j),j=1,11),i=1,9)/ &
       .000,0.098,0.196,0.295,0.394,0.494,0.594,0.695,0.796,0.898,1.000, &
       .000,0.096,0.193,0.290,0.389,0.488,0.588,0.690,0.792,0.895,1.000, &
       .000,0.092,0.186,0.281,0.378,0.477,0.577,0.680,0.784,0.891,1.000, &
       .000,0.086,0.174,0.264,0.358,0.455,0.556,0.661,0.769,0.882,1.000, &
       .000,0.075,0.154,0.237,0.325,0.419,0.518,0.626,0.741,0.865,1.000, &
       .000,0.062,0.129,0.201,0.279,0.366,0.462,0.571,0.694,0.836,1.000, &
       .000,0.049,0.102,0.162,0.229,0.305,0.394,0.501,0.631,0.793,1.000, &
       .000,0.038,0.080,0.127,0.182,0.245,0.323,0.422,0.550,0.730,1.000, &
       .000,0.030,0.064,0.100,0.142,0.192,0.254,0.334,0.448,0.627,1.000/
      data ((caib(7,i,j),j=1,11),i=1,9)/ &
       .000,0.098,0.198,0.296,0.396,0.496,0.596,0.696,0.797,0.898,1.000, &
       .000,0.097,0.194,0.293,0.392,0.491,0.591,0.693,0.794,0.897,1.000, &
       .000,0.094,0.190,0.286,0.384,0.483,0.583,0.686,0.789,0.894,1.000, &
       .000,0.089,0.180,0.274,0.369,0.467,0.568,0.672,0.778,0.887,1.000, &
       .000,0.081,0.165,0.252,0.344,0.440,0.541,0.646,0.758,0.875,1.000, &
       .000,0.069,0.142,0.221,0.306,0.397,0.496,0.604,0.722,0.854,1.000, &
       .000,0.056,0.116,0.182,0.256,0.338,0.432,0.540,0.666,0.816,1.000, &
       .000,0.043,0.090,0.143,0.203,0.273,0.355,0.455,0.583,0.754,1.000, &
       .000,0.034,0.070,0.111,0.157,0.210,0.276,0.359,0.474,0.650,1.000/
      data ((caib(8,i,j),j=1,11),i=1,9)/ &
       .000,0.099,0.198,0.298,0.398,0.497,0.598,0.698,0.798,0.899,1.000, &
       .000,0.098,0.196,0.295,0.394,0.494,0.594,0.695,0.796,0.898,1.000, &
       .000,0.096,0.193,0.290,0.390,0.489,0.589,0.690,0.793,0.896,1.000, &
       .000,0.093,0.186,0.282,0.379,0.478,0.578,0.681,0.786,0.892,1.000, &
       .000,0.086,0.175,0.266,0.361,0.458,0.558,0.663,0.771,0.883,1.000, &
       .000,0.076,0.156,0.240,0.330,0.423,0.523,0.630,0.744,0.867,1.000, &
       .000,0.063,0.130,0.203,0.282,0.369,0.465,0.572,0.694,0.834,1.000, &
       .000,0.049,0.102,0.161,0.226,0.299,0.385,0.486,0.611,0.774,1.000, &
       .000,0.038,0.078,0.122,0.172,0.229,0.297,0.382,0.498,0.672,1.000/
      data ((caib(9,i,j),j=1,11),i=1,9)/ &
       .000,0.099,0.199,0.298,0.398,0.498,0.598,0.699,0.799,0.899,1.000, &
       .000,0.099,0.198,0.298,0.398,0.497,0.598,0.698,0.798,0.899,1.000, &
       .000,0.098,0.196,0.295,0.394,0.494,0.594,0.695,0.796,0.898,1.000, &
       .000,0.096,0.193,0.290,0.389,0.488,0.588,0.690,0.792,0.895,1.000, &
       .000,0.092,0.185,0.280,0.376,0.474,0.575,0.678,0.782,0.890,1.000, &
       .000,0.084,0.170,0.259,0.351,0.447,0.547,0.652,0.762,0.878,1.000, &
       .000,0.071,0.146,0.224,0.308,0.398,0.494,0.601,0.718,0.850,1.000, &
       .000,0.056,0.114,0.178,0.248,0.325,0.412,0.514,0.638,0.793,1.000, &
       .000,0.042,0.086,0.134,0.186,0.246,0.318,0.405,0.521,0.691,1.000/
      data ((caib(10,i,j),j=1,11),i=1,9)/ &
       .000,0.100,0.200,0.300,0.400,0.500,0.600,0.700,0.800,0.900,1.000, &
       .000,0.100,0.200,0.300,0.400,0.500,0.600,0.700,0.800,0.900,1.000, &
       .000,0.100,0.200,0.300,0.400,0.500,0.600,0.700,0.800,0.900,1.000, &
       .000,0.100,0.199,0.298,0.398,0.498,0.598,0.698,0.798,0.899,1.000, &
       .000,0.098,0.196,0.294,0.392,0.491,0.590,0.691,0.793,0.896,1.000, &
       .000,0.092,0.185,0.278,0.374,0.470,0.570,0.671,0.777,0.886,1.000, &
       .000,0.081,0.162,0.246,0.333,0.424,0.521,0.625,0.738,0.862,1.000, &
       .000,0.063,0.128,0.196,0.270,0.349,0.438,0.540,0.661,0.809,1.000, &
       .000,0.046,0.094,0.146,0.202,0.264,0.337,0.426,0.542,0.710,1.000/ 
      data ((caib(11,i,j),j=1,11),i=1,9)/ &
       .000,0.101,0.202,0.302,0.402,0.502,0.602,0.702,0.802,0.901,1.000, &
       .000,0.102,0.202,0.303,0.404,0.504,0.604,0.703,0.802,0.902,1.000, &
       .000,0.102,0.205,0.306,0.406,0.506,0.606,0.706,0.804,0.902,1.000, &
       .000,0.104,0.207,0.309,0.410,0.510,0.609,0.707,0.805,0.902,1.000, &
       .000,0.106,0.208,0.309,0.409,0.508,0.606,0.705,0.803,0.902,1.000, &
       .000,0.102,0.202,0.298,0.395,0.493,0.590,0.690,0.790,0.894,1.000, &
       .000,0.091,0.179,0.267,0.357,0.449,0.545,0.647,0.755,0.872,1.000, &
       .000,0.073,0.142,0.214,0.290,0.372,0.462,0.563,0.681,0.822,1.000, &
       .000,0.053,0.104,0.158,0.217,0.281,0.356,0.446,0.562,0.726,1.000/
      data ((caif(i,j),j=1,11),i=1,9)/ &
       .000,0.099,0.198,0.297,0.397,0.496,0.597,0.697,0.798,0.899,1.000, &
       .000,0.098,0.196,0.294,0.394,0.494,0.594,0.694,0.796,0.898,1.000, &
       .000,0.096,0.192,0.290,0.388,0.487,0.587,0.689,0.792,0.895,1.000, &
       .000,0.092,0.185,0.280,0.376,0.476,0.576,0.678,0.783,0.890,1.000, &
       .000,0.085,0.173,0.263,0.357,0.454,0.555,0.659,0.768,0.881,1.000, &
       .000,0.076,0.154,0.237,0.324,0.418,0.517,0.624,0.738,0.864,1.000, &
       .000,0.063,0.131,0.203,0.281,0.366,0.461,0.567,0.688,0.830,1.000, &
       .000,0.052,0.107,0.166,0.232,0.305,0.389,0.488,0.610,0.770,1.000, &
       .000,0.043,0.088,0.136,0.189,0.248,0.317,0.400,0.510,0.675,1.000/






      do j=1,n
       do i=1,m
         cc(i,j,1)=0.0
         cc(i,j,2)=0.0
         cc(i,j,3)=0.0
       enddo
      enddo
      do j=1,n
       do i=1,m
        do k=1,ict(i,j)-1
          cc(i,j,1)=max(cc(i,j,1),fcld(i,j,k))
        enddo
       enddo
      enddo

      do j=1,n
       do i=1,m
        do k=ict(i,j),icb(i,j)-1
          cc(i,j,2)=max(cc(i,j,2),fcld(i,j,k))
        enddo
       enddo
      enddo

      do j=1,n
       do i=1,m
        do k=icb(i,j),np
          cc(i,j,3)=max(cc(i,j,3),fcld(i,j,k))
        enddo
       enddo
      enddo




      
      do j=1,n
       do i=1,m

        do k=1,np

         if(k.lt.ict(i,j)) then
            kk=1
         elseif(k.ge.ict(i,j) .and. k.lt.icb(i,j)) then
            kk=2
         else
            kk=3
         endif

         tauclb(i,j,k) = 0.0
         tauclf(i,j,k) = 0.0

         taux=taucld(i,j,k,1)+taucld(i,j,k,2)
         if (taux.gt.0.05 .and. fcld(i,j,k).gt.0.01) then



           fa=fcld(i,j,k)/cc(i,j,kk)



           taux=min(taux,32.)

           fm=cosz(i,j)/dm
           ft=(log10(taux)-t1)/dt
           fa=fa/da
 
           im=int(fm+1.5)
           it=int(ft+1.5)
           ia=int(fa+1.5)
  
           im=max(im,2)
           it=max(it,2)
           ia=max(ia,2)
     
           im=min(im,nm-1)
           it=min(it,nt-1)
           ia=min(ia,na-1)

           fm=fm-float(im-1)
           ft=ft-float(it-1)
           fa=fa-float(ia-1)




 
           xai=    (-caib(im-1,it,ia)*(1.-fm)+ &
            caib(im+1,it,ia)*(1.+fm))*fm*.5+caib(im,it,ia)*(1.-fm*fm)
         
           xai=xai+(-caib(im,it-1,ia)*(1.-ft)+ &
            caib(im,it+1,ia)*(1.+ft))*ft*.5+caib(im,it,ia)*(1.-ft*ft)

           xai=xai+(-caib(im,it,ia-1)*(1.-fa)+ &
           caib(im,it,ia+1)*(1.+fa))*fa*.5+caib(im,it,ia)*(1.-fa*fa)

           xai= xai-2.*caib(im,it,ia)
           xai=max(xai,0.0)
     
           tauclb(i,j,k) = taux*xai





           xai=    (-caif(it-1,ia)*(1.-ft)+ &
            caif(it+1,ia)*(1.+ft))*ft*.5+caif(it,ia)*(1.-ft*ft)

           xai=xai+(-caif(it,ia-1)*(1.-fa)+ &
            caif(it,ia+1)*(1.+fa))*fa*.5+caif(it,ia)*(1.-fa*fa)

           xai= xai-caif(it,ia)
           xai=max(xai,0.0)
     
           tauclf(i,j,k) = taux*xai

         endif

        enddo
       enddo
      enddo

      end subroutine cldscale



      subroutine deledd(tau,ssc,g0,csm,rr,tt,td)





















      implicit none


      real zero,one,two,three,four,fourth,seven,thresh
      parameter (one =1., three=3.)
      parameter (two =2., seven=7.)
      parameter (four=4., fourth=.25)
      parameter (zero=0., thresh=1.e-8)


      real tau,ssc,g0,csm


      real rr,tt,td



      real zth,ff,xx,taup,sscp,gp,gm1,gm2,gm3,akk,alf1,alf2, &
           all,bll,st7,st8,cll,dll,fll,ell,st1,st2,st3,st4
 


                zth = one / csm
 




                ff  = g0*g0
                xx  = one-ff*ssc
                taup= tau*xx
                sscp= ssc*(one-ff)/xx
                gp  = g0/(one+g0)
 




                xx  =  three*gp 
                gm1 =  (seven - sscp*(four+xx))*fourth
                gm2 = -(one   - sscp*(four-xx))*fourth
 

 
                akk = sqrt((gm1+gm2)*(gm1-gm2))
 
                xx  = akk * zth
                st7 = one - xx
                st8 = one + xx
                st3 = st7 * st8

                if (abs(st3) .lt. thresh) then
                    zth = zth + 0.001
                    xx  = akk * zth
                    st7 = one - xx
                    st8 = one + xx
                    st3 = st7 * st8
                endif


 
                td  = exp(-taup/zth)


 
                gm3  = (two - zth*three*gp)*fourth
                xx   = gm1 - gm2
                alf1 = gm1 - gm3 * xx
                alf2 = gm2 + gm3 * xx
 


 
                xx  = akk * two
                all = (gm3 - alf2 * zth    )*xx*td
                bll = (one - gm3 + alf1*zth)*xx
 
                xx  = akk * gm3
                cll = (alf2 + xx) * st7
                dll = (alf2 - xx) * st8
 
                xx  = akk * (one-gm3)
                fll = (alf1 + xx) * st8
                ell = (alf1 - xx) * st7
  
                st2 = exp(-akk*taup)
                st4 = st2 * st2
 
                st1 =  sscp / ((akk+gm1 + (akk-gm1)*st4) * st3)
 


 
                rr =   ( cll-dll*st4    -all*st2)*st1
                tt = - ((fll-ell*st4)*td-bll*st2)*st1
 
                rr = max(rr,zero)
                tt = max(tt,zero)

      end subroutine deledd



      subroutine sagpol(tau,ssc,g0,rll,tll)


















      implicit none


      real one,three,four
      parameter (one=1., three=3., four=4.)



      real tau,ssc,g0



      real rll,tll



      real xx,uuu,ttt,emt,up1,um1,st1

             xx  = one-ssc*g0
             uuu = sqrt( xx/(one-ssc))
             ttt = sqrt( xx*(one-ssc)*three )*tau
             emt = exp(-ttt)
             up1 = uuu + one
             um1 = uuu - one
             xx  = um1*emt
             st1 = one / ((up1+xx) * (up1-xx))
             rll = up1*um1*(one-emt*emt)*st1
             tll = uuu*four*emt         *st1

      end subroutine sagpol



      subroutine cldflx (m,n,np,ict,icb,overcast,cc,rr,tt,td,rs,ts,&
                 fclr,fall,fallu,falld,fsdir,fsdif)
































      implicit none




      integer m,n,np
      integer ict(m,n),icb(m,n)

      real rr(m,n,np+1,2),tt(m,n,np+1,2),td(m,n,np+1,2)
      real rs(m,n,np+1,2),ts(m,n,np+1,2)
      real cc(m,n,3)
      logical overcast



      integer i,j,k,ih,im,is,itm
      real rra(m,n,np+1,2,2),tta(m,n,np+1,2,2),tda(m,n,np+1,2,2)
      real rsa(m,n,np+1,2,2),rxa(m,n,np+1,2,2)
      real ch(m,n),cm(m,n),ct(m,n),flxdn(m,n,np+1)
      real flxdnu(m,n,np+1),flxdnd(m,n,np+1)
      real fdndir(m,n),fdndif(m,n),fupdif
      real denm,xx



      real fclr(m,n,np+1),fall(m,n,np+1)
      real fallu(m,n,np+1),falld(m,n,np+1)
      real fsdir(m,n),fsdif(m,n)



      do k=1,np+1
       do j=1,n
        do i=1,m
           fclr(i,j,k)=0.0
           fall(i,j,k)=0.0
           fallu(i,j,k)=0.0
           falld(i,j,k)=0.0
        enddo
       enddo
      enddo

       do j=1,n
        do i=1,m
           fsdir(i,j)=0.0
           fsdif(i,j)=0.0
        enddo
       enddo










      itm=1



      if (overcast) itm=2




      do 10 ih=itm,2

       do j= 1, n
        do i= 1, m
          tda(i,j,1,ih,1)=td(i,j,1,ih)
          tta(i,j,1,ih,1)=tt(i,j,1,ih)
          rsa(i,j,1,ih,1)=rs(i,j,1,ih)
          tda(i,j,1,ih,2)=td(i,j,1,ih)
          tta(i,j,1,ih,2)=tt(i,j,1,ih)
          rsa(i,j,1,ih,2)=rs(i,j,1,ih)
        enddo
       enddo

       do j= 1, n
        do i= 1, m
         do k= 2, ict(i,j)-1
          denm = ts(i,j,k,ih)/( 1.-rsa(i,j,k-1,ih,1)*rs(i,j,k,ih))
          tda(i,j,k,ih,1)= tda(i,j,k-1,ih,1)*td(i,j,k,ih)
          tta(i,j,k,ih,1)= tda(i,j,k-1,ih,1)*tt(i,j,k,ih) &
                        +(tda(i,j,k-1,ih,1)*rr(i,j,k,ih)  &
                        *rsa(i,j,k-1,ih,1)+tta(i,j,k-1,ih,1))*denm
          rsa(i,j,k,ih,1)= rs(i,j,k,ih)+ts(i,j,k,ih) &
                        *rsa(i,j,k-1,ih,1)*denm
          tda(i,j,k,ih,2)= tda(i,j,k,ih,1)
          tta(i,j,k,ih,2)= tta(i,j,k,ih,1)
          rsa(i,j,k,ih,2)= rsa(i,j,k,ih,1)
         enddo
        enddo
       enddo



      do 10 im=itm,2

      do j= 1, n
       do i= 1, m
        do k= ict(i,j), icb(i,j)-1
          denm = ts(i,j,k,im)/( 1.-rsa(i,j,k-1,ih,im)*rs(i,j,k,im))
          tda(i,j,k,ih,im)= tda(i,j,k-1,ih,im)*td(i,j,k,im)
          tta(i,j,k,ih,im)= tda(i,j,k-1,ih,im)*tt(i,j,k,im) &
                        +(tda(i,j,k-1,ih,im)*rr(i,j,k,im)   &
                        *rsa(i,j,k-1,ih,im)+tta(i,j,k-1,ih,im))*denm
          rsa(i,j,k,ih,im)= rs(i,j,k,im)+ts(i,j,k,im)  &
                        *rsa(i,j,k-1,ih,im)*denm
         enddo
        enddo
       enddo

  10  continue






 


      do 20 is=itm,2

       do j= 1, n
        do i= 1, m
         rra(i,j,np+1,1,is)=rr(i,j,np+1,is)
         rxa(i,j,np+1,1,is)=rs(i,j,np+1,is)
         rra(i,j,np+1,2,is)=rr(i,j,np+1,is)
         rxa(i,j,np+1,2,is)=rs(i,j,np+1,is)
        enddo
       enddo

       do j= 1, n
        do i= 1, m
         do k=np,icb(i,j),-1
          denm=ts(i,j,k,is)/( 1.-rs(i,j,k,is)*rxa(i,j,k+1,1,is) )
          rra(i,j,k,1,is)=rr(i,j,k,is)+(td(i,j,k,is) &
              *rra(i,j,k+1,1,is)+tt(i,j,k,is)*rxa(i,j,k+1,1,is))*denm
          rxa(i,j,k,1,is)= rs(i,j,k,is)+ts(i,j,k,is) &
              *rxa(i,j,k+1,1,is)*denm
          rra(i,j,k,2,is)=rra(i,j,k,1,is)
          rxa(i,j,k,2,is)=rxa(i,j,k,1,is)
         enddo
        enddo
       enddo



      do 20 im=itm,2

       do j= 1, n
        do i= 1, m
         do k= icb(i,j)-1,ict(i,j),-1
          denm=ts(i,j,k,im)/( 1.-rs(i,j,k,im)*rxa(i,j,k+1,im,is) )
          rra(i,j,k,im,is)= rr(i,j,k,im)+(td(i,j,k,im)  &
              *rra(i,j,k+1,im,is)+tt(i,j,k,im)*rxa(i,j,k+1,im,is))*denm
          rxa(i,j,k,im,is)= rs(i,j,k,im)+ts(i,j,k,im)   &
              *rxa(i,j,k+1,im,is)*denm
         enddo
        enddo
       enddo

  20  continue




      do 100 ih=itm,2



         if(ih.eq.1) then
           do j=1,n
            do i=1,m
             ch(i,j)=1.0-cc(i,j,1)
            enddo
           enddo

          else



           do j=1,n
            do i=1,m
             ch(i,j)=cc(i,j,1)
            enddo
           enddo

          endif

      do 100 im=itm,2



         if(im.eq.1) then

           do j=1,n
            do i=1,m
              cm(i,j)=ch(i,j)*(1.0-cc(i,j,2))
            enddo
           enddo

         else



           do j=1,n
            do i=1,m
              cm(i,j)=ch(i,j)*cc(i,j,2) 
            enddo
           enddo

         endif

      do 100 is=itm,2



         if(is.eq.1) then

           do j=1,n
            do i=1,m
             ct(i,j)=cm(i,j)*(1.0-cc(i,j,3)) 
            enddo
           enddo

         else



           do j=1,n
            do i=1,m
             ct(i,j)=cm(i,j)*cc(i,j,3)
            enddo
           enddo

         endif



       do j= 1, n
        do i= 1, m
         do k= icb(i,j), np
          denm = ts(i,j,k,is)/( 1.-rsa(i,j,k-1,ih,im)*rs(i,j,k,is) )
          tda(i,j,k,ih,im)= tda(i,j,k-1,ih,im)*td(i,j,k,is)
          tta(i,j,k,ih,im)=  tda(i,j,k-1,ih,im)*tt(i,j,k,is) &
               +(tda(i,j,k-1,ih,im)*rr(i,j,k,is) &
               *rsa(i,j,k-1,ih,im)+tta(i,j,k-1,ih,im))*denm
          rsa(i,j,k,ih,im)= rs(i,j,k,is)+ts(i,j,k,is) &
               *rsa(i,j,k-1,ih,im)*denm
         enddo
        enddo
       enddo



       do j= 1, n
        do i= 1, m
         do k= ict(i,j)-1,1,-1
          denm =ts(i,j,k,ih)/(1.-rs(i,j,k,ih)*rxa(i,j,k+1,im,is))
          rra(i,j,k,im,is)= rr(i,j,k,ih)+(td(i,j,k,ih)  &
              *rra(i,j,k+1,im,is)+tt(i,j,k,ih)*rxa(i,j,k+1,im,is))*denm
          rxa(i,j,k,im,is)= rs(i,j,k,ih)+ts(i,j,k,ih)   &
              *rxa(i,j,k+1,im,is)*denm
         enddo
        enddo
       enddo


 




      do k=2,np+1
       do j=1, n
        do i=1, m
         denm= 1./(1.- rxa(i,j,k,im,is)*rsa(i,j,k-1,ih,im))
         fdndir(i,j)= tda(i,j,k-1,ih,im)
         xx = tda(i,j,k-1,ih,im)*rra(i,j,k,im,is)
         fdndif(i,j)= (xx*rsa(i,j,k-1,ih,im)+tta(i,j,k-1,ih,im))*denm
         fupdif= (xx+tta(i,j,k-1,ih,im)*rxa(i,j,k,im,is))*denm
         flxdn(i,j,k)=fdndir(i,j)+fdndif(i,j)-fupdif
         flxdnu(i,j,k)=-fupdif
         flxdnd(i,j,k)=fdndir(i,j)+fdndif(i,j)
        enddo
       enddo
      enddo

       do j=1, n
        do i=1, m
         flxdn(i,j,1)=1.0-rra(i,j,1,im,is)
         flxdnu(i,j,1)=-rra(i,j,1,im,is)
         flxdnd(i,j,1)=1.0
        enddo
       enddo



       do k=1,np+1
        do j=1,n
         do i=1,m
           if(ih.eq.1 .and. im.eq.1 .and. is.eq.1) then
             fclr(i,j,k)=flxdn(i,j,k)
           endif
             fall(i,j,k)=fall(i,j,k)+flxdn(i,j,k)*ct(i,j)
             fallu(i,j,k)=fallu(i,j,k)+flxdnu(i,j,k)*ct(i,j)
             falld(i,j,k)=falld(i,j,k)+flxdnd(i,j,k)*ct(i,j)
         enddo
        enddo
       enddo

        do j=1,n
         do i=1,m
            fsdir(i,j)=fsdir(i,j)+fdndir(i,j)*ct(i,j)
            fsdif(i,j)=fsdif(i,j)+fdndif(i,j)*ct(i,j)
         enddo
        enddo

  100 continue

      end subroutine cldflx



      subroutine flxco2(m,n,np,swc,swh,csm,df)






      implicit none



      integer m,n,np
      real csm(m,n),swc(m,n,np+1),swh(m,n,np+1),cah(22,19)



      real df(m,n,np+1)



      integer i,j,k,ic,iw 
      real xx,clog,wlog,dc,dw,x1,x2,y2




      data ((cah(i,j),i=1,22),j= 1, 5)/ &                                     
       0.9923, 0.9922, 0.9921, 0.9920, 0.9916, 0.9910, 0.9899, 0.9882, &      
       0.9856, 0.9818, 0.9761, 0.9678, 0.9558, 0.9395, 0.9188, 0.8945, &      
       0.8675, 0.8376, 0.8029, 0.7621, 0.7154, 0.6647, 0.9876, 0.9876, &      
       0.9875, 0.9873, 0.9870, 0.9864, 0.9854, 0.9837, 0.9811, 0.9773, &      
       0.9718, 0.9636, 0.9518, 0.9358, 0.9153, 0.8913, 0.8647, 0.8350, &      
       0.8005, 0.7599, 0.7133, 0.6627, 0.9808, 0.9807, 0.9806, 0.9805, &      
       0.9802, 0.9796, 0.9786, 0.9769, 0.9744, 0.9707, 0.9653, 0.9573, &      
       0.9459, 0.9302, 0.9102, 0.8866, 0.8604, 0.8311, 0.7969, 0.7565, &      
       0.7101, 0.6596, 0.9708, 0.9708, 0.9707, 0.9705, 0.9702, 0.9697, &      
       0.9687, 0.9671, 0.9647, 0.9612, 0.9560, 0.9483, 0.9372, 0.9221, &      
       0.9027, 0.8798, 0.8542, 0.8253, 0.7916, 0.7515, 0.7054, 0.6551, &      
       0.9568, 0.9568, 0.9567, 0.9565, 0.9562, 0.9557, 0.9548, 0.9533, &      
       0.9510, 0.9477, 0.9428, 0.9355, 0.9250, 0.9106, 0.8921, 0.8700, &      
       0.8452, 0.8171, 0.7839, 0.7443, 0.6986, 0.6486/                        
 
      data ((cah(i,j),i=1,22),j= 6,10)/  &                                    
       0.9377, 0.9377, 0.9376, 0.9375, 0.9372, 0.9367, 0.9359, 0.9345, &      
       0.9324, 0.9294, 0.9248, 0.9181, 0.9083, 0.8948, 0.8774, 0.8565, &      
       0.8328, 0.8055, 0.7731, 0.7342, 0.6890, 0.6395, 0.9126, 0.9126, &      
       0.9125, 0.9124, 0.9121, 0.9117, 0.9110, 0.9098, 0.9079, 0.9052, &      
       0.9012, 0.8951, 0.8862, 0.8739, 0.8579, 0.8385, 0.8161, 0.7900, &      
       0.7585, 0.7205, 0.6760, 0.6270, 0.8809, 0.8809, 0.8808, 0.8807, &      
       0.8805, 0.8802, 0.8796, 0.8786, 0.8770, 0.8747, 0.8712, 0.8659, &      
       0.8582, 0.8473, 0.8329, 0.8153, 0.7945, 0.7697, 0.7394, 0.7024, &      
       0.6588, 0.6105, 0.8427, 0.8427, 0.8427, 0.8426, 0.8424, 0.8422, &      
       0.8417, 0.8409, 0.8397, 0.8378, 0.8350, 0.8306, 0.8241, 0.8148, &      
       0.8023, 0.7866, 0.7676, 0.7444, 0.7154, 0.6796, 0.6370, 0.5897, &      
       0.7990, 0.7990, 0.7990, 0.7989, 0.7988, 0.7987, 0.7983, 0.7978, &      
       0.7969, 0.7955, 0.7933, 0.7899, 0.7846, 0.7769, 0.7664, 0.7528, &      
       0.7357, 0.7141, 0.6866, 0.6520, 0.6108, 0.5646/                        
 
      data ((cah(i,j),i=1,22),j=11,15)/  &                                    
       0.7515, 0.7515, 0.7515, 0.7515, 0.7514, 0.7513, 0.7511, 0.7507, &      
       0.7501, 0.7491, 0.7476, 0.7450, 0.7409, 0.7347, 0.7261, 0.7144, &      
       0.6992, 0.6793, 0.6533, 0.6203, 0.5805, 0.5357, 0.7020, 0.7020, &      
       0.7020, 0.7019, 0.7019, 0.7018, 0.7017, 0.7015, 0.7011, 0.7005, &      
       0.6993, 0.6974, 0.6943, 0.6894, 0.6823, 0.6723, 0.6588, 0.6406, &      
       0.6161, 0.5847, 0.5466, 0.5034, 0.6518, 0.6518, 0.6518, 0.6518, &      
       0.6518, 0.6517, 0.6517, 0.6515, 0.6513, 0.6508, 0.6500, 0.6485, &      
       0.6459, 0.6419, 0.6359, 0.6273, 0.6151, 0.5983, 0.5755, 0.5458, &      
       0.5095, 0.4681, 0.6017, 0.6017, 0.6017, 0.6017, 0.6016, 0.6016, &      
       0.6016, 0.6015, 0.6013, 0.6009, 0.6002, 0.5989, 0.5967, 0.5932, &      
       0.5879, 0.5801, 0.5691, 0.5535, 0.5322, 0.5043, 0.4700, 0.4308, &      
       0.5518, 0.5518, 0.5518, 0.5518, 0.5518, 0.5518, 0.5517, 0.5516, &      
       0.5514, 0.5511, 0.5505, 0.5493, 0.5473, 0.5441, 0.5393, 0.5322, &      
       0.5220, 0.5076, 0.4878, 0.4617, 0.4297, 0.3929/                        
 
      data ((cah(i,j),i=1,22),j=16,19)/ &                                     
       0.5031, 0.5031, 0.5031, 0.5031, 0.5031, 0.5030, 0.5030, 0.5029, &      
       0.5028, 0.5025, 0.5019, 0.5008, 0.4990, 0.4960, 0.4916, 0.4850, &      
       0.4757, 0.4624, 0.4441, 0.4201, 0.3904, 0.3564, 0.4565, 0.4565, &      
       0.4565, 0.4564, 0.4564, 0.4564, 0.4564, 0.4563, 0.4562, 0.4559, &      
       0.4553, 0.4544, 0.4527, 0.4500, 0.4460, 0.4400, 0.4315, 0.4194, &      
       0.4028, 0.3809, 0.3538, 0.3227, 0.4122, 0.4122, 0.4122, 0.4122, &      
       0.4122, 0.4122, 0.4122, 0.4121, 0.4120, 0.4117, 0.4112, 0.4104, &      
       0.4089, 0.4065, 0.4029, 0.3976, 0.3900, 0.3792, 0.3643, 0.3447, &      
       0.3203, 0.2923, 0.3696, 0.3696, 0.3696, 0.3696, 0.3696, 0.3696, &      
       0.3695, 0.3695, 0.3694, 0.3691, 0.3687, 0.3680, 0.3667, 0.3647, &      
       0.3615, 0.3570, 0.3504, 0.3409, 0.3279, 0.3106, 0.2892, 0.2642/        






      do k= 2, np+1
       do j= 1, n
        do i= 1, m
          xx=1./.3
          clog=log10(swc(i,j,k)*csm(i,j))
          wlog=log10(swh(i,j,k)*csm(i,j))
          ic=int( (clog+3.15)*xx+1.)
          iw=int( (wlog+4.15)*xx+1.)
          if(ic.lt.2)ic=2
          if(iw.lt.2)iw=2
          if(ic.gt.22)ic=22
          if(iw.gt.19)iw=19     
          dc=clog-float(ic-2)*.3+3.
          dw=wlog-float(iw-2)*.3+4.   
          x1=cah(1,iw-1)+(cah(1,iw)-cah(1,iw-1))*xx*dw
          x2=cah(ic-1,iw-1)+(cah(ic-1,iw)-cah(ic-1,iw-1))*xx*dw
          y2=x2+(cah(ic,iw-1)-cah(ic-1,iw-1))*xx*dc
          if (x1.lt.y2) x1=y2
          df(i,j,k)=df(i,j,k)+0.0343*(x1-y2)
        enddo     
       enddo      
      enddo      

      end subroutine flxco2



      subroutine o3prof (np, pres, ozone, its, ite, kts, kte, p, o3)


      implicit none


      integer iprof,m,np,its,ite,kts,kte
      integer i,k,ko,kk
      real pres(np),ozone(np)
      real p(its:ite,kts:kte),o3(its:ite,kts:kte)
 

 
      real Linear, x1, y1, x2, y2, x
      Linear(x1, y1, x2, y2, x) =  &
            (y1 * (x2 - x) + y2 * (x - x1)) / (x2 - x1)

      do k = 1,np
        pres(k) = alog(pres(k))
      enddo
      do k = kts,kte
        do i = its, ite
          p(i,k) = alog(p(i,k))
        end do
      end do




      do i = its, ite
        ko = 1
        do k = kts+1, kte
          do while (ko .lt. np .and. p(i,k) .gt. pres(ko))
            ko = ko + 1
          end do
          o3(i,k) =  Linear (pres(ko),   ozone(ko),    &
                             pres(ko-1), ozone(ko-1),  &
                             p(i,k))
          ko = ko - 1
        end do
      end do



      do i = its, ite
        ko = 1
        k = kts
        do while (ko .le. np .and. p(i,k) .gt. pres(ko))
           ko = ko + 1
        end do
        IF (ko-1 .le. 1) then
           O3(i,k)=ozone(k)
        ELSE
           O3(i,k)=0.
           do kk=ko-2,1,-1
              O3(i,k)=O3(i,k)+ozone(kk)*(pres(kk+1)-pres(kk))
           enddo
           O3(i,k)=O3(i,k)/(pres(ko-1)-pres(1))
        ENDIF

      end do
      
      end subroutine o3prof


    SUBROUTINE gsfc_swinit(cen_lat, allowed_to_read)

    REAL, INTENT(IN    )      ::        cen_lat
    LOGICAL, INTENT(IN    )   ::       allowed_to_read

        center_lat=cen_lat

    END SUBROUTINE gsfc_swinit


END MODULE module_ra_gsfcsw
