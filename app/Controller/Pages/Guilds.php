<?php
/**
 * Guilds Class
 *
 * @package   CanaryAAC
 * @author    Lucas Giovanni <lucasgiovannidesigner@gmail.com>
 * @copyright 2022 CanaryAAC
 */

namespace App\Controller\Pages;

use \App\Utils\View;
use App\Model\Entity\Guilds as EntityGuilds;
use App\Session\Admin\Login as SessionAdminLogin;
use App\Model\Functions\Guilds as FunctionGuilds;
use App\Model\Entity\Player as EntityPlayer;
use App\Model\Entity\Account as EntityAccount;
use App\Model\Functions\Player as FunctionPlayer;
use App\Model\Functions\Server as FunctionServer;
use App\Model\Entity\ServerConfig as EntityServerConfig;
use App\Model\Functions\Guilds\Found as FoundGuild;

class Guilds extends Base{

	public static function convertGuildName($guild_name)
	{
		$decodeUrl = urldecode($guild_name);
		$filterName = filter_var($decodeUrl, FILTER_SANITIZE_SPECIAL_CHARS);
		$dbGuild = EntityGuilds::getGuilds('name = "'.$filterName.'"')->fetchObject();
		if($dbGuild == true){
			$guild_id = $dbGuild->id;
		}
		return $guild_id ?? 0;
	}

	public static function insertFoundGuild($request)
	{
		$idLogged = SessionAdminLogin::idLogged();
		$postVars = $request->getPostVars();

		$websiteInfo = EntityServerConfig::getInfoWebsite()->fetchObject();
        date_default_timezone_set($websiteInfo->timezone);

		if(empty($postVars['password'])){
			$status = 'You need to enter a password.';
			return self::viewFoundGuild($request, $status);
		}
		$filter_pass = filter_var($postVars['password'], FILTER_SANITIZE_SPECIAL_CHARS);
		$convert_pass = sha1($filter_pass);
		$dbAccountLogged = EntityPlayer::getAccount('id = "'.$idLogged.'"')->fetchObject();
		if($dbAccountLogged->password != $convert_pass){
			$status = 'Something went wrong with the password.';
			return self::viewFoundGuild($request, $status);
		}
		if(empty($postVars['guild_name'])){
			$status = 'Enter a name.';
			return self::viewFoundGuild($request, $status);
		}
		$filter_name = filter_var($postVars['guild_name'], FILTER_SANITIZE_SPECIAL_CHARS);
		if (strlen($filter_name) < 5) {
			$status = 'The name must contain at least 5 characters.';
			return self::viewFoundGuild($request, $status);
		}
		$dbGuilds = EntityGuilds::getGuilds('name = "'.$filter_name.'"')->fetchObject();
		if(!empty($dbGuilds)){
			$status = 'A Guild with this name already exists.';
			return self::viewFoundGuild($request, $status);
		}
		if(empty($postVars['guild_leader'])){
			$status = 'Select a leader.';
			return self::viewFoundGuild($request,$status);
		}
		$filter_leader = filter_var($postVars['guild_leader'], FILTER_SANITIZE_SPECIAL_CHARS);
		$dbPlayerId = EntityPlayer::getPlayer('name = "'.$filter_leader.'" AND account_id = "'.$idLogged.'"')->fetchObject();
		if($dbPlayerId->deletion == 1){
			$status = 'You cannot select a character with a deleted status.';
			return self::viewFoundGuild($request, $status);
		}
		$dbPlayerLeader = EntityPlayer::getPlayer('name = "'.$filter_leader.'" AND account_id = "'.$idLogged.'"');
		while ($player = $dbPlayerLeader->fetchObject()) {
			if ($player->level < $websiteInfo->player_guild) {
				$status = 'The minimum level to found a Guild is '.$websiteInfo->player_guild.'.';
				return self::viewFoundGuild($request, $status);
			}
			$dbMembers = EntityGuilds::getMembership('player_id = "'.$player->id.'"')->fetchObject();
			if (!empty($dbMembers)) {
				$status = 'This character is already in a Guild.';
				return self::viewFoundGuild($request, $status);
			}
		}
		if (empty($postVars['guild_world'])) {
			$status = 'You need to select a World.';
			return self::viewFoundGuild($request, $status);
		}
		if (!filter_var($postVars['guild_world'], FILTER_VALIDATE_INT)) {
			$status = 'You have selected an invalid World.';
			return self::viewFoundGuild($request, $status);
		}
		$filter_world = filter_var($postVars['guild_world'], FILTER_SANITIZE_NUMBER_INT);
		if ($dbPlayerId->world != $filter_world) {
			$status = 'The character does not match the selected World.';
			return self::viewFoundGuild($request, $status);
		}
		$insertGuild = EntityGuilds::insertGuild([
			'level' => 1,
			'name' => $filter_name,
			'creationdata' => strtotime(date('Y-m-d H:i:s')),
			'ownerid' => $dbPlayerId->id,
			'motd' => '',
			'residence' => '',
			'balance' => 0,
			'points' => 0,
			'description' => '',
			'logo_name' => 'default_logo',
			'world_id' => $filter_world
		]);
		$dbRanks = EntityGuilds::getRanks('guild_id = "'.$insertGuild.'" AND level = 3')->fetchObject();
		self::insertMemberInFound($dbPlayerId->id, $insertGuild, $dbRanks->id);
		$status = 'Guild created successfully.';
		return self::viewFoundGuild($request, $status);
	}

