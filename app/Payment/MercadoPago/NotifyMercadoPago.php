<?php
/**
 * NotifyMercadoPago Class
 *
 * @package   CanaryAAC
 * @author    Lucas Giovanni <lucasgiovannidesigner@gmail.com>
 * @copyright 2022 CanaryAAC
 */

namespace App\Payment\MercadoPago;

use MercadoPago\Payment;
use MercadoPago\SDK;
use App\Model\Entity\PaymentStatus;
use App\Model\Entity\Payments as EntityPayments;
use App\Model\Entity\Account as EntityAccount;

class NotifyMercadoPago {

    public static function ReturnMercadoPago($request)
    {
        if($_SERVER['REQUEST_METHOD'] != 'POST'){
            array('status_code' => 405, 'message' => "method not allowed");
        }

        $postVars = $request->getPostVars();
        
        if(!isset($postVars['type'])){
            return array('status_code' => 422, 'message' => "empty notification type");
        }
        SDK::setAccessToken($_ENV['MERCADOPAGO_TOKEN']);
        switch ($postVars["type"]) {
            case "payment":
                $payment = Payment::find_by_id($postVars['data']['id']);
                if(is_null($payment)) {
                    return array('status_code' => 404, 'message' => "payment not found");
                }
                self::updatePayment($payment);
                return array('status_code' => 200, 'message' => "ok");
            case "merchant_order":
                return array('status_code' => 200, 'message' => "ok");
            default:
                return array('status_code' => 418, 'message' => "unkown notification type");
        }
    }

    static function updatePayment($payment)
    {   
        switch ($payment->status) {
            case 'pending':
                EntityPayments::updatePayment('reference = "'.$payment->external_reference.'"', ['status' => PaymentStatus::Pending->value,]);
                break;
            case 'in_process':
                EntityPayments::updatePayment('reference = "'.$payment->external_reference.'"', ['status' => PaymentStatus::UnderAnalisys->value,]);
                break;
            case 'authorized':
                EntityPayments::updatePayment('reference = "'.$payment->external_reference.'"', ['status' => PaymentStatus::Processing->value,]);
                break;
            case 'approved':
                $dbPayment = EntityPayments::getPayment('reference = "'.$payment->external_reference.'"')->fetchObject();
                $dbAccount = EntityAccount::getAccount('id = "'.$dbPayment->account_id.'"')->fetchObject();
                $finalcoins = $dbAccount->coins + $dbPayment->total_coins;
                EntityPayments::updatePayment('reference = "'.$payment->external_reference.'"', [
                    'status' => PaymentStatus::Approved->value,
                    'net_payment' => $payment->transaction_details->net_received_amount,
                ]);
                EntityAccount::updateAccount('id = "'.$dbPayment->account_id.'"', ['coins' => $finalcoins,]);
                break;
            case 'rejected':
                EntityPayments::updatePayment('reference = "'.$payment->external_reference.'"', ['status' => PaymentStatus::Rejected->value,]);
                break;
            case 'cancelled':
                EntityPayments::updatePayment('reference = "'.$payment->external_reference.'"', ['status' => PaymentStatus::Canceled->value,]);
                break;
            default:
                EntityPayments::updatePayment('reference = "'.$payment->external_reference.'"', ['status' => PaymentStatus::Unknown->value,]);
                break;
        }
    }

}