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

class Settings extends Base{
    
    public static function insertWorld($request)
    {
        $postVars = $request->getPostVars();
        if(isset($postVars['website_update'])){
            if(empty($postVars['website_title'])){
                $status = Alert::getError('Defina um nome.');
                return self::viewSettings($request, $status);
            }
            $filter_title = filter_var($postVars['website_title'], FILTER_SANITIZE_SPECIAL_CHARS);

            if(empty($postVars['website_download'])){
                $status = Alert::getError('Defina um link de download.');
                return self::viewSettings($request, $status);
            }
            $filter_download = filter_var($postVars['website_download'], FILTER_SANITIZE_SPECIAL_CHARS);
            if(!filter_var($filter_download, FILTER_VALIDATE_URL)){
                $status = Alert::getError('Defina uma URL válida.');
                return self::viewSettings($request, $status);
            }

            if(empty($postVars['website_vocation'])){
                $filter_vocation = 0;
            }else{
                $filter_vocation = 1;
            }
            if($filter_vocation > 1){
                $status = Alert::getError('Defina se está ativo as vocações.');
                return self::viewSettings($request, $status);
            }

            if(empty($postVars['website_maxplayers'])){
                $status = Alert::getError('Defina o máximo de players por conta.');
                return self::viewSettings($request, $status);
            }
            $filter_maxplayers = filter_var($postVars['website_maxplayers'], FILTER_SANITIZE_NUMBER_INT);
            if(!filter_var($filter_maxplayers, FILTER_VALIDATE_INT)){
                $status = Alert::getError('Defina o máximo de players por conta.');
                return self::viewSettings($request, $status);
            }

            if(empty($postVars['website_levelguild'])){
                $status = Alert::getError('Defina o level minimo para Guilds.');
                return self::viewSettings($request, $status);
            }
            $filter_levelguild = filter_var($postVars['website_levelguild'], FILTER_SANITIZE_NUMBER_INT);
            if(!filter_var($filter_levelguild, FILTER_VALIDATE_INT)){
                $status = Alert::getError('Defina o level minimo para Guilds.');
                return self::viewSettings($request, $status);
            }

            EntityServerConfig::updateInfoWebsite('id = 1', [
                'title' => $filter_title,
                'downloads' => $filter_download,
                'player_voc' => $filter_vocation,
                'player_max' => $filter_maxplayers,
                'player_guild' => $filter_levelguild,
            ]);
            $status = Alert::getSuccess('Atualizado com sucesso.');
            return self::viewSettings($request, $status);
        }
    }

    public static function viewSettings($request, $status = null)
    {
        $dbServer = EntityServerConfig::getInfoWebsite()->fetchObject();
        $content = View::render('admin/modules/settings/index', [
            'status' => $status,
            'title' => $dbServer->title,
            'download_link' => $dbServer->downloads,
            'player_voc' => $dbServer->player_voc,
            'player_max' => $dbServer->player_max,
            'player_guild' => $dbServer->player_guild,
            'worlds' => Server::getWorlds(),
        ]);
        return parent::getPanel('Settings', $content, 'settings');
    }
}