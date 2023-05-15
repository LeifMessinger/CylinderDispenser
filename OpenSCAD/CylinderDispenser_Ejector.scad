use <CylinderDispenser_Ejector_Rod.scad>
use <CylinderDispenser_Ejector_Paddle.scad>

//Length, width, height of the rod. Rod length includes the paddle length.
rodDimensions = [30+2+30, 5, 5];

//Length, width, height of the paddle. Length is the thiccness of the paddle.
paddleDimensions = [5, 15, 15];

module CylinderDispenser_Ejector(rodDimensions, paddleDimensions){
	union(){
		CylinderDispenser_Ejector_Rod(rodDimensions);
		translate([0, 0, rodDimensions.z])
		CylinderDispenser_Ejector_Paddle(paddleDimensions);
	}
}

CylinderDispenser_Ejector(rodDimensions, paddleDimensions);