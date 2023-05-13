use <Library/center.scad>
dimensions = [50, 50, 5];
module CylinderDispenser_Rail_Floor(dimensions){
	center([dimensions[0], 0, 0]) cube(dimensions);
}
Floor(dimensions);