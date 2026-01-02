extends Control
class_name Block


@export_group("数值信息")
@export var answer: int
@export var solution: int

@export_group("位置信息")
@export var row: int		#[1-9]
@export var column: int 	#[1-9]
@export var group: int		#[1-9]


func _process(delta: float) -> void:
	$EditableNumber/Label.text = str(solution)
	pass
