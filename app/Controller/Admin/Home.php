<?php
/**
 * Home Class
 *
 * @package   CanaryAAC
 * @author    Lucas Giovanni <lucasgiovannidesigner@gmail.com>
 * @copyright 2022 CanaryAAC
 */

namespace App\Controller\Admin;

use App\Utils\View;
use App\Model\Functions\Server;
use App\Model\Entity\Guilds as EntityGuild;
use App\Model\Entity\Houses as EntityHouses;
use App\Model\Entity\Market as EntityMarket;
use App\Model\Entity\Payments as EntityPayments;
use App\Model\Entity\Player as EntityPlayer;

class Home extends Base{

    public static function getTotalVocations()
    {
        $voc_sorcerer = (int)EntityPlayer::getPlayer('vocation = 1 or vocation = 5', null, null, 'COUNT(*) as qtd')->fetchObject()->qtd;
        $voc_druid = (int)EntityPlayer::getPlayer('vocation = 2', null, null, 'COUNT(*) as qtd')->fetchObject()->qtd;
        $voc_knight = (int)EntityPlayer::getPlayer('vocation = 3', null, null, 'COUNT(*) as qtd')->fetchObject()->qtd;
        $voc_paladin = (int)EntityPlayer::getPlayer('vocation = 4', null, null, 'COUNT(*) as qtd')->fetchObject()->qtd;

        $vocations = [
            'sorcerer' => $voc_sorcerer,
            'druid' => $voc_druid,
            'knight' => $voc_knight,
            'paladin' => $voc_paladin,
        ];
        return $vocations;
    }

    public static function getPaymentBetweenDate($month = '1')
    {
        $current_year = date('Y');
        $date_start = strtotime($current_year . '-' . $month . '-01');
        $date_end = strtotime($current_year . '-' . $month . '-' . date('t'));

        $payment_canceled_coins = 0;
        $payment_paid_coins = 0;

        $payment_paid_price = 0;
        $payment_canceled_price = 0;

        $select_payments = EntityPayments::getPayment('date BETWEEN "' . $date_start . '" AND "' . $date_end . '"');
        while ($payment = $select_payments->fetchObject()) {
            if ($payment->status == 4) {
                $payment_paid_coins += $payment->total_coins;
                $payment_paid_price += $payment->final_price;
            }
            if ($payment->status == 1) {
                $payment_canceled_coins += $payment->total_coins;
                $payment_canceled_price += $payment->final_price;
            }
        }
        return [
            'coins' => [
                'paid' => $payment_paid_coins,
                'canceled' => $payment_canceled_coins
            ],
            'price' => [
                'paid' => $payment_paid_price,
                'canceled' => $payment_canceled_price
            ]
        ];
    }

    public static function statsDonates()
    {
        return [
            'jan' => self::getPaymentBetweenDate(1),
            'feb' => self::getPaymentBetweenDate(2),
            'mar' => self::getPaymentBetweenDate(3),
            'apr' => self::getPaymentBetweenDate(4),
            'may' => self::getPaymentBetweenDate(5),
            'jun' => self::getPaymentBetweenDate(6),
            'jul' => self::getPaymentBetweenDate(7),
            'aug' => self::getPaymentBetweenDate(8),
            'sep' => self::getPaymentBetweenDate(9),
            'oct' => self::getPaymentBetweenDate(10),
            'nov' => self::getPaymentBetweenDate(11),
            'dec' => self::getPaymentBetweenDate(12)
        ];
    }

    public static function getHome($request)
    {
        $content = View::render('admin/modules/home/index', [
            'boosted_boss' => Server::getBoostedBoss(),
            'boosted_creature' => Server::getBoostedCreature(),
            'total_guilds' => (int)EntityGuild::getGuilds(null, null, null, 'COUNT(*) as qtd')->fetchObject()->qtd,
            'total_houses' => (int)EntityHouses::getHouses(null, null, null, 'COUNT(*) as qtd')->fetchObject()->qtd,
            'total_marketoffers' => (int)EntityMarket::getMarketOffers(null, null, null, 'COUNT(*) as qtd')->fetchObject()->qtd,
            'total_accounts' => (int)EntityPlayer::getAccount(null, null, null, 'COUNT(*) as qtd')->fetchObject()->qtd,
            'total_players' => (int)EntityPlayer::getPlayer(null, null, null, 'COUNT(*) as qtd')->fetchObject()->qtd,
            'total_vocations' => self::getTotalVocations(),
            'donate_stats' => self::statsDonates()
        ]);

        return parent::getPanel('Home', $content, 'home');
    }

}