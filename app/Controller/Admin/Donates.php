<?php
/**
 * Donates Class
 *
 * @package   CanaryAAC
 * @author    Lucas Giovanni <lucasgiovannidesigner@gmail.com>
 * @copyright 2022 CanaryAAC
 */

namespace App\Controller\Admin;

use App\Model\Entity\Account;
use App\Utils\View;
use App\Model\Entity\Payments;

class Donates extends Base{

    public static function statisticsPaytments()
    {
        $total_coins_approved = 0;
        $final_price_approved = 0;
        $select_payments_approved = Payments::getPayment('status = "4"');
        while ($payment_approved = $select_payments_approved->fetchObject()) {
            $total_coins_approved += $payment_approved->total_coins;
            $final_price_approved += $payment_approved->final_price;
        }

        $total_coins_cancelled = 0;
        $final_price_cancelled = 0;
        $select_payments_cancelled = Payments::getPayment('status = "2"');
        while ($payment_cancelled = $select_payments_cancelled->fetchObject()) {
            $total_coins_cancelled += $payment_cancelled->total_coins;
            $final_price_cancelled += $payment_cancelled->final_price;
        }

        $arrayStats = [
            'total_coins' => $total_coins_approved,
            'final_price' => $final_price_approved,
            'cancel_coins' => $total_coins_cancelled,
            'cancel_price' => $final_price_cancelled,
        ];
        return $arrayStats;
    }

    public static function convertStatus($status)
    {
        switch ($status) {
            case 1:
                return '<span class="badge rounded-pill badge-light-danger" text-capitalized=""> Cancelada </span>';
                exit;
            case 2:
                return '<span class="badge rounded-pill badge-light-info" text-capitalized=""> Aberto </span>';
                exit;
            case 3:
                return '<span class="badge rounded-pill badge-light-warning" text-capitalized=""> Analise </span>';
                exit;
            case 4:
                return '<span class="badge rounded-pill badge-light-success" text-capitalized=""> Pago </span>';
                exit;
            default:
                return '<span class="badge rounded-pill badge-light-danger" text-capitalized=""> Cancelada </span>';
                exit;
        }
    }

    public static function convertMethodImage($method)
    {
        switch ($method) {
            case 'paypal':
                return '<img src="'. URL . '/resources/images/payment/paymentmethodcategory31.gif">';
                exit;
            case 'pagseguro':
                return '<img src="'. URL . '/resources/images/payment/paymentmethodcategory32.gif">';
                exit;
            case 'mercadopago':
                return '<img src="'. URL . '/resources/images/payment/paymentmethodcategory144.gif">';
                exit;
            default:
                return '';
                exit;
        }
    }

    public static function getPaymentByReference($request, $reference)
    {
        if (empty($reference)) {
            return self::viewDonates($request);
        }
        $filter_reference = filter_var($reference, FILTER_SANITIZE_SPECIAL_CHARS);
        $payment = Payments::getPayment('reference = "'.$filter_reference.'"')->fetchObject();
        if (empty($payment)) {
            return self::viewDonates($request);
        }
        $arrayPayment = [
            'id' => $payment->id,
            'account_id' => $payment->account_id,
            'method' => $payment->method,
            'method_img' => self::convertMethodImage($payment->method),
            'reference' => $payment->reference,
            'total_coins' => $payment->total_coins,
            'final_price' => $payment->final_price,
            'status' => $payment->status,
            'status_badge' => self::convertStatus($payment->status),
            'date' => date('d/m/Y h:i:s', $payment->date),
        ];
        $select_account = Account::getAccount('id = "'.$payment->account_id.'"')->fetchObject();
        $arrayAccount = [
            'email' => $select_account->email,
        ];
        $arrayReturn = [
            'donate' => $arrayPayment,
            'account' => $arrayAccount,
        ];
        return $arrayReturn;
    }

    public static function viewPaymentByReference($request, $reference)
    {
        $paymentByReference = self::getPaymentByReference($request, $reference);
        $content = View::render('admin/modules/donates/view', [
            'donate' => $paymentByReference['donate'],
            'account' => $paymentByReference['account'],
        ]);
        return parent::getPanel('Donates', $content, 'donates');
    }

    public static function getPayments()
    {
        $select_payments = Payments::getPayment(null, 'id DESC');
        while ($payment = $select_payments->fetchObject()) {
            $arrayPayments[] = [
                'id' => $payment->id,
                'account_id' => $payment->account_id,
                'method' => $payment->method,
                'method_img' => self::convertMethodImage($payment->method),
                'reference' => $payment->reference,
                'total_coins' => $payment->total_coins,
                'final_price' => $payment->final_price,
                'status' => $payment->status,
                'status_badge' => self::convertStatus($payment->status),
                'date' => date('d/m/Y h:i:s', $payment->date),
            ];
        }
        return $arrayPayments;
    }

    public static function viewDonates($request, $errorMessage = null)
    {
        $content = View::render('admin/modules/donates/index', [
            'payments' => self::getPayments(),
            'stats' => self::statisticsPaytments()
        ]);
        return parent::getPanel('Donates', $content, 'donates');
    }

}