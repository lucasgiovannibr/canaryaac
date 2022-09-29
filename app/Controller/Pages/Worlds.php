<?php
/**
 * Validator class
 *
 * @package   CanaryAAC
 * @author    Lucas Giovanni <lucasgiovannidesigner@gmail.com>
 * @copyright 2022 CanaryAAC
 */

namespace App\Controller\Pages;

use App\DatabaseManager\Pagination;
use App\Model\Functions\Player;
use App\Model\Entity\Worlds as EntityWorlds;
use \App\Utils\View;
use App\Model\Functions\Server;

class Worlds extends Base{
    
    public static function getWorld($request)
    {
        $queryParams = $request->getQueryParams();
        $currentWorld = $queryParams['world'] ?? '';
        $world = [];

        $selectWorlds = EntityWorlds::getWorlds('name = "'.$currentWorld.'"');
        while($obWorlds = $selectWorlds->fetchObject()){
            $world = [
                'id' => $obWorlds->id,
                'name' => $obWorlds->name
            ];
        }
        if(empty($world)){
            return false;
        }else{
            return $world;
        }
    }

    public static function getPlayerOnline($request,&$obPagination)
    {
        $queryParams = $request->getQueryParams();
        $currentPage = $queryParams['page'] ?? 1;
        $totalAmount = EntityWorlds::getWorlds(null, null, null, 'COUNT(*) as qtd')->fetchObject()->qtd;

        $obPagination = new Pagination($totalAmount, $currentPage, 10);

        $results = EntityWorlds::getWorlds(null, null, $obPagination->getLimit());

        $players = [];
        while($obOnline = $results->fetchObject(EntityWorlds::class)){
            $playersInfo = EntityWorlds::getPlayersOnline();
            while($obPlayers = $playersInfo->fetchObject()){
                $players[] = [
                    'name' => $obPlayers->name,
                    'level' => $obPlayers->level,
                    'vocation' => Player::convertVocation($obPlayers->vocation),
                    'outfit' => Player::getOutfit($obPlayers->id)
                ];
            }
        }
        return $players;
    }

    public static function getWorlds($request)
    {
        $content = View::render('pages/worlds', [
            'current_world' => self::getWorld($request),
            'worlds' => Server::getWorlds(),
            'online' => self::getPlayerOnline($request, $obPagination),
            'pagination' => self::getPagination($request, $obPagination),
            'boostedcreature' => Server::getBoostedCreature(),
        ]);
        return parent::getBase('Worlds', $content, 'worlds');
    }
}