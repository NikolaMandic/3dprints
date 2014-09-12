
module example001()
{
	function r_from_dia(d) = d / 2;

	module rotcy(rot, r, h) {
		rotate(90, rot)
			cylinder(r = r, h = h, center = true);
	}

	difference() {
		rotcy([0, 0, 0], cy_r, cy_h, $fa=5, $fs=0.1);
		rotcy([0, 0, 0], 1.5, cy_h+1, $fa=5, $fs=0.1);
	}

	size = 1;
	hole = 6;

	cy_r = r_from_dia(hole);
	cy_h = r_from_dia(size * 2.5);
}

example001();

