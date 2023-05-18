#!/bin/bash

git clone 'https://github.com/kennetek/gridfinity-rebuilt-openscad.git'

cp -v 'gridfinity-rebuilt-openscad/gridfinity-rebuilt-utility.scad' 'OpenSCAD/Library/'

cp -v 'gridfinity-rebuilt-openscad/gridfinity-constants.scad' 'OpenSCAD/Library/'
