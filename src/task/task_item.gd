extends Resource
class_name TaskItem

func get_item_name() -> String:
	return ""

func is_finished() -> bool:
	return false

func handle_event(_event: ITaskItemEvent):
	printerr("Task item handle event mut have impl.")
