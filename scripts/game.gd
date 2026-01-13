extends Control
class_name Game


@export var main_grid: MainGrid
@export var fault_label: Label
@export var time_label: Label


var start_time: int
var fault_count: int = 0
var selected_block: Block



func _ready() -> void:
	var row_index = 1
	
	# 标解
	for row in Global.solution_matrix:
		var column_index = 1
		for val in row:
			var block = main_grid.row_column_to_block[row_index * 10 + column_index] as Block
			var editable = Global.question_matrix[row_index - 1][column_index - 1] == null
			block.setup(editable, val)
			block.answered_wrong.connect(_on_block_answered_wrong)
			column_index += 1
		row_index += 1
	
	# 记录用时
	start_time = Time.get_ticks_msec()


func _process(_delta: float) -> void:
	update_timer()


func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		for i in range(0, 10):
			if event.is_action_pressed(str(i)):
				input_number(i)


func is_game_over():
	if fault_count >= 3:
		return true
	return false


func update_timer():
	if is_game_over():
		return
	var msec = Time.get_ticks_msec() - start_time
	var second = msec / 1000
	var ss = "%02d:%02d" % [second / 60, second % 60]
	time_label.text = "时间\n%s" % ss


func input_number(val: int):
	if is_game_over():
		return
	if selected_block != null:
		if selected_block.editable:
			selected_block.input_number(val)


func _on_main_grid_block_selected(block: Block) -> void:
	selected_block = block


func _on_block_answered_wrong():
	fault_count += 1
	fault_label.text = "错误\n%d/3" % fault_count


func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_2d.tscn")
