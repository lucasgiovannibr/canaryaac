<?php
/**
 * Validator class
 *
 * @package   CanaryAAC
 * @author    Lucas Giovanni <lucasgiovannidesigner@gmail.com>
 * @copyright 2022 CanaryAAC
 */

namespace App\Controller\Api;

use Exception;

class Outfit extends Api{

    public static function getOutfitUrl($request)
    {
        $queryParams = $request->getQueryParams();
        if(empty($queryParams['looktype'])){
            throw new Exception('Nenhuma guild foi encontrada.', 404);
        }
        $looktype = $queryParams['looktype'];
        $lookaddons = $queryParams['lookaddons'] ?? 0;
        $lookhead = $queryParams['lookhead'] ?? 0;
        $lookbody = $queryParams['lookbody'] ?? 0;
        $looklegs = $queryParams['looklegs'] ?? 0;
        $lookfeet = $queryParams['lookfeet'] ?? 0;
        $outfit = [
            'outfit' => 'https://outfit-images-oracle.ots.me/1285_walk_animation/animoutfit.php?id='.$looktype.'&addons='.$lookaddons.'&head='.$lookhead.'&body='.$lookbody.'&legs='.$looklegs.'&feet='.$lookfeet.'',
        ];
        return $outfit;
    }

    public static function getOutfit($request)
    {
        return self::getOutfitUrl($request);
    }
    
}