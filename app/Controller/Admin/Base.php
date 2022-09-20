<?php
/**
 * Validator class
 *
 * @package   CanaryAAC
 * @author    Lucas Giovanni <lucasgiovannidesigner@gmail.com>
 * @copyright 2022 CanaryAAC
 */

namespace App\Controller\Admin;

use App\Model\Entity\Player as EntityPlayer;
use App\Model\Functions\Player;
use \App\Utils\View;
use App\Session\Admin\Login as SessionAdminLogin;

class Base{

    private static $databaseMenu = [
        [
            'id' => 1,
            'parent_id' => null,
            'name' => 'Home',
            'url' => URL . '/admin/home',
            'icon' => 'home',
            'slug' => 'home',
        ],
        [
            'id' => 26,
            'parent_id' => null,
            'name' => 'Donates',
            'url' => URL . '/admin/donates',
            'icon' => 'shopping-cart',
            'slug' => 'donates',
        ],
        [
            'id' => 27,
            'parent_id' => null,
            'name' => 'Upload',
            'url' => URL . '/admin/upload',
            'icon' => 'upload',
            'slug' => 'upload',
        ],
        [
            'id' => 29,
            'parent_id' => null,
            'name' => 'Create Client',
            'url' => URL . '/admin/client',
            'icon' => 'file-plus',
            'slug' => 'client',
        ],
        [
            'id' => 2,
            'parent_id' => null,
            'name' => 'Settings',
            'url' => URL . '/admin/#',
            'icon' => 'settings',
            'slug' => 'settings',
        ],
        [
            'id' => 3,
            'parent_id' => 2,
            'name' => 'Website',
            'url' => URL . '/admin/settings',
            'icon' => 'circle',
            'slug' => 'settings',
        ],
        [
            'id' => 4,
            'parent_id' => 2,
            'name' => 'Samples',
            'url' => URL . '/admin/samples',
            'icon' => 'circle',
            'slug' => 'samples',
        ],
        [
            'id' => 22,
            'parent_id' => 2,
            'name' => 'Worlds',
            'url' => URL . '/admin/worlds',
            'icon' => 'circle',
            'slug' => 'worlds',
        ],
        [
            'id' => 28,
            'parent_id' => 2,
            'name' => 'Polls',
            'url' => URL . '/admin/polls',
            'icon' => 'circle',
            'slug' => 'polls',
        ],
        [
            'id' => 5,
            'parent_id' => null,
            'name' => 'Publications',
            'url' => URL . '/admin/#',
            'icon' => 'edit',
            'slug' => 'publications',
        ],
        [
            'id' => 6,
            'parent_id' => 5,
            'name' => 'View',
            'url' => URL . '/admin/publications',
            'icon' => 'circle',
            'slug' => 'publications',
        ],
        [
            'id' => 7,
            'parent_id' => 5,
            'name' => 'News',
            'url' => URL . '/admin/publications/news',
            'icon' => 'circle',
            'slug' => 'news_publications',
        ],
        [
            'id' => 8,
            'parent_id' => 5,
            'name' => 'Newsticker',
            'url' => URL . '/admin/publications/newsticker',
            'icon' => 'circle',
            'slug' => 'newsticker_publications',
        ],
        [
            'id' => 9,
            'parent_id' => 5,
            'name' => 'Featured Article',
            'url' => URL . '/admin/publications/featuredarticle',
            'icon' => 'circle',
            'slug' => 'featuredarticle_publications',
        ],
        [
            'id' => 10,
            'parent_id' => null,
            'name' => 'Compendium',
            'url' => URL . '/admin/#',
            'icon' => 'play-circle',
            'slug' => 'compendium',
        ],
        [
            'id' => 11,
            'parent_id' => 10,
            'name' => 'View',
            'url' => URL . '/admin/compendium',
            'icon' => 'circle',
            'slug' => 'view_compendium',
        ],
        [
            'id' => 12,
            'parent_id' => 10,
            'name' => 'New',
            'url' => URL . '/admin/compendium/new',
            'icon' => 'circle',
            'slug' => 'new_compendium',
        ],
        [
            'id' => 13,
            'parent_id' => null,
            'name' => 'Library',
            'url' => URL . '/admin/#',
            'icon' => 'book',
            'slug' => 'library',
        ],
        [
            'id' => 14,
            'parent_id' => 13,
            'name' => 'Creatures',
            'url' => URL . '/admin/creatures',
            'icon' => 'circle',
            'slug' => 'creatures',
        ],
        [
            'id' => 15,
            'parent_id' => 13,
            'name' => 'Achievements',
            'url' => URL . '/admin/achievements',
            'icon' => 'circle',
            'slug' => 'achievements',
        ],
        [
            'id' => 16,
            'parent_id' => null,
            'name' => 'Community',
            'url' => URL . '/admin/#',
            'icon' => 'user',
            'slug' => 'community',
        ],
        [
            'id' => 17,
            'parent_id' => 16,
            'name' => 'Accounts',
            'url' => URL . '/admin/accounts',
            'icon' => 'circle',
            'slug' => 'accounts',
        ],
        [
            'id' => 18,
            'parent_id' => 16,
            'name' => 'Players',
            'url' => URL . '/admin/players',
            'icon' => 'circle',
            'slug' => 'players',
        ],
        [
            'id' => 19,
            'parent_id' => 16,
            'name' => 'Houses',
            'url' => URL . '/admin/houses',
            'icon' => 'circle',
            'slug' => 'houses',
        ],
        [
            'id' => 20,
            'parent_id' => 16,
            'name' => 'Guilds',
            'url' => URL . '/admin/guilds',
            'icon' => 'circle',
            'slug' => 'guilds',
        ],
        [
            'id' => 21,
            'parent_id' => 16,
            'name' => 'Groups',
            'url' => URL . '/admin/groups',
            'icon' => 'circle',
            'slug' => 'groups',
        ],
        [
            'id' => 23,
            'parent_id' => null,
            'name' => 'Market Offers',
            'url' => URL . '/admin/market',
            'icon' => 'shopping-cart',
            'slug' => 'market',
        ],
        [
            'id' => 24,
            'parent_id' => null,
            'name' => 'Bans',
            'url' => URL . '/admin/bans',
            'icon' => 'slash',
            'slug' => 'bans',
        ],
        [
            'id' => 25,
            'parent_id' => null,
            'name' => 'Logout',
            'url' => URL . '/admin/logout',
            'icon' => 'power',
            'slug' => 'logout',
        ],
    ];

