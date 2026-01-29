extends HBoxContainer
class_name LikePanel

@onready var value: Label = $Value

func update_value(v: int):
	value.text = str(v)
