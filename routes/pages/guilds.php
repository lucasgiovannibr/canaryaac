<?php

use App\Http\Response;

use App\Controller\Pages\Guilds;
use App\Controller\Pages\GuildWar;

$obRouter->get('/community/guilds', [
    function(){
        return new Response(200, Guilds::viewAllGuilds());
    }
]);
$obRouter->get('/community/guilds/found', [
    'middlewares' => [
        'required-login'
    ],
    function($request){
        return new Response(200, Guilds::viewFoundGuild($request));
    }
]);
$obRouter->post('/community/guilds/found', [
    'middlewares' => [
        'required-login'
    ],
    function($request){
        return new Response(200, Guilds::insertFoundGuild($request));
    }
]);
$obRouter->get('/community/guilds/{name}/view', [
    function($request,$name){
        return new Response(200, Guilds::viewGuild($request,$name));
    }
]);
$obRouter->get('/community/guilds/{name}/guildwars', [
    function($request,$name){
        return new Response(200, GuildWar::viewGuildWars($request,$name));
    }
]);
$obRouter->get('/community/guilds/{name}/declarewar', [
    'middlewares' => [
        'required-login'
    ],
    function($request,$name){
        return new Response(200, GuildWar::viewDeclareWar($request,$name));
    }
]);
$obRouter->post('/community/guilds/{name}/declarewar', [
    'middlewares' => [
        'required-login'
    ],
    function($request,$name){
        return new Response(200, GuildWar::insertDeclareWar($request,$name));
    }
]);
$obRouter->get('/community/guilds/{name}/guildwars/{war}/accept', [
    'middlewares' => [
        'required-login'
    ],
    function($request, $name, $war){
        return new Response(200, GuildWar::acceptWar($request, $name, $war));
    }
]);
$obRouter->get('/community/guilds/{name}/guildwars/{warid}/reject', [
    'middlewares' => [
        'required-login'
    ],
    function($request, $name, $warid){
        return new Response(200, GuildWar::rejectWar($request, $name, $warid));
    }
]);
$obRouter->get('/community/guilds/{name}/guildwars/{warid}/cancel', [
    'middlewares' => [
        'required-login'
    ],
    function($request, $name, $warid){
        return new Response(200, GuildWar::cancelWar($request, $name, $warid));
    }
]);
$obRouter->get('/community/guilds/{name}/guildevents', [
    function($request,$name){
        return new Response(200, Guilds::viewGuildEvents($request,$name));
    }
]);
$obRouter->get('/community/guilds/{name}/guildevents/create', [
    'middlewares' => [
        'required-login'
    ],
    function($request,$name){
        return new Response(200, Guilds::viewCreateGuildEvents($request,$name));
    }
]);
$obRouter->post('/community/guilds/{name}/guildevents/create', [
    'middlewares' => [
        'required-login'
    ],
    function($request,$name){
        return new Response(200, Guilds::insertGuildEvent($request,$name));
    }
]);
$obRouter->get('/community/guilds/{name}/applications', [
    'middlewares' => [
        'required-login'
    ],
    function($request,$name){
        return new Response(200, Guilds::viewApplications($request,$name));
    }
]);
$obRouter->post('/community/guilds/{name}/applications', [
    'middlewares' => [
        'required-login'
    ],
    function($request,$name){
        return new Response(200, Guilds::actionApplications($request,$name));
    }
]);
$obRouter->get('/community/guilds/{name}/activitylog', [
    'middlewares' => [
        'required-login'
    ],
    function($request,$name){
        return new Response(200, Guilds::viewActivityLog($request,$name));
    }
]);
$obRouter->get('/community/guilds/{name}/editdescription', [
    'middlewares' => [
        'required-login'
    ],
    function($request,$name){
        return new Response(200, Guilds::viewEditDescription($request,$name));
    }
]);
$obRouter->post('/community/guilds/{name}/editdescription', [
    'middlewares' => [
        'required-login'
    ],
    function($request,$name){
        return new Response(200, Guilds::updateEditDescription($request,$name));
    }
]);
$obRouter->get('/community/guilds/{name}/disbandguild', [
    'middlewares' => [
        'required-login'
    ],
    function($request,$name){
        return new Response(200, Guilds::viewDisbandGuild($request,$name));
    }
]);
$obRouter->post('/community/guilds/{name}/disbandguild', [
    'middlewares' => [
        'required-login'
    ],
    function($request,$name){
        return new Response(200, Guilds::deleteDisbandGuild($request,$name));
    }
]);
$obRouter->get('/community/guilds/{name}/resignleadership', [
    'middlewares' => [
        'required-login'
    ],
    function($request,$name){
        return new Response(200, Guilds::viewResignLeadership($request,$name));
    }
]);
$obRouter->post('/community/guilds/{name}/resignleadership', [
    'middlewares' => [
        'required-login'
    ],
    function($request,$name){
        return new Response(200, Guilds::updateResignLeadership($request,$name));
    }
]);
$obRouter->get('/community/guilds/{name}/editranks', [
    'middlewares' => [
        'required-login'
    ],
    function($request,$name){
        return new Response(200, Guilds::viewEditRanks($request,$name));
    }
]);
$obRouter->post('/community/guilds/{name}/editranks', [
    'middlewares' => [
        'required-login'
    ],
    function($request,$name){
        return new Response(200, Guilds::updateEditRanks($request,$name));
    }
]);
$obRouter->get('/community/guilds/{name}/editmembers', [
    'middlewares' => [
        'required-login'
    ],
    function($request,$name){
        return new Response(200, Guilds::viewEditMembers($request,$name));
    }
]);
$obRouter->post('/community/guilds/{name}/editmembers', [
    'middlewares' => [
        'required-login'
    ],
    function($request,$name){
        return new Response(200, Guilds::updateEditMembers($request,$name));
    }
]);
$obRouter->get('/community/guilds/{name}/leaveguild', [
    'middlewares' => [
        'required-login'
    ],
    function($request,$name){
        return new Response(200, Guilds::viewLeaveGuild($request,$name));
    }
]);
$obRouter->post('/community/guilds/{name}/leaveguild', [
    'middlewares' => [
        'required-login'
    ],
    function($request,$name){
        return new Response(200, Guilds::deleteLeaveGuild($request,$name));
    }
]);
$obRouter->get('/community/guilds/{name}/joinguild', [
    'middlewares' => [
        'required-login'
    ],
    function($request,$name){
        return new Response(200, Guilds::viewJoinGuild($request,$name));
    }
]);
$obRouter->post('/community/guilds/{name}/joinguild', [
    'middlewares' => [
        'required-login'
    ],
    function($request,$name){
        return new Response(200, Guilds::insertJoinGuild($request,$name));
    }
]);
$obRouter->get('/community/guilds/{name}/invitecharacter', [
    'middlewares' => [
        'required-login'
    ],
    function($request,$name){
        return new Response(200, Guilds::viewInviteCharacter($request,$name));
    }
]);
$obRouter->post('/community/guilds/{name}/invitecharacter', [
    'middlewares' => [
        'required-login'
    ],
    function($request,$name){
        return new Response(200, Guilds::insertInviteCharacter($request,$name));
    }
]);
$obRouter->get('/community/guilds/{name}/applytothisguild', [
    'middlewares' => [
        'required-login'
    ],
    function($request,$name){
        return new Response(200, Guilds::viewApplyToThisGuild($request,$name));
    }
]);
$obRouter->post('/community/guilds/{name}/applytothisguild', [
    'middlewares' => [
        'required-login'
    ],
    function($request,$name){
        return new Response(200, Guilds::insertApplyToThisGuild($request,$name));
    }
]);