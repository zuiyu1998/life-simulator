class_name GameChessGainHandler
extends ChessGainHandler

var skill_set: SkillSet

func handle(gain: ChessGain):
	skill_set.add_skill(gain.skill_name, gain.value)


static func new_handler(p_skill_set: SkillSet) -> GameChessGainHandler:
	var gain_handler = GameChessGainHandler.new()
	gain_handler.skill_set = p_skill_set
	return gain_handler
