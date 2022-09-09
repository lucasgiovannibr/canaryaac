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
use App\Model\Entity\Houses as EntityHouse;
use App\Model\Functions\Player;
use App\Model\Functions\Server;
use App\Controller\Admin\Alert;

class Houses extends Base{

    public static function getHousesXml($request)
    {
        $postVars = $request->getPostVars();;
        $localxml = filter_var($postVars['localxml'], FILTER_SANITIZE_SPECIAL_CHARS);
        $array = simplexml_load_file($localxml);

        foreach($array as $house){
            if($house['guildhall'] == true){
                $guild = 1;
            }else{
                $guild = 0;
            }
            $houses = [
                'house_id' => $house['houseid'],
                'name' => $house['name'],
                'rent' => $house['rent'],
                'town_id' => $house['townid'],
                'size' => $house['size'],
                'guildid' => $guild,
            ];
            EntityHouse::insertHouses($houses);
        }
        $status = Alert::getSuccess('XML importado com sucesso!') ?? null;
        return self::getHouses($request, $status);
    }

    public static function deleteHouses($request)
    {
        $postVars = $request->getPostVars();
        $house_id = $postVars['houseid'];
        EntityHouse::deleteHouse('id = "'.$house_id.'"');
        
        $status = Alert::getSuccess('House deletada com sucesso!') ?? null;

        return self::getHouses($request, $status);
    }

    public static function getAllHouses()
    {
        $select = EntityHouse::getHouses();
        while($obAllHouses = $select->fetchObject()){
            $allHouses[] = [
                'id' => (int)$obAllHouses->id,
                'house_id' => $obAllHouses->house_id,
                'owner' => $obAllHouses->owner,
                'paid' => $obAllHouses->paid,
                'warnings' => $obAllHouses->warnings,
                'name' => $obAllHouses->name,
                'rent' => number_format($obAllHouses->rent, 0, '.', '.'),
                'town_id' => Server::convertTown($obAllHouses->town_id),
                'bid' => $obAllHouses->bid,
                'bid_end' => $obAllHouses->bid_end,
                'last_bid' => $obAllHouses->last_bid,
                'highest_bidder' => $obAllHouses->highest_bidder,
                'size' => (int)$obAllHouses->size,
                'guildid' => (int)$obAllHouses->guildid,
                'beds' => (int)$obAllHouses->beds
            ];
        }
        return $allHouses ?? false;
    }

    public static function getHouses($request, $errorMessage = null)
    {
        $content = View::render('admin/modules/houses/index', [
            'status' => $errorMessage,
            'houses' => self::getAllHouses(),
            'total_houses' => (int)EntityHouse::getHouses(null, null, null, 'COUNT(*) as qtd')->fetchObject()->qtd,
            'total_houses_rented' => (int)EntityHouse::getHouses('owner != 0', null, null, 'COUNT(*) as qtd')->fetchObject()->qtd,
        ]);

        return parent::getPanel('Houses', $content, 'houses');
    }

}