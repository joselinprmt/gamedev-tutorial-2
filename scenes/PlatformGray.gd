extends CharacterBody2D

@export var speed: float = 200
var direction := 0
var green_ship: RigidBody2D = null

func _ready():
	print("Platform Gray initialized")

func _physics_process(delta):
	direction = 0
	if Input.is_action_pressed("move_right"):
		direction = 1
	elif Input.is_action_pressed("move_left"):
		direction = -1
		
	position.x += direction * speed * delta

	# Jika GreenShip ada di atas platform, ikut bergerak
	if green_ship:
		green_ship.global_position.x += position.x * delta

# Deteksi jika GreenShip berada di atas platform
func _on_Area2D_body_entered(body):
	if body is RigidBody2D:
		green_ship = body

# Hapus referensi jika GreenShip meninggalkan platform
func _on_Area2D_body_exited(body):
	if body == green_ship:
		green_ship = null
