<?php
/**
 * Validator class
 *
 * @package   CanaryAAC
 * @author    Lucas Giovanni <lucasgiovannidesigner@gmail.com>
 * @copyright 2022 CanaryAAC
 */

namespace App\Controller\Pages;

use \App\Utils\View;
use App\Model\Entity\Houses as EntityHouses;
use App\Model\Entity\Player;
use App\Model\Entity\Worlds as EntityWorlds;
use App\Model\Functions\Player as FunctionsPlayer;
use App\Session\Admin\Login as SessionAdminLogin;
use App\Model\Functions\Server as FunctionsServer;

class Houses extends Base{

    private static $arrayTowns = [
        [
            'id' => 5,
            'name' => 'Ab\'Dendriel',
        ],
        [
            'id' => 10,
            'name' => 'Ankrahmun',
        ],
        [
            'id' => 6,
            'name' => 'Carlin',
        ],
        [
            'id' => 13,
            'name' => 'Darashia',
        ],
        [
            'id' => 11,
            'name' => 'Edron',
        ],
        [
            'id' => 12,
            'name' => 'Farmine',
        ],
        [
            'id' => 18,
            'name' => 'Gray Beach',
        ],
        [
            'id' => 22,
            'name' => 'Issavi',
        ],
        [
            'id' => 7,
            'name' => 'Kazordoon',
        ],
        [
            'id' => 14,
            'name' => 'Liberty Bay',
        ],
        [
            'id' => 15,
            'name' => 'Port Hope',
        ],
        [
            'id' => 20,
            'name' => 'Rathleton',
        ],
        [
            'id' => 16,
            'name' => 'Svargrond',
        ],
        [
            'id' => 8,
            'name' => 'Thais',
        ],
        [
            'id' => 9,
            'name' => 'Venore',
        ],
        [
            'id' => 17,
            'name' => 'Yalahar',
        ],
    ];

    public static function convertTown($town_id = null)
    {
        foreach (self::$arrayTowns as $key => $value) {
            if (empty($town_id)) {
                return '';
            }
            if ($value['id'] == $town_id) {
                return $value['name'];
            }
        }
    }

    public static function viewBid($request, $house_id, $status = null)
    {
        if (!filter_var($house_id, FILTER_VALIDATE_INT)) {
            $request->getRouter()->redirect('/community/houses');
        }
        $idLogged = SessionAdminLogin::idLogged();
        $filter_house_id = filter_var($house_id, FILTER_SANITIZE_NUMBER_INT);
        $select_house = EntityHouses::getHouses('house_id = "'.$filter_house_id.'"')->fetchObject();
        if (empty($select_house)) {
            $request->getRouter()->redirect('/community/houses');
        }
        if ($select_house->owner != 0) {
            $request->getRouter()->redirect('/community/houses');
        }
        if ($select_house->bid_end == strtotime(date('Y-m-d H:i:s'))) {
            $request->getRouter()->redirect('/community/houses');
        }
        $owner_name = Player::getPlayer('id = "'.$select_house->owner.'"')->fetchObject();
        $select_highest_bidder = Player::getPlayer('id = "'.$select_house->highest_bidder.'"')->fetchObject();
        if (empty($select_highest_bidder)) {
            $highest_bidder_name = '';
        } else {
            $highest_bidder_name = $select_highest_bidder->name;
        }
        $arrayHouse = [
            'house_id' => $select_house->house_id,
            'world_id' => $select_house->world_id,
            'world' => FunctionsServer::getWorldById($select_house->world_id),
            'owner' => $select_house->owner,
            'owner_name' => $owner_name,
            'paid' => $select_house->paid,
            'warnings' => $select_house->warnings,
            'name' => $select_house->name,
            'rent' => FunctionsServer::convertGold($select_house->rent),
            'town_id' => $select_house->town_id,
            'bid' => $select_house->bid,
            'bid_end' => date('M d Y', $select_house->bid_end),
            'days_to_end' => date('M d Y', $select_house->bid_end),
            'last_bid' => $select_house->last_bid,
            'highest_bidder' => $select_house->highest_bidder,
            'highest_bidder_name' => $highest_bidder_name,
            'size' => $select_house->size,
            'guildid' => $select_house->guildid,
            'beds' => $select_house->beds,
        ];
        $select_players = Player::getPlayer('account_id = "'.$idLogged.'"');
        while ($player = $select_players->fetchObject()) {
            $select_house_owner = EntityHouses::getHouses('owner = "'.$player->id.'"')->fetchObject();
            if (empty($select_house_owner)) {
                if ($player->world == $select_house->world_id) {
                    $arrayPlayers[] = [
                        'id' => $player->id,
                        'name' => $player->name,
                    ];
                }
            }
        }
        $content = View::render('pages/community/housebid', [
            'status' => $status,
            'house' => $arrayHouse,
            'players' => $arrayPlayers ?? '',
        ]);
        return parent::getBase('Houses', $content, 'houses');
    }

