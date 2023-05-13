//"Brick" below the opening of the fireplace.
module CylinderDispenser_Dispenser_Hearth(depth, objectDiameter, flueRadius, outerHearthLength, ejector,  backLength, printEjector, ejectorRailWall, ejectorHoleHeight){
	module Inner(depth, flueRadius){
		cylinder(d=(2 * flueRadius), h=depth);
	}
	module Outer(objectDiameter, length, depth){
		module Walkway(objectDiameter, length, depth){
			translate([-(objectDiameter/2), 0, 0]){
				cube([objectDiameter, length, depth]);
			}
		}
		module Lip(objectDiameter, length, depth){
			translate([0, length, 0]){
				cylinder(d=objectDiameter, h=depth);
			}
		}
		union(){
			Walkway(objectDiameter, length, depth);
			Lip(objectDiameter, length, depth);
		}
	}
	union(){
		color("gray", 1) Inner(depth, flueRadius);
		color("cyan", 1) Outer(objectDiameter, outerHearthLength, depth);
	}
}