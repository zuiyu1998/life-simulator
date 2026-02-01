extends GainSubscription
class_name GameGainSubscription

var skill_set_controller: SkillSetController
var task_controller: TaskController

static func new_gain_subscription(p_skill_set_controller: SkillSetController, p_task_controller: TaskController) -> GainSubscription:
	var game_gain_subscription = GameGainSubscription.new()
	game_gain_subscription.skill_set_controller = p_skill_set_controller
	game_gain_subscription.task_controller = p_task_controller
	return game_gain_subscription

func handle_gain(gain: Gain):
	var game_gain = gain as GameGain
	if not game_gain:
		return
	skill_set_controller.add_game(game_gain.value)
	
	var item_event = GameTaskItemEvent.new_task_item_event(game_gain.value)
	var event = TaskEvent.new()
	event.instance = item_event
	event.task_item_name = "game"
	
	task_controller.handle_event(event)
