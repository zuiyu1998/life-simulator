extends HBoxContainer
class_name TaskPanel

var task: Task

var container: TaskItemPanelFactoryContainer = TaskItemPanelFactoryContainer.new()

func init_container():
	container.register(GameTaskItemPanelFactory.new())

func _ready() -> void:
	init_container()

func do_init(p_task: Task):
	task = p_task
	for item in task.items:
		var item_name = item.get_item_name()
		var factory = container.get_task_item_panel_factory(item_name)
		var node = factory.spawn(item)
		add_child(node)	
