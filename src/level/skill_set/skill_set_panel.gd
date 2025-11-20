extends HBoxContainer
class_name SkillSetPanel

@onready var value: Label = $SkillPanel/Value


func update_skill(skill:Skill):
	if skill.skill_name == 'game':
		value.text = str(skill.count)
