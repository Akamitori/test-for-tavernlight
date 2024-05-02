void Game::addItemToPlayer(const std::string &recipient, uint16_t itemId) {
	
	// using unique ptr will allow some simple pointer management
	// without us having to go through implementing our RAII pattern
    std::unique_ptr<Player> player(g_game.getPlayerByName(recipient));
    if (!player) {
        player.reset(new Player(nullptr));
        if (!IOLoginData::loadPlayerByName(player.get(), recipient)) {
            return;
        }
    }
    
    std::unique_ptr<Item> item(Item::CreateItem(itemId));
    if (!item) {
        return;
    }

    g_game.internalAddItem(player->getInbox(), item.get(), INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player.get());
    }
}
