use <CylinderDispenser_Dispenser_Flue.scad>
use <CylinderDispenser_Dispenser_Hearth.scad>

/* [Object] */
objectDiameter = 24.0;
objectRadius = objectDiameter/2.0;
objectHeight = 15.0;

/* [Dispenser] */
wallThiccness = 2.0;
//The holder wall height above the hearth
wallHeight = 80.0;
flatBack = true;
//How far the hearth platform should stick out.
hearthLength = 50.0;
hearthDepth = 5.0;

module CylinderDispenser_Dispenser(objectDiameter, objectHeight,
	wallThiccness, wallHeight,
	hearthLength, hearthDepth, flatBack){

	//Intermediary Dimensions
	flueDiameter = objectDiameter + (wallThiccness * 2.0);

	union(){
		CylinderDispenser_Dispenser_Flue(objectDiameter, objectHeight, wallThiccness, wallHeight + hearthDepth, flatBack);
		CylinderDispenser_Dispenser_Hearth([hearthLength, objectDiameter, hearthDepth], flueDiameter);
	}
}

CylinderDispenser_Dispenser(objectDiameter, objectHeight,
	wallThiccness, wallHeight,
	hearthLength, hearthDepth, flatBack);