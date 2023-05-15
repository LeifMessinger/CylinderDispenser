use <Library/center.scad>
//Length, width, height. Length is the thiccness of the paddle.
dimensions = [5, 15, 15];

module CylinderDispenser_Ejector_Paddle(dimensions){
	center([0, dimensions.y, 0]){
		cube(dimensions);
	}
}

CylinderDispenser_Ejector_Paddle(dimensions);