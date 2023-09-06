extends Node

const NovoCarro = preload("res://carros.tscn")

var PistaDevagar = [600,544,438,324,384,216,160]
var PistaRapida = [488,272,104]

var Score1 = 0
var Score2 = 0

func _ready():
	$Button.hide()
	$tema.play()
	randomize()


func _on_HoraCarroRapido_timeout():
	var CarroRapido = NovoCarro.instance()
	add_child(CarroRapido)
	CarroRapido.position.x = -10
	CarroRapido.position.y = PistaRapida[randi() % PistaRapida.size()]
	CarroRapido.linear_velocity = Vector2(rand_range(700,710),0)
	CarroRapido.position.x = 1400
	CarroRapido.linear_velocity = Vector2(rand_range(-700,-710),0)


func _on_HoraCarroDevagar_timeout():
	var CarroDevagar = NovoCarro.instance()
	add_child(CarroDevagar)
	CarroDevagar.position.x = -10
	CarroDevagar.position.y = PistaDevagar[randi() % PistaDevagar.size()]
	CarroDevagar.linear_velocity = Vector2(rand_range(300,310),0)


func _on_Player_pontua():
	if Score1 < 10:
		Score1 += 1
		$ponto.play()
		$placar1.text = str(Score1)
	if Score1 >= 5:
		$Button.show()
		$tema.stop()
		$resultado.text = "Player 1 Ganhou"
		$Player.set_physics_process(false)
		$ganhou.play()
		$HoraCarroDevagar.stop()
		$HoraCarroRapido.stop()
		$Player.hide()
		$Player2.hide()

func _on_Player2_pontua2():
	if Score2 < 10:
		Score2 += 1
		$ponto.play()
		$placar2.text = str(Score2)
	if Score2 >= 1:
		$Button.show()
		$tema.stop()
		$resultado.text = "Player 2 Ganhou"
		$ganhou.play()
		$HoraCarroDevagar.stop()
		$HoraCarroRapido.stop()
		$Player.hide()
		$Player2.hide()

func _on_Button_pressed():
	$Button.hide()
	Score1 = 0
	Score2 = 0
	$placar1.text = "0"
	$placar2.text = "0"
	$resultado.text = ""
	$HoraCarroDevagar.start()
	$HoraCarroRapido.start()
	$Player.volta()
	$Player2.volta()
	$tema.play()
	$Player.visible = true
	$Player2.visible = true
