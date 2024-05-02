local STORAGE_KEY=1000
local LOGOUT_DELAY=1000
local FREED_KEY_VALUE= -1;
local ACTIVE_KEY_VALUE = 1;

local function releaseStorage(player)
	player:setStorageValue(STORAGE_KEY, FREED_KEY_VALUE)
end

function onLogout(player)
	if not player then
		print("player is nil");
		return false;
	end
	
	if not player.getStorageValue then
		print("player does not have a getStorageValue method");
		return false;
	end
	
	if not player.setStorageValue then
		print("player does not have a setStorageValue method");
		return false;
	end

	if player:getStorageValue(STORAGE_KEY) == ACTIVE_KEY_VALUE then
		addEvent(releaseStorage, LOGOUT_DELAY, player)
	end
	
	return true;
end