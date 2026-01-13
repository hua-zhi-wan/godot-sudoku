extends GridContainer
class_name MainGrid


var row_column_to_block: Dictionary = {}

signal block_selected(block: Block)


func _ready() -> void:
	var group_index = 1
	
	# 标行列
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
			
			row_column_to_block[block.row * 10 + block.column] = block
			
			block.block_selected.connect(_on_block_selected)
		group_index += 1


func _on_block_selected(row: int, column: int, group: int):
	# 全量初始化
	for child: Block in row_column_to_block.values():
		child.clear_select()
	
	var block = row_column_to_block[row * 10 + column] as Block
	block.deep_select()
	
	for i in range(1, 10):
		(row_column_to_block[row * 10 + i] as Block).select()
		(row_column_to_block[i * 10 + column] as Block).select()
	
	for child: Block in get_child(group - 1).get_children():
		child.select()
	
	block_selected.emit(block)
