<?php
/**
 * Validator class
 *
 * @package   CanaryAAC
 * @author    Lucas Giovanni <lucasgiovannidesigner@gmail.com>
 * @copyright 2022 CanaryAAC
 */

namespace App\Controller\Pages;

use App\Model\Entity\Account as EntityAccount;
use App\Payment\PagSeguro\ApiPagSeguro;
use App\Payment\MercadoPago\ApiMercadoPago;
use App\Payment\PayPal\ApiPayPal;
use \App\Utils\View;
use App\Session\Admin\Login as SessionAdminLogin;
use App\Model\Entity\Payments as EntityPayments;

class Payment extends Base{

    public static function viewPayment()
    {
        $idLogged = SessionAdminLogin::idLogged();
        $dbAccount = EntityAccount::getAccount('id = "'.$idLogged.'"')->fetchObject();

        $content = View::render('pages/shop/payment', [
            'email' => $dbAccount->email ?? null,
        ]);
        return parent::getBase('Webshop', $content, 'donate');
    }

    public static function viewPaymentData($request)
    {
        $idLogged = SessionAdminLogin::idLogged();
        $dbAccount = EntityAccount::getAccount('id = "'.$idLogged.'"')->fetchObject();
        $postVars = $request->getPostVars();

        if(!isset($postVars['payment_country'])){
            $request->getRouter()->redirect('/payment');
        }
        if(!isset($postVars['payment_method'])){
            $request->getRouter()->redirect('/payment');
        }
        if(!isset($postVars['payment_coins'])){
            $request->getRouter()->redirect('/payment');
        }

        $content = View::render('pages/shop/paymentdata', [
            'country' => $postVars['payment_country'],
            'coins' => $postVars['payment_coins'],
            'method' => $postVars['payment_method'],
            'email' => $dbAccount->email ?? null,
        ]);
        return parent::getBase('Webshop', $content, 'donate');
    }

    public static function viewPaymentConfirm($request)
    {
        $idLogged = SessionAdminLogin::idLogged();
        $dbAccount = EntityAccount::getAccount('id = "'.$idLogged.'"')->fetchObject();
        $postVars = $request->getPostVars();

        if(!isset($postVars['payment_email'])){
            $request->getRouter()->redirect('/payment');
        }
        if(!filter_var($postVars['payment_email'], FILTER_VALIDATE_EMAIL)){
            $request->getRouter()->redirect('/payment');
        }

        $filter_coins = filter_var($postVars['payment_coins'], FILTER_SANITIZE_NUMBER_INT);
        $price = self::convertCoinsToPrice($filter_coins);
        $final_price = $filter_coins * $price;
        
        $content = View::render('pages/shop/paymentconfirm', [
            'method' => $postVars['payment_method'],
            'coins' => $filter_coins,
            'country' => $postVars['payment_country'],
            'email' => $postVars['payment_email'],
            'price' => $final_price,
        ]);
        return parent::getBase('Webshop', $content, 'donate');
    }

