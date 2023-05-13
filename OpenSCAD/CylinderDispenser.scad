====/* [What to print] */
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

/* [Cylinder] */
//properties of the cylinders you want to store

//Diameter of the cylinders you want to store. Making this a little bigger won't hurt.
objectDiameter = 24.0; //mm

objectRadius = objectDiameter / 2.0;

//Height of the cylinders you want to store. Making this a little bigger won't hurt either.
objectHeight = 8.0; //mm

/* [Chimney] */===

//Thiccness of the walls.
wallThiccness = 2.0; //mm

flueDiameter = wallThiccness*2.0 + objectDiameter;

flueRadius = wallThiccness + objectDiameter;

//Height of the wall above the opening.
wallHeight = 80.0; //mm

/* [Hearth] */

//Thiccness below the opening. This adds to the total height.
hearthDepth = 2.0; //mm

//Length of the platform just outside the opening.
outerHearthLength = 25.0; //mm

/* [Ejector] [Hole] */

//Size of the hole on the backside of the dispenser so you can eject the cylinder.
ejectorHoleWidth = 5.0; //mm

//Height of the ejector hole. You want this to be high enough so that the ejector rod gives the cylinder a good push, but not too high as to hit the cylinder above it. Definitely keep this below the cylinder height.
ejectorHoleHeight = 5.0; //mm

//How sunk into the base the ejector rod is. The rod and hole height are compensated so that the hole height is measured from the base up.
ejectorHoleRecess = 1.0; //mm

/* [Ejector] [Rail] */

//How wide the rail walls are
ejectorRailWallThiccness = 5.0; //mm

/* [Ejector] [Rod] */

//Length of the spring when fully relaxed. Ideally, get a spring that is longer than the diameter of your cylinders plus twice the wall thiccness. The larger the spring, the farther you can force out the cylinder.
ejectorSpringLength = 33; //mm

ejectorPaddleWidth = 20.0; //mm

ejectorPaddleHeight = 10.0; //mm

ejectorPaddleThiccness = 2.0; //mm

/* [Printer] */

//Some things grow and shrink due to this. The rod will shrink, the walls will grow, etc.
printerInaccuracy = .5; //mm. Global

/* [OpenSCAD] [Quality] */

//Number of segments
$fn = 50;

module CylinderEjector(rodWidth, rodHeight, rodLength, paddleThiccness, paddleWidth, paddleHeight){
	module Rod(width, height, length, paddleThiccness){
		translate([-(width/2), -length, 0]){
			cube([width, length + paddleThiccness, rodHeight]);
		}
	}
	module Paddle(width, thiccness, height){
		cube([width, thiccness, height]);
	}
	union(){
		Rod(rodWidth, rodHeight, rodLength, paddleThiccness);
		translate([-(paddleWidth/2), -rodLength, rodHeight])
		Paddle(paddleWidth, paddleThiccness, paddleHeight);
	}
}

module EjectorHole(ejectorHoleWidth, ejectorHoleHeight, ejectorHoleRecess, wallThiccness, springLength, flueRadius){
	holeLength = wallThiccness + 2.0*springLength;
	translate([-(ejectorHoleWidth/2), (-(flueRadius-wallThiccness))-(holeLength/2.0), -ejectorHoleRecess]){
		cube([ejectorHoleWidth, holeLength, ejectorHoleHeight]);
	}
}


//Intermediary Dimensions

ejectorHoleHeightAdjusted = ejectorHoleHeight + ejectorHoleRecess;

flueRadius = (objectDiameter / 2.0) + wallThiccness;

ejectorRodLength = ejectorSpringLength + wallThiccness;

union(){
	if(cylinderDispenser){
		difference(){
			union(){
				CylinderDispenser(objectDiameter, objectHeight, wallThiccness, wallHeight, hearthDepth, outerHearthLength, printRailRegardless || printEjector, flatBack);
				EjectorRail(){
					
				}
			}
			if(cutHoleRegardless || printEjector){
				color("blue", 1.0) translate([0, 0, hearthDepth]){
					#EjectorHole(ejectorHoleWidth, ejectorHoleHeightAdjusted, ejectorHoleRecess, wallThiccness, ejectorSpringLength, flueRadius);
				}
			}
		}
	}
	if(printEjector){
		rotation = printCylinderDispenser? ($preview? [0, 0, 0] : [90, 0, 0]) : [90, 0, 0];
		translation = printCylinderDispenser?
			($preview? [
				0,
				-ejectorPaddleThiccness,
				hearthDepth - ejectorHoleRecess
			] : [
				(flueRadius + (ejectorPaddleWidth / 2) + 5),
				(2 * ejectorPaddleThiccness),
				ejectorRodLength
			])
		: [0, 0, ejectorRodLength];
		translate(translation) rotate(rotation){
				CylinderEjector(ejectorHoleWidth, ejectorHoleHeightAdjusted, ejectorRodLength, ejectorPaddleThiccness, ejectorPaddleWidth, ejectorPaddleHeight);
		}
	}
}