	public static function insertMemberInFound($player_id, $guild_id, $rank_id)
	{
		$websiteInfo = EntityServerConfig::getInfoWebsite()->fetchObject();
        date_default_timezone_set($websiteInfo->timezone);

		$insertMember = EntityGuilds::insertJoinMember([
			'player_id' => $player_id,
			'guild_id' => $guild_id,
			'rank_id' => $rank_id,
			'nick' => '',
			'date' => strtotime(date('Y-m-d H:i:s')),
		]);
		return $insertMember;
	}

	public static function viewFoundGuild($request, $status = null)
	{
		$idLogged = SessionAdminLogin::idLogged();
		$dbPlayersAccount = EntityPlayer::getPlayer('account_id = "'.$idLogged.'" AND deletion = "0"');
		while($player = $dbPlayersAccount->fetchObject()){
			$dbMembers = EntityGuilds::getMembership('player_id = "'.$player->id.'"')->fetchObject();
			if(empty($dbMembers)){
				$arrayPlayers[] = [
					'id' => $player->id,
					'name' => $player->name,
				];
			}
		}
		$content = View::render('pages/guilds/found', [
			'status' => $status,
			'players' => $arrayPlayers ?? null,
			'worlds' => FunctionServer::getWorlds(),
		]);
		return parent::getBase('Guilds', $content, 'guilds');
	}

	public static function updateEditDescription($request,$name)
	{
		$isLeader = FunctionGuilds::verifyAccountLeader(self::convertGuildName($name));
		if($isLeader == false){
			$request->getRouter()->redirect('/community/guilds/'.$name.'/view');
		}

		$postVars = $request->getPostVars();
		$guild_id = self::convertGuildName($name);
		if(empty($postVars['description'])){
			$status = 'You need to write some description.';
			return self::viewEditDescription($request,$name,$status);
		}

		$filter_description = filter_var($postVars['description'], FILTER_SANITIZE_SPECIAL_CHARS);
		$count_description = strlen($filter_description);
		if($count_description > 250){
			$status = 'It must be less than 250 characters.';
			return self::viewEditDescription($request,$name,$status);
		}

		EntityGuilds::updateGuild('id = "'.$guild_id.'"', [
			'description' => $filter_description,
		]);
		$status = 'Updated successfully.';
		return self::viewEditDescription($request,$name,$status);
	}

	public static function viewEditDescription($request,$name,$status = null)
	{
		$isLeader = FunctionGuilds::verifyAccountLeader(self::convertGuildName($name));
		if($isLeader == false){
			$request->getRouter()->redirect('/community/guilds/'.$name.'/view');
		}

		$content = View::render('pages/guilds/editdescription', [
			'status' => $status,
			'guild' => FunctionGuilds::getGuildbyId(self::convertGuildName($name)),
		]);
		return parent::getBase('Guilds', $content, 'guilds');
	}

	public static function deleteDisbandGuild($request,$name)
	{
		$isLeader = FunctionGuilds::verifyAccountLeader(self::convertGuildName($name));
		if($isLeader == false){
			$request->getRouter()->redirect('/community/guilds/'.$name.'/view');
		}

		$postVars = $request->getPostVars();
		$guild_id = self::convertGuildName($name);
		$idLogged = SessionAdminLogin::idLogged();

		if(empty($postVars['password'])){
			$status = 'You need to enter your password.';
			self::viewDisbandGuild($request,$name,$status);
		}

		$filter_password = filter_var($postVars['password'], FILTER_SANITIZE_SPECIAL_CHARS);
		$dbAccount = EntityAccount::getAccount('id = "'.$idLogged.'" AND password = "'.$filter_password.'"');
		if(!empty($dbAccount)){
			$status = 'Something went wrong.';
			self::viewDisbandGuild($request,$name,$status);
		}

		EntityGuilds::deleteGuild('id = "'.$guild_id.'"');
		$request->getRouter()->redirect('/community/guilds');
	}

	public static function viewDisbandGuild($request,$name,$status = null)
	{
		$isLeader = FunctionGuilds::verifyAccountLeader(self::convertGuildName($name));
		if($isLeader == false){
			$request->getRouter()->redirect('/community/guilds/'.$name.'/view');
		}

		$content = View::render('pages/guilds/disbandguild', [
			'status' => $status,
			'guild' => FunctionGuilds::getGuildbyId(self::convertGuildName($name)),
		]);
		return parent::getBase('Guilds', $content, 'guilds');
	}

