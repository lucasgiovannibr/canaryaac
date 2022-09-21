<?php
/**
 * Validator class
 *
 * @package   CanaryAAC
 * @author    Lucas Giovanni <lucasgiovannidesigner@gmail.com>
 * @copyright 2022 CanaryAAC
 */

namespace App\Controller\Pages;

use App\Model\Entity\Achievements as EntityAchievements;
use App\Model\Entity\Player as EntityPlayer;
use App\Model\Entity\Worlds as EntityWorlds;
use App\Model\Functions\Achievements;
use App\Model\Functions\Player;
use App\Model\Functions\Server;
use \App\Utils\View;
use App\Session\Admin\Login as SessionAdminLogin;

class CharacterEdit extends Base{

    public static function updateCharacter($request, $name)
    {
        if(SessionAdminLogin::isLogged() == true){
            $AccountId = SessionAdminLogin::idLogged();
            $postVars = $request->getPostVars();

            $filt = urldecode($name);

            $filter_comment = filter_var($postVars['comment'], FILTER_SANITIZE_SPECIAL_CHARS);
            $filter_hidden = filter_var($postVars['accountvisible'], FILTER_SANITIZE_NUMBER_INT);
            if($filter_hidden > 1){
                $request->getRouter()->redirect('/account');
            }
            $hidden = $postVars['accountvisible'];
        
            $selectPlayer = EntityPlayer::getPlayer('name = "'.$filt.'"')->fetchObject();
            if($selectPlayer->deletion == 1){
                $request->getRouter()->redirect('/account');
            }
            if($selectPlayer->account_id == $AccountId){
                EntityPlayer::updatePlayer('id = "'.$selectPlayer->id.'"', [
                    'comment' => $filter_comment,
                    'hidden' => $hidden,
                ]);
                $request->getRouter()->redirect('/account');
            }
        }
        $request->getRouter()->redirect('/account');
    }

    public static function getAccountLogged($request, $name)
    {
        if(SessionAdminLogin::isLogged() == true){
            $AccountId = SessionAdminLogin::idLogged();
            $filter_name = filter_var($name, FILTER_SANITIZE_SPECIAL_CHARS);
            $filt = urldecode($filter_name);

            $player = [];
            $selectPlayer = EntityPlayer::getPlayer('name = "'.$filt.'"')->fetchObject();
            if($selectPlayer->deletion == 1){
                $request->getRouter()->redirect('/account');
            }
            if($selectPlayer->account_id == $AccountId){
                $player = [
                    'name' => $selectPlayer->name,
                    'sex' => Player::convertSex($selectPlayer->sex),
                    'world' => Server::getWorldById($selectPlayer->world),
                    'comment' => $selectPlayer->comment,
                    'hidden' => $selectPlayer->hidden,
                    'guild' => Player::getGuildMember($selectPlayer->id),
                ];
            }
        }
        return $player;
    }

    public static function getAchievementsPlayer($request, $name)
    {
        $filter_name = filter_var($name, FILTER_SANITIZE_SPECIAL_CHARS);
        $filter_nameurl = urldecode($filter_name);
        $select_player = EntityPlayer::getPlayer('name = "'.$filter_nameurl.'"')->fetchObject();
        if($select_player->deletion == 1){
            $request->getRouter()->redirect('/account');
        }

        $select_AllAchievements = EntityAchievements::getAchievements();
        while ($achievement = $select_AllAchievements->fetchObject()) {

            $finalStorage = 30000 + $achievement->storage;
            $achievementStatus = Player::getPlayerStorage($select_player->id, $finalStorage);
            
            $arrayAchievement[] = [
                'id' => $achievement->id,
                'name' => $achievement->name,
                'description' => $achievement->description,
                'grade' => $achievement->grade,
                'points' => $achievement->points,
                'storage' => $achievement->storage,
                'secret' => $achievement->secret,
                'status' => $achievementStatus
            ];
        }
        return $arrayAchievement ?? '';
    }

    public static function viewCharacterEdit($request, $name)
    {
        $content = View::render('pages/account/characteredit', [
            'player' => self::getAccountLogged($request, $name),
            'achievements' => self::getAchievementsPlayer($request, $name),
            'total_secretachievements' => (int)EntityAchievements::getAchievements('secret = "1"', null, null, 'COUNT(*) as qtd')->fetchObject()->qtd,
        ]);
        return parent::getBase('Account Management', $content, 'account');
    }

}