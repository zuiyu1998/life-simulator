class_name SkillSetController

var data: SkillSet = SkillSet.new()

var game_panel: GamePanel

func set_data(v: SkillSet):
	data = v
	if data:
		update_view()

func add_game(v: int):
	var game = data.get_skill("game")
	if game:
		game.count += v
		game_panel.update(game.count)
	

func update_view():
	var game = data.get_skill("game")
	if game:
		game_panel.update(game.count)
	else:
		game_panel.update(0)
