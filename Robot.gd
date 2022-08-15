extends KinematicBody2D

var velocity = Vector2(0,0)
var gravity = 2000
var steps = 100
var jump_steps = 800
var score = 0
func score_count():
	score = score + 1

signal gold_coin_collected

func score_count_gold():
	emit_signal("gold_coin_collected")
	print(score)
	
func _physics_process(_delta):
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y= -jump_steps
		$AnimatedSprite.play("jump")

	if Input.is_action_pressed("left_arrow"):
		velocity.x = -steps
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("right_arrow"):
		velocity.x = steps
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.play("idle")
	if not is_on_floor():
		$AnimatedSprite.play("jump")

	velocity.y = velocity.y + gravity * (_delta)
	move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(velocity.x,0,0.1)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Fall_Area_body_entered(body):
	get_tree().change_scene("res://GameLevel.tscn")
	pass # Replace with function body.


func _on_Finish_Level_Area_body_entered(body):
	get_tree().change_scene("res://GameLevel.tscn")
	pass # Replace with function body.
