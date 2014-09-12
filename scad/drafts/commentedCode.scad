/*
module triangle (r,d,rr){
b = r[0];
h = r[1];
w = r[2];

translate(d)
rotate(rr)
linear_extrude(height = w, center = true, convexity = 10, twist = 0)
polygon(points=[[0,0],[h,0],[0,b]], paths=[[0,1,2]]);
}
module example003()
{
	cube([5, 5, 21], center = true);
triangle(d=[2.5,0,10.5],r=[5,5,5],rr=[90,-90,0]);			
	//cube([5, 5, 21], center = true);
	
triangle(d=[2.5,0,-10.5],r=[5,5,5],rr=[90,-180,0]);
}

example003();
*/
/*
polyhedron(
  points=[ [10,10,0],[10,-10,0],[-10,-10,0],[-10,10,0], // the four points at base
           [0,0,10]  ],                                 // the apex point 
  faces=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4],              // each triangle side
              [1,0,3],[2,1,3] ]                         // two triangles for square base
 );
*/
//triangle(d=[5,5,5],r=[5,5,5]);

