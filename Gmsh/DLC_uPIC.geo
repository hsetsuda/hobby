// DLC-uPIC.geo
// scale unit:cm

// Parameters
tF = 0.0025;  //FPC thickness
// tB = 0.09;  // bottom layer thickness
tB = 0.0065;  // bottom layer thickness
tP = 0.0035;  // Polyimide gluing sheet thickness
t = 0.0015;  // thickness of anode strip, readout, cathode & pickup strip
tDLC = 0.0005;  // DLC cathode thickneaa
tR = 0.05; // Rigid board thickness
pitch = 0.04; //pitch of u-PIC
la = 0.009;  //anode length
wa = 0.0175;  // anode shorter width 
wc = 0.0175;  // cathode  shorter width 
ra = 0.003;     // anode cylinder-part radius
rc = 0.0125;     // cathode hole radius

lc = 0.001;
lc_2 = 0.005;
lc_3 = 0.01;

//==========================================================================
// Point
// Anode
Point(  1) = {  0,   0,   0};  // Origin Point
Point(  2) = {  0,  ra,   0, lc};
Point(  3) = {  0, -ra,   0, lc};
Point(  4) = {  0,   0, -tF}; 
Point(  5) = {  0,  ra, -tF, lc};
Point(  6) = {  0, -ra, -tF, lc};
Point(  7) = {  0,   0, -tF-t};
Point(  8) = {  0,  ra, -tF-t, lc};
Point(  9) = {  0, -ra, -tF-t, lc};
Point( 10) = {  0,   0, -la}; 
Point( 11) = {  0,  ra, -la, lc};
Point( 12) = {  0, -ra, -la, lc};
Point( 13) = {  wa, -pitch/2, -la, lc};
Point( 14) = {  wa,  pitch/2, -la, lc};
Point( 15) = { -wa, -pitch/2, -la, lc};
Point( 16) = { -wa,  pitch/2, -la, lc};
Point( 17) = {  wa, -pitch/2, -la-t, lc};
Point( 18) = {  wa,  pitch/2, -la-t, lc};
Point( 19) = { -wa, -pitch/2, -la-t, lc};
Point( 20) = { -wa,  pitch/2, -la-t, lc};

// Anode Readout Strip
Point( 21) = {  wa, -pitch/2, -la-t-tP, lc};
Point( 22) = {  wa,  pitch/2, -la-t-tP, lc};
Point( 23) = { -wa, -pitch/2, -la-t-tP, lc};
Point( 24) = { -wa,  pitch/2, -la-t-tP, lc};
Point( 25) = {  wa, -pitch/2, -la-t-tP-t, lc};
Point( 26) = {  wa,  pitch/2, -la-t-tP-t, lc};
Point( 27) = { -wa, -pitch/2, -la-t-tP-t, lc};
Point( 28) = { -wa,  pitch/2, -la-t-tP-t, lc};

// DLC Cathode
Point( 29) = {  0,   0,  tDLC};
Point( 30) = {  0,  rc,  tDLC, lc};
Point( 31) = {  0, -rc,  tDLC, lc};
Point( 32) = {  0,  rc,  0, lc};
Point( 33) = {  0, -rc,  0, lc};
Point( 34) = {  pitch/2, -wc,  tDLC, lc};
Point( 35) = {  pitch/2,  wc,  tDLC, lc};
Point( 36) = { -pitch/2, -wc,  tDLC, lc};
Point( 37) = { -pitch/2,  wc,  tDLC, lc};
Point( 38) = {  pitch/2, -wc,  0, lc};
Point( 39) = {  pitch/2,  wc,  0, lc};
Point( 40) = { -pitch/2, -wc,  0, lc};
Point( 41) = { -pitch/2,  wc,  0, lc};

// Cathode Pickup strip
Point( 42) = {  0,  rc,  -tF, lc};
Point( 43) = {  0, -rc,  -tF, lc};
Point( 44) = {  0,  rc,  -tF-t, lc};
Point( 45) = {  0, -rc,  -tF-t, lc};
Point( 46) = {  pitch/2, -wc,  -tF, lc};
Point( 47) = {  pitch/2,  wc,  -tF, lc};
Point( 48) = { -pitch/2, -wc,  -tF, lc};
Point( 49) = { -pitch/2,  wc,  -tF, lc};
Point( 50) = {  pitch/2, -wc,  -tF-t, lc};
Point( 51) = {  pitch/2,  wc,  -tF-t, lc};
Point( 52) = { -pitch/2, -wc,  -tF-t, lc};
Point( 53) = { -pitch/2,  wc,  -tF-t, lc};

