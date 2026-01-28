class_name LevelStateController

var level_state: LevelState = LevelState.new()

var money: MoneyPanel
var health: Label
var like: Label

func add_money(v: int):
	level_state.money += v
	money.update_value(level_state.money)
