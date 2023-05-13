//Opening at the bottom. Negative space
module CylinderDispenser_Dispenser_Flue_Fireplace(objectDiameter, flueRadius, objectHeight) {
	color("red", .2) translate([-(objectDiameter/2), 0, 0]){
		cube([objectDiameter, flueRadius, objectHeight]);
	}
}