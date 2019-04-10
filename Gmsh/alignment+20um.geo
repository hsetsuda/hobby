// LTCC_u-PIC.geo
//

// Parameters
tc = 0.005;  // LTCC ceramic thickness 
tB = 0.05;  // bottom layer thickness
t = 0.0005;  // thickness of anode strip & cathode 
pitch = 0.04; // pitch of u-PIC
wa = 0.035/2;  // anode shorter width 
wC = 0.035/2;  // cathode  shorter width 
r5 = 0.005/2;     // anode radius for diameter 50um
r7 = 0.007/2;     // anode radius for diameter 70um
r10 = 0.010/2;    // anode radius for diameter 100um
rC = 0.025/2;    // Cathode radius 
hD1 = 0.05; // Drift Plane height from z=0
hD2 = 0.1;  // Drift Plane height from z=0
hD3 = 0.5;  // Drift Plane height from z=0
d=0.0020; //difference for alignment check

lc =  0.001;
lc2 = 0.005;
lc3 = 0.01;

//==========================================================================
// Point
Point(  0) = {  0,   0,   0};  // Origin Point

// 1st layer
Point(  1) = {  pitch/2, -pitch/2,   0, lc}; 
Point(  2) = {  pitch/2,  pitch/2,   0, lc}; 
Point(  3) = { -pitch/2, -pitch/2,   0, lc}; 
Point(  4) = { -pitch/2,  pitch/2,   0, lc}; 
Point(  5) = {  pitch/2, -pitch/2, -tc, lc2}; 
Point(  6) = {  pitch/2,  pitch/2, -tc, lc2}; 
Point(  7) = { -pitch/2, -pitch/2, -tc, lc2}; 
Point(  8) = { -pitch/2,  pitch/2, -tc, lc2};
Point(  9) = { 0,  r5,   0, lc}; 
Point( 10) = { 0, -r5,   0, lc}; 
Point( 11) = { 0,   0, -tc}; 
Point( 12) = { 0,  r5, -tc, lc}; 
Point( 13) = { 0, -r5, -tc, lc}; 

// 2nd layer
Point( 14) = {  pitch/2, -pitch/2, -tc*2, lc2}; 
Point( 15) = {  pitch/2,  pitch/2, -tc*2, lc2}; 
Point( 16) = { -pitch/2, -pitch/2, -tc*2, lc2}; 
Point( 17) = { -pitch/2,  pitch/2, -tc*2, lc2};
//Point( 18) = { 0,  r7, -tc, lc}; 
//Point( 19) = { 0, -r7, -tc, lc}; 
Point( 20) = { 0+d,   0, -tc*2}; 
Point( 21) = { 0+d,  r7, -tc*2, lc}; 
Point( 22) = { 0+d, -r7, -tc*2, lc}; 

// 3rd layer
Point( 23) = {  pitch/2, -pitch/2, -tc*3, lc2}; 
Point( 24) = {  pitch/2,  pitch/2, -tc*3, lc2}; 
Point( 25) = { -pitch/2, -pitch/2, -tc*3, lc2}; 
Point( 26) = { -pitch/2,  pitch/2, -tc*3, lc2};
//Point( 27) = { 0,  r10, -tc*2, lc}; 
//Point( 28) = { 0, -r10, -tc*2, lc}; 
Point( 29) = { 0+d,   0, -tc*3}; 
Point( 30) = { 0+d,  r10, -tc*3, lc}; 
Point( 31) = { 0+d, -r10, -tc*3, lc}; 

// 4th layer
Point( 32) = {  pitch/2, -pitch/2, -tc*4, lc2}; 
Point( 33) = {  pitch/2,  pitch/2, -tc*4, lc2}; 
Point( 34) = { -pitch/2, -pitch/2, -tc*4, lc2}; 
Point( 35) = { -pitch/2,  pitch/2, -tc*4, lc2};
Point( 36) = { 0+d,   0, -tc*4}; 
Point( 37) = { 0+d,  r10, -tc*4, lc}; 
Point( 38) = { 0+d, -r10, -tc*4, lc}; 

// anode strip
Point( 39) = {  wa, -pitch/2, -tc*4, lc}; 
Point( 40) = {  wa,  pitch/2, -tc*4, lc}; 
Point( 41) = { -wa, -pitch/2, -tc*4, lc}; 
Point( 42) = { -wa,  pitch/2, -tc*4, lc};
Point( 43) = {  wa, -pitch/2, -tc*4-t, lc}; 
Point( 44) = {  wa,  pitch/2, -tc*4-t, lc}; 
Point( 45) = { -wa, -pitch/2, -tc*4-t, lc}; 
Point( 46) = { -wa,  pitch/2, -tc*4-t, lc};

