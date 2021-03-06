// Gmsh
m = 2;
k = 1;
Point(1) = {0, 0, 0, m};
Point(2) = {1, 0, 0, m};
Point(3) = {1, 1, 0, m};
Point(4) = {0, 1, 0, m};
Line(1) = {2, 3};
Line(2) = {3, 4};
Line(3) = {4, 1};
Line(4) = {1, 2};
Coherence;
Line Loop(5) = {4, 1, 2, 3};
Plane Surface(6) = {5};
Extrude {0, 0, 5} {
  Surface{6};
}
Point(15) = {-0.1, 1.1, 1};
Point(16) = {-0.1, 1.2, 1};
Point(17) = {-0.1, 1.2, 1.1};
Point(18) = {-0.1, 1.1, 1.1};
Line(29) = {16, 17};
Line(30) = {18, 17};
Line(31) = {18, 15};
Line(32) = {16, 15};
Line Loop(33) = {29, -30, 31, -32};
Plane Surface(34) = {33};
Extrude {1.2, 0, 0} {
  Surface{34};
}
Translate {0, -1.3, 0.5} {
  Duplicata { Volume{2}; }
}
Line(84) = {24, 46};
Line(85) = {45, 28};
Line Loop(86) = {84, -64, 85, -38};
Plane Surface(87) = {86};
Extrude {0.1, 0, 0} {
  Surface{87};
}
Circle(110) = {50, 46, 56};
Circle(111) = {54, 45, 60};
Circle(112) = {55, 24, 20};
Circle(113) = {64, 28, 19};
Line Loop(114) = {37, 94, 112};
Plane Surface(115) = {114};
Line Loop(116) = {103, 113, -39};
Plane Surface(117) = {116};
Line Loop(118) = {95, -110, -65};
Plane Surface(119) = {118};
Line Loop(120) = {99, -111, 67};
Plane Surface(121) = {120};
Line Loop(122) = {110, 90, -111, -66};
Surface(123) = {122};
Line Loop(124) = {112, -36, -113, 92};
Surface(125) = {124};
Surface Loop(126) = {123, 119, 121, 63, 100};
Volume(127) = {126};
Surface Loop(128) = {125, 115, 117, 56, 108};
Volume(129) = {128};


Translate {0, 0, 0.5} {
  Duplicata { Volume{2, 129, 58, 127, 57}; }
}
Line(267) = {29, 74};
Line(268) = {70, 30};
Line Loop(269) = {134, -267, 59, -268};
Plane Surface(270) = {269};
Extrude {-0.1, 0, 0} {
  Surface{270};
}
Circle(293) = {420, 74, 65};
Circle(294) = {419, 70, 66};
Circle(295) = {38, 29, 424};
Circle(296) = {34, 30, 428};
Line Loop(297) = {282, -295, 62};
Plane Surface(298) = {297};
Line Loop(299) = {296, -286, 60};
Plane Surface(300) = {299};
Line Loop(301) = {135, -293, -278};
Plane Surface(302) = {301};
Line Loop(303) = {294, 133, 277};
Plane Surface(304) = {303};
Line Loop(305) = {293, 132, -294, 272};
Surface(306) = {305};
Line Loop(307) = {295, 274, -296, 61};
Surface(308) = {307};
Surface Loop(309) = {58, 287, 308, 298, 300};
Volume(310) = {309};
Surface Loop(311) = {131, 306, 302, 304, 279};
Volume(312) = {311};
Translate {5, 0, 0} {
  Duplicata { Volume{1}; }
}

Line(340) = {445, 6};
Line(341) = {10, 454};
Line(342) = {438, 3};
Line(343) = {2, 429};
Line Loop(344) = {323, 340, 9, 341};
Plane Surface(345) = {344};
Line Loop(346) = {342, -1, 343, -318};
Plane Surface(347) = {346};
Extrude {0, 0, 1} {
  Surface{345};
}
Extrude {0, 0, -1} {
  Surface{347};
}
Circle(392) = {456, 445, 446};
Circle(393) = {455, 454, 450};
Circle(394) = {14, 10, 464};
Circle(395) = {5, 6, 460};
Circle(396) = {1, 2, 470};
Circle(397) = {4, 3, 466};
Circle(398) = {465, 438, 434};
Circle(399) = {474, 429, 430};
Line Loop(400) = {393, 322, 354};
Plane Surface(401) = {400};
Line Loop(402) = {363, -394, -10};
Plane Surface(403) = {402};
Line Loop(404) = {2, 397, -377};
Plane Surface(405) = {404};
Line Loop(406) = {4, 381, -396};
Plane Surface(407) = {406};
Line Loop(408) = {385, 399, -315};
Plane Surface(409) = {408};
Line Loop(410) = {392, -320, 355};
Plane Surface(411) = {410};
Line Loop(412) = {395, -359, -8};
Plane Surface(413) = {412};
Line Loop(414) = {394, -351, -395, -11};
Surface(415) = {414};
Line Loop(416) = {397, 372, -396, -3};
Surface(417) = {416};
Line Loop(418) = {399, 316, -398, -374};
Surface(419) = {418};
Line Loop(420) = {392, 321, -393, 349};
Surface(421) = {420};
Surface Loop(422) = {421, 411, 401, 356, 319};
Volume(423) = {422};
Line Loop(424) = {317, 376, 398};
Plane Surface(425) = {424};
Surface Loop(426) = {419, 409, 425, 314, 390};
Volume(427) = {426};
Surface Loop(428) = {382, 417, 405, 407, 6};
Volume(429) = {428};
Surface Loop(430) = {403, 415, 413, 364, 28};
Volume(431) = {430};
Translate {0, 0, 0.5} {
  Duplicata { Volume{312, 241, 130, 161, 185, 216, 240}; }
}

