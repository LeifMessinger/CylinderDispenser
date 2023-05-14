objectDiameter = 24.0;
height = 80;

/* [OpenSCAD] [Quality] */
$fn = 20;

//Hollow bit down the center of the chimney. Negative space.
module CylinderDispenser_Dispenser_Flue_Hole(objectDiameter, height) {
	cylinder(d=objectDiameter, h=height);
}

color("red", .5)
CylinderDispenser_Dispenser_Flue_Hole(objectDiameter, height);