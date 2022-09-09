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
use App\Model\Entity\Account as EntityAccount;

class AccountLost extends Base{

    public static function selectAccount($request)
    {
        $postVars = $request->getPostVars();
        $email = $postVars['email'];
        $filter_email = filter_var($email, FILTER_SANITIZE_EMAIL);
        if(!filter_var($filter_email, FILTER_VALIDATE_EMAIL)){
            return self::getLostAccount($request);
        }

        $account = EntityAccount::getAccount('email = "'.$filter_email.'"')->fetchObject();
        if($account == false){
            return self::getLostAccount($request);
        }
        
        $content = View::render('pages/lostaccount_first', [
            'email' => $account->email,
        ]);
        return parent::getBase('Lost Account', $content, 'lostaccount');
    }

    public static function getLostAccount($request)
    {
        $content = View::render('pages/lostaccount', [
        ]);
        return parent::getBase('Lost Account', $content, 'lostaccount');
    }

}