extends Node2D


class_name Spawner

signal terror
signal point_scored

var scn_buildings = preload("res://Scene/Entity/scn_building.tscn")

@export var building_speed : int = 150
@onready var spawn_timer = $Timer

func _ready():
	spawn_timer.timeout.connect(spawn_building)
	spawn_timer.start()


func start_spawning():
	pass


func spawn_building():
	var building = scn_buildings.instantiate() as AVOID
	add_child(building)

	var viewport_rectangle = get_viewport().get_camera_2d().get_viewport_rect()
	building.position.x = viewport_rectangle.end.x

	var half_height = viewport_rectangle.size.y / 2
	building.position.y = randf_range(viewport_rectangle.size.y * .3 - half_height, viewport_rectangle.size.y * .75 - half_height)+600

	building.terror.connect(_on_body_entered)
	building.scored.connect(_on_point_scored)
	building.set_speed(building_speed)


func _on_body_entered(body):
	terror.emit()
	stop_spawning()


func _on_point_scored(body):
	point_scored.emit()


func stop_spawning():
	spawn_timer.stop()
	for building in get_children().filter(func (child): return child is AVOID):
		(building as AVOID).speed = 0
 
