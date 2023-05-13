module RailWall(height, length, flueRadius, ejectorHoleWidth){
	union(){
		translate([ejectorHoleWidth, 0, 0])
		cube([ejectorHoleWidth, flueRadius, height]);
		
		translate([-ejectorHoleWidth, 0, 0])
		cube([ejectorHoleWidth, flueRadius, height]);
	}
}