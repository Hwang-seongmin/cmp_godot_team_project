# Created by Gwang Jin Kim
extends ProgressBar

func _ready():
	set_process(false)

# Set value of red bar
func set_bar_value(value_to_set):
	value = value_to_set
	$Timer.start()

func _on_Timer_timeout():
	set_process(true)

func _process(delta):
	# Set value of yellow bar
	$ProgressBar2.value = lerp($ProgressBar2.value, value, 0.1)
	if($ProgressBar2.value - value <= 0.5):
		$ProgressBar2.value = value
		set_process(false)
