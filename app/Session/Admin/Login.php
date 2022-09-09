<?php
/**
 * Validator class
 *
 * @package   CanaryAAC
 * @author    Lucas Giovanni <lucasgiovannidesigner@gmail.com>
 * @copyright 2022 CanaryAAC
 */

namespace App\Session\Admin;

class Login{

    public static function init()
    {
        if(session_status() != PHP_SESSION_ACTIVE){
            session_start();
        }
    }

    public static function login($obAccount)
    {
        self::init();
        $_SESSION['account']['user'] = [
            'id' => $obAccount->id,
            'name' => $obAccount->name,
            'email' => $obAccount->email
        ];
        return true;
    }

    public static function isLogged()
    {
        self::init();
        return isset($_SESSION['account']['user']['id']);
    }

    public static function idLogged()
    {
        self::init();
        return $_SESSION['account']['user']['id'];
    }

    public static function logout()
    {
        self::init();
        unset($_SESSION['account']['user']);
        return true;
    }
}