// FPC_Polyimide
Point( 54) = {  pitch/2, -pitch/2,  0, lc_2};
Point( 55) = {  pitch/2,  pitch/2,  0, lc_2};
Point( 56) = { -pitch/2, -pitch/2,  0, lc_2};
Point( 57) = { -pitch/2,  pitch/2,  0, lc_2};
Point( 58) = {  pitch/2, -pitch/2, -tF, lc_2};
Point( 59) = {  pitch/2,  pitch/2, -tF, lc_2};
Point( 60) = { -pitch/2, -pitch/2, -tF, lc_2};
Point( 61) = { -pitch/2,  pitch/2, -tF, lc_2};

/// Bottom layer(dry film)_Photo-semsitive substrate
Point( 62) = {  pitch/2, -pitch/2,  -tF-t, lc_2};
Point( 63) = {  pitch/2,  pitch/2,  -tF-t, lc_2};
Point( 64) = { -pitch/2, -pitch/2,  -tF-t, lc_2};
Point( 65) = { -pitch/2,  pitch/2,  -tF-t, lc_2};
Point( 66) = {  pitch/2, -pitch/2,  -tF-tB, lc_2};
Point( 67) = {  pitch/2,  pitch/2,  -tF-tB, lc_2};
Point( 68) = { -pitch/2, -pitch/2,  -tF-tB, lc_2};
Point( 69) = { -pitch/2,  pitch/2,  -tF-tB, lc_2};

// Polyimide Gluing Sheet(PGS)
Point( 70) = {  pitch/2, -pitch/2,  -la-t, lc_2};
Point( 71) = {  pitch/2,  pitch/2,  -la-t, lc_2};
Point( 72) = { -pitch/2, -pitch/2,  -la-t, lc_2};
Point( 73) = { -pitch/2,  pitch/2,  -la-t, lc_2};
Point( 74) = {  pitch/2, -pitch/2,  -la-t-tP, lc_2};
Point( 75) = {  pitch/2,  pitch/2,  -la-t-tP, lc_2};
Point( 76) = { -pitch/2, -pitch/2,  -la-t-tP, lc_2};
Point( 77) = { -pitch/2,  pitch/2,  -la-t-tP, lc_2};

// Rigid board
Point( 78) = {  pitch/2, -pitch/2,  -la-t-tP-t, lc_2};
Point( 79) = {  pitch/2,  pitch/2,  -la-t-tP-t, lc_2};
Point( 80) = { -pitch/2, -pitch/2,  -la-t-tP-t, lc_2};
Point( 81) = { -pitch/2,  pitch/2,  -la-t-tP-t, lc_2};
Point( 82) = {  pitch/2, -pitch/2,  -la-t-tP-t-tR, lc_2};
Point( 83) = {  pitch/2,  pitch/2,  -la-t-tP-t-tR, lc_2};
Point( 84) = { -pitch/2, -pitch/2,  -la-t-tP-t-tR, lc_2};
Point( 85) = { -pitch/2,  pitch/2,  -la-t-tP-t-tR, lc_2};

// Gas area (Drift electrode point)
Point( 86) = {  pitch/2, -pitch/2,  0.5, lc_3};
Point( 87) = {  pitch/2,  pitch/2,  0.5, lc_3};
Point( 88) = { -pitch/2, -pitch/2,  0.5, lc_3};
Point( 89) = { -pitch/2,  pitch/2,  0.5, lc_3};


// Line--------------------------------------------------------------------------------
// Anode
Circle(  1) = {  2,  1,  3}; //horizontal
Circle(  2) = {  3,  1,  2};
Circle(  3) = {  5,  4,  6};
Circle(  4) = {  6,  4,  5};
Circle(  5) = {  8,  7,  9};
Circle(  6) = {  9,  7,  8};
Circle(  7) = { 11, 10, 12};
Circle(  8) = { 12, 10, 11};
Line(  9) = { 13, 14};
Line( 10) = { 14, 16};
Line( 11) = { 15, 16};
Line( 12) = { 13, 15};
Line( 13) = { 17, 18};
Line( 14) = { 18, 20};
Line( 15) = { 19, 20};
Line( 16) = { 17, 19};
Line( 17) = {  2,  5};  //vertical
Line( 18) = {  3,  6};
Line( 19) = {  5,  8};
Line( 20) = {  6,  9};
Line( 21) = {  8, 11};
Line( 22) = {  9, 12};
Line( 23) = { 13, 17};
Line( 24) = { 14, 18};
Line( 25) = { 15, 19};
Line( 26) = { 16, 20};

