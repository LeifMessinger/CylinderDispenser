use <CylinderDispenser_Dispenser_Virgin_Flue.scad>
use <CylinderDispenser_Dispenser_Virgin_Flue_Chimney.scad>
use <CylinderDispenser_Dispenser_Virgin_Hearth.scad>
use <CylinderDispenser_Dispenser_Virgin_Rail.scad>

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

//How wide the rail walls are. Shouldn't larger than the ejectorRodCrossSection height, but can be equal.
railWallHeight = 5.0;
railWallThiccness = 10.0; //mm
railWallDimensions = [railFloorDimensions.x, railWallThiccness, railWallHeight];

module CylinderDispenser_Dispenser_Virgin( ejectorRail, railWall, flatBack, objectDiameter, objectHeight,
	wallThiccness, wallHeight,
	hearthLength, hearthDepth, railFloorDimensions, railWallDimensions){

	//Intermediary Dimensions
	flueDiameter = objectDiameter + (wallThiccness * 2.0);

	union(){
		CylinderDispenser_Dispenser_Virgin_Flue(objectDiameter, objectHeight, wallThiccness, wallHeight + hearthDepth, flatBack);
		CylinderDispenser_Dispenser_Virgin_Hearth([hearthLength, objectDiameter, hearthDepth], flueDiameter);
		if(ejectorRail)
		difference(){
			translate([-railFloorDimensions.x, 0, 0]){
					CylinderDispenser_Dispenser_Virgin_Rail(railFloorDimensions, railWall, railWallDimensions);
			}
			translate([0, 0, hearthDepth]){
				CylinderDispenser_Dispenser_Virgin_Flue_Chimney(flueDiameter, wallHeight);
			}
		}
	}
}


CylinderDispenser_Dispenser_Virgin(ejectorRail, railWall, flatBack, objectDiameter, objectHeight,
	wallThiccness, wallHeight,
	hearthLength, hearthDepth, railFloorDimensions, railWallDimensions);