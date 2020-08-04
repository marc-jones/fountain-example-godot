extends Sprite

var ripple_offset = 2.5

var elapsed_time = 0.0
var ripple_array = []

func _ready():
	$R1.fade_in()
	ripple_array = [$R2, $R3]

func _process(delta):
	elapsed_time += delta
	if elapsed_time > ripple_offset:
		var ripple = ripple_array.pop_front()
		if not ripple == null:
			ripple.fade_in()
			print('willy')
		elapsed_time -= ripple_offset
