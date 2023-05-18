use <CylinderDispenser_Dispenser_Virgin.scad>
use <CylinderDispenser_Dispenser_EjectorHole.scad>

use <Library/gridfinityify.scad>	//It includes its dependencies too

/* [What to print] */

gridfinity = true;

ejectorHole = true;

/* [What to print] */
ejectorRail = true;

/* [Object] */
objectDiameter = 24.0;
objectRadius = objectDiameter/2.0;
objectHeight = 15.0;

/* [Dispenser] */
wallThiccness = 2.0;
//Intermediary Dimensions
flueDiameter = objectDiameter + (wallThiccness * 2.0);
flueRadius = wallThiccness + objectRadius;
//The holder's wall height above the hearth.
wallHeight = 80.0; //mm
flatBack = true;

/* [Hearth] */
//How far the hearth platform should stick out.
hearthLength = 50.0;
hearthDepth = 5.0;

/* [Rail] */
//The rail length starts at the center of the dispenser.
railLength = 50;
railFloorDimensions = [railLength, flueDiameter, hearthDepth];

/* [Rail] [Wall] */
railWall = true;

/* [Ejector Hole] */
ejectorSpringLength = 25.0;
ejectorRodTravelDistance = 80.0;	//Impossible to know this without the rod length/paddle thiccness.
ejectorHoleCrossSection = [5.0, 5.0];
ejectorHoleDimensions = [ejectorRodTravelDistance, ejectorHoleCrossSection.x, ejectorHoleCrossSection.y];

//How wide the rail walls are. Shouldn't larger than the ejectorRodCrossSection height, but can be equal.
railWallHeight = 5.0;
railWallThiccness = 10.0; //mm
railWallDimensions = [railFloorDimensions.x, railWallThiccness, railWallHeight];

/* [Gridfinity] */

gridfinitySizeSettings = 1; // [0: Auto-estimate the size, 1: User-override size]

gridfinityXYDimensionsOverride = [42.0, 42.0];

gridfinityXYDimensions = (gridfinitySizeSettings == 1)? gridfinityXYDimensionsOverride : [railFloorDimensions.x + hearthLength + objectRadius,flueDiameter];

//Hole style. The slit is there to make printing the overhang easier for the printer.
gridfinityHoleStyle = 1; // [0:No holes,1:Magnet holes only, 2:Magnet and screw holes with no printable slit, 3:Magnet and screw holes with printable slit]

//Round up the size of the gridfinity base to the next block
gridfinityRoundUp = true;

module CylinderDispenser_Dispenser(ejectorRail, gridfinity, railWall, flatBack, ejectorHole, objectDiameter, objectHeight,
	wallThiccness, wallHeight,
	hearthLength, hearthDepth, railFloorDimensions, railWallDimensions, ejectorSpringLength, ejectorHoleDimensions){
		
	objectRadius = objectDiameter / 2.0;
		
	difference(){
		CylinderDispenser_Dispenser_Virgin(ejectorRail, railWall, flatBack, objectDiameter, objectHeight,
	wallThiccness, wallHeight,
	hearthLength, hearthDepth, railFloorDimensions, railWallDimensions);
		if(ejectorHole)
			translate([-objectRadius + ejectorSpringLength, 0, railFloorDimensions.z]){
				mirror([1, 0, 0]){
					#CylinderDispenser_Dispenser_EjectorHole(ejectorHoleDimensions);
				}
			}
	}
}

if(gridfinity){
	gridfinityify(gridfinityXYDimensions, gridfinityHoleStyle, gridfinityRoundUp){
		CylinderDispenser_Dispenser(ejectorRail, gridfinity, railWall, flatBack, ejectorHole,
		objectDiameter, objectHeight,
		wallThiccness, wallHeight,
		hearthLength, hearthDepth, railFloorDimensions, railWallDimensions, ejectorSpringLength, ejectorHoleDimensions);
	}
}else{
	CylinderDispenser_Dispenser(ejectorRail, gridfinity, railWall, flatBack, ejectorHole,
		objectDiameter, objectHeight,
		wallThiccness, wallHeight,
		hearthLength, hearthDepth, railFloorDimensions, railWallDimensions, ejectorSpringLength, ejectorHoleDimensions);
}