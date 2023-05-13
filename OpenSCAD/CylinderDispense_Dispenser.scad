module CylinderDispenser_Dispenser(objectDiameter, objectHeight,
	wallThiccness, wallHeight,
	hearthDepth, outerHearthLength, printEjector, flatBack){

	//Intermediary Dimensions
	flueRadius = (objectDiameter / 2.0) + wallThiccness;

	union(){
		translate([0, 0, hearthDepth]){
			difference(){
				color("lightgreen", 1) Flue(objectDiameter, wallThiccness, wallHeight, flatBack);
				Fireplace(objectDiameter, flueRadius, objectHeight);
			}
		}
		Hearth(hearthDepth, objectDiameter, flueRadius, outerHearthLength, printEjector,  backLength, printEjector, ejectorRailWall, ejectorHoleHeight);
		FlatBack(flueDiameter, height);
	}
}