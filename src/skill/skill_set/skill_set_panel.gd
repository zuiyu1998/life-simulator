extends HBoxContainer
class_name SkillSetPanel

@onready var game_panel: GamePanel = $GamePanel

var controller: SkillSetController = SkillSetController.new()

func _ready() -> void:
	controller.game_panel = game_panel
	controller.update_view()
