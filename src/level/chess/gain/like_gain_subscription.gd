extends GainSubscription
class_name LikeGainSubscription

var level_state_controller: LevelStateController

static func new_gain_subscription(p_level_state_controller: LevelStateController) -> GainSubscription:
	var like_gain_subscription = LikeGainSubscription.new()
	like_gain_subscription.level_state_controller = p_level_state_controller
	return like_gain_subscription

func handle_gain(gain: Gain):
	var like_gain = gain as LikeGain
	if not like_gain:
		return
	level_state_controller.add_like(like_gain.value)
