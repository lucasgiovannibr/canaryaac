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
use App\Model\Functions\Server;
use App\Model\Entity\Guilds as EntityGuild;
use App\Model\Entity\Houses as EntityHouses;
use App\Model\Entity\Market as EntityMarket;
use App\Model\Entity\Player as EntityPlayer;
use App\Model\Entity\ServerConfig;

class Home extends Base{

    public static function getTotalVocations()
    {
        $voc_sorcerer = (int)EntityPlayer::getPlayer('vocation = 1 or vocation = 5', null, null, 'COUNT(*) as qtd')->fetchObject()->qtd;
        $voc_druid = (int)EntityPlayer::getPlayer('vocation = 2', null, null, 'COUNT(*) as qtd')->fetchObject()->qtd;
        $voc_knight = (int)EntityPlayer::getPlayer('vocation = 3', null, null, 'COUNT(*) as qtd')->fetchObject()->qtd;
        $voc_paladin = (int)EntityPlayer::getPlayer('vocation = 4', null, null, 'COUNT(*) as qtd')->fetchObject()->qtd;

        $vocations = [
            'sorcerer' => $voc_sorcerer,
            'druid' => $voc_druid,
            'knight' => $voc_knight,
            'paladin' => $voc_paladin,
        ];
        return $vocations;
    }

    public static function getHome($request)
    {
        $content = View::render('admin/modules/home/index', [
            'boosted_boss' => Server::getBoostedBoss(),
            'boosted_creature' => Server::getBoostedCreature(),
            'total_guilds' => (int)EntityGuild::getGuilds(null, null, null, 'COUNT(*) as qtd')->fetchObject()->qtd,
            'total_houses' => (int)EntityHouses::getHouses(null, null, null, 'COUNT(*) as qtd')->fetchObject()->qtd,
            'total_marketoffers' => (int)EntityMarket::getMarketOffers(null, null, null, 'COUNT(*) as qtd')->fetchObject()->qtd,
            'total_accounts' => (int)EntityGuild::getGuilds(null, null, null, 'COUNT(*) as qtd')->fetchObject()->qtd,
            'total_players' => (int)EntityPlayer::getPlayer(null, null, null, 'COUNT(*) as qtd')->fetchObject()->qtd,
            'total_vocations' => self::getTotalVocations(),
        ]);

        return parent::getPanel('Home', $content, 'home');
    }

}