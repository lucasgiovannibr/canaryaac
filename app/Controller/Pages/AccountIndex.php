<?php
/**
 * Validator class
 *
 * @package   CanaryAAC
 * @author    Lucas Giovanni <lucasgiovannidesigner@gmail.com>
 * @copyright 2022 CanaryAAC
 */

namespace App\Controller\Pages;

use App\Model\Entity\Account;
use App\Model\Entity\Player as EntityPlayer;
use App\Model\Entity\Worlds as EntityWorlds;
use App\Model\Functions\Player;
use \App\Utils\View;
use App\Session\Admin\Login as SessionAdminLogin;

class AccountIndex extends Base{

    public static function getWorlds($world_id)
    {
        $arrayAllWorlds = [];
        $world = EntityWorlds::getWorlds('id = "'.$world_id.'"')->fetchObject();
        if($world == true){
            $arrayAllWorlds = [
                'id' => $world->id,
                'name' => $world->name,
                'location' => $world->location,
                'pvp_type' => $world->pvp_type,
                'premium_type' => $world->premium_type,
                'transfer_type' => $world->transfer_type,
                'battle_eye' => $world->battle_eye,
                'world_type' => $world->world_type
            ];
        }
        return $arrayAllWorlds;
    }

    public static function getAccountLogged()
    {
        $logged = [];
        if(SessionAdminLogin::isLogged() == true){
            $admin = SessionAdminLogin::idLogged();

            $account = EntityPlayer::getAccount('id = "'.$admin.'"')->fetchObject();
            $playerMain = EntityPlayer::getPlayer('account_id = "'.$account->id.'" AND main = "1"')->fetchObject();
            $playerNoMain = EntityPlayer::getPlayer('account_id = "'.$account->id.'" AND main = "0"');

            $accountRegistred = Account::getAccountRegistration('account_id = "'.$admin.'"')->fetchObject();
            if(empty($accountRegistred)){
                $registered = false;
            }else{
                $registered = true;
            }

            $datePrem = date('d F Y H:i:s', strtotime('+'.$account->premdays.' days'));

            $players = [];
            while($char = $playerNoMain->fetchObject()){
                $players[] = [
                        'id' => $char->id,
                        'name' => $char->name,
                        'world' => self::getWorlds($char->world),
                        'level' => $char->level,
                        'outfit' => Player::getOutfit($char->id),
                        'vocation' => Player::convertVocation($char->vocation),
                        'online' => Player::isOnline($char->id),
                        'deletion' => $char->deletion,
                        'skull' => Player::getSkull($char->id),
                        'isreward' => $char->isreward,
                        'hidden' => $char->hidden,
                        'guild' => Player::getGuildMember($char->id),
                ];
            }

            $logged = [
                'id' => $account->id,
                'name' => $account->name,
                'email' => $account->email,
                'premdays' => $account->premdays,
                'dateprem' => $datePrem,
                'coins' => $account->coins,
                'registered' => $registered,
                'page_access' => $account->page_access,
                'player' => [
                    'id' => $playerMain->id,
                    'name' => $playerMain->name,
                    'world' => self::getWorlds($playerMain->world),
                    'level' => $playerMain->level,
                    'outfit' => Player::getOutfit($playerMain->id),
                    'vocation' => Player::convertVocation($playerMain->vocation),
                    'group' => Player::convertGroup($playerMain->group_id),
                    'outfit' => Player::getOutfit($playerMain->id),
                    'main' => $playerMain->main,
                    'online' => Player::isOnline($playerMain->id),
                    'deletion' => $playerMain->deletion,
                    'isreward' => $playerMain->isreward,
                    'hidden' => $playerMain->hidden,
                    'guild' => Player::getGuildMember($playerMain->id),
                ],
                'players' => $players,
            ];
        }
        return $logged;
    }

    public static function getAccount($request)
    {
        $content = View::render('pages/account/index', [
            'title' => 'test',
            'account' => self::getAccountLogged()
        ]);
        return parent::getBase('Account Management', $content, 'account');
    }

}