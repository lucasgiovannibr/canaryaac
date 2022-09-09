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
use App\Model\Entity\Market as EntityMarket;

class Market extends Base{

    public static function getAllMarketOffers()
    {
        $select = EntityMarket::getMarketOffers();
        while($obAllMarketOffers = $select->fetchObject()){
            $allMarketOffers[] = [
                'id' => (int)$obAllMarketOffers->id,
                'player_id ' => (int)$obAllMarketOffers->player_id,
                'sale ' => $obAllMarketOffers->sale,
                'itemtype ' => $obAllMarketOffers->itemtype,
                'amount' => $obAllMarketOffers->amount,
                'created ' => $obAllMarketOffers->created,
                'anonymous' => $obAllMarketOffers->anonymous,
                'price' => $obAllMarketOffers->price
            ];
        }
        return $allMarketOffers ?? false;
    }

    public static function getMarketOffers($request)
    {
        $content = View::render('admin/modules/market/index', [
            'offers' => self::getAllMarketOffers(),
            'total_offers' => (int)EntityMarket::getMarketOffers(null, null, null, 'COUNT(*) as qtd')->fetchObject()->qtd,
            'total_offershistory' => (int)EntityMarket::getMarketHistory(null, null, null, 'COUNT(*) as qtd')->fetchObject()->qtd,
        ]);

        return parent::getPanel('Market Offers', $content, 'market');
    }

}