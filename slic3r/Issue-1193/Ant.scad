use<write.scad>
$fn=71;

fob();

translate([0.2,-0.5,0])
flap();


module fob() {
	translate([-2.1,0.5,1])
	rotate([0,0,14])
	ringTube();
	
	translate([32.1,1.2,15])
	rotate([90,90,0])
	roundedBox([30, 64.5, 1.9], 4);

	translate([5.5,-0.7,0])
	rotate([0,0,90])
	flapMount();

	translate([60.7,-0.7,0])
	rotate([0,0,90])
	flapMount();
}

module flap() {

	difference() {
	color("blue")
	translate([33,-0.7,13])
	rotate([90,90,0])
	roundedBox([26, 58, 1.4], 4);
	
	translate([8.5,-0.65,13])
	rotate([90,90,0])
	roundedBox([18, 3, 1.6], 1);

	translate([57.5,-0.65,13])
	rotate([90,90,0])
	roundedBox([18, 3, 1.6], 1);
	}
	
	translate([12,-1.40,0.5])
	Ant();
}

module Ant() {
	rotate([90,0,0])
	write("Ant",t=0.5,h=23,rotate=-5,font="knewave.dxf",space=.9);
	
	translate([0,0,0.6])
	rotate([90,0,0])
	write("Ant",t=1,h=23,rotate=-5,font="knewave.dxf",space=.9);
	
	translate([0,0,1.2])
	rotate([90,0,0])
	write("Ant",t=1.5,h=23,rotate=-5,font="knewave.dxf",space=.9);
}

module ringTube()
{
	difference() {
		cylinder(r=3.6,h=30);
		
		translate([0,0,-0.5])
		cylinder(r=2.2,h=31);
		
		translate([-3,0,0.3])
		rotate([0,-35,0])
		cube([10,10,20],true);
		
		translate([-3,0,27.7])
		rotate([0,35,0])
		cube([10,10,20],true);
	}
}

module flapMount()
{
	difference() {
		cylinder(r=3.8,h=30);
		
		translate([0,0,-0.5])
		cylinder(r=2.4,h=31);
		
		translate([-3,0,5])
		rotate([0,-40,0])
		cube([10,10,20],true);
		
		translate([-3,0,25])
		rotate([0,40,0])
		cube([10,10,20],true);

		translate([5,0,15])
		cube([8,8,30],true);
	}
}


// size is a vector [w, h, d]
module roundedBox(size, radius) {
  cube(size - [2*radius,0,0], true);
  cube(size - [0,2*radius,0], true);
  for (x = [radius-size[0]/2, -radius+size[0]/2],
       y = [radius-size[1]/2, -radius+size[1]/2]) {
    translate([x,y,0]) cylinder(r=radius, h=size[2], center=true);
  }
}