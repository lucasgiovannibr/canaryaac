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
use App\Model\Entity\Payments as EntityPayments;
use App\Model\Entity\ServerConfig as EntityServerConfig;

class Donates extends Base{

    public static function statisticsPaytments()
    {
        $total_coins_approved = 0;
        $final_price_approved = 0;
        $select_payments_approved = EntityPayments::getPayment('status = 4');
        while ($payment_approved = $select_payments_approved->fetchObject()) {
            $total_coins_approved += $payment_approved->total_coins;
            $final_price_approved += $payment_approved->final_price;
        }

        $total_coins_cancelled = 0;
        $final_price_cancelled = 0;
        $select_payments_cancelled = EntityPayments::getPayment('status = 2');
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
                return '<span class="badge rounded-pill badge-light-danger" text-capitalized=""> Canceled </span>';
                exit;
            case 2:
                return '<span class="badge rounded-pill badge-light-info" text-capitalized=""> Open </span>';
                exit;
            case 3:
                return '<span class="badge rounded-pill badge-light-warning" text-capitalized=""> Under Analysis </span>';
                exit;
            case 4:
                return '<span class="badge rounded-pill badge-light-success" text-capitalized=""> Paid </span>';
                exit;
            default:
                return '<span class="badge rounded-pill badge-light-danger" text-capitalized=""> Canceled </span>';
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
        $payment = EntityPayments::getPayment('reference = "'.$filter_reference.'"')->fetchObject();
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
        $select_payments = EntityPayments::getPayment(null, 'id DESC');
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

    public static function updateDonates($request)
    {
        $postVars = $request->getPostVars();

        if (isset($postVars['edit_donate'])) {

            if (empty($postVars['coin_price'])) {
                $status = SweetAlert::Types('Error!', 'Something went wrong.', 'error', 'btn btn-danger');
                return self::viewDonates($request, $status);
            }
            $filter_coin_price = filter_var($postVars['coin_price'], FILTER_SANITIZE_SPECIAL_CHARS);

            if(empty($postVars['checkboxDonates'])){
                $filter_Donates = 0;
            }else{
                $filter_Donates = 1;
            }
            if($filter_Donates > 1){
                $status = SweetAlert::Types('Error!', 'Something went wrong.', 'error', 'btn btn-danger');
                return self::viewDonates($request, $status);
            }

            if(empty($postVars['checkboxMercadoPago'])){
                $filter_MercadoPago = 0;
            }else{
                $filter_MercadoPago = 1;
            }
            if($filter_MercadoPago > 1){
                $status = SweetAlert::Types('Error!', 'Something went wrong.', 'error', 'btn btn-danger');
                return self::viewDonates($request, $status);
            }
            if(empty($postVars['checkboxPayPal'])){
                $filter_PayPal = 0;
            }else{
                $filter_PayPal = 1;
            }
            if($filter_PayPal > 1){
                $status = SweetAlert::Types('Error!', 'Something went wrong.', 'error', 'btn btn-danger');
                return self::viewDonates($request, $status);
            }
            if(empty($postVars['checkboxPagSeguro'])){
                $filter_PagSeguro = 0;
            }else{
                $filter_PagSeguro = 1;
            }
            if($filter_PagSeguro > 1){
                $status = SweetAlert::Types('Error!', 'Something went wrong.', 'error', 'btn btn-danger');
                return self::viewDonates($request, $status);
            }

            EntityServerConfig::updateInfoWebsite('id = "1"', [
                'donates' => $filter_Donates,
                'coin_price' => $filter_coin_price,
                'mercadopago' => $filter_MercadoPago,
                'paypal' => $filter_PayPal,
                'pagseguro' => $filter_PagSeguro
            ]);

            $status = SweetAlert::Types('Success!', 'Updated successfully.', 'success', 'btn btn-success');
            return self::viewDonates($request, $status);

        }

        if (isset($postVars['edit_products'])) {

            if (empty($postVars['product_1'])) {
                $status = SweetAlert::Types('Error!', 'Something went wrong.', 'error', 'btn btn-danger');
                return self::viewDonates($request, $status);
            }
            $filter_product_1 = filter_var($postVars['product_1'], FILTER_SANITIZE_SPECIAL_CHARS);

            if (empty($postVars['product_2'])) {
                $status = SweetAlert::Types('Error!', 'Something went wrong.', 'error', 'btn btn-danger');
                return self::viewDonates($request, $status);
            }
            $filter_product_2 = filter_var($postVars['product_2'], FILTER_SANITIZE_SPECIAL_CHARS);

            if (empty($postVars['product_3'])) {
                $status = SweetAlert::Types('Error!', 'Something went wrong.', 'error', 'btn btn-danger');
                return self::viewDonates($request, $status);
            }
            $filter_product_3 = filter_var($postVars['product_3'], FILTER_SANITIZE_SPECIAL_CHARS);

            if (empty($postVars['product_4'])) {
                $status = SweetAlert::Types('Error!', 'Something went wrong.', 'error', 'btn btn-danger');
                return self::viewDonates($request, $status);
            }
            $filter_product_4 = filter_var($postVars['product_4'], FILTER_SANITIZE_SPECIAL_CHARS);

            if (empty($postVars['product_5'])) {
                $status = SweetAlert::Types('Error!', 'Something went wrong.', 'error', 'btn btn-danger');
                return self::viewDonates($request, $status);
            }
            $filter_product_5 = filter_var($postVars['product_5'], FILTER_SANITIZE_SPECIAL_CHARS);

            if (empty($postVars['product_6'])) {
                $status = SweetAlert::Types('Error!', 'Something went wrong.', 'error', 'btn btn-danger');
                return self::viewDonates($request, $status);
            }
            $filter_product_6 = filter_var($postVars['product_6'], FILTER_SANITIZE_SPECIAL_CHARS);

            EntityServerConfig::updateProducts('id = "1"', [
                'coins' => $filter_product_1
            ]);
            EntityServerConfig::updateProducts('id = "2"', [
                'coins' => $filter_product_2
            ]);
            EntityServerConfig::updateProducts('id = "3"', [
                'coins' => $filter_product_3
            ]);
            EntityServerConfig::updateProducts('id = "4"', [
                'coins' => $filter_product_4
            ]);
            EntityServerConfig::updateProducts('id = "5"', [
                'coins' => $filter_product_5
            ]);
            EntityServerConfig::updateProducts('id = "6"', [
                'coins' => $filter_product_6
            ]);
            $status = SweetAlert::Types('Success!', 'Updated successfully.', 'success', 'btn btn-success');
            return self::viewDonates($request, $status);

        }

    }

    public static function getProducts()
    {
        $select_ServerConfig = EntityServerConfig::getInfoWebsite()->fetchObject();
        $select_products = EntityServerConfig::getProducts(null, 'id ASC');
        while ($product = $select_products->fetchObject()) {
            $final_price = $select_ServerConfig->coin_price * $product->coins;
            $arrayProducts[] = [
                'id' => $product->id,
                'coins' => $product->coins,
                'final_price' => $final_price
            ];
        }
        return $arrayProducts;
    }

    public static function viewDonates($request, $status = null)
    {
        $dbServer = EntityServerConfig::getInfoWebsite()->fetchObject();
        $content = View::render('admin/modules/donates/index', [
            'status' => $status,
            'payments' => self::getPayments(),
            'stats' => self::statisticsPaytments(),
            'products' => self::getProducts(),
            'active_donates' => $dbServer->donates,
            'active_mercadopago' => $dbServer->mercadopago,
            'active_paypal' => $dbServer->paypal,
            'active_pagseguro' => $dbServer->pagseguro,
            'coin_price' => $dbServer->coin_price
        ]);
        return parent::getPanel('Donates', $content, 'donates');
    }

}