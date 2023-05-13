module Back(flueRadius, backLength, depth){
	translate([-(flueRadius), -((objectDiameter-flueRadius) + backLength), 0]){
		cube([flueRadius*2, backLength + objectDiameter-flueRadius, depth]);
	}
}