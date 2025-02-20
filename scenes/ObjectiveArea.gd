extends Area2D

@export var next_scene: String = "res://scenes/LastLevel.tscn"
@onready var win_card = $"../CanvasLayer"

func _on_ObjectiveArea_body_entered(body: RigidBody2D):
	if (body.name == "BlueShip"):
		print("Reached objective!")
		win_card.visible = true
		
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file(next_scene)
		
	elif (body.name == "GreenShip"):
		print("Finished!")
		win_card.visible = true
		
