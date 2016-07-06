#!/bin/bash

: ${OPENSCAD:="openscad"}
: ${CONVERTSTL:="../../../../openforge/bin/convertSTL.rb"}

for x in {1..4}
do
	for y in {1..4}
	do
		$OPENSCAD -o magnetic_base.${x}x${y}.square.internal.ckit.stl \
				-D "x=$x" -D "y=$y" \
				-D 'ckit_squares="true"' \
				../../../../base/magnetic/magnetic_base.square.scad
		$CONVERTSTL magnetic_base.${x}x${y}.square.internal.ckit.stl
		mv magnetic_base.${x}x${y}.square.internal.ckit-binary.stl magnetic_base.${x}x${y}.square.internal.ckit.stl
	done
done

