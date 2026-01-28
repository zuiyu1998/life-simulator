extends HBoxContainer
class_name MoneyPanel

@onready var value: Label = $Value

func update_value(v: int):
	value.text = str(v)
