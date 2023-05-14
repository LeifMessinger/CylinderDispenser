use <Library/center.scad>

//Length, width, height. Length is how far it should stick out from the center of the flue (so the flue radius). The width is the diameter of the object. The height is the height of the object.
dimensions = [24.0, 28.0, 15.0];

//Opening at the bottom. Negative space
module CylinderDispenser_Dispenser_Flue_Fireplace(dimensions) {
	center([dimensions.x, 0, 0]){
		cube(dimensions);
	}
}

color("red", .5)
CylinderDispenser_Dispenser_Flue_Fireplace(dimensions);