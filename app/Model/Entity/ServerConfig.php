<?php
/**
 * Validator class
 *
 * @package   CanaryAAC
 * @author    Lucas Giovanni <lucasgiovannidesigner@gmail.com>
 * @copyright 2022 CanaryAAC
 */

namespace App\Model\Entity;

use App\DatabaseManager\Database;

class ServerConfig{
    public $id = 1;

    public $name = 'Canary AAC';

    public $site = 'canaryaac.com';

    public $description = 'A free and open-source Automatic Account Creator (AAC) written in PHP';

    public static function getInfoWebsite($where = null, $order = null, $limit = null, $fields = '*'){
        return (new Database('canary_website'))->select($where, $order, $limit, $fields);
    }

    public static function updateInfoWebsite($where = null, $values = null){
        return (new Database('canary_website'))->update($where, $values);
    }

    public static function getPlayerSamples($where = null, $order = null, $limit = null, $fields = '*'){
        return (new Database('canary_samples'))->select($where, $order, $limit, $fields);
    }

    public static function insertPlayerSample($values = null){
        return (new Database('canary_samples'))->insert($values);
    }

    public static function updatePlayerSample($where = null, $values = null){
        return (new Database('canary_samples'))->update($where, $values);
    }

    public static function deletePlayerSample($where = null){
        return (new Database('canary_samples'))->delete($where);
    }

    public static function getWorlds($where = null, $order = null, $limit = null, $fields = '*'){
        return (new Database('canary_worlds'))->select($where, $order, $limit, $fields);
    }

    public static function insertWorld($values = null){
        return (new Database('canary_worlds'))->insert($values);
    }

    public static function deleteWorld($where = null){
        return (new Database('canary_worlds'))->delete($where);
    }

}