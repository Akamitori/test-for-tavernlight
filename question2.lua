function printSmallGuildNames(memberCount)

	-- avoiding any string or SQL injection shenanigans
	local sanitizedMember=tonumber(memberCount)
	
	if not sanitizedMember then
		print("Function was not provided with a number")
		return
	end
	
	local selectGuildQuery = "SELECT `name` FROM guilds WHERE max_members < %d;"
	
	local query = db.storeQuery(string.format(selectGuildQuery, sanitizedMember))
	
	if not query then
		print(string.format("No guilds found with less than %d members", sanitizedMember))
		return
	end
	
	repeat
		local guildName = query.getString(query,'name')
		print(guildName)
	until not result.next(query)
		
	query.free()
end