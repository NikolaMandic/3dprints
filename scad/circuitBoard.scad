
	r1=0.7;
	transistorSpacing=2.5;
	module pin(x,y){
		translate([x, y, 0])
		cylinder(r = r1, h = 5,center=true);

	}	
module transistor(x, y,r) {

		translate([x, y, 0]){
		rotate(90, r){
		cylinder(r = r1, h = 5,center=true);

		translate([transistorSpacing, 0, 0])
		cylinder(r = r1, h = 5,center=true);


		translate([transistorSpacing*2, 0, 0])
		cylinder(r = r1, h = 5,center=true);
}}

	}
	module 78LO(x, y,r) {
		translate([x, y, 0]){
		rotate(90, r){
		cylinder(r = r1, h = 5,center=true);
		translate([transistorSpacing, 0, 0])
		cylinder(r = r1, h = 5,center=true);

		translate([transistorSpacing*2, 0, 0])
		cylinder(r = r1, h = 5,center=true);
		}}
	}
	module diode(x,y,r){
		translate([x, y, 0]){
		rotate(90, r){
		
		cylinder(r = r1, h = 5,center=true);
		
		translate([15, 0, 0])
		cylinder(r = r1, h = 5,center=true);
		}}
	}

	module motor(x,y,r){

		translate([x, y, 0]){
		rotate(90, r){
		cylinder(r = r1, h = 5,center=true);
		
		translate([6, 0, 0])
		cylinder(r = r1, h = 5,center=true);
		}}
	}
	module resistor(x,y,r){

		translate([x, y, 0]){
		rotate(90, r){
		cylinder(r = r1, h = 5,center=true);
		
		translate([15, 0, 0])
		cylinder(r = r1, h = 5,center=true);
		}
		}
	}
	module LM317(x, y,r) {
		translate([x, y, 0]){
		rotate(90, r){
		cylinder(r = r1, h = 5,center=true);
		translate([transistorSpacing+0.01, 0, 0])
		cylinder(r = r1, h = 5,center=true);

		translate([(transistorSpacing+0.01)*2, 0, 0])
		cylinder(r = r1, h = 5,center=true);
		}}
	}
	module potentiometer(x, y,r) {
		translate([x, y, 0]){
		rotate(90, r){
		difference()
{
			rotate(a=[0,0,90]){
				translate([0,0,2.5])
					cube([1, 10, 5],center=true);
		}
rotate(a=[90,0,0]){translate([-2.5,-2.5,0]){
				cylinder(r = r1, h = 5,center=true);
				translate([transistorSpacing+0.01, 0, 0])
					cylinder(r = r1, h = 5,center=true);

				translate([(transistorSpacing+0.01)*2, 0, 0])
					cylinder(r = r1, h = 5,center=true);
			}}
		}}
		}
	}
module motorControl()
{

	function x(d) = d-24;
	function y(d) = d-33;
	difference() {
		cube([50, 30, 1], center =true);
		//78LO(x(45),y(30),[0, 0, 1]);
		LM317(x(45),y(30),[0, 0, 1])
		resistor(x(2),y(25),[0,0,0]);
		transistor(x(20),y(25),[0, 0, 1]);
		//ground
		pin(x(20),y(45));
		diode(x(25),y(30),[0, 0, 0]);
		//VCC
		pin(x(45),y(45));
		motor(x(30),y(25),[0,0,0]);
	}
}

module powerSupply()
{

	
	function x(d) = d-24;
	function y(d) = d-33;
	
translate([0,35,0]){
potentiometer(x(35),y(30),[0, 0, 1]);
	difference() {
		cube([50, 30, 1], center =true);
		//78LO(x(45),y(30),[0, 0, 1]);
		LM317(x(25),y(30),[0, 0, 1]);
		resistor(x(2),y(25),[0,0,0]);
		//transistor(x(20),y(25),[0, 0, 1]);
		//ground
		pin(x(20),y(45));
		//diode(x(25),y(30),[0, 0, 0]);
		//VCC
		pin(x(45),y(45));
		//motor(x(30),y(25),[0,0,0]);
	}
	}
}
motorControl();

powerSupply();