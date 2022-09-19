<?php

use App\Controller\Pages\Achievements;
use App\Http\Response;

use App\Controller\Pages\Lastnews;
use App\Controller\Pages\Downloads;
use App\Controller\Pages\Creatures;
use App\Controller\Pages\BoostableBosses;
use App\Controller\Pages\ExperienceTable;
use App\Controller\Pages\Highscores;
use App\Controller\Pages\Characters;
use App\Controller\Pages\Worlds;
use App\Controller\Pages\Houses;
use App\Controller\Pages\EventCalendar;
use App\Controller\Pages\Newsarchive;
use App\Controller\Pages\Polls;

include __DIR__.'/pages/account.php';

include __DIR__.'/pages/payment.php';

include __DIR__.'/pages/guilds.php';

$obRouter->get('', [
    function(){
        return new Response(200, Lastnews::getLastnews());
    }
]);
$obRouter->get('/latestnews', [
    function(){
        return new Response(200, Lastnews::getLastnews());
    }
]);
$obRouter->get('/newsarchive', [
    function($request){
        return new Response(200, Newsarchive::viewNewsArchive($request));
    }
]);
$obRouter->post('/newsarchive', [
    function($request){
        return new Response(200, Newsarchive::viewNewsArchive($request));
    }
]);
$obRouter->get('/newsarchive/{id}/view', [
    function($request, $id){
        return new Response(200, Newsarchive::viewNewsArchiveById($request, $id));
    }
]);
$obRouter->get('/eventcalendar', [
    function($request){
        return new Response(200, EventCalendar::viewEventCalendar($request));
    }
]);
$obRouter->get('/downloads', [
    function(){
        return new Response(200, Downloads::viewDownloads());
    }
]);

$obRouter->get('/library/creatures', [
    function(){
        return new Response(200, Creatures::viewCreatures());
    }
]);
$obRouter->get('/library/boostablebosses', [
    function(){
        return new Response(200, BoostableBosses::viewBoostableBosses());
    }
]);
$obRouter->get('/library/achievements', [
    function(){
        return new Response(200, Achievements::viewAchievements());
    }
]);
$obRouter->get('/library/experiencetable', [
    function(){
        return new Response(200, ExperienceTable::viewExperienceTable());
    }
]);

$obRouter->get('/community/characters', [
    function($request){
        return new Response(200, Characters::getCharacters($request));
    }
]);
$obRouter->post('/community/characters', [
    function($request){
        return new Response(200, Characters::getCharacters($request));
    }
]);
$obRouter->get('/community/characters/{name}', [
    function($request, $name){
        return new Response(200, Characters::getCharacters($request, $name));
    }
]);

$obRouter->get('/community/worlds', [
    function($request){
        return new Response(200, Worlds::getWorlds($request));
    }
]);
$obRouter->get('/community/highscores', [
    function($request){
        return new Response(200, Highscores::getHighscores($request));
    }
]);
$obRouter->get('/community/polls', [
    function($request){
        return new Response(200, Polls::viewPolls($request));
    }
]);
$obRouter->get('/community/polls/{id}/view', [
    'middlewares' => [
        'required-login'
    ],
    function($request, $id){
        return new Response(200, Polls::viewPollById($request, $id));
    }
]);
$obRouter->post('/community/polls/{id}/view', [
    'middlewares' => [
        'required-login'
    ],
    function($request, $id){
        return new Response(200, Polls::insertAnswer($request, $id));
    }
]);
$obRouter->get('/community/houses', [
    function($request){
        return new Response(200, Houses::getHouses($request));
    }
]);
$obRouter->get('/community/houses/{name}/view', [
    function($request, $name){
        return new Response(200, Houses::viewHouse($request, $name));
    }
]);