// Readout
Line( 27) = { 21, 22};  //horizontal
Line( 28) = { 22, 24};
Line( 29) = { 23, 24};
Line( 30) = { 21, 23};
Line( 31) = { 25, 26};
Line( 32) = { 26, 28};
Line( 33) = { 27, 28};
Line( 34) = { 25, 27};
Line( 35) = { 21, 25};  //vertical
Line( 36) = { 22, 26};
Line( 37) = { 23, 27};
Line( 38) = { 24, 28};

// DLC
// share Anode Point( 1)
Circle( 39) = { 30, 29, 31}; //horizontal
Circle( 40) = { 31, 29, 30};
Circle( 41) = { 32,  1, 33};
Circle( 42) = { 33,  1, 32};
Line( 43) = { 34, 35};
Line( 44) = { 35, 37};
Line( 45) = { 36, 37};
Line( 46) = { 34, 36};
Line( 47) = { 38, 39};
Line( 48) = { 39, 41};
Line( 49) = { 40, 41};
Line( 50) = { 38, 40};
Line( 51) = { 30, 32};  //vertical
Line( 52) = { 31, 33};
Line( 53) = { 34, 38};
Line( 54) = { 35, 39};
Line( 55) = { 36, 40};
Line( 56) = { 37, 41};

// Pickup
// share Anode Point( 4, 7)
Circle( 57) = { 42,  4, 43}; //horizontal
Circle( 58) = { 43,  4, 42};
Circle( 59) = { 44,  7, 45};
Circle( 60) = { 45,  7, 44};
Line( 61) = { 46, 47};
Line( 62) = { 47, 49};
Line( 63) = { 48, 49};
Line( 64) = { 46, 48};
Line( 65) = { 50, 51};
Line( 66) = { 51, 53};
Line( 67) = { 52, 53};
Line( 68) = { 50, 52};
Line( 69) = { 42, 44};  //vertical
Line( 70) = { 43, 45};
Line( 71) = { 46, 50};
Line( 72) = { 47, 51};
Line( 73) = { 48, 52};
Line( 74) = { 49, 53};

// FPC
// share DLC Point( 38, 39, 40, 41)
// share Pickup Point( 46, 47, 48, 49)
Line( 75) = { 54, 38};  //horizontal
Line( 76) = { 39, 55};
Line( 77) = { 55, 57};
Line( 78) = { 56, 40};
Line( 79) = { 41, 57};
Line( 80) = { 54, 56};
Line( 81) = { 58, 46};
Line( 82) = { 47, 59};
Line( 83) = { 59, 61};
Line( 84) = { 60, 48};
Line( 85) = { 49, 61};
Line( 86) = { 58, 60};
Line( 87) = { 54, 58};  //vertical
Line( 88) = { 55, 59};
Line( 89) = { 56, 60};
Line( 90) = { 57, 61};

// Bottom layer
// share Anode Point( 13, 14, 15, 16)
// share Pickup Point( 50, 51, 52, 53)
// share FPC Point( 58, 59, 60, 61)
Line( 97) = { 66, 67};
Line( 98) = { 67, 14};
Line( 99) = { 16, 69};
Line(100) = { 68, 69};
Line(101) = { 66, 13};
Line(102) = { 15, 68};
Line(103) = { 62, 66};  //vertical
Line(104) = { 63, 67};
Line(105) = { 64, 68};
Line(106) = { 65, 69};
Line(201) = { 58, 62};  //Edit from DLC
Line(202) = { 59, 63};  //Edit from DLC
Line(203) = { 60, 64};  //Edit from DLC
Line(204) = { 61, 65};  //Edit from DLC

// PGS
// share Anode Point( 17, 18, 19, 20)
// share Readout Point( 21, 22, 23, 24)
Line(107) = { 70, 71};  //horizontal
Line(108) = { 71, 18};
Line(109) = { 20, 73};
Line(110) = { 72, 73};
Line(111) = { 70, 17};
Line(112) = { 19, 72};
Line(113) = { 74, 75};
Line(114) = { 75, 22};
Line(115) = { 24, 77};
Line(116) = { 76, 77};
Line(117) = { 74, 21};
Line(118) = { 23, 76};
Line(119) = { 70, 74};  //vertical
Line(120) = { 71, 75};
Line(121) = { 72, 76};
Line(122) = { 73, 77};

