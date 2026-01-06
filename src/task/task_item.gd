extends Resource
class_name TaskItem

func get_item_name() -> String:
	return ""


func handle_event(_event: ITaskItemEvent):
	printerr("Task item handle event mut have impl.")
