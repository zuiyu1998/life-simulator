extends ITaskItemEvent
class_name GameTaskItemEvent

var value: int = 0

static func new_task_item_event(p_value: int) -> ITaskItemEvent:
	var event = GameTaskItemEvent.new()
	event.value = p_value
	return event
