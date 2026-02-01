class_name TaskController

var data: Task = Task.new()
var container: TaskItemPanelFactoryContainer = TaskItemPanelFactoryContainer.new()
var node: Node

var task_items: Dictionary = {}

func set_data(p_task: Task):
	data = p_task
	update_view()

func handle_event(event: TaskEvent):
	data.handle_event(event)

func update_view():
	for item in data.items:
		var item_name = item.get_item_name()
		var task_item = task_items.get(item_name)
		if task_item:
			pass
		else:
			var factory = container.get_task_item_panel_factory(item_name)
			var panel = factory.spawn(item)
			node.add_child(panel)
			task_items[item_name] = panel
