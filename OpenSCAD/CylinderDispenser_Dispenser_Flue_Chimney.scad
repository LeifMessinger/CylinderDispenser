//The whole column, excluding hearth.
module CylinderDispenser_Dispenser_Flue_Chimney(objectDiameter, wallThiccness, height){
	cylinder(d=(objectDiameter+(wallThiccness*2.0)), h=height);
}