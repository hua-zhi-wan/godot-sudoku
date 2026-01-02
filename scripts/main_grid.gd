extends GridContainer
class_name MainGrid


var rc2b: Dictionary = {}


func _ready() -> void:
	var group_index = 1
	for group in get_children():
		var group_inner_index = 1
		for block in group.get_children():
			block = block as Block
			block.group = group_index
			block.row = (group_index - 1) / 3 * 3 + 1
			block.row += (group_inner_index - 1) / 3
			block.column = (group_index - 1) % 3 * 3 + 1
			block.column += (group_inner_index - 1) % 3
			group_inner_index += 1
			rc2b[block.row * 10 + block.column] = block
		group_index += 1
