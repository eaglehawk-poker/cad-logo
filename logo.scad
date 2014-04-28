//use <Spiff.scad>;
use <TextGenerator.scad>;
//use <Write.scad>;

module card(width, height, radius) {
	thickness = 5;
	inner_height = height - 2*radius;
	inner_width = width - 2*radius;

	c1_x = -inner_width / 2;
	c1_y = inner_height / 2;
	c2_x = inner_width / 2;
	c2_y = inner_height / 2;
	c3_x = -inner_width / 2;
	c3_y = -inner_height / 2;
	c4_x = inner_width / 2;
	c4_y = -inner_height / 2;
	
	union () {
		translate([c1_x, c1_y, 0])
		cylinder(r=radius, h=thickness, center=false, $fs=0.01);

		translate([c2_x, c2_y, 0])
		cylinder(r=radius, h=thickness, center=false, $fs=0.01);

		translate([c3_x, c3_y, 0])
		cylinder(r=radius, h=thickness, center=false, $fs=0.01);

		translate([c4_x, c4_y, 0])
		cylinder(r=radius, h=thickness, center=false, $fs=0.01);


		translate([-width/2, -inner_height/2, 0])
		cube([width, inner_height, thickness]);

		translate([-inner_width/2, -height/2, 0])
		cube([inner_width, height, thickness]);
	}
}

module logo_cards() {

	color([0.0, 0.0, 0.0, 1.0])
	card(20, 32, 3);

	color([1.0, 0.0, 0.0, 1.0])
	difference() {
		translate([25, 0, 0])
		rotate([0,0,-25])
		card(20, 30, 3);

		translate([0,-50, -5])
		cube([13, 100, 20]);
	}
}

module plate(dx, dy, dz) {
	difference() {
		translate([-dx/2, -dy/2, -dz/2])
		cube([dx, dy, dz]);

		translate([-dx/2, dy/2, dz/2])
		rotate([0, 90, 0])
		cylinder(h=dx, r=1, $fn=100);

		translate([-dx/2, -dy/2, dz/2])
		rotate([0, 90, 90])
		cylinder(h=dy, r=1, $fn=100);

		translate([dx/2, -dy/2, dz/2])
		rotate([0, 90, 180])
		cylinder(h=dx, r=1, $fn=100);

		translate([dx/2, dy/2, dz/2])
		rotate([0, 90, 270])
		cylinder(h=dy, r=1, $fn=100);
	}
}

module whole_shebang() {

	union() {
		// Cards
		//translate([-12.5, 2.5, 29])
		translate([-11.5, 2.5, 22])
		rotate([90, 0, 0])
		logo_cards();

		// Bottom
		//color([0.0, 0.0, 0.7, 1.0])
		color([1.0, 1.0, 1.0, 1.0])
		
		translate([0, 0, 4])
		plate(60, 30, 11);
		translate([0, 0, -1])
		plate(62, 32, 2);
		//cube([60, 30, 9]);

		// Sticks


		//Text
		color([1.0, 0.0, 0.0, 1.0])
		translate([-15, -13, 2])
		scale([0.6, 3, 0.6])
		rotate([90, 0, 0])
		drawtext("eaglehawk");
		//write("eaglehawk");
	}
}

whole_shebang();

//Text
//color([1.0, 0.0, 0.0, 1.0])
//translate([-15, -15, 2])
//rotate([90, 0, 0])
//scale([2., 2, 2.5])
//write("Hello World");
