//The diameter of the flue.
diameter = 24.0;
height = 5;

/* [OpenSCAD] [Quality] */
$fn = 20;

module CylinderDispenser_Dispenser_Virgin_Hearth_Inner(diameter, height){
	cylinder(d=diameter, h=height);
}

CylinderDispenser_Dispenser_Virgin_Hearth_Inner(diameter, height);