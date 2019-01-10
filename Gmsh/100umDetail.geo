// copy of 100um-u-PIC.geo
// devide gas area at z=1.5mm

// Parameters
um = 0.0001;	// um=1e-6m

ha = 25*um;  // each of anode pillar parts height  
tB = 500*um;  // bottom layer thickness
t =  5*um;  // thickness of anode top,strip and cathode 
pitch = 400*um; // pitch of u-PIC
wa =  350/2*um;  // anode shorter width 
wc =  350/2*um;  // cathode  shorter width 
ra =  50/2*um;     // anode radius
rc =  250/2*um;     // cathode hole radius

zd1 =  400*um;  // Drift plane position of z
zd2 =  1500*um;  // Drift plane position of z
zd3 =  5000*um;  // Drift plane position of z

lc =   0.001;
lc_2 = 0.005;
lc_3 = 0.01;

//==========================================================================
// Point
// Anode
Point(  1) = {  0,   0,   t};
Point(  2) = {  0,  ra,   t,   lc};
Point(  3) = {  0, -ra,   t,   lc};
Point(  4) = {  0,   0,   0}; 
Point(  5) = {  0,  ra,   0,   lc};
Point(  6) = {  0, -ra,   0,   lc};
Point(  7) = {  0,   0, -ha};
Point(  8) = {  0,  ra, -ha,   lc};
Point(  9) = {  0, -ra, -ha,   lc};
Point( 10) = {  0,   0, -ha*2}; 
Point( 11) = {  0,  ra, -ha*2, lc};
Point( 12) = {  0, -ra, -ha*2, lc};
Point( 13) = {  0,   0, -ha*3};
Point( 14) = {  0,  ra, -ha*3, lc};
Point( 15) = {  0, -ra, -ha*3, lc};
Point( 16) = {  0,   0, -ha*4}; 
Point( 17) = {  0,  ra, -ha*4, lc};
Point( 18) = {  0, -ra, -ha*4, lc};
Point( 19) = {  wa, -pitch/2, -ha*4, lc};
Point( 20) = {  wa,  pitch/2, -ha*4, lc};
Point( 21) = { -wa, -pitch/2, -ha*4, lc};
Point( 22) = { -wa,  pitch/2, -ha*4, lc};
Point( 23) = {  wa, -pitch/2, -ha*4-t, lc};
Point( 24) = {  wa,  pitch/2, -ha*4-t, lc};
Point( 25) = { -wa, -pitch/2, -ha*4-t, lc};
Point( 26) = { -wa,  pitch/2, -ha*4-t, lc};

// Cathode
Point( 27) = {  0,  rc,  t, lc};
Point( 28) = {  0, -rc,  t, lc};
Point( 29) = {  0,  rc,  0, lc};
Point( 30) = {  0, -rc,  0, lc};
Point( 31) = {  pitch/2, -wc,  t, lc};
Point( 32) = {  pitch/2,  wc,  t, lc};
Point( 33) = { -pitch/2, -wc,  t, lc};
Point( 34) = { -pitch/2,  wc,  t, lc};
Point( 35) = {  pitch/2, -wc,  0, lc};
Point( 36) = {  pitch/2,  wc,  0, lc};
Point( 37) = { -pitch/2, -wc,  0, lc};
Point( 38) = { -pitch/2,  wc,  0, lc};

// Insulating layer
Point( 39) = {  pitch/2, -pitch/2,  0, lc_2};
Point( 40) = {  pitch/2,  pitch/2,  0, lc_2};
Point( 41) = { -pitch/2, -pitch/2,  0, lc_2};
Point( 42) = { -pitch/2,  pitch/2,  0, lc_2};
Point( 43) = {  pitch/2, -pitch/2, -ha*4, lc_2};
Point( 44) = {  pitch/2,  pitch/2, -ha*4, lc_2};
Point( 45) = { -pitch/2, -pitch/2, -ha*4, lc_2};
Point( 46) = { -pitch/2,  pitch/2, -ha*4, lc_2};

// Bottom layer
Point( 47) = {  pitch/2, -pitch/2,  -ha*4-t, lc_2};
Point( 48) = {  pitch/2,  pitch/2,  -ha*4-t, lc_2};
Point( 49) = { -pitch/2, -pitch/2,  -ha*4-t, lc_2};
Point( 50) = { -pitch/2,  pitch/2,  -ha*4-t, lc_2};
Point( 51) = {  pitch/2, -pitch/2,  -ha*4-t-tB, lc_2};
Point( 52) = {  pitch/2,  pitch/2,  -ha*4-t-tB, lc_2};
Point( 53) = { -pitch/2, -pitch/2,  -ha*4-t-tB, lc_2};
Point( 54) = { -pitch/2,  pitch/2,  -ha*4-t-tB, lc_2};

