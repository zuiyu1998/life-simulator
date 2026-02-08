extends Node
class_name AppStateManager

@onready var state_chart: StateChart = $StateChart
@onready var loading_panel: LoadingPanel = $LoadingPanel


func _ready() -> void:
	loading_panel.visible = false


func new_game():
	send_event("NewGame")
	loading_panel.load_scene_async("res://src/level/level.tscn")


func send_event(event: String):
	loading_panel.visible = true
	state_chart.send_event(event)


static func get_singleton() -> AppStateManager:
	return APP_STATE_MANAGER


func _on_loading_panel_finished() -> void:
	loading_panel.visible = false
