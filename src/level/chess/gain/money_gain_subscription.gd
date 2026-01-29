extends GainSubscription
class_name MoneyGainSubscription

var level_state_controller: LevelStateController

static func new_gain_subscription(p_level_state_controller: LevelStateController) -> GainSubscription:
	var money_gain_subscription = MoneyGainSubscription.new()
	money_gain_subscription.level_state_controller = p_level_state_controller
	return money_gain_subscription

func handle_gain(gain: Gain):
	var money_gain = gain as MoneyGain
	if not money_gain:
		return
	
	level_state_controller.add_money(money_gain.value)
