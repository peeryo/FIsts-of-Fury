class_name BasicEnemy
extends Character

@export var player : Player

var player_slot : EnemySlot = null

func handle_input() -> void:
	if player != null and can_move():
		
		if player_slot == null:
			player_slot = player.reserve_slot(self)

		
		if player_slot != null:	
			var direction := (player_slot.global_position - global_position).normalized()
			if (player_slot.global_position - global_position).length() < 1:
				velocity = Vector2.ZERO
			else:
				velocity = direction * speed

func on_receive_damage(damage : int, direction: Vector2,hit_type: DamageReceiver.HitType) -> void:
	super.on_receive_damage(damage, direction, hit_type)
	if current_health == 0:
		player.free_slot(self)