	public static function updateResignLeadership($request,$name)
	{
		$isLeader = FunctionGuilds::verifyAccountLeader(self::convertGuildName($name));
		if($isLeader == false){
			$request->getRouter()->redirect('/community/guilds/'.$name.'/view');
		}

		$postVars = $request->getPostVars();
		$guild_id = self::convertGuildName($name);
		$idLogged = SessionAdminLogin::idLogged();

		if(empty($postVars['password'])){
			$status = 'You need to enter your password.';
			self::viewResignLeadership($request,$name,$status);
		}
		if(empty($postVars['character'])){
			$status = 'You need to select a character.';
			self::viewResignLeadership($request,$name,$status);
		}

		$filter_character = filter_var($postVars['character'], FILTER_SANITIZE_SPECIAL_CHARS);
		$filter_password = filter_var($postVars['password'], FILTER_SANITIZE_SPECIAL_CHARS);

		$dbAccount = EntityAccount::getAccount('id = "'.$idLogged.'" AND password = "'.$filter_password.'"')->fetchObject();
		if(empty($dbAccount)){
			$status = 'Something went wrong.';
			self::viewResignLeadership($request,$name,$status);
		}

		$dbPlayer = EntityPlayer::getPlayer('name = "'.$filter_character.'"')->fetchObject();
		if(empty($dbPlayer)){
			$status = 'Character does not exist.';
			self::viewResignLeadership($request,$name,$status);
		}

		$dbMember = EntityGuilds::getMembership('player_id = "'.$dbPlayer->id.'" AND guild_id = "'.$guild_id.'"')->fetchObject();
		if(empty($dbMember)){
			$status = 'Must be a member of the Guild.';
			self::viewResignLeadership($request,$name,$status);
		}

		EntityGuilds::updateGuild('guild_id = "'.$guild_id.'"', [
			'ownerid' => $dbPlayer->id,
		]);
		$status = 'Updated successfully.';
		self::viewResignLeadership($request,$name,$status);

	}

	public static function viewResignLeadership($request,$name,$status = null)
	{
		$isLeader = FunctionGuilds::verifyAccountLeader(self::convertGuildName($name));
		if($isLeader == false){
			$request->getRouter()->redirect('/community/guilds/'.$name.'/view');
		}

		$content = View::render('pages/guilds/resignleadership', [
			'status' => $status,
			'guild' => FunctionGuilds::getGuildbyId(self::convertGuildName($name)),
			'members' => FunctionGuilds::getGuildMembership(self::convertGuildName($name)),
		]);
		return parent::getBase('Guilds', $content, 'guilds');
	}

	public static function insertGuildEvent($request,$name)
	{
		$postVars = $request->getPostVars();
		$guild_id = self::convertGuildName($name);

		$isLeader = FunctionGuilds::verifyAccountLeader(self::convertGuildName($name));
		if($isLeader == false){
			$request->getRouter()->redirect('/community/guilds/'.$name.'/view');
		}

		if(empty($postVars['event_name'])){
			$status = 'Enter a name.';
			return self::viewCreateGuildEvents($request,$name,$status);
		}

		if(empty($postVars['event_text'])){
			$status = 'You need to write some description.';
			return self::viewCreateGuildEvents($request,$name,$status);
		}

		$event_name = filter_var($postVars['event_name'], FILTER_SANITIZE_SPECIAL_CHARS);
		$event_text = filter_var($postVars['event_text'], FILTER_SANITIZE_SPECIAL_CHARS);
		$event_date = filter_var($postVars['event_date'], FILTER_SANITIZE_SPECIAL_CHARS);
		$event_time = filter_var($postVars['event_time'], FILTER_SANITIZE_SPECIAL_CHARS);

		if(empty($postVars['event_private'])){
			$event_private = 0;
		}else{
			$event_private = filter_var($postVars['event_private'], FILTER_SANITIZE_SPECIAL_CHARS);
			$event_private = 1;
		}

		$format_date = $event_date.' '.$event_time.':00';
		$dateint = strtotime($format_date);

		EntityGuilds::insertEvents([
			'guild_id' => $guild_id,
			'name' => $event_name,
			'description' => $event_text,
			'date' => $dateint,
			'private' => $event_private,
		]);
		$status = 'Event created successfully!';
		return self::viewCreateGuildEvents($request,$name,$status);

	}

	public static function viewCreateGuildEvents($request,$name,$status = null)
	{
		$content = View::render('pages/guilds/createguildevents', [
			'status' => $status,
			'guild' => FunctionGuilds::getGuildbyId(self::convertGuildName($name)),
		]);
		return parent::getBase('Guilds', $content, 'guilds');
	}

	public static function viewGuildEvents($request,$name)
	{
		$guild_id = self::convertGuildName($name);
		$dbEvents = EntityGuilds::getEvents('guild_id = "'.$guild_id.'"', 'id DESC');
		while($event = $dbEvents->fetchObject()){
			$events[] = [
				'name' => $event->name,
				'description' => $event->description,
				'date' => date('M d Y, h:i', $event->date),
				'private' => $event->private,
			];
		}

		$content = View::render('pages/guilds/guildevents', [
			'events' => $events ?? null,
			'guild' => FunctionGuilds::getGuildbyId(self::convertGuildName($name)),
			'isleader' => FunctionGuilds::verifyAccountLeader($guild_id),
		]);
		return parent::getBase('Guilds', $content, 'guilds');
	}

	public static function updateEditRanks($request,$name)
	{
		$postVars = $request->getPostVars();
		$guild_id = self::convertGuildName($name);

		$isLeader = FunctionGuilds::verifyAccountLeader(self::convertGuildName($name));
		if($isLeader == false){
			$request->getRouter()->redirect('/community/guilds/'.$name.'/view');
		}

		if(empty($postVars['rank_name'])){
			$status = 'Write a name.';
			return self::viewEditRanks($request,$name,$status);
		}
		if(empty($postVars['rank_level'])){
			$status = 'Select a rank.';
			return self::viewEditRanks($request,$name,$status);
		}

		$filter_name = filter_var($postVars['rank_name'], FILTER_SANITIZE_SPECIAL_CHARS);
		$filter_level = filter_var($postVars['rank_level'], FILTER_SANITIZE_SPECIAL_CHARS);

		$dbRanks = EntityGuilds::getRanks('id = "'.$filter_level.'" AND guild_id = "'.$guild_id.'"')->fetchObject();
		if(empty($dbRanks)){
			$status = 'Please select a valid rank.';
			return self::viewEditRanks($request,$name,$status);
		}

		EntityGuilds::updateRank('id = "'.$filter_level.'" AND guild_id = "'.$guild_id.'"', [
			'name' => $filter_name,
		]);
		$status = 'Updated successfully.';
		return self::viewEditRanks($request,$name,$status);
	}

