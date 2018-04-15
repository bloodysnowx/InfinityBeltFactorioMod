local refill_belts = function(inventory, belt)
	local belt_count = inventory.get_item_count(belt)
	if belt_count < 50 then
		inventory.insert{name=belt, count=1}
	end	
end

local on_built_entity_event = function(event)
	local player = game.players[event.player_index]
	local item = event.created_entity
	if item.type == "transport-belt" or item.type == "underground-belt" then
		refill_belts(player.get_main_inventory(), item.name)
	end
end

script.on_event(defines.events.on_built_entity, on_built_entity_event)