// Rigid
// share Readout Point( 25, 26, 27, 28)
Line(123) = { 78, 79};  //horizontal
Line(124) = { 79, 26};
Line(125) = { 28, 81};
Line(126) = { 80, 81};
Line(127) = { 78, 25};
Line(128) = { 27, 80};
Line(129) = { 82, 83};
Line(130) = { 83, 85};
Line(131) = { 84, 85};
Line(132) = { 82, 84};
Line(133) = { 78, 82};  //vertical
Line(134) = { 79, 83};
Line(135) = { 80, 84};
Line(136) = { 81, 85};

// Gas
// share FPC Point( 54, 55, 56, 57)
Line(137) = { 86, 87};  //horizontal
Line(138) = { 87, 89};
Line(139) = { 88, 89};
Line(140) = { 86, 88};
Line(141) = { 86, 54};  //vertical
Line(142) = { 87, 55};
Line(143) = { 88, 56};
Line(144) = { 89, 57};

// Line Loop---------------------------------------------------------------
// Anode
Line loop(  1) = {  1,  2}; //circle
Line loop(  2) = {  3,  4}; //circle
Line loop(  3) = {  5,  6}; //circle
Line loop(  4) = {  7,  8}; //circle
Line loop(  5) = {  9, 10, -11, -12};
Line loop(  6) = { 13, 14, -15, -16};
Line loop(  7) = {  1, 18,  -3, -17}; //Ruled
Line loop(  8) = {  2, 17,  -4, -18}; //Ruled
Line loop(  9) = {  3, 20,  -5, -19}; //Ruled
Line loop( 10) = {  4, 19,  -6, -20}; //Ruled
Line loop( 11) = {  5, 22,  -7, -21}; //Ruled
Line loop( 12) = {  6, 21,  -8, -22}; //Ruled
Line loop( 13) = { 23, 13, -24,  -9};
Line loop( 14) = { 24, 14, -26, -10};
Line loop( 15) = { 25, 15, -26, -11};
Line loop( 16) = { 23, 16, -25, -12};

// Readout
Line loop( 17) = { 27, 28, -29, -30};
Line loop( 18) = { 31, 32, -33, -34};
Line loop( 19) = { 35, 31, -36, -27};
Line loop( 20) = { 36, 32, -38, -28};
Line loop( 21) = { 37, 33, -38, -29};
Line loop( 22) = { 35, 34, -37, -30};

// DLC
Line loop( 23) = { 39, 40}; //circle
Line loop( 24) = { 41, 42}; //circle
Line loop( 25) = { 43, 44, -45, -46};
Line loop( 26) = { 47, 48, -49, -50};
Line loop( 27) = { 39, 52, -41, -51}; //Ruled
Line loop( 28) = { 40, 51, -42, -52}; //Ruled
Line loop( 29) = { 53, 47, -54, -43};
Line loop( 30) = { 54, 48, -56, -44};
Line loop( 31) = { 55, 49, -56, -45};
Line loop( 32) = { 53, 50, -55, -46};

// Pickup
Line loop( 33) = { 57, 58}; //circle
Line loop( 34) = { 59, 60}; //circle
Line loop( 35) = { 61, 62, -63, -64};
Line loop( 36) = { 65, 66, -67, -68};
Line loop( 37) = { 57, 70, -59, -69}; //Ruled
Line loop( 38) = { 58, 69, -60, -70}; //Ruled
Line loop( 39) = { 71, 65, -72, -61};
Line loop( 40) = { 72, 66, -74, -62};
Line loop( 41) = { 73, 67, -74, -63};
Line loop( 42) = { 71, 68, -73, -64};

// FPC
// share DLC Line( 50, 48, 47, 49)
// share pickup Line( 64, 62, 61, 63)
Line loop( 43) = { 75, 50, -78, -80};
Line loop( 44) = { 76, 77, -79, -48};
Line loop( 45) = { 81, 64, -84, -86};
Line loop( 46) = { 82, 83, -85, -62};
Line loop( 47) = { 87, 81,  61,  82, -88, -76, -47, -75};
Line loop( 48) = { 88, 83, -90, -77};
Line loop( 49) = { 89, 84,  63,  85, -90, -79, -49, -78};
Line loop( 50) = { 87, 86, -89, -80};

