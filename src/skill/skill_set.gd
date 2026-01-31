class_name SkillSet
extends Resource

@export
var skills: Dictionary[String, Skill] = {}

signal skill_update(skill: Skill)

func get_skill(skill_name: StringName,) -> Skill:
	return skills.get(skill_name)

func add_skill(skill_name: StringName, value: int):
	var skill = skills.get(skill_name)
	if skill is Skill:
		skill.count += value
		emit_signal("skill_update", skill)
	else:
		printerr("%s skill not found." % skill_name)