	public static function viewEditRanks($request,$name,$status = null)
	{
		$content = View::render('pages/guilds/editranks', [
			'status' => $status,
			'worlds' => FunctionServer::getWorlds(),
			'guild' => FunctionGuilds::getGuildbyId(self::convertGuildName($name)),
			'ranks' => FunctionGuilds::getRanks(self::convertGuildName($name)),
		]);
		return parent::getBase('Guild', $content, 'guilds');
	}

	public static function actionApplications($request,$name)
	{
		$postVars = $request->getPostVars();
		$guild_id = self::convertGuildName($name);

		$isLeader = FunctionGuilds::verifyAccountLeader(self::convertGuildName($name));
		if($isLeader == false){
			$request->getRouter()->redirect('/community/guilds/'.$name.'/view');
		}

		if(empty($postVars['application_player'])){
			$status = 'Please select a valid application.';
			return self::viewApplications($request,$name,$status);
		}
		$input_idplayer = filter_var($postVars['application_player'], FILTER_SANITIZE_NUMBER_INT);

		if(isset($postVars['btn_accept'])){
			$dbMembers = EntityGuilds::getMembership('player_id = "'.$input_idplayer.'"')->fetchObject();
			if(!empty($dbMembers)){
				$status = 'This character is a member of another Guild.';
				return self::viewApplications($request,$name,$status);
			}

			EntityGuilds::updateApplication('player_id = "'.$input_idplayer.'" AND guild_id = "'.$guild_id.'"', [
				'status' => 2,
			]);
			EntityGuilds::insertJoinMember([
				'player_id' => $input_idplayer,
				'guild_id' => $guild_id,
				'rank_id' => 3,
				'nick' => '',
				'date' => strtotime(date('m-d-Y h:i:s')),
			]);
			$status = 'Updated successfully.';
			return self::viewApplications($request,$name,$status);
		}

		if(isset($postVars['btn_reject'])){
			if(empty($postVars['application_player'])){
				$status = 'Please select a valid application.';
				return self::viewApplications($request,$name,$status);
			}
			$input_idplayer = filter_var($postVars['application_player'], FILTER_SANITIZE_NUMBER_INT);
			EntityGuilds::updateApplication('player_id = "'.$input_idplayer.'" AND guild_id = "'.$guild_id.'"', [
				'status' => 1,
			]);
			$status = 'Updated successfully.';
			return self::viewApplications($request,$name,$status);
		}

	}

	public static function viewApplications($request,$name,$status = null)
	{
		$guild_id = self::convertGuildName($name);

		$isLeader = FunctionGuilds::verifyAccountLeader(self::convertGuildName($name));
		if($isLeader == false){
			$request->getRouter()->redirect('/community/guilds/'.$name.'/view');
		}

		$dbApplications = EntityGuilds::getApplications('guild_id = "'.$guild_id.'"');
		while($application = $dbApplications->fetchObject()){

			$dbPlayer = EntityPlayer::getPlayer('id = "'.$application->player_id.'"')->fetchObject();

			
			switch($application->status){
				case 0:
					$status_app = 'open';
					break;
				case 1:
					$status_app = 'closed';
					break;
				case 2:
					$status_app = 'accept';
			}

			$applications[] = [
				'player' => $dbPlayer->id,
				'date' => date('M d Y, h:i:s', $application->date),
				'character' => $dbPlayer->name,
				'level' => $dbPlayer->level,
				'vocation' => FunctionPlayer::convertVocation($dbPlayer->vocation),
				'status' => $status_app,
			];
		}

		$content = View::render('pages/guilds/applications', [
			'status' => $status,
			'worlds' => FunctionServer::getWorlds(),
			'guild' => FunctionGuilds::getGuildbyId(self::convertGuildName($name)),
			'applications' => $applications ?? null,
		]);
		return parent::getBase('Guild', $content, 'guilds');
	}

	public static function viewActivityLog($request,$name)
	{
		$isLeader = FunctionGuilds::verifyAccountLeader(self::convertGuildName($name));
		if($isLeader == false){
			$request->getRouter()->redirect('/community/guilds/'.$name.'/view');
		}

		$content = View::render('pages/guilds/activitylog', [
			'guild' => FunctionGuilds::getGuildbyId(self::convertGuildName($name)),
		]);
		return parent::getBase('Guild', $content, 'guilds');
	}

