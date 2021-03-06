extends KinematicBody2D

const gravity = 500

var PlayerName = "Cat"
var hp = 100
var damage = 16.5
var velocity = Vector2()
var speed = 400
onready var animatedSprite = $AnimatedSprite
var raycasts = []


func _ready():
	raycasts = $RayCasts.get_children()


func _process(delta):
	animation()


func _physics_process(delta):
	move(delta)
	move_and_slide(velocity, Vector2(0, -1))


func move(delta):
	velocity.x = 0
	
	if(Input.is_action_pressed("ui_a")):
		velocity.x -= speed
	if(Input.is_action_pressed("ui_d")):
		velocity.x += speed
	if(!is_grounded()):
		velocity.y += gravity * delta
	elif(Input.is_action_pressed("ui_w")):
		velocity.y = -400
	if(is_grounded()):
		velocity.y = 0


func animation():
	if(velocity.x < 0):
		animatedSprite.animation = "walk"
		animatedSprite.flip_h = true
	if(velocity.x > 0):
		animatedSprite.animation = "walk"
		animatedSprite.flip_h = false
	if(velocity.x == 0):
		animatedSprite.animation = "stop"
	#if(velocity.y > 0):
	#	animatedSprite.animation = "down"
	#if(velocity.y < 0):
	#	animatedSprite.animation = "up"
	#if(velocity.y == 0):
	#	animatedSprite.animation = "stop"


func is_grounded():
	var cont = 0
	while(cont < raycasts.size()):
		if(raycasts[cont].is_colliding()):
			return true
		cont += 1
	return false




















