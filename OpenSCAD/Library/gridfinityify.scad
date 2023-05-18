use <gridfinity-rebuilt-utility.scad>	//It includes its dependencies too

//xyDimensions in mm
module gridfinityify(xyDimensions=[42.0, 42.0], style_hole=1, roundUp=true, length=42, div_base_x=1, div_base_y=1){
	union(){
		gridfinityBase(roundUp?ceil(xyDimensions.x / length):gridx, roundUp?ceil(xyDimensions.y / length):gridy, length, div_base_x, div_base_y, style_hole);
		translate([0, 0, 6.45]){ //Approximately how tall the base is for some reason
			children();
		}
	}
}