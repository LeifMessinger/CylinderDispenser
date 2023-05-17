use <Library/center.scad>

diameter = 15;
height = 50;

//Positive space of place behind the chimney.
//To difference with chimney later.
module CylinderDispenser_Dispenser_Virgin_Flue_FlatBack(diameter, height){
	radius = diameter / 2.0;
	center([diameter, diameter, 0]){
		cube([radius, diameter, height]);
	}
}
CylinderDispenser_Dispenser_Virgin_Flue_FlatBack(diameter, height);