    public static function insertBid($request, $house_id)
    {
        $postVars = $request->getPostVars();
        $idLogged = SessionAdminLogin::idLogged();

        if (!filter_var($house_id, FILTER_VALIDATE_INT)) {
            $request->getRouter()->redirect('/community/houses');
        }
        if (empty($postVars['bid_limit'])) {
            $request->getRouter()->redirect('/community/houses/' . $house_id . '/view');
        }
        if (empty($postVars['bid_player'])) {
            $request->getRouter()->redirect('/community/houses/' . $house_id . '/view');
        }
        if (!filter_var($postVars['bid_limit'], FILTER_VALIDATE_INT)) {
            $request->getRouter()->redirect('/community/houses/' . $house_id . '/view');
        }
        if (!filter_var($postVars['bid_player'], FILTER_VALIDATE_INT)) {
            $request->getRouter()->redirect('/community/houses/' . $house_id . '/view');
        }
        $filter_bid_limit = filter_var($postVars['bid_limit'], FILTER_SANITIZE_NUMBER_INT);
        $filter_bid_player = filter_var($postVars['bid_player'], FILTER_SANITIZE_NUMBER_INT);
        $filter_house_id = filter_var($house_id, FILTER_SANITIZE_NUMBER_INT);
        $select_house = EntityHouses::getHouses('house_id = "'.$filter_house_id.'"')->fetchObject();
        if (empty($select_house)) {
            $request->getRouter()->redirect('/community/houses');
        }
        if ($select_house->owner != 0) {
            $request->getRouter()->redirect('/community/houses/' . $house_id . '/view');
        }
        if ($filter_bid_limit <= $select_house->last_bid) {
            $status = 'Your bid must be higher than the last one.';
            return self::viewBid($request, $house_id, $status);
        }
        $select_player = Player::getPlayer('id = "'.$filter_bid_player.'"')->fetchObject();
        if (empty($select_player)) {
            $request->getRouter()->redirect('/community/houses/' . $house_id . '/view');
        }
        if ($select_player->account_id != $idLogged) {
            $request->getRouter()->redirect('/community/houses/' . $house_id . '/view');
        }
        if ($select_player->world != $select_house->world_id) {
            $status = 'No characters in the World selected.';
            return self::viewBid($request, $house_id, $status);
        }
        if ($select_player->balance <= $filter_bid_limit) {
            $status = 'This character does not have enough money in the bank.';
            return self::viewBid($request, $house_id, $status);
        }
        if ($select_house->bid_end == 0) {
            $date_bid_end = strtotime(date('Y-m-d H:i:s', strtotime('+7 days')));
        } else {
            if ($select_house->bid_end >= strtotime(date('Y-m-d H:i:s'))) {
                $date_bid_end = $select_house->bid_end;
            }
            if ($select_house->bid_end <= strtotime(date('Y-m-d H:i:s'))) {
                $request->getRouter()->redirect('/community/houses/' . $house_id . '/view');
            }
        }
        
        EntityHouses::updateHouse('house_id = "'.$select_house->house_id.'"', [
            'last_bid' => $filter_bid_limit,
            'bid' => $filter_bid_limit,
            'bid_end' => $date_bid_end,
            'highest_bidder' => $select_player->id
        ]);
        $status = 'Successful bid.';
        return self::viewBid($request, $house_id, $status);
    }

