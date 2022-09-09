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
use App\Model\Entity\Guilds as EntityGuild;
use App\Model\Entity\Bans as EntityBans;
use App\Model\Functions\Player;
use App\Model\Functions\Server;

class Bans extends Base{

    public static function getAllBans()
    {
        $select = EntityBans::getAccountBans();
        while($obAllBans = $select->fetchObject()){
            $allBans[] = [
                'account_id' => (int)$obAllBans->account_id,
                'reason' => $obAllBans->reason,
                'banned_at' => $obAllBans->banned_at,
                'expires_at' => $obAllBans->expires_at,
                'banned_by' => $obAllBans->banned_by
            ];
        }
        return $allBans ?? false;
    }

    public static function getBans($request)
    {
        $content = View::render('admin/modules/bans/index', [
            'guilds' => self::getAllBans(),
            'total_guilds' => (int)EntityGuild::getGuilds(null, null, null, 'COUNT(*) as qtd')->fetchObject()->qtd,
            'total_guildmembership' => (int)EntityGuild::getMembership(null, null, null, 'COUNT(*) as qtd')->fetchObject()->qtd,
            'total_guildwarskills' => (int)EntityGuild::getWars(null, null, null, 'COUNT(*) as qtd')->fetchObject()->qtd,
            'total_guildwars' => (int)EntityGuild::getWars(null, null, null, 'COUNT(*) as qtd')->fetchObject()->qtd,
            'total_players' => (int)EntityPlayer::getPlayer(null, null, null, 'COUNT(*) as qtd')->fetchObject()->qtd,
            'total_accounts' => (int)EntityPlayer::getAccount(null, null, null, 'COUNT(*) as qtd')->fetchObject()->qtd,
            'total_online' => (int)Server::getCountPlayersOnline(),
            'record_online' => Server::getRecordPlayers()
        ]);

        return parent::getPanel('Banimentos', $content, 'bans');
    }

}