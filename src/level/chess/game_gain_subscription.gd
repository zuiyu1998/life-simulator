extends GainSubscription
class_name GameGainSubscription

var level_state_controller: LevelStateController

static func new_gain_subscription(p_level_state_controller: LevelStateController) -> GainSubscription:
	var game_gain_subscription = GameGainSubscription.new()
	game_gain_subscription.level_state_controller = p_level_state_controller
	return game_gain_subscription

func handle_gain(gain: Gain):
	var game_gain = gain as GameGain
	if not game_gain:
		return
	
	level_state_controller.add_money(game_gain.value)
