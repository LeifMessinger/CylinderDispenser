use <Library/center.scad>
//Length, width, height. The length is how long the rail is, starting at the center of the flue, going back.
dimensions = [50, 50, 5];
module CylinderDispenser_Dispenser_Virgin_Rail_Floor(dimensions){
	center([0, dimensions[1], 0]) cube(dimensions);
}
CylinderDispenser_Rail_Floor(dimensions);