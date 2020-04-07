if not _G.VocalPagerTracker then
	_G.VocalPagerTracker = {}
	
    local HUDAssaultCorner_init = HUDAssaultCorner.init
    local total_pagers = 0
	
    function HUDAssaultCorner:init(...)
	    HUDAssaultCorner_init(self, ...)
	    for i, val in ipairs(tweak_data.player.alarm_pager.bluff_success_chance) do
		    if val > 0 then
			    total_pagers = math.max(total_pagers, i)
		    end
	    end
    end

    function VocalPagerTracker:remove_pager()
	    total_pagers = total_pagers - 1
	    local local_player = managers.player:local_player()
		
		if total_pagers < 1 and alive(local_player) and managers.criminals:local_character_name() == "jacket" then
		    local_player:sound():say("v22", true)
		elseif total_pagers < 1 and alive(local_player) and managers.criminals:local_character_name() == "dragan" then
		    local_player:sound():say("p28", true)
		elseif total_pagers < 1 and alive(local_player) then
		    local_player:sound():say("g29", true)
		end
    end
end