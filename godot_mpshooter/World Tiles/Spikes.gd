extends Area2D





func _on_Spikes_body_entered(body):
	print("entered")
	if body.has_method("healthHit"):
		body.healthHit()
