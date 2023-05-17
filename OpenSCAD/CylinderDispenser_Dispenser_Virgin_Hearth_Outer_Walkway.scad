use <Library/center.scad>

//Length, width, height.
dimensions = [50, 24, 5];

module CylinderDispenser_Dispenser_Virgin_Hearth_Outer_Walkway(dimensions){
	center([0, dimensions[1], 0]){
		cube(dimensions);
	}
}

CylinderDispenser_Dispenser_Virgin_Hearth_Outer_Walkway(dimensions);