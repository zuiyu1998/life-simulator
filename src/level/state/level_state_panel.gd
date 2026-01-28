extends HBoxContainer
class_name LevelStatePanel

@onready var money: MoneyPanel = $Money
@onready var health: Label = $HBoxContainer3/Health
@onready var like: Label = $HBoxContainer2/Like

var controller: LevelStateController = LevelStateController.new()

func update_like(count: int):
	like.text = str(count)

func update_health(count: int):
	health.text = str(count)

func _ready() -> void:
	controller.money = money
