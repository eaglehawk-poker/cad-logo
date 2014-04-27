use <Spiff.scad>;

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
	card(20, 30, 3);

	color([1.0, 0.0, 0.0, 1.0])
	difference() {
		translate([25, 0, 0])
		rotate([0,0,-25])
		card(20, 30, 3);

		translate([0,-50, -5])
		cube([13, 100, 20]);
	}
}

// Cards
translate([-12.5, 2.5, 29])
rotate([90, 0, 0])
logo_cards();

// Bottom
color([0.0, 0.0, 0.0, 1.0])
translate([-30, -15, 0])
cube([60, 30, 9]);

//Text
color([1.0, 0.0, 0.0, 1.0])
translate([-15, -16, 2])
scale([0.5, 2, 0.5])
rotate([90, 0, 0])
write("eaglehawk");