// bottom
Point( 47) = {  pitch/2, -pitch/2, -tc*4-t, lc2}; 
Point( 48) = {  pitch/2,  pitch/2, -tc*4-t, lc2}; 
Point( 49) = { -pitch/2, -pitch/2, -tc*4-t, lc2}; 
Point( 50) = { -pitch/2,  pitch/2, -tc*4-t, lc2}; 
Point( 51) = {  pitch/2, -pitch/2, -tc*4-t-tB, lc2}; 
Point( 52) = {  pitch/2,  pitch/2, -tc*4-t-tB, lc2}; 
Point( 53) = { -pitch/2, -pitch/2, -tc*4-t-tB, lc2}; 
Point( 54) = { -pitch/2,  pitch/2, -tc*4-t-tB, lc2};

// Gas
Point( 55) = {  pitch/2, -pitch/2, hD1, lc}; 
Point( 56) = {  pitch/2,  pitch/2, hD1, lc}; 
Point( 57) = { -pitch/2, -pitch/2, hD1, lc}; 
Point( 58) = { -pitch/2,  pitch/2, hD1, lc}; 
Point( 59) = {  pitch/2, -pitch/2, hD2, lc3}; 
Point( 60) = {  pitch/2,  pitch/2, hD2, lc3}; 
Point( 61) = { -pitch/2, -pitch/2, hD2, lc3}; 
Point( 62) = { -pitch/2,  pitch/2, hD2, lc3}; 
Point( 63) = {  pitch/2, -pitch/2, hD3, lc3}; 
Point( 64) = {  pitch/2,  pitch/2, hD3, lc3}; 
Point( 65) = { -pitch/2, -pitch/2, hD3, lc3}; 
Point( 66) = { -pitch/2,  pitch/2, hD3, lc3}; 

// Cathode & Anode top
Point(101) = {  pitch/2, -wC,   0, lc}; 
Point(102) = {  pitch/2,  wC,   0, lc}; 
Point(103) = { -pitch/2, -wC,   0, lc}; 
Point(104) = { -pitch/2,  wC,   0, lc}; 
Point(105) = {  pitch/2, -wC,   t, lc}; 
Point(106) = {  pitch/2,  wC,   t, lc}; 
Point(107) = { -pitch/2, -wC,   t, lc}; 
Point(108) = { -pitch/2,  wC,   t, lc};  
Point(109) = { 0,  rC,  0, lc}; 
Point(110) = { 0, -rC,  0, lc}; 
Point(111) = { 0,   0,  t}; 
Point(112) = { 0,  r5,  t, lc}; 
Point(113) = { 0, -r5,  t, lc}; 
Point(114) = { 0,  rC,  t, lc}; 
Point(115) = { 0, -rC,  t, lc}; 



// Line----------------------------------------------------------------------
// 1st
Line(  1) = {  1,101};
Line(201) = {102,  2};
Line(  2) = {  2,  4};
Line(  3) = {  3,103};
Line(202) = {104,  4};
Line(  4) = {  1,  3};
Line(  5) = {  5,  6};
Line(  6) = {  6,  8};
Line(  7) = {  7,  8};
Line(  8) = {  5,  7};
Line(  9) = {  1,  5};
Line( 10) = {  2,  6};
Line( 11) = {  3,  7};
Line( 12) = {  4,  8};
Circle( 13) = {  9,  0, 10};
Circle( 14) = { 10,  0,  9};
Circle(203) = {109,  0,110};
Circle(204) = {110,  0,109};
Circle( 15) = { 12, 11, 13};
Circle( 16) = { 13, 11, 12};
Line( 17) = {  9, 12};
Line( 18) = { 10, 13};

// 2nd
Line( 19) = { 14, 15};
Line( 20) = { 15, 17};
Line( 21) = { 16, 17};
Line( 22) = { 14, 16};
Line( 23) = {  5, 14};
Line( 24) = {  6, 15};
Line( 25) = {  7, 16};
Line( 26) = {  8, 17};
//Circle( 27) = { 18, 11, 19};
//Circle( 28) = { 19, 11, 18};
Circle( 29) = { 21, 20, 22};
Circle( 30) = { 22, 20, 21};
Line( 31) = { 12, 21};
Line( 32) = { 13, 22};


