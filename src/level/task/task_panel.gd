extends HBoxContainer
class_name TaskPanel

var task: Task

var container: TaskItemPanelFactoryContainer = TaskItemPanelFactoryContainer.new()

func init_container():
	container.register(GameTaskItemPanelFactory.new())

func _ready() -> void:
	init_container()

func set_task(p_task: Task):
	for child in get_children():
		self.remove_child(child)
	
	for item in p_task.items:
		var item_name = item.get_item_name()
		var factory = container.get_task_item_panel_factory(item_name)
		var node = factory.spawn(item)
		add_child(node)	
