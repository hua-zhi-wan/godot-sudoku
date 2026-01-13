extends Control
class_name Block

@export_group("节点配置")
@export var selected_color_rect: ColorRect
@export var deep_selected_color_rect: ColorRect

@export var fixed_number_control: Control
@export var fixed_number_label: Label
@export var editable_number_control: Control
@export var editable_number_label: Label
@export var wrong_number_control: Control
@export var wrong_number_label: Label


@export_group("数值信息")
@export var answer: int
@export var solution: int

@export_group("位置信息")
@export var row: int		#[1-9]
@export var column: int 	#[1-9]
@export var group: int		#[1-9]

var editable: bool


signal block_selected(row: int, column: int, group: int)
signal answered_wrong()


func _ready() -> void:
	clear_select()


func setup(editable: bool, solution: int):
	self.solution = solution
	self.editable = editable
	if editable:
		fixed_number_control.hide()
		editable_number_control.show()
		editable_number_label.text = ""
	else:
		editable_number_control.hide()
		fixed_number_control.show()
		fixed_number_label.text = str(solution)

# 填充
func input_number(val: int):
	if editable:
		editable_number_control.show()
		wrong_number_control.hide()
		var ss = str(val)
		if val == 0:
			ss = ""
		editable_number_label.text = ss
		if val != solution:
			editable_number_control.hide()
			wrong_number_control.show()
			wrong_number_label.text = ss
			if val != 0:
				answered_wrong.emit()


# 点选
func clear_select():
	selected_color_rect.hide()
	deep_selected_color_rect.hide()


func select():
	selected_color_rect.show()


func deep_select():
	deep_selected_color_rect.show()


func _on_button_pressed() -> void:
	block_selected.emit(row, column, group)