// Bottom layer
// share Anode Line(  9, 11, 10, 12)
// share Pickup Line( 68, 66, 65, 67)
Line loop( 51) = {201,103, 97,-104,-202, -82,  72, -65, -71, -81};
Line loop( 52) = {202,104, 98,  10,  99,-106,-204, -83};
Line loop( 53) = {203,105,100,-106,-204, -85,  74, -67, -73, -84};
Line loop( 54) = {201,103,101,  12, 102,-105,-203, -86};
Line loop( 55) = { 97, 98,  -9,-101};
Line loop( 56) = { 11, 99,-100,-102};

// PGS
// share Anode Line( 13, 14, 15, 16)
// share Readout Line( 27, 28, 29, 30)
Line loop( 59) = { 107, 108,  -13, -111};
Line loop( 60) = {  15, 109, -110, -112};
Line loop( 61) = { 113, 114,  -27, -117};
Line loop( 62) = {  29, 115, -116, -118};
Line loop( 63) = { 119, 113, -120, -107};
Line loop( 64) = { 120, 114,   28,  115, -122, -109,  -14, -108};
Line loop( 65) = { 121, 116, -122, -110};
Line loop( 66) = { 119, 117,   30,  118, -121, -112,  -16, -111};

// Rigid
// share Readout Line( 31, 32, 33, 34)
Line loop( 67) = { 123, 124,  -31, -127};
Line loop( 68) = {  33, 125, -126, -128};
Line loop( 69) = { 129, 130, -131, -132};
Line loop( 70) = { 133, 129, -134, -123};
Line loop( 71) = { 134, 130, -136, -125,  -32, -124};
Line loop( 72) = { 135, 131, -136, -126};
Line loop( 73) = { 133, 132, -135, -128,  -34, -127};

// Gas
// share DLC Line( 53, 43, 54, 55, 45, 56)
// share FPC Line( 75, 76, 77, 78, 79, 80)
Line loop( 74) = { 137, 138, -139, -140};
Line loop( 75) = { 141,  75,  -53,   43,   54,   76, -142, -137};
Line loop( 76) = { 142,  77, -144, -138};
Line loop( 77) = { 143,  78,  -55,   45,   56,   79, -144, -139};
Line loop( 78) = { 141,  80, -143, -140};


// Surface----------------------------------------------------------------------
// Anode
Plane Surface(  1) = {  1};
Plane Surface(  2) = {  4,  5};
Plane Surface(  3) = {  6};
Ruled Surface(  4) = {  7};
Ruled Surface(  5) = {  8};
Ruled Surface(  6) = {  9};
Ruled Surface(  7) = { 10};
Ruled Surface(  8) = { 11};
Ruled Surface(  9) = { 12};
Plane Surface( 10) = { 13};
Plane Surface( 11) = { 14};
Plane Surface( 12) = { 15};
Plane Surface( 13) = { 16};

// Readout
Plane Surface( 14) = { 17};
Plane Surface( 15) = { 18};
Plane Surface( 16) = { 19};
Plane Surface( 17) = { 20};
Plane Surface( 18) = { 21};
Plane Surface( 19) = { 22};

// DLC
Plane Surface( 20) = { 23, 25};
Plane Surface( 21) = { 24, 26};
Ruled Surface( 22) = { 27};
Ruled Surface( 23) = { 28};
Plane Surface( 24) = { 29};
Plane Surface( 25) = { 30};
Plane Surface( 26) = { 31};
Plane Surface( 27) = { 32};

// Pickup
Plane Surface( 28) = { 33, 35};
Plane Surface( 29) = { 34, 36};
Ruled Surface( 30) = { 37};
Ruled Surface( 31) = { 38};
Plane Surface( 32) = { 39};
Plane Surface( 33) = { 40};
Plane Surface( 34) = { 41};
Plane Surface( 35) = { 42};

// FPC
// share Anode Line loop( 1, 2)
// share DLC Line loop( 24)
// share Pickup Line loop( 33)
Plane Surface( 36) = { 24,  1}; // Disk shape
Plane Surface( 37) = { 33,  2}; // Disk shape
Plane Surface( 38) = { 43};
Plane Surface( 39) = { 44};
Plane Surface( 40) = { 45};
Plane Surface( 41) = { 46};
Plane Surface( 42) = { 47};
Plane Surface( 43) = { 48};
Plane Surface( 44) = { 49};
Plane Surface( 45) = { 50};

