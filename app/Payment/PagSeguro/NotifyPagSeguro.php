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
use App\Model\Entity\PaymentStatus;
use App\Model\Entity\Payments as EntityPayments;
use App\Model\Entity\Account as EntityAccount;

class NotifyPagSeguro {

    public static function ReturnPagSeguro($request)
    {   
        ApiPagSeguro::initialize();
        if($_SERVER['REQUEST_METHOD'] != 'POST'){
            array('status_code' => 405, 'message' => "method not allowed");
        }

        $postVars = $request->getPostVars();
        if(!isset($postVars['notificationType'])){
            return array('status_code' => 422, 'message' => "empty notification type");
        }

        if($postVars['notificationType'] != 'transaction'){
            error_log("PagSeguro notification received a non transaction notification type");
            return array('status_code' => 500, 'message' => "non transaction notification type ".file_get_contents('php://input'));
        }
        $credentials = Configure::getAccountCredentials();
        $transaction = Notification::check($credentials);
        
        $reference = $transaction->getReference();
        $transaction_status = $transaction->getStatus();
        self::updatePayment($transaction_status, $reference);

        return array('status_code' => 200, 'message' => "ok");
    }

    static function updatePayment($transaction_status, $reference)
    {   
        switch ($transaction_status) {
            case '1': // Pending Payment
                EntityPayments::updatePayment('reference = "'.$reference.'"', ['status' => PaymentStatus::Pending->value,]);
                break;
            case '2': // Under Analisys
                EntityPayments::updatePayment('reference = "'.$reference.'"', ['status' => PaymentStatus::UnderAnalisys->value,]);
                break;
            case '3': // Paid
                $dbPayment = EntityPayments::getPayment('reference = "'.$reference.'"')->fetchObject();
                $dbAccount = EntityAccount::getAccount('id = "'.$dbPayment->account_id.'"')->fetchObject();
                $finalcoins = $dbAccount->coins + $dbPayment->total_coins;
                EntityPayments::updatePayment('reference = "'.$reference.'"', ['status' => PaymentStatus::Approved->value,]);
                EntityAccount::updateAccount('id = "'.$dbPayment->account_id.'"', ['coins' => $finalcoins,]);
                break;
            case '7': // Canceled or Rejected
                EntityPayments::updatePayment('reference = "'.$reference.'"', ['status' => PaymentStatus::Canceled->value,]);
                break;
            default:
                EntityPayments::updatePayment('reference = "'.$reference.'"', ['status' => PaymentStatus::Unknown->value,]);
                break;
        }
    }
}