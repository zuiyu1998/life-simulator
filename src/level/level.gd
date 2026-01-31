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

@export
# 关卡状态
var level_state = LevelState.new()

var chess_observer: ChessObserver = ChessObserver.new()

func _set_chess_grid(v: ChessGrid):
	chess_grid = v


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
	chess_observer.register_gain_handler("health", HealthGainHandler.new())
	chess_observer.register_gain_subscription("health", HealthGainSubscription.new_gain_subscription(level_state_panel.controller))
	chess_observer.register_gain_handler("money", MoneyGainHandler.new())
	chess_observer.register_gain_subscription("money", MoneyGainSubscription.new_gain_subscription(level_state_panel.controller))
	chess_observer.register_gain_handler("like", LikeGainHandler.new())
	chess_observer.register_gain_subscription("like", LikeGainSubscription.new_gain_subscription(level_state_panel.controller))


func do_init() -> void:
	chess_grid_panel.controller.set_data(chess_grid)
	chess_grid_panel.controller.chess.connect(chess_observer.hanlde_chess)
	
	skill_set_panel.controller.set_data(skill_set)
	
	init_chess_observer()
	task.finished.connect(on_task_finished)
	
	task_panel.do_init(task)


func _ready() -> void:
	# 绑定棋盘的控制器

	do_init()
	chess_spawner.reset_start_end()

func _on_button_pressed() -> void:
	var chess = chess_spawner.get_chess()
	var empty_index = chess_grid.get_empty_index()
	if empty_index != -1:
		chess_grid_panel.controller.set_item(empty_index, chess)
	else:
		printerr("行动已满")
