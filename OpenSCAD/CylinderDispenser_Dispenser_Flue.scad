use <CylinderDispenser_Dispenser_Flue_Chimney.scad>
use <CylinderDispenser_Dispenser_Flue_Hole.scad>
use <CylinderDispenser_Dispenser_Flue_Fireplace.scad>
use <CylinderDispenser_Dispenser_Flue_Flatback.scad>

/* [Object] */
objectDiameter = 24.0;
objectRadius = objectDiameter/2.0;
objectHeight = 15.0;

/* [Dispenser] */
wallThiccness = 2.0;
height = 80.0;
flatBack = true;

/* [OpenSCAD] [Quality] */
$fn = 50;

module CylinderDispenser_Dispenser_Flue(objectDiameter, objectHeight, wallThiccness, height, flatBack){
	flueDiameter = objectDiameter + (2.0 * wallThiccness);
	objectRadius = objectDiameter / 2.0;
	flueRadius = objectRadius + wallThiccness;
	
	union(){
		difference(){
			union(){
				CylinderDispenser_Dispenser_Flue_Chimney(flueDiameter, height);
				if(flatBack){
					CylinderDispenser_Dispenser_Flue_FlatBack(flueDiameter, height);
				}
			}
			CylinderDispenser_Dispenser_Flue_Hole(objectDiameter, height);
			CylinderDispenser_Dispenser_Flue_Fireplace([flueRadius, objectDiameter, objectHeight]);
		}
	}
}

CylinderDispenser_Dispenser_Flue(objectDiameter, objectHeight, wallThiccness, height, flatBack);