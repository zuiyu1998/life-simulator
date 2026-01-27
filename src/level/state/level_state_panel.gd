extends HBoxContainer
class_name LevelStatePanel

@onready var money: Label = $HBoxContainer/Money
@onready var health: Label = $HBoxContainer3/Health
@onready var like: Label = $HBoxContainer2/Like

func update_like(count: int):
	like.text = str(count)

func update_health(count: int):
	health.text = str(count)

func update_money(count: int):
	money.text = str(count)