	public static function updateEditMembers($request,$name)
	{
		$postVars = $request->getPostVars();
		$guild_id = self::convertGuildName($name);
		$idLogged = SessionAdminLogin::idLogged();
		$isLeader = FunctionGuilds::verifyAccountLeader(self::convertGuildName($name));
		if($isLeader == false){
			$request->getRouter()->redirect('/community/guilds/'.$name.'/view');
		}

		$filter_action = filter_var($postVars['action'] ?? null, FILTER_SANITIZE_SPECIAL_CHARS);

		switch($filter_action){
			case 'settitle':
				$action = true;
				break;
			case 'setrank':
				$action = true;
				break;
			case 'exclude':
				$action = true;
				break;
			default:
				$action = false;
				break;
		}

		if($action == false){
			$status = 'Select an action.';
			return self::viewEditMembers($request,$name,$status);
		}

		if($filter_action == 'settitle'){
			if(empty($postVars['character'])){
				$status = 'You need to select a character.';
				return self::viewEditMembers($request,$name,$status);
			}
			if(empty($postVars['newtitle'])){
				$status = 'Write a title.';
				return self::viewEditMembers($request,$name,$status);
			}

			$filter_character = filter_var($postVars['character'], FILTER_SANITIZE_SPECIAL_CHARS);
			$filter_title = filter_var($postVars['newtitle'], FILTER_SANITIZE_SPECIAL_CHARS);

			$dbPlayers = EntityPlayer::getPlayer('name = "'.$filter_character.'"')->fetchObject();
			if(empty($dbPlayers)){
				$status = 'Invalid character.';
				return self::viewEditMembers($request,$name,$status);
			}

			$dbMember = EntityGuilds::getMembership('player_id = "'.$dbPlayers->id.'" AND guild_id = "'.$guild_id.'"')->fetchObject();
			if(empty($dbMember)){
				$status = 'This character does not belong to this guild.';
				return self::viewEditMembers($request,$name,$status);
			}

			EntityGuilds::updateMember('guild_id = "'.$guild_id.'" AND player_id = "'.$dbPlayers->id.'"', [
				'nick' => $filter_title,
			]);
			$status = 'Updated successfully.';
			return self::viewEditMembers($request,$name,$status);
		}

		if($filter_action == 'exclude'){
			if(empty($postVars['character'])){
				$status = 'You need to select a character.';
				return self::viewEditMembers($request,$name,$status);
			}
			$filter_character = filter_var($postVars['character'], FILTER_SANITIZE_SPECIAL_CHARS);

			$dbPlayers = EntityPlayer::getPlayer('name = "'.$filter_character.'"')->fetchObject();
			if(empty($dbPlayers)){
				$status = 'Invalid character.';
				return self::viewEditMembers($request,$name,$status);
			}

			$dbMember = EntityGuilds::getMembership('player_id = "'.$dbPlayers->id.'" AND guild_id = "'.$guild_id.'"')->fetchObject();
			if(empty($dbMember)){
				$status = 'This character does not belong to this guild.';
				return self::viewEditMembers($request,$name,$status);
			}

			EntityGuilds::deleteMember('guild_id = "'.$guild_id.'" AND player_id = "'.$dbPlayers->id.'"');
			$status = 'Updated successfully.';
			return self::viewEditMembers($request,$name,$status);
		}

		if($filter_action == 'setrank'){
			if(empty($postVars['character'])){
				$status = 'You need to select a character.';
				return self::viewEditMembers($request,$name,$status);
			}
			if(empty($postVars['newrank'])){
				$status = 'You need to select a rank.';
				return self::viewEditMembers($request,$name,$status);
			}
			$filter_character = filter_var($postVars['character'], FILTER_SANITIZE_SPECIAL_CHARS);
			$filter_rank = filter_var($postVars['newrank'], FILTER_SANITIZE_SPECIAL_CHARS);

			$dbPlayers = EntityPlayer::getPlayer('name = "'.$filter_character.'"')->fetchObject();
			if(empty($dbPlayers)){
				$status = 'Invalid character.';
				return self::viewEditMembers($request,$name,$status);
			}
			$dbMember = EntityGuilds::getMembership('player_id = "'.$dbPlayers->id.'" AND guild_id = "'.$guild_id.'"')->fetchObject();
			if(empty($dbMember)){
				$status = 'This character does not belong to this guild.';
				return self::viewEditMembers($request,$name,$status);
			}
			$dbRanks = EntityGuilds::getRanks('guild_id = "'.$guild_id.'" AND level = "'.$filter_rank.'"')->fetchObject();
			$newRank = $dbRanks->id;
			EntityGuilds::updateRankOnMember('guild_id = "'.$guild_id.'" AND player_id = "'.$dbPlayers->id.'"', [
				'rank_id' => $newRank,
			]);
			$status = 'Updated successfully.';
			return self::viewEditMembers($request,$name,$status);
		}
	}

	public static function viewEditMembers($request,$name,$status = null)
	{
		$isLeader = FunctionGuilds::verifyAccountLeader(self::convertGuildName($name));
		if($isLeader == false){
			$request->getRouter()->redirect('/community/guilds/'.$name.'/view');
		}
		$dbMembers = EntityGuilds::getMembership('guild_id = "'.self::convertGuildName($name).'"');
		while($member = $dbMembers->fetchObject()){
			$memberRank = FunctionGuilds::convertRankGuild($member->rank_id);
			$dbPlayers = EntityPlayer::getPlayer('id = "'.$member->player_id.'"');
			while($player = $dbPlayers->fetchObject()){
				$arrayMembers[] = [
					'player_name' => $player->name,
					'rank_name' => $memberRank['name'],
					'rank_level' => $memberRank['rank_level'],
				];
			}
		}
		$content = View::render('pages/guilds/editmembers', [
			'status' => $status,
			'guild' => FunctionGuilds::getGuildbyId(self::convertGuildName($name)),
			'members' => $arrayMembers,
			'ranks' => FunctionGuilds::getRanks(self::convertGuildName($name)),
		]);
		return parent::getBase('Guild', $content, 'guilds');
	}

