# Scenes related to score and player health are connected by signals

extends CanvasLayer

var souls = 0
onready var health_player = $"../Player".health

# Score and player health are displayed on the screen
func _ready():
	$souls.text = String(souls)
	$Live.text = "Lives : " + String(health_player)

# When a player touches the soul, the score increases by 100
func _on_soul_soul_collected():
	souls = souls + 100
	$CollectSound.play()
	_ready()
	
func _on_Enemy_lose_health():
	_ready()

func _on_Fire_2_lose_health():
	_ready()

func _on_Fists_lose_health():
	$PunchSound.play()
	_ready()

func _on_icicle2_lose_health():
	_ready()