// Gas area (Drift electrode point)
Point( 55) = {  pitch/2, -pitch/2,  zd1, lc};
Point( 56) = {  pitch/2,  pitch/2,  zd1, lc};
Point( 57) = { -pitch/2, -pitch/2,  zd1, lc};
Point( 58) = { -pitch/2,  pitch/2,  zd1, lc};
Point( 59) = {  pitch/2, -pitch/2,  zd2, lc_3};
Point( 60) = {  pitch/2,  pitch/2,  zd2, lc_3};
Point( 61) = { -pitch/2, -pitch/2,  zd2, lc_3};
Point( 62) = { -pitch/2,  pitch/2,  zd2, lc_3};
Point( 63) = {  pitch/2, -pitch/2,  zd3, lc_3};
Point( 64) = {  pitch/2,  pitch/2,  zd3, lc_3};
Point( 65) = { -pitch/2, -pitch/2,  zd3, lc_3};
Point( 66) = { -pitch/2,  pitch/2,  zd3, lc_3};


// Line--------------------------------------------------------------------------------
// Anode
Circle(  1) = {  2,  1,  3};
Circle(  2) = {  3,  1,  2};
Circle(  3) = {  5,  4,  6};
Circle(  4) = {  6,  4,  5};
Circle(  5) = {  8,  7,  9};
Circle(  6) = {  9,  7,  8};
Circle(  7) = { 11, 10, 12};
Circle(  8) = { 12, 10, 11};
Circle(  9) = { 14, 13, 15};
Circle( 10) = { 15, 13, 14};
Circle( 11) = { 17, 16, 18};
Circle( 12) = { 18, 16, 17};
Line( 13) = { 19, 20};
Line( 14) = { 20, 22};
Line( 15) = { 21, 22};
Line( 16) = { 19, 21};
Line( 17) = { 23, 24};
Line( 18) = { 24, 26};
Line( 19) = { 25, 26};
Line( 20) = { 23, 25};

Line( 21) = {  2,  5};
Line( 22) = {  3,  6};
Line( 23) = {  5,  8};
Line( 24) = {  6,  9};
Line( 25) = {  8, 11};
Line( 26) = {  9, 12};
Line( 27) = { 11, 14};
Line( 28) = { 12, 15};
Line( 29) = { 14, 17};
Line( 30) = { 15, 18};
Line( 31) = { 19, 23};
Line( 32) = { 20, 24};
Line( 33) = { 21, 25};
Line( 34) = { 22, 26};

// Cathode
Circle( 35) = { 27,  1, 28};
Circle( 36) = { 28,  1, 27};
Circle( 37) = { 29,  4, 30};
Circle( 38) = { 30,  4, 29};
Line( 39) = { 31, 32};
Line( 40) = { 32, 34};
Line( 41) = { 33, 34};
Line( 42) = { 31, 33};
Line( 43) = { 35, 36};
Line( 44) = { 36, 38};
Line( 45) = { 37, 38};
Line( 46) = { 35, 37};

Line( 47) = { 27, 29};
Line( 48) = { 28, 30};
Line( 49) = { 31, 35};
Line( 50) = { 32, 36};
Line( 51) = { 33, 37};
Line( 52) = { 34, 38};

// Insulater
Line( 53) = { 39, 35};
Line( 54) = { 36, 40};
Line( 55) = { 40, 42};
Line( 56) = { 41, 37};
Line( 57) = { 38, 42};
Line( 58) = { 39, 41};
Line( 59) = { 43, 44};
Line( 60) = { 44, 20};
Line( 61) = { 22, 46};
Line( 62) = { 45, 46};
Line( 63) = { 43, 19};
Line( 64) = { 21, 45};

Line( 65) = { 39, 43};
Line( 66) = { 40, 44};
Line( 67) = { 41, 45};
Line( 68) = { 42, 46};

// Bottom
Line( 69) = { 47, 48};
Line( 70) = { 48, 24};
Line( 71) = { 26, 50};
Line( 72) = { 49, 50};
Line( 73) = { 47, 23};
Line( 74) = { 25, 49};
Line( 75) = { 51, 52};
Line( 76) = { 52, 54};
Line( 77) = { 53, 54};
Line( 78) = { 51, 53};

Line( 79) = { 47, 51};
Line( 80) = { 48, 52};
Line( 81) = { 49, 53};
Line( 82) = { 50, 54};

// Gas
Line( 83) = { 55, 56};
Line( 84) = { 56, 58};
Line( 85) = { 57, 58};
Line( 86) = { 55, 57};
Line( 87) = { 55, 39};
Line( 88) = { 56, 40};
Line( 89) = { 57, 41};
Line( 90) = { 58, 42};

