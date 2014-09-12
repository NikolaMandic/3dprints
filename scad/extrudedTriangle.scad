module triangle (r,d){
b = r[0];
h = r[1];
w = r[2];

rotate([90,-90,0])
translate(d)
linear_extrude(height = w, center = true, convexity = 10, twist = 0)
polygon(points=[[0,0],[h,0],[0,b]], paths=[[0,1,2]]);
}
module example003()
{
	cube([5, 5, 21], center = true);
			
	cube([5, 5, 21], center = true);
	
}

//example003();

triangle(d=[5,5,5],r=[5,5,5]);