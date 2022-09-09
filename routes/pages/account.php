<?php

use App\Controller\Pages\AccountAuthentication;
use App\Http\Response;
use App\Controller\Pages\AccountIndex as playerAccount;
use App\Controller\Pages\AccountLogin as playerLogin;
use App\Controller\Pages\AccountManage;
use App\Controller\Pages\AccountRegistration;
use App\Controller\Pages\AccountLost;
use App\Controller\Pages\CreateCharacter;
use App\Controller\Pages\CreateAccount;
use App\Controller\Pages\CharacterEdit;
use App\Controller\Pages\CharacterDelete;
use App\Controller\Pages\AccountChangePassword;
use App\Controller\Pages\AccountChangeEmail;
use App\Controller\Pages\ChangeMainCharacter;

$obRouter->get('/account', [
    'middlewares' => [
        'required-login'
    ],
    function($request){
        return new Response(200, playerAccount::getAccount($request));
    }
]);
$obRouter->get('/account/login', [
    'middlewares' => [
        'required-logout'
    ],
    function($request){
        return new Response(200, playerLogin::getLogin($request));
    }
]);
$obRouter->post('/account/login', [
    'middlewares' => [
        'required-logout'
    ],
    function($request){
        return new Response(200, playerLogin::setLogin($request));
    }
]);
$obRouter->get('/account/logout', [
    'middlewares' => [
        'required-login'
    ],
    function($request){
        return new Response(200, playerLogin::setLogout($request));
    }
]);

$obRouter->get('/account/createcharacter', [
    'middlewares' => [
        'required-login'
    ],
    function($request){
        return new Response(200, CreateCharacter::viewCreateCharacter($request));
    }
]);
$obRouter->post('/account/createcharacter', [
    'middlewares' => [
        'required-login'
    ],
    function($request){
        return new Response(200, CreateCharacter::insertCharacter($request));
    }
]);

$obRouter->get('/account/manage', [
    'middlewares' => [
        'required-login'
    ],
    function($request){
        return new Response(200, AccountManage::getAccount($request));
    }
]);

$obRouter->get('/account/registration', [
    'middlewares' => [
        'required-login'
    ],
    function($request){
        return new Response(200, AccountRegistration::getRegistration($request));
    }
]);
$obRouter->post('/account/registration', [
    'middlewares' => [
        'required-login'
    ],
    function($request){
        return new Response(200, AccountRegistration::insertRegister($request));
    }
]);

$obRouter->get('/account/lostaccount', [
    'middlewares' => [
        'required-logout'
    ],
    function($request){
        return new Response(200, AccountLost::getLostAccount($request));
    }
]);
$obRouter->post('/account/lostaccount', [
    'middlewares' => [
        'required-logout'
    ],
    function($request){
        return new Response(200, AccountLost::selectAccount($request));
    }
]);

$obRouter->get('/account/character/{name}/edit', [
    'middlewares' => [
        'required-login'
    ],
    function($request, $name){
        return new Response(200, CharacterEdit::viewCharacterEdit($request, $name));
    }
]);
$obRouter->post('/account/character/{name}/edit', [
    'middlewares' => [
        'required-login'
    ],
    function($request, $name){
        return new Response(200, CharacterEdit::updateCharacter($request, $name));
    }
]);
$obRouter->get('/account/character/{name}/delete', [
    'middlewares' => [
        'required-login'
    ],
    function($request, $name){
        return new Response(200, CharacterDelete::viewCharacterDelete($request, $name));
    }
]);
$obRouter->post('/account/character/{name}/delete', [
    'middlewares' => [
        'required-login'
    ],
    function($request, $name){
        return new Response(200, CharacterDelete::deleteCharacter($request, $name));
    }
]);

$obRouter->get('/account/changepassword', [
    'middlewares' => [
        'required-login'
    ],
    function($request){
        return new Response(200, AccountChangePassword::viewChangePassword($request));
    }
]);
$obRouter->post('/account/changepassword', [
    'middlewares' => [
        'required-login'
    ],
    function($request){
        return new Response(200, AccountChangePassword::updatePassword($request));
    }
]);
$obRouter->get('/account/changeemail', [
    'middlewares' => [
        'required-login'
    ],
    function($request){
        return new Response(200, AccountChangeEmail::viewChangeEmail($request));
    }
]);
$obRouter->post('/account/changeemail', [
    'middlewares' => [
        'required-login'
    ],
    function($request){
        return new Response(200, AccountChangeEmail::updateEmail($request));
    }
]);

$obRouter->get('/account/authentication', [
    'middlewares' => [
        'required-login'
    ],
    function($request){
        return new Response(200, AccountAuthentication::viewAuthentication($request));
    }
]);
$obRouter->post('/account/authentication/confirm', [
    'middlewares' => [
        'required-login'
    ],
    function($request){
        return new Response(200, AccountAuthentication::viewConfirmAuthentication($request));
    }
]);
$obRouter->post('/account/authentication/connect', [
    'middlewares' => [
        'required-login'
    ],
    function($request){
        return new Response(200, AccountAuthentication::viewConnectAuthentication($request));
    }
]);
$obRouter->post('/account/authentication/finish', [
    'middlewares' => [
        'required-login'
    ],
    function($request){
        return new Response(200, AccountAuthentication::viewConfirmConnect($request));
    }
]);
$obRouter->get('/account/authentication/unlink', [
    'middlewares' => [
        'required-login'
    ],
    function($request){
        return new Response(200, AccountAuthentication::viewUnlinkAuthentication($request));
    }
]);
$obRouter->post('/account/authentication/unlink/confirm', [
    'middlewares' => [
        'required-login'
    ],
    function($request){
        return new Response(200, AccountAuthentication::viewUnlinkConfirmToken($request));
    }
]);
$obRouter->get('/account/authentication/unlink/recoverykey', [
    'middlewares' => [
        'required-login'
    ],
    function($request){
        return new Response(200, AccountAuthentication::viewUnlinkbyRecoveryKey($request));
    }
]);
$obRouter->post('/account/authentication/unlink/recoverykey/confirm', [
    'middlewares' => [
        'required-login'
    ],
    function($request){
        return new Response(200, AccountAuthentication::viewUnlinkbyRecoveryKeyConfirm($request));
    }
]);

$obRouter->get('/account/changemain', [
    'middlewares' => [
        'required-login'
    ],
    function($request){
        return new Response(200, ChangeMainCharacter::viewChangeMain($request));
    }
]);
$obRouter->post('/account/changemain/confirm', [
    'middlewares' => [
        'required-login'
    ],
    function($request){
        return new Response(200, ChangeMainCharacter::viewConfirmCharacter($request));
    }
]);
$obRouter->post('/account/changemain/changed', [
    'middlewares' => [
        'required-login'
    ],
    function($request){
        return new Response(200, ChangeMainCharacter::viewChangedMain($request));
    }
]);

$obRouter->get('/createaccount', [
    'middlewares' => [
        'required-logout'
    ],
    function($request){
        return new Response(200, CreateAccount::getCreateAccount($request));
    }
]);
$obRouter->post('/createaccount', [
    'middlewares' => [
        'required-logout'
    ],
    function($request){
        return new Response(200, CreateAccount::createAccount($request));
    }
]);
