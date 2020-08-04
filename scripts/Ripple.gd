extends Sprite

var duration = 3.0
var trans_type = Tween.TRANS_SINE
var ease_type = Tween.EASE_IN_OUT
var low_alpha = 0.0
var high_alpha = 1.0

var tween

# Called when the node enters the scene tree for the first time.
func _ready():
	tween = Tween.new()
	add_child(tween)
	set("modulate", Color(1, 1, 1, low_alpha))

func fade_in():
	tween.interpolate_property(self, "modulate", Color(1, 1, 1, low_alpha),
		Color(1, 1, 1, high_alpha), duration, trans_type, ease_type)
	tween.connect("tween_all_completed", self, "fade_out", [], Object.CONNECT_ONESHOT)
	tween.start()

func fade_out():
	tween.interpolate_property(self, "modulate", Color(1, 1, 1, high_alpha),
		Color(1, 1, 1, low_alpha), duration, trans_type, ease_type)
	tween.connect("tween_all_completed", self, "fade_in", [], Object.CONNECT_ONESHOT)
	tween.start()
