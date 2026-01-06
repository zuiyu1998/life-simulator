extends TaskItemPanelFactory
class_name GameTaskItemPanelFactory

var game_task_item_panel_tscn = preload("res://src/level/task/game_task_item/game_task_item_panel.tscn")

func get_item_name() -> String:
	return 'game'

func spawn(task_item: TaskItem) -> Node:
	var game_task_item_panel = game_task_item_panel_tscn.instantiate() as GameTaskItemPanel;
	game_task_item_panel.task_item = task_item
	return game_task_item_panel
	
