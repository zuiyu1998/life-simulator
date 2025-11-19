extends Node2D
class_name Level

@onready var chess_grid_panel: ChessGridPanel = $VBoxContainer/ChessGridPanel
@onready var level_state_panel: LevelStatePanel = $VBoxContainer/LevelStatePanel
@onready var skill_set_panel: SkillSetPanel = $VBoxContainer/SkillSetPanel


var chess_grid = preload("res://src/level/chess_grid_defaullt.tres") 
var skill_set = SkillSet.new()
var chess_cost_handler_container = ChessCostHandlerContainer.new()
var chess_gain_handler_container = ChessGainHandlerContainer.new()
var level_state = LevlState.new()


func update_health(v: int):
	level_state_panel.update_health(v)

func update_like(v: int):
	level_state_panel.update_like(v)

func update_money(v: int):
	level_state_panel.update_money(v)

func _ready() -> void:
	init_level()

func init_chess_cost_handler_container():
	chess_cost_handler_container.register("money",MoneyChessCostHandler.new_handler(level_state))

func init_chess_gain_handler_container():
	chess_gain_handler_container.register("game", GameChessGainHandler.new_handler(skill_set))

func update_skill(skill:Skill):
	skill_set_panel.update_skill(skill)


func init_level():
	skill_set.skill_update.connect(update_skill)
	
	for skill in skill_set.get_skill().values():
		skill_set_panel.update_skill(skill)
	
	init_chess_cost_handler_container()
	init_chess_gain_handler_container()
	
	level_state.health_update.connect(update_health)
	level_state.like_update.connect(update_like)
	level_state.money_update.connect(update_money)
	
	update_health(level_state.health)
	update_like(level_state.like)
	update_money(level_state.money)
	
	chess_grid_panel.chess_grid = chess_grid
	chess_grid.chess_change.connect(update_chess)
	chess_grid.merge.connect(handle_merge)
	
	for index in chess_grid.items.size():
		var item = chess_grid.items.get(index)
		if item is Chess:
			chess_grid_panel.update_chess(index, item)


func update_chess(index: int):
	var item = chess_grid.get_item(index)
	chess_grid_panel.update_chess(index, item)

func handle_merge(chess: Chess):
	for cost in chess.costs:
		var handler = chess_cost_handler_container.get_handler(cost.cost_name)
		if handler is ChessCostHandler:
			handler.handle(cost)


	
