step = 400;
thickness = 15;
total_side = 320;
total_width = 650;
total_height = 1800;
height_kickplate = 140;

module Side(x) {
 translate([x, 0, 0]) {
  cube([ thickness
       , total_side
       , total_height], false);
 }
}

module Back() {
 translate([thickness, 0, 0]) {
  cube([ total_width
       , thickness
       , total_height], false);
 }
}

module Shelf(z) {
 side = 300;
 translate([ thickness
           , thickness
           , z]) {
  cube([ total_width
       , side
       , thickness], false);
 }
}

module Kickplate() {
 translate([ thickness
           , total_side - thickness
           , 0]) {
  cube([ total_width
       , thickness
       , height_kickplate], false);
 }
}

Back();
#Side(0);
#Side(650 + thickness);
#Kickplate();

for (k = [ height_kickplate
         : step
         : total_height
         ]) {
 Shelf(k);
}