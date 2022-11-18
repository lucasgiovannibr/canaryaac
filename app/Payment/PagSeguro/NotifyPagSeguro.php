<?php
/**
 * NotifyPagSeguro Class
 *
 * @package   CanaryAAC
 * @author    Lucas Giovanni <lucasgiovannidesigner@gmail.com>
 * @copyright 2022 CanaryAAC
 */

namespace App\Payment\PagSeguro;

use PagSeguro\Configuration\Configure;
use PagSeguro\Services\Transactions\Notification;
use App\Model\Entity\Payments as EntityPayments;
use App\Model\Entity\Account as EntityAccount;

class NotifyPagSeguro {

    public static function ReturnPagSeguro($request)
    {   

        if($_SERVER['REQUEST_METHOD'] != 'POST'){
            array('status_code' => 405, 'message' => "method not allowed");
        }

        $postVars = $request->getPostVars();
        if(!isset($postVars['notificationType'])){
            return array(422, "empty notification type");
        }

        if($postVars['notificationType'] != 'transaction'){
            error_log("PagSeguro notification received a non transaction notification type");
            return array(500, "non transaction notification type ".file_get_contents('php://input'));
        }
        $credentials = Configure::getAccountCredentials();
        $transaction = Notification::check($credentials);
            
        $reference = '6376c53f30f59';
        $transaction_status = $transaction->getStatus()->getTypeFromValue();
        $dbPayment = EntityPayments::getPayment('preference = "'.$reference.'"')->fetchObject();
        $dbAccount = EntityAccount::getAccount('id = "'.$dbPayment->account_id.'"')->fetchObject();
        $finalcoins = $dbAccount->coins + $dbPayment->total_coins;
        error_log('notification_status'.$transaction_status);
        switch ($transaction_status) {
            case 'PAID':
                EntityPayments::updatePayment('reference = "'.$reference.'"', ['status' => 4,]);
                EntityAccount::updateAccount('id = "'.$dbPayment->account_id.'"', ['coins' => $finalcoins,]);
                break;
            case 'IN_ANALISYS':
                EntityPayments::updatePayment('reference = "'.$reference.'"', ['status' => 3,]);
                break;
            case 'DECLINED':
                EntityPayments::updatePayment('reference = "'.$reference.'"', ['status' => 1,]);
                break;
            case 'CANCELED':
                EntityPayments::updatePayment('reference = "'.$reference.'"', ['status' => 1,]);
                break;
            default:
                EntityPayments::updatePayment('reference = "'.$reference.'"', ['status' => 0,]);
        }
        return array(200, "OK");
    }
}