# CylinderDispenser
Customizable Cylinder Dispenser written in OpenSCAD

Thangs link: https://thangs.com/mythangs/file/873360

## How to get started
Run the `downloadGridfinityRebuilt.sh` script in a terminal that has git and bash.

Sometimes it gives a `/bin/bash\M: file not found` error. That's because git on windows defaults to crlf line endings, and I can't be bothered to change it back. Just do `dos2unix downloadGridfinityRebuilt.sh` on it.

## Then what?

CylinderDispenser.scad is the final thing, allowing you to print the dispenser, and the rod all at once. It also does some calculations to adjust the dispenser based on the rod.

If you don't want an ejector, you can either disable it with one of the options, or use the CylinderDispenser_Dispenser.scad or CylinderDispenser_Dispenser_Virgin.scad file if you don't want the ejector rod hole.

### Todo:
Find out if I could include gridfinity-rebuilt as a submodule so people don't have to go through the startup process.
