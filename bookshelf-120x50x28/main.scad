step = 38;
thickness = 1.5;
total_side = 28;
total_width = 50;
total_height = 120;
height_kickplate = 14;

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
 side = 26;
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

#Back();
#Side(0);
Side(total_width + thickness);
#Kickplate();

Shelf(total_height - thickness);
for (k = [ height_kickplate
         : step
         : total_height
         ]) {
 Shelf(k);
}