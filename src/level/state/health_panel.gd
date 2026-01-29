extends HBoxContainer
class_name HealthPanel

@onready var value: Label = $Value

func update_value(v: int):
	value.text = str(v)
