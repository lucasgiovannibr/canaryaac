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
use App\Model\Entity\ServerConfig as EntityServerConfig;

class Worlds extends Base{

    public static function insertWorld($request)
    {
        $postVars = $request->getPostVars();

        if(isset($postVars['world_create'])){

            if(empty($postVars['world_name'])){
                $status = Alert::getError('Defina um nome.');
                return self::viewWorlds($request, $status);
            }
            $filter_name = filter_var($postVars['world_name'], FILTER_SANITIZE_SPECIAL_CHARS);
            $dbWorld = EntityServerConfig::getWorlds('name = "'.$filter_name.'"')->fetchObject();
            if(!empty($dbWorld)){
                $status = Alert::getError('Já existe um mundo com este nome.');
                return self::viewWorlds($request, $status);
            }

            if(empty($postVars['world_location'])){
                $status = Alert::getError('Selecione uma localização.');
                return self::viewWorlds($request, $status);
            }
            $filter_location = filter_var($postVars['world_location'], FILTER_SANITIZE_NUMBER_INT);
            if($filter_location > 7){
                $status = Alert::getError('Location inválida.');
                return self::viewWorlds($request, $status);
            }

            $filter_pvp_type = filter_var($postVars['world_pvp_type'], FILTER_SANITIZE_NUMBER_INT);
            if($filter_pvp_type > 4){
                $status = Alert::getError('Pvp Type inválido.');
                return self::viewWorlds($request, $status);
            }

            $filter_premium_type = filter_var($postVars['world_premium_type'], FILTER_SANITIZE_NUMBER_INT);
            if($filter_premium_type > 1){
                $status = Alert::getError('Premium Type inválido.');
                return self::viewWorlds($request, $status);
            }

            $filter_transfer_type = filter_var($postVars['world_transfer_type'], FILTER_SANITIZE_NUMBER_INT);
            if($filter_transfer_type > 1){
                $status = Alert::getError('Transfer Type inválido.');
                return self::viewWorlds($request, $status);
            }

            $filter_battle_eye = filter_var($postVars['world_battle_eye'], FILTER_SANITIZE_NUMBER_INT);
            if($filter_battle_eye > 2){
                $status = Alert::getError('Battle-Eye inválido.');
                return self::viewWorlds($request, $status);
            }

            $filter_world_type = filter_var($postVars['world_world_type'], FILTER_SANITIZE_NUMBER_INT);
            if($filter_world_type > 1){
                $status = Alert::getError('World Type inválido.');
                return self::viewWorlds($request, $status);
            }

            if (empty($postVars['world_ipaddress'])) {
                $status = Alert::getError('IP inválido.');
                return self::viewWorlds($request, $status);
            }

            if (empty($postVars['world_port'])) {
                $status = Alert::getError('Port inválido.');
                return self::viewWorlds($request, $status);
            }

            EntityServerConfig::insertWorld(
                [
                    'name' => $filter_name,
                    'location' => $filter_location,
                    'pvp_type' => $filter_pvp_type,
                    'premium_type' => $filter_premium_type,
                    'transfer_type' => $filter_transfer_type,
                    'battle_eye' => $filter_battle_eye,
                    'world_type' => $filter_world_type,
                    'ip' => $postVars['world_ipaddress'],
                    'port' => $postVars['world_port'],
                ]
            );
            $status = Alert::getSuccess('World criado com sucesso.');
            return self::viewWorlds($request, $status);
        }

        if(isset($postVars['delete_world'])){
            if(empty($postVars['world_id'])){
                $status = Alert::getError('Nenhum world encontrado.');
                return self::viewWorlds($request, $status);
            }
            $filter_world = filter_var($postVars['world_id'], FILTER_SANITIZE_NUMBER_INT);
            $dbWorld = EntityServerConfig::getWorlds('id = "'.$filter_world.'"')->fetchObject();
            if(empty($dbWorld)){
                $status = Alert::getError('Nenhum world encontrado.');
                return self::viewWorlds($request, $status);
            }
            EntityServerConfig::deleteWorld('id = "'.$filter_world.'"');
            
            $status = Alert::getSuccess('Deletado com sucesso.');
            return self::viewWorlds($request, $status);
        }
        
    }

    public static function viewWorlds($request, $status = null)
    {
        $content = View::render('admin/modules/worlds/index', [
            'status' => $status,
            'worlds' => Server::getWorlds(),
        ]);
        return parent::getPanel('Worlds', $content, 'worlds');
    }
}