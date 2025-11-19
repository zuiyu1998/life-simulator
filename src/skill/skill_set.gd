class_name SkillSet

var _skills: Dictionary[String, Skill] = {}

signal skill_update(skill: Skill)

func get_skill() -> Dictionary[String, Skill]:
	return _skills

func add_skill(skill_name: StringName, value: int):
	var skill = _skills.get(skill_name)
	if skill is Skill:
		skill.count += value
		emit_signal("skill_update", skill)
	else:
		printerr("%s skill not found." % skill_name)
