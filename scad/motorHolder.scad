
module example001()
{
	function r_from_dia(d) = d / 2;

	module rotcy(rot, r, h) {
		rotate(90, rot)
			cylinder(r = r, h = h, center = true);
	}

	difference() {
		rotcy([0, 0, 0], cy_r+5, cy_h);
		rotcy([0, 0, 0], cy_r, cy_h+1);
	}

	size = 25;
	hole = 28;
	sizeG = 5;
	union(){
		translate([0, 0, -size/2+sizeG/2])
		cube([sizeG, hole*2-1+5, sizeG], center = true);
		rotate(90,[0,0,1])
		translate([0, 0, -size/2+sizeG/2])
		cube([sizeG, hole*2-1+5, sizeG], center = true);
	}
	cy_r = r_from_dia(hole);
	cy_h = size;
}

example001();