	public static function deleteLeaveGuild($request,$name)
	{
		$postVars = $request->getPostVars();
		$idLogged = SessionAdminLogin::idLogged();
		$guild_id = self::convertGuildName($name);
		if(empty($postVars['character_leave'])){
			$status = 'Select a character.';
			return self::viewLeaveGuild($request,$name,$status);
		}
		$input_character = filter_var($postVars['character_leave'], FILTER_SANITIZE_SPECIAL_CHARS);
		$dbPlayer = EntityPlayer::getPlayer('account_id = "'.$idLogged.'" AND name = "'.$input_character.'"')->fetchObject();
		if(empty($dbPlayer)){
			$status = 'Invalid character.';
			return self::viewLeaveGuild($request,$name,$status);
		}
		$dbMember = EntityGuilds::getMembership('player_id = "'.$dbPlayer->id.'" AND guild_id = "'.$guild_id.'"')->fetchObject();
		if(empty($dbMember)){
			$status = 'Invalid character or belongs to another Guild.';
			return self::viewLeaveGuild($request,$name,$status);
		}
		EntityGuilds::deleteMember('player_id = "'.$dbPlayer->id.'" AND guild_id = "'.$guild_id.'"');
		$request->getRouter()->redirect('/community/guilds/'.$name.'/view');
	}

	public static function viewLeaveGuild($request,$name,$status = null)
	{
		$idLogged = SessionAdminLogin::idLogged();
		$guild_id = self::convertGuildName($name);
		$dbPlayersAccount = EntityPlayer::getPlayer('account_id = "'.$idLogged.'"');
		while($player = $dbPlayersAccount->fetchObject()){
			$dbMember = EntityGuilds::getMembership('player_id = "'.$player->id.'" AND guild_id = "'.$guild_id.'"');
			while($members = $dbMember->fetchObject()){
				$convertRank = FunctionGuilds::convertRankGuild($members->rank_id);
				if($convertRank['rank_level'] != 3){
					$arrayMembers[] = [
						'id' => $player->id,
						'name' => $player->name,
					];
				}
			}
		}
		$content = View::render('pages/guilds/leaveguild', [
			'status' => $status,
			'guild' => FunctionGuilds::getGuildbyId(self::convertGuildName($name)),
			'members' => $arrayMembers ?? null,
		]);
		return parent::getBase('Guild', $content, 'guilds');
	}
	
	public static function insertInviteCharacter($request,$name)
	{
		$postVars = $request->getPostVars();
		$isLeader = FunctionGuilds::verifyAccountLeader(self::convertGuildName($name));
		if($isLeader == false){
			$request->getRouter()->redirect('/community/guilds/'.$name.'/view');
		}
		if(isset($postVars['btn_invite'])){
			if(empty($postVars['invite_name'])){
				$status_invite = 'Enter a character name.';
				return self::viewInviteCharacter($request,$name,$status_invite);
			}
			$input_name = filter_var($postVars['invite_name'], FILTER_SANITIZE_SPECIAL_CHARS);
			$dbPlayer = EntityPlayer::getPlayer('name = "'.$input_name.'"')->fetchObject();
			if(empty($dbPlayer)){
				$status_invite = 'Character does not exist.';
				return self::viewInviteCharacter($request,$name,$status_invite);
			}
			if($dbPlayer->deletion == 1){
				$status_invite = 'Character is deleted.';
				return self::viewInviteCharacter($request,$name,$status_invite);
			}
			$dbMembers = EntityGuilds::getMembership('player_id = "'.$dbPlayer->id.'"')->fetchObject();
			if(!empty($dbMembers)){
				$status_invite = 'This character already participates in a Guild.';
				return self::viewInviteCharacter($request,$name,$status_invite);
			}
			$guild_id = self::convertGuildName($name);
			$dbInvited = EntityGuilds::getInvites('player_id = "'.$dbPlayer->id.'" AND guild_id = "'.$guild_id.'"')->fetchObject();
			if(!empty($dbInvited)){
				$status_invite = 'This character is already invited.';
				return self::viewInviteCharacter($request,$name,$status_invite);
			}
			EntityGuilds::insertInvite([
				'player_id' => $dbPlayer->id,
				'guild_id' => $guild_id,
				'date' => strtotime(date('d-m-Y h:i:s')),
			]);
			$status_invite = 'Successfully invited character.';
			return self::viewInviteCharacter($request,$name,$status_invite);
		}

		if(isset($postVars['btn_cancel'])){
			if(empty($postVars['cancel_name'])){
				$status_cancelinvite = 'Select a character.';
				return self::viewInviteCharacter($request,$name,null,$status_cancelinvite);
			}
			$input_cancelname = filter_var($postVars['cancel_name'], FILTER_SANITIZE_SPECIAL_CHARS);
			$dbPlayer = EntityPlayer::getPlayer('name = "'.$input_cancelname.'"')->fetchObject();
			if(empty($dbPlayer)){
				$status_cancelinvite = 'Character does not exist.';
				return self::viewInviteCharacter($request,$name,null,$status_cancelinvite);
			}
			$guild_id = self::convertGuildName($name);
			$dbInvited = EntityGuilds::getInvites('player_id = "'.$dbPlayer->id.'" AND guild_id = "'.$guild_id.'"')->fetchObject();
			if(empty($dbInvited)){
				$status_cancelinvite = 'This character is not invited.';
				return self::viewInviteCharacter($request,$name,null,$status_cancelinvite);
			}
			EntityGuilds::deleteInvite('player_id = "'.$dbPlayer->id.'" AND guild_id = "'.$guild_id.'"');
			$status_cancelinvite = 'Successfully deleted.';
			return self::viewInviteCharacter($request,$name,null,$status_cancelinvite);
		}
	}

