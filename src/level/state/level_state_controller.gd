class_name LevelStateController

var level_state: LevelState = LevelState.new()

var money_panel: MoneyPanel
var health_panel: HealthPanel
var like_panel: LikePanel

func add_health(v: int):
	level_state.health += v
	health_panel.update_value(level_state.health)


func add_like(v: int):
	level_state.like += v
	like_panel.update_value(level_state.like)


func add_money(v: int):
	level_state.money += v
	money_panel.update_value(level_state.money)

func init_view():
	money_panel.update_value(level_state.money)
	like_panel.update_value(level_state.like)
	health_panel.update_value(level_state.health)
	