    public static function consctructMenu($menus, &$menuFinal, $menuSuperiorId, $nivel = 0, $currentModule = null)
    {
        foreach (self::$databaseMenu as $menu) {
            if ($menu['parent_id'] == $menuSuperiorId) {
                $menuFinal[] = [
                    'id' => $menu['id'],
                    'name' => $menu['name'],
                    'url' => $menu['url'],
                    'icon' => $menu['icon'],
                    'slug' => $menu['slug'],
                    'current' => $menu['slug'] == $currentModule ? 'active' : ''
                ];
            }
        }
        $nivel++;
        for ($i = 0; $i < count($menuFinal); $i++) {
            $menuFinal[$i]['submenu'] = [];
            $menuFinal[$i]['current'] = $menuFinal[$i]['slug'] == $currentModule ? 'active' : '';
            $menuFinal[$i]['nivel'] = $nivel;
            self::consctructMenu($menus, $menuFinal[$i]['submenu'], $menuFinal[$i]['id'], $nivel, $currentModule);
        }
        return $menuFinal;        
    }

    public static function formatMenu($currentModule)
    {
        $menuFinal = [];
        $links = self::consctructMenu(self::$databaseMenu, $menuFinal, null, null, $currentModule);
        return $links;
    }

    public static function getAccountLogged()
    {
        $logged = [];
        if(SessionAdminLogin::isLogged() == true){
            $admin = SessionAdminLogin::idLogged();

            $account = EntityPlayer::getAccount('id = "'.$admin.'"')->fetchObject();
            $playerMain = EntityPlayer::getPlayer('account_id = "'.$account->id.'" AND main = "1"')->fetchObject();

            $logged = [
                'id' => $account->id,
                'name' => $account->name,
                'email' => $account->email,
                'premdays' => $account->premdays,
                'coins' => $account->coins,
                'player' => [
                    'name' => $playerMain->name,
                    'level' => $playerMain->level,
                    'group' => Player::convertGroup($playerMain->group_id),
                    'outfit' => Player::getOutfit($playerMain->id),
                    'main' => $playerMain->main,
                    'online' => Player::isOnline($playerMain->id)
                ],
            ];
        }
        return $logged;
    }

    public static function getPanel($title, $content, $currentModule)
    {
        return View::render('admin/base', [
            'title' => $title . ' - CanaryAAC',
            'content' => $content,
            'menu' => self::formatMenu($currentModule),
            'admin' => self::getAccountLogged(),
        ]);
    }

}