extends Resource
class_name LevlState

signal money_update
signal like_update
signal health_update

# 金钱
var money: int = 100:
	set(v):
		money = v
		emit_signal("money_update", v)
# 心情
var like: int = 100:
	set(v):
		like = v
		emit_signal("like_update", v)
# 体力
var health: int = 100:
	set(v):
		health = v
		emit_signal("health_update", v)

	
