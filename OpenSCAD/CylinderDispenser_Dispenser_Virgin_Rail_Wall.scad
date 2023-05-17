use <Library/center.scad>

//Length, width, height. Length is gonna be the rail length, which is the spring length plus the paddle thiccness.
dimensions = [50, 10, 5];
module CylinderDispenser_Dispenser_Virgin_Rail_Wall(dimensions){
	//The walls still "grow" forwards, but it's the parent module's job to translate/rotate/mirror it
	center([0, dimensions[1], 0]){
		cube(dimensions);
	}
}
CylinderDispenser_Rail_Wall(dimensions);