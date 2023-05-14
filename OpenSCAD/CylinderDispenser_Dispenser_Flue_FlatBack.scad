use <Library/center.scad>

diameter = 15;
height = 50;

//Positive space of place behind the chimney.
//To difference with chimney later.
module CylinderDispenser_Dispenser_Flue_FlatBack(diameter, height){
	radius = diameter / 2.0;
	center([diameter, diameter, 0]){
		cube([diameter,	 radius, height]);
	}
}
CylinderDispenser_Dispenser_Flue_FlatBack(diameter, height);