// 3rd
Line( 33) = { 23, 24};
Line( 34) = { 24, 26};
Line( 35) = { 25, 26};
Line( 36) = { 23, 25};
Line( 37) = { 14, 23};
Line( 38) = { 15, 24};
Line( 39) = { 16, 25};
Line( 40) = { 17, 26};
//Circle( 41) = { 27, 20, 28};
//Circle( 42) = { 28, 20, 27};
Circle( 43) = { 30, 29, 31};
Circle( 44) = { 31, 29, 30};
Line( 45) = { 21, 30};
Line( 46) = { 22, 31};

// 4th
Line( 47) = { 32, 33};
Line( 48) = { 33, 40};
Line( 49) = { 42, 35};
Line( 50) = { 34, 35};
Line( 51) = { 32, 39};
Line( 52) = { 41, 34};
Line( 53) = { 23, 32};
Line( 54) = { 24, 33};
Line( 55) = { 25, 34};
Line( 56) = { 26, 35};
Circle( 57) = { 37, 36, 38};
Circle( 58) = { 38, 36, 37};
Line( 59) = { 30, 37};
Line( 60) = { 31, 38};

// anode strip
Line( 61) = { 39, 40};
Line( 62) = { 40, 42};
Line( 63) = { 41, 42};
Line( 64) = { 39, 41};
Line( 65) = { 43, 44};
Line( 66) = { 44, 46};
Line( 67) = { 45, 46};
Line( 68) = { 43, 45};
Line( 69) = { 39, 43};
Line( 70) = { 40, 44};
Line( 71) = { 41, 45};
Line( 72) = { 42, 46};

// bottom
Line( 73) = { 47, 48};
Line( 74) = { 48, 44};
Line( 75) = { 46, 50};
Line( 76) = { 49, 50};
Line( 77) = { 47, 43};
Line( 78) = { 45, 49};
Line( 79) = { 51, 52};
Line( 80) = { 52, 54};
Line( 81) = { 53, 54};
Line( 82) = { 51, 53};
Line( 83) = { 47, 51};
Line( 84) = { 48, 52};
Line( 85) = { 49, 53};
Line( 86) = { 50, 54};

// gas
Line( 87) = { 55, 56};
Line( 88) = { 56, 58};
Line( 89) = { 57, 58};
Line( 90) = { 55, 57};
Line( 91) = { 55,  1};
Line( 92) = { 56,  2};
Line( 93) = { 57,  3};
Line( 94) = { 58,  4};
Line( 95) = { 59, 60};
Line( 96) = { 60, 62};
Line( 97) = { 61, 62};
Line( 98) = { 59, 61};
Line( 99) = { 59, 55};
Line(100) = { 60, 56};
Line(101) = { 61, 57};
Line(102) = { 62, 58};
Line(103) = { 63, 64};
Line(104) = { 64, 66};
Line(105) = { 65, 66};
Line(106) = { 63, 65};
Line(107) = { 63, 59};
Line(108) = { 64, 60};
Line(109) = { 65, 61};
Line(110) = { 66, 62};
// Cathode & Anode top
Line(205) = {101,102};
Line(206) = {102,104};
Line(207) = {103,104};
Line(208) = {101,103};
Line(209) = {105,106};
Line(210) = {106,108};
Line(211) = {107,108};
Line(212) = {105,107};
Line(213) = {105,101};
Line(214) = {106,102};
Line(215) = {107,103};
Line(216) = {108,104};
Circle(217) = {112,111,113};
Circle(218) = {113,111,112};
Circle(219) = {114,111,115};
Circle(220) = {115,111,114};
Line(221) = {112,  9};
Line(222) = {113, 10};
Line(223) = {114,109};
Line(224) = {115,110};


// Line Loop---------------------------------------------------
// 1st
Line loop(101) = {  1,208,  -3,  -4};
Line loop(102) = {201,  2,-202,-206};
Line loop(  2) = {  5,  6,  -7,  -8};
Line loop(  3) = {  9,  5, -10,-201,-205,  -1};
Line loop(  4) = { 10,  6, -12,  -2};
Line loop(  5) = { 11,  7, -12,-202,-207,  -3};
Line loop(  6) = {  9,  8, -11,  -4};
Line loop(  7) = { 13, 14};
Line loop(  8) = { 15, 16};
Line loop(  9) = { 13, 18, -15, -17};
Line loop( 10) = { 14, 17, -16, -18};

// 2nd
Line loop( 11) = { 19, 20, -21, -22};
Line loop( 12) = { 23, 19, -24,  -5};
Line loop( 13) = { 24, 20, -26,  -6};
Line loop( 14) = { 25, 21, -26,  -7};
Line loop( 15) = { 23, 22, -25,  -8};
//Line loop( 16) = { 27, 28};
Line loop( 17) = { 29, 30};
Line loop( 18) = { 15, 32, -29, -31};
Line loop( 19) = { 16, 31, -30, -32};

