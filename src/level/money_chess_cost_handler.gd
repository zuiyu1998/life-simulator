extends ChessCostHandler
class_name MoneyChessCostHandler

var level_state: LevlState

func handle(cost: ChessCost):
	level_state.money += cost.value

static func new_handler(p_level_state: LevlState) -> MoneyChessCostHandler:
	var handler = MoneyChessCostHandler.new()
	handler.level_state = p_level_state
	return handler
