extends KinematicBody2D

var velocity = Vector2(0,0)

var speed = 100
var direction = -1
var lives = 3

func _physics_process(_delta):
	velocity.x = speed * direction
	if direction == -1:
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true
	
	$AnimatedSprite.play("run")
	move_and_slide(velocity)
	
	if $RayCast2D.is_colliding() == false:
		direction = direction * -1
		$RayCast2D.position.x *= -1
		
	
	
	
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CollisionChecker_body_entered(body):
	print("enter enemy: lives: ", body)
	# lives = lives – 1
	var lives = 0
	if(lives == 0):
		print("New Game")
		get_tree().change_scene("res://GameLevel.tscn")

