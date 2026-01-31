extends HBoxContainer
class_name GamePanel

@onready var value: Label = $Value

func update(v: int):
	value.text = str(v)
