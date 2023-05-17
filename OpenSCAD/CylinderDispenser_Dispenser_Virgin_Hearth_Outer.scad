use <CylinderDispenser_Dispenser_Virgin_Hearth_Outer_Walkway.scad>
use <CylinderDispenser_Dispenser_Virgin_Hearth_Outer_Lip.scad>

//Length, width, height. The length is from the start of the the walkway to the end of the lip. The width can be though of as the diameter of the lip.
dimensions = [50, 15, 5];

/* [OpenSCAD] [Quality] */
$fn = 20;

module CylinderDispenser_Dispenser_Virgin_Hearth_Outer(dimensions){
	diameter = dimensions.y;
	radius = diameter / 2.0;
	walkwayLength = dimensions.x - radius;
	union(){
		CylinderDispenser_Dispenser_Virgin_Hearth_Outer_Walkway([walkwayLength, dimensions.y, dimensions.z]);
		translate([walkwayLength, 0, 0]){
			CylinderDispenser_Dispenser_Virgin_Hearth_Outer_Lip(diameter, dimensions.z);
		}
	}
}

CylinderDispenser_Dispenser_Virgin_Hearth_Outer(dimensions);