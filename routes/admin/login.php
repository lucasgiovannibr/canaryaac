<?php

use App\Http\Response;
use App\Controller\Admin\Login;

$obRouter->get('/admin/login', [
    'middlewares' => [
        'required-logout',
    ],
    function($request){
        return new Response(200, Login::getLogin($request));
    }
]);
$obRouter->post('/admin/login', [
    'middlewares' => [
        'required-logout',
    ],
    function($request){
        return new Response(200, Login::setLogin($request));
    }
]);

$obRouter->get('/admin/logout', [
    'middlewares' => [
        'required-login'
    ],
    function($request){
        return new Response(200, Login::setLogout($request));
    }
]);