extends HBoxContainer
class_name LevelStatePanel

@onready var money_panel: MoneyPanel = $MoneyPanel
@onready var like_panel: LikePanel = $LikePanel
@onready var health_panel: HealthPanel = $HealthPanel


var controller: LevelStateController = LevelStateController.new()

func _ready() -> void:
	controller.money_panel = money_panel
	controller.like_panel = like_panel
	controller.health_panel = health_panel
	
	controller.init_view()
