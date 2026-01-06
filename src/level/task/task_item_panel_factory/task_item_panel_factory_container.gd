class_name TaskItemPanelFactoryContainer

var _data: Dictionary = {}

func register(factory: TaskItemPanelFactory):
	_data[factory.get_item_name()] = factory

func get_task_item_panel_factory(item_name: String) -> TaskItemPanelFactory:
	return _data[item_name]
