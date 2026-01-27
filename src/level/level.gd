extends Node2D
class_name Level

@onready var chess_grid_panel: ChessGridPanel = $VBoxContainer/ChessGridPanel
@onready var level_state_panel: LevelStatePanel = $VBoxContainer/LevelStatePanel
@onready var skill_set_panel: SkillSetPanel = $VBoxContainer/SkillSetPanel
@onready var task_panel: TaskPanel = $VBoxContainer/TaskPanel

# 棋盘数据
@export
var chess_grid: ChessGrid: set = _set_chess_grid

# 属性列表
@export
var skill_set: SkillSet
# 棋子生成器
@export
var chess_spawner: ChessSpawner
# 任务
@export
var task: Task

# 关卡状态
var level_state = LevlState.new()

var chess_observer: ChessObserver = ChessObserver.new()

func _set_chess_grid(v: ChessGrid):
	chess_grid = v


func update_health(v: int):
	level_state_panel.update_health(v)


func update_like(v: int):
	level_state_panel.update_like(v)


func update_money(v: int):
	level_state_panel.update_money(v)


func on_skill_update(skill_name: String, _value: int):
	match skill_name:
		"game":
			var event = TaskEvent.new()
			event.task_item_name = "game"
			event.instance = GameTaskItemEvent.new_task_item_event(1)
			task.handle_event(event)


func on_task_finished():
	print("on_task_finished")


func update_skill(skill:Skill):
	skill_set_panel.update_skill(skill)


func init_chess_observer():
	chess_observer.register_gain_handler("game", GameGainHandler.new())
	chess_observer.register_gain_subscription("game", GameGainSubscription.new())


func do_init() -> void:
	init_chess_observer()
	task.finished.connect(on_task_finished)
	
	task_panel.do_init(task)


func _ready() -> void:
	# 绑定棋盘的控制器
	chess_grid_panel.controller.set_data(chess_grid)
	chess_grid_panel.controller.chess.connect(chess_observer.hanlde_chess)
	
	do_init()
	chess_spawner.reset_start_end()
	
	skill_set.skill_update.connect(update_skill)
	
	for skill in skill_set.skills.values():
		skill_set_panel.update_skill(skill)
	
	level_state.health_update.connect(update_health)
	level_state.like_update.connect(update_like)
	level_state.money_update.connect(update_money)
	
	update_health(level_state.health)
	update_like(level_state.like)
	update_money(level_state.money)


func update_chess(index: int):
	var item = chess_grid.get_item(index)
	chess_grid_panel.update_chess(index, item)


func _on_button_pressed() -> void:
	var chess = chess_spawner.get_chess()
	var empty_index = chess_grid.get_empty_index()
	if empty_index != -1:
		chess_grid_panel.controller.set_item(empty_index, chess)
	else:
		printerr("行动已满")
