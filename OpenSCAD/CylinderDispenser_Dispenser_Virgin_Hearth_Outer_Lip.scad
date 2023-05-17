radius = 24.0;
height = 5.0;

/* [OpenSCAD] [Quality] */
$fn = 20;

module CylinderDispenser_Dispenser_Virgin_Hearth_Outer_Lip(diameter, height){
		cylinder(d=diameter, h=height);
}

CylinderDispenser_Dispenser_Virgin_Hearth_Outer_Lip(radius, height);