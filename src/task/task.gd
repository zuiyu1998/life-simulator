extends Resource
class_name Task
## 任务

@export 
var items: Array[TaskItem] = []

func handle_event(event: TaskEvent, handler_container: TaskHandlerContainer):
	for item in items:
		var handler = handler_container.get_handler(item.task_item_name)
		if item:
			handler.handle(item, event)
		else:
			printerr("%s task item not find" % item.task_item_name)
		
