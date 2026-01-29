extends GainSubscription
class_name HealthGainSubscription

var level_state_controller: LevelStateController

static func new_gain_subscription(p_level_state_controller: LevelStateController) -> GainSubscription:
	var health_gain_subscription = HealthGainSubscription.new()
	health_gain_subscription.level_state_controller = p_level_state_controller
	return health_gain_subscription

func handle_gain(gain: Gain):
	var health_gain = gain as HealthGain
	if not health_gain:
		return
	level_state_controller.add_health(health_gain.value)
