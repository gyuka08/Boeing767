extends Node2D

class_name AVOID

signal terror
signal scored


@export var speed : int = 300
var spawner = preload("res://Scene/Entity/scn_building_spawner.tscn")

func set_speed(new_speed):
    speed = new_speed

func _process(delta):
    position.x += speed * delta * -1
    print(position.x)


func _on_body_entered(body):
    terror.emit()
    (body as Boeing).shtap()
    (spawner as Spawner).stop_spawning()


func _on_point_scored(body):
    scored.emit()