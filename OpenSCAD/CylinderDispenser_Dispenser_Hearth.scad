use <CylinderDispenser_Dispenser_Hearth_Inner.scad>
use <CylinderDispenser_Dispenser_Hearth_Outer.scad>

//Length, width, height. The length is from the start of the the walkway to the end of the lip. Here, the length doesn't include the length from the center to the back of the cylinder. The width can be though of as the diameter of the lip.
dimensions = [50, 24, 5];
flueDiameter = 28.0;

/* [OpenSCAD] [Quality] */
$fn = 20;

//"Brick" below the opening of the fireplace.
module CylinderDispenser_Dispenser_Hearth(dimensions, flueDiameter){
	union(){
		color("gray", 1) CylinderDispenser_Dispenser_Hearth_Inner(flueDiameter, dimensions.z);
		color("cyan", 1) CylinderDispenser_Dispenser_Hearth_Outer(dimensions);
	}
}

CylinderDispenser_Dispenser_Hearth(dimensions, flueDiameter);