
module screw(type = 2, r1 = 15, r2 = 20, n = 7, h = 100, t = 8)
{
	
	//			translate([-h/2,0,0]){
	linear_extrude(height = h, twist = 360*t/n, convexity = t)
	difference() {
		circle(r2);
		for (i = [0:n-1]) {
				if (type == 1) rotate(i*360/n) polygon([
						[ 2*r2, 0 ],
						[ r2, 0 ],
						[ r1*cos(180/n), r1*sin(180/n) ],
						[ r2*cos(360/n), r2*sin(360/n) ],
						[ 2*r2*cos(360/n), 2*r2*sin(360/n) ],
				]);
				if (type == 2) rotate(i*360/n) polygon([
						[ 2*r2, 0 ],
						[ r2, 0 ],
						[ r1*cos(90/n), r1*sin(90/n) ],
						[ r1*cos(180/n), r1*sin(180/n) ],
						[ r2*cos(270/n), r2*sin(270/n) ],
						[ 2*r2*cos(270/n), 2*r2*sin(270/n) ],
				]);
		}
	//}
}
}

module nut(type = 2, r1 = 16, r2 = 21, r3 = 30, s = 6, n = 7, h = 100/5, t = 8/5)
{
	difference() {
		cylinder($fn = s, r = r3, h = h);
		translate([ 0, 0, -h/2 ]) screw(type, r1, r2, n, h*2*5, t*2*10);
	}
}
module nut2(type = 2, r1 = 16, r2 = 21, r3 = 30, s = 6, n = 7, h = 100/5, t = 8/5)
{
	difference(){
union(){
	difference() {
		cylinder($fn = s, r = r3, h = h);
		translate([ 0, 0, -h/2 ]) screw(type, r1, r2, n, h*2, t*2);
	}

	rotate([90,0,0])

translate([0,h/2,-h/2])
	difference() {
		cylinder($fn = s, r = r3, h = h);
		translate([ 0, 0, -h/2 ]) screw(type, r1, r2, n, h*2, t*2);

	}}
	translate([ 0, 0, -h/2 ]) screw(type, r1, r2, n, h*2, t*2);
		rotate([-90,0,0])translate([0, -h/2,-h/2])translate([ 0, 0, -h/2 ])screw(type, r1, r2, n, h*2, t*2);
}
}
module spring(r1 = 100, r2 = 10, h = 100, hr = 12)
{
	stepsize = 1/16;
	module segment(i1, i2) {
		alpha1 = i1 * 360*r2/hr;
		alpha2 = i2 * 360*r2/hr;
		len1 = sin(acos(i1*2-1))*r2;
		len2 = sin(acos(i2*2-1))*r2;
		if (len1 < 0.01)
			polygon([
				[ cos(alpha1)*r1, sin(alpha1)*r1 ],
				[ cos(alpha2)*(r1-len2), sin(alpha2)*(r1-len2) ],
				[ cos(alpha2)*(r1+len2), sin(alpha2)*(r1+len2) ]
			]);
		if (len2 < 0.01)
			polygon([
				[ cos(alpha1)*(r1+len1), sin(alpha1)*(r1+len1) ],
				[ cos(alpha1)*(r1-len1), sin(alpha1)*(r1-len1) ],
				[ cos(alpha2)*r1, sin(alpha2)*r1 ],
			]);
		if (len1 >= 0.01 && len2 >= 0.01)
			polygon([
				[ cos(alpha1)*(r1+len1), sin(alpha1)*(r1+len1) ],
				[ cos(alpha1)*(r1-len1), sin(alpha1)*(r1-len1) ],
				[ cos(alpha2)*(r1-len2), sin(alpha2)*(r1-len2) ],
				[ cos(alpha2)*(r1+len2), sin(alpha2)*(r1+len2) ]
			]);
	}
	linear_extrude(height = 100, twist = 180*h/hr,
			$fn = (hr/r2)/stepsize, convexity = 5) {
		for (i = [ stepsize : stepsize : 1+stepsize/2 ])
			segment(i-stepsize, min(i, 1));
	}
}
/*
translate([ -30, 0, 0 ])
rotate([ 90, 0, 0 ])
scale([0.25,0.25,0.25])
screw();
*/
module stickScrew(l = [0,0,0],h=500,sh=100){
	translate(l){
		translate([ 0, 0, h ])
		screw(h=sh);
		cylinder($fn = 60, r = 20, h = h);
		translate([ 0, 0, -100])
		screw(h=sh);
	}
}



module example001()
{
	function r_from_dia(d) = d / 2;

	module rotcy(rot, r, h) {
		rotate(90, rot)
		//	scale([0.25,0.25,0.25])
				screw();
			//cylinder(r = r, h = h, center = true);
	}

	difference() {

		sphere(r = r_from_dia(size));
translate([0,0,-50])
		rotcy([0, 0, 0], cy_r, cy_h);
translate([0,50,0])
		rotcy([1, 0, 0], cy_r, cy_h);
translate([-50,0,0])
		rotcy([0, 1, 0], cy_r, cy_h);
	}

	size = 100;
	hole = 50;

	cy_r = r_from_dia(hole);
	cy_h = r_from_dia(size * 2.5);
}
//scale([0.15,0.15,0.15])
//example001();

//scale([0.13,0.13,0.13])
//screw();9
rotate([0,0,0])
scale(0.27,0.27,0.27)
nut2(h=100,t=8,s=6);
/*
translate([ 0, 0, 0 ]){
//size([30,0,0])

difference(){
union(){
nut();
translate([0,100,100])
rotate([90,0,0])
nut();
}

//screw(h=1000);
}
}
*/