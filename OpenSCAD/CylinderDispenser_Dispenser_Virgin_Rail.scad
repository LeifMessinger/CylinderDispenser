use <CylinderDispenser_Dispenser_Virgin_Rail_Floor.scad>
use <CylinderDispenser_Dispenser_Virgin_Rail_Wall.scad>

//Rail should allow for any shape to be cut into it, so you could make an ejector that is star shaped if you want it to.
//Really this whole thing is just positive space waiting for other things to cut it, like the Flue and the Ejector.

//Length, width, height of the floor
floorDimensions = [45, 24, 5];
//Length, width, and height of the rail. Rail length should be the same as the floor length.
wallDimensions = [45, 15, 5];
/* [Rail] [Wall] */
//Get rail walls that stick up out of the floor to better help guide the ejector
railWall = true;

module CylinderDispenser_Dispenser_Virgin_Rail(floorDimensions, railWall, wallDimensions){
	union(){
		CylinderDispenser_Dispenser_Virgin_Rail_Floor(floorDimensions);
		if(railWall){
			translate([0, 0, floorDimensions.z])
			CylinderDispenser_Dispenser_Virgin_Rail_Wall(wallDimensions);
		}
	}
}

CylinderDispenser_Dispenser_Virgin_Rail(floorDimensions, railWall, wallDimensions);