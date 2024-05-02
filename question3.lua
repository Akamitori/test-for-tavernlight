function remove_member_from_player_party(playerId, member_to_remove)

if not playerId then
	print("player id not provided")
	return
end

if not member_to_remove then
	print("member to remove was not provided")
	return
end

player = Player(playerId)

if not player then
    print("Player not found!")
    return
end

local party = player:getParty()

if not party then
    print("Player has not party!")
    return
end

local party_members=party:getMembers();

if not party_members then
    print("No party data was returned")
    return
end

if #party_members == 0 then
    print("Party has no members") 
    return
end

for _,member  in pairs(party_members) do
        if member:getName()  == member_to_remove then
            party:removeMember(Player(member_to_remove))
        end
end

