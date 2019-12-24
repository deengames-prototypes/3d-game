extends Node

var material_values = {}

var color:Color = Color.white
var is_erase:bool = false
var num_cubes = 0 # to prevent erasing last block

var materials_total = 1 # first block = value 1
var labour_total = 0