// bottom layer
// share Anode Line loop( 3)
// share Pickup Line loop( 33)
Plane Surface( 47) = { 51};
Plane Surface( 48) = { 52};
Plane Surface( 49) = { 53};
Plane Surface( 50) = { 54};
Plane Surface( 51) = { 55};
Plane Surface( 52) = { 56};

// PGS
Plane Surface( 55) = { 59};
Plane Surface( 56) = { 60};
Plane Surface( 57) = { 61};
Plane Surface( 58) = { 62};
Plane Surface( 59) = { 63};
Plane Surface( 60) = { 64};
Plane Surface( 61) = { 65};
Plane Surface( 62) = { 66};

// Rigid
Plane Surface( 63) = { 67};
Plane Surface( 64) = { 68};
Plane Surface( 65) = { 69};
Plane Surface( 66) = { 70};
Plane Surface( 67) = { 71};
Plane Surface( 68) = { 72};
Plane Surface( 69) = { 73};

// Gas
Plane Surface( 70) = { 74};
Plane Surface( 71) = { 75};
Plane Surface( 72) = { 76};
Plane Surface( 73) = { 77};
Plane Surface( 74) = { 78};


// Surface Loop----------------------------------------------------------------------
// Gas
// share Anode Surface( 1)
// share DLC Surface( 20, 22, 23, 25, 27)
// share FPC Surface( 36, 38, 39)
Surface loop(  1) = {  1, 20, 22, 23, 25, 27, 36, 38, 39, 70, 71, 72, 73, 74};

//  Anode
Surface loop(  2) = {  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13};

// Readout
Surface loop(  3) = { 14, 15, 16, 17, 18, 19};

// DLC
Surface loop(  4) = { 20, 21, 22, 23, 24, 25, 26, 27};

// Pickup
Surface loop(  5) = { 28, 29, 30, 31, 32, 33, 34, 35};

// FPC
// share Anode Surface( 4, 5)
// share DLC Surface( 21)
// share Pickup Surface( 28)
Surface loop(  6) = {  4,  5, 21, 28, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45};

// Bottom layer
// share Anode Surface( 2, 8, 9)
// share Pickup Surface( 29)
Surface loop(  7) = {  2,  6,  7,  8,  9, 29, 30, 31, 33, 35, 37, 40, 41, 47, 48, 49, 50, 51, 52};

// Polyimide Gluing Sheet
// share Anode Surface( 3)
// share Pickup Surface( 14)
Surface loop(  8) = {  3, 14, 55, 56, 57, 58, 59, 60, 61, 62};

// Rigid board
// share Pickup Surface( 15)
Surface loop(  9) = { 15, 63, 64, 65, 66, 67, 68, 69};


// Volume----------------------------------------------------------------------------
Volume( 1) = { 1};
Volume( 2) = { 2};
Volume( 3) = { 3};
Volume( 4) = { 4};
Volume( 5) = { 5};
Volume( 6) = { 6};
Volume( 7) = { 7};
Volume( 8) = { 8};
Volume( 9) = { 9};


//========================================================================

// Physical Surface
// Anode
Physical Surface( 1)  = {  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13};
// Readout
Physical Surface( 2)  = { 14, 15, 16, 17, 18, 19};
// DLC
Physical Surface( 3)  = { 20, 21, 22, 23, 24, 25, 26, 27};
// Pickup
Physical Surface( 4)  = { 28, 29, 30, 31, 32, 33, 34, 35};
// Drift electrode
Physical Surface( 5)  = { 70};  // Top surface of drift area

// (Periodically)Boundary
Physical Surface( 6)  = { 24, 32, 42, 47, 59, 66, 71};
Physical Surface( 7)  = { 11, 17, 43, 48, 60, 67, 72};
Physical Surface( 8)  = { 26, 34, 44, 49, 61, 68, 73};
Physical Surface( 9)  = { 13, 19, 45, 50, 62, 69, 74};
Physical Surface(10) = { 65};  // Bottom surface of all

// Physical Volume
// gas
Physical Volume( 1) = { 1};
// Anode
Physical Volume( 2) = { 2};
// Readout
Physical Volume( 3) = { 3};
// DLC
Physical Volume( 4) = { 4};
// Pickup
Physical Volume( 5) = { 5};
// FPC
Physical Volume( 6) = { 6};
// Bottom layer
Physical Volume( 7) = { 7};
// Polyimid Gluing Sheet 
Physical Volume( 8) = { 8};
// Rigid Board
Physical Volume( 9) = { 9};