    public static function viewPaymentSummary($request)
    {
        $idLogged = SessionAdminLogin::idLogged();
        $dbAccount = EntityAccount::getAccount('id = "'.$idLogged.'"')->fetchObject();
        $postVars = $request->getPostVars();

        if($postVars['TermsOfService'] != 1){
            $request->getRouter()->redirect('/payment');
        }
        if(!isset($postVars['payment_coins'])){
            $request->getRouter()->redirect('/payment');
        }
        if(!isset($postVars['payment_method'])){
            $request->getRouter()->redirect('/payment');
        }
        if(!isset($postVars['payment_country'])){
            $request->getRouter()->redirect('/payment');
        }
        if(!isset($postVars['payment_email'])){
            $request->getRouter()->redirect('/payment');
        }

        if(!filter_var($postVars['payment_email'], FILTER_VALIDATE_EMAIL)){
            $request->getRouter()->redirect('/payment');
        }
        $filter_email = filter_var($postVars['payment_email'], FILTER_SANITIZE_EMAIL);

        $filter_method = filter_var($postVars['payment_method'], FILTER_SANITIZE_SPECIAL_CHARS);
        switch($filter_method)
        {
            case 'paypal':
                $url_method = 1;
                break;
            case 'pagseguro':
                $url_method = 2;
                break;
            case 'pix':
                $url_method = 3;
                break;
            case 'mercadopago':
                $url_method = 4;
                break;
            default:
                $url_method = 0;
        }
        if($url_method == 0){
            $request->getRouter()->redirect('/payment');
        }

        if(!filter_var($postVars['payment_coins'], FILTER_VALIDATE_INT)){
            $request->getRouter()->redirect('/payment');
        }
        $filter_coins = filter_var($postVars['payment_coins'], FILTER_SANITIZE_NUMBER_INT);
        $final_price = self::convertCoinsToPrice($filter_coins);
        if($final_price == 0){
            $request->getRouter()->redirect('/payment');
        }
        $price = $final_price * $filter_coins;

        // METHOD PAGSEGURO
        if($url_method == 2){
            $reference = uniqid();
            $checkout = [
                'reference' => $reference,
                'item' => [
                    'id' => '0001',
                    'title' => $filter_coins.' Coins',
                    'amount' => $final_price,
                    'quantity' => $filter_coins,
                ],
            ];
            $code_payment = ApiPagSeguro::createPaymentLightBox($checkout, $filter_email);
            $order = [
                'account_id' => $idLogged,
                'method' => 'pagseguro',
                'reference' => $reference,
                'total_coins' => $filter_coins,
                'final_price' => $price,
                'status' => 0,
                'date' => strtotime(date('Y-m-d h:i:s')),
            ];
            EntityPayments::insertPayment($order);
        }

        // METHOD PAYPAL
        if($url_method == 1){
            $reference = uniqid();
            $checkout = [
                'reference' => $reference,
                'item' => [
                    'id' => '0001',
                    'title' => $filter_coins.' Coins',
                    'amount' => $final_price,
                    'quantity' => $filter_coins,
                ],
            ];
            $code_payment = ApiPayPal::createPayment($checkout, $filter_email);
            $order = [
                'account_id' => $idLogged,
                'method' => 'paypal',
                'reference' => $reference,
                'total_coins' => $filter_coins,
                'final_price' => $price,
                'status' => 0,
                'date' => strtotime(date('Y-m-d h:i:s')),
            ];
            EntityPayments::insertPayment($order);
        }

        // METHOD PIX
        if($url_method == 3){}

        // METHOD MERCADO PAGO
        if($url_method == 4){
            $reference = uniqid();
            $checkout = [
                'reference' => $reference,
                'item' => [
                    'id' => '0001',
                    'title' => $filter_coins.' Coins',
                    'amount' => $final_price,
                    'quantity' => $filter_coins,
                ],
            ];
            $code_payment = ApiMercadoPago::createPaymentSandbox($checkout, $filter_email);
            $order = [
                'account_id' => $idLogged,
                'method' => 'mercadopago',
                'reference' => $reference,
                'total_coins' => $filter_coins,
                'final_price' => $price,
                'status' => 0,
                'date' => strtotime(date('Y-m-d h:i:s')),
            ];
            EntityPayments::insertPayment($order);
            /*
            echo '<pre>';
            print_r($code_payment);
            echo '</pre>';
            exit;
            */
        }

        $content = View::render('pages/shop/paymentsummary', [
            'email' => $filter_email,
            'method' => $url_method,
            'code_payment' => $code_payment ?? null,
        ]);
        return parent::getBase('Webshop', $content, 'donate');
    }

    public static function convertCoinsToPrice($total_coins)
    {
        $filter_coins = filter_var($total_coins, FILTER_SANITIZE_NUMBER_INT);
        $arrayPacks = [
            250 => 0.50,
            750 => 0.50,
            1500 => 0.50,
            3000 => 0.50,
            4500 => 0.50,
            15000 => 0.50,
        ];
        foreach($arrayPacks as $coin => $price){
            if($coin == $filter_coins){
                $final_price = $price;
            }
        }

        return $final_price ?? 0;
    }

}