Circle(624) = {414, 410, 576};
Circle(625) = {418, 409, 572};
Line Loop(626) = {243, 624, -479};
Plane Surface(627) = {626};
Line Loop(628) = {474, -625, 245};
Plane Surface(629) = {628};
Line Loop(630) = {624, -465, -625, -244};
Surface(631) = {630};
Surface Loop(632) = {631, 627, 629, 477, 241};
Volume(633) = {632};
Extrude {-5, 0, 0} {
  Surface{598};
}
Extrude {-5, 0, 0} {
  Surface{34};
}

Point(newp) = {-5.1, -5, 10, k*m};
Point(newp) = {-5.1, 5, 10, k*m};
Point(newp) = {-5.1, -5, -5, k*m};
Point(newp) = {-5.1, 5, -5, k*m};

Line(681) = {1022, 1021};
Line(682) = {1023, 1021};
Line(683) = {1022, 1024};
Line(684) = {1024, 1023};

Line Loop(685) = {683, 684, 682, -681};
Line Loop(686) = {657, 658, 659, 660};
Line Loop(687) = {635, 636, 637, 638};
Plane Surface(688) = {685, 686, 687};

Point(newp) = {10, -5, 10, k*m};
Point(newp) = {10, 5, 10, k*m};
Point(newp) = {10, -5, -5, k*m};
Point(newp) = {10, 5, -5, k*m};
Line(689) = {1028, 1027};
Line(690) = {1028, 1026};
Line(691) = {1026, 1025};
Line(692) = {1025, 1027};
Line Loop(693) = {692, -689, 690, 691};
Plane Surface(694) = {693};
Line(695) = {1027, 1023};
Line(696) = {1024, 1028};
Line(697) = {1025, 1021};
Line(698) = {1026, 1022};
Line Loop(699) = {695, -684, 696, 689};
Plane Surface(700) = {699};
Line Loop(701) = {697, -681, -698, 691};
Plane Surface(702) = {701};
Line Loop(703) = {690, 698, 683, 696};
Plane Surface(704) = {703};
Line Loop(705) = {697, -682, -695, -692};
Plane Surface(706) = {705};

Surface Loop(709) = {706, 702, 688, 704, 694, 700, 664, 668, 672, 676, 642, 646, 650, 654, 618, 623, 608, 613, 553, 543, 563, 548, 498, 503, 508, 513, 583, 574, 579, 528, 519, 524, 226, 217, 222, 302, 306, 304, 156, 141, 146, 151, 256, 261, 266, 251, 283, 270, 291, 292, 206, 186, 196, 191, 171, 162, 167, 443, 438, 447, 472, 457, 482, 462, 629, 631, 627, 47, 51, 55, 43, 115, 125, 117, 104, 87, 96, 109, 121, 123, 119, 83, 68, 73, 78, 298, 308, 300};
Surface Loop(710) = {329, 334, 339, 324, 425, 419, 409, 391, 378, 347, 386, 417, 405, 407, 19, 23, 27, 15, 403, 415, 413, 369, 360, 345, 368, 401, 421, 411};
Volume(711) = {709, 710};

// coil
Physical Volume(1) = {634, 635, 597, 573, 542, 518, 487, 432, 456, 633, 240, 216, 185, 161, 130, 312, 241, 310, 57, 127, 58, 129, 2};

// coil terminals
Physical Surface(2) = {655, 677};

// air
Physical Volume(3) = {711};

// core
Physical Volume(4) = {315, 429, 427, 313, 423, 314, 431, 1};

// air surface
Physical Surface(5) = {704, 700, 688, 694, 706, 702, 664, 668, 676, 672, 43, 55, 51, 47, 117, 125, 115, 96, 104, 87, 109, 121, 123, 119, 68, 83, 78, 73, 300, 308, 292, 298, 283, 270, 291, 302, 306, 304, 146, 151, 141, 156, 171, 162, 167, 196, 206, 186, 191, 226, 217, 222, 256, 261, 266, 251, 627, 631, 462, 457, 482, 472, 629, 443, 447, 438, 498, 513, 503, 508, 528, 519, 553, 563, 524, 548, 543, 579, 574, 583, 618, 613, 608, 623, 642, 654, 646, 650, 23, 19, 27, 15, 405, 417, 407, 347, 386, 378, 391, 425, 419, 409, 324, 339, 329, 334, 421, 411, 401, 368, 345, 369, 360, 413, 415, 403};

// air surface & coil surface
Physical Surface(6) = {704, 700, 688, 694, 706, 702, 664, 668, 676, 672, 43, 55, 51, 47, 117, 125, 115, 96, 104, 87, 109, 121, 123, 119, 68, 83, 78, 73, 300, 308, 292, 298, 283, 270, 291, 302, 306, 304, 146, 151, 141, 156, 171, 162, 167, 196, 206, 186, 191, 226, 217, 222, 256, 261, 266, 251, 627, 631, 462, 457, 482, 472, 629, 443, 447, 438, 498, 513, 503, 508, 528, 519, 553, 563, 524, 548, 543, 579, 574, 583, 618, 613, 608, 623, 642, 654, 646, 650};

// air & core
Physical Volume(7) = {711, 429, 315, 427, 313, 423, 314, 431, 1};

// domain surface
Physical Surface(8) = {688, 704, 700, 706, 694, 702, 655, 677};


Homology {{3},{}};

Homology {{3},{5}};
//Cohomology {{3},{}};


