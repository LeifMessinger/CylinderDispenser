use <CylinderDispenser_Dispenser.scad>
use <CylinderDispenser_Ejector.scad>
use <CylinderDispenser_Dispenser_Virgin_Rail.scad>

use <CylinderDispenser_Dispenser_Virgin_Flue_Chimney.scad>
use <CylinderDispenser_Ejector_Rod.scad>

use <Library/center.scad>
use <Library/gridfinityify.scad>	//It includes its dependencies too

/* [What to print] */
cylinderDispenser = true;
ejectorRod = true;
ejectorRail = true;
gridfinity = true;

/* [Settings] [Cylinder Dispenser] */

//The back of the cylinder dispenser becomes flat
flatBack = true;

/* [Settings] [Ejector] [Rail] */

//Raise some rail walls to guide the ejector more
railWall = true;
//Print the cylinder dispenser without an ejector hole. Maybe for boring your own.
ejectorHole = true;

/* [Printer] */

//Some things grow and shrink due to this. The rod will shrink, the walls will grow, etc.
printerInaccuracy = .5; //mm. Global

/* [Cylinder] */
//properties of the cylinders you want to store

//Diameter of the cylinders you want to store. Making this a little bigger won't hurt.
objectDiameterReal = 24.0; //mm
objectDiameter = objectDiameterReal + printerInaccuracy;

objectRadius = objectDiameter / 2.0;

//Height of the cylinders you want to store. Making this a little bigger won't hurt either.
objectHeightReal = 8.0; //mm
objectHeight = objectHeightReal + printerInaccuracy;

/* [Chimney] */

//Thiccness of the walls. PrinterInaccuracy doesn't get applied to this, so make this big enough for your slicer to work with.
wallThiccness = 2.0; //mm
flueDiameter = wallThiccness*2.0 + objectDiameter;
flueRadius = wallThiccness + objectRadius;
//The holder's wall height above the hearth.
wallHeight = 80.0; //mm

/* [Hearth] */

//Thiccness below the opening. This adds to the total height.
hearthDepth = 2.0; //mm
//Length of the platform just outside the opening.
hearthLength = 50.0; //mm

/* [Ejector] [Paddle] */

ejectorPaddleDimensions = [5.0, 20.0, 20.0]; //mm

/* [Ejector] [Rod] */

//Length of the spring when fully relaxed. Ideally, get a spring that is longer than the diameter of your cylinders plus twice the wall thiccness. The larger the spring, the farther you can force out the cylinder.
ejectorSpringLength = 33; //mm
//The width and height of the ejector rod. The length is determined by the 
ejectorRodCrossSection = [5.0, 5.0];
ejectorRodDimensions = [ejectorSpringLength + wallThiccness + ejectorPaddleDimensions.x, ejectorRodCrossSection.x, ejectorRodCrossSection.y];
ejectorHoleDimensions = [ejectorRodDimensions.x + ejectorSpringLength, ejectorRodDimensions.y + printerInaccuracy, ejectorRodDimensions.z + printerInaccuracy];
//How sunk into the base the ejector rod is. The rod and hole height are compensated so that the hole height is measured from the base up.
ejectorHoleRecess = 1.0; //mm

/* [Rail] */
railFloorDimensions = [flueRadius + ejectorRodDimensions.x - wallThiccness, flueDiameter, hearthDepth];

/* [Rail] [Wall] */

//How wide the rail walls are. Shouldn't larger than the ejectorRodCrossSection height, but can be equal.
railWallHeight = 5.0;
railWallThiccness = 10.0; //mm
railWallDimensions = [railFloorDimensions.x, railWallThiccness, railWallHeight];

/* [Gridfinity] */

gridfinitySizeSettings = 0; // [0: Auto-estimate the size, 1: User-override size]

gridfinityXYDimensionsOverride = [42.0, 42.0];

gridfinityXYDimensions = (gridfinitySizeSettings == 1)? gridfinityXYDimensionsOverride : [railFloorDimensions.x + hearthLength + objectRadius,flueDiameter];

//Hole style. The slit is there to make printing the overhang easier for the printer.
gridfinityHoleStyle = 1; // [0:No holes,1:Magnet holes only, 2:Magnet and screw holes with no printable slit, 3:Magnet and screw holes with printable slit]

//Round up the size of the gridfinity base to the next block
gridfinityRoundUp = true;

/* [OpenSCAD] [Quality] */

//Number of segments for the cylinders. This probably doesn't work. Just hardcode the values into the other files for the cylinders you care about.
$fn = 50;

module CylinderDispenser(cylinderDispenser,ejectorRod, ejectorRail, gridfinity, ejectorHole,objectDiameter, objectHeight,
	wallThiccness, wallHeight,
	hearthLength, hearthDepth, flatBack,
	railFloorDimensions, railWall, railWallDimensions,
	ejectorRodDimensions, ejectorPaddleDimensions,
	ejectorHoleDimensions, ejectorSpringLength,
	gridfinitySizeSettings, gridfinityXYDimensionsOverride, gridfinityXYDimensions, gridfinityHoleStyle,gridfinityRoundUp){
		
	flueDiameter = objectDiameter + (2.0 * wallThiccness);
	objectRadius = objectDiameter / 2.0;
	flueRadius = objectRadius + wallThiccness;
		
	union(){
		if(cylinderDispenser){
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
		}
		if(ejectorRod)
		color("lime", .8)
		translate([(-(flueRadius + ejectorPaddleDimensions.x)), flueRadius + (ejectorPaddleDimensions.y / 2.0) + 10.0, 0.0])
		rotate($preview? [0, 0, 0] : [0, -90, 0])
		CylinderDispenser_Ejector(ejectorRodDimensions, ejectorPaddleDimensions);
	}
}
CylinderDispenser(cylinderDispenser,ejectorRod, ejectorRail, gridfinity, ejectorHole,
		objectDiameter, objectHeight,
		wallThiccness, wallHeight,
		hearthLength, hearthDepth, flatBack,
		railFloorDimensions, railWall, railWallDimensions,
		ejectorRodDimensions, ejectorPaddleDimensions, ejectorHoleDimensions, ejectorSpringLength, gridfinitySizeSettings, gridfinityXYDimensionsOverride, gridfinityXYDimensions, gridfinityHoleStyle,gridfinityRoundUp);