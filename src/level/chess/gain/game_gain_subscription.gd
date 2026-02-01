extends GainSubscription
class_name GameGainSubscription

var skill_set_controller: SkillSetController

static func new_gain_subscription(p_skill_set_controller: SkillSetController) -> GainSubscription:
	var game_gain_subscription = GameGainSubscription.new()
	game_gain_subscription.skill_set_controller = p_skill_set_controller
	return game_gain_subscription

func handle_gain(gain: Gain):
	var game_gain = gain as GameGain
	if not game_gain:
		return
	skill_set_controller.add_game(game_gain.value)