// 3rd
Line loop( 20) = { 33, 34, -35, -36};
Line loop( 21) = { 37, 33, -38, -19};
Line loop( 22) = { 38, 34, -40, -20};
Line loop( 23) = { 39, 35, -40, -21};
Line loop( 24) = { 37, 36, -39, -22};
//Line loop( 25) = { 41, 42};
Line loop( 26) = { 43, 44};
Line loop( 27) = { 29, 46, -43, -45};
Line loop( 28) = { 30, 45, -44, -46};

// 4th
Line loop( 29) = { 47, 48, -61, -51};
Line loop( 30) = { 63, 49, -50, -52};
Line loop( 31) = { 53, 47, -54, -33};
Line loop( 32) = { 54, 48,  62,  49, -56, -34};
Line loop( 33) = { 55, 50, -56, -35};
Line loop( 34) = { 53, 51,  64,  52, -55, -36};
Line loop( 35) = { 57, 58};
Line loop( 36) = { 43, 60, -57, -59};
Line loop( 37) = { 44, 59, -58, -60};

// anode srip
Line loop( 38) = { 61, 62, -63, -64};
Line loop( 39) = { 65, 66, -67, -68};
Line loop( 40) = { 69, 65, -70, -61};
Line loop( 41) = { 70, 66, -72, -62};
Line loop( 42) = { 71, 67, -72, -63};
Line loop( 43) = { 69, 68, -71, -64};

// bottom
Line loop( 44) = { 73, 74, -65, -77};
Line loop( 45) = { 67, 75, -76, -78};
Line loop( 46) = { 79, 80, -81, -82};
Line loop( 47) = { 83, 79, -84, -73};
Line loop( 48) = { 84, 80, -86, -75, -66, -74};
Line loop( 49) = { 85, 81, -86, -76};
Line loop( 50) = { 83, 82, -85, -78, -68, -77};

// gas
Line loop( 51) = {103,104,-105,-106};
Line loop( 52) = {107, 99, 91,  1,-213, 209, 214, 201, -92,-100,-108,-103};
Line loop( 53) = {108,100, 92,  2, -94,-102,-110,-104};
Line loop( 54) = {109,101, 93,  3,-215, 211, 216, 202, -94,-102,-110,-105};
Line loop( 55) = {107, 99, 91,  4, -93,-101,-109,-106};

// Cathode & Anode top
Line loop(103) = {205,206,-207,-208};
Line loop(104) = {209,210,-211,-212};
Line loop(105) = {213,205,-214,-209};
Line loop(106) = {214,206,-216,-210};
Line loop(107) = {215,207,-216,-211};
Line loop(108) = {213,208,-215,-212};
Line loop(109) = {217,218};
Line loop(110) = {203,204};
Line loop(111) = {219,220};
Line loop(112) = {217,222, -13,-221};
Line loop(113) = {218,221, -14,-222};
Line loop(114) = {219,224,-203,-223};
Line loop(115) = {220,223,-204,-224};

// Surface----------------------------------------------------------------------
// 1st
Plane Surface(101) = {101};
Plane Surface(102) = {102};
Plane Surface(  2) = {  2, 8};
Plane Surface(  3) = {  3};
Plane Surface(  4) = {  4};
Plane Surface(  5) = {  5};
Plane Surface(  6) = {  6};
Ruled Surface(  7) = {  9};
Ruled Surface(  8) = { 10};

// 2nd
//Plane Surface(  9) = {  8, 16};
Plane Surface( 10) = { 11, 17};
Plane Surface( 11) = { 12};
Plane Surface( 12) = { 13};
Plane Surface( 13) = { 14};
Plane Surface( 14) = { 15};
Ruled Surface( 15) = { 18};
Ruled Surface( 16) = { 19};

// 3rd
//Plane Surface( 17) = { 17, 25};
Plane Surface( 18) = { 20, 26};
Plane Surface( 19) = { 21};
Plane Surface( 20) = { 22};
Plane Surface( 21) = { 23};
Plane Surface( 22) = { 24};
Ruled Surface( 23) = { 27};
Ruled Surface( 24) = { 28};

// 4th
Plane Surface( 25) = { 29};
Plane Surface( 26) = { 30};
Plane Surface( 27) = { 31};
Plane Surface( 28) = { 32};
Plane Surface( 29) = { 33};
Plane Surface( 30) = { 34};
Ruled Surface( 31) = { 36};
Ruled Surface( 32) = { 37};

