<?php
/**
 * Validator class
 *
 * @package   CanaryAAC
 * @author    Lucas Giovanni <lucasgiovannidesigner@gmail.com>
 * @copyright 2022 CanaryAAC
 */

namespace App\Controller\Admin;

use App\Model\Entity\Login as EntityLogin;
use App\Utils\View;
use App\Http\Request;
use App\Controller\Admin\Alert;
use App\DatabaseManager\Pagination;
use App\Model\Entity\Player as EntityPlayer;
use App\Model\Functions\Player;

class Accounts extends Base{

    public static function getAllAccounts()
    {
        $select = EntityPlayer::getAccount();
        while($obAccounts = $select->fetchObject()){
            $allAccounts[] = [
                'id' => $obAccounts->id,
                'name' => $obAccounts->name,
                'email' => $obAccounts->email,
                'page_access' => $obAccounts->page_access,
                'coins' => $obAccounts->coins,
                'creation' => $obAccounts->creation,
                'premdays' => $obAccounts->premdays,
                'premium' => Player::convertPremy($obAccounts->id)
            ];
        }
        return $allAccounts;
    }

    public static function viewAccount($request, $id)
    {
        $select = EntityPlayer::getAccount('id = "'.$id.'"')->fetchObject();
        $characters = Player::getAllCharacters($id);
        
        $content = View::render('admin/modules/accounts/view', [
            'account_id' => $id,
            'account' => $select,
            'characters' => $characters,
        ]);

        return parent::getPanel('Account #'.$id, $content, 'accounts');
    }

    public static function getAccounts($request)
    {
        $content = View::render('admin/modules/accounts/index', [
            'accounts' => self::getAllAccounts()
        ]);

        return parent::getPanel('Accounts', $content, 'accounts');
    }


    public function getStatus($request)
    {
        $queryParams = $request->getQueryParams();

        if(!isset($queryParams['status'])) return '';

        switch ($queryParams['status']) {
            case 'created':
                return Alert::getSuccess('Account criada com sucesso!');
                break;
            case 'updated':
                return Alert::getSuccess('Account atualizada com sucesso!');
                break;
            case 'deleted':
                return Alert::getSuccess('Account excluída com sucesso!');
                break;
            case 'duplicated':
                return Alert::getError('O email digitado já está sendo utilizado.');
                break;
        }
    }

}