Line( 91) = { 59, 60};
Line( 92) = { 60, 62};
Line( 93) = { 61, 62};
Line( 94) = { 59, 61};
Line( 95) = { 59, 55};
Line( 96) = { 60, 56};
Line( 97) = { 61, 57};
Line( 98) = { 62, 58};

Line( 99) = { 63, 64};
Line(100) = { 64, 66};
Line(101) = { 65, 66};
Line(102) = { 63, 65};
Line(103) = { 63, 59};
Line(104) = { 64, 60};
Line(105) = { 65, 61};
Line(106) = { 66, 62};

// Line Loop---------------------------------------------------------------
// Anode
Line loop(  1) = {  1,  2}; //circle
Line loop(  2) = {  3,  4}; //circle
Line loop(  3) = {  5,  6}; //circle
Line loop(  4) = {  7,  8}; //circle
Line loop(  5) = {  9, 10}; //circle
Line loop(  6) = { 11, 12}; //circle
Line loop(  7) = { 13, 14, -15, -16};
Line loop(  8) = { 17, 18, -19, -20};

Line loop(  9) = {  1, 22,  -3, -21}; //Ruled
Line loop( 10) = {  2, 21,  -4, -22}; //Ruled
Line loop( 11) = {  3, 24,  -5, -23}; //Ruled
Line loop( 12) = {  4, 23,  -6, -24}; //Ruled
Line loop( 13) = {  5, 26,  -7, -25}; //Ruled
Line loop( 14) = {  6, 25,  -8, -26}; //Ruled
Line loop( 15) = {  7, 28,  -9, -27}; //Ruled
Line loop( 16) = {  8, 27, -10, -28}; //Ruled
Line loop( 17) = {  9, 30, -11, -29}; //Ruled
Line loop( 18) = { 10, 29, -12, -30}; //Ruled
Line loop( 19) = { 31, 17, -32, -13};
Line loop( 20) = { 32, 18, -34, -14};
Line loop( 21) = { 33, 19, -34, -15};
Line loop( 22) = { 31, 20, -33, -16};

// Cathode
Line loop( 23) = { 35, 36}; //circle
Line loop( 24) = { 37, 38}; //circle
Line loop( 25) = { 39, 40, -41, -42};
Line loop( 26) = { 43, 44, -45, -46};
Line loop( 27) = { 35, 48, -37, -47}; //Ruled
Line loop( 28) = { 36, 47, -38, -48}; //Ruled
Line loop( 29) = { 49, 43, -50, -39};
Line loop( 30) = { 50, 44, -52, -40};
Line loop( 31) = { 51, 45, -52, -41};
Line loop( 32) = { 49, 46, -51, -42};

// Insulater
Line loop( 33) = { 53, 46, -56, -58};
Line loop( 34) = { 54, 55, -57, -44};
Line loop( 35) = { 59, 60, -13, -63};
Line loop( 36) = { 15, 61, -62, -64};

Line loop( 37) = { 65, 59, -66, -54, -43, -53};
Line loop( 38) = { 66, 60,  14,  61, -68, -55};
Line loop( 39) = { 67, 62, -68, -57, -45, -56};
Line loop( 40) = { 65, 63,  16,  64, -67, -58};

// Bottom
Line loop( 41) = { 69, 70, -17, -73};
Line loop( 42) = { 19, 71, -72, -74};
Line loop( 43) = { 75, 76, -77, -78};
Line loop( 44) = { 79, 75, -80, -69};
Line loop( 45) = { 80, 76, -82, -71, -18, -70};
Line loop( 46) = { 81, 77, -82, -72};
Line loop( 47) = { 79, 78, -81, -74, -20, -73};

// Gas
/*Line loop( 48) = { 91, 92, -93, -94};
Line loop( 49) = { 95, 87, 53, -49,  39,  50,  54, -88, -96, -91};
Line loop( 50) = { 96, 88, 55, -90, -98, -92};
Line loop( 51) = { 97, 89, 56, -51,  41,  52,  57, -90, -98, -93};
Line loop( 52) = { 95, 87, 58, -89, -97, -94};
*/
Line loop( 48) = { 99,100,-101,-102};
Line loop( 49) = {103, 95, 87, 53, -49,  39,  50,  54, -88, -96,-104, -99};
Line loop( 50) = {104, 96, 88, 55, -90, -98,-106,-100};
Line loop( 51) = {105, 97, 89, 56, -51,  41,  52,  57, -90, -98,-106,-101};
Line loop( 52) = {103, 95, 87, 58, -89, -97,-105,-102};


