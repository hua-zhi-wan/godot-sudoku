extends Control
class_name Game


@export var main_grid: MainGrid

func _ready() -> void:
	var row_index = 1
	for row in Global.solution_matrix:
		print_debug(row)
		var column_index = 1
		for val in row:
			var block = main_grid.rc2b[row_index * 10 + column_index] as Block
			block.solution = val
			column_index += 1
		row_index += 1
