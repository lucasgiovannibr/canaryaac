<?php
/**
 * Validator class
 *
 * @package   CanaryAAC
 * @author    Lucas Giovanni <lucasgiovannidesigner@gmail.com>
 * @copyright 2022 CanaryAAC
 */

namespace App\Controller\Pages;

use App\Model\Entity\Houses as EntityHouses;
use App\Model\Entity\Towns;
use App\Model\Functions\Player;
use \App\Utils\View;
use App\Model\Functions\Server;

class Houses extends Base{

    public static function getTowns()
    {
        $selectTowns = EntityHouses::getTowns();
        while($obTowns = $selectTowns->fetchObject()){
            $towns[] = [
                'town_id' => $obTowns->town_id,
                'name' => $obTowns->name
            ];
        }
        return $towns;
    }

    public static function getHouseList($request)
    {
        $queryParams = $request->getQueryParams();
        $page_Type = $queryParams['type'] ?? 'houses';
        $page_Town = filter_var($queryParams['town'] ?? 8, FILTER_SANITIZE_NUMBER_INT);
        $page_State = $queryParams['state'] ?? 'all';
        $page_Order = $queryParams['order'] ?? 'name';
        $page_Details = $queryParams['page'] ?? '';

        /*
        if(isset($queryParams['town'])){
            $query_Town = 'town_id = '.$queryParams['town'];
        }else{
            $query_Town = 8;
        }
        */

        if(isset($queryParams['order'])){
            $query_Order = $queryParams['order'];
        }else{
            $query_Order = '';
        }

        if($page_Type == 'houses'){
            $title_Type = 'Houses and Flats';
        }elseif($page_Type == 'guildhalls'){
            $title_Type = 'Guildhalls';
        }

        $selectHouse = EntityHouses::getHouses('town_id = "'.$page_Town.'"', '"'.$query_Order.'"');
        while($obHouse = $selectHouse->fetchObject()){
            $houses[] = [
                'owner' => $obHouse->owner,
                'paid' => $obHouse->paid,
                'warnings' => $obHouse->warnings,
                'name' => $obHouse->name,
                'rent' => $obHouse->rent,
                'town_id' => $obHouse->town_id,
                'bid' => $obHouse->bid,
                'bid_end' => $obHouse->bid_end,
                'last_bid' => $obHouse->last_bid,
                'highest_bidder' => $obHouse->highest_bidder,
                'size' => $obHouse->size,
                'guildid' => $obHouse->guildid,
                'beds' => $obHouse->beds
            ];
        }
        $testas = [
            'current' => [
                'title' => $title_Type ?? '',
                'world' => $queryParams['world'] ?? 0,
                'town' => Player::convertTown($page_Town),
                'town_id' => $page_Town,
                'state' => $page_State,
                'type' => $page_Type,
                'order' => $page_Order,
                'page' => $page_Details,
            ],
            'houses' => $houses ?? '',
        ];
        /*
        echo '<pre>';
        print_r($testas);
        echo '</pre>';
        exit;
        */
        return $testas ?? '';
    }

    public static function viewHouse($request, $name)
    {
        $filter_name = filter_var($name, FILTER_SANITIZE_SPECIAL_CHARS);
        $decode_name = urldecode($filter_name);
        $content = View::render('pages/community/housesview', [
            'worlds' => Server::getWorlds(),
            'towns' => self::getTowns(),
            'houseslist' => self::getHouseList($request),
        ]);
        return parent::getBase('Houses', $content, 'houses');
    }

    public static function getHouses($request)
    {
        $content = View::render('pages/community/houses', [
            'worlds' => Server::getWorlds(),
            'towns' => self::getTowns(),
            'houseslist' => self::getHouseList($request),
        ]);
        return parent::getBase('Houses', $content, 'houses');
    }
}