extends Control

onready var level_list = $ScrollContainer/MarginContainer/Levels

func _ready():
	var chapter_id = 0
	
	for chapter in levels.chapters:
		var level_id = 0
		
		var l = Label.new()
		l.text = chapter.slug
		l.set("custom_fonts/font", preload("res://fonts/big.tres"))
		l.align = HALIGN_CENTER
		level_list.add_child(l)
		
		for level in chapter.levels:
			var b = Button.new()
			b.text = level.title
			b.align = HALIGN_LEFT
			b.connect("pressed", self, "load", [chapter_id, level_id])
			level_list.add_child(b)
			level_id += 1
			
		chapter_id += 1

func load(chapter_id, level_id):
	game.current_chapter = chapter_id
	game.current_level = level_id
	get_tree().change_scene("res://scenes/main.tscn")

func back():
	get_tree().change_scene("res://scenes/title.tscn")
