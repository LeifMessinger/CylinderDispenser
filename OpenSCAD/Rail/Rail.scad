include <
module EjectorRail(depth, ejectorRodLength, ejectorRailWall, ejectorHoleHeight, ejectorHoleWidth){
	if(printEjector){
		union(){
			Back(flueRadius, backLength, depth);
			if(ejectorRailWall){
				RailWall(ejectorHoleHeight, backLength, flueRadius, ejectorHoleWidth);
			}
		}
	}
}