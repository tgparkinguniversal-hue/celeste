extends SceneTree
# Demonstration agent: rule-based commands sent to the unchanged player controller.
# It does not use a learned model, teleport across obstacles, or alter game physics.
var lab
var p
var time := 0.0
var presentation := 0.0
var menu_opened := false
var menu_closed := false
var phase := 0
var phase_time := 0.0
var jump_hold := 0.0
var jump_cooldown := 0.0
var visited := {}
var resets := 0
var previous_x := -18.0
var marker: Label
var caption: Label
var labels := ["Parado · respiração e movimento secundário", "Caminhada · aceleração e animação", "Corrida · transição e inércia", "Deslizamento · cápsula baixa", "Agachamento · passagem com teto baixo", "Plataformas · saltos e controle no ar"]
func _initialize() -> void:
	call_deferred("run")
func run() -> void:
	lab = load("res://main.tscn").instantiate()
	root.add_child(lab)
	p = lab.player
	p.input_override = true
	var layer := CanvasLayer.new()
	root.add_child(layer)
	var backing := ColorRect.new()
	backing.position = Vector2(0, 600)
	backing.size = Vector2(1280, 120)
	backing.color = Color(0.06, 0.09, 0.12, 0.95)
	layer.add_child(backing)
	caption = Label.new()
	caption.position = Vector2(30, 622)
	caption.add_theme_font_size_override("font_size", 16)
	layer.add_child(caption)
	lab.help.visible = false
	marker = Label.new()
	marker.position = Vector2(860, 28)
	marker.text = "DEMO AUTOMÁTICA · V0.2\nCaptura fixa: 60 fps · não é benchmark"
	marker.add_theme_font_size_override("font_size", 16)
	marker.modulate = Color("e1bb80")
	var marker_layer := CanvasLayer.new()
	marker_layer.layer = 40
	root.add_child(marker_layer)
	marker_layer.add_child(marker)
	physics_frame.connect(drive)
func transition(next: int) -> void:
	phase = next
	phase_time = 0
	print("DEMO_PHASE ", phase, " x=", p.position.x)
func drive() -> void:
	var dt := 1.0 / 120.0
	presentation += dt
	if presentation < 1.0:
		p.test_input = {}
		return
	if presentation < 4.0:
		if not menu_opened:
			menu_opened = true
			lab.open_controls(false)
		return
	if not menu_closed:
		menu_closed = true
		lab.close_controls()
	time += dt
	phase_time += dt
	jump_hold = maxf(0, jump_hold - dt)
	jump_cooldown = maxf(0, jump_cooldown - dt)
	visited[p.state] = true
	if p.position.x < previous_x - 8:
		resets += 1
	previous_x = p.position.x
	caption.text = "DEMONSTRAÇÃO AUTOMÁTICA   /   " + labels[phase] + "\nMesma física e cenário da versão para Windows · sem edição de movimentos"
	var cmd := {"axis": 0.0}
	match phase:
		0:
			if phase_time > 1.4: transition(1)
		1:
			cmd = {"axis": 1.0}
			if p.position.x > -11.0: transition(2)
		2:
			cmd = {"axis": 1.0, "run": true}
			if p.position.x > -8.0: transition(3)
		3:
			cmd = {"axis": 1.0, "run": true, "slide": phase_time < 0.02}
			if phase_time > 0.66: transition(4)
		4:
			cmd = {"axis": 1.0, "crouch": true}
			if p.position.x > -2.5: transition(5)
		5:
			cmd = {"axis": 1.0, "run": true, "jump_held": jump_hold > 0}
			if p.is_on_floor() and jump_cooldown <= 0:
				var world = p.get_world_3d().direct_space_state
				var pos: Vector3 = p.global_position
				var front := PhysicsRayQueryParameters3D.create(pos + Vector3(0, 0.35, 0), pos + Vector3(1.2, 0.35, 0))
				front.exclude = [p.get_rid()]
				var front_mid := PhysicsRayQueryParameters3D.create(pos + Vector3(0, 0.8, 0), pos + Vector3(1.2, 0.8, 0))
				front_mid.exclude = [p.get_rid()]
				var front_high := PhysicsRayQueryParameters3D.create(pos + Vector3(0, 1.3, 0), pos + Vector3(1.2, 1.3, 0))
				front_high.exclude = [p.get_rid()]
				var down := PhysicsRayQueryParameters3D.create(pos + Vector3(1.0, 0.2, 0), pos + Vector3(1.0, -1.4, 0))
				down.exclude = [p.get_rid()]
				if not world.intersect_ray(front).is_empty() or not world.intersect_ray(front_mid).is_empty() or not world.intersect_ray(front_high).is_empty() or world.intersect_ray(down).is_empty():
					cmd.jump = true
					cmd.jump_held = true
					jump_hold = 0.42
					jump_cooldown = 0.65
	if p.position.x > 36:
		cmd = {}
	p.test_input = cmd
	if time > 16:
		print("DEMO_END ", JSON.stringify({"states": visited.keys(), "resets": resets, "position": str(p.position), "jumps": p.jumps, "slides": p.slide_count}))
		FileAccess.open("/tmp/canine-build/demo-v02-result.json", FileAccess.WRITE).store_string(JSON.stringify({"seconds": time, "states": visited.keys(), "resets": resets, "x": p.position.x, "jumps": p.jumps, "slides": p.slide_count}, "  "))
		quit()
