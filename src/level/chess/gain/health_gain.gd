extends Gain
class_name HealthGain

var value: int = 0

# 创建增益元数据
func get_gain_name() -> StringName:
	return &"health"
