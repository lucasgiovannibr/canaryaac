<?php
/**
 * ThemeBox Class
 *
 * @package   CanaryAAC
 * @author    Lucas Giovanni <lucasgiovannidesigner@gmail.com>
 * @copyright 2022 CanaryAAC
 */

namespace App\Model\Functions;

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
}