<?php
/**
 * ThemeBox Class
 *
 * @package   CanaryAAC
 * @author    Lucas Giovanni <lucasgiovannidesigner@gmail.com>
 * @copyright 2022 CanaryAAC
 */

namespace App\Model\Functions;

use App\Model\Entity\ServerConfig as EntityServerConfig;
use App\Model\Entity\Polls as EntityPolls;
use App\Model\Functions\Player as FunctionsPlayer;
use App\Model\Entity\Player;

class ThemeBox
{
    public static function getHighscoresTop5()
    {
        $ribbon = 0;
        $select_players = Player::getPlayer('deletion = "0"', 'level DESC', 5);
        while ($player = $select_players->fetchObject()) {
            $ribbon++;
            if ($player->group_id < 3) {
                $arrayPlayers[] = [
                    'name' => $player->name,
                    'level' => $player->level,
                    'vocation' => FunctionsPlayer::convertVocation($player->vocation),
                    'outfit' => FunctionsPlayer::getOutfit($player->id),
                    'online' => FunctionsPlayer::isOnline($player->id),
                    'ribbon' => URL . '/resources/images/global/themeboxes/highscores/rank_' . $ribbon . '.png'
                ];
            }
        }
        return $arrayPlayers ?? '';
    }

    public static function getCurrentPoll()
    {
        $websiteInfo = EntityServerConfig::getInfoWebsite()->fetchObject();
        date_default_timezone_set($websiteInfo->timezone);

        $currentDate = strtotime(date('Y-m-d'));
        $poll = EntityPolls::getPolls(null, 'date_end DESC', 1)->fetchObject();
        if (empty($poll)) {
            return '';
        }

        if ($poll->date_end > $currentDate) {
            $arrayPolls = [
                'id' => $poll->id,
                'player_id' => $poll->player_id,
                'title' => $poll->title,
                'description' => $poll->description,
                'date_start' => date('M d Y', $poll->date_start),
                'date_end' => date('M d Y', $poll->date_end)
            ];
        }
        return $arrayPolls ?? '';
    }

}