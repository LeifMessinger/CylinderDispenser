use <CylinderDispenser_Dispenser_Flue_Chimney.scad>
use <CylinderDispenser_Dispenser_Flue_Hole.scad>
use <CylinderDispenser_Dispenser_Flue_Flatback.scad>

module CylinderDispenser_Dispenser_Flue(objectDiameter, wallThiccness, height, flatBack){
	union(){
		difference(){
			Chimney(objectDiameter, wallThiccness, height);
			Hole(objectDiameter, height);
		}
		if(flatBack){
			FlatBack(objectDiameter, wallThiccness, height);
		}
	}
}