	public static function viewInviteCharacter($request,$name, $status_invite = null, $status_cancelinvite = null)
	{
		$isLeader = FunctionGuilds::verifyAccountLeader(self::convertGuildName($name));
		if($isLeader == false){
			$request->getRouter()->redirect('/community/guilds/'.$name.'/view');
		}
		$content = View::render('pages/guilds/invitecharacter', [
			'status' => $status_invite,
			'status_cancelinvite' => $status_cancelinvite,
			'worlds' => FunctionServer::getWorlds(),
			'guild' => FunctionGuilds::getGuildbyId(self::convertGuildName($name)),
			'invites' => FunctionGuilds::getGuildInvites(self::convertGuildName($name)),
		]);
		return parent::getBase('Guild', $content, 'guilds');
	}

	public static function insertApplyToThisGuild($request,$name)
	{
		$postVars = $request->getPostVars();
		$guild_id = self::convertGuildName($name);
		$idLogged = SessionAdminLogin::idLogged();
		if(isset($postVars['apply_btn'])){
			if(empty($postVars['apply_name'])){
				$status = 'You need to select a character.';
				return self::viewApplyToThisGuild($request,$name,$status);
			}
			$input_character = filter_var($postVars['apply_name'], FILTER_SANITIZE_SPECIAL_CHARS);

			$dbPlayer = EntityPlayer::getPlayer('name = "'.$input_character.'" AND account_id = "'.$idLogged.'"')->fetchObject();
			if(empty($dbPlayer)){
				$status = 'This character does not belong to the logged in account.';
				return self::viewApplyToThisGuild($request,$name,$status);
			}
			if($dbPlayer->deletion == 1){
				$status = 'This character is deleted.';
				return self::viewApplyToThisGuild($request,$name,$status);
			}

			$dbApplications = EntityGuilds::getApplications('player_id = "'.$dbPlayer->id.'"')->fetchObject();
			if(!empty($dbApplications)){
				$status = 'This character has already applied to a Guild.';
				return self::viewApplyToThisGuild($request,$name,$status);
			}

			if(empty($postVars['apply_text'])){
				$status = 'You need to add some text.';
				return self::viewApplyToThisGuild($request,$name,$status);
			}

			$dbInvitations = EntityGuilds::getInvites('player_id = "'.$dbPlayer->id.'" AND guild_id = "'.$guild_id.'"')->fetchObject();
			if(!empty($dbInvitations)){
				$status = 'This character is already invited to this Guild.';
				return self::viewApplyToThisGuild($request,$name,$status);
			}

			$dbMember = EntityGuilds::getMembership('player_id = "'.$dbPlayer->id.'"')->fetchObject();
			if(!empty($dbMember)){
				$status = 'This character is already in a Guild.';
				return self::viewApplyToThisGuild($request,$name,$status);
			}

			$input_text = filter_var($postVars['apply_text'], FILTER_SANITIZE_SPECIAL_CHARS);
			$current_date = strtotime(date('d-m-Y h:i:s'));
			
			EntityGuilds::insertMyApplication([
				'player_id' => $dbPlayer->id,
				'account_id' => $idLogged,
				'guild_id' => $guild_id,
				'text' => $input_text,
				'status' => 0,
				'date' => $current_date
			]);
			$status = 'Sent with success!';
			return self::viewApplyToThisGuild($request,$name,$status);
		}

		if(isset($postVars['btn_cancelapply'])){

			if(empty($postVars['character_cancelapply'])){
				$status = 'Select an application.';
				return self::viewApplyToThisGuild($request,$name,$status);
			}

			$player_id = $postVars['character_cancelapply'];
			$dbApplications = EntityGuilds::getApplications('player_id = "'.$player_id.'" AND account_id = "'.$idLogged.'"');

			if(empty($dbApplications)){
				$status = 'Wrong character.';
				return self::viewApplyToThisGuild($request,$name,$status);
			}
			
			EntityGuilds::deleteMyApplication('player_id = "'.$player_id.'" AND account_id = "'.$idLogged.'"');
			$status = 'Application successfully canceled.';
			return self::viewApplyToThisGuild($request,$name,$status);
		}

	}

