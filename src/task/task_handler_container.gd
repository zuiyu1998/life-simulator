class_name TaskHandlerContainer

var handlers: Dictionary[String, TaskHandler] = {}

func get_handler(task_item_name: String) -> TaskHandler:
	return handlers.get(task_item_name)
