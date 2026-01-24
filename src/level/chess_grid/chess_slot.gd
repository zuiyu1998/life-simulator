extends MarginContainer
class_name ChessSlot

@onready var texture_rect: TextureRect = $TextureRect
@onready var chess_icon: TextureRect = $ChessItem/ChessIcon

# 棋子等级
# 白1 绿2 绿4  蓝8 蓝16  紫32 紫64 金128 金524 红1024 红2048


func update_chess_bg(level: int):
	match level:
		0:
			texture_rect.material.set_shader_parameter("level_color", Vector4(1.0, 1.0, 1.0, 1.0))
		1:
			texture_rect.material.set_shader_parameter("level_color", Vector4(0.0, 1.0, 0.0, 1.0))
		2:
			texture_rect.material.set_shader_parameter("level_color", Vector4(0.0, 0.5, 0.0, 1.0))
		3:
			texture_rect.material.set_shader_parameter("level_color", Vector4(0.0, 0.0, 1.0, 1.0))
		4:
			texture_rect.material.set_shader_parameter("level_color", Vector4(0.0, 0.0, 0.5, 1.0))
		5:
			texture_rect.material.set_shader_parameter("level_color", Vector4(0.965, 0.25, 0.017, 1.0))
		6:
			texture_rect.material.set_shader_parameter("level_color", Vector4(0.619, 0.383, 0.007, 1.0))
		7:
			texture_rect.material.set_shader_parameter("level_color", Vector4(1.0, 0.0, 0.0, 1.0))
		8:
			texture_rect.material.set_shader_parameter("level_color", Vector4(0.5, 0.0, 0.0, 1.0))
							


func update_chess_icon(texture: Texture):
	chess_icon.texture = texture


func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return data is ChessDrag


func _drop_data(_at_position: Vector2, data: Variant) -> void:
	var chess_grid_panel = get_parent() as ChessGridPanel
	
	if not chess_grid_panel:
		return
	
	if not data is ChessDrag:
		return
	var item_drag = data as ChessDrag
	
	var item_index = get_index()
	if item_drag.item_index == item_index:
		chess_icon.texture = item_drag.chess.image
		return
	if chess_grid_panel.controller.on_drag(item_index, item_drag.chess):
		item_drag.success = true
		chess_grid_panel.controller.set_item(item_drag.item_index, null)


# 设置拖动失败的回调
func on_drag_completed(chess_drag: ChessDrag):
	if not chess_drag.success:
		chess_icon.texture = chess_drag.chess.image


# 设置预览
func _create_preview(chess: Chess) -> Control:
	var preview = Control.new()
	var rect = TextureRect.new()
	rect.texture = chess.image
	rect.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	rect.size = Vector2(128.0, 128.0)
	rect.position = Vector2(-64.0, -64.0)
	
	preview.add_child(rect)
	
	return preview

func _get_drag_data(_at_position: Vector2) -> Variant:
	var chess_grid_panel = get_parent() as ChessGridPanel
	print("dddddd")
	
	if not chess_grid_panel:
		return null
	
	var item_index = get_index()
	var chess_item = chess_grid_panel.controller.get_item(item_index)
	
	if not chess_item is Chess:
		return null
	
	var chess_drag = ChessDrag.new(chess_item, item_index, _create_preview(chess_item))
	chess_drag.drag_completed.connect(on_drag_completed)
	
	set_drag_preview(chess_drag.preview)
	chess_icon.texture = null
	
	return chess_drag
	
