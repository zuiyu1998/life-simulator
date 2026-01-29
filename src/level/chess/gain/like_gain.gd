extends Gain
class_name LikeGain

var value: int = 0

# 创建增益元数据
func get_gain_name() -> StringName:
	return &"like"
