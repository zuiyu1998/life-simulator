extends Resource
class_name Task
## 任务


@export
var items: Array[TaskItem] = []

func handle_event(event: TaskEvent):
	var index = items.find_custom(func (item): return item.get_item_name() == event.task_item_name )
	if index != -1:
		items[index].handle_event(event.instance)
	else:
		printerr("%s task item not found." % event.task_item_name)
	
