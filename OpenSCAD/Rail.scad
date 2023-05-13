use <Rail_Floor.scad>
use <Rail_Wall.scad>

//Length, width, height
floorDimensions = [10, 10, 10];
/* [Rail] [Wall] */
//Get rail walls that stick up out of the floor to better help guide the ejector
railWall = true;
//Wall height above the floor
wallHeight = 5;
//Wall width. Has to be larger than the hole that gets bored through it.
wallWidth = 10.0;

module CylinderDispenser_Rail(depth, ejectorRodLength, ejectorRailWall, ejectorHoleHeight, ejectorHoleWidth){
	union(){
		Floor(floorDimensions);
		if(ejectorRailWall){
			RailWall();
		}
	}
}
EjectorRail(depth, ejectorRodLength, ejectorRailWall, ejectorHoleHeight, ejectorHoleWidth);