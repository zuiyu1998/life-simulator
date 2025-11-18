extends Resource
class_name ChessCost
## 棋子的代价，用于在棋子合成时，消耗的数据源

# 消耗对应的状态
@export
var cost_name: StringName = &""
# 消耗对应的值
@export
var value: int = -1
