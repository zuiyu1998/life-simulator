extends CanvasLayer
class_name LoadingPanel

@onready var texture_progress_bar: TextureProgressBar = $ColorRect/VBoxContainer/TextureProgressBar
@onready var label: Label = $ColorRect/VBoxContainer/Label

signal finished

var load_status = 0
var progress = []
var target_scene_path: String

func handle_error():
	printerr("%s load faild." % target_scene_path)

func update_progress(value: float):
	texture_progress_bar.value = value
	label.text = str(value) + "%"

func switch_to_scene():
	var scene = ResourceLoader.load_threaded_get(target_scene_path)
	get_tree().change_scene_to_packed(scene)
	await get_tree().scene_changed
	finished.emit()


func load_scene_async(scene_path: String):
	target_scene_path = scene_path
	ResourceLoader.load_threaded_request(scene_path)

func _process(_delta: float) -> void:
	load_status = ResourceLoader.load_threaded_get_status(target_scene_path, progress)
	match load_status:
		ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			update_progress(progress[0] * 100)  # 更新进度条
		ResourceLoader.THREAD_LOAD_LOADED:
			update_progress(100)  # 更新进度条
			switch_to_scene()
		ResourceLoader.THREAD_LOAD_FAILED:
			handle_error()