// anode strip
Plane Surface( 33) = { 38, 35};
Plane Surface( 34) = { 39};
Plane Surface( 35) = { 40};
Plane Surface( 36) = { 41};
Plane Surface( 37) = { 42};
Plane Surface( 38) = { 43};

// bottom
Plane Surface( 39) = { 44};
Plane Surface( 40) = { 45};
Plane Surface( 41) = { 46};
Plane Surface( 42) = { 47};
Plane Surface( 43) = { 48};
Plane Surface( 44) = { 49};
Plane Surface( 45) = { 50};

// gas
Plane Surface( 46) = { 51};
Plane Surface( 47) = { 52};
Plane Surface( 48) = { 53};
Plane Surface( 49) = { 54};
Plane Surface( 50) = { 55};

// Cathode & Anode top
Plane Surface(103) = {103,110};
Plane Surface(104) = {110,  7};
Plane Surface(105) = {104,111};
Plane Surface(106) = {109}; //anode top
Plane Surface(107) = {105};
Plane Surface(108) = {106};
Plane Surface(109) = {107};
Plane Surface(110) = {108};
Ruled Surface(111) = {112};
Ruled Surface(112) = {113};
Ruled Surface(113) = {114};
Ruled Surface(114) = {115};

// for boundary-------------------------------- 
Line(301) = { 32, 47};
Line(302) = { 33, 48};
Line(303) = { 34, 49};
Line(304) = { 35, 50};
Line loop(301) = {301, 73,-302, -47};
Line loop(302) = {302, 74, -70, -48};
Line loop(303) = { 72, 75,-304, -49};
Line loop(304) = {303, 76,-304, -50};
Line loop(305) = {301, 77, -69, -51};
Line loop(306) = { 71, 78,-303, -52};
Plane Surface(301) = {301};
Plane Surface(302) = {302};
Plane Surface(303) = {303};
Plane Surface(304) = {304};
Plane Surface(305) = {305};
Plane Surface(306) = {306};
//----------------------------------------------


// Surface Loop----------------------------------------------------------------------
// gas 
Surface loop(  1) = { 46, 47, 48, 49, 50,101,102,104,105,106,108,110,111,112,113,114};
// anode
Surface loop(  2) = {  7,  8, 15, 16, 23, 24, 31, 32, 33, 34, 35, 36, 37, 38,106,111,112};
// cathode
Surface loop(  3) = {103,105,107,108,109,110,113,114};
// bottom
Surface loop(  4) = { 39, 40, 41, 42, 43, 44, 45, 34};
// LTCC1
Surface loop(  5) = {  2,  3,  4,  5,  6,  7,  8,101,102,103,104};
// LTCC2
Surface loop(  6) = {  2, 10, 11, 12, 13, 14, 15, 16};
// LTCC3
Surface loop(  7) = { 10, 18, 19, 20, 21, 22, 23, 24};
// LTCC4
Surface loop(  8) = { 18, 25, 26, 27, 28, 29, 30, 31, 32, 33};

// Volume----------------------------------------------------------------------------
Volume( 1) = { 1};
Volume( 2) = { 2};
Volume( 3) = { 3};
Volume( 4) = { 4};

Volume( 5) = { 5};
Volume( 6) = { 6};
Volume( 7) = { 7};
Volume( 8) = { 8};



//========================================================================
// Physical Surface
// Anode
Physical Surface( 1)  = {  7,  8, 15, 16, 17, 23, 24, 31, 32, 33, 34, 35, 36, 37, 38,106,111,112};
// Cathode
Physical Surface( 2)  = {103,105,107,108,109,110,113,114};
// Drift electrode
Physical Surface( 3)  = { 46};  // Top surface of drift area

// (Periodically)Boundary
Physical Surface( 4)  = {  3, 11, 19, 27,     42, 47,107,    301};
Physical Surface( 5)  = {  4, 12, 20, 28, 36, 43, 48,    302,303};
Physical Surface( 6)  = {  5, 13, 21, 29,     44, 49,109,    304};
Physical Surface( 7)  = {  6, 14, 22, 30, 38, 45, 50,    305,306};
Physical Surface( 8) = { 41};  // Bottom surface of all

// Physical Volume
// gas
Physical Volume( 1) = { 1};
// Anode
Physical Volume( 2) = { 2};
// Cathode
Physical Volume( 3) = { 3};
// bottom
Physical Volume( 4) = { 4};
// LTCC1
Physical Volume( 5) = { 5};
// LTCC2
Physical Volume( 6) = { 6};
// LTCC3
Physical Volume( 7) = { 7};
// LTCC4
Physical Volume( 8) = { 8};

