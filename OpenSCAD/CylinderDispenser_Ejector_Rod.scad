use <Library/center.scad>

//This rod is positive space for the full ejector rod, and negative space that gets cut out of the dispenser.

//Length, width, and height of rod. Length should include the thiccness of the paddle.
dimensions = [30+2+30, 5, 5];

module CylinderDispenser_Ejector_Rod(dimensions){
	center([0, dimensions.y, 0]){
		cube(dimensions);
	}
}

CylinderDispenser_Ejector_Rod(dimensions);