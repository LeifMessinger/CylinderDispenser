use <CylinderDispenser_Dispenser.scad>
use <CylinderDispenser_Ejector.scad>
use <CylinderDispenser_Rail.scad>

use <CylinderDispenser_Dispenser_Flue_Chimney.scad>
use <CylinderDispenser_Ejector_Rod.scad>


/* [What to print] */
cylinderDispenser = true;

ejectorRod = true;

ejectorRail = true;

/* [Settings] [Cylinder Dispenser] */

//The back of the cylinder dispenser becomes flat
flatBack = true;

/* [Settings] [Ejector] [Rail] */

//Raise some rail walls to guide the ejector more
railWall = true;

//Print the cylinder dispenser without an ejector hole. Maybe for boring your own.
withoutHole = false;

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

flueRadius = wallThiccness + objectDiameter;

//Height of the wall above the opening.
wallHeight = 80.0; //mm

/* [Hearth] */

//Thiccness below the opening. This adds to the total height.
hearthDepth = 2.0; //mm

//Length of the platform just outside the opening.
hearthLength = 50.0; //mm

/* [Ejector] [Rod] */

//Length of the spring when fully relaxed. Ideally, get a spring that is longer than the diameter of your cylinders plus twice the wall thiccness. The larger the spring, the farther you can force out the cylinder.
ejectorSpringLength = 33; //mm

//The width and height of the ejector rod. The length is determined by the 
ejectorRodCrossSection = [5.0, 5.0];

ejectorRodDimensions = [ejectorSpringLength + flueDiameter, ejectorRodCrossSection.x, ejectorRodCrossSection.y];

//How sunk into the base the ejector rod is. The rod and hole height are compensated so that the hole height is measured from the base up.
ejectorHoleRecess = 1.0; //mm

/* [Ejector] [Paddle] */

ejectorPaddleDimensions = [5.0, 20.0, 20.0]; //mm

/* [Rail] */
railFloorDimensions = [ejectorSpringLength + flueDiameter, flueDiameter, hearthDepth];

ejectorHoleDimensions = [(2.0 * ejectorRodDimensions.x) - flueDiameter, ejectorRodDimensions.y + printerInaccuracy, ejectorRodDimensions.z + printerInaccuracy];

/* [Rail] [Wall] */

//How wide the rail walls are. Shouldn't larger than the ejectorRodCrossSection height, but can be equal.
railWallHeight = 5.0;
railWallThiccness = 10.0; //mm
railWallDimensions = [railFloorDimensions.x, railWallThiccness, railWallHeight];

/* [OpenSCAD] [Quality] */

//Number of segments for the cylinders. This probably doesn't work. Just hardcode the values into the other files for the cylinders you care about.
$fn = 50;

module CylinderDispenser(objectDiameter, objectHeight,
	wallThiccness, wallHeight,
	hearthLength, hearthDepth, flatBack,
	railFloorDimensions, railWall, railWallDimensions,
	ejectorRodDimensions, ejectorPaddleDimensions,
	ejectorHoleDimensions){
		
	flueDiameter = objectDiameter + (2.0 * wallThiccness);
	objectRadius = objectDiameter / 2.0;
	flueRadius = objectRadius + wallThiccness;
		
	union(){
		difference(){
			union(){
				CylinderDispenser_Dispenser(objectDiameter, objectHeight,
			wallThiccness, wallHeight,
			hearthLength, hearthDepth, flatBack);
				difference(){
					translate([-railFloorDimensions.x, 0, 0]){
							CylinderDispenser_Rail(railFloorDimensions, railWall, railWallDimensions);
					}
					translate([0, 0, hearthDepth]){
						CylinderDispenser_Dispenser_Flue_Chimney(flueDiameter, wallHeight);
					}
				}
			}
			translate([-railFloorDimensions.x, 0, railFloorDimensions.z]){
				#CylinderDispenser_Ejector_Rod(ejectorHoleDimensions);
			}
		}
		translate([0, flueRadius + (ejectorPaddleDimensions.y / 2.0) + 10.0, 0.0]) rotate($preview? [0, 0, 0] : [0, -90, 0])CylinderDispenser_Ejector(ejectorRodDimensions, ejectorPaddleDimensions);
	}
}

CylinderDispenser(objectDiameter, objectHeight,
	wallThiccness, wallHeight,
	hearthLength, hearthDepth, flatBack,
	railFloorDimensions, railWall, railWallDimensions,
	ejectorRodDimensions, ejectorPaddleDimensions, ejectorHoleDimensions);