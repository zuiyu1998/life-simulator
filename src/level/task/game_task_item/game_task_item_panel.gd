extends HBoxContainer
class_name GameTaskItemPanel

@onready var label_2: Label = $Label2

@export
var task_item: GameTaskItem

func _ready() -> void:
	on_task_item_value_update(task_item.value)
	update_task_item()


func update_task_item():
	task_item.value_update.connect(on_task_item_value_update)


func on_task_item_value_update(value: int):
	label_2.text = "%s / %s" % [task_item.target, value]