    public static function getHouseList($request)
    {
        $queryParams = $request->getQueryParams();
        $page_Type = $queryParams['type'] ?? 'houses';
        $page_Town = filter_var($queryParams['town'] ?? 8, FILTER_SANITIZE_NUMBER_INT);
        $page_State = $queryParams['state'] ?? 'all';
        $page_Order = $queryParams['order'] ?? 'name';
        $page_Details = $queryParams['page'] ?? '';
        if (empty($queryParams['world'])) {
            $queryParams['world'] = null;
        }
        $filter_world = filter_var($queryParams['world'], FILTER_SANITIZE_SPECIAL_CHARS);
        $select_world = EntityWorlds::getWorlds('name = "'.$filter_world.'"')->fetchObject();
        if (empty($select_world)) {
            $world = 1;
        } else {
            $world = $select_world->id;
        }
        if(isset($queryParams['order'])){
            if ($queryParams['order'] == 'name') {
                $query_Order = 'name ASC';
            }
            if ($queryParams['order'] == 'size') {
                $query_Order = 'size DESC';
            }
            if ($queryParams['order'] == 'rent') {
                $query_Order = 'rent DESC';
            }
        }else{
            $query_Order = '';
        }
        if($page_Type == 'houses'){
            $title_Type = 'Houses and Flats';
        }elseif($page_Type == 'guildhalls'){
            $title_Type = 'Guildhalls';
        }
        $selectHouse = EntityHouses::getHouses('town_id = "'.$page_Town.'" AND world_id = "'.$world.'"', ''.$query_Order.'');
        while($obHouse = $selectHouse->fetchObject()){
            $bid_date_end = floor(($obHouse->bid_end - strtotime(date('Y-m-d'))) / (60 * 60 * 24));
            $houses[] = [
                'house_id' => $obHouse->house_id,
                'owner' => $obHouse->owner,
                'paid' => $obHouse->paid,
                'warnings' => $obHouse->warnings,
                'name' => $obHouse->name,
                'rent' => FunctionsServer::convertGold($obHouse->rent),
                'town_id' => $obHouse->town_id,
                'bid' => $obHouse->bid,
                'bid_end' => $obHouse->bid_end,
                'bid_date' => $bid_date_end,
                'last_bid' => $obHouse->last_bid,
                'highest_bidder' => $obHouse->highest_bidder,
                'size' => $obHouse->size,
                'guildid' => $obHouse->guildid,
                'beds' => $obHouse->beds
            ];
        }
        $arrayHouses = [
            'current' => [
                'title' => $title_Type ?? '',
                'world' => $queryParams['world'] ?? 0,
                'town' => self::convertTown($page_Town),
                'town_id' => $page_Town,
                'state' => $page_State,
                'type' => $page_Type,
                'order' => $page_Order,
                'page' => $page_Details,
            ],
            'houses' => $houses ?? '',
        ];
        return $arrayHouses ?? '';
    }

    public static function viewHouse($request, $house_id)
    {
        if (empty($house_id)) {
            $request->getRouter()->redirect('/community/houses');
        }
        if (!filter_var($house_id, FILTER_VALIDATE_INT)) {
            $request->getRouter()->redirect('/community/houses');
        }
        $filter_house_id = filter_var($house_id, FILTER_SANITIZE_NUMBER_INT);
        $select_house = EntityHouses::getHouses('house_id = "'.$filter_house_id.'"')->fetchObject();
        if (empty($select_house)) {
            $request->getRouter()->redirect('/community/houses');
        }
        $select_highest_bidder = Player::getPlayer('id = "'.$select_house->highest_bidder.'"')->fetchObject();
        if (empty($select_highest_bidder)) {
            $highest_bidder_name = '';
        } else {
            $highest_bidder_name = $select_highest_bidder->name;
        }
        $select_owner = Player::getPlayer('id = "'.$select_house->owner.'"')->fetchObject();
        if (empty($select_owner)) {
            $owner_name = '';
        } else {
            $owner_name = $select_owner->name;
        }
        $bid_date_end = floor(($select_house->bid_end - strtotime(date('Y-m-d'))) / (60 * 60 * 24));
        $arrayHouse = [
            'house_id' => $select_house->house_id,
            'world_id' => $select_house->world_id,
            'world' => FunctionsServer::getWorldById($select_house->world_id),
            'owner' => $select_house->owner,
            'owner_name' => $owner_name,
            'paid' => $select_house->paid,
            'warnings' => $select_house->warnings,
            'name' => $select_house->name,
            'rent' => FunctionsServer::convertGold($select_house->rent),
            'town_id' => $select_house->town_id,
            'bid' => $select_house->bid,
            'bid_end' => $select_house->bid_end,
            'bid_date' => date('M d Y', $select_house->bid_end),
            'bid_date_end' => $bid_date_end,
            'last_bid' => $select_house->last_bid,
            'highest_bidder' => $select_house->highest_bidder,
            'highest_bidder_name' => $highest_bidder_name,
            'size' => $select_house->size,
            'guildid' => $select_house->guildid,
            'beds' => $select_house->beds,
        ];
        $content = View::render('pages/community/housesview', [
            'worlds' => FunctionsServer::getWorlds(),
            'towns' => self::$arrayTowns,
            'houseslist' => self::getHouseList($request),
            'house' => $arrayHouse
        ]);
        return parent::getBase('Houses', $content, 'houses');
    }

    public static function getHouses($request)
    {
        $content = View::render('pages/community/houses', [
            'worlds' => FunctionsServer::getWorlds(),
            'towns' => self::$arrayTowns,
            'houseslist' => self::getHouseList($request),
        ]);
        return parent::getBase('Houses', $content, 'houses');
    }
}