// Surface----------------------------------------------------------------------
// Anode
Plane Surface(  1) = {  1};
Plane Surface(  2) = {  7,  6};
Plane Surface(  3) = {  8};

Ruled Surface(  4) = {  9};
Ruled Surface(  5) = { 10};
Ruled Surface(  6) = { 11};
Ruled Surface(  7) = { 12};
Ruled Surface(  8) = { 13};
Ruled Surface(  9) = { 14};
Ruled Surface( 10) = { 15};
Ruled Surface( 11) = { 16};
Ruled Surface( 12) = { 17};
Ruled Surface( 13) = { 18};
Plane Surface( 14) = { 19};
Plane Surface( 15) = { 20};
Plane Surface( 16) = { 21};
Plane Surface( 17) = { 22};

// Cathode
Plane Surface( 18) = { 23, 25};
Plane Surface( 19) = { 24, 26};
Ruled Surface( 20) = { 27};
Ruled Surface( 21) = { 28};
Plane Surface( 22) = { 29};
Plane Surface( 23) = { 30};
Plane Surface( 24) = { 31};
Plane Surface( 25) = { 32};

// Insulater
Plane Surface( 26) = { 24,  2}; // Disk shape
Plane Surface( 27) = { 33};
Plane Surface( 28) = { 34};
Plane Surface( 29) = { 35};
Plane Surface( 30) = { 36};
Plane Surface( 31) = { 37};
Plane Surface( 32) = { 38};
Plane Surface( 33) = { 39};
Plane Surface( 34) = { 40};

// Bottom
Plane Surface( 35) = { 41};
Plane Surface( 36) = { 42};
Plane Surface( 37) = { 43};
Plane Surface( 38) = { 44};
Plane Surface( 39) = { 45};
Plane Surface( 40) = { 46};
Plane Surface( 41) = { 47};

// Gas
Plane Surface( 42) = { 48};
Plane Surface( 43) = { 49};
Plane Surface( 44) = { 50};
Plane Surface( 45) = { 51};
Plane Surface( 46) = { 52};

//-----------------------------------------------------
//boundary
Line(301) = { 43, 47};
Line(302) = { 44, 48};
Line(303) = { 45, 49};
Line(304) = { 46, 50};
Line loop(301) = { 301, 69, -302, -59}; Plane Surface(301) = {301};
Line loop(302) = { 302, 70,  -32, -60}; Plane Surface(302) = {302};
Line loop(303) = {  34, 71, -304, -61}; Plane Surface(303) = {303};
Line loop(304) = { 303, 72, -304, -62}; Plane Surface(304) = {304};
Line loop(305) = { 301, 73,  -31, -63}; Plane Surface(305) = {305};
Line loop(306) = {  33, 74, -303, -64}; Plane Surface(306) = {306};

// Surface Loop----------------------------------------------------------------------
// Gas
Surface loop(  1) = { 42, 43, 44, 45, 46,
                      27, 25, 18, 20, 21, 26,  1,  4,  5, 23, 28};
//  Anode
Surface loop(  2) = {  1,  2,  3,  4,  5,  6,  7,  8,  9,
                      10, 11, 12, 13, 14, 15, 16, 17};
// Cathode
Surface loop(  3) = { 18, 19, 20, 21, 22, 23, 24, 25};

// Insulater
Surface loop(  4) = { 26, 27, 28, 29, 30, 31, 32, 33, 34,
                      19,  6,  7,  8,  9, 10, 11, 12, 13,  2};
// Bottom
Surface loop(  5) = { 35, 36, 37, 38, 39, 40, 41,  3};

// Volume----------------------------------------------------------------------------
Volume( 1) = { 1};
Volume( 2) = { 2};
Volume( 3) = { 3};
Volume( 4) = { 4};
Volume( 5) = { 5};


//========================================================================
// Physical Surface
// Anode
Physical Surface( 1)  = {  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16, 17};
// Cathode
Physical Surface( 2)  = { 18, 19, 20, 21, 22, 23, 24, 25};
// Drift electrode
Physical Surface( 3)  = { 42};  // Top surface of drift area

// (Periodically)Boundary
Physical Surface( 4)  = { 22, 31, 38, 43, 301};
Physical Surface( 5)  = { 15, 32, 39, 44, 302, 303};
Physical Surface( 6)  = { 24, 33, 40, 45, 304};
Physical Surface( 7)  = { 17, 34, 41, 46, 305};
Physical Surface( 8) = { 37};  // Bottom surface of all

// Physical Volume
// Gas
Physical Volume( 1) = { 1};
// Anode
Physical Volume( 2) = { 2};
// Cathode
Physical Volume( 3) = { 3};
// Insulating layer
Physical Volume( 4) = { 4};
// Bottom
Physical Volume( 5) = { 5};

