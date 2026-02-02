extends TaskItem
class_name GameTaskItem

@export
var target: int = 10
@export
var value: int = 0

signal value_update(v: int)

func is_finished() -> bool:
	return value >= target

func get_item_name() -> String:
	return "game"


func handle_event(event: ITaskItemEvent):
	if not event is GameTaskItemEvent:
		return
	var game_event = event as GameTaskItemEvent
	value += game_event.value
	value_update.emit(value)
	
	
	
	
