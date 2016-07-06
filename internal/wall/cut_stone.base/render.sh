#!/bin/bash

: ${OPENSCAD:="openscad"}
: ${CONVERTSTL:="../../../../openforge/bin/convertSTL.rb"}

for x in {1..4}
do
	for y in {1..4}
	do
		$OPENSCAD -o cut_stone_magnetic_base.${x}x${y}.square.internal.ckit.stl \
				-D "x=$x" -D "y=$y" -D 'back_edge="false"' \
				-D 'ckit_squares="true"' \
				../../../../cut_stone/base/magnetic/cut_stone_magnetic_base.square.scad
		$CONVERTSTL cut_stone_magnetic_base.${x}x${y}.square.internal.ckit.stl
		mv cut_stone_magnetic_base.${x}x${y}.square.internal.ckit-binary.stl cut_stone_magnetic_base.${x}x${y}.square.internal.ckit.stl
	done
done

