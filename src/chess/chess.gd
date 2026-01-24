extends Resource
class_name Chess
## 棋子（劳动），玩家操作的主要对象

# 棋子名称
@export
var chess_name: StringName = &""
# 棋子介绍
@export
var description: String = ""
# 图片
@export
var image: Texture
# 等级
@export
var level = 0
# 棋子的消耗
@export
var costs: Array[ChessCost] = []
# 棋子的增益
@export
var gains: Array[GainMeta] = []
