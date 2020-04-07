local _o_sync_teammate_progress = UnitNetworkHandler.sync_teammate_progress
function UnitNetworkHandler:sync_teammate_progress(type_index, enabled, tweak_data_id, timer, success, sender)
	_o_sync_teammate_progress(self, type_index, enabled, tweak_data_id, timer, success, sender)
	if tweak_data_id == "corpse_alarm_pager" and success == true then
		VocalPagerTracker:remove_pager()
	end	
end