@tool
extends HBoxContainer
class_name TaskPanel

var controller: TaskController = TaskController.new()

func init_container():
	controller.container.register(GameTaskItemPanelFactory.new())
	controller.node = self
	
	controller.update_view()

func _ready() -> void:
	init_container()
