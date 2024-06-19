extends Area2D

var mass = 1
var velocity = Vector2(0, 0)
@onready var momentum = mass * velocity
var size_scale: float


func _ready():
	var rect = $Sprite2D.region_rect
	size_scale = (rect.size.x + rect.size.y) / 2


func _process(delta):
	var rabbits = get_overlapping_areas()
	var net_force = Vector2(0, 0)
	for rabbit in rabbits:
		var vect_to = rabbit.global_position - global_position
		# TODO rabbit mass
		var bird_lenths = vect_to.length() / size_scale
		var strenth = 1 / (bird_lenths * bird_lenths)
		net_force += vect_to.normalized() * strenth
	
	var acceleration = net_force / mass
	
	velocity += acceleration * delta
	global_position += velocity * delta
	
	print(velocity)