	public static function viewApplyToThisGuild($request,$name,$status = null)
	{
		$idLogged = SessionAdminLogin::idLogged();
		$dbPlayers = FunctionPlayer::getAllCharacters($idLogged);
		$guild_id = self::convertGuildName($name);

		$dbPlayersAccount = EntityPlayer::getPlayer('account_id = "'.$idLogged.'" AND deletion = "0"');
		while($player = $dbPlayersAccount->fetchObject()){
			$dbMember = EntityGuilds::getMembership('player_id = "'.$player->id.'"')->fetchObject();
			if(empty($dbMember)){
				$arrayMembers[] = [
					'id' => $player->id,
					'name' => $player->name,
				];
			}
		}

		$dbApplications = EntityGuilds::getApplications('account_id = "'.$idLogged.'" AND guild_id = "'.$guild_id.'"');
		while($application = $dbApplications->fetchObject()){

			$player = EntityPlayer::getPlayer('id = "'.$application->player_id.'"')->fetchObject();

			switch($application->status){
				case 0:
					$status_app = 'open';
					break;
				case 1:
					$status_app = 'closed';
					break;
				case 2:
					$status_app = 'accept';
			}

			$applications[] = [
				'player_id' => $application->player_id,
				'player_name' => $player->name,
				'player_level' => $player->level,
				'player_vocation' => FunctionPlayer::convertVocation($player->vocation),
				'player_status' => FunctionPlayer::isOnline($player->id),
				'guild_id' => $application->guild_id,
				'status' => $status_app,
				'date' => date('M d Y', $application->date),
			];
		}

		$content = View::render('pages/guilds/applytothisguild', [
			'applications' => $applications ?? null,
			'status' => $status,
			'players' => $arrayMembers ?? null,
			'guild' => FunctionGuilds::getGuildbyId(self::convertGuildName($name)),
		]);
		return parent::getBase('Guild', $content, 'guilds');
	}

	public static function insertJoinGuild($request,$name)
	{
		$postVars = $request->getPostVars();
		$guild_id = self::convertGuildName($name);
		$idLogged = SessionAdminLogin::idLogged();

		if(empty($postVars['character_join'])){
			$status = 'Select a character.';
			return self::viewJoinGuild($request,$name,$status);
		}
		$character_name = filter_var($postVars['character_join'], FILTER_SANITIZE_SPECIAL_CHARS);
		$dbPlayer = EntityPlayer::getPlayer('name = "'.$character_name.'" AND account_id = "'.$idLogged.'"')->fetchObject();
		if(empty($dbPlayer)){
			$status = 'Invalid character.';
			return self::viewJoinGuild($request,$name,$status);
		}

		$dbMember = EntityGuilds::getMembership('player_id = "'.$dbPlayer->id.'"')->fetchObject();
		if(!empty($dbMember)){
			$status = 'This character is in a Guild.';
			return self::viewJoinGuild($request,$name,$status);
		}

		$dbApplication = EntityGuilds::getApplications('player_id = "'.$dbPlayer->id.'"')->fetchObject();
		if(empty($dbApplication)){
			$status = 'This character is applied to another Guild.';
			return self::viewJoinGuild($request,$name,$status);
		}

		EntityGuilds::insertJoinMember([
			'player_id' => $dbPlayer->id,
			'guild_id' => $guild_id,
			'rank_id' => 3, // MEMBER
			'date' => strtotime(date('d-m-Y h:i:s')),
		]);
		return self::viewJoinGuild($request,$name);
	}

	public static function viewJoinGuild($request,$name,$status = null)
    {
		$guild_id = self::convertGuildName($name);
		$idLogged = SessionAdminLogin::idLogged();
		$dbPlayersAccount = EntityPlayer::getPlayer('account_id = "'.$idLogged.'"');
		while($playersAccount = $dbPlayersAccount->fetchObject()){
			$dbInvitation = EntityGuilds::getInvites('player_id = "'.$playersAccount->id.'" AND guild_id = "'.$guild_id.'"');
			while($invitation = $dbInvitation->fetchObject()){
				$arrayInvitations[] = [
					'id' => $playersAccount->id,
					'name' => $playersAccount->name,
				];
			}
		}
		if(empty($arrayInvitations)){
			$request->getRouter()->redirect('/community/guilds/'.$name.'/view');
		}
		$content = View::render('pages/guilds/joinguild', [
			'status' => $status,
			'worlds' => FunctionServer::getWorlds(),
			'guild' => FunctionGuilds::getGuildbyId(self::convertGuildName($name)),
			'invitations' => $arrayInvitations,
		]);
		return parent::getBase('Guilds', $content, 'guilds');
    }

	public static function viewGuild($request,$name)
    {
        $content = View::render('pages/guilds/viewguild', [
            'worlds' => FunctionServer::getWorlds(),
            'guild' => FunctionGuilds::getGuildbyId(self::convertGuildName($name)),
            'members' => FunctionGuilds::getAllMembers(self::convertGuildName($name)),
            'invites' => FunctionGuilds::getGuildInvites(self::convertGuildName($name)),
			'isInvited' => FunctionGuilds::verifyAccountInvited(self::convertGuildName($name)),
			'isLogged' => SessionAdminLogin::isLogged(),
			'isLeader' => FunctionGuilds::verifyAccountLeader(self::convertGuildName($name)),
			'isViceLeader' => FunctionGuilds::verifyAccountViceLeader(self::convertGuildName($name)),
			'isMember' => FunctionGuilds::verifyAccountMember(self::convertGuildName($name)),
        ]);
        return parent::getBase('Guilds', $content, 'guilds');
    }

    public static function viewAllGuilds()
    {
		$content = View::render('pages/guilds/allguilds', [
			'worlds' => FunctionServer::getWorlds(),
			'guilds' => FunctionGuilds::getGuilds(),
		]);
		return parent::getBase('Guilds', $content, 'guilds');
    }

}
