extends CharacterBody2D


class_name Boeing
@export var gravity : int = 3500
@export var flap_str : int = 900
@export var rotation_str : float = 2

@onready var anim_player = $AnimationPlayer

var max_speed : int = 500
var go : bool = false
var is_input_allowed : bool = true

func _ready():
    velocity = Vector2.ZERO
    rotation = 0


func _physics_process(delta):
    if Input.is_action_just_pressed("2d_flap") && is_input_allowed:
        flap()
        go = true

    if go == false:
        return

    velocity.y += gravity * delta

    velocity.y = min(velocity.y, max_speed)

    move_and_collide(velocity * delta)

    rotate_bird()

func flap():
    velocity.y = -flap_str
    rotation = deg_to_rad(-30)


func rotate_bird():
    if velocity.y > 30 and rad_to_deg(rotation) < 90:
        rotation += rotation_str * deg_to_rad(1)
    
    elif velocity.y < 30 and rad_to_deg(rotation) > -30:
        rotation -= rotation_str * deg_to_rad(1)


func shtap():
    gravity = 0
    flap_str = 0
    rotation_str = 0
    velocity = Vector2.ZERO
    is_input_allowed = false