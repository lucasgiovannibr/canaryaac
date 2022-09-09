<?php
/**
 * Validator class
 *
 * @package   CanaryAAC
 * @author    Lucas Giovanni <lucasgiovannidesigner@gmail.com>
 * @copyright 2022 CanaryAAC
 */

namespace App\Controller\Admin;

use App\Utils\View;
use App\Model\Entity\Player as EntityPlayer;
use App\Model\Functions\Player;
use App\Model\Functions\Server;

class Players extends Base{

    public static function getAllPlayers()
    {
        $select = EntityPlayer::getPlayer();
        while($obAllPlayers = $select->fetchObject()){
            $allPlayers[] = [
                'id' => $obAllPlayers->id,
                'account_id' => $obAllPlayers->account_id,
                'name' => $obAllPlayers->name,
                'level' => (int)$obAllPlayers->level,
                'vocation' => Player::convertVocation($obAllPlayers->vocation),
                'group' => Player::convertGroup($obAllPlayers->group_id),
                'online' => Player::isOnline($obAllPlayers->id),
                'outfit' => Player::getOutfit($obAllPlayers->id),
                'skull' => Player::getSkull($obAllPlayers->id),
                'premdays' => Player::getPremDays($obAllPlayers->account_id),
                'premium' => Player::convertPremy($obAllPlayers->account_id),
                'coins' => Player::getCoins($obAllPlayers->account_id),
                'main' => $obAllPlayers->main
            ];
        }
        return $allPlayers;
    }

    public static function viewPlayer($request, $id)
    {
        //$select = EntityPlayer::getAccount('id = "'.$id.'"')->fetchObject();
        //$characters = Player::getAllCharacters($id);
        $character = EntityPlayer::getPlayer('id = "'.$id.'"', null, '1')->fetchObject();
        $content = View::render('admin/modules/players/view', [
            'player_id' => $id,
            'character' => $character,
            'town' => Server::convertTown($character->town_id),
            'name' => $character->name,
            'level' => $character->level,
            'vocation' => Player::convertVocation($character->vocation),
            'group' => Player::convertGroup($character->group_id),
            'outfit' => Player::getOutfit($character->id),
            'online' => Player::isOnline($character->id)
        ]);

        return parent::getPanel('Player #'.$id, $content, 'players');
    }

    public static function getPlayers($request)
    {
        $content = View::render('admin/modules/players/index', [
            'players' => self::getAllPlayers(),
            'total_players' => (int)EntityPlayer::getPlayer(null, null, null, 'COUNT(*) as qtd')->fetchObject()->qtd,
            'total_accounts' => (int)EntityPlayer::getAccount(null, null, null, 'COUNT(*) as qtd')->fetchObject()->qtd,
            'total_online' => (int)Server::getCountPlayersOnline(),
            'record_online' => Server::getRecordPlayers()
        ]);

        return parent::getPanel('Players', $content, 'players');
    }

}