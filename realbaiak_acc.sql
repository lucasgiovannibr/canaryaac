-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13-Fev-2023 às 15:59
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `realbaiak_acc`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `password` char(40) NOT NULL,
  `secret` char(16) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `premdays` int(11) NOT NULL DEFAULT 0,
  `coins` int(12) NOT NULL DEFAULT 0,
  `coins_tournaments` int(12) NOT NULL DEFAULT 0,
  `tournament_coins` int(12) NOT NULL,
  `lastday` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `proxy_id` int(11) NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL DEFAULT '',
  `creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `recruiter` int(6) DEFAULT 0,
  `vote` int(11) NOT NULL DEFAULT 0,
  `key` varchar(20) NOT NULL DEFAULT '0',
  `email_new` varchar(255) NOT NULL DEFAULT '',
  `email_new_time` int(11) NOT NULL DEFAULT 0,
  `rlname` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `page_access` int(11) NOT NULL DEFAULT 0,
  `email_code` varchar(255) NOT NULL DEFAULT '',
  `next_email` int(11) NOT NULL DEFAULT 0,
  `premium_points` int(11) NOT NULL DEFAULT 0,
  `create_date` bigint(20) NOT NULL DEFAULT 0,
  `create_ip` bigint(20) NOT NULL DEFAULT 0,
  `last_post` int(11) NOT NULL DEFAULT 0,
  `flag` varchar(80) NOT NULL DEFAULT '',
  `vip_time` int(11) NOT NULL DEFAULT 0,
  `guild_points` int(11) NOT NULL DEFAULT 0,
  `guild_points_stats` int(11) NOT NULL DEFAULT 0,
  `passed` int(11) NOT NULL DEFAULT 0,
  `block` int(11) NOT NULL DEFAULT 0,
  `refresh` int(11) NOT NULL DEFAULT 0,
  `birth_date` varchar(50) NOT NULL DEFAULT '',
  `gender` varchar(20) NOT NULL DEFAULT '',
  `loyalty_points` bigint(20) NOT NULL DEFAULT 0,
  `authToken` varchar(100) NOT NULL DEFAULT '',
  `player_sell_bank` int(11) DEFAULT 0,
  `secret_status` tinyint(1) NOT NULL DEFAULT 0,
  `tournamentBalance` int(11) NOT NULL DEFAULT 0,
  `language` int(3) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `password`, `secret`, `type`, `premdays`, `coins`, `coins_tournaments`, `tournament_coins`, `lastday`, `proxy_id`, `email`, `creation`, `recruiter`, `vote`, `key`, `email_new`, `email_new_time`, `rlname`, `location`, `page_access`, `email_code`, `next_email`, `premium_points`, `create_date`, `create_ip`, `last_post`, `flag`, `vip_time`, `guild_points`, `guild_points_stats`, `passed`, `block`, `refresh`, `birth_date`, `gender`, `loyalty_points`, `authToken`, `player_sell_bank`, `secret_status`, `tournamentBalance`, `language`) VALUES
(2, 'GU985423', 'e247251862624aa67f728619a8b7253f9bd67f02', 'TEQM7WYKAAZ5RRSD', 5, 99987, 98969, 11419, 0, 1676217706, 0, 'almeidaliber@gmail.com', '0000-00-00 00:00:00', 0, 0, 'VE1A-3UPU-PY3I-VO5A', '', 0, 'Gustavo Liber', 'São Paulo', 3, '', 0, 0, 0, 2130706433, 1642011224, 'unknown', 1761344042, 0, 0, 0, 0, 0, '10/4/1995', 'male', 0, 'TEQM7WYKAAZ5RRSD', 0, 1, 0, 2),
(3, 'GU9854233', 'e247251862624aa67f728619a8b7253f9bd67f02', '', 1, 0, 0, 10939, 0, 0, 0, 'almeidaliber@hotmail.com', '0000-00-00 00:00:00', 0, 0, 'YVOW-ELOR-AVO3-A5YM', '', 0, 'Gustavo Liber', 'Sao paulo', 0, '', 0, 0, 0, 2130706433, 0, 'unknown', 1675203468, 0, 0, 0, 0, 0, '1/1/2009', 'female', 0, '', 0, 0, 0, 2),
(4, '', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', NULL, 5, 0, 2000, 0, 0, 0, 0, 'admin@canaryaac.com', '2022-08-03 11:44:10', 0, 0, '0', '', 0, '', '', 3, '', 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `accounts_options`
--

CREATE TABLE `accounts_options` (
  `account_id` int(11) NOT NULL,
  `options` text COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `accounts_storage`
--

CREATE TABLE `accounts_storage` (
  `account_id` int(11) NOT NULL DEFAULT 0,
  `key` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `value` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `accounts_storage`
--

INSERT INTO `accounts_storage` (`account_id`, `key`, `value`) VALUES
(2, 2, 1673192457),
(3, 2, 1673376951);

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_authentication`
--

CREATE TABLE `account_authentication` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_bans`
--

CREATE TABLE `account_bans` (
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_ban_history`
--

CREATE TABLE `account_ban_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expired_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_character_sale`
--

CREATE TABLE `account_character_sale` (
  `id` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `id_player` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `price_type` tinyint(4) NOT NULL,
  `price_coins` int(11) DEFAULT NULL,
  `price_gold` int(11) DEFAULT NULL,
  `dta_insert` datetime NOT NULL,
  `dta_valid` datetime NOT NULL,
  `dta_sale` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_character_sale_history`
--

CREATE TABLE `account_character_sale_history` (
  `id` int(11) NOT NULL,
  `id_old_account` int(11) DEFAULT NULL,
  `id_player` int(11) DEFAULT NULL,
  `id_new_account` int(11) DEFAULT NULL,
  `price_type` tinyint(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `char_id` int(11) DEFAULT NULL,
  `dta_insert` datetime NOT NULL DEFAULT current_timestamp(),
  `dta_sale` datetime DEFAULT NULL,
  `extornada` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_credentials`
--

CREATE TABLE `account_credentials` (
  `id_credential` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_registration`
--

CREATE TABLE `account_registration` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `recovery` varchar(23) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL,
  `housenumber` int(10) NOT NULL,
  `additional` varchar(50) NOT NULL,
  `postalcode` varchar(20) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_viplist`
--

CREATE TABLE `account_viplist` (
  `account_id` int(11) NOT NULL COMMENT 'id of account whose viplist entry it is',
  `player_id` int(11) NOT NULL COMMENT 'id of target player of viplist entry',
  `description` varchar(128) NOT NULL DEFAULT '',
  `icon` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `notify` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `announcements`
--

CREATE TABLE `announcements` (
  `id` int(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `text` varchar(255) NOT NULL,
  `date` varchar(20) NOT NULL,
  `author` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atr_wikki_category`
--

CREATE TABLE `atr_wikki_category` (
  `id_atr_wikki_category` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `dta_insert` datetime NOT NULL DEFAULT current_timestamp(),
  `dta_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dta_deleted` datetime DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atr_wikki_subcategory`
--

CREATE TABLE `atr_wikki_subcategory` (
  `id_atr_wikki_subcategory` int(11) NOT NULL,
  `id_atr_wikki_category` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `text` text NOT NULL,
  `dta_insert` datetime NOT NULL DEFAULT current_timestamp(),
  `dta_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dta_deleted` datetime DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auction_system`
--

CREATE TABLE `auction_system` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_id` smallint(6) NOT NULL,
  `count` smallint(5) NOT NULL,
  `value` int(7) NOT NULL,
  `date` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `blessings_history`
--

CREATE TABLE `blessings_history` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `blessing` tinyint(4) NOT NULL,
  `loss` tinyint(1) NOT NULL,
  `timestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `boosted_boss`
--

CREATE TABLE `boosted_boss` (
  `id` int(11) NOT NULL,
  `looktype` int(11) NOT NULL DEFAULT 136,
  `lookfeet` int(11) NOT NULL DEFAULT 0,
  `looklegs` int(11) NOT NULL DEFAULT 0,
  `lookhead` int(11) NOT NULL DEFAULT 0,
  `lookbody` int(11) NOT NULL DEFAULT 0,
  `lookaddons` int(11) NOT NULL DEFAULT 0,
  `lookmount` int(11) NOT NULL DEFAULT 0,
  `date` varchar(250) NOT NULL DEFAULT '',
  `boostname` text DEFAULT NULL,
  `raceid` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `boosted_boss`
--

INSERT INTO `boosted_boss` (`id`, `looktype`, `lookfeet`, `looklegs`, `lookhead`, `lookbody`, `lookaddons`, `lookmount`, `date`, `boostname`, `raceid`) VALUES
(1, 136, 0, 0, 0, 0, 0, 0, '', 'Goshnar\'s Greed', '1804');

-- --------------------------------------------------------

--
-- Estrutura da tabela `boosted_creature`
--

CREATE TABLE `boosted_creature` (
  `looktype` int(11) NOT NULL DEFAULT 136,
  `lookfeet` int(11) NOT NULL DEFAULT 0,
  `looklegs` int(11) NOT NULL DEFAULT 0,
  `lookhead` int(11) NOT NULL DEFAULT 0,
  `lookbody` int(11) NOT NULL DEFAULT 0,
  `lookaddons` int(11) NOT NULL DEFAULT 0,
  `lookmount` int(11) DEFAULT 0,
  `date` varchar(250) NOT NULL DEFAULT '',
  `boostname` text DEFAULT NULL,
  `raceid` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `boosted_creature`
--

INSERT INTO `boosted_creature` (`looktype`, `lookfeet`, `looklegs`, `lookhead`, `lookbody`, `lookaddons`, `lookmount`, `date`, `boostname`, `raceid`) VALUES
(148, 95, 114, 114, 48, 0, 0, '13', 'Druid\'s Apparition', '1946');

-- --------------------------------------------------------

--
-- Estrutura da tabela `boost_creature`
--

CREATE TABLE `boost_creature` (
  `name` varchar(255) NOT NULL,
  `exp` int(11) NOT NULL DEFAULT 0,
  `loot` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `boss_room`
--

CREATE TABLE `boss_room` (
  `room_id` int(2) NOT NULL,
  `guid_player` varchar(32) NOT NULL,
  `time` int(11) NOT NULL,
  `to_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_achievements`
--

CREATE TABLE `canary_achievements` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `grade` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `storage` int(11) NOT NULL,
  `secret` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_badges`
--

CREATE TABLE `canary_badges` (
  `id` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_boss`
--

CREATE TABLE `canary_boss` (
  `id` int(11) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_compendium`
--

CREATE TABLE `canary_compendium` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `headline` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `publishdate` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_countdowns`
--

CREATE TABLE `canary_countdowns` (
  `id` int(11) NOT NULL,
  `date_start` int(11) NOT NULL,
  `date_end` int(11) NOT NULL,
  `themebox` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_creatures`
--

CREATE TABLE `canary_creatures` (
  `id` int(11) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_groups`
--

CREATE TABLE `canary_groups` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `canary_groups`
--

INSERT INTO `canary_groups` (`id`, `group_id`, `name`) VALUES
(1, 1, 'player'),
(2, 2, 'tutor'),
(3, 3, 'senior tutor'),
(4, 4, 'gamemaster'),
(5, 5, 'community manager'),
(6, 6, 'god');

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_items`
--

CREATE TABLE `canary_items` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `type` varchar(150) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_news`
--

CREATE TABLE `canary_news` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `body` text NOT NULL,
  `type` tinyint(4) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `category` tinyint(4) NOT NULL,
  `player_id` int(11) NOT NULL,
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_date` datetime NOT NULL,
  `comments` varchar(50) NOT NULL,
  `article_text` varchar(300) NOT NULL,
  `article_image` varchar(100) NOT NULL,
  `hidden` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_payments`
--

CREATE TABLE `canary_payments` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `method` varchar(100) NOT NULL,
  `reference` varchar(200) NOT NULL,
  `total_coins` int(11) NOT NULL,
  `final_price` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_polls`
--

CREATE TABLE `canary_polls` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(250) NOT NULL,
  `description` varchar(500) NOT NULL,
  `date_start` int(11) NOT NULL,
  `date_end` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_polls_answers`
--

CREATE TABLE `canary_polls_answers` (
  `id` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_polls_questions`
--

CREATE TABLE `canary_polls_questions` (
  `id` int(11) NOT NULL,
  `poll_id` int(11) NOT NULL,
  `question` varchar(250) NOT NULL,
  `description` varchar(500) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_products`
--

CREATE TABLE `canary_products` (
  `id` int(11) NOT NULL,
  `coins` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `canary_products`
--

INSERT INTO `canary_products` (`id`, `coins`) VALUES
(1, 250),
(2, 750),
(3, 1500),
(4, 3000),
(5, 4500),
(6, 15000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_samples`
--

CREATE TABLE `canary_samples` (
  `id` int(11) NOT NULL,
  `vocation` int(11) NOT NULL,
  `experience` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `health` int(11) NOT NULL,
  `healthmax` int(11) NOT NULL,
  `maglevel` int(11) NOT NULL,
  `mana` int(11) NOT NULL,
  `manamax` int(11) NOT NULL,
  `manaspent` int(11) NOT NULL,
  `soul` int(11) NOT NULL,
  `town_id` int(11) NOT NULL,
  `posx` int(11) NOT NULL,
  `posy` int(11) NOT NULL,
  `posz` int(11) NOT NULL,
  `cap` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `lookbody` int(11) NOT NULL,
  `lookfeet` int(11) NOT NULL,
  `lookhead` int(11) NOT NULL,
  `looklegs` int(11) NOT NULL,
  `looktype` int(11) NOT NULL,
  `lookaddons` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `canary_samples`
--

INSERT INTO `canary_samples` (`id`, `vocation`, `experience`, `level`, `health`, `healthmax`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `cap`, `balance`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`) VALUES
(1, 0, 4200, 8, 185, 185, 0, 90, 90, 0, 0, 2, 0, 0, 0, 470, 0, 113, 115, 95, 39, 129, 0),
(3, 2, 4200, 8, 185, 185, 0, 90, 90, 0, 0, 2, 0, 0, 0, 470, 0, 113, 115, 95, 39, 130, 0),
(4, 3, 4200, 8, 185, 185, 0, 90, 90, 0, 0, 2, 0, 0, 0, 470, 0, 113, 115, 95, 39, 129, 0),
(5, 4, 4200, 8, 185, 185, 0, 90, 90, 0, 0, 2, 0, 0, 0, 470, 0, 113, 115, 95, 39, 131, 0),
(6, 1, 4200, 8, 185, 185, 0, 90, 90, 0, 0, 2, 0, 0, 0, 470, 0, 113, 115, 95, 39, 130, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_towns`
--

CREATE TABLE `canary_towns` (
  `id` int(11) NOT NULL,
  `town_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `canary_towns`
--

INSERT INTO `canary_towns` (`id`, `town_id`, `name`) VALUES
(1, 0, 'No Town'),
(2, 1, 'Real City'),
(3, 2, 'Jah\'Island'),
(4, 3, 'Kravhzi'),
(5, 4, 'Al\'Nahf'),
(6, 5, 'Bkrianz'),
(7, 6, 'Iceland'),
(8, 7, 'Woodzbrock'),
(9, 8, 'Premia Island');

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_uploads`
--

CREATE TABLE `canary_uploads` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `path` varchar(500) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_website`
--

CREATE TABLE `canary_website` (
  `id` int(11) NOT NULL,
  `timezone` varchar(150) NOT NULL,
  `title` varchar(70) NOT NULL,
  `downloads` varchar(250) NOT NULL,
  `discord` varchar(250) NOT NULL,
  `player_voc` int(11) NOT NULL COMMENT '0 off and 1 on',
  `player_max` int(11) NOT NULL COMMENT 'players por conta',
  `player_guild` int(11) NOT NULL COMMENT 'level',
  `donates` int(11) NOT NULL COMMENT '0 off and 1 on',
  `coin_price` decimal(10,2) NOT NULL,
  `mercadopago` int(11) NOT NULL,
  `pagseguro` int(11) NOT NULL,
  `paypal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `canary_website`
--

INSERT INTO `canary_website` (`id`, `timezone`, `title`, `downloads`, `discord`, `player_voc`, `player_max`, `player_guild`, `donates`, `coin_price`, `mercadopago`, `pagseguro`, `paypal`) VALUES
(1, 'America/Sao_Paulo', 'CanaryAAC v1', 'http://www.google.com', '', 1, 10, 100, 1, '0.10', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_worldquests`
--

CREATE TABLE `canary_worldquests` (
  `id` int(11) NOT NULL,
  `storage` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_worlds`
--

CREATE TABLE `canary_worlds` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `creation` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `location` int(11) NOT NULL DEFAULT 0,
  `pvp_type` int(11) NOT NULL DEFAULT 0,
  `premium_type` int(11) NOT NULL DEFAULT 0,
  `transfer_type` int(11) NOT NULL DEFAULT 0,
  `battle_eye` int(11) NOT NULL DEFAULT 0,
  `world_type` int(11) NOT NULL DEFAULT 0,
  `ip` varchar(18) NOT NULL,
  `port` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `canary_worlds`
--

INSERT INTO `canary_worlds` (`id`, `name`, `creation`, `location`, `pvp_type`, `premium_type`, `transfer_type`, `battle_eye`, `world_type`, `ip`, `port`) VALUES
(1, 'Canary', '2022-09-01 09:00:00', 7, 0, 0, 0, 0, 0, '127.0.0.1', 7172);

-- --------------------------------------------------------

--
-- Estrutura da tabela `castle`
--

CREATE TABLE `castle` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `guild_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `castle`
--

INSERT INTO `castle` (`id`, `name`, `guild_id`) VALUES
(1, 'RealSoft', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `castle_48`
--

CREATE TABLE `castle_48` (
  `guild_id` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `coins_transactions`
--

CREATE TABLE `coins_transactions` (
  `id` int(11) NOT NULL,
  `account_id` int(11) UNSIGNED NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL,
  `amount` int(12) UNSIGNED NOT NULL,
  `description` varchar(3500) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `daily_reward_history`
--

CREATE TABLE `daily_reward_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `daystreak` smallint(2) NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `daily_reward_history`
--

INSERT INTO `daily_reward_history` (`id`, `daystreak`, `player_id`, `timestamp`, `description`) VALUES
(1, 0, 9, 1673273259, 'Claimed reward no. 1. Picked items: 10x ultimate mana potion.'),
(2, 1, 9, 1673362527, 'Claimed reward no. 2. Picked items: 10x ultimate mana potion.'),
(3, 0, 10, 1673376640, 'Claimed reward no. 1. Picked items: 10x ultimate mana potion.'),
(4, 2, 9, 1673453866, 'Claimed reward no. 3. Picked reward: 2x Prey bonus reroll(s)'),
(5, 1, 10, 1674491240, 'Claimed reward no. 2. Picked items: 10x animate dead rune.'),
(6, 2, 10, 1674576002, 'Claimed reward no. 3. Picked reward: 2x Prey bonus reroll(s)'),
(7, 3, 9, 1674576011, 'Claimed reward no. 4. Picked items: 20x animate dead rune.'),
(8, 4, 9, 1674747299, 'Claimed reward no. 5. Picked reward: 2x Prey bonus reroll(s)'),
(9, 3, 10, 1674747304, 'Claimed reward no. 4. Picked items: 20x animate dead rune.'),
(10, 5, 9, 1674851310, 'Claimed reward no. 6. Picked items: 2x training wand.'),
(11, 6, 9, 1675031403, 'Claimed reward no. 7. Picked reward: XP Bonus for 30 minutes.'),
(12, 4, 10, 1675181908, 'Claimed reward no. 5. Picked reward: 2x Prey bonus reroll(s)'),
(13, 0, 9, 1675181914, 'Claimed reward no. 1. Picked items: 10x ultimate mana potion.'),
(14, 1, 9, 1675263375, 'Claimed reward no. 2. Picked items: 10x ultimate mana potion.'),
(15, 2, 9, 1675709933, 'Claimed reward no. 3. Picked reward: 2x Prey bonus reroll(s)'),
(16, 3, 9, 1676248857, 'Claimed reward no. 4. Picked items: 20x ultimate mana potion.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `exclusive_hunts`
--

CREATE TABLE `exclusive_hunts` (
  `hunt_id` int(2) NOT NULL,
  `guid_player` varchar(32) NOT NULL,
  `time` int(11) NOT NULL,
  `to_time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `forge_history`
--

CREATE TABLE `forge_history` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `action_type` int(11) NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `is_success` tinyint(4) NOT NULL DEFAULT 0,
  `bonus` tinyint(4) NOT NULL DEFAULT 0,
  `done_at` bigint(20) NOT NULL,
  `done_at_date` datetime DEFAULT current_timestamp(),
  `cost` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `gained` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `forge_history`
--

INSERT INTO `forge_history` (`id`, `player_id`, `action_type`, `description`, `is_success`, `bonus`, `done_at`, `done_at_date`, `cost`, `gained`) VALUES
(1827, 9, 2, 'Converted 60 dust to 3 slivers.', 1, 0, 1673278112, '2023-02-13 10:58:19', 0, 0),
(1828, 9, 2, 'Spent 25 dust to increase the dust limit to 101.', 1, 0, 1673278113, '2023-02-13 10:58:19', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `free_pass`
--

CREATE TABLE `free_pass` (
  `player_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `global_storage`
--

CREATE TABLE `global_storage` (
  `key` varchar(32) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `global_storage`
--

INSERT INTO `global_storage` (`key`, `value`) VALUES
('14110', '1675781700'),
('40000', '4'),
('48503', '3');

-- --------------------------------------------------------

--
-- Estrutura da tabela `guilds`
--

CREATE TABLE `guilds` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` bigint(20) NOT NULL,
  `motd` varchar(255) NOT NULL DEFAULT '',
  `residence` int(11) NOT NULL,
  `description` text NOT NULL,
  `guild_logo` mediumblob DEFAULT NULL,
  `create_ip` bigint(20) NOT NULL DEFAULT 0,
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `last_execute_points` bigint(20) NOT NULL DEFAULT 0,
  `logo_gfx_name` varchar(255) NOT NULL DEFAULT '',
  `level` int(11) NOT NULL DEFAULT 1,
  `points` int(11) NOT NULL DEFAULT 0,
  `logo_name` varchar(100) NOT NULL,
  `world_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `guilds`
--

INSERT INTO `guilds` (`id`, `name`, `ownerid`, `creationdata`, `motd`, `residence`, `description`, `guild_logo`, `create_ip`, `balance`, `last_execute_points`, `logo_gfx_name`, `level`, `points`, `logo_name`, `world_id`) VALUES
(3, 'RealSoft', 9, 1673371048, '', 0, 'New guild. Leader must edit this text :)', 0x313637333337313034383b646174613a696d6167652f6769663b6261736536342c52306c474f446c68514142414150634141414141414167414142414141426741414267494143454941436b494144454941446b4941446b514145495141456f514146495141466f5141466f5941474d5941474e6a556d73594147744b4147746a556d746a576d7472576e4d5941484e5341484e72576e4e72593373594148736841487453414874614148747a5933747a6134516841495261414952614349526a4349523761345237633477684149786a434979456334794565355168414a5272434a534d65357770414a7872434a787a434a794d6535794d684a7955684b5570414b567a434b5637434b5755684b57636a4b3070414b3137434b32636a4c5570414c5637434c5745434c576c6c4c57746c4c3078414c3245434c324d434c32316e4d5978414d614d434d6155434d613170633478414d3655434d363972645978414e5935414e6155434e6163434e3435414f2f657876666e7a762f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f79483542414541414645414c414141414142414145414141416a2b414b4e4543514367494d454143424d614e4b6a774945494143523832584168526f734f43416a4e7144494345434a4b50486b4d7943596c6b704567695445717137496753704d6d534b564e2b424e6b785a514162476a554347466d795a63715750556b7947597079364a4f6951486c366a456c7a4a70475141456a677a446c514a644759517a753672506b7861396169566e334b354e6e314b63696f55334d475942717a3645696c4d4a64794e5174544a6b69554872757964456b4567496359564b75614841757a37744359543868364e566f54373958446b4c4d69415a4342525741414d346d7566496c334a52496749427759534a444167516f634d7a305870706c334a6d584c5644482f334e454368496b574c585a6b3172736a41634944466d3672734a424167414146514754694a644969416f4d45437851343244446a4b5a4d416c533854595641516749414443784c2b474341674945414243302b424741415141516752484245576a485a674167675142774149754e39517675427842632b743939414f324d4757303034426e4a424545556b306d4951525267685278417348454151414345793051414242423051414167675062426a41427570565a454551437a375949494d4e42684641424156656c6d45424434366741476b5858464144697755454145514c454946515630307041516c52424431495749515251627777516764516a6c4145677744733846706761303357517848486d61444341777751304a304354437751514163416243415a5351514738494345456c37775541476c4d6141414141636b55634e615638615730674d4a4f464744624a6b5a344141537667584234414836465561454351416b30454f456778365558463432695a4445416739636c78315657524952774b5146624a425a4241596755594143437844775942482b4b775267416c356d4b696745445155416f4943504368786746334d4154426b41536a474343744a7a547651416746764450724157456230426b494f4542546841684a67354a424845726970305a4d4777736e34567741704a4d4c4341545a3865364251414c7851686751456a4b624242437a36715249514b4144516f78486f4353446a6f41756c35564a715653346c57684c4974466175755376516d4b59414451484145774b78443968564145454c514b63514a41594241524849647565646a41685a6b43454151526e53386c4d493639545153615577574641472b4c6d7631314b364b356864416456725a2b3441434f46514a41413146524b41415633327136785954424851675951414f455042415479795a42536b4151675278595770504c53633041437641796c4856536266383030635232316f65616e6c5a39786b4133795a51524137444f70575a714276594b55542b724343666c65354776336f5573616237476f42443132574e31304d5043536278674146306d51567441515759454d41494146545847684e6c5a3751543155516346664544443536416d585650425a3244455865654c4951414d365132457043354267324143707131314c6c416d4b56476b374d4739494379413141443052486c526777365177494b4643464333552f4e414941424b7942634a56746d73657a35556b546c746344304147697137613553427a427474522b6258775141755431515541634d756944415a46687078766e666e6e2f464642494f4641426a414161676752416b4e49494148454149644a7542416774676743496b4a41453779747175647249736c78786d4d766754534a597959784956794b6f41524141425175416e4241433449416c30497739434b4865434771424d4344333458674677344b4e6c59636f3948646c64464862696b5365774a43582b45597459567a62676e32414a5956525453704b454d4559445a786c514e797049414c3161307a4d4d476b676e5a6c6e5453495a56706377416759467a4330434f4c694343437a43675277525267417263746f41494f4941425a45456345725448753851677759655355785549456843426c6a7846616b5777674147494978344437476f466739494c536741514d5a37465a535a303347486b674149457930305264514b676752454b344b69524145423477364b4c42794f47756a6836366f716549354a71356a6944414a53736136344c35534d4c4d49496b464541334c4e6c5a4168696746636241524965396f31705969436739397a776c5830666b79646c6f756138574c4d55434d78795763694a6a52537a31386965646d654d4469476566566a5a6f4c5639425351474d554951446d43416c725153434145716d484c64395249636349556c5a56424b304670514843506a2b61684142756b615763526242415267436b676f59634143364b4b55316b6253682f727a794759486d4b674c42536f493073556d45635a5a724178343067625069346a596677695368636c466b46596b49417535674c5a6c5753596b2f665a4f3537786e76626b785a436a7a74395a4b7274415249426d68426a7867774e73574d4d77674530413842447443567439776c6d7a506c7a503532383858623351636942466a5665416f4349664f6f7a4334586c4d785051496f7059626154595242355147356134494146744c4668367a4f41653743796c634b38425a3559736335536c374b554135545651674567674145535567535552693473512f6f4956307543522b57416a69576f4d6b494f436c436244637a4c41766e71774c6d415971386668724f61666a724b543635694c7a2b2b6255474d564934424c6d444c47627a454b596954584662676d553348644d576a7167332b514c735530456367427141494c68714c5a4f7a326c74346d315732516f577732475743416d49586b63556b514151502b537357694a6957536f5451713934424c555341594d56787a66427262376c6931754a416c4e5343747246587531726152464f424e4c786957644a4b77676752383569324f79654e6a33706e4248536f46767463384446412b64744c79584f78314f78694b38654a344e77344b747236395178316656684936716a48426b4e6f53514e6a736c4a53754f63596b46393569666366576b614e4d6c79316e49347130466d5345463152517158495662336354366a764e37455a794b456e4d6f774a67684353556349337a50416c58636b7866565049756342656379335342306a2b674c74646c2b6c506b56316547344b2b6f3248647553773451453643724b7562596a2b46306d366732544b547039704a37527430746a724d595a674f7a465373363347482b5948736231386a6f5679357370534a6b65676d3641464441417a49496a4833745674546473466b7839514f4c522b66363353315367415133304c4d6b6434766b42644f454a35716c4d354b7a367061455461432b47564843546e436f573077742b596339477a4347645473586d3041414134685774454347554a436c787457796b705a6e46532f59747134555a414b6f7a724f71567932445545355356424b70794c496b45784749474b544459706b6a4243695141524c6f65746572766b477847554942436d416741396a4f64743275732b774b5a44766233566b495169685167512b6b494e4851316f675366434344456e6a6732786e7741416c5177494a363235734645694f33422b68393733716a674154762f72594853694144483651374d45505167517a364c514e30553855484151413443525474677873732f4e3479304d48424e773774496477414d4277507563674c566533774b45426835496f4f434141414f773d3d, 2130706433, 0, 0, '', 1, 0, '', 0),
(4, 'Other Guilds', 10, 1673377483, '', 0, 'New guild. Leader must edit this text :)', 0x313637333337373438333b646174613a696d6167652f6769663b6261736536342c52306c474f446c68514142414150634141414141414167414142414141426741414267494143454941436b494144454941446b4941446b514145495141456f514146495141466f5141466f5941474d5941474e6a556d73594147744b4147746a556d746a576d7472576e4d5941484e5341484e72576e4e72593373594148736841487453414874614148747a5933747a6134516841495261414952614349526a4349523761345237633477684149786a434979456334794565355168414a5272434a534d65357770414a7872434a787a434a794d6535794d684a7955684b5570414b567a434b5637434b5755684b57636a4b3070414b3137434b32636a4c5570414c5637434c5745434c576c6c4c57746c4c3078414c3245434c324d434c32316e4d5978414d614d434d6155434d613170633478414d3655434d363972645978414e5935414e6155434e6163434e3435414f2f657876666e7a762f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f79483542414541414645414c414141414142414145414141416a2b414b4e4543514367494d454143424d614e4b6a774945494143523832584168526f734f43416a4e7144494345434a4b50486b4d7943596c6b704567695445717137496753704d6d534b564e2b424e6b785a514162476a554347466d795a63715750556b7947597079364a4f6951486c366a456c7a4a70475141456a677a446c514a644759517a753672506b7861396169566e334b354e6e314b63696f55334d475942717a3645696c4d4a64794e5174544a6b69554872757964456b4567496359564b75614841757a37744359543868364e566f54373958446b4c4d69415a4342525741414d346d7566496c334a52496749427759534a444167516f634d7a305870706c334a6d584c5644482f334e454368496b574c585a6b3172736a41634944466d3672734a424167414146514754694a644969416f4d45437851343244446a4b5a4d416c533854595641516749414443784c2b474341674945414243302b424741415141516752484245576a485a674167675142774149754e39517675427842632b743939414f324d4757303034426e4a424545556b306d4951525267685278417348454151414345793051414242423051414167675062426a41427570565a454551437a375949494d4e42684641424156656c6d45424434366741476b5858464144697755454145514c454946515630307041516c52424431495749515251627777516764516a6c4145677744733846706761303357517848486d61444341777751304a304354437751514163416243415a5351514738494345456c37775541476c4d6141414141636b55634e615638615730674d4a4f464744624a6b5a344141537667584234414836465561454351416b30454f456778365558463432695a4445416739636c78315657524952774b5146624a425a4241596755594143437844775942482b4b775267416c356d4b696745445155416f4943504368786746334d4154426b41536a474343744a7a547651416746764450724157456230426b494f4542546841684a67354a424845726970305a4d4777736e34567741704a4d4c4341545a3865364251414c7851686751456a4b624242437a36715249514b4144516f78486f4353446a6f41756c35564a715653346c57684c4974466175755376516d4b59414451484145774b78443968564145454c514b63514a41594241524849647565646a41685a6b43454151526e53386c4d493639545153615577574641472b4c6d7631314b364b356864416456725a2b3441434f46514a41413146524b41415633327136785954424851675951414f455042415479795a42536b4151675278595770504c53633041437641796c4856536266383030635232316f65616e6c5a39786b4133795a51524137444f70575a714276594b55542b724343666c65354776336f5573616237476f42443132574e31304d5043536278674146306d51567441515759454d41494146545847684e6c5a3751543155516346664544443536416d585650425a3244455865654c4951414d365132457043354267324143707131314c6c416d4b56476b374d4739494379413141443052486c526777365177494b4643464333552f4e414941424b7942634a56746d73657a35556b546c746344304147697137613553427a427474522b6258775141755431515541634d756944415a46687078766e666e6e2f464642494f4641426a414161676752416b4e49494148454149644a7542416774676743496b4a41453779747175647249736c78786d4d766754534a597959784956794b6f41524141425175416e4241433449416c30497739434b4865434771424d4344333458674677344b4e6c59636f3948646c64464862696b5365774a43582b45597459567a62676e32414a5956525453704b454d4559445a786c514e797049414c3161307a4d4d476b676e5a6c6e5453495a56706377416759467a4330434f4c694343437a43675277525267417263746f41494f4941425a45456345725448753851677759655355785549456843426c6a7846616b5777674147494978344437476f466739494c536741514d5a37465a535a303347486b674149457930305264514b676752454b344b69524145423477364b4c42794f47756a6836366f716549354a71356a6944414a53736136344c35534d4c4d49496b464541334c4e6c5a4168696746636241524965396f31705969436739397a776c5830666b79646c6f756138574c4d55434d78795763694a6a52537a31386965646d654d4469476566566a5a6f4c5639425351474d554951446d43416c725153434145716d484c64395249636349556c5a56424b304670514843506a2b61684142756b615763526242415267436b676f59634143364b4b55316b6253682f727a794759486d4b674c42536f493073556d45635a5a724178343067625069346a596677695368636c466b46596b49417535674c5a6c5753596b2f665a4f3537786e76626b785a436a7a74395a4b7274415249426d68426a7867774e73574d4d77674530413842447443567439776c6d7a506c7a503532383858623351636942466a5665416f4349664f6f7a4334586c4d785051496f7059626154595242355147356134494146744c4668367a4f41653743796c634b38425a3559736335536c374b554135545651674567674145535567535552693473512f6f4956307543522b57416a69576f4d6b494f436c436244637a4c41766e71774c6d415971386668724f61666a724b543635694c7a2b2b6255474d564934424c6d444c47627a454b596954584662676d553348644d576a7167332b514c735530456367427141494c68714c5a4f7a326c74346d315732516f577732475743416d49586b63556b514151502b537357694a6957536f5451713934424c555341594d56787a66427262376c6931754a416c4e5343747246587531726152464f424e4c786957644a4b77676752383569324f79654e6a33706e4248536f46767463384446412b64744c79584f78314f78694b38654a344e77344b747236395178316656684936716a48426b4e6f53514e6a736c4a53754f63596b46393569666366576b614e4d6c79316e49347130466d5345463152517158495662336354366a764e37455a794b456e4d6f774a67684353556349337a50416c58636b7866565049756342656379335342306a2b674c74646c2b6c506b56316547344b2b6f3248647553773451453643724b7562596a2b46306d366732544b547039704a37527430746a724d595a674f7a465373363347482b5948736231386a6f5679357370534a6b65676d3641464441417a49496a4833745674546473466b7839514f4c522b66363353315367415133304c4d6b6434766b42644f454a35716c4d354b7a367061455461432b47564843546e436f573077742b596339477a4347645473586d3041414134685774454347554a436c787457796b705a6e46532f59747134555a414b6f7a724f71567932445545355356424b70794c496b45784749474b544459706b6a4243695141524c6f65746572766b477847554942436d416741396a4f64743275732b774b5a44766233566b495169685167512b6b494e4851316f675366434344456e6a6732786e7741416c5177494a363235734645694f33422b68393733716a674154762f72594853694144483651374d45505167517a364c514e30553855484151413443525474677873732f4e3479304d48424e773774496477414d4277507563674c566533774b45426835496f4f434141414f773d3d, 2130706433, 0, 0, '', 1, 0, '', 0);

--
-- Acionadores `guilds`
--
DELIMITER $$
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds` FOR EACH ROW BEGIN
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('The Leader', 3, NEW.`id`);
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Vice-Leader', 2, NEW.`id`);
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Member', 1, NEW.`id`);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guildwar_kills`
--

CREATE TABLE `guildwar_kills` (
  `id` int(11) NOT NULL,
  `killer` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  `killerguild` int(11) NOT NULL DEFAULT 0,
  `targetguild` int(11) NOT NULL DEFAULT 0,
  `warid` int(11) NOT NULL DEFAULT 0,
  `time` bigint(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_actions_h`
--

CREATE TABLE `guild_actions_h` (
  `id` int(6) UNSIGNED NOT NULL,
  `guild_id` int(11) DEFAULT NULL,
  `player_id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `date` bigint(20) DEFAULT NULL,
  `type` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_applications`
--

CREATE TABLE `guild_applications` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `account_id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL DEFAULT 0,
  `text` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `date` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_events`
--

CREATE TABLE `guild_events` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `date` int(15) NOT NULL,
  `private` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_invites`
--

CREATE TABLE `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `guild_id` int(11) NOT NULL DEFAULT 0,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_membership`
--

CREATE TABLE `guild_membership` (
  `player_id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `nick` varchar(15) NOT NULL DEFAULT '',
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `guild_membership`
--

INSERT INTO `guild_membership` (`player_id`, `guild_id`, `rank_id`, `nick`, `date`) VALUES
(9, 3, 7, '', 0),
(10, 4, 10, '', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_ranks`
--

CREATE TABLE `guild_ranks` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL COMMENT 'guild',
  `name` varchar(255) NOT NULL COMMENT 'rank name',
  `level` int(11) NOT NULL COMMENT 'rank level - leader, vice, member, maybe something else'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `guild_ranks`
--

INSERT INTO `guild_ranks` (`id`, `guild_id`, `name`, `level`) VALUES
(7, 3, 'The Leader', 3),
(8, 3, 'Vice-Leader', 2),
(9, 3, 'Member', 1),
(10, 4, 'The Leader', 3),
(11, 4, 'Vice-Leader', 2),
(12, 4, 'Member', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_transfer_h`
--

CREATE TABLE `guild_transfer_h` (
  `id` int(6) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `from_guild_id` int(6) NOT NULL,
  `to_guild_id` int(6) NOT NULL,
  `value` int(11) NOT NULL,
  `date` bigint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guild_wars`
--

CREATE TABLE `guild_wars` (
  `id` int(11) NOT NULL,
  `guild1` int(11) NOT NULL DEFAULT 0,
  `guild2` int(11) NOT NULL DEFAULT 0,
  `name1` varchar(255) NOT NULL,
  `name2` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `started` bigint(15) NOT NULL DEFAULT 0,
  `ended` bigint(15) NOT NULL DEFAULT 0,
  `frags_limit` int(10) DEFAULT 20,
  `price1` int(11) NOT NULL DEFAULT 0,
  `price2` int(11) NOT NULL DEFAULT 0,
  `frags` int(11) NOT NULL DEFAULT 0,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `highscores`
--

CREATE TABLE `highscores` (
  `id` tinyint(4) NOT NULL,
  `name` tinyint(4) NOT NULL,
  `account_id` tinyint(4) NOT NULL,
  `group_id` tinyint(4) NOT NULL,
  `level` tinyint(4) NOT NULL,
  `experience` tinyint(4) NOT NULL,
  `vocation` tinyint(4) NOT NULL,
  `rank` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `houses`
--

CREATE TABLE `houses` (
  `id` int(11) NOT NULL,
  `house_id` int(11) NOT NULL,
  `world_id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `paid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `warnings` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `rent` int(11) NOT NULL DEFAULT 0,
  `town_id` int(11) NOT NULL DEFAULT 0,
  `bid` int(11) NOT NULL DEFAULT 0,
  `bid_end` int(11) NOT NULL DEFAULT 0,
  `last_bid` int(11) NOT NULL DEFAULT 0,
  `highest_bidder` int(11) NOT NULL DEFAULT 0,
  `size` int(11) NOT NULL DEFAULT 0,
  `guildid` int(11) DEFAULT NULL,
  `beds` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `houses`
--

INSERT INTO `houses` (`id`, `house_id`, `world_id`, `owner`, `paid`, `warnings`, `name`, `rent`, `town_id`, `bid`, `bid_end`, `last_bid`, `highest_bidder`, `size`, `guildid`, `beds`) VALUES
(1, 0, 0, 0, 0, 0, 'Thunder City #1', 0, 1, 0, 0, 0, 0, 42, NULL, 2),
(2, 0, 0, 0, 0, 0, 'Thunder City #2', 0, 1, 0, 0, 0, 0, 49, NULL, 2),
(3, 0, 0, 0, 0, 0, 'Thunder City #3', 0, 1, 0, 0, 0, 0, 48, NULL, 2),
(4, 0, 0, 0, 0, 0, 'Thunder City #4', 0, 1, 0, 0, 0, 0, 49, NULL, 2),
(5, 0, 0, 0, 0, 0, 'Thunder City #5', 0, 1, 0, 0, 0, 0, 56, NULL, 2),
(6, 0, 0, 0, 0, 0, 'Thunder City #6', 0, 1, 0, 0, 0, 0, 49, NULL, 2),
(7, 0, 0, 0, 0, 0, 'Thunder City #7', 0, 1, 0, 0, 0, 0, 20, NULL, 2),
(8, 0, 0, 0, 0, 0, 'Thunder City #9', 0, 1, 0, 0, 0, 0, 42, NULL, 2),
(9, 0, 0, 0, 0, 0, 'Thunder City #10', 0, 1, 0, 0, 0, 0, 63, NULL, 2),
(10, 0, 0, 0, 0, 0, 'Thunder City #11', 0, 1, 0, 0, 0, 0, 40, NULL, 2),
(11, 0, 0, 0, 0, 0, 'Thunder City #12', 0, 1, 0, 0, 0, 0, 42, NULL, 2),
(12, 0, 0, 0, 0, 0, 'Thunder City #13', 0, 1, 0, 0, 0, 0, 49, NULL, 2),
(13, 0, 0, 0, 0, 0, 'Thunder City #14', 0, 1, 0, 0, 0, 0, 49, NULL, 2),
(14, 0, 0, 0, 0, 0, 'Thunder City #15', 0, 1, 0, 0, 0, 0, 36, NULL, 2),
(15, 0, 0, 0, 0, 0, 'Thunder City #16', 0, 1, 0, 0, 0, 0, 30, NULL, 2),
(16, 0, 0, 0, 0, 0, 'Thunder City #17', 0, 1, 0, 0, 0, 0, 49, NULL, 2),
(17, 0, 0, 0, 0, 0, 'Thunder City #18', 0, 1, 0, 0, 0, 0, 42, NULL, 2),
(18, 0, 0, 0, 0, 0, 'Thunder City #19', 0, 1, 0, 0, 0, 0, 42, NULL, 2),
(19, 0, 0, 0, 0, 0, 'Thunder City #20', 0, 1, 0, 0, 0, 0, 36, NULL, 2),
(20, 0, 0, 0, 0, 0, 'Thunder City #21', 0, 1, 0, 0, 0, 0, 48, NULL, 2),
(21, 0, 0, 0, 0, 0, 'Thunder City #22', 0, 1, 0, 0, 0, 0, 60, NULL, 2),
(22, 0, 0, 0, 0, 0, 'Thunder City #23', 0, 1, 0, 0, 0, 0, 30, NULL, 2),
(23, 0, 0, 0, 0, 0, 'Thunder City #24', 0, 1, 0, 0, 0, 0, 36, NULL, 2),
(24, 0, 0, 0, 0, 0, 'Thunder City #25', 0, 1, 0, 0, 0, 0, 549, NULL, 12),
(25, 0, 0, 0, 0, 0, 'Thunder City #26', 0, 1, 0, 0, 0, 0, 56, NULL, 2),
(26, 0, 0, 0, 0, 0, 'Thunder City #27', 0, 1, 0, 0, 0, 0, 63, NULL, 4),
(27, 0, 0, 0, 0, 0, 'Thunder City #28', 0, 1, 0, 0, 0, 0, 49, NULL, 2),
(28, 0, 0, 0, 0, 0, 'Thunder City #29', 0, 1, 0, 0, 0, 0, 70, NULL, 4),
(29, 0, 0, 0, 0, 0, 'Thunder City #30', 0, 1, 0, 0, 0, 0, 72, NULL, 4),
(30, 0, 0, 0, 0, 0, 'Thunder City #31', 0, 1, 0, 0, 0, 0, 35, NULL, 2),
(31, 0, 0, 0, 0, 0, 'Thunder City #32', 0, 1, 0, 0, 0, 0, 35, NULL, 2),
(32, 0, 0, 0, 0, 0, 'Thunder City #33', 0, 1, 0, 0, 0, 0, 35, NULL, 2),
(33, 0, 0, 0, 1644432459, 0, 'Thunder City #34', 0, 1, 0, 0, 0, 0, 56, NULL, 4),
(34, 0, 0, 0, 1644432459, 0, 'Thunder City #35', 0, 1, 0, 0, 0, 0, 216, NULL, 8),
(35, 0, 0, 0, 1644432459, 0, 'Thunder City #36', 0, 1, 0, 0, 0, 0, 50, NULL, 2),
(36, 0, 0, 0, 1644432459, 0, 'Thunder City #37', 0, 1, 0, 0, 0, 0, 50, NULL, 2),
(37, 0, 0, 0, 1644432459, 0, 'Thunder City #38', 0, 1, 0, 0, 0, 0, 50, NULL, 2),
(38, 0, 0, 0, 1644432459, 0, 'Thunder City #39', 0, 1, 0, 0, 0, 0, 81, NULL, 4),
(39, 0, 0, 0, 1644432459, 0, 'Thunder City #40', 0, 1, 0, 0, 0, 0, 48, NULL, 2),
(40, 0, 0, 0, 1644432459, 0, 'Thunder City #41', 0, 1, 0, 0, 0, 0, 63, NULL, 2),
(41, 0, 0, 0, 1644432459, 0, 'Thunder City #42', 0, 1, 0, 0, 0, 0, 54, NULL, 2),
(42, 0, 0, 0, 1644432459, 0, 'Thunder City #43', 0, 1, 0, 0, 0, 0, 48, NULL, 2),
(43, 0, 0, 0, 1644432459, 0, 'Thunder City #44', 0, 1, 0, 0, 0, 0, 48, NULL, 2),
(44, 0, 0, 0, 1644432459, 0, 'Thunder City #45', 0, 1, 0, 0, 0, 0, 48, NULL, 2),
(45, 0, 0, 0, 1644432459, 0, 'Thunder City #46', 0, 1, 0, 0, 0, 0, 48, NULL, 2),
(46, 0, 0, 0, 1644432459, 0, 'Thunder City #47', 0, 1, 0, 0, 0, 0, 48, NULL, 2),
(47, 0, 0, 0, 1644432459, 0, 'Thunder City #48', 0, 1, 0, 0, 0, 0, 56, NULL, 2),
(48, 0, 0, 0, 1644432459, 0, 'Thunder City #49', 0, 1, 0, 0, 0, 0, 36, NULL, 2),
(49, 0, 0, 0, 1644432459, 0, 'Thunder City #50', 0, 1, 0, 0, 0, 0, 31, NULL, 2),
(50, 0, 0, 0, 1644432459, 0, 'Thunder City #51', 0, 1, 0, 0, 0, 0, 49, NULL, 2),
(51, 0, 0, 0, 1644432459, 0, 'Thunder City #52', 0, 1, 0, 0, 0, 0, 105, NULL, 2),
(52, 0, 0, 0, 1644432459, 0, 'Thunder City #53', 0, 1, 0, 0, 0, 0, 98, NULL, 2),
(53, 0, 0, 0, 1644432459, 0, 'Thunder City #54', 0, 1, 0, 0, 0, 0, 42, NULL, 2),
(54, 0, 0, 0, 1644432459, 0, 'Thunder City #55', 0, 1, 0, 0, 0, 0, 49, NULL, 2),
(55, 0, 0, 0, 1644432459, 0, 'Thunder City #56', 0, 1, 0, 0, 0, 0, 45, NULL, 2),
(56, 0, 0, 0, 1644432459, 0, 'Thunder City #57', 0, 1, 0, 0, 0, 0, 45, NULL, 2),
(57, 0, 0, 0, 1644432459, 0, 'Thunder City #58', 0, 1, 0, 0, 0, 0, 35, NULL, 2),
(58, 0, 0, 0, 1644432459, 0, 'Thunder City #59', 0, 1, 0, 0, 0, 0, 28, NULL, 2),
(59, 0, 0, 0, 1644432459, 0, 'Thunder City #60', 0, 1, 0, 0, 0, 0, 56, NULL, 2),
(60, 0, 0, 0, 1644432459, 0, 'Thunder City #61', 0, 1, 0, 0, 0, 0, 47, NULL, 2),
(61, 0, 0, 0, 1644432459, 0, 'Thunder City #62', 0, 1, 0, 0, 0, 0, 56, NULL, 2),
(62, 0, 0, 0, 1644432459, 0, 'Thunder City #63', 0, 1, 0, 0, 0, 0, 50, NULL, 2),
(63, 0, 0, 0, 1644432459, 0, 'Thunder City #64', 0, 1, 0, 0, 0, 0, 56, NULL, 4),
(64, 0, 0, 0, 1644432459, 0, 'Thunder City #65', 0, 1, 0, 0, 0, 0, 46, NULL, 2),
(65, 0, 0, 0, 1644432459, 0, 'Thunder City #66', 0, 1, 0, 0, 0, 0, 25, NULL, 2),
(66, 0, 0, 0, 1644432459, 0, 'Thunder City #67', 0, 1, 0, 0, 0, 0, 48, NULL, 2),
(67, 0, 0, 0, 1644432459, 0, 'Thunder City #68', 0, 1, 0, 0, 0, 0, 63, NULL, 2),
(68, 0, 0, 0, 1644432459, 0, 'Thunder City #69', 0, 1, 0, 0, 0, 0, 77, NULL, 2),
(69, 0, 0, 0, 1644432459, 0, 'Thunder City #70', 0, 1, 0, 0, 0, 0, 66, NULL, 2),
(70, 0, 0, 0, 0, 0, 'Thunder City #71', 0, 1, 0, 0, 0, 0, 48, NULL, 2),
(71, 0, 0, 0, 1644432459, 0, 'Thunder City #72', 0, 1, 0, 0, 0, 0, 42, NULL, 2),
(72, 0, 0, 0, 1644432459, 0, 'Thunder City #73', 0, 1, 0, 0, 0, 0, 30, NULL, 2),
(73, 0, 0, 0, 1644432459, 0, 'Thunder City #74', 0, 1, 0, 0, 0, 0, 48, NULL, 2),
(74, 0, 0, 0, 1644432459, 0, 'Thunder City #75', 0, 1, 0, 0, 0, 0, 42, NULL, 2),
(75, 0, 0, 0, 1644432459, 0, 'Thunder City #76', 0, 1, 0, 0, 0, 0, 15, NULL, 2),
(76, 0, 0, 0, 1644432459, 0, 'Thunder City #77', 0, 1, 0, 0, 0, 0, 20, NULL, 2),
(77, 0, 0, 0, 1644432459, 0, 'Thunder City #78', 0, 1, 0, 0, 0, 0, 15, NULL, 2),
(78, 0, 0, 0, 1644432459, 0, 'Thunder City #79', 0, 1, 0, 0, 0, 0, 20, NULL, 2),
(79, 0, 0, 0, 1644432459, 0, 'Thunder City #80', 0, 1, 0, 0, 0, 0, 15, NULL, 2),
(80, 0, 0, 0, 1644432459, 0, 'Thunder City #81', 0, 1, 0, 0, 0, 0, 15, NULL, 2),
(81, 0, 0, 0, 1644432459, 0, 'Thunder City #82', 0, 1, 0, 0, 0, 0, 20, NULL, 2),
(82, 0, 0, 0, 1644432459, 0, 'Thunder City #83', 0, 1, 0, 0, 0, 0, 20, NULL, 2),
(83, 0, 0, 0, 1644432459, 0, 'Thunder City #84', 0, 1, 0, 0, 0, 0, 127, NULL, 2),
(84, 0, 0, 0, 1644432459, 0, 'Thunder City #85', 0, 1, 0, 0, 0, 0, 35, NULL, 2),
(85, 0, 0, 0, 1644432459, 0, 'Thunder City #86', 0, 1, 0, 0, 0, 0, 35, NULL, 2),
(86, 0, 0, 0, 1644432459, 0, 'Thunder City #87', 0, 1, 0, 0, 0, 0, 33, NULL, 2),
(87, 0, 0, 0, 1644432459, 0, 'Thunder City #88', 0, 1, 0, 0, 0, 0, 51, NULL, 2),
(88, 0, 0, 0, 1644432459, 0, 'Thunder City #89', 0, 1, 0, 0, 0, 0, 56, NULL, 2),
(89, 0, 0, 0, 1644432459, 0, 'Thunder City #90', 0, 1, 0, 0, 0, 0, 64, NULL, 4),
(90, 0, 0, 0, 1644432459, 0, 'Thunder City #91', 0, 1, 0, 0, 0, 0, 42, NULL, 2),
(91, 0, 0, 0, 1644432459, 0, 'Thunder City #92', 0, 1, 0, 0, 0, 0, 24, NULL, 2),
(92, 0, 0, 0, 1644432459, 0, 'Thunder City #93', 0, 1, 0, 0, 0, 0, 25, NULL, 2),
(93, 0, 0, 0, 1644432459, 0, 'Thunder City #94', 0, 1, 0, 0, 0, 0, 25, NULL, 2),
(94, 0, 0, 0, 1644432459, 0, 'Thunder City #95', 0, 1, 0, 0, 0, 0, 51, NULL, 2),
(95, 0, 0, 0, 1644432459, 0, 'Thunder City #96', 0, 1, 0, 0, 0, 0, 44, NULL, 2),
(96, 0, 0, 0, 1644432459, 0, 'Thunder City #97', 0, 1, 0, 0, 0, 0, 21, NULL, 2),
(97, 0, 0, 0, 1644432459, 0, 'Jamila Island #1', 0, 2, 0, 0, 0, 0, 64, NULL, 4),
(98, 0, 0, 0, 1644432459, 0, 'Jamila Island #2', 0, 2, 0, 0, 0, 0, 84, NULL, 4),
(99, 0, 0, 0, 1644432459, 0, 'Jamila Island #3', 0, 2, 0, 0, 0, 0, 55, NULL, 4),
(100, 0, 0, 0, 1644432459, 0, 'Jamila Island #4', 0, 2, 0, 0, 0, 0, 106, NULL, 4),
(101, 0, 0, 0, 1644432459, 0, 'Jamila Island #5', 0, 2, 0, 0, 0, 0, 49, NULL, 4),
(102, 0, 0, 0, 1644432459, 0, 'Jamila Island #6', 0, 2, 0, 0, 0, 0, 40, NULL, 2),
(103, 0, 0, 0, 1644432459, 0, 'Jamila Island #7', 0, 2, 0, 0, 0, 0, 35, NULL, 4),
(104, 0, 0, 0, 1644432459, 0, 'Jamila Island #8', 0, 2, 0, 0, 0, 0, 42, NULL, 2),
(105, 0, 0, 0, 1644432459, 0, 'Jamila Island #9', 0, 2, 0, 0, 0, 0, 42, NULL, 2),
(106, 0, 0, 0, 1644432459, 0, 'Jamila Island #10', 0, 2, 0, 0, 0, 0, 42, NULL, 2),
(107, 0, 0, 0, 1644432459, 0, 'Jamila Island #11', 0, 2, 0, 0, 0, 0, 74, NULL, 4),
(108, 0, 0, 0, 1644432459, 0, 'Jamila Island #12', 0, 2, 0, 0, 0, 0, 60, NULL, 0),
(109, 0, 0, 0, 1644432459, 0, 'Jamila Island #13', 0, 2, 0, 0, 0, 0, 42, NULL, 2),
(110, 0, 0, 0, 1644432459, 0, 'Jamila Island #14', 0, 2, 0, 0, 0, 0, 90, NULL, 2),
(111, 0, 0, 0, 1644432459, 0, 'Jamila Island #15', 0, 2, 0, 0, 0, 0, 20, NULL, 2),
(112, 0, 0, 0, 1644432459, 0, 'Jamila Island #16', 0, 2, 0, 0, 0, 0, 20, NULL, 2),
(113, 0, 0, 0, 1644432459, 0, 'Jamila Island #17', 0, 2, 0, 0, 0, 0, 23, NULL, 2),
(114, 0, 0, 0, 1644432459, 0, 'Jamila Island #18', 0, 2, 0, 0, 0, 0, 23, NULL, 2),
(115, 0, 0, 0, 1644432459, 0, 'Jamila Island #19', 0, 2, 0, 0, 0, 0, 20, NULL, 2),
(116, 0, 0, 0, 1644432459, 0, 'Jamila Island #20', 0, 2, 0, 0, 0, 0, 20, NULL, 2),
(117, 0, 0, 0, 1644432459, 0, 'Jamila Island #21', 0, 2, 0, 0, 0, 0, 16, NULL, 2),
(118, 0, 0, 0, 1644432459, 0, 'Jamila Island #22', 0, 2, 0, 0, 0, 0, 16, NULL, 2),
(119, 0, 0, 0, 1644432459, 0, 'Bhark #1', 0, 5, 0, 0, 0, 0, 24, NULL, 0),
(120, 0, 0, 0, 1644432459, 0, 'Bhark #2', 0, 5, 0, 0, 0, 0, 20, NULL, 0),
(121, 0, 0, 0, 1644432459, 0, 'Bhark #3', 0, 5, 0, 0, 0, 0, 13, NULL, 0),
(122, 0, 0, 0, 1644432459, 0, 'Bhark #4', 0, 5, 0, 0, 0, 0, 10, NULL, 0),
(123, 0, 0, 0, 1644432459, 0, 'Bhark #5', 0, 5, 0, 0, 0, 0, 40, NULL, 2),
(124, 0, 0, 0, 1644432459, 0, 'Bhark #6', 0, 5, 0, 0, 0, 0, 28, NULL, 2),
(125, 0, 0, 0, 1644432459, 0, 'Bhark #7', 0, 5, 0, 0, 0, 0, 64, NULL, 4),
(126, 0, 0, 0, 1644432459, 0, 'Bhark #8', 0, 5, 0, 0, 0, 0, 16, NULL, 2),
(127, 0, 0, 0, 1644432459, 0, 'Bhark #9', 0, 5, 0, 0, 0, 0, 35, NULL, 2),
(128, 0, 0, 0, 1644432459, 0, 'Bhark #10', 0, 5, 0, 0, 0, 0, 28, NULL, 2),
(129, 0, 0, 0, 1644432459, 0, 'Bhark #11', 0, 5, 0, 0, 0, 0, 48, NULL, 4),
(130, 0, 0, 0, 1644432459, 0, 'Bhark #12', 0, 5, 0, 0, 0, 0, 20, NULL, 2),
(131, 0, 0, 0, 1644432459, 0, 'Bhark #13', 0, 5, 0, 0, 0, 0, 40, NULL, 4),
(132, 0, 0, 0, 1644432459, 0, 'Bhark #14', 0, 5, 0, 0, 0, 0, 20, NULL, 2),
(133, 0, 0, 0, 1644432459, 0, 'Bhark #15', 0, 5, 0, 0, 0, 0, 24, NULL, 2),
(134, 0, 0, 0, 1644432459, 0, 'Bhark #16', 0, 5, 0, 0, 0, 0, 24, NULL, 2),
(135, 0, 0, 0, 1644432459, 0, 'Bhark #17', 0, 5, 0, 0, 0, 0, 58, NULL, 2),
(136, 0, 0, 0, 1644432459, 0, 'Bhark #18', 0, 5, 0, 0, 0, 0, 34, NULL, 2),
(137, 0, 0, 0, 1644432459, 0, 'Bhark #19', 0, 5, 0, 0, 0, 0, 44, NULL, 2),
(138, 0, 0, 0, 1644432459, 0, 'Bhark #20', 0, 5, 0, 0, 0, 0, 26, NULL, 2),
(139, 0, 0, 0, 1644432459, 0, 'Bhark #21', 0, 5, 0, 0, 0, 0, 35, NULL, 2),
(140, 0, 0, 0, 1644432459, 0, 'Bhark #22', 0, 5, 0, 0, 0, 0, 20, NULL, 2),
(141, 0, 0, 0, 1644432459, 0, 'Bhark #23', 0, 5, 0, 0, 0, 0, 16, NULL, 2),
(142, 0, 0, 0, 1644432459, 0, 'Bhark #24', 0, 5, 0, 0, 0, 0, 32, NULL, 4),
(143, 0, 0, 0, 1644432459, 0, 'Bhark #25', 0, 5, 0, 0, 0, 0, 24, NULL, 2),
(144, 0, 0, 0, 1644432459, 0, 'Bhark #26', 0, 5, 0, 0, 0, 0, 21, NULL, 2),
(145, 0, 0, 0, 1644432459, 0, 'Bhark #27', 0, 5, 0, 0, 0, 0, 20, NULL, 2),
(146, 0, 0, 0, 1644432459, 0, 'Bhark #28', 0, 5, 0, 0, 0, 0, 20, NULL, 2),
(147, 0, 0, 0, 1644432459, 0, 'Bhark #29', 0, 5, 0, 0, 0, 0, 42, NULL, 2),
(148, 0, 0, 0, 1644432459, 0, 'Bhark #30', 0, 5, 0, 0, 0, 0, 56, NULL, 4),
(149, 0, 0, 0, 1644432459, 0, 'Bhark #31', 0, 5, 0, 0, 0, 0, 20, NULL, 2),
(150, 0, 0, 0, 1644432459, 0, 'Bhark #32', 0, 5, 0, 0, 0, 0, 20, NULL, 2),
(151, 0, 0, 0, 1644432459, 0, 'Bhark #33', 0, 5, 0, 0, 0, 0, 16, NULL, 2),
(152, 0, 0, 0, 1644432459, 0, 'Bhark #34', 0, 5, 0, 0, 0, 0, 20, NULL, 2),
(153, 0, 0, 0, 1644432459, 0, 'Bhark #35', 0, 5, 0, 0, 0, 0, 25, NULL, 2),
(154, 0, 0, 0, 1644432459, 0, 'Bhark #36', 0, 5, 0, 0, 0, 0, 25, NULL, 2),
(155, 0, 0, 0, 1644432459, 0, 'Bhark #37', 0, 5, 0, 0, 0, 0, 25, NULL, 2),
(156, 0, 0, 0, 1644432459, 0, 'Bhark #38', 0, 5, 0, 0, 0, 0, 20, NULL, 2),
(157, 0, 0, 0, 1644432459, 0, 'Bhark #39', 0, 5, 0, 0, 0, 0, 27, NULL, 2),
(158, 0, 0, 0, 1644432459, 0, 'Bhark #40', 0, 5, 0, 0, 0, 0, 49, NULL, 2),
(159, 0, 0, 0, 1644432459, 0, 'Bhark #41', 0, 5, 0, 0, 0, 0, 30, NULL, 2),
(160, 0, 0, 0, 1644432459, 0, 'Bhark #42', 0, 5, 0, 0, 0, 0, 30, NULL, 2),
(161, 0, 0, 0, 1644432459, 0, 'Bhark #43', 0, 5, 0, 0, 0, 0, 11, NULL, 0),
(162, 0, 0, 0, 1644432459, 0, 'Bhark #44', 0, 5, 0, 0, 0, 0, 11, NULL, 0),
(163, 0, 0, 0, 1644432459, 0, 'Thunder City #8', 0, 1, 0, 0, 0, 0, 35, NULL, 2),
(164, 0, 0, 0, 1644432459, 0, 'Akravi #1', 0, 3, 0, 0, 0, 0, 56, NULL, 2),
(165, 0, 0, 0, 1644432459, 0, 'Akravi #2', 0, 3, 0, 0, 0, 0, 49, NULL, 6),
(166, 0, 0, 0, 1644432459, 0, 'Akravi #3', 0, 3, 0, 0, 0, 0, 56, NULL, 4),
(167, 0, 0, 0, 1644432459, 0, 'Akravi #4', 0, 3, 0, 0, 0, 0, 56, NULL, 4),
(168, 0, 0, 0, 1644432459, 0, 'Akravi #5', 0, 3, 0, 0, 0, 0, 49, NULL, 4),
(169, 0, 0, 0, 0, 0, 'Akravi #6', 0, 3, 0, 0, 0, 0, 30, NULL, 2),
(170, 0, 0, 0, 0, 0, 'Akravi #7', 0, 3, 0, 0, 0, 0, 30, NULL, 2),
(171, 0, 0, 0, 0, 0, 'Akravi #8', 0, 3, 0, 0, 0, 0, 50, NULL, 4),
(172, 0, 0, 0, 0, 0, 'Akravi #9', 0, 3, 0, 0, 0, 0, 25, NULL, 2),
(173, 0, 0, 0, 1644432459, 0, 'Akravi #10', 0, 3, 0, 0, 0, 0, 25, NULL, 2),
(174, 0, 0, 0, 1644432459, 0, 'Akravi #11', 0, 3, 0, 0, 0, 0, 25, NULL, 2),
(175, 0, 0, 0, 1644432459, 0, 'Akravi #12', 0, 3, 0, 0, 0, 0, 50, NULL, 4),
(176, 0, 0, 0, 0, 0, 'Akravi #13', 0, 3, 0, 0, 0, 0, 30, NULL, 2),
(177, 0, 0, 0, 0, 0, 'Akravi #14', 0, 3, 0, 0, 0, 0, 25, NULL, 2),
(178, 0, 0, 0, 0, 0, 'Akravi #15', 0, 3, 0, 0, 0, 0, 25, NULL, 2),
(179, 0, 0, 0, 0, 0, 'Akravi #16', 0, 3, 0, 0, 0, 0, 49, NULL, 4),
(180, 0, 0, 0, 0, 0, 'Akravi #17', 0, 3, 0, 0, 0, 0, 12, NULL, 2),
(181, 0, 0, 0, 0, 0, 'Akravi #18', 0, 3, 0, 0, 0, 0, 72, NULL, 6),
(182, 0, 0, 0, 0, 0, 'Akravi #19', 0, 3, 0, 0, 0, 0, 41, NULL, 4),
(183, 0, 0, 0, 0, 0, 'Akravi #20', 0, 3, 0, 0, 0, 0, 42, NULL, 4),
(184, 0, 0, 0, 0, 0, 'Akravi #21', 0, 3, 0, 0, 0, 0, 12, NULL, 2),
(185, 0, 0, 0, 0, 0, 'Akravi #22', 0, 3, 0, 0, 0, 0, 9, NULL, 2),
(186, 0, 0, 0, 0, 0, 'Akravi #23', 0, 3, 0, 0, 0, 0, 20, NULL, 2),
(187, 0, 0, 0, 0, 0, 'Akravi #24', 0, 3, 0, 0, 0, 0, 16, NULL, 2),
(188, 0, 0, 0, 0, 0, 'Akravi #25', 0, 3, 0, 0, 0, 0, 20, NULL, 2),
(189, 0, 0, 0, 0, 0, 'Akravi #26', 0, 3, 0, 0, 0, 0, 25, NULL, 2),
(190, 0, 0, 0, 0, 0, 'Akravi #27', 0, 3, 0, 0, 0, 0, 25, NULL, 2),
(191, 0, 0, 0, 0, 0, 'Akravi #28', 0, 3, 0, 0, 0, 0, 30, NULL, 2),
(192, 0, 0, 0, 0, 0, 'Akravi #29', 0, 3, 0, 0, 0, 0, 25, NULL, 2),
(193, 0, 0, 0, 0, 0, 'Akravi #30', 0, 3, 0, 0, 0, 0, 42, NULL, 4),
(194, 0, 0, 0, 0, 0, 'Akravi #31', 0, 3, 0, 0, 0, 0, 12, NULL, 2),
(195, 0, 0, 0, 0, 0, 'Akravi #32', 0, 3, 0, 0, 0, 0, 21, NULL, 2),
(196, 0, 0, 0, 0, 0, 'Akravi #33', 0, 3, 0, 0, 0, 0, 21, NULL, 2),
(197, 0, 0, 0, 0, 0, 'Akravi #34', 0, 3, 0, 0, 0, 0, 21, NULL, 2),
(198, 0, 0, 0, 0, 0, 'Akravi #35', 0, 3, 0, 0, 0, 0, 21, NULL, 2),
(199, 0, 0, 0, 0, 0, 'Wintermere #1', 0, 6, 0, 0, 0, 0, 111, NULL, 4),
(200, 0, 0, 0, 0, 0, 'Wintermere #2', 0, 6, 0, 0, 0, 0, 54, NULL, 4),
(201, 0, 0, 0, 0, 0, 'Wintermere #3', 0, 6, 0, 0, 0, 0, 24, NULL, 2),
(202, 0, 0, 0, 0, 0, 'Wintermere #4', 0, 6, 0, 0, 0, 0, 94, NULL, 0),
(203, 0, 0, 0, 0, 0, 'Wintermere #5', 0, 6, 0, 0, 0, 0, 152, NULL, 4),
(204, 0, 0, 0, 0, 0, 'Wintermere #6', 0, 6, 0, 0, 0, 0, 131, NULL, 6),
(205, 0, 0, 0, 0, 0, 'Wintermere #7', 0, 6, 0, 0, 0, 0, 65, NULL, 4),
(206, 0, 0, 0, 0, 0, 'Wintermere #8', 0, 6, 0, 0, 0, 0, 48, NULL, 0),
(207, 0, 0, 0, 0, 0, 'Wintermere #9', 0, 6, 0, 0, 0, 0, 45, NULL, 0),
(208, 0, 0, 0, 0, 0, 'Wintermere #10', 0, 6, 0, 0, 0, 0, 73, NULL, 2),
(209, 0, 0, 0, 0, 0, 'Wintermere #11', 0, 6, 0, 0, 0, 0, 76, NULL, 0),
(210, 0, 0, 0, 0, 0, 'Wintermere #12', 0, 6, 0, 0, 0, 0, 147, NULL, 0),
(211, 0, 0, 0, 0, 0, 'Wintermere #13', 0, 6, 0, 0, 0, 0, 65, NULL, 0),
(212, 0, 0, 0, 0, 0, 'Wintermere #14', 0, 6, 0, 0, 0, 0, 38, NULL, 0),
(213, 0, 0, 0, 0, 0, 'Wintermere #15', 0, 6, 0, 0, 0, 0, 108, NULL, 0),
(214, 0, 0, 0, 0, 0, 'Wintermere #16', 0, 6, 0, 0, 0, 0, 86, NULL, 0),
(215, 0, 0, 0, 0, 0, 'Wintermere #17', 0, 6, 0, 0, 0, 0, 129, NULL, 6),
(216, 0, 0, 0, 0, 0, 'Wintermere #18', 0, 6, 0, 0, 0, 0, 84, NULL, 0),
(217, 0, 0, 0, 0, 0, 'Wintermere #19', 0, 6, 0, 0, 0, 0, 97, NULL, 0),
(218, 0, 0, 0, 0, 0, 'Wintermere #20', 0, 6, 0, 0, 0, 0, 42, NULL, 0),
(219, 0, 0, 0, 0, 0, 'Wintermere #21', 0, 6, 0, 0, 0, 0, 48, NULL, 0),
(220, 0, 0, 0, 0, 0, 'Wintermere #22', 0, 6, 0, 0, 0, 0, 93, NULL, 2),
(221, 0, 0, 0, 0, 0, 'Wintermere #23', 0, 6, 0, 0, 0, 0, 69, NULL, 2),
(222, 0, 0, 0, 0, 0, 'Wintermere #24', 0, 6, 0, 0, 0, 0, 60, NULL, 0),
(223, 0, 0, 0, 0, 0, 'Wintermere #25', 0, 6, 0, 0, 0, 0, 83, NULL, 0),
(224, 0, 0, 0, 0, 0, 'Al Arar #1', 0, 4, 0, 0, 0, 0, 48, NULL, 0),
(225, 0, 0, 0, 0, 0, 'Al Arar #2', 0, 4, 0, 0, 0, 0, 87, NULL, 0),
(226, 0, 0, 0, 0, 0, 'Al Arar #3', 0, 4, 0, 0, 0, 0, 21, NULL, 0),
(227, 0, 0, 0, 0, 0, 'Al Arar #4', 0, 4, 0, 0, 0, 0, 70, NULL, 0),
(228, 0, 0, 0, 0, 0, 'Al Arar #5', 0, 4, 0, 0, 0, 0, 27, NULL, 0),
(229, 0, 0, 0, 0, 0, 'Al Arar #6', 0, 4, 0, 0, 0, 0, 24, NULL, 0),
(230, 0, 0, 0, 0, 0, 'Al Arar #7', 0, 4, 0, 0, 0, 0, 114, NULL, 0),
(231, 0, 0, 0, 0, 0, 'Al Arar #8', 0, 4, 0, 0, 0, 0, 79, NULL, 0),
(232, 0, 0, 0, 0, 0, 'Al Arar #9', 0, 4, 0, 0, 0, 0, 50, NULL, 0),
(233, 0, 0, 0, 0, 0, 'Al Arar #10', 0, 4, 0, 0, 0, 0, 52, NULL, 0),
(234, 0, 0, 0, 0, 0, 'Al Arar #11', 0, 4, 0, 0, 0, 0, 23, NULL, 2),
(235, 0, 0, 0, 0, 0, 'Al Arar #12', 0, 4, 0, 0, 0, 0, 235, NULL, 0),
(236, 0, 0, 0, 0, 0, 'Al Arar #13', 0, 4, 0, 0, 0, 0, 20, NULL, 0),
(237, 0, 0, 0, 0, 0, 'Shadow Wood #1', 0, 7, 0, 0, 0, 0, 20, NULL, 0),
(238, 0, 0, 0, 0, 0, 'Shadow Wood #2', 0, 7, 0, 0, 0, 0, 20, NULL, 0),
(239, 0, 0, 0, 0, 0, 'Shadow Wood #3', 0, 7, 0, 0, 0, 0, 24, NULL, 0),
(240, 0, 0, 0, 0, 0, 'Shadow Wood #4', 0, 7, 0, 0, 0, 0, 20, NULL, 0),
(241, 0, 0, 0, 0, 0, 'Shadow Wood #5', 0, 7, 0, 0, 0, 0, 30, NULL, 0),
(242, 0, 0, 0, 0, 0, 'Shadow Wood #6', 0, 7, 0, 0, 0, 0, 16, NULL, 0),
(243, 0, 0, 0, 0, 0, 'Shadow Wood #7', 0, 7, 0, 0, 0, 0, 16, NULL, 0),
(244, 0, 0, 0, 0, 0, 'Shadow Wood #8', 0, 7, 0, 0, 0, 0, 16, NULL, 0),
(245, 0, 0, 0, 0, 0, 'Shadow Wood #9', 0, 7, 0, 0, 0, 0, 20, NULL, 0),
(246, 0, 0, 0, 0, 0, 'Shadow Wood #10', 0, 7, 0, 0, 0, 0, 63, NULL, 0),
(247, 0, 0, 0, 0, 0, 'Shadow Wood #11', 0, 7, 0, 0, 0, 0, 16, NULL, 0),
(248, 0, 0, 0, 0, 0, 'Shadow Wood #12', 0, 7, 0, 0, 0, 0, 12, NULL, 0),
(249, 0, 0, 0, 0, 0, 'Shadow Wood #13', 0, 7, 0, 0, 0, 0, 88, NULL, 0),
(250, 0, 0, 0, 0, 0, 'Fork Village #1', 0, 1, 0, 0, 0, 0, 30, NULL, 2),
(251, 0, 0, 0, 0, 0, 'Fork Village #2', 0, 1, 0, 0, 0, 0, 49, NULL, 4),
(252, 0, 0, 0, 0, 0, 'Fork Village #3', 0, 1, 0, 0, 0, 0, 33, NULL, 2),
(253, 0, 0, 0, 0, 0, 'Fork Village #4', 0, 1, 0, 0, 0, 0, 39, NULL, 2),
(254, 0, 0, 0, 0, 0, 'Fork Village #5', 0, 1, 0, 0, 0, 0, 65, NULL, 2),
(255, 0, 0, 0, 0, 0, 'Fork Village #6', 0, 1, 0, 0, 0, 0, 45, NULL, 4),
(256, 0, 0, 0, 0, 0, 'Fork Village #7', 0, 1, 0, 0, 0, 0, 37, NULL, 2),
(257, 0, 0, 0, 0, 0, 'Fork Village #8', 0, 1, 0, 0, 0, 0, 31, NULL, 2),
(258, 0, 0, 0, 0, 0, 'Fork Village #9', 0, 1, 0, 0, 0, 0, 28, NULL, 2),
(259, 0, 0, 0, 0, 0, 'Fork Village #10', 0, 1, 0, 0, 0, 0, 62, NULL, 2),
(260, 0, 0, 0, 0, 0, 'Fork Village #11', 0, 1, 0, 0, 0, 0, 36, NULL, 2),
(261, 0, 0, 0, 0, 0, 'Fork Village #12', 0, 1, 0, 0, 0, 0, 24, NULL, 2),
(262, 0, 0, 0, 0, 0, 'Fork Village #13', 0, 1, 0, 0, 0, 0, 25, NULL, 2),
(263, 0, 0, 0, 0, 0, 'Thunder Hut #1', 0, 1, 0, 0, 0, 0, 30, NULL, 2),
(264, 0, 0, 0, 0, 0, 'Thunder Hut #2', 0, 1, 0, 0, 0, 0, 30, NULL, 2),
(265, 0, 0, 0, 0, 0, 'Thunder Hut #3', 0, 1, 0, 0, 0, 0, 30, NULL, 2),
(266, 0, 0, 0, 0, 0, 'Thunder Hut #4', 0, 1, 0, 0, 0, 0, 25, NULL, 2),
(267, 0, 0, 0, 0, 0, 'Thunder Hut #5', 0, 1, 0, 0, 0, 0, 25, NULL, 2),
(268, 0, 0, 0, 0, 0, 'Premia #1', 0, 8, 0, 0, 0, 0, 550, NULL, 8),
(269, 0, 0, 0, 0, 0, 'Premia #2', 0, 8, 0, 0, 0, 0, 565, NULL, 8),
(270, 0, 0, 0, 0, 0, 'Premia #3', 0, 8, 0, 0, 0, 0, 327, NULL, 6),
(271, 0, 0, 0, 0, 0, 'Premia #4', 0, 8, 0, 0, 0, 0, 364, NULL, 6),
(272, 0, 0, 0, 0, 0, 'Premia #5', 0, 8, 0, 0, 0, 0, 389, NULL, 6),
(273, 0, 0, 0, 0, 0, 'Premia #6', 0, 8, 0, 0, 0, 0, 509, NULL, 10),
(274, 0, 0, 0, 0, 0, 'Premia #7', 0, 8, 0, 0, 0, 0, 218, NULL, 2),
(275, 0, 0, 0, 0, 0, 'Premia #8', 0, 8, 0, 0, 0, 0, 218, NULL, 2),
(276, 0, 0, 0, 0, 0, 'Premia #9', 0, 8, 0, 0, 0, 0, 218, NULL, 2),
(277, 0, 0, 0, 0, 0, 'Premia #10', 0, 8, 0, 0, 0, 0, 677, NULL, 12),
(278, 0, 0, 0, 0, 0, 'Premia #11', 0, 8, 0, 0, 0, 0, 311, NULL, 4),
(279, 0, 0, 0, 0, 0, 'Premia #12', 0, 8, 0, 0, 0, 0, 407, NULL, 4),
(280, 0, 0, 0, 0, 0, 'Premia #13', 0, 8, 0, 0, 0, 0, 904, NULL, 14),
(281, 0, 0, 0, 0, 0, 'Premia #14', 0, 8, 0, 0, 0, 0, 218, NULL, 2),
(282, 0, 0, 0, 0, 0, 'Premia #15', 0, 8, 0, 0, 0, 0, 212, NULL, 2),
(283, 0, 0, 0, 0, 0, 'Premia #16', 0, 8, 0, 0, 0, 0, 221, NULL, 2),
(284, 0, 0, 0, 0, 0, 'Premia #17', 0, 8, 0, 0, 0, 0, 224, NULL, 2),
(285, 0, 0, 0, 0, 0, 'Premia #18', 0, 8, 0, 0, 0, 0, 231, NULL, 2),
(286, 0, 0, 0, 0, 0, 'Premia Subsolo #1', 0, 8, 0, 0, 0, 0, 49, NULL, 2),
(287, 0, 0, 0, 0, 0, 'Premia Subsolo #2', 0, 8, 0, 0, 0, 0, 64, NULL, 2),
(288, 0, 0, 0, 0, 0, 'Premia Subsolo #3', 0, 8, 0, 0, 0, 0, 49, NULL, 2),
(289, 0, 0, 0, 0, 0, 'Premia Subsolo #4', 0, 8, 0, 0, 0, 0, 64, NULL, 2),
(290, 0, 0, 0, 0, 0, 'Premia Subsolo #5', 0, 8, 0, 0, 0, 0, 128, NULL, 8),
(291, 0, 0, 0, 0, 0, 'Premia Subsolo #6', 0, 8, 0, 0, 0, 0, 70, NULL, 4),
(292, 0, 0, 0, 0, 0, 'Premia Subsolo #7', 0, 8, 0, 0, 0, 0, 70, NULL, 4),
(293, 0, 0, 0, 0, 0, 'Premia Subsolo #8', 0, 8, 0, 0, 0, 0, 187, NULL, 8),
(294, 0, 0, 0, 0, 0, 'Premia Subsolo #9', 0, 8, 0, 0, 0, 0, 75, NULL, 0),
(295, 0, 0, 0, 0, 0, 'Premia Subsolo #10', 0, 8, 0, 0, 0, 0, 116, NULL, 2),
(296, 0, 0, 0, 0, 0, 'Premia Subsolo #11', 0, 8, 0, 0, 0, 0, 99, NULL, 2),
(297, 0, 0, 0, 0, 0, 'Premia Subsolo #12', 0, 8, 0, 0, 0, 0, 233, NULL, 8),
(298, 0, 0, 0, 0, 0, 'Thunder Farm #1', 0, 1, 0, 0, 0, 0, 268, NULL, 8),
(299, 0, 0, 0, 0, 0, 'Thunder House #98', 0, 1, 0, 0, 0, 0, 51, NULL, 2),
(300, 0, 0, 0, 0, 0, 'Thunder House #99', 0, 1, 0, 0, 0, 0, 25, NULL, 2),
(465, 0, 0, 0, 1644432459, 0, 'Egeu 85', 0, 2, 0, 0, 0, 0, 23, NULL, 0),
(466, 0, 0, 0, 1644432459, 0, 'Egeu 86', 0, 2, 0, 0, 0, 0, 23, NULL, 0),
(467, 0, 0, 0, 1644432459, 0, 'Unnamed House #467', 0, 7, 0, 0, 0, 0, 108, NULL, 0),
(468, 0, 0, 0, 1644432459, 0, 'Unnamed House #468', 0, 7, 0, 0, 0, 0, 144, NULL, 0),
(469, 0, 0, 0, 1644432459, 0, 'Unnamed House #469', 0, 7, 0, 0, 0, 0, 66, NULL, 0),
(470, 0, 0, 0, 1644432459, 0, 'Unnamed House #470', 0, 7, 0, 0, 0, 0, 127, NULL, 0),
(472, 0, 0, 0, 1644432459, 0, 'Unnamed House #472', 0, 7, 0, 0, 0, 0, 97, NULL, 0),
(473, 0, 0, 0, 1644432459, 0, 'Unnamed House #473', 0, 7, 0, 0, 0, 0, 110, NULL, 0),
(474, 0, 0, 0, 1644432459, 0, 'Unnamed House #474', 0, 7, 0, 0, 0, 0, 122, NULL, 0),
(476, 0, 0, 0, 1644432459, 0, 'Unnamed House #476', 0, 7, 0, 0, 0, 0, 52, NULL, 0),
(477, 0, 0, 0, 1644432459, 0, 'Unnamed House #477', 0, 7, 0, 0, 0, 0, 176, NULL, 0),
(478, 0, 0, 0, 1644432459, 0, 'Unnamed House #478', 0, 7, 0, 0, 0, 0, 78, NULL, 0),
(479, 0, 0, 0, 1644432459, 0, 'Unnamed House #479', 0, 7, 0, 0, 0, 0, 126, NULL, 0),
(480, 0, 0, 0, 1644432459, 0, 'Unnamed House #480', 0, 7, 0, 0, 0, 0, 108, NULL, 0),
(481, 0, 0, 0, 1644432459, 0, 'Unnamed House #481', 0, 7, 0, 0, 0, 0, 39, NULL, 0),
(482, 0, 0, 0, 1644432459, 0, 'Unnamed House #482', 0, 7, 0, 0, 0, 0, 50, NULL, 0),
(483, 0, 0, 0, 1644432459, 0, 'Unnamed House #483', 0, 7, 0, 0, 0, 0, 42, NULL, 0),
(484, 0, 0, 0, 1644432459, 0, 'Unnamed House #484', 0, 7, 0, 0, 0, 0, 14, NULL, 0),
(485, 0, 0, 0, 1644432459, 0, 'Unnamed House #485', 0, 7, 0, 0, 0, 0, 72, NULL, 0),
(486, 0, 0, 0, 1644432459, 0, 'Unnamed House #486', 0, 7, 0, 0, 0, 0, 371, NULL, 0),
(487, 0, 0, 0, 1644432459, 0, 'Unnamed House #487', 0, 7, 0, 0, 0, 0, 169, NULL, 0),
(488, 0, 0, 0, 1644432459, 0, 'Unnamed House #488', 0, 7, 0, 0, 0, 0, 252, NULL, 0),
(489, 0, 0, 0, 1644432459, 0, 'Unnamed House #489', 0, 7, 0, 0, 0, 0, 138, NULL, 0),
(490, 0, 0, 0, 1644432459, 0, 'Unnamed House #490', 0, 7, 0, 0, 0, 0, 263, NULL, 0),
(491, 0, 0, 0, 1644432459, 0, 'Unnamed House #491', 0, 7, 0, 0, 0, 0, 127, NULL, 0),
(492, 0, 0, 0, 1644432459, 0, 'Unnamed House #492', 0, 7, 0, 0, 0, 0, 161, NULL, 0),
(493, 0, 0, 0, 1644432459, 0, 'Unnamed House #493', 0, 7, 0, 0, 0, 0, 388, NULL, 0),
(494, 0, 0, 0, 1644432459, 0, 'Unnamed House #494', 0, 7, 0, 0, 0, 0, 153, NULL, 0),
(495, 0, 0, 0, 1644432459, 0, 'Unnamed House #495', 0, 7, 0, 0, 0, 0, 72, NULL, 0),
(496, 0, 0, 0, 1644432459, 0, 'Unnamed House #496', 0, 7, 0, 0, 0, 0, 60, NULL, 0),
(497, 0, 0, 0, 1644432459, 0, 'Unnamed House #497', 0, 7, 0, 0, 0, 0, 42, NULL, 0),
(498, 0, 0, 0, 1644432459, 0, 'Unnamed House #498', 0, 7, 0, 0, 0, 0, 215, NULL, 0),
(499, 0, 0, 0, 1644432459, 0, 'Unnamed House #499', 0, 7, 0, 0, 0, 0, 62, NULL, 0),
(500, 0, 0, 0, 1644432459, 0, 'Unnamed House #500', 0, 7, 0, 0, 0, 0, 88, NULL, 0),
(501, 0, 0, 0, 1644432459, 0, 'Unnamed House #501', 0, 7, 0, 0, 0, 0, 45, NULL, 0),
(502, 0, 0, 0, 1644432459, 0, 'Unnamed House #502', 0, 7, 0, 0, 0, 0, 125, NULL, 0),
(503, 0, 0, 0, 1644432459, 0, 'Unnamed House #503', 0, 7, 0, 0, 0, 0, 14, NULL, 0),
(504, 0, 0, 0, 1644432459, 0, 'Unnamed House #504', 0, 7, 0, 0, 0, 0, 31, NULL, 0),
(505, 0, 0, 0, 1644432459, 0, 'Unnamed House #505', 0, 7, 0, 0, 0, 0, 57, NULL, 0),
(506, 0, 0, 0, 1644432459, 0, 'Unnamed House #506', 0, 7, 0, 0, 0, 0, 83, NULL, 0),
(507, 0, 0, 0, 1644432459, 0, 'Unnamed House #507', 0, 7, 0, 0, 0, 0, 49, NULL, 0),
(508, 0, 0, 0, 1644432459, 0, 'Unnamed House #508', 0, 7, 0, 0, 0, 0, 70, NULL, 0),
(509, 0, 0, 0, 1644432459, 0, 'Unnamed House #509', 0, 7, 0, 0, 0, 0, 41, NULL, 0),
(510, 0, 0, 0, 1644432459, 0, 'Unnamed House #510', 0, 5, 0, 0, 0, 0, 95, NULL, 0),
(511, 0, 0, 0, 1644432459, 0, 'Unnamed House #511', 0, 5, 0, 0, 0, 0, 55, NULL, 0),
(512, 0, 0, 0, 1644432459, 0, 'Unnamed House #512', 0, 5, 0, 0, 0, 0, 77, NULL, 0),
(513, 0, 0, 0, 1644432459, 0, 'Unnamed House #513', 0, 5, 0, 0, 0, 0, 51, NULL, 0),
(514, 0, 0, 0, 1644432459, 0, 'Unnamed House #514', 0, 5, 0, 0, 0, 0, 80, NULL, 0),
(515, 0, 0, 0, 1644432459, 0, 'Unnamed House #515', 0, 5, 0, 0, 0, 0, 210, NULL, 0),
(516, 0, 0, 0, 1644432459, 0, 'Unnamed House #516', 0, 5, 0, 0, 0, 0, 280, NULL, 0),
(517, 0, 0, 0, 1644432459, 0, 'Unnamed House #517', 0, 5, 0, 0, 0, 0, 85, NULL, 0),
(518, 0, 0, 0, 1644432459, 0, 'Unnamed House #518', 0, 5, 0, 0, 0, 0, 105, NULL, 0),
(519, 0, 0, 0, 1644432459, 0, 'Unnamed House #519', 0, 5, 0, 0, 0, 0, 74, NULL, 0),
(520, 0, 0, 0, 1644432459, 0, 'Unnamed House #520', 0, 5, 0, 0, 0, 0, 74, NULL, 0),
(521, 0, 0, 0, 1644432459, 0, 'Unnamed House #521', 0, 5, 0, 0, 0, 0, 56, NULL, 0),
(522, 0, 0, 0, 1644432459, 0, 'Unnamed House #522', 0, 5, 0, 0, 0, 0, 176, NULL, 0),
(523, 0, 0, 0, 1644432459, 0, 'Unnamed House #523', 0, 5, 0, 0, 0, 0, 108, NULL, 0),
(524, 0, 0, 0, 1644432459, 0, 'Unnamed House #524', 0, 5, 0, 0, 0, 0, 55, NULL, 0),
(525, 0, 0, 0, 1644432459, 0, 'Unnamed House #525', 0, 5, 0, 0, 0, 0, 228, NULL, 0),
(526, 0, 0, 0, 1644432459, 0, 'Unnamed House #526', 0, 5, 0, 0, 0, 0, 52, NULL, 0),
(527, 0, 0, 0, 1644432459, 0, 'Unnamed House #527', 0, 5, 0, 0, 0, 0, 40, NULL, 0),
(528, 0, 0, 0, 1644432459, 0, 'Unnamed House #528', 0, 5, 0, 0, 0, 0, 90, NULL, 0),
(529, 0, 0, 0, 1644432459, 0, 'Unnamed House #529', 0, 5, 0, 0, 0, 0, 86, NULL, 0),
(530, 0, 0, 0, 1644432459, 0, 'Unnamed House #530', 0, 5, 0, 0, 0, 0, 39, NULL, 0),
(531, 0, 0, 0, 1644432459, 0, 'Unnamed House #531', 0, 5, 0, 0, 0, 0, 100, NULL, 0),
(532, 0, 0, 0, 1644432459, 0, 'Unnamed House #532', 0, 5, 0, 0, 0, 0, 78, NULL, 0),
(533, 0, 0, 0, 1644432459, 0, 'Unnamed House #533', 0, 5, 0, 0, 0, 0, 47, NULL, 0),
(534, 0, 0, 0, 1644432459, 0, 'Unnamed House #534', 0, 5, 0, 0, 0, 0, 40, NULL, 0),
(535, 0, 0, 0, 1644432459, 0, 'Unnamed House #535', 0, 5, 0, 0, 0, 0, 98, NULL, 0),
(536, 0, 0, 0, 1644432459, 0, 'Unnamed House #536', 0, 5, 0, 0, 0, 0, 45, NULL, 0),
(537, 0, 0, 0, 1644432459, 0, 'Unnamed House #537', 0, 5, 0, 0, 0, 0, 58, NULL, 0),
(538, 0, 0, 0, 1644432459, 0, 'Unnamed House #538', 0, 5, 0, 0, 0, 0, 65, NULL, 0),
(539, 0, 0, 0, 1644432459, 0, 'Unnamed House #539', 0, 5, 0, 0, 0, 0, 31, NULL, 0),
(540, 0, 0, 0, 1644432459, 0, 'Unnamed House #540', 0, 5, 0, 0, 0, 0, 138, NULL, 0),
(541, 0, 0, 0, 1644432459, 0, 'Unnamed House #541', 0, 5, 0, 0, 0, 0, 47, NULL, 0),
(542, 0, 0, 0, 1644432459, 0, 'Unnamed House #542', 0, 5, 0, 0, 0, 0, 51, NULL, 0),
(543, 0, 0, 0, 1644432459, 0, 'Unnamed House #543', 0, 5, 0, 0, 0, 0, 87, NULL, 0),
(544, 0, 0, 0, 1644432459, 0, 'Unnamed House #544', 0, 5, 0, 0, 0, 0, 49, NULL, 0),
(545, 0, 0, 0, 1644432459, 0, 'Unnamed House #545', 0, 5, 0, 0, 0, 0, 95, NULL, 0),
(546, 0, 0, 0, 1644432459, 0, 'Unnamed House #546', 0, 5, 0, 0, 0, 0, 127, NULL, 0),
(547, 0, 0, 0, 1644432459, 0, 'Unnamed House #547', 0, 5, 0, 0, 0, 0, 81, NULL, 0),
(548, 0, 0, 0, 1644432459, 0, 'Unnamed House #548', 0, 5, 0, 0, 0, 0, 51, NULL, 0),
(549, 0, 0, 0, 1644432459, 0, 'Unnamed House #549', 0, 5, 0, 0, 0, 0, 80, NULL, 0),
(550, 0, 0, 0, 1644432459, 0, 'Unnamed House #550', 0, 5, 0, 0, 0, 0, 80, NULL, 0),
(551, 0, 0, 0, 1644432459, 0, 'Unnamed House #551', 0, 5, 0, 0, 0, 0, 91, NULL, 0),
(552, 0, 0, 0, 1644432459, 0, 'Unnamed House #552', 0, 5, 0, 0, 0, 0, 77, NULL, 0),
(553, 0, 0, 0, 1644432459, 0, 'Unnamed House #553', 0, 5, 0, 0, 0, 0, 66, NULL, 0),
(554, 0, 0, 0, 1644432459, 0, 'Unnamed House #554', 0, 5, 0, 0, 0, 0, 46, NULL, 0),
(555, 0, 0, 0, 1644432459, 0, 'Unnamed House #555', 0, 5, 0, 0, 0, 0, 67, NULL, 0),
(556, 0, 0, 0, 1644432459, 0, 'Unnamed House #556', 0, 5, 0, 0, 0, 0, 152, NULL, 0),
(557, 0, 0, 0, 1644432459, 0, 'Unnamed House #557', 0, 5, 0, 0, 0, 0, 60, NULL, 0),
(558, 0, 0, 0, 1644432459, 0, 'Unnamed House #558', 0, 5, 0, 0, 0, 0, 73, NULL, 0),
(559, 0, 0, 0, 1644432459, 0, 'Unnamed House #559', 0, 5, 0, 0, 0, 0, 64, NULL, 2),
(560, 0, 0, 0, 1644432459, 0, 'Unnamed House #560', 0, 5, 0, 0, 0, 0, 139, NULL, 0),
(561, 0, 0, 0, 1644432459, 0, 'Unnamed House #561', 0, 5, 0, 0, 0, 0, 209, NULL, 0),
(562, 0, 0, 0, 1644432459, 0, 'Unnamed House #562', 0, 5, 0, 0, 0, 0, 39, NULL, 0),
(563, 0, 0, 0, 1644432459, 0, 'Unnamed House #563', 0, 5, 0, 0, 0, 0, 51, NULL, 0),
(564, 0, 0, 0, 1644432459, 0, 'Unnamed House #564', 0, 5, 0, 0, 0, 0, 44, NULL, 0),
(565, 0, 0, 0, 1644432459, 0, 'Unnamed House #565', 0, 5, 0, 0, 0, 0, 42, NULL, 0),
(566, 0, 0, 0, 1644432459, 0, 'Unnamed House #566', 0, 5, 0, 0, 0, 0, 48, NULL, 0),
(567, 0, 0, 0, 1644432459, 0, 'Unnamed House #567', 0, 5, 0, 0, 0, 0, 48, NULL, 0),
(568, 0, 0, 0, 1644432459, 0, 'Unnamed House #568', 0, 5, 0, 0, 0, 0, 91, NULL, 0),
(569, 0, 0, 0, 1644432459, 0, 'Unnamed House #569', 0, 5, 0, 0, 0, 0, 75, NULL, 0),
(570, 0, 0, 0, 1644432459, 0, 'Unnamed House #570', 0, 5, 0, 0, 0, 0, 52, NULL, 0),
(571, 0, 0, 0, 1644432459, 0, 'Unnamed House #571', 0, 5, 0, 0, 0, 0, 62, NULL, 0),
(572, 0, 0, 0, 1644432459, 0, 'Unnamed House #572', 0, 5, 0, 0, 0, 0, 75, NULL, 0),
(573, 0, 0, 0, 1644432459, 0, 'Unnamed House #573', 0, 5, 0, 0, 0, 0, 94, NULL, 0),
(574, 0, 0, 0, 1644432459, 0, 'Unnamed House #574', 0, 5, 0, 0, 0, 0, 185, NULL, 0),
(575, 0, 0, 0, 1644432459, 0, 'Unnamed House #575', 0, 5, 0, 0, 0, 0, 57, NULL, 0),
(576, 0, 0, 0, 1644432459, 0, 'Unnamed House #576', 0, 5, 0, 0, 0, 0, 93, NULL, 0),
(577, 0, 0, 0, 1644432459, 0, 'Unnamed House #577', 0, 5, 0, 0, 0, 0, 41, NULL, 0),
(578, 0, 0, 0, 1644432459, 0, 'Unnamed House #578', 0, 5, 0, 0, 0, 0, 74, NULL, 0),
(579, 0, 0, 0, 1644432459, 0, 'Unnamed House #579', 0, 5, 0, 0, 0, 0, 89, NULL, 0),
(580, 0, 0, 0, 1644432459, 0, 'Unnamed House #580', 0, 5, 0, 0, 0, 0, 43, NULL, 0),
(581, 0, 0, 0, 1644432459, 0, 'Unnamed House #581', 0, 5, 0, 0, 0, 0, 108, NULL, 0),
(582, 0, 0, 0, 1644432459, 0, 'Unnamed House #582', 0, 5, 0, 0, 0, 0, 59, NULL, 0),
(583, 0, 0, 0, 1644432459, 0, 'Unnamed House #583', 0, 5, 0, 0, 0, 0, 98, NULL, 0),
(584, 0, 0, 0, 1644432459, 0, 'Unnamed House #584', 0, 5, 0, 0, 0, 0, 158, NULL, 0),
(585, 0, 0, 0, 1644432459, 0, 'Unnamed House #585', 0, 5, 0, 0, 0, 0, 60, NULL, 0),
(586, 0, 0, 0, 1644432459, 0, 'Unnamed House #586', 0, 5, 0, 0, 0, 0, 111, NULL, 0),
(587, 0, 0, 0, 1644432459, 0, 'Unnamed House #587', 0, 5, 0, 0, 0, 0, 48, NULL, 0),
(588, 0, 0, 0, 1644432459, 0, 'Unnamed House #588', 0, 5, 0, 0, 0, 0, 40, NULL, 2),
(589, 0, 0, 0, 1644432459, 0, 'Unnamed House #589', 0, 5, 0, 0, 0, 0, 80, NULL, 0),
(590, 0, 0, 0, 1644432459, 0, 'Unnamed House #590', 0, 5, 0, 0, 0, 0, 48, NULL, 0),
(591, 0, 0, 0, 1644432459, 0, 'Unnamed House #591', 0, 5, 0, 0, 0, 0, 65, NULL, 0),
(592, 0, 0, 0, 1644432459, 0, 'Unnamed House #592', 0, 5, 0, 0, 0, 0, 25, NULL, 0),
(593, 0, 0, 0, 1644432459, 0, 'Unnamed House #593', 0, 6, 0, 0, 0, 0, 75, NULL, 0),
(594, 0, 0, 0, 1644432459, 0, 'Unnamed House #594', 0, 6, 0, 0, 0, 0, 69, NULL, 0),
(595, 0, 0, 0, 1644432459, 0, 'Unnamed House #595', 0, 6, 0, 0, 0, 0, 70, NULL, 0),
(596, 0, 0, 0, 1644432459, 0, 'Unnamed House #596', 0, 6, 0, 0, 0, 0, 82, NULL, 0),
(597, 0, 0, 0, 1644432459, 0, 'Unnamed House #597', 0, 6, 0, 0, 0, 0, 78, NULL, 0),
(598, 0, 0, 0, 1644432459, 0, 'Unnamed House #598', 0, 6, 0, 0, 0, 0, 91, NULL, 0),
(599, 0, 0, 0, 1644432459, 0, 'Unnamed House #599', 0, 6, 0, 0, 0, 0, 85, NULL, 0),
(600, 0, 0, 0, 1644432459, 0, 'Unnamed House #600', 0, 6, 0, 0, 0, 0, 293, NULL, 0),
(601, 0, 0, 0, 1644432459, 0, 'Unnamed House #601', 0, 6, 0, 0, 0, 0, 99, NULL, 0),
(602, 0, 0, 0, 1644432459, 0, 'Unnamed House #602', 0, 6, 0, 0, 0, 0, 131, NULL, 0),
(603, 0, 0, 0, 1644432459, 0, 'Unnamed House #603', 0, 6, 0, 0, 0, 0, 89, NULL, 0),
(604, 0, 0, 0, 1644432459, 0, 'Unnamed House #604', 0, 6, 0, 0, 0, 0, 212, NULL, 0),
(605, 0, 0, 0, 1644432459, 0, 'Unnamed House #605', 0, 6, 0, 0, 0, 0, 204, NULL, 0),
(606, 0, 0, 0, 1644432459, 0, 'Unnamed House #606', 0, 6, 0, 0, 0, 0, 104, NULL, 0),
(607, 0, 0, 0, 1644432459, 0, 'Unnamed House #607', 0, 6, 0, 0, 0, 0, 69, NULL, 0),
(608, 0, 0, 0, 1644432459, 0, 'Unnamed House #608', 0, 6, 0, 0, 0, 0, 70, NULL, 0),
(609, 0, 0, 0, 1644432459, 0, 'Unnamed House #609', 0, 6, 0, 0, 0, 0, 96, NULL, 0),
(610, 0, 0, 0, 1644432459, 0, 'Unnamed House #610', 0, 6, 0, 0, 0, 0, 73, NULL, 0),
(611, 0, 0, 0, 1644432459, 0, 'Unnamed House #611', 0, 6, 0, 0, 0, 0, 62, NULL, 0),
(612, 0, 0, 0, 1644432459, 0, 'Unnamed House #612', 0, 6, 0, 0, 0, 0, 70, NULL, 0),
(613, 0, 0, 0, 1644432459, 0, 'Unnamed House #613', 0, 6, 0, 0, 0, 0, 79, NULL, 0),
(614, 0, 0, 0, 1644432459, 0, 'Unnamed House #614', 0, 6, 0, 0, 0, 0, 112, NULL, 0),
(615, 0, 0, 0, 1644432459, 0, 'Unnamed House #615', 0, 6, 0, 0, 0, 0, 58, NULL, 0),
(616, 0, 0, 0, 1644432459, 0, 'Unnamed House #616', 0, 6, 0, 0, 0, 0, 40, NULL, 0),
(617, 0, 0, 0, 1644432459, 0, 'Unnamed House #617', 0, 6, 0, 0, 0, 0, 87, NULL, 0),
(618, 0, 0, 0, 1644432459, 0, 'Unnamed House #618', 0, 6, 0, 0, 0, 0, 65, NULL, 0),
(619, 0, 0, 0, 1644432459, 0, 'Unnamed House #619', 0, 6, 0, 0, 0, 0, 21, NULL, 0),
(620, 0, 0, 0, 1644432459, 0, 'Unnamed House #620', 0, 6, 0, 0, 0, 0, 56, NULL, 0),
(621, 0, 0, 0, 1644432459, 0, 'Unnamed House #621', 0, 6, 0, 0, 0, 0, 127, NULL, 0),
(622, 0, 0, 0, 1644432459, 0, 'Unnamed House #622', 0, 6, 0, 0, 0, 0, 57, NULL, 0),
(623, 0, 0, 0, 1644432459, 0, 'Unnamed House #623', 0, 6, 0, 0, 0, 0, 42, NULL, 0),
(624, 0, 0, 0, 1644432459, 0, 'Unnamed House #624', 0, 6, 0, 0, 0, 0, 92, NULL, 0),
(625, 0, 0, 0, 1644432459, 0, 'Unnamed House #625', 0, 6, 0, 0, 0, 0, 113, NULL, 0),
(626, 0, 0, 0, 1644432459, 0, 'Unnamed House #626', 0, 6, 0, 0, 0, 0, 117, NULL, 0),
(627, 0, 0, 0, 1644432459, 0, 'Unnamed House #627', 0, 6, 0, 0, 0, 0, 183, NULL, 0),
(628, 0, 0, 0, 1644432459, 0, 'Unnamed House #628', 0, 6, 0, 0, 0, 0, 186, NULL, 0),
(629, 0, 0, 0, 1644432459, 0, 'Unnamed House #629', 0, 6, 0, 0, 0, 0, 89, NULL, 0),
(630, 0, 0, 0, 1644432459, 0, 'Unnamed House #630', 0, 6, 0, 0, 0, 0, 61, NULL, 0),
(631, 0, 0, 0, 1644432459, 0, 'Unnamed House #631', 0, 6, 0, 0, 0, 0, 63, NULL, 0),
(632, 0, 0, 0, 1644432459, 0, 'Unnamed House #632', 0, 6, 0, 0, 0, 0, 103, NULL, 0),
(633, 0, 0, 0, 1644432459, 0, 'Unnamed House #633', 0, 6, 0, 0, 0, 0, 78, NULL, 0),
(634, 0, 0, 0, 1644432459, 0, 'Unnamed House #634', 0, 6, 0, 0, 0, 0, 77, NULL, 0),
(635, 0, 0, 0, 1644432459, 0, 'Unnamed House #635', 0, 6, 0, 0, 0, 0, 132, NULL, 0),
(636, 0, 0, 0, 1644432459, 0, 'Unnamed House #636', 0, 6, 0, 0, 0, 0, 78, NULL, 0),
(637, 0, 0, 0, 1644432459, 0, 'Unnamed House #637', 0, 6, 0, 0, 0, 0, 83, NULL, 0),
(638, 0, 0, 0, 1644432459, 0, 'Unnamed House #638', 0, 6, 0, 0, 0, 0, 98, NULL, 0),
(639, 0, 0, 0, 1644432459, 0, 'Unnamed House #639', 0, 6, 0, 0, 0, 0, 48, NULL, 0),
(640, 0, 0, 0, 1644432459, 0, 'Unnamed House #640', 0, 6, 0, 0, 0, 0, 42, NULL, 0),
(641, 0, 0, 0, 1644432459, 0, 'Unnamed House #641', 0, 6, 0, 0, 0, 0, 35, NULL, 0),
(642, 0, 0, 0, 1644432459, 0, 'Unnamed House #642', 0, 6, 0, 0, 0, 0, 50, NULL, 0),
(643, 0, 0, 0, 1644432459, 0, 'Unnamed House #643', 0, 6, 0, 0, 0, 0, 42, NULL, 0),
(644, 0, 0, 0, 1644432459, 0, 'Unnamed House #644', 0, 6, 0, 0, 0, 0, 103, NULL, 0),
(645, 0, 0, 0, 1644432459, 0, 'Unnamed House #645', 0, 6, 0, 0, 0, 0, 36, NULL, 0),
(646, 0, 0, 0, 1644432459, 0, 'Unnamed House #646', 0, 6, 0, 0, 0, 0, 105, NULL, 0),
(647, 0, 0, 0, 1644432459, 0, 'Unnamed House #647', 0, 6, 0, 0, 0, 0, 59, NULL, 0),
(648, 0, 0, 0, 1644432459, 0, 'Unnamed House #648', 0, 6, 0, 0, 0, 0, 61, NULL, 0),
(649, 0, 0, 0, 1644432459, 0, 'Unnamed House #649', 0, 6, 0, 0, 0, 0, 51, NULL, 0),
(650, 0, 0, 0, 1644432459, 0, 'Unnamed House #650', 0, 6, 0, 0, 0, 0, 69, NULL, 0),
(651, 0, 0, 0, 1644432459, 0, 'Unnamed House #651', 0, 6, 0, 0, 0, 0, 26, NULL, 0),
(652, 0, 0, 0, 1644432459, 0, 'Unnamed House #652', 0, 6, 0, 0, 0, 0, 25, NULL, 0),
(653, 0, 0, 0, 1644432459, 0, 'Unnamed House #653', 0, 6, 0, 0, 0, 0, 140, NULL, 0),
(655, 0, 0, 0, 1644432459, 0, 'Unnamed House #655', 0, 6, 0, 0, 0, 0, 90, NULL, 0),
(656, 0, 0, 0, 1644432459, 0, 'Unnamed House #656', 0, 6, 0, 0, 0, 0, 72, NULL, 0),
(657, 0, 0, 0, 1644432459, 0, 'Unnamed House #657', 0, 6, 0, 0, 0, 0, 75, NULL, 0),
(658, 0, 0, 0, 1644432459, 0, 'Unnamed House #658', 0, 6, 0, 0, 0, 0, 38, NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `house_lists`
--

CREATE TABLE `house_lists` (
  `house_id` int(11) NOT NULL,
  `listid` int(11) NOT NULL,
  `list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `hunted_system`
--

CREATE TABLE `hunted_system` (
  `playerGuid` varchar(255) NOT NULL,
  `targetGuid` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ip_bans`
--

CREATE TABLE `ip_bans` (
  `ip` int(10) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `links`
--

CREATE TABLE `links` (
  `account_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `code_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `links`
--

INSERT INTO `links` (`account_id`, `code`, `code_date`) VALUES
(3, '9uda7ak24o7waukaxyvr', 1676290318),
(3, '9uda7ak24o7waukaxyvr', 1676290318),
(3, 'ox1xblh2tcaccmis9fyx', 1676290435),
(3, 'ox1xblh2tcaccmis9fyx', 1676290435);

-- --------------------------------------------------------

--
-- Estrutura da tabela `live_casts`
--

CREATE TABLE `live_casts` (
  `player_id` int(11) NOT NULL,
  `cast_name` varchar(255) NOT NULL,
  `password` tinyint(1) NOT NULL DEFAULT 0,
  `description` varchar(255) DEFAULT NULL,
  `spectators` smallint(5) DEFAULT 0,
  `version` int(10) DEFAULT 1220
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lottery`
--

CREATE TABLE `lottery` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `qnt` int(11) NOT NULL DEFAULT 1,
  `item_name` varchar(255) NOT NULL,
  `date` varchar(256) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `lottery`
--

INSERT INTO `lottery` (`id`, `name`, `item`, `qnt`, `item_name`, `date`) VALUES
(1, 'Administrator', '35288', 0, 'lasting exercise bow', '27/09/2022 - 13:46:12'),
(2, 'Teste MS', '35286', 0, 'lasting exercise axe', '11/03/2022 - 12:46:12'),
(3, 'Teste Ms', '3043', 90, 'crystal coin', '11/01/2023 - 13:09:35'),
(4, 'Teste Ms', '35285', 1, 'lasting exercise sword', '11/01/2023 - 14:01:35'),
(5, 'Teste Ms', '35285', 1, 'lasting exercise sword', '11/01/2023 - 15:01:35'),
(6, 'Teste Ms', '3043', 100, 'crystal coin', '11/01/2023 - 17:21:35'),
(7, 'Teste Ms', '35290', 1, 'lasting exercise wand', '23/01/2023 - 13:34:13'),
(8, 'Teste Ms', '35288', 1, 'lasting exercise bow', '25/01/2023 - 08:56:29'),
(9, 'Teste Ms', '35289', 1, 'lasting exercise rod', '26/01/2023 - 13:58:54'),
(10, 'Teste Ms', '35287', 1, 'lasting exercise club', '30/01/2023 - 19:01:21'),
(11, 'Teste Ms', '35288', 1, 'lasting exercise bow', '31/01/2023 - 09:09:12'),
(12, 'Teste Ms', '35285', 1, 'lasting exercise sword', '31/01/2023 - 10:15:38'),
(13, 'Teste Ms', '35287', 1, 'lasting exercise club', '31/01/2023 - 13:31:27'),
(14, 'Teste Ms', '35289', 1, 'lasting exercise rod', '01/02/2023 - 11:10:05'),
(15, 'Teste Ms', '35287', 1, 'lasting exercise club', '06/02/2023 - 19:28:05'),
(16, 'Teste Ms', '35288', 1, 'lasting exercise bow', '07/02/2023 - 09:59:41'),
(17, 'Teste Ms', '35288', 1, 'lasting exercise bow', '07/02/2023 - 10:59:30'),
(18, 'Teste Ms', '35289', 1, 'lasting exercise rod', '07/02/2023 - 11:22:11'),
(19, 'Teste Ms', '3043', 80, 'crystal coin', '07/02/2023 - 14:22:46'),
(20, 'Teste Ms', '3043', 80, 'crystal coin', '07/02/2023 - 14:39:52');

-- --------------------------------------------------------

--
-- Estrutura da tabela `market_history`
--

CREATE TABLE `market_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `expires_at` bigint(20) UNSIGNED NOT NULL,
  `inserted` bigint(20) UNSIGNED NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL,
  `tier` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `market_offers`
--

CREATE TABLE `market_offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `created` bigint(20) UNSIGNED NOT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT 0,
  `price` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `tier` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `newsticker`
--

CREATE TABLE `newsticker` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` int(11) NOT NULL,
  `text` mediumtext NOT NULL,
  `icon` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `newsticker`
--

INSERT INTO `newsticker` (`id`, `date`, `text`, `icon`) VALUES
(1, 1676293288, 'New Testesadsadsa d sasa Tikers kakahsdausd Testststs ssssssssssssssssssssssssssssssssssssssssssssssssss', 'newsicon_technical');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagseguro`
--

CREATE TABLE `pagseguro` (
  `date` datetime NOT NULL,
  `code` varchar(50) NOT NULL,
  `reference` varchar(200) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `lastEventDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagsegurotransacoes`
--

CREATE TABLE `pagsegurotransacoes` (
  `TransacaoID` varchar(36) NOT NULL,
  `VendedorEmail` varchar(200) NOT NULL,
  `Referencia` varchar(200) DEFAULT NULL,
  `TipoFrete` char(2) DEFAULT NULL,
  `ValorFrete` decimal(10,2) DEFAULT NULL,
  `Extras` decimal(10,2) DEFAULT NULL,
  `Anotacao` text DEFAULT NULL,
  `TipoPagamento` varchar(50) NOT NULL,
  `StatusTransacao` varchar(50) NOT NULL,
  `CliNome` varchar(200) NOT NULL,
  `CliEmail` varchar(200) NOT NULL,
  `CliEndereco` varchar(200) NOT NULL,
  `CliNumero` varchar(10) DEFAULT NULL,
  `CliComplemento` varchar(100) DEFAULT NULL,
  `CliBairro` varchar(100) NOT NULL,
  `CliCidade` varchar(100) NOT NULL,
  `CliEstado` char(2) NOT NULL,
  `CliCEP` varchar(9) NOT NULL,
  `CliTelefone` varchar(14) DEFAULT NULL,
  `NumItens` int(11) NOT NULL,
  `Data` datetime NOT NULL,
  `ProdQuantidade_x` int(5) NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagseguro_transactions`
--

CREATE TABLE `pagseguro_transactions` (
  `transaction_code` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `payment_method` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `item_count` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `payment_amount` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `paypal_transactions`
--

CREATE TABLE `paypal_transactions` (
  `id` int(11) NOT NULL,
  `payment_status` varchar(70) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  `payer_email` varchar(255) NOT NULL DEFAULT '',
  `payer_id` varchar(255) NOT NULL DEFAULT '',
  `item_number1` varchar(255) NOT NULL DEFAULT '',
  `mc_gross` float NOT NULL,
  `mc_currency` varchar(5) NOT NULL DEFAULT '',
  `txn_id` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT 1,
  `account_id` int(11) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `vocation` int(11) NOT NULL DEFAULT 0,
  `health` int(11) NOT NULL DEFAULT 150,
  `healthmax` int(11) NOT NULL DEFAULT 150,
  `experience` bigint(20) NOT NULL DEFAULT 0,
  `exptoday` int(11) DEFAULT NULL,
  `lookbody` int(11) NOT NULL DEFAULT 0,
  `lookfeet` int(11) NOT NULL DEFAULT 0,
  `lookhead` int(11) NOT NULL DEFAULT 0,
  `looklegs` int(11) NOT NULL DEFAULT 0,
  `looktype` int(11) NOT NULL DEFAULT 136,
  `lookaddons` int(11) NOT NULL DEFAULT 0,
  `maglevel` int(11) NOT NULL DEFAULT 0,
  `mana` int(11) NOT NULL DEFAULT 0,
  `manamax` int(11) NOT NULL DEFAULT 0,
  `manaspent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `soul` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `town_id` int(11) NOT NULL DEFAULT 0,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0,
  `conditions` blob NOT NULL DEFAULT '',
  `cap` int(11) NOT NULL DEFAULT 0,
  `sex` int(11) NOT NULL DEFAULT 0,
  `lastlogin` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `lastip` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `save` tinyint(1) NOT NULL DEFAULT 1,
  `skull` tinyint(1) NOT NULL DEFAULT 0,
  `skulltime` bigint(20) NOT NULL DEFAULT 0,
  `lastlogout` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `blessings` tinyint(2) NOT NULL DEFAULT 0,
  `blessings1` tinyint(4) NOT NULL DEFAULT 0,
  `blessings2` tinyint(4) NOT NULL DEFAULT 0,
  `blessings3` tinyint(4) NOT NULL DEFAULT 0,
  `blessings4` tinyint(4) NOT NULL DEFAULT 0,
  `blessings5` tinyint(4) NOT NULL DEFAULT 0,
  `blessings6` tinyint(4) NOT NULL DEFAULT 0,
  `blessings7` tinyint(4) NOT NULL DEFAULT 0,
  `blessings8` tinyint(4) NOT NULL DEFAULT 0,
  `onlinetime` bigint(20) NOT NULL DEFAULT 0,
  `deletion` bigint(15) NOT NULL DEFAULT 0,
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `bonusrerollcount` bigint(20) DEFAULT 0,
  `quickloot_fallback` tinyint(1) DEFAULT 0,
  `lookmountbody` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lookmountfeet` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lookmounthead` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lookmountlegs` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lookfamiliarstype` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `isreward` tinyint(1) NOT NULL DEFAULT 1,
  `istutorial` tinyint(1) NOT NULL DEFAULT 0,
  `offlinetraining_time` smallint(5) UNSIGNED NOT NULL DEFAULT 43200,
  `offlinetraining_skill` int(11) NOT NULL DEFAULT -1,
  `stamina` smallint(5) UNSIGNED NOT NULL DEFAULT 2520,
  `skill_fist` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_fist_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_club` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_club_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_sword` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_sword_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_axe` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_axe_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_dist` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_dist_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_shielding` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_shielding_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_fishing` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `skill_fishing_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `description` varchar(255) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `create_ip` bigint(20) NOT NULL DEFAULT 0,
  `create_date` bigint(20) NOT NULL DEFAULT 0,
  `hide_char` int(11) NOT NULL DEFAULT 0,
  `skill_critical_hit_chance` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `skill_critical_hit_chance_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_critical_hit_damage` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `skill_critical_hit_damage_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_life_leech_chance` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `skill_life_leech_chance_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_life_leech_amount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `skill_life_leech_amount_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_mana_leech_chance` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `skill_mana_leech_chance_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_mana_leech_amount` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `skill_mana_leech_amount_tries` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_criticalhit_chance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_criticalhit_damage` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_lifeleech_chance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_lifeleech_amount` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_manaleech_chance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `skill_manaleech_amount` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `manashield` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `max_manashield` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `prey_stamina_1` int(11) DEFAULT NULL,
  `prey_stamina_2` int(11) DEFAULT NULL,
  `prey_stamina_3` int(11) DEFAULT NULL,
  `prey_column` smallint(6) NOT NULL DEFAULT 1,
  `xpboost_stamina` int(11) DEFAULT NULL,
  `xpboost_value` int(10) DEFAULT NULL,
  `marriage_status` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `hide_skills` int(11) DEFAULT NULL,
  `hide_set` int(11) DEFAULT NULL,
  `former` varchar(255) NOT NULL DEFAULT '-',
  `signature` varchar(255) NOT NULL DEFAULT '',
  `marriage_spouse` int(11) NOT NULL DEFAULT -1,
  `loyalty_ranking` tinyint(1) NOT NULL DEFAULT 0,
  `bonus_rerolls` bigint(21) NOT NULL DEFAULT 0,
  `critical` int(20) DEFAULT 0,
  `bonus_reroll` int(11) NOT NULL DEFAULT 0,
  `prey_wildcard` bigint(21) NOT NULL,
  `task_points` bigint(21) NOT NULL,
  `forge_dusts` bigint(21) NOT NULL,
  `forge_dust_level` bigint(21) NOT NULL DEFAULT 100,
  `sbw_points` int(11) NOT NULL DEFAULT 0,
  `instantrewardtokens` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `charmpoints` int(11) DEFAULT 0,
  `direction` tinyint(1) DEFAULT 0,
  `lookmount` int(11) DEFAULT 0,
  `version` int(11) DEFAULT 1000,
  `lootaction` tinyint(2) DEFAULT 0,
  `spells` blob DEFAULT NULL,
  `storages` mediumblob DEFAULT NULL,
  `items` longblob DEFAULT NULL,
  `depotitems` longblob DEFAULT NULL,
  `inboxitems` longblob DEFAULT NULL,
  `rewards` longblob DEFAULT NULL,
  `varcap` int(11) NOT NULL DEFAULT 0,
  `charmExpansion` tinyint(2) DEFAULT 0,
  `bestiarykills` longblob DEFAULT NULL,
  `charms` longblob DEFAULT NULL,
  `bestiaryTracker` longblob DEFAULT NULL,
  `autoloot` blob DEFAULT NULL,
  `lastday` bigint(22) DEFAULT 0,
  `cast` tinyint(1) NOT NULL DEFAULT 0,
  `online_time` int(11) NOT NULL DEFAULT 0,
  `online_time_month` int(11) NOT NULL,
  `shopitens` varchar(255) NOT NULL DEFAULT '''{}''',
  `shoplucro` varchar(255) NOT NULL DEFAULT '''{}''',
  `main` int(11) NOT NULL DEFAULT 0,
  `world` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `players`
--

INSERT INTO `players` (`id`, `name`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `exptoday`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `lastlogout`, `blessings`, `blessings1`, `blessings2`, `blessings3`, `blessings4`, `blessings5`, `blessings6`, `blessings7`, `blessings8`, `onlinetime`, `deletion`, `balance`, `bonusrerollcount`, `quickloot_fallback`, `lookmountbody`, `lookmountfeet`, `lookmounthead`, `lookmountlegs`, `lookfamiliarstype`, `isreward`, `istutorial`, `offlinetraining_time`, `offlinetraining_skill`, `stamina`, `skill_fist`, `skill_fist_tries`, `skill_club`, `skill_club_tries`, `skill_sword`, `skill_sword_tries`, `skill_axe`, `skill_axe_tries`, `skill_dist`, `skill_dist_tries`, `skill_shielding`, `skill_shielding_tries`, `skill_fishing`, `skill_fishing_tries`, `deleted`, `description`, `comment`, `create_ip`, `create_date`, `hide_char`, `skill_critical_hit_chance`, `skill_critical_hit_chance_tries`, `skill_critical_hit_damage`, `skill_critical_hit_damage_tries`, `skill_life_leech_chance`, `skill_life_leech_chance_tries`, `skill_life_leech_amount`, `skill_life_leech_amount_tries`, `skill_mana_leech_chance`, `skill_mana_leech_chance_tries`, `skill_mana_leech_amount`, `skill_mana_leech_amount_tries`, `skill_criticalhit_chance`, `skill_criticalhit_damage`, `skill_lifeleech_chance`, `skill_lifeleech_amount`, `skill_manaleech_chance`, `skill_manaleech_amount`, `manashield`, `max_manashield`, `prey_stamina_1`, `prey_stamina_2`, `prey_stamina_3`, `prey_column`, `xpboost_stamina`, `xpboost_value`, `marriage_status`, `hide_skills`, `hide_set`, `former`, `signature`, `marriage_spouse`, `loyalty_ranking`, `bonus_rerolls`, `critical`, `bonus_reroll`, `prey_wildcard`, `task_points`, `forge_dusts`, `forge_dust_level`, `sbw_points`, `instantrewardtokens`, `charmpoints`, `direction`, `lookmount`, `version`, `lootaction`, `spells`, `storages`, `items`, `depotitems`, `inboxitems`, `rewards`, `varcap`, `charmExpansion`, `bestiarykills`, `charms`, `bestiaryTracker`, `autoloot`, `lastday`, `cast`, `online_time`, `online_time_month`, `shopitens`, `shoplucro`, `main`, `world`) VALUES
(9, 'Administrator', 6, 2, 999999, 1, 5000140, 5000140, 4368687284726964989, NULL, 79, 79, 79, 79, 128, 0, 0, 90, 29999820, 0, 100, 1, 996, 1209, 7, '', 10000380, 1, 1676295043, 16777343, 1, 0, 0, 1676296699, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1673845943, 0, 11187200, 0, 0, 0, 0, 0, 0, 994, 0, 0, 43200, -1, 2520, 10, 0, 19, 1120, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 2130706433, 1673192555, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, 5400, 50, 0, NULL, NULL, '-', '', -1, 0, 0, 0, 0, 6, 0, 60, 101, 0, 0, 0, 0, 0, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '\'{[3388] = {[1] = \"1\", [2] = \"60000\"}, [3420] = {[1] = \"1\", [2] = \"15000\"}}\'', '\'{}\'', 1, 1),
(10, 'Teste Ms', 1, 3, 1484, 1, 6295, 7565, 54326698750, NULL, 94, 94, 94, 94, 128, 0, 110, 37616, 44370, 6983198, 100, 1, 995, 1212, 7, '', 15230, 1, 1676253664, 16777343, 1, 0, 0, 1676253749, 0, 0, 0, 0, 0, 0, 0, 0, 0, 267757, 0, 0, 0, 0, 0, 0, 0, 0, 994, 1, 0, 43200, -1, 2520, 35, 653769, 10, 0, 10, 0, 10, 0, 10, 0, 35, 921754, 10, 0, 0, '', '', 2130706433, 1673375460, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, '-', '', -1, 0, 0, 0, 0, 4, 0, 0, 100, 0, 0, 0, 0, 0, 1000, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '\'{[7992] = {[1] = \"1\", [2] = \"15000\"}}\'', '\'{}\'', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `players_online`
--

CREATE TABLE `players_online` (
  `player_id` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `players_online`
--

INSERT INTO `players_online` (`player_id`) VALUES
(9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_badges`
--

CREATE TABLE `player_badges` (
  `id` int(11) NOT NULL,
  `badge_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_binary_items`
--

CREATE TABLE `player_binary_items` (
  `player_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `items` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_charms`
--

CREATE TABLE `player_charms` (
  `player_guid` int(250) NOT NULL,
  `charm_points` varchar(250) DEFAULT NULL,
  `charm_expansion` tinyint(1) DEFAULT NULL,
  `rune_wound` int(250) DEFAULT NULL,
  `rune_enflame` int(250) DEFAULT NULL,
  `rune_poison` int(250) DEFAULT NULL,
  `rune_freeze` int(250) DEFAULT NULL,
  `rune_zap` int(250) DEFAULT NULL,
  `rune_curse` int(250) DEFAULT NULL,
  `rune_cripple` int(250) DEFAULT NULL,
  `rune_parry` int(250) DEFAULT NULL,
  `rune_dodge` int(250) DEFAULT NULL,
  `rune_adrenaline` int(250) DEFAULT NULL,
  `rune_numb` int(250) DEFAULT NULL,
  `rune_cleanse` int(250) DEFAULT NULL,
  `rune_bless` int(250) DEFAULT NULL,
  `rune_scavenge` int(250) DEFAULT NULL,
  `rune_gut` int(250) DEFAULT NULL,
  `rune_low_blow` int(250) DEFAULT NULL,
  `rune_divine` int(250) DEFAULT NULL,
  `rune_vamp` int(250) DEFAULT NULL,
  `rune_void` int(250) DEFAULT NULL,
  `UsedRunesBit` varchar(250) DEFAULT NULL,
  `UnlockedRunesBit` varchar(250) DEFAULT NULL,
  `tracker list` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `player_charms`
--

INSERT INTO `player_charms` (`player_guid`, `charm_points`, `charm_expansion`, `rune_wound`, `rune_enflame`, `rune_poison`, `rune_freeze`, `rune_zap`, `rune_curse`, `rune_cripple`, `rune_parry`, `rune_dodge`, `rune_adrenaline`, `rune_numb`, `rune_cleanse`, `rune_bless`, `rune_scavenge`, `rune_gut`, `rune_low_blow`, `rune_divine`, `rune_vamp`, `rune_void`, `UsedRunesBit`, `UnlockedRunesBit`, `tracker list`) VALUES
(6, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(3, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(5, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(7, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(4, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(2, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(8, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(9, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', ''),
(10, '0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0', '0', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_deaths`
--

CREATE TABLE `player_deaths` (
  `player_id` int(11) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `killed_by` varchar(255) NOT NULL,
  `is_player` tinyint(1) NOT NULL DEFAULT 1,
  `mostdamage_by` varchar(100) NOT NULL,
  `mostdamage_is_player` tinyint(1) NOT NULL DEFAULT 0,
  `unjustified` tinyint(1) NOT NULL DEFAULT 0,
  `mostdamage_unjustified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `player_deaths`
--

INSERT INTO `player_deaths` (`player_id`, `time`, `level`, `killed_by`, `is_player`, `mostdamage_by`, `mostdamage_is_player`, `unjustified`, `mostdamage_unjustified`) VALUES
(10, 1673382165, 110, 'a pre empe', 0, 'a pre empe', 0, 0, 0),
(10, 1673440032, 1500, 'Bazir', 0, 'Bazir', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_depotitems`
--

CREATE TABLE `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range eg 0-100 will be reserved for depot lockers and all > 100 will be then normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_depotlockeritems`
--

CREATE TABLE `player_depotlockeritems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range eg 0-100 will be reserved for depot lockers and all > 100 will be then normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(5) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_display`
--

CREATE TABLE `player_display` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `account` int(11) NOT NULL DEFAULT 0,
  `outfit` int(11) NOT NULL DEFAULT 0,
  `inventory` int(11) NOT NULL DEFAULT 0,
  `health_mana` int(11) NOT NULL DEFAULT 0,
  `skills` int(11) NOT NULL DEFAULT 0,
  `bonus` int(11) NOT NULL DEFAULT 0,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_former_names`
--

CREATE TABLE `player_former_names` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `former_name` varchar(35) NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_hirelings`
--

CREATE TABLE `player_hirelings` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `sex` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0,
  `lookbody` int(11) NOT NULL DEFAULT 0,
  `lookfeet` int(11) NOT NULL DEFAULT 0,
  `lookhead` int(11) NOT NULL DEFAULT 0,
  `looklegs` int(11) NOT NULL DEFAULT 0,
  `looktype` int(11) NOT NULL DEFAULT 136
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_inboxitems`
--

CREATE TABLE `player_inboxitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_items`
--

CREATE TABLE `player_items` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `sid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `player_items`
--

INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`, `attributes`) VALUES
(10, 1, 101, 5903, 1, ''),
(10, 2, 102, 3572, 1, ''),
(10, 3, 103, 2853, 1, 0x24022600000080),
(10, 4, 104, 34095, 1, ''),
(10, 5, 105, 3059, 1, ''),
(10, 6, 106, 34090, 1, ''),
(10, 7, 107, 3362, 1, ''),
(10, 8, 108, 3079, 1, ''),
(10, 10, 109, 2920, 1, ''),
(10, 11, 110, 23396, 1, 0x2400),
(10, 103, 111, 35288, 14400, 0x164038),
(10, 103, 112, 3420, 1, ''),
(10, 103, 113, 3043, 100, 0x0f64),
(10, 103, 114, 3420, 1, ''),
(10, 103, 115, 35287, 14400, 0x164038),
(10, 103, 116, 284, 20, 0x0f14),
(10, 103, 117, 19249, 1, ''),
(10, 103, 118, 2854, 1, 0x2400),
(10, 110, 119, 23398, 1, 0x076900596f7520626f756768742074686973206974656d20696e207468652053746f72652e0a556e7772617020697420696e20796f7572206f776e20686f75736520746f206372656174652061203c726f6c6c65642d757020746f75726e616d656e74206361727065743e2e2501000000000000000800756e77726170696402ea7a000000000000),
(10, 110, 120, 3203, 30, 0x0f1e),
(10, 118, 121, 35288, 14400, 0x164038),
(10, 118, 122, 35287, 14400, 0x164038),
(10, 118, 123, 2855, 1, ''),
(10, 118, 124, 35285, 14400, 0x164038),
(10, 118, 125, 35285, 14400, 0x164038),
(10, 118, 126, 35290, 12927, 0x167f32),
(10, 118, 127, 35288, 14400, 0x164038),
(10, 118, 128, 284, 29, 0x0f1d),
(10, 118, 129, 23373, 75, 0x0f4b),
(10, 118, 130, 23373, 100, 0x0f64),
(10, 118, 131, 23373, 100, 0x0f64),
(10, 118, 132, 23373, 100, 0x0f64),
(10, 118, 133, 23373, 100, 0x0f64),
(10, 118, 134, 23373, 100, 0x0f64),
(10, 118, 135, 8778, 1, ''),
(10, 118, 136, 285, 10, 0x0f0a),
(10, 118, 137, 2854, 1, 0x2400),
(10, 118, 138, 5710, 1, ''),
(10, 118, 139, 3003, 1, ''),
(10, 123, 140, 3388, 1, ''),
(10, 123, 141, 3388, 1, ''),
(10, 123, 142, 35289, 14400, 0x164038),
(10, 123, 143, 35287, 14400, 0x164038),
(10, 123, 144, 35285, 14400, 0x164038),
(10, 137, 145, 3388, 1, ''),
(10, 137, 146, 3420, 1, ''),
(10, 137, 147, 23373, 100, 0x0f64),
(10, 137, 148, 23373, 100, 0x0f64),
(10, 137, 149, 3161, 99, 0x0f63),
(10, 137, 150, 9058, 1, 0x0f01),
(10, 137, 151, 8778, 1, ''),
(10, 137, 152, 8778, 1, ''),
(10, 137, 153, 8778, 1, ''),
(10, 137, 154, 8778, 1, ''),
(10, 137, 155, 284, 5, 0x0f05),
(10, 137, 156, 3155, 70, 0x0f46),
(10, 137, 157, 3155, 100, 0x0f64),
(10, 137, 158, 3155, 100, 0x0f64),
(10, 137, 159, 3155, 100, 0x0f64),
(10, 137, 160, 3155, 100, 0x0f64),
(10, 137, 161, 3155, 100, 0x0f64),
(10, 137, 162, 3155, 100, 0x0f64),
(10, 137, 163, 23373, 100, 0x0f64),
(10, 137, 164, 3003, 1, ''),
(9, 1, 101, 7992, 1, ''),
(9, 3, 102, 2854, 1, 0x24012600000080),
(9, 6, 103, 34085, 1, ''),
(9, 7, 104, 3389, 1, ''),
(9, 8, 105, 3549, 1, 0x1001d340001101),
(9, 11, 106, 23396, 1, 0x2400),
(9, 102, 107, 12305, 1, ''),
(9, 102, 108, 12305, 1, ''),
(9, 102, 109, 34090, 1, ''),
(9, 102, 110, 22724, 1, 0x0f01),
(9, 102, 111, 9019, 1, 0x10badb3600),
(9, 102, 112, 9019, 1, 0x1033ea3600),
(9, 102, 113, 9019, 1, 0x1090e53600),
(9, 102, 114, 9019, 1, 0x1014d53600),
(9, 102, 115, 284, 2, 0x0f02),
(9, 102, 116, 238, 100, 0x0f64),
(9, 102, 117, 12305, 1, ''),
(9, 102, 118, 9020, 1, ''),
(9, 102, 119, 3033, 2, 0x0f02),
(9, 102, 120, 3032, 8, 0x0f08),
(9, 102, 121, 3731, 3, 0x0f03),
(9, 102, 122, 5954, 1, 0x0f01),
(9, 102, 123, 7643, 3, 0x0f03),
(9, 102, 124, 2854, 1, 0x2400),
(9, 106, 125, 28545, 50, 0x163200),
(9, 106, 126, 23398, 1, 0x076100596f7520626f756768742074686973206974656d20696e207468652053746f72652e0a556e7772617020697420696e20796f7572206f776e20686f75736520746f206372656174652061203c6a6f757374696e67206561676c6520626162793e2e2501000000000000000800756e77726170696402e67a000000000000),
(9, 106, 127, 3203, 20, 0x0f14),
(9, 106, 128, 3504, 1, 0x181f003235307820416e696d61746520446561642052756e65207061636b6167652e),
(9, 106, 129, 28554, 246, 0x16f600),
(9, 106, 130, 23373, 54, 0x0f36),
(9, 124, 131, 2854, 1, 0x2400),
(9, 124, 132, 3161, 100, 0x0f64),
(9, 124, 133, 3160, 100, 0x0f64),
(9, 124, 134, 3155, 7, 0x0f07),
(9, 124, 135, 7992, 1, ''),
(9, 124, 136, 7992, 1, ''),
(9, 124, 137, 3155, 100, 0x0f64),
(9, 124, 138, 3155, 100, 0x0f64),
(9, 124, 139, 3155, 100, 0x0f64),
(9, 124, 140, 3155, 100, 0x0f64),
(9, 124, 141, 37109, 3, 0x0f03),
(9, 124, 142, 12305, 1, ''),
(9, 124, 143, 8778, 1, ''),
(9, 124, 144, 16252, 1, ''),
(9, 124, 145, 9693, 5, 0x0f05),
(9, 128, 146, 3203, 50, 0x0f32),
(9, 128, 147, 3203, 100, 0x0f64),
(9, 128, 148, 3203, 100, 0x0f64),
(9, 131, 149, 2854, 1, ''),
(9, 149, 150, 2854, 1, 0x2400),
(9, 150, 151, 3590, 1, 0x0f01),
(9, 150, 152, 2854, 1, 0x2400),
(9, 150, 153, 8778, 1, ''),
(9, 150, 154, 8778, 1, ''),
(9, 150, 155, 8778, 1, ''),
(9, 150, 156, 8778, 1, ''),
(9, 150, 157, 8778, 1, ''),
(9, 150, 158, 8778, 1, ''),
(9, 150, 159, 284, 1, 0x0f01),
(9, 150, 160, 12305, 1, ''),
(9, 150, 161, 9177, 1, ''),
(9, 150, 162, 919, 1, ''),
(9, 150, 163, 9170, 1, ''),
(9, 150, 164, 3180, 100, 0x0f64),
(9, 150, 165, 3165, 100, 0x0f64),
(9, 150, 166, 3192, 100, 0x0f64),
(9, 150, 167, 3160, 100, 0x0f64),
(9, 150, 168, 3161, 100, 0x0f64),
(9, 152, 169, 7643, 2, 0x0f02),
(9, 152, 170, 8778, 1, ''),
(9, 152, 171, 37317, 1, 0x0f01),
(9, 152, 172, 16127, 100, 0x0f64),
(9, 152, 173, 16126, 100, 0x0f64),
(9, 152, 174, 16125, 100, 0x0f64),
(9, 152, 175, 16123, 100, 0x0f64),
(9, 152, 176, 16122, 100, 0x0f64),
(9, 152, 177, 16124, 100, 0x0f64),
(9, 152, 178, 19249, 1, ''),
(9, 152, 179, 12509, 1, ''),
(9, 152, 180, 3725, 76, 0x0f4c),
(9, 152, 181, 3366, 1, ''),
(9, 152, 182, 238, 3, 0x0f03),
(9, 152, 183, 7642, 5, 0x0f05),
(9, 152, 184, 3308, 1, ''),
(9, 152, 185, 3456, 1, ''),
(9, 152, 186, 3003, 1, ''),
(9, 152, 187, 3457, 1, ''),
(9, 152, 188, 23373, 98, 0x0f62);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_kills`
--

CREATE TABLE `player_kills` (
  `player_id` int(11) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `target` int(11) NOT NULL,
  `unavenged` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_misc`
--

CREATE TABLE `player_misc` (
  `player_id` int(11) NOT NULL,
  `info` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `player_misc`
--

INSERT INTO `player_misc` (`player_id`, `info`) VALUES
(6, 0x7b7d),
(5, 0x7b7d),
(8, 0x7b7d),
(7, 0x7b7d),
(4, 0x7b7d),
(3, 0x7b7d),
(2, 0x7b7d),
(10, 0x7b7d),
(9, 0x7b7d);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_namelocks`
--

CREATE TABLE `player_namelocks` (
  `player_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `namelocked_at` bigint(20) NOT NULL,
  `namelocked_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_prey`
--

CREATE TABLE `player_prey` (
  `player_id` int(11) NOT NULL,
  `slot` tinyint(1) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `raceid` varchar(250) NOT NULL,
  `option` tinyint(1) NOT NULL,
  `bonus_type` tinyint(1) NOT NULL,
  `bonus_rarity` tinyint(1) NOT NULL,
  `bonus_percentage` varchar(250) NOT NULL,
  `bonus_time` varchar(250) NOT NULL,
  `free_reroll` bigint(20) NOT NULL,
  `monster_list` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `player_prey`
--

INSERT INTO `player_prey` (`player_id`, `slot`, `state`, `raceid`, `option`, `bonus_type`, `bonus_rarity`, `bonus_percentage`, `bonus_time`, `free_reroll`, `monster_list`) VALUES
(4, 0, 3, '0', 0, 2, 3, '19', '0', 1675182131531, 0x4f017100ba06490410029b05700368023e01),
(4, 1, 3, '0', 0, 3, 4, '22', '0', 1675182131532, 0x0f00a2021c077d0046024907db0024011900),
(4, 2, 0, '0', 0, 1, 5, '25', '0', 1675182131533, ''),
(3, 0, 3, '0', 0, 3, 2, '16', '0', 1673345073758, 0xfa03090072057c0041007802060189012701),
(3, 1, 3, '0', 0, 3, 7, '31', '0', 1673345073759, 0x3800d6080e0115000d013b00700039002600),
(3, 2, 0, '0', 0, 0, 3, '19', '0', 1673345073760, ''),
(2, 0, 3, '0', 0, 2, 6, '28', '0', 1675855990677, 0xb802fb03f505c802ea0541006d0220010f01),
(2, 1, 3, '0', 0, 0, 9, '37', '0', 1675855990679, 0xad073a0086070f029201b5013200dc001501),
(2, 2, 0, '0', 0, 3, 2, '16', '0', 1675855990681, ''),
(10, 0, 3, '0', 0, 1, 5, '25', '0', 1673447514762, 0xd608780111004d01000249017604d8052600),
(10, 1, 3, '0', 0, 0, 8, '34', '0', 1673447514764, 0xce05df02d60344019103c2066f036a003500),
(10, 2, 0, '0', 0, 3, 10, '40', '0', 1673447514765, ''),
(9, 0, 4, '0', 0, 2, 6, '28', '0', 1674845121496, 0x0e071404d2043600190767023d08e1058701),
(9, 1, 3, '0', 0, 0, 10, '40', '0', 1673265708000, 0xce034f006d0097031d070e0270020501b906),
(9, 2, 0, '0', 0, 2, 6, '28', '0', 1673265708002, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_preydata`
--

CREATE TABLE `player_preydata` (
  `player_id` int(11) NOT NULL,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_preytimes`
--

CREATE TABLE `player_preytimes` (
  `player_id` int(11) NOT NULL,
  `bonus_type1` int(11) NOT NULL,
  `bonus_value1` int(11) NOT NULL,
  `bonus_name1` varchar(50) NOT NULL,
  `bonus_type2` int(11) NOT NULL,
  `bonus_value2` int(11) NOT NULL,
  `bonus_name2` varchar(50) NOT NULL,
  `bonus_type3` int(11) NOT NULL,
  `bonus_value3` int(11) NOT NULL,
  `bonus_name3` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `player_preytimes`
--

INSERT INTO `player_preytimes` (`player_id`, `bonus_type1`, `bonus_value1`, `bonus_name1`, `bonus_type2`, `bonus_value2`, `bonus_name2`, `bonus_type3`, `bonus_value3`, `bonus_name3`) VALUES
(6, 0, 0, '', 0, 0, '', 0, 0, ''),
(3, 0, 0, '', 0, 0, '', 0, 0, ''),
(5, 0, 0, '', 0, 0, '', 0, 0, ''),
(7, 0, 0, '', 0, 0, '', 0, 0, ''),
(4, 0, 0, '', 0, 0, '', 0, 0, ''),
(2, 0, 0, '', 0, 0, '', 0, 0, ''),
(8, 0, 0, '', 0, 0, '', 0, 0, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_rewards`
--

CREATE TABLE `player_rewards` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_spells`
--

CREATE TABLE `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_stash`
--

CREATE TABLE `player_stash` (
  `player_id` int(16) NOT NULL,
  `item_id` int(16) NOT NULL,
  `item_count` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_storage`
--

CREATE TABLE `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `key` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `value` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `player_storage`
--

INSERT INTO `player_storage` (`player_id`, `key`, `value`) VALUES
(9, 0, 1675042241),
(9, 2500, 0),
(9, 8589, 1),
(9, 10000, 3420),
(9, 10001, 3043),
(9, 10002, 3366),
(9, 10003, 3388),
(9, 10004, 3035),
(9, 10107, 1674674079),
(9, 10108, 97),
(9, 10109, -2),
(9, 12149, 0),
(9, 12330, 1),
(9, 12332, 13),
(9, 12333, 3),
(9, 12450, 6),
(9, 13412, 1675781700),
(9, 13413, 1675695300),
(9, 13414, 2),
(9, 14897, 4),
(9, 14898, 2),
(9, 14899, 1675871700),
(9, 17101, 0),
(9, 20000, 21),
(9, 20001, 5793),
(9, 20002, 1),
(9, 20067, 9),
(9, 30000, 1674851361),
(9, 30023, 1),
(9, 30029, 0),
(9, 30051, 1676248541),
(9, 30057, 1),
(9, 30058, 1),
(9, 32943, 1),
(9, 38412, 7),
(9, 42701, 29),
(9, 42703, 3),
(9, 42704, 4),
(9, 42705, 1),
(9, 42706, 1),
(9, 42707, 1),
(9, 42708, 3),
(9, 42709, 2),
(9, 42710, 2),
(9, 42711, 1),
(9, 42712, 1),
(9, 42713, 1),
(9, 42715, 1),
(9, 42716, 1),
(9, 42717, 5),
(9, 42718, 2),
(9, 42720, 2),
(9, 42721, 3),
(9, 42724, 2),
(9, 42725, 1),
(9, 42729, 12),
(9, 44958, 1675175823),
(9, 45751, 1),
(9, 45752, 16),
(9, 46001, 1),
(9, 46002, 1),
(9, 48900, 100),
(9, 48901, 100),
(9, 50080, 1),
(9, 50081, 10),
(9, 50082, 2),
(9, 50083, 2),
(9, 50090, 10),
(9, 50091, 2),
(9, 50092, 2),
(9, 50115, 10),
(9, 50116, 3),
(9, 50117, 2),
(9, 50118, 2),
(9, 50139, 10),
(9, 50141, 10),
(9, 50143, 30),
(9, 50200, 7),
(9, 50203, 1),
(9, 50210, 1),
(9, 50225, 1),
(9, 50226, 1),
(9, 50230, 1),
(9, 50231, 1),
(9, 50240, 1),
(9, 50245, 1),
(9, 50250, 1),
(9, 50251, 1),
(9, 50252, 1),
(9, 50255, 1),
(9, 50256, 1),
(9, 50257, 1),
(9, 50258, 1),
(9, 50470, 1),
(9, 50471, 1),
(9, 50472, 1),
(9, 50473, 1),
(9, 50474, 1),
(9, 50475, 1),
(9, 50486, 1),
(9, 50488, 1),
(9, 50490, 1),
(9, 50492, 1),
(9, 50494, 1),
(9, 50496, 1),
(9, 50498, 1),
(9, 50501, 1),
(9, 50506, 1),
(9, 50530, 61),
(9, 50541, 2),
(9, 50600, 2),
(9, 50601, 5),
(9, 50602, 3),
(9, 50603, 3),
(9, 50604, 3),
(9, 50605, 2),
(9, 50606, 1),
(9, 50620, 2),
(9, 50630, 1),
(9, 50631, 2),
(9, 50632, 2),
(9, 50633, 2),
(9, 50634, 3),
(9, 50640, 1),
(9, 50641, 3),
(9, 50642, 3),
(9, 50643, 3),
(9, 50660, 23),
(9, 50662, 5),
(9, 50663, 2),
(9, 50672, 1440),
(9, 50699, 2),
(9, 50700, 2),
(9, 50701, 2),
(9, 50850, 1),
(9, 50852, 3000),
(9, 51052, 0),
(9, 51060, 1),
(9, 51061, 18),
(9, 51110, 25),
(9, 51111, 7),
(9, 51112, 3),
(9, 51113, 6),
(9, 51114, 3),
(9, 51115, 3),
(9, 51116, 3),
(9, 51117, 1),
(9, 51120, 1),
(9, 51121, 1),
(9, 51123, 1),
(9, 51124, 1),
(9, 51125, 1),
(9, 51140, 1),
(9, 51141, 3),
(9, 51142, 3),
(9, 51143, 3),
(9, 51160, 12),
(9, 51161, 3),
(9, 51162, 5),
(9, 51163, 3),
(9, 51164, 2),
(9, 51165, 6),
(9, 51166, 8),
(9, 51167, 3),
(9, 51168, 4),
(9, 51169, 2),
(9, 51170, 2),
(9, 51171, 2),
(9, 51172, 6),
(9, 51210, 51),
(9, 51211, 6),
(9, 51212, 8),
(9, 51213, 6),
(9, 51214, 6),
(9, 51215, 8),
(9, 51216, 5),
(9, 51217, 5),
(9, 51218, 4),
(9, 51219, 2),
(9, 51220, 1),
(9, 51221, 1),
(9, 51222, 1),
(9, 51223, 1),
(9, 51224, 1),
(9, 51225, 1),
(9, 51228, 1),
(9, 51229, 1),
(9, 51231, 1),
(9, 51232, 1),
(9, 51234, 1),
(9, 51235, 1),
(9, 51236, 1),
(9, 51237, 1),
(9, 51238, 1),
(9, 51239, 1),
(9, 51242, 1),
(9, 51243, 1),
(9, 51244, 1),
(9, 51247, 1),
(9, 51248, 1),
(9, 51262, 3),
(9, 51263, 5),
(9, 51264, 3),
(9, 51266, 3),
(9, 51267, 1),
(9, 51268, 1),
(9, 51269, 1),
(9, 51300, 29),
(9, 51301, 3),
(9, 51302, 3),
(9, 51303, 3),
(9, 51304, 3),
(9, 51305, 3),
(9, 51306, 4),
(9, 51307, 6),
(9, 51308, 2),
(9, 51309, 2),
(9, 51310, 1),
(9, 51340, 1),
(9, 51341, 2),
(9, 51342, 2),
(9, 51343, 12),
(9, 51394, 8),
(9, 51396, 4),
(9, 51397, 2),
(9, 51398, 1),
(9, 51450, 1),
(9, 51453, 1),
(9, 51480, 1),
(9, 51486, 1),
(9, 51540, 3),
(9, 51541, 3),
(9, 51542, 2),
(9, 51543, 1),
(9, 51544, 3),
(9, 51545, 5),
(9, 51546, 1),
(9, 51547, 1),
(9, 51548, 2),
(9, 51549, 1),
(9, 51550, 4),
(9, 51590, 1),
(9, 51591, 1),
(9, 51592, 1),
(9, 51593, 1),
(9, 51594, 1),
(9, 51595, 1),
(9, 51596, 1),
(9, 51597, 1),
(9, 51598, 1),
(9, 51700, 3),
(9, 51701, 3),
(9, 51702, 1),
(9, 51703, 11),
(9, 51704, 11),
(9, 51705, 11),
(9, 51706, 11),
(9, 51712, 1),
(9, 52146, 2),
(9, 55136, 1),
(9, 55137, 1),
(9, 55145, 21),
(9, 55146, 2),
(9, 55148, 6),
(9, 55154, 1),
(9, 55226, 1),
(9, 55227, 1),
(9, 55230, 1),
(9, 55233, 1),
(9, 56395, 2),
(9, 75148, 1676253443),
(9, 77124, 1675093322),
(9, 81056, 2),
(9, 81057, 1),
(9, 91143, 1),
(9, 91146, 1),
(9, 100157, 1),
(9, 515206, 1),
(9, 515207, 2),
(9, 515208, 3),
(9, 515209, 3),
(9, 891642, 0),
(9, 998899, 1),
(9, 10001001, 9240579),
(9, 10001002, 8716291),
(9, 10001003, 9306115),
(9, 10001004, 8781827),
(9, 10001005, 9633795),
(9, 10001006, 9371651),
(9, 10001007, 9699331),
(9, 10001008, 9437187),
(9, 10001009, 9764867),
(9, 10001010, 9502723),
(9, 10001011, 9830403),
(9, 10001012, 9568259),
(9, 10001013, 10158083),
(9, 10001014, 9895939),
(9, 10001015, 10223619),
(9, 10001016, 9961475),
(9, 10001017, 10289155),
(9, 10001018, 10027011),
(9, 10001019, 10354691),
(9, 10001020, 10092547),
(9, 10001021, 16515075),
(9, 10001022, 16449539),
(9, 10001023, 17694723),
(9, 10001024, 17891331),
(9, 10001025, 17629187),
(9, 10001026, 17563651),
(9, 10001027, 18874371),
(9, 10001028, 18939907),
(9, 10001029, 21233667),
(9, 10001030, 21299203),
(9, 10001031, 22020099),
(9, 10001032, 21954563),
(9, 10001033, 23986179),
(9, 10001034, 24051715),
(9, 10001035, 18284547),
(9, 10001036, 18219011),
(9, 10001037, 8912899),
(9, 10001038, 8388611),
(9, 10001039, 8978435),
(9, 10001040, 8454147),
(9, 10001041, 9109507),
(9, 10001042, 8585219),
(9, 10001043, 9175043),
(9, 10001044, 8650755),
(9, 10001045, 8519681),
(9, 10001046, 9043969),
(9, 10002011, 193),
(9, 61305017, 2),
(9, 61305026, 6),
(9, 61305028, 1),
(9, 61305035, 129),
(9, 61305038, 2),
(9, 61305049, 12),
(9, 61305078, 1),
(9, 61305079, 1),
(9, 61305118, 1),
(9, 61305251, 3),
(9, 61305255, 3),
(9, 61305268, 3),
(9, 61305281, 2),
(9, 61305282, 1),
(9, 61305284, 3),
(9, 61305285, 1),
(9, 61305286, 1),
(9, 61305294, 3),
(9, 61305296, 5),
(9, 61305298, 3),
(9, 61305314, 4),
(9, 61305321, 1),
(9, 61305439, 2),
(9, 61305465, 8),
(9, 61305502, 7),
(9, 61305516, 8),
(9, 61305523, 5),
(9, 61306105, 1),
(9, 61306196, 27),
(9, 61308333, 2),
(9, 61308334, 1),
(9, 61308335, 2),
(9, 61308336, 2),
(9, 61308337, 1),
(9, 61308339, 2),
(9, 61308340, 6),
(10, 0, 0),
(10, 8589, 1),
(10, 10107, 1674674063),
(10, 10108, 97),
(10, 10109, 2),
(10, 12149, 0),
(10, 13412, 1675176900),
(10, 13413, 1675781700),
(10, 13414, 2),
(10, 14897, 5),
(10, 14898, 0),
(10, 14899, 1675266900),
(10, 14903, 0),
(10, 17101, 0),
(10, 20000, 17),
(10, 20001, 3181),
(10, 20067, 146),
(10, 30000, 1674494031),
(10, 30023, 1),
(10, 30026, 1674559877),
(10, 30029, 0),
(10, 30051, 1674769768),
(10, 30057, 1),
(10, 30058, 1),
(10, 38412, 144),
(10, 44958, 1675083810),
(10, 46001, 1),
(10, 46002, 1),
(10, 48900, 0),
(10, 48901, 0),
(10, 74123, 20),
(10, 75148, 1676253095),
(10, 81056, 0),
(10, 81057, 1),
(10, 91143, 1),
(10, 891642, 0),
(10, 998899, 1),
(10, 10003001, 65142784),
(10, 61305022, 7),
(10, 61305026, 8),
(10, 61305035, 9),
(10, 61305251, 3),
(10, 61305296, 3),
(10, 61308333, 1),
(10, 61308335, 2),
(10, 61308336, 1),
(10, 61308340, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_taskhunt`
--

CREATE TABLE `player_taskhunt` (
  `player_id` int(11) NOT NULL,
  `slot` tinyint(1) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `raceid` varchar(250) NOT NULL,
  `upgrade` tinyint(1) NOT NULL,
  `rarity` tinyint(1) NOT NULL,
  `kills` varchar(250) NOT NULL,
  `disabled_time` bigint(20) NOT NULL,
  `free_reroll` bigint(20) NOT NULL,
  `monster_list` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `player_taskhunt`
--

INSERT INTO `player_taskhunt` (`player_id`, `slot`, `state`, `raceid`, `upgrade`, `rarity`, `kills`, `disabled_time`, `free_reroll`, `monster_list`) VALUES
(4, 0, 2, '0', 0, 1, '0', 0, 1675182131533, 0x0f008f02f905fc05020391035302f8000600),
(4, 1, 2, '0', 0, 1, '0', 0, 1675182131536, 0x7a037c001d028a041300f300c2030d027a04),
(4, 2, 0, '0', 0, 1, '0', 0, 1675182131539, ''),
(3, 0, 2, '0', 0, 1, '0', 0, 1673345073760, 0xc602ff002c0801021b000e073f014d011d03),
(3, 1, 2, '0', 0, 1, '0', 0, 1673345073761, 0xcf01f1041104fc0531000300e1054e004f01),
(3, 2, 0, '0', 0, 1, '0', 0, 1673345073763, ''),
(2, 0, 2, '0', 0, 1, '0', 0, 1675855990681, 0x1a009c074d01ee00880703007e033e01ba02),
(2, 1, 2, '0', 0, 1, '0', 0, 1675855990682, 0x390050001304ad0464034e017604f4071500),
(2, 2, 0, '0', 0, 1, '0', 0, 1675855990683, ''),
(10, 0, 2, '0', 0, 1, '0', 0, 1673447514765, 0x2e02fa002b08db00410021063200ff001c00),
(10, 1, 2, '0', 0, 1, '0', 0, 1673447514767, 0xe302e9021f011c01420120070a037900f701),
(10, 2, 0, '0', 0, 1, '0', 0, 1673447514769, ''),
(9, 0, 2, '0', 0, 1, '0', 0, 1673265708002, 0x940308077a03680012047c04df020e041c00),
(9, 1, 2, '0', 0, 1, '0', 0, 1673265708005, 0x1c01750005008801c9061d009f057b04d702),
(9, 2, 0, '0', 0, 1, '0', 0, 1673265708007, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `prey_slots`
--

CREATE TABLE `prey_slots` (
  `player_id` int(11) NOT NULL,
  `num` smallint(2) NOT NULL,
  `state` smallint(2) NOT NULL DEFAULT 1,
  `unlocked` tinyint(1) NOT NULL DEFAULT 0,
  `current` varchar(40) NOT NULL DEFAULT '',
  `monster_list` varchar(360) NOT NULL,
  `free_reroll_in` int(11) NOT NULL DEFAULT 0,
  `time_left` smallint(5) NOT NULL DEFAULT 0,
  `next_use` int(11) NOT NULL DEFAULT 0,
  `bonus_type` smallint(3) NOT NULL,
  `bonus_value` smallint(3) NOT NULL DEFAULT 0,
  `bonus_grade` smallint(3) NOT NULL DEFAULT 0,
  `tick` smallint(3) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `quickloot_containers`
--

CREATE TABLE `quickloot_containers` (
  `player_id` int(11) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `cid` int(10) UNSIGNED NOT NULL,
  `sid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sellchar`
--

CREATE TABLE `sellchar` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `vocation` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `status` varchar(40) NOT NULL,
  `oldid` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sell_players`
--

CREATE TABLE `sell_players` (
  `player_id` int(11) NOT NULL,
  `account` int(11) NOT NULL,
  `create` bigint(20) NOT NULL,
  `createip` bigint(20) NOT NULL,
  `coin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sell_players_history`
--

CREATE TABLE `sell_players_history` (
  `player_id` int(11) NOT NULL,
  `accountold` int(11) NOT NULL,
  `accountnew` int(11) NOT NULL,
  `create` bigint(20) NOT NULL,
  `createip` bigint(20) NOT NULL,
  `buytime` bigint(20) NOT NULL,
  `buyip` bigint(20) NOT NULL,
  `coin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `server_config`
--

CREATE TABLE `server_config` (
  `config` varchar(50) NOT NULL,
  `value` varchar(256) NOT NULL DEFAULT '',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `server_config`
--

INSERT INTO `server_config` (`config`, `value`, `timestamp`) VALUES
('db_version', '0', '2023-02-13 14:07:03'),
('double', 'desactived', '2023-02-13 14:07:03'),
('motd_hash', '7fddc3e9cdb48371cfa308f527a97a292705e325', '2023-02-13 14:07:03'),
('motd_num', '4', '2023-02-13 14:07:03'),
('players_record', '2', '2023-02-13 14:07:03');

-- --------------------------------------------------------

--
-- Estrutura da tabela `snake_game`
--

CREATE TABLE `snake_game` (
  `id` int(11) NOT NULL,
  `guid` int(11) NOT NULL,
  `points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `snowballwar`
--

CREATE TABLE `snowballwar` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  `data` varchar(255) NOT NULL,
  `hora` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `store_history`
--

CREATE TABLE `store_history` (
  `id` int(11) NOT NULL,
  `account_id` int(11) UNSIGNED NOT NULL,
  `mode` smallint(2) NOT NULL DEFAULT 0,
  `description` varchar(3500) NOT NULL,
  `coin_type` tinyint(1) NOT NULL DEFAULT 0,
  `coin_amount` int(12) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `store_history`
--

INSERT INTO `store_history` (`id`, `account_id`, `mode`, `description`, `coin_type`, `coin_amount`, `time`, `timestamp`) VALUES
(1, 1, 0, 'All Regular Blessings', 0, -650, 1641852798, 0),
(2, 2, 0, '30 Days of Premium Time', 0, -250, 1673294594, 0),
(3, 2, 0, 'Animate Dead Rune', 0, -75, 1673294610, 0),
(4, 2, 0, 'XP Boost', 0, -30, 1673376500, 0),
(5, 3, 0, '[Monster Hunt] - Winner', 2, 100, 1674495410, 0),
(6, 3, 0, '[Monster Hunt] - Winner', 2, 100, 1674496070, 0),
(7, 3, 0, 'Tournament Carpet', 2, -70, 1674580468, 0),
(8, 2, 0, 'Jousting Eagle Baby', 2, -800, 1674580543, 0),
(9, 3, 0, '[Snowball Event] - Winner', 2, 300, 1674674188, 0),
(10, 2, 0, '[SafeZone Event] - Winner', 2, 300, 1674755600, 0),
(11, 2, 0, '[SafeZone Event] - Winner', 2, 300, 1674756761, 0),
(12, 2, 0, '[SafeZone Event] - Winner', 2, 300, 1674759662, 0),
(13, 2, 0, '[SafeZone Event] - Winner', 2, 300, 1674759979, 0),
(14, 3, 0, '[SafeZone Event] - Winner', 2, 300, 1674760442, 0),
(15, 2, 0, '[SafeZone Event] - Winner', 2, 300, 1674761066, 0),
(16, 3, 0, '[SafeZone Event] - Winner', 2, 300, 1674762541, 0),
(17, 2, 0, '[SafeZone Event] - Winner', 2, 300, 1674763078, 0),
(18, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1675038800, 0),
(19, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1675039160, 0),
(20, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1675086646, 0),
(21, 2, 0, '[Monster Hunt] - Winner', 2, 300, 1675087246, 0),
(22, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1675087426, 0),
(23, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1675175136, 0),
(24, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1675261325, 0),
(25, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1675261385, 0),
(26, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1675269928, 0),
(27, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1675269988, 0),
(28, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1675273648, 0),
(29, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1675277308, 0),
(30, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1675280968, 0),
(31, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1675701178, 0),
(32, 3, 0, '[Online Time] Tournament Coins', 2, 10, 1675722485, 0),
(33, 2, 0, '[Online Time] Tournament Coins', 2, 10, 1676246925, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `s_attributes`
--

CREATE TABLE `s_attributes` (
  `item_id` int(11) NOT NULL,
  `attack` varchar(11) DEFAULT NULL,
  `armor` varchar(11) DEFAULT NULL,
  `defense` varchar(11) DEFAULT NULL,
  `extraDef` varchar(4) DEFAULT NULL,
  `range` varchar(11) DEFAULT NULL,
  `speed` varchar(4) DEFAULT NULL,
  `elementFire` varchar(11) DEFAULT NULL,
  `elementIce` varchar(11) DEFAULT NULL,
  `elementEarth` varchar(11) DEFAULT NULL,
  `elementEnergy` varchar(11) DEFAULT NULL,
  `skillShield` varchar(4) DEFAULT NULL,
  `skillDist` varchar(4) DEFAULT NULL,
  `skillFist` varchar(4) DEFAULT NULL,
  `skillClub` varchar(4) DEFAULT NULL,
  `skillAxe` varchar(4) DEFAULT NULL,
  `skillSword` varchar(4) DEFAULT NULL,
  `magicLevelPoints` varchar(4) DEFAULT NULL,
  `absorbPercentAll` varchar(3) DEFAULT NULL,
  `absorbPercentFire` varchar(3) DEFAULT NULL,
  `absorbPercentEarth` varchar(3) DEFAULT NULL,
  `absorbPercentEnergy` varchar(3) DEFAULT NULL,
  `absorbPercentIce` varchar(3) DEFAULT NULL,
  `absorbPercentDeath` varchar(3) DEFAULT NULL,
  `absorbPercentHoly` varchar(3) DEFAULT NULL,
  `absorbPercentPhysical` varchar(3) DEFAULT NULL,
  `absorbPercentManaDrain` varchar(3) DEFAULT NULL,
  `absorbPercentLifeDrain` varchar(3) DEFAULT NULL,
  `charges` varchar(11) DEFAULT NULL,
  `duration` varchar(11) DEFAULT NULL,
  `preventDrop` varchar(11) DEFAULT NULL,
  `containerSize` varchar(11) DEFAULT NULL,
  `hitChance` varchar(11) DEFAULT NULL,
  `shootType` varchar(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `s_items`
--

CREATE TABLE `s_items` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `descr` text DEFAULT NULL,
  `weight` int(11) NOT NULL,
  `itemid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `ticket_subject` varchar(255) DEFAULT NULL,
  `ticket_author` varchar(255) DEFAULT NULL,
  `ticket_author_acc_id` int(11) NOT NULL,
  `ticket_last_reply` varchar(11) DEFAULT NULL,
  `ticket_admin_reply` int(11) DEFAULT NULL,
  `ticket_date` varchar(255) DEFAULT NULL,
  `ticket_ended` varchar(255) DEFAULT NULL,
  `ticket_status` varchar(255) DEFAULT NULL,
  `ticket_category` varchar(255) DEFAULT NULL,
  `ticket_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tickets_reply`
--

CREATE TABLE `tickets_reply` (
  `reply_id` int(11) NOT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `reply_author` varchar(255) DEFAULT NULL,
  `reply_message` varchar(255) DEFAULT NULL,
  `reply_date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tile_store`
--

CREATE TABLE `tile_store` (
  `house_id` int(11) NOT NULL,
  `data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tile_store`
--

INSERT INTO `tile_store` (`house_id`, `data`) VALUES
(1, 0xea03c6040701000000412000),
(1, 0xe803cb040701000000e00200),
(1, 0xe903cb040701000000e10200),
(2, 0xdf03cb040701000000e00200),
(2, 0xe203c6040701000000412000),
(2, 0xe003cb040701000000e10200),
(3, 0xd903c6040701000000412000),
(3, 0xda03cb040701000000e00200),
(3, 0xdb03cb040701000000e10200),
(4, 0xcd03cb040701000000e00200),
(4, 0xce03cb040701000000e10200),
(4, 0xd003c6040701000000412000),
(5, 0xbf03c9040701000000240900),
(5, 0xc003c6040701000000412000),
(5, 0xc203c7040701000000e00200),
(5, 0xc303c7040701000000e10200),
(5, 0xc103c80407010000003f2000),
(6, 0xb403c6040701000000412000),
(6, 0xb603c7040701000000e00200),
(6, 0xb703c7040701000000e10200),
(6, 0xb303c9040701000000240900),
(6, 0xb503c80407010000003f2000),
(7, 0xea03be040601000000412000),
(7, 0xe903c1040601000000e00200),
(7, 0xea03c1040601000000e10200),
(8, 0xdc03b3040601000000e00200),
(8, 0xdd03b3040601000000e10200),
(8, 0xdf03b8040601000000412000),
(9, 0xdd03bc040601000000412000),
(9, 0xda03c0040601000000de0200),
(9, 0xda03c1040601000000df0200),
(10, 0xd603b3040601000000e00200),
(10, 0xd703b3040601000000e10200),
(10, 0xd403b8040601000000412000),
(11, 0xea03c6040601000000412000),
(11, 0xec03ca040601000000de0200),
(11, 0xec03cb040601000000df0200),
(12, 0xdf03ca040601000000de0200),
(12, 0xdf03cb040601000000df0200),
(12, 0xe203c6040601000000412000),
(13, 0xd903c6040601000000412000),
(13, 0xdb03ca040601000000de0200),
(13, 0xdb03cb040601000000df0200),
(14, 0xbd03ca040601000000de0200),
(14, 0xbd03cb040601000000df0200),
(14, 0xc203c90406010000003f2000),
(15, 0xb203c7040601000000e00200),
(15, 0xb303c7040601000000e10200),
(15, 0xb603c90406010000003f2000),
(16, 0xa503c6040701000000412000),
(16, 0xa203ca040701000000de0200),
(16, 0xa203cb040701000000df0200),
(17, 0xa203bf0407010000003f2000),
(17, 0xa503bf0407010000003f2000),
(17, 0xa003c1040701000000e00200),
(17, 0xa103c1040701000000e10200),
(18, 0xa003b3040701000000e00200),
(18, 0xa103b3040701000000e10200),
(18, 0xa103b5040701000000412000),
(18, 0xa503b60407010000003f2000),
(19, 0xa003ab040701000000de0200),
(19, 0xa003ac040701000000df0200),
(19, 0xa503ad0407010000003f2000),
(20, 0xab03af040701000000de0200),
(20, 0xae03ac040701000000412000),
(20, 0xab03b0040701000000df0200),
(21, 0xa103a0040701000000e00200),
(21, 0xa203a0040701000000e10200),
(21, 0xa203a3040701000000412000),
(21, 0xa603a40407010000003f2000),
(22, 0xaf03a0040701000000de0200),
(22, 0xaf03a1040701000000df0200),
(22, 0xb103a5040701000000412000),
(23, 0xa10398040701000000e00200),
(23, 0xa20398040701000000e10200),
(23, 0xa6039a0407010000003f2000),
(24, 0xab038a040601000000de0200),
(24, 0xab038b040601000000df0200),
(24, 0xad038a040601000000de0200),
(24, 0xad038b040601000000df0200),
(24, 0xae038a040601000000de0200),
(24, 0xae038b040601000000df0200),
(24, 0xa6038d040701000000de0200),
(24, 0xa6038e040701000000df0200),
(24, 0xa9038f0407010000003f2000),
(24, 0xae038e040601000000412000),
(24, 0xb0038a040601000000de0200),
(24, 0xb0038b040601000000df0200),
(24, 0xb2038f0407010000003f2000),
(24, 0xb5038d040701000000de0200),
(24, 0xb5038e040701000000df0200),
(24, 0xae0396040701000000412000),
(25, 0xbc038c040701000000412000),
(25, 0xb90391040701000000de0200),
(25, 0xb90392040701000000df0200),
(26, 0xc20393040701000000e00200),
(26, 0xc30393040701000000e10200),
(26, 0xc80393040701000000e00200),
(26, 0xc90393040701000000e10200),
(26, 0xc60396040701000000412000),
(26, 0xc60399040701000000412000),
(27, 0xb90396040701000000de0200),
(27, 0xb90397040701000000df0200),
(27, 0xbc039c040701000000412000),
(28, 0xcf038f040701000000de0200),
(28, 0xd2038f040701000000de0200),
(28, 0xcf0390040701000000df0200),
(28, 0xd20390040701000000df0200),
(28, 0xd30395040701000000412000),
(29, 0xc20389040701000000de0200),
(29, 0xc2038a040701000000df0200),
(29, 0xc50389040701000000de0200),
(29, 0xc5038a040701000000df0200),
(29, 0xc4038c040701000000412000),
(29, 0xca038d0407010000003f2000),
(30, 0xcd0387040701000000de0200),
(30, 0xcd0388040701000000df0200),
(30, 0xd0038b040701000000412000),
(31, 0xd60387040701000000de0200),
(31, 0xd60388040701000000df0200),
(31, 0xd9038b040701000000412000),
(32, 0xdf0387040701000000de0200),
(32, 0xdf0388040701000000df0200),
(32, 0xe2038b040701000000412000),
(33, 0xdc038f040701000000de0200),
(33, 0xe2038f040701000000de0200),
(33, 0xdc0390040701000000df0200),
(33, 0xdf0395040701000000412000),
(33, 0xe20390040701000000df0200),
(34, 0xe80392040701000000412000),
(34, 0xef0392040701000000412000),
(34, 0xe60395040601000000e60200),
(34, 0xe60396040601000000e70200),
(34, 0xea0395040601000000e60200),
(34, 0xea0396040601000000e70200),
(34, 0xeb0397040701000000412000),
(34, 0xec0395040601000000e60200),
(34, 0xec0396040601000000e70200),
(34, 0xf00395040601000000e60200),
(34, 0xf00396040601000000e70200),
(35, 0xf90394040701000000de0200),
(35, 0xf90395040701000000df0200),
(35, 0xf80398040701000000412000),
(36, 0x010494040701000000de0200),
(36, 0x010495040701000000df0200),
(36, 0x000498040701000000412000),
(37, 0x090494040701000000de0200),
(37, 0x090495040701000000df0200),
(37, 0x080498040701000000412000),
(38, 0x070488040701000000e00200),
(38, 0x080488040701000000e10200),
(38, 0x090488040701000000e00200),
(38, 0x0a0488040701000000e10200),
(38, 0x09048c040701000000412000),
(38, 0x0b0490040701000000412000),
(39, 0x0a049d040701000000de0200),
(39, 0x0a049e040701000000df0200),
(39, 0x0f04a00407010000003f2000),
(40, 0x06049d040701000000de0200),
(40, 0x06049e040701000000df0200),
(40, 0x0104a00407010000003f2000),
(41, 0xf9039d040701000000de0200),
(41, 0xf9039e040701000000df0200),
(41, 0xfe039e0407010000003f2000),
(42, 0xf903a1040701000000de0200),
(42, 0xf903a2040701000000df0200),
(42, 0xfe03a20407010000003f2000),
(43, 0xf1039e0407010000003f2000),
(43, 0xf6039d040701000000de0200),
(43, 0xf6039e040701000000df0200),
(44, 0xf103a20407010000003f2000),
(44, 0xf603a1040701000000de0200),
(44, 0xf603a2040701000000df0200),
(45, 0xe5039a040701000000de0200),
(45, 0xe5039b040701000000df0200),
(45, 0xe8039f040701000000412000),
(46, 0xe903a3040701000000e00200),
(46, 0xea03a3040701000000e10200),
(46, 0xe603a5040701000000412000),
(46, 0xe903a8040701000000412000),
(47, 0xe703ac040601000000de0200),
(47, 0xe703ad040601000000df0200),
(47, 0xe503af040701000000412000),
(48, 0xee03ad0407010000003f2000),
(48, 0xf103ab040701000000e00200),
(48, 0xf203ab040701000000e10200),
(49, 0xf803ab040701000000e00200),
(49, 0xf903ab040701000000e10200),
(49, 0xf903b0040701000000412000),
(50, 0x0104b0040701000000e00200),
(50, 0x0204b0040701000000e10200),
(50, 0x0404b6040701000000412000),
(51, 0x0604a7040701000000de0200),
(51, 0x0004aa0407010000003f2000),
(51, 0x0604a8040701000000df0200),
(52, 0x0904a7040701000000de0200),
(52, 0x0904a8040701000000df0200),
(52, 0x0f04aa0407010000003f2000),
(53, 0x0e04b0040701000000de0200),
(53, 0x0e04b1040701000000df0200),
(53, 0x0c04b6040701000000412000),
(54, 0x0104b0040601000000de0200),
(54, 0x0104b1040601000000df0200),
(54, 0x0404b6040601000000412000),
(55, 0x0e04bb040701000000de0200),
(55, 0x0704bd0407010000003f2000),
(55, 0x0e04bc040701000000df0200),
(56, 0x0704c20407010000003f2000),
(56, 0x0e04c0040701000000de0200),
(56, 0x0e04c1040701000000df0200),
(57, 0xfd03c0040701000000de0200),
(57, 0xfd03c1040701000000df0200),
(57, 0x0304c20407010000003f2000),
(58, 0xfd03bb040701000000de0200),
(58, 0xfd03bc040701000000df0200),
(58, 0x0304bd0407010000003f2000),
(59, 0xf403b7040701000000de0200),
(59, 0xf403b8040701000000df0200),
(59, 0xf403bb0407010000003f2000),
(59, 0xf703b9040701000000412000),
(60, 0xf403c20407010000003f2000),
(60, 0xf803c3040701000000e00200),
(60, 0xf903c3040701000000e10200),
(61, 0xdb03ac040601000000de0200),
(61, 0xdb03ad040601000000df0200),
(61, 0xd903af040701000000412000),
(62, 0xd603a7040601000000e00200),
(62, 0xd703a7040601000000e10200),
(62, 0xde03a7040601000000412000),
(63, 0xd603a3040701000000de0200),
(63, 0xde03a3040701000000de0200),
(63, 0xd603a4040701000000df0200),
(63, 0xda03a7040701000000412000),
(63, 0xde03a4040701000000df0200),
(64, 0xd7039a040701000000e00200),
(64, 0xd8039a040701000000e10200),
(64, 0xda039f040701000000412000),
(65, 0xcd039d040701000000e00200),
(65, 0xce039d040701000000e10200),
(65, 0xd1039f0407010000003f2000),
(66, 0xcd03a5040701000000412000),
(66, 0xca03a9040701000000e00200),
(66, 0xcb03a9040701000000e10200),
(67, 0xc903af0407010000003f2000),
(67, 0xcf03af040701000000412000),
(67, 0xce03b1040701000000e00200),
(67, 0xcf03b1040701000000e10200),
(68, 0xc303ad040601000000de0200),
(68, 0xc303ae040601000000df0200),
(68, 0xc103ac040701000000412000),
(69, 0xba03ad040601000000de0200),
(69, 0xba03ae040601000000df0200),
(69, 0xb803ac040701000000412000),
(70, 0xb603a0040701000000de0200),
(70, 0xb603a1040701000000df0200),
(70, 0xb903a5040701000000412000),
(71, 0xc003a0040701000000de0200),
(71, 0xc003a1040701000000df0200),
(71, 0xc303a5040701000000412000),
(72, 0xaf03a0040601000000de0200),
(72, 0xaf03a1040601000000df0200),
(72, 0xb103a5040601000000412000),
(73, 0xb603a0040601000000e00200),
(73, 0xb703a0040601000000e10200),
(73, 0xb903a5040601000000412000),
(74, 0xc003a0040601000000e00200),
(74, 0xc103a0040601000000e10200),
(74, 0xc303a5040601000000412000),
(75, 0xab03b4040601000000e00200),
(75, 0xac03b4040601000000e10200),
(75, 0xad03b60406010000003f2000),
(76, 0xb003b60406010000003f2000),
(76, 0xb103b4040601000000e00200),
(76, 0xb203b4040601000000e10200),
(77, 0xab03b9040601000000e00200),
(77, 0xac03b9040601000000e10200),
(77, 0xad03bb0406010000003f2000),
(78, 0xb003bb0406010000003f2000),
(78, 0xb103b9040601000000e00200),
(78, 0xb203b9040601000000e10200),
(79, 0xab03b9040701000000e00200),
(79, 0xac03b9040701000000e10200),
(79, 0xad03bb0407010000003f2000),
(80, 0xab03b4040701000000e00200),
(80, 0xac03b4040701000000e10200),
(80, 0xad03b60407010000003f2000),
(81, 0xb003b60407010000003f2000),
(81, 0xb103b4040701000000e00200),
(81, 0xb203b4040701000000e10200),
(82, 0xb003bb0407010000003f2000),
(82, 0xb103b9040701000000e00200),
(82, 0xb203b9040701000000e10200),
(83, 0xba03ce040701000000412000),
(83, 0xbd03d1040601000000de0200),
(83, 0xbd03d2040601000000df0200),
(84, 0xcf038f040601000000e00200),
(84, 0xd0038f040601000000e10200),
(84, 0xd10395040601000000412000),
(85, 0xd4038f040601000000e00200),
(85, 0xd5038f040601000000e10200),
(85, 0xd60395040601000000412000),
(86, 0xf803ab040601000000e00200),
(86, 0xf903ab040601000000e10200),
(86, 0xf903b0040601000000412000),
(87, 0xf403b7040601000000e00200),
(87, 0xf503b7040601000000e10200),
(87, 0xf703ba040601000000412000),
(87, 0xf703be040601000000412000),
(88, 0xfd03bb040601000000e00200),
(88, 0xfe03bb040601000000e10200),
(88, 0x0004c2040601000000412000),
(89, 0x0804bb040601000000e00200),
(89, 0x0904bb040601000000e10200),
(89, 0x0a04bb040601000000e00200),
(89, 0x0b04bb040601000000e10200),
(89, 0x0a04be040601000000412000),
(89, 0x0b04c2040601000000412000),
(90, 0xa103a0040601000000e00200),
(90, 0xa203a0040601000000e10200),
(90, 0xa303a6040601000000412000),
(91, 0xa10398040601000000de0200),
(91, 0xa10399040601000000df0200),
(91, 0xa4039a0406010000003f2000),
(92, 0xb903be040401000000b70900),
(92, 0xb903bf040401000000b80900),
(92, 0xbd03bf040401000000741b00),
(92, 0xba03c2040401000000731b00),
(92, 0xbb03c2040401000000731b00),
(92, 0xbd03c0040401000000f71a00),
(93, 0xb903b9040401000000bd0900),
(93, 0xba03b9040401000000be0900),
(93, 0xbd03ba040401000000741b00),
(93, 0xbd03bb040401000000f71a00),
(94, 0xb903b4040401000000bd0900),
(94, 0xba03b4040401000000be0900),
(94, 0xbf03b8040401000000731b00),
(94, 0xc003b8040401000000ee1a00),
(94, 0xc103b8040401000000731b00),
(95, 0xbd03bb040301000000ee1a00),
(95, 0xbe03bb040301000000731b00),
(95, 0xbb03c0040301000000b70900),
(95, 0xbb03c1040301000000b80900),
(95, 0xbd03c2040301000000731b00),
(95, 0xbe03c2040301000000731b00),
(96, 0xbb03b4040301000000bd0900),
(96, 0xbc03b4040301000000be0900),
(96, 0xbd03b7040301000000ee1a00),
(96, 0xbe03b7040301000000731b00),
(97, 0xc90270050601000000f71a00),
(97, 0xc80273050701000000ee1a00),
(97, 0xc90270050701000000f71a00),
(97, 0xc90272050701000000f71a00),
(97, 0xcb0273050701000000731b00),
(97, 0xce0270050601000000741b00),
(97, 0xcc0271050701000000de0200),
(97, 0xcc0272050701000000df0200),
(97, 0xcd0271050701000000e20200),
(97, 0xcd0272050701000000e30200),
(97, 0xcd0273050701000000731b00),
(97, 0xce0270050701000000741b00),
(97, 0xce0272050701000000741b00),
(98, 0xd70276050601000000f71a00),
(98, 0xd40276050701000000f71a00),
(98, 0xd40277050701000000741b00),
(98, 0xd70275050701000000f71a00),
(98, 0xdb0276050601000000741b00),
(98, 0xd90277050701000000e20200),
(98, 0xda0277050701000000e20200),
(98, 0xdb0275050701000000f71a00),
(98, 0xdb0276050701000000741b00),
(98, 0xd60279050701000000731b00),
(98, 0xd90278050701000000e30200),
(98, 0xd90279050701000000731b00),
(98, 0xda0278050701000000e30200),
(99, 0xd6027e050601000000f71a00),
(99, 0xd4027d050701000000f71a00),
(99, 0xd4027e050701000000741b00),
(99, 0xd7027e050701000000e20200),
(99, 0xd7027f050701000000e30200),
(99, 0xd9027d050601000000741b00),
(99, 0xd9027f050601000000741b00),
(99, 0xd8027e050701000000e20200),
(99, 0xd8027f050701000000e30200),
(99, 0xd9027d050701000000741b00),
(99, 0xd9027f050701000000741b00),
(99, 0xd60280050701000000731b00),
(99, 0xd80280050601000000731b00),
(99, 0xd80280050701000000731b00),
(100, 0xca027b050701000000f71a00),
(100, 0xcc0279050701000000ee1a00),
(100, 0xce027b050701000000741b00),
(100, 0xc7027f050601000000741b00),
(100, 0xca027f050601000000f71a00),
(100, 0xc8027e050701000000e20200),
(100, 0xc8027f050701000000e30200),
(100, 0xc9027e050701000000e20200),
(100, 0xc9027f050701000000e30200),
(100, 0xcc027c050601000000ee1a00),
(100, 0xce027f050601000000741b00),
(100, 0xcc027c050701000000ee1a00),
(100, 0xce027f050701000000741b00),
(100, 0xc90280050601000000731b00),
(100, 0xc90280050701000000731b00),
(100, 0xcb0280050701000000731b00),
(100, 0xcd0280050601000000731b00),
(100, 0xcd0280050701000000731b00),
(101, 0xbc0279050701000000ee1a00),
(101, 0xbf027a050701000000e20200),
(101, 0xbf027b050701000000e30200),
(101, 0xbb027c050701000000ee1a00),
(101, 0xbc027f050701000000731b00),
(101, 0xbe027f050701000000731b00),
(101, 0xbf027d050701000000e20200),
(101, 0xbf027e050701000000e30200),
(101, 0xc0027b050701000000741b00),
(101, 0xc0027d050701000000741b00),
(102, 0xb30279050701000000731b00),
(102, 0xb40279050701000000ee1a00),
(102, 0xb3027c050701000000ee1a00),
(102, 0xb3027f050701000000731b00),
(102, 0xb4027e050701000000f71a00),
(102, 0xb5027f050701000000731b00),
(102, 0xb6027d050701000000e20200),
(102, 0xb6027e050701000000e30200),
(102, 0xb7027e050701000000741b00),
(103, 0xaf0279050701000000ee1a00),
(103, 0xad027d050701000000e20200),
(103, 0xad027e050701000000e30200),
(103, 0xae027d050701000000e20200),
(103, 0xae027e050701000000e30200),
(103, 0xae027f050701000000731b00),
(103, 0xb0027b050701000000ee1a00),
(103, 0xb0027f050701000000731b00),
(104, 0xad026e050701000000e20200),
(104, 0xad026f050701000000e30200),
(104, 0xb0026f050701000000f71a00),
(104, 0xae0270050701000000ee1a00),
(104, 0xae0273050701000000731b00),
(104, 0xaf0273050701000000ee1a00),
(104, 0xb00272050701000000741b00),
(105, 0x9f0275050701000000e20200),
(105, 0x9f0276050701000000e30200),
(105, 0xa20273050701000000f71a00),
(105, 0xa00274050701000000ee1a00),
(105, 0xa10277050701000000731b00),
(105, 0xa40277050701000000731b00),
(105, 0xa50274050701000000f71a00),
(105, 0xa50275050701000000741b00),
(106, 0x9f026c050701000000e20200),
(106, 0x9f026d050701000000e30200),
(106, 0xa0026b050701000000ee1a00),
(106, 0xa2026a050701000000f71a00),
(106, 0xa5026b050701000000f71a00),
(106, 0xa1026e050701000000731b00),
(106, 0xa4026e050701000000731b00),
(106, 0xa5026c050701000000741b00),
(107, 0xad0263050701000000e20200),
(107, 0xae0263050701000000e20200),
(107, 0xae0265050601000000731b00),
(107, 0xad0264050701000000e30200),
(107, 0xae0264050701000000e30200),
(107, 0xae0265050701000000731b00),
(107, 0xb20262050601000000741b00),
(107, 0xb00263050701000000f71a00),
(107, 0xb30260050701000000ee1a00),
(107, 0xb40262050701000000741b00),
(107, 0xb10265050601000000731b00),
(107, 0xb20264050601000000741b00),
(107, 0xb20265050701000000731b00),
(107, 0xb40264050701000000741b00),
(108, 0xbe0262050601000000ee1a00),
(108, 0xbe0262050701000000ee1a00),
(108, 0xbb0265050601000000731b00),
(108, 0xbb0265050701000000731b00),
(108, 0xbe0265050601000000731b00),
(108, 0xbf0264050601000000741b00),
(108, 0xbc0264050701000000f71a00),
(108, 0xbe0265050701000000731b00),
(108, 0xbf0264050701000000741b00),
(109, 0xd00262050701000000e20200),
(109, 0xd00263050701000000e30200),
(109, 0xd30263050701000000f71a00),
(109, 0xd10264050701000000ee1a00),
(109, 0xd10267050701000000731b00),
(109, 0xd20267050701000000ee1a00),
(109, 0xd30266050701000000741b00),
(110, 0xcd0257050601000000731b00),
(110, 0xce0257050601000000ee1a00),
(110, 0xcd0257050701000000ee1a00),
(110, 0xcd025a050701000000731b00),
(110, 0xce025a050701000000ee1a00),
(110, 0xd00256050601000000f71a00),
(110, 0xd00256050701000000f71a00),
(110, 0xd20257050701000000ee1a00),
(110, 0xd30255050701000000e20200),
(110, 0xd30256050701000000e30200),
(110, 0xd40256050701000000721b00),
(111, 0x9e0255050701000000c90900),
(111, 0x9f0255050701000000ca0900),
(111, 0xa002560507010000003b1900),
(111, 0xa202540507010000003c1900),
(111, 0xa202550507010000009e0600),
(112, 0x9e024d050701000000c90900),
(112, 0x9f024d050701000000ca0900),
(112, 0xa2024e0507010000003c1900),
(112, 0xa2024f0507010000009e0600),
(112, 0xa002500507010000003b1900),
(113, 0xaa0244050701000000c70900),
(113, 0xaa0245050701000000c80900),
(113, 0xab02450507010000003c1900),
(113, 0xa80248050701000000950600),
(114, 0xaf0248050701000000950600),
(114, 0xb10244050701000000c70900),
(114, 0xb10245050701000000c80900),
(114, 0xb202450507010000003c1900),
(115, 0xae0244050601000000c90900),
(115, 0xaf0244050601000000ca0900),
(115, 0xaf0247050601000000950600),
(115, 0xb202460506010000003a1900),
(116, 0xa70244050601000000c90900),
(116, 0xa80244050601000000ca0900),
(116, 0xa80247050601000000950600),
(116, 0xab02460506010000003a1900),
(117, 0x9e024d050601000000c90900),
(117, 0x9f024d050601000000ca0900),
(117, 0xa1024e0506010000009e0600),
(118, 0x9e0255050601000000c90900),
(118, 0x9f0255050601000000ca0900),
(118, 0xa102540506010000009e0600),
(119, 0xd0041d0506010000007a0600),
(120, 0xdd041d0506010000007a0600),
(121, 0xe0041a0506010000007a0600),
(122, 0xcc041a0506010000007a0600),
(123, 0xd50407050601000000e80200),
(123, 0xd60407050601000000e90200),
(123, 0xd4040c050601000000780600),
(124, 0xcf040d050601000000e80200),
(124, 0xd20409050601000000780600),
(124, 0xd0040d050601000000e90200),
(125, 0xdd040b050501000000e60200),
(125, 0xdf040b050501000000e60200),
(125, 0xdd040c050501000000e70200),
(125, 0xde040f0505010000007a0600),
(125, 0xdf040c050501000000e70200),
(125, 0xe0040d050501000000361900),
(125, 0xdd0411050601000000351900),
(125, 0xde04110506010000007a0600),
(126, 0xe1040e050601000000bb0900),
(126, 0xe1040f050601000000bc0900),
(126, 0xe4040f050601000000361900),
(126, 0xe204110506010000007a0600),
(126, 0xe30411050601000000351900),
(127, 0xe9040b050601000000e60200),
(127, 0xe9040c050601000000e70200),
(127, 0xeb04110506010000007a0600),
(128, 0xef040b050601000000bb0900),
(128, 0xef040c050601000000bc0900),
(128, 0xf104110506010000007a0600),
(129, 0xea040f050501000000780600),
(129, 0xed040d050501000000e60200),
(129, 0xed040e050501000000e70200),
(129, 0xef040d050501000000e60200),
(129, 0xef040e050501000000e70200),
(130, 0xb7041f050601000000361900),
(130, 0xb8041c050601000000351900),
(130, 0xb8041f050601000000b90900),
(130, 0xb9041c0506010000007a0600),
(130, 0xb9041f050601000000ba0900),
(131, 0xbd041d050601000000e80200),
(131, 0xbd041f050601000000e80200),
(131, 0xbe041d050601000000e90200),
(131, 0xbe041f050601000000e90200),
(131, 0xc0041c0506010000007a0600),
(132, 0xc1041a050601000000780600),
(132, 0xc20418050601000000b90900),
(132, 0xc30418050601000000ba0900),
(133, 0xc004190505010000007a0600),
(133, 0xc1041a050501000000bb0900),
(133, 0xc1041b050501000000bc0900),
(134, 0xd10409050501000000e60200),
(134, 0xd1040a050501000000e70200),
(134, 0xd3040c0505010000007a0600),
(135, 0xb50402050401000000780600),
(135, 0xb80402050501000000401900),
(135, 0xb20404050401000000e40200),
(135, 0xb30404050401000000e50200),
(135, 0xb304050505010000003f1900),
(135, 0xb50404050501000000780600),
(136, 0xb4040b050401000000e40200),
(136, 0xb5040b050401000000e50200),
(136, 0xb6040a050401000000780600),
(136, 0xb504080505010000007a0600),
(137, 0xc30400050301000000e20200),
(137, 0xc30401050301000000e30200),
(137, 0xc40401050301000000401900),
(137, 0xc40400050401000000780600),
(137, 0xc50403050401000000401900),
(137, 0xc204040504010000003f1900),
(138, 0xcb04f6040301000000e60200),
(138, 0xcb04f7040301000000e70200),
(138, 0xc904f90404010000003f1900),
(138, 0xcb04f80404010000007a0600),
(139, 0xe104fe040601000000351900),
(139, 0xe204fe0406010000007a0600),
(139, 0xe304ff040601000000e60200),
(139, 0xe20400050501000000780600),
(139, 0xe20401050601000000351900),
(139, 0xe30400050601000000e70200),
(139, 0xe40400050601000000361900),
(140, 0xe704ff040601000000780600),
(140, 0xea04fe040601000000bb0900),
(140, 0xea04ff040601000000bc0900),
(140, 0xea0401050601000000351900),
(141, 0xe804fe040501000000bb0900),
(141, 0xe804ff040501000000bc0900),
(141, 0xeb04fe040501000000780600),
(141, 0xeb0400050501000000361900),
(142, 0xe804f2040501000000e20200),
(142, 0xe804f3040501000000e30200),
(142, 0xeb04f2040501000000e20200),
(142, 0xeb04f3040501000000e30200),
(142, 0xea04f80405010000007a0600),
(143, 0xf404f8040501000000780600),
(143, 0xf604fa040501000000351900),
(143, 0xf804f8040501000000bb0900),
(143, 0xf804f9040501000000bc0900),
(143, 0xf904f8040501000000361900),
(144, 0xea04f30404010000007a0600),
(144, 0xe804f4040401000000e60200),
(144, 0xe804f5040401000000e70200),
(144, 0xec04f5040401000000361900),
(145, 0xd804ed040601000000351900),
(145, 0xd804ee040601000000bb0900),
(145, 0xd804ef040601000000bc0900),
(145, 0xda04ed0406010000007a0600),
(145, 0xdc04ef040601000000361900),
(146, 0xd504f20406010000007a0600),
(146, 0xd704f2040601000000351900),
(146, 0xd804f3040601000000bb0900),
(146, 0xd704f5040601000000351900),
(146, 0xd804f4040601000000bc0900),
(147, 0xea04f10406010000007a0600),
(147, 0xec04f1040601000000351900),
(147, 0xec04f2040601000000e20200),
(147, 0xec04f3040601000000e30200),
(148, 0xdf04f20406010000007a0600),
(148, 0xdc04f5040601000000e40200),
(148, 0xdc04f7040601000000e40200),
(148, 0xdd04f5040601000000e50200),
(148, 0xdd04f7040601000000e50200),
(149, 0xde04f7040701000000bb0900),
(149, 0xde04f8040701000000bc0900),
(149, 0xe104f9040701000000780600),
(150, 0xde04f2040701000000bb0900),
(150, 0xde04f3040701000000bc0900),
(150, 0xe104f4040701000000780600),
(151, 0xde04ee040701000000bb0900),
(151, 0xde04ef040701000000bc0900),
(151, 0xe104ef040701000000780600),
(152, 0xe604ef040701000000780600),
(152, 0xe904ee040701000000bb0900),
(152, 0xe904ef040701000000bc0900),
(153, 0xe904f2040701000000bb0900),
(153, 0xe904f3040701000000bc0900),
(153, 0xe604f4040701000000780600),
(154, 0xe904f7040701000000bb0900),
(154, 0xe604f9040701000000780600),
(154, 0xe904f8040701000000bc0900),
(155, 0xa80422050701000000b90900),
(155, 0xa90422050701000000ba0900),
(155, 0xac0424050701000000780600),
(156, 0x0105d5040701000000b90900),
(156, 0x0205d5040701000000ba0900),
(156, 0x0205d7040701000000750600),
(157, 0xfc04cd040701000000b90900),
(157, 0xfd04cd040701000000ba0900),
(157, 0xfc04d40407010000007a0600),
(158, 0x0305ce040701000000bb0900),
(158, 0x0305cf040701000000bc0900),
(158, 0x0805d3040701000000750600),
(159, 0xfd041f050701000000720600),
(159, 0xfe041d050701000000bb0900),
(159, 0xfe041e050701000000bc0900),
(160, 0xeb041b050601000000bb0900),
(160, 0xe7041d050601000000780600),
(160, 0xeb041c050601000000bc0900),
(161, 0xe004270506010000007a0600),
(162, 0xcc04270506010000007a0600),
(163, 0xe80387040701000000de0200),
(163, 0xe80388040701000000df0200),
(163, 0xeb038b040701000000412000),
(164, 0xe10387050701000000780600),
(164, 0xe20384050701000000b90900),
(164, 0xe30384050701000000ba0900),
(165, 0xe90384050701000000b90900),
(165, 0xea0384050701000000ba0900),
(165, 0xeb0387050701000000780600),
(165, 0xe90388050701000000bb0900),
(165, 0xe90389050701000000bc0900),
(165, 0xea0388050701000000bb0900),
(165, 0xea0389050701000000bc0900),
(165, 0xed038a0507010000007a0600),
(166, 0xe5037c0507010000007a0600),
(166, 0xe20381050701000000bb0900),
(166, 0xe20382050701000000bc0900),
(166, 0xe503800507010000007a0600),
(166, 0xe70381050701000000bb0900),
(166, 0xe70382050701000000bc0900),
(167, 0xec037c0507010000007a0600),
(167, 0xea03800507010000007a0600),
(167, 0xeb0381050701000000bb0900),
(167, 0xeb0382050701000000bc0900),
(167, 0xed03800507010000007a0600),
(167, 0xee0381050701000000bb0900),
(167, 0xee0382050701000000bc0900),
(168, 0xfc037a0507010000007a0600),
(168, 0xfd0378050701000000b90900),
(168, 0xfd0379050701000000b90900),
(168, 0xfe0378050701000000ba0900),
(168, 0xfe0379050701000000ba0900),
(168, 0xfb037e0507010000007a0600),
(169, 0xf8036e050701000000780600),
(169, 0xfc036c050701000000bb0900),
(169, 0xfc036d050701000000bc0900),
(170, 0xfc035f050701000000bb0900),
(170, 0xf80361050701000000780600),
(170, 0xfc0360050701000000bc0900),
(171, 0xdf0350050701000000bb0900),
(171, 0xdf0351050701000000bc0900),
(171, 0xdf0352050701000000bb0900),
(171, 0xdf0353050701000000bc0900),
(171, 0xe303540507010000007a0600),
(172, 0xe4034d050701000000bb0900),
(172, 0xe4034e050701000000bc0900),
(172, 0xe8034d050701000000780600),
(173, 0xde034d050701000000780600),
(173, 0xe1034b050701000000b90900),
(173, 0xe2034b050701000000ba0900),
(174, 0xd1034d050701000000bb0900),
(174, 0xd1034e050701000000bc0900),
(174, 0xd5034d050701000000780600),
(175, 0xcc0350050701000000bb0900),
(175, 0xcc0351050701000000bc0900),
(175, 0xcc0352050701000000bb0900),
(175, 0xcc0353050701000000bc0900),
(175, 0xd003540507010000007a0600),
(176, 0xce034b050701000000b90900),
(176, 0xcf034b050701000000ba0900),
(176, 0xcb034d050701000000780600),
(177, 0xbe034d050701000000bb0900),
(177, 0xbe034e050701000000bc0900),
(177, 0xc2034d050701000000780600),
(178, 0xbe0359050701000000bb0900),
(178, 0xbe035a050701000000bc0900),
(178, 0xc20359050701000000780600),
(179, 0xc20365050701000000b90900),
(179, 0xc20366050701000000b90900),
(179, 0xc30365050701000000ba0900),
(179, 0xc30366050701000000ba0900),
(179, 0xc103690507010000007a0600),
(180, 0xc00365050601000000bb0900),
(180, 0xc00366050601000000bc0900),
(180, 0xc30366050601000000780600),
(181, 0xb2037e050701000000b90900),
(181, 0xb3037e050701000000ba0900),
(181, 0xad0380050701000000780600),
(181, 0xaf03830507010000007a0600),
(181, 0xb00380050701000000780600),
(181, 0xb20381050701000000bb0900),
(181, 0xb20382050701000000bc0900),
(181, 0xb30381050701000000bb0900),
(181, 0xb30382050701000000bc0900),
(182, 0xae0388050701000000bb0900),
(182, 0xae0389050701000000bc0900),
(182, 0xaf0388050701000000bb0900),
(182, 0xaf0389050701000000bc0900),
(182, 0xb00385050701000000780600),
(182, 0xb00387050701000000780600),
(183, 0xa80384050701000000b90900),
(183, 0xa90384050701000000ba0900),
(183, 0xad0385050701000000780600),
(183, 0xa80388050701000000bb0900),
(183, 0xa80389050701000000bc0900),
(184, 0xaa0383050601000000b90900),
(184, 0xab0383050601000000ba0900),
(184, 0xac0381050601000000780600),
(185, 0xaa0385050601000000b90900),
(185, 0xab0385050601000000ba0900),
(185, 0xac0387050601000000780600),
(186, 0xaf0381050601000000780600),
(186, 0xb00383050601000000b90900),
(186, 0xb10383050601000000ba0900),
(187, 0xaf0387050601000000780600),
(187, 0xb00385050601000000b90900),
(187, 0xb10385050601000000ba0900),
(188, 0xac0382050501000000bb0900),
(188, 0xac0383050501000000bc0900),
(188, 0xb00384050501000000780600),
(189, 0xe60384050601000000b90900),
(189, 0xe70384050601000000ba0900),
(189, 0xe603880506010000007a0600),
(190, 0xe90384050601000000bb0900),
(190, 0xe90385050601000000bc0900),
(190, 0xed0386050601000000780600),
(191, 0xe30381050601000000780600),
(191, 0xe60382050601000000b90900),
(191, 0xe70382050601000000ba0900),
(192, 0xe9037f050601000000bb0900),
(192, 0xe90380050601000000bc0900),
(192, 0xed0381050601000000780600),
(193, 0xe803800505010000007a0600),
(193, 0xe60384050501000000bb0900),
(193, 0xe60385050501000000bc0900),
(193, 0xea0384050501000000bb0900),
(193, 0xea0385050501000000bc0900),
(194, 0xfb037a050601000000bb0900),
(194, 0xfb037b050601000000bc0900),
(194, 0xfe037b050601000000780600),
(195, 0xe6036b050701000000220900),
(195, 0xe4036e050701000000bb0900),
(195, 0xe4036f050701000000bc0900),
(196, 0xec036b050701000000220900),
(196, 0xee036e050701000000bb0900),
(196, 0xee036f050701000000bc0900),
(197, 0xe4035f050701000000bb0900),
(197, 0xe40360050701000000bc0900),
(197, 0xe60363050701000000220900),
(198, 0xee035f050701000000bb0900),
(198, 0xec0363050701000000220900),
(198, 0xee0360050701000000bc0900),
(199, 0x2c0337040701000000de0200),
(199, 0x260338040701000000f41a00),
(199, 0x2c0338040701000000df0200),
(199, 0x2c033a040701000000de0200),
(199, 0x2c033b040701000000df0200),
(199, 0x2b033c040701000000731b00),
(200, 0x160337040701000000de0200),
(200, 0x1e0337040701000000f41a00),
(200, 0x160338040701000000df0200),
(200, 0x160339040701000000de0200),
(200, 0x16033a040701000000df0200),
(200, 0x18033b040701000000731b00),
(200, 0x1c033b040701000000ee1a00),
(200, 0x1d033b040701000000731b00),
(201, 0x300335040701000000e20200),
(201, 0x300336040701000000e30200),
(201, 0x330336040701000000f41a00),
(201, 0x330338040701000000741b00),
(202, 0x3c0336040701000000741b00),
(202, 0x370338040701000000f41a00),
(202, 0x3c033a040601000000741b00),
(203, 0x3c0346040701000000f71a00),
(203, 0x3f0344040701000000e20200),
(203, 0x3f0345040701000000e30200),
(203, 0x3f0347040701000000e20200),
(203, 0x3f0348040701000000e30200),
(203, 0x400345040601000000741b00),
(203, 0x400347040601000000741b00),
(204, 0x460347040701000000f41a00),
(204, 0x470348040601000000e20200),
(204, 0x470349040601000000e30200),
(204, 0x4b034a040601000000e40200),
(204, 0x4c034a040601000000e50200),
(204, 0x4f0348040601000000e20200),
(204, 0x4f0349040601000000e30200),
(204, 0x500344040701000000eb1a00),
(205, 0x3f034e040701000000e20200),
(205, 0x3f034f040701000000e30200),
(205, 0x42034c040701000000ee1a00),
(205, 0x45034d040601000000e20200),
(205, 0x45034e040601000000e30200),
(206, 0x48033d040701000000eb1a00),
(206, 0x49033d040701000000731b00),
(207, 0x2e0350040701000000eb1a00),
(208, 0x080342040701000000eb1a00),
(208, 0x090346040701000000de0200),
(208, 0x090347040701000000df0200),
(208, 0x0a0344040701000000741b00),
(208, 0x0a0347040701000000741b00),
(208, 0x090348040601000000731b00),
(209, 0x020339040701000000741b00),
(209, 0x00033f040701000000731b00),
(209, 0x02033c040701000000f41a00),
(210, 0x07032f040701000000741b00),
(210, 0x070330040701000000f41a00),
(210, 0x070331040701000000741b00),
(210, 0x0b0333040701000000731b00),
(211, 0x14032d040701000000eb1a00),
(211, 0x15032d040701000000731b00),
(211, 0x160332040701000000741b00),
(212, 0x1f0330040701000000f41a00),
(213, 0x0d0326040701000000731b00),
(213, 0x0f0326040701000000eb1a00),
(213, 0x110326040701000000731b00),
(214, 0x1e0322040701000000741b00),
(214, 0x180325040701000000731b00),
(214, 0x1a0325040701000000eb1a00),
(214, 0x1e0324040701000000741b00),
(215, 0x2e031f040601000000de0200),
(215, 0x2e031f040701000000de0200),
(215, 0x270322040701000000f41a00),
(215, 0x2e0320040601000000df0200),
(215, 0x2e0320040701000000df0200),
(215, 0x2f0321040701000000741b00),
(215, 0x2f0323040701000000741b00),
(215, 0x2b0326040701000000731b00),
(215, 0x2e0324040601000000de0200),
(215, 0x2e0325040601000000df0200),
(216, 0x0c031c040701000000f41a00),
(216, 0x12031c040601000000741b00),
(216, 0x12031c040701000000f41a00),
(217, 0x20030f040701000000741b00),
(217, 0x1a0313040701000000731b00),
(217, 0x1e0314040701000000eb1a00),
(218, 0x2a0317040701000000f41a00),
(219, 0x2c0317040701000000f41a00),
(220, 0x320316040701000000de0200),
(220, 0x320317040701000000df0200),
(220, 0x390319040701000000f41a00),
(221, 0x3e0316040701000000de0200),
(221, 0x3e0317040701000000df0200),
(221, 0x410314040701000000eb1a00),
(221, 0x440316040601000000721b00),
(222, 0x3e030e040701000000eb1a00),
(223, 0x2c030d040701000000eb1a00),
(224, 0x350420050701000000a51400),
(225, 0x170427050701000000a31400),
(225, 0x1b0425050701000000a31400),
(225, 0x1c0425050601000000a51400),
(226, 0x19042f050701000000a31400),
(227, 0x1c043a050701000000a51400),
(228, 0x22043a050701000000a51400),
(229, 0x190457050401000000660600),
(230, 0x2f044e050601000000a31400),
(230, 0x32044d050601000000a31400),
(230, 0x36044e050501000000a31400),
(231, 0x49044d050701000000a51400),
(231, 0x52044b050601000000a51400),
(232, 0x3b042e050701000000a51400),
(232, 0x3d042c050601000000481900),
(232, 0x3d042d050701000000a31400),
(232, 0x3f042e050701000000a31400),
(233, 0x0c0420050701000000a51400),
(233, 0x0d0423050701000000a31400),
(234, 0xfe0333050701000000a31400),
(234, 0xfa0335050701000000b90900),
(234, 0xfb0335050701000000ba0900),
(235, 0x0b0432050701000000a31400),
(235, 0x100436050701000000a51400),
(236, 0x5c045b050701000000a31400),
(237, 0xec0404040701000000a11400),
(238, 0xec040b040701000000a11400),
(239, 0xe904080406010000009e1400),
(239, 0xec040b040601000000481900),
(240, 0xe904060406010000009e1400),
(240, 0xec0404040601000000461900),
(241, 0x1205f5030601000000471900),
(241, 0x1305f50307010000009e1400),
(241, 0x1405f5030601000000451900),
(242, 0x0705260407010000009e1400),
(243, 0x0d05260407010000009e1400),
(244, 0x090523040601000000a01400),
(244, 0x070526040601000000451900),
(244, 0x080526040601000000451900),
(245, 0x0b0523040601000000a01400),
(245, 0x0d0526040601000000451900),
(245, 0x0e0526040601000000471900),
(246, 0xfe0423040501000000481900),
(246, 0xfe0423040601000000461900),
(246, 0xf804260406010000009e1400),
(246, 0xfe0425040501000000461900),
(246, 0xfc04260406010000009e1400),
(246, 0xfe0425040601000000461900),
(247, 0xf6042a040701000000a51400),
(248, 0xeb0421040701000000a31400),
(249, 0x0d05170407010000009f1400),
(249, 0x0e051a0406010000009e1400),
(249, 0x0f0518040601000000a21400),
(249, 0x0f0518040701000000a31400),
(249, 0x12051b040601000000471900),
(249, 0x130519040601000000481900),
(249, 0x13051a040601000000461900),
(250, 0x2e03e4040701000000b70900),
(250, 0x2e03e5040701000000b80900),
(250, 0x2f03e7040701000000251900),
(250, 0x3103e70407010000005f0600),
(250, 0x3203e5040701000000101400),
(251, 0x2c03de040701000000251900),
(251, 0x2c03df040701000000bd0900),
(251, 0x2d03df040701000000be0900),
(251, 0x2b03e1040701000000261900),
(251, 0x2c03e2040701000000bd0900),
(251, 0x2d03e2040701000000be0900),
(251, 0x3203e2040701000000101400),
(251, 0x3303e1040701000000261900),
(252, 0x2e03e3040601000000b70900),
(252, 0x2d03e5040601000000261900),
(252, 0x2e03e4040601000000b80900),
(252, 0x3003e7040601000000251900),
(252, 0x3203e4040601000000101400),
(252, 0x3303e6040601000000261900),
(253, 0x2c03df040601000000b70900),
(253, 0x2f03de040601000000251900),
(253, 0x2b03e1040601000000261900),
(253, 0x2c03e0040601000000b80900),
(253, 0x3203e1040601000000101400),
(253, 0x3303e0040601000000261900),
(254, 0x3803e5040701000000471900),
(254, 0x3b03e60407010000009d1400),
(254, 0x3d03e6040701000000b90900),
(254, 0x3e03e6040701000000ba0900),
(254, 0x3f03e7040701000000481900),
(254, 0x3603e8040701000000481900),
(254, 0x3803eb040701000000471900),
(254, 0x3b03eb040701000000471900),
(254, 0x3c03e8040701000000a01400),
(255, 0x3803e5040601000000251900),
(255, 0x3903e50406010000005f0600),
(255, 0x3603e8040601000000261900),
(255, 0x3703e9040601000000b70900),
(255, 0x3703ea040601000000b80900),
(255, 0x3903eb040601000000251900),
(255, 0x3b03e9040601000000b70900),
(255, 0x3b03ea040601000000b80900),
(255, 0x3c03e9040601000000261900),
(256, 0x4603df040701000000251900),
(256, 0x4203e2040701000000261900),
(256, 0x4703e2040701000000131400),
(256, 0x4403e4040701000000b90900),
(256, 0x4503e4040701000000ba0900),
(257, 0x4c03df040701000000471900),
(257, 0x4a03e3040701000000a31400),
(257, 0x4b03e0040701000000b90900),
(257, 0x4c03e0040701000000ba0900),
(257, 0x4e03e3040701000000481900),
(258, 0x4e03d5040701000000bb0900),
(258, 0x4e03d6040701000000bc0900),
(258, 0x4f03d7040701000000481900),
(258, 0x4c03d9040701000000471900),
(258, 0x4d03d90407010000009d1400),
(259, 0x4303d1040701000000261900),
(259, 0x4303d2040701000000141400),
(259, 0x4903d1040701000000b70900),
(259, 0x4903d2040701000000b80900),
(259, 0x4903d3040701000000251900),
(259, 0x4603d4040701000000680600),
(260, 0x4603cf040601000000b90900),
(260, 0x4703cf040601000000ba0900),
(260, 0x4303d2040601000000261900),
(260, 0x4603d30406010000005f0600),
(260, 0x4903d3040601000000251900),
(260, 0x4a03d2040601000000261900),
(261, 0x4903e2040601000000a31400),
(261, 0x4d03e2040601000000481900),
(261, 0x4d03e3040601000000a01400),
(261, 0x4a03e4040601000000b90900),
(261, 0x4b03e4040601000000ba0900),
(262, 0x4503e7040601000000261900),
(262, 0x4703e50406010000005f0600),
(262, 0x4a03e7040601000000261900),
(262, 0x4803e8040601000000b90900),
(262, 0x4903e8040601000000ba0900),
(262, 0x4903e9040601000000251900),
(263, 0x8d03a7040701000000451900),
(263, 0x8b03a9040701000000461900),
(263, 0x8c03a8040701000000bb0900),
(263, 0x8c03a9040701000000bc0900),
(263, 0x8d03ab040701000000451900),
(263, 0x9003a9040701000000a31400),
(264, 0x8b03a3040701000000461900),
(264, 0x8c03a2040701000000b90900),
(264, 0x8d03a1040701000000451900),
(264, 0x8d03a2040701000000ba0900),
(264, 0x8d03a5040701000000451900),
(264, 0x9003a3040701000000a31400),
(265, 0x8d039b040701000000451900),
(265, 0x8b039d040701000000461900),
(265, 0x8c039c040701000000bb0900),
(265, 0x8c039d040701000000bc0900),
(265, 0x8d039f040701000000451900),
(265, 0x90039d040701000000a31400),
(266, 0x97039d040701000000a31400),
(266, 0x99039c040701000000b90900),
(266, 0x9a039c040701000000ba0900),
(267, 0x9703a3040701000000a31400),
(267, 0x9a03a2040701000000bb0900),
(267, 0x9a03a3040701000000bc0900),
(268, 0xc10147050501000000e60200),
(268, 0xc40145050501000000e80200),
(268, 0xc50145050501000000e90200),
(268, 0xc80145050501000000e80200),
(268, 0xc90145050501000000e90200),
(268, 0xcc0147050501000000e60200),
(268, 0xc10148050501000000e70200),
(268, 0xcc0148050501000000e70200),
(268, 0xc3014e0505010000008c1500),
(268, 0xc3014e0506010000008c1500),
(268, 0xca014e0505010000008c1500),
(268, 0xca014e0506010000008c1500),
(268, 0xc701500506010000008c1500),
(269, 0xc4015b0505010000008a1500),
(269, 0xc4015b0506010000008a1500),
(269, 0xc7015a0506010000008c1500),
(269, 0xc9015b0505010000008a1500),
(269, 0xc9015b0506010000008a1500),
(269, 0xc10160050501000000e60200),
(269, 0xc10161050501000000e70200),
(269, 0xcc0160050501000000e60200),
(269, 0xcc0161050501000000e70200),
(269, 0xc10164050501000000e60200),
(269, 0xc10165050501000000e70200),
(269, 0xcc0164050501000000e60200),
(269, 0xcc0165050501000000e70200),
(270, 0xc7016f0506010000008c1500),
(270, 0xc20172050401000000e60200),
(270, 0xc20173050401000000e70200),
(270, 0xc40170050401000000e80200),
(270, 0xc50170050401000000e90200),
(270, 0xc80170050401000000e80200),
(270, 0xc90170050401000000e90200),
(271, 0xd6016f0506010000008c1500),
(271, 0xd10172050401000000e60200),
(271, 0xd10173050401000000e70200),
(271, 0xd30170050401000000e80200),
(271, 0xd40170050401000000e90200),
(271, 0xd70170050401000000e80200),
(271, 0xd80170050401000000e90200),
(272, 0xe5016f0506010000008c1500),
(272, 0xe00172050401000000e60200),
(272, 0xe00173050401000000e70200),
(272, 0xe20170050401000000e80200),
(272, 0xe30170050401000000e90200),
(272, 0xe60170050401000000e80200),
(272, 0xe70170050401000000e90200),
(273, 0xf0016f050501000000e80200),
(273, 0xf1016f050501000000e90200),
(273, 0xf3016f050501000000e80200),
(273, 0xf4016f050501000000e90200),
(273, 0xf6016f050501000000e80200),
(273, 0xf7016f050501000000e90200),
(273, 0xf4016e0506010000008c1500),
(273, 0xed0173050501000000e60200),
(273, 0xed0174050501000000e70200),
(273, 0xfa0173050501000000e60200),
(273, 0xfa0174050501000000e70200),
(274, 0xf701630506010000008a1500),
(274, 0x000260050601000000e60200),
(274, 0x000261050601000000e70200),
(275, 0xf701560506010000008a1500),
(275, 0x000253050601000000e60200),
(275, 0x000254050601000000e70200),
(276, 0xf701450506010000008a1500),
(276, 0x000242050601000000e60200),
(276, 0x000243050601000000e70200),
(277, 0xe9012d050601000000e60200),
(277, 0xe9012e050601000000e70200),
(277, 0xea012c050601000000e80200),
(277, 0xeb012c050601000000e90200),
(277, 0xf0012e0505010000008a1500),
(277, 0xf0012e0506010000008a1500),
(277, 0xf1012c050601000000e60200),
(277, 0xf1012d050601000000e70200),
(277, 0xf6012e0505010000008a1500),
(277, 0xf5012c050601000000e60200),
(277, 0xf5012d050601000000e70200),
(277, 0xf6012e0506010000008a1500),
(277, 0xfa012c050601000000e80200),
(277, 0xfb012c050601000000e90200),
(277, 0xfc012d050601000000e60200),
(277, 0xfc012e050601000000e70200),
(277, 0xf301320506010000008c1500),
(277, 0xf001350505010000008a1500),
(277, 0xf001350506010000008a1500),
(277, 0xf601350505010000008a1500),
(277, 0xf601350506010000008a1500),
(277, 0xf301390506010000008c1500),
(278, 0xdc0129050501000000e80200),
(278, 0xdd0129050501000000e90200),
(278, 0xde0129050501000000e80200),
(278, 0xdf0129050501000000e90200),
(278, 0xdc012c0506010000008c1500),
(278, 0xdc01310506010000008c1500),
(279, 0xcc0123050501000000e80200),
(279, 0xcd0123050501000000e90200),
(279, 0xcf0123050501000000e80200),
(279, 0xce012c0505010000008c1500),
(279, 0xce012f0506010000008a1500),
(279, 0xd00123050501000000e90200),
(279, 0xcc01310506010000008c1500),
(280, 0xb60138050401000000e80200),
(280, 0xb70138050401000000e90200),
(280, 0xb4013a050501000000e60200),
(280, 0xb4013b050501000000e70200),
(280, 0xb60138050501000000e80200),
(280, 0xb70138050501000000e90200),
(280, 0xb4013c050401000000e60200),
(280, 0xb4013d050401000000e70200),
(280, 0xb4013e050501000000e60200),
(280, 0xb4013f050501000000e70200),
(280, 0xbf013d0504010000008a1500),
(280, 0xbf013d0505010000008a1500),
(280, 0xc0013d0506010000008a1500),
(280, 0xcb013d0506010000008a1500),
(280, 0xb60141050401000000e80200),
(280, 0xb70141050401000000e90200),
(280, 0xb60141050501000000e80200),
(280, 0xb70141050501000000e90200),
(281, 0xe701450506010000008a1500),
(281, 0xf00142050601000000e60200),
(281, 0xf00143050601000000e70200),
(282, 0xe701560506010000008a1500),
(282, 0xf00153050601000000e60200),
(282, 0xf00154050601000000e70200),
(283, 0xe701630506010000008a1500),
(283, 0xf00160050601000000e60200),
(283, 0xf00161050601000000e70200),
(284, 0xce017c0506010000008c1500),
(284, 0xd2017f050601000000e60200),
(284, 0xce01860506010000008c1500),
(284, 0xd20180050601000000e70200),
(285, 0xde017c0506010000008c1500),
(285, 0xe2017f050601000000e60200),
(285, 0xde01860506010000008c1500),
(285, 0xe20180050601000000e70200),
(286, 0xb50145050701000000e60200),
(286, 0xb50146050701000000e70200),
(286, 0xbb01480507010000008a1500),
(287, 0xc70145050701000000e60200),
(287, 0xc70146050701000000e70200),
(287, 0xc101480507010000008a1500),
(288, 0xb5013b050701000000e60200),
(288, 0xb5013c050701000000e70200),
(288, 0xbb013e0507010000008a1500),
(289, 0xc7013b050701000000e60200),
(289, 0xc1013e0507010000008a1500),
(289, 0xc7013c050701000000e70200),
(290, 0xd701400507010000008a1500),
(290, 0xda01420507010000008c1500),
(290, 0xdd01400507010000008a1500),
(290, 0xd30147050701000000e60200),
(290, 0xd40147050701000000e60200),
(290, 0xd30148050701000000e70200),
(290, 0xd40148050701000000e70200),
(290, 0xe00147050701000000e60200),
(290, 0xe10147050701000000e60200),
(290, 0xe00148050701000000e70200),
(290, 0xe10148050701000000e70200),
(291, 0xd30136050701000000e80200),
(291, 0xd40136050701000000e90200),
(291, 0xd70136050701000000e80200),
(291, 0xd80136050701000000e90200),
(291, 0xd601390507010000008c1500),
(291, 0xdc01390507010000008a1500),
(292, 0xd3012d050701000000e60200),
(292, 0xd3012e050701000000e70200),
(292, 0xd30132050701000000e60200),
(292, 0xd30133050701000000e70200),
(292, 0xdc01300507010000008a1500),
(293, 0xe6014a0507010000008a1500),
(293, 0xf20143050701000000e60200),
(293, 0xf50143050701000000e60200),
(293, 0xf20144050701000000e70200),
(293, 0xf401460507010000008c1500),
(293, 0xf50144050701000000e70200),
(293, 0xf2014f050701000000e60200),
(293, 0xf4014d0507010000008c1500),
(293, 0xf5014f050701000000e60200),
(293, 0xf20150050701000000e70200),
(293, 0xf50150050701000000e70200),
(294, 0xe7015d0507010000008a1500),
(295, 0xe70163050801000000e60200),
(295, 0xe701650507010000008a1500),
(295, 0xe70164050801000000e70200),
(296, 0xe7016b050801000000e60200),
(296, 0xe7016d0507010000008a1500),
(296, 0xe7016c050801000000e70200),
(297, 0xcb016c0507010000008a1500),
(297, 0xd401630507010000008a1500),
(297, 0xdc0168050701000000e80200),
(297, 0xdc016b050701000000e80200),
(297, 0xdd0168050701000000e90200),
(297, 0xdd016b050701000000e90200),
(297, 0xde0168050701000000e80200),
(297, 0xde016b050701000000e80200),
(297, 0xdf0168050701000000e90200),
(297, 0xdf016b050701000000e90200),
(297, 0xd0016c0507010000008a1500),
(297, 0xce01710507010000008c1500),
(298, 0xb403de040601000000731b00),
(298, 0xb403de040701000000731b00),
(298, 0xb803df040601000000e20200),
(298, 0xba03de040601000000731b00),
(298, 0xbb03df040601000000e20200),
(298, 0xb903de040701000000731b00),
(298, 0xb203e0040601000000741b00),
(298, 0xb203e0040701000000741b00),
(298, 0xb703e2040601000000f71a00),
(298, 0xb603e0040701000000f71a00),
(298, 0xb803e0040601000000e30200),
(298, 0xbb03e0040601000000e30200),
(298, 0xbc03e2040601000000e20200),
(298, 0xbc03e3040601000000e30200),
(298, 0xbd03e3040701000000f71a00),
(298, 0xb203e4040601000000741b00),
(298, 0xb403e6040601000000731b00),
(298, 0xb403e6040701000000731b00),
(298, 0xb903e6040601000000731b00),
(298, 0xba03e6040601000000ee1a00),
(298, 0xbb03e5040601000000e40200),
(298, 0xbb03e6040601000000731b00),
(298, 0xbc03e5040601000000e50200),
(298, 0xbd03e4040601000000741b00),
(298, 0xbd03e4040701000000741b00),
(298, 0xb703e8040701000000741b00),
(298, 0xba03e9040701000000ee1a00),
(298, 0xbd03e8040701000000741b00),
(299, 0xe603b3040601000000e00200),
(299, 0xe703b3040601000000e10200),
(299, 0xe903b8040601000000412000),
(300, 0xd103bf040701000000de0200),
(300, 0xd003c2040701000000412000),
(300, 0xd103c0040701000000df0200);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tmpwoe`
--

CREATE TABLE `tmpwoe` (
  `started` int(11) NOT NULL,
  `guild` int(11) NOT NULL,
  `breaker` int(111) NOT NULL,
  `time` int(1) NOT NULL,
  `indexer` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tmpwoe`
--

INSERT INTO `tmpwoe` (`started`, `guild`, `breaker`, `time`, `indexer`) VALUES
(1676246145, 3, 268435465, 1674773198, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `towns`
--

CREATE TABLE `towns` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `categoria` int(11) NOT NULL,
  `link` varchar(11) NOT NULL,
  `ativo` int(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `videos_categorias`
--

CREATE TABLE `videos_categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `videos_comentarios`
--

CREATE TABLE `videos_comentarios` (
  `id` int(11) NOT NULL,
  `mensagem` text NOT NULL,
  `character` varchar(255) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `topico` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp(),
  `ativo` int(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `woe`
--

CREATE TABLE `woe` (
  `id` int(11) NOT NULL,
  `started` int(11) NOT NULL,
  `guild` int(11) NOT NULL,
  `breaker` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `woe`
--

INSERT INTO `woe` (`id`, `started`, `guild`, `breaker`, `time`) VALUES
(1, 1673381353, 0, 0, 0),
(2, 1673382052, 0, 0, 0),
(3, 1673382987, 0, 0, 0),
(4, 1673384175, 3, 268435465, 1673384265),
(5, 1673384175, 3, 268435465, 1673384265),
(6, 1674772015, 4, 268435466, 1674772383),
(7, 1674773149, 4, 268435466, 1674773198),
(8, 1676246145, 3, 268435465, 1674773198);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_changelogs`
--

CREATE TABLE `z_changelogs` (
  `id_changelog` int(11) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_forum`
--

CREATE TABLE `z_forum` (
  `id` int(11) NOT NULL,
  `first_post` int(11) NOT NULL DEFAULT 0,
  `last_post` int(11) NOT NULL DEFAULT 0,
  `section` int(3) NOT NULL DEFAULT 0,
  `replies` int(20) NOT NULL DEFAULT 0,
  `views` int(20) NOT NULL DEFAULT 0,
  `author_aid` int(20) NOT NULL DEFAULT 0,
  `author_guid` int(20) NOT NULL DEFAULT 0,
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL,
  `post_smile` tinyint(1) NOT NULL DEFAULT 0,
  `post_date` int(20) NOT NULL DEFAULT 0,
  `last_edit_aid` int(20) NOT NULL DEFAULT 0,
  `edit_date` int(20) NOT NULL DEFAULT 0,
  `post_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `icon_id` int(11) NOT NULL,
  `news_icon` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `z_forum`
--

INSERT INTO `z_forum` (`id`, `first_post`, `last_post`, `section`, `replies`, `views`, `author_aid`, `author_guid`, `post_text`, `post_topic`, `post_smile`, `post_date`, `last_edit_aid`, `edit_date`, `post_ip`, `icon_id`, `news_icon`) VALUES
(1, 1, 1642011224, 3, 0, 2, 1, 7, '<p>adasdasdasdasdasdsa</p>', 'Teste', 0, 1642011224, 0, 0, '127.0.0.1', 27, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_helpdesk`
--

CREATE TABLE `z_helpdesk` (
  `account` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `text` text NOT NULL,
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL,
  `reply` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `tag` int(11) NOT NULL,
  `registered` timestamp NOT NULL DEFAULT current_timestamp(),
  `t_id` varchar(11) NOT NULL,
  `c_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_hunt_wiki`
--

CREATE TABLE `z_hunt_wiki` (
  `id` int(11) NOT NULL,
  `city` int(2) NOT NULL DEFAULT 0,
  `monster` varchar(50) NOT NULL DEFAULT '0',
  `level` int(5) NOT NULL DEFAULT 0,
  `type` int(2) NOT NULL DEFAULT 0,
  `image_url` varchar(255) NOT NULL DEFAULT '0',
  `video_url` varchar(500) NOT NULL DEFAULT '0',
  `id_user` int(11) NOT NULL DEFAULT 1,
  `active` int(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `z_hunt_wiki`
--

INSERT INTO `z_hunt_wiki` (`id`, `city`, `monster`, `level`, `type`, `image_url`, `video_url`, `id_user`, `active`) VALUES
(1, 1, 'Dragon Lord', 50, 5, 'http://127.0.0.1/layouts/realsoft/images/wiki/hunts/artemisias-hunts.png', 'https://www.youtube-nocookie.com/embed/g9Wu0FMP68A', 1, 1),
(2, 6, 'Dragon Lair', 30, 2, 'http://127.0.0.1/layouts/realsoft/images/wiki/hunts/Nissea-hunts.png', 'https://www.youtube-nocookie.com/embed/g9Wu0FMP68A', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_network_box`
--

CREATE TABLE `z_network_box` (
  `id` int(11) NOT NULL,
  `network_name` varchar(10) NOT NULL,
  `network_link` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_news_tickers`
--

CREATE TABLE `z_news_tickers` (
  `date` int(11) NOT NULL DEFAULT 1,
  `author` int(11) NOT NULL,
  `image_id` int(3) NOT NULL DEFAULT 0,
  `text` text NOT NULL,
  `hide_ticker` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_ots_comunication`
--

CREATE TABLE `z_ots_comunication` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` int(11) NOT NULL,
  `param2` int(11) NOT NULL,
  `param3` int(11) NOT NULL,
  `param4` int(11) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` int(11) NOT NULL,
  `param8` int(11) NOT NULL,
  `param9` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_ots_guildcomunication`
--

CREATE TABLE `z_ots_guildcomunication` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_polls`
--

CREATE TABLE `z_polls` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `end` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `answers` int(11) NOT NULL,
  `votes_all` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_polls_answers`
--

CREATE TABLE `z_polls_answers` (
  `poll_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_replay`
--

CREATE TABLE `z_replay` (
  `title` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shopguild_history_item`
--

CREATE TABLE `z_shopguild_history_item` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT 0,
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `offer_id` int(11) NOT NULL DEFAULT 0,
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT 0,
  `trans_real` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shopguild_history_pacc`
--

CREATE TABLE `z_shopguild_history_pacc` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT 0,
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `pacc_days` int(11) NOT NULL DEFAULT 0,
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT 0,
  `trans_real` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shopguild_offer`
--

CREATE TABLE `z_shopguild_offer` (
  `id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `itemid1` int(11) NOT NULL DEFAULT 0,
  `count1` int(11) NOT NULL DEFAULT 0,
  `itemid2` int(11) NOT NULL DEFAULT 0,
  `count2` int(11) NOT NULL DEFAULT 0,
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_category`
--

CREATE TABLE `z_shop_category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `button` varchar(50) NOT NULL,
  `hide` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `z_shop_category`
--

INSERT INTO `z_shop_category` (`id`, `name`, `desc`, `button`, `hide`) VALUES
(2, 'Extra Services', 'Buy an extra service to transfer a character to another game world, to change your character name or sex, to change your account name, or to get a new recovery key.', '_sbutton_getextraservice.gif', 0),
(3, 'Mounts', 'Buy your characters one or more of the fabulous mounts offered here.', '_sbutton_getmount.gif', 0),
(4, 'Outfits', 'Buy your characters one or more of the fancy outfits offered here.', '_sbutton_getoutfit.gif', 0),
(5, 'Items', 'Buy items for your character be more stronger in the game.', '_sbutton_getitem.gif', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_donates`
--

CREATE TABLE `z_shop_donates` (
  `id` int(11) NOT NULL,
  `date` bigint(20) NOT NULL,
  `reference` varchar(50) NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `price` varchar(20) NOT NULL,
  `coins` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `z_shop_donates`
--

INSERT INTO `z_shop_donates` (`id`, `date`, `reference`, `account_name`, `method`, `price`, `coins`, `status`) VALUES
(1, 1673371307, 'mercadoPago-618', 'GU985423', 'mercadoPago', '10', 10, 'rejected'),
(2, 1673371331, 'picpay-1917', 'GU985423', 'picpay', '40', 40, 'rejected'),
(3, 1676289841, 'mercadoPago-4732', 'GU985423', 'mercadoPago', '160', 200, 'rejected');

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_donate_confirm`
--

CREATE TABLE `z_shop_donate_confirm` (
  `id` int(11) NOT NULL,
  `date` bigint(20) NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `donate_id` int(11) NOT NULL,
  `msg` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `z_shop_donate_confirm`
--

INSERT INTO `z_shop_donate_confirm` (`id`, `date`, `account_name`, `donate_id`, `msg`) VALUES
(1, 1676292584, 'GU985423', 3, 'asdfsaafSfsads\r\nadsadas\r\ndsadasdasdasdasdsadas'),
(2, 1676292897, 'GU985423', 1, 'saddsadasdasdasdasdassdsadasdadassdadsa'),
(3, 1676292936, 'GU985423', 2, 'sadsadsadasdasdasd\r\nasdsadsad\r\nasdasdsadasdasdasdsdad');

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_history_item`
--

CREATE TABLE `z_shop_history_item` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT 0,
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `offer_id` varchar(255) NOT NULL DEFAULT '',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT 0,
  `trans_real` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_offer`
--

CREATE TABLE `z_shop_offer` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `coins` int(11) NOT NULL DEFAULT 0,
  `price` varchar(50) NOT NULL,
  `itemid` int(11) NOT NULL DEFAULT 0,
  `mount_id` varchar(100) NOT NULL,
  `addon_name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `offer_date` int(11) NOT NULL,
  `default_image` varchar(50) NOT NULL,
  `hide` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `z_shop_offer`
--

INSERT INTO `z_shop_offer` (`id`, `category`, `coins`, `price`, `itemid`, `mount_id`, `addon_name`, `count`, `offer_type`, `offer_description`, `offer_name`, `offer_date`, `default_image`, `hide`) VALUES
(1, 2, 250, '0', 0, '0', '', 1, 'changename', 'Buy a character name change to rename one of your characters.', 'Character Change Name', 1637974191, 'changename.png', 0),
(2, 2, 250, '0', 0, '0', '', 1, 'changesex', 'Buy a character sex change to turn your male character into a female one, or your female character into a male one.', 'Character Change Sex', 1637974191, 'changesex.png', 1),
(3, 2, 250, '0', 0, '0', '', 1, 'changeaccountname', 'Buy an account name change to select a different name for your account.', 'Account Name Change', 1637974191, 'changeaccountname.png', 0),
(4, 2, 250, '0', 0, '0', '', 1, 'newrk', 'If you need a new recovery key, you can order it here. Note that the letter for the new recovery key can only be sent to the address in the account registration.', 'Recovery Key', 1637974191, 'newrk.png', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `z_shop_payment`
--

CREATE TABLE `z_shop_payment` (
  `id` int(11) NOT NULL,
  `ref` varchar(10) NOT NULL,
  `account_name` varchar(50) NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_category_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `price` varchar(50) NOT NULL,
  `coins` int(11) UNSIGNED NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'waiting',
  `date` int(11) NOT NULL,
  `gift` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `name_2` (`name`),
  ADD UNIQUE KEY `name_3` (`name`);

--
-- Índices para tabela `accounts_storage`
--
ALTER TABLE `accounts_storage`
  ADD PRIMARY KEY (`account_id`,`key`);

--
-- Índices para tabela `account_authentication`
--
ALTER TABLE `account_authentication`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `account_bans`
--
ALTER TABLE `account_bans`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Índices para tabela `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `banned_by` (`banned_by`),
  ADD KEY `account_id_2` (`account_id`),
  ADD KEY `account_id_3` (`account_id`),
  ADD KEY `account_id_4` (`account_id`),
  ADD KEY `account_id_5` (`account_id`);

--
-- Índices para tabela `account_character_sale`
--
ALTER TABLE `account_character_sale`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_player_UNIQUE` (`id_player`),
  ADD KEY `account_character_sale_ibfk_2` (`id_account`);

--
-- Índices para tabela `account_registration`
--
ALTER TABLE `account_registration`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD UNIQUE KEY `account_player_index` (`account_id`,`player_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `atr_wikki_category`
--
ALTER TABLE `atr_wikki_category`
  ADD PRIMARY KEY (`id_atr_wikki_category`);

--
-- Índices para tabela `atr_wikki_subcategory`
--
ALTER TABLE `atr_wikki_subcategory`
  ADD PRIMARY KEY (`id_atr_wikki_subcategory`),
  ADD KEY `FK_ID_WIKKI_CATEGORY_idx` (`id_atr_wikki_category`);

--
-- Índices para tabela `blessings_history`
--
ALTER TABLE `blessings_history`
  ADD KEY `blessings_history_ibfk_1` (`player_id`);

--
-- Índices para tabela `boosted_creature`
--
ALTER TABLE `boosted_creature`
  ADD PRIMARY KEY (`date`);

--
-- Índices para tabela `canary_achievements`
--
ALTER TABLE `canary_achievements`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_badges`
--
ALTER TABLE `canary_badges`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_boss`
--
ALTER TABLE `canary_boss`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_compendium`
--
ALTER TABLE `canary_compendium`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_countdowns`
--
ALTER TABLE `canary_countdowns`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_creatures`
--
ALTER TABLE `canary_creatures`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_groups`
--
ALTER TABLE `canary_groups`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_items`
--
ALTER TABLE `canary_items`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_news`
--
ALTER TABLE `canary_news`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_payments`
--
ALTER TABLE `canary_payments`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_polls`
--
ALTER TABLE `canary_polls`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_polls_answers`
--
ALTER TABLE `canary_polls_answers`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_polls_questions`
--
ALTER TABLE `canary_polls_questions`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_products`
--
ALTER TABLE `canary_products`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_samples`
--
ALTER TABLE `canary_samples`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_towns`
--
ALTER TABLE `canary_towns`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_uploads`
--
ALTER TABLE `canary_uploads`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_website`
--
ALTER TABLE `canary_website`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_worldquests`
--
ALTER TABLE `canary_worldquests`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `canary_worlds`
--
ALTER TABLE `canary_worlds`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `castle`
--
ALTER TABLE `castle`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `coins_transactions`
--
ALTER TABLE `coins_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `coins_transactions_pk` (`account_id`);

--
-- Índices para tabela `daily_reward_history`
--
ALTER TABLE `daily_reward_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `forge_history`
--
ALTER TABLE `forge_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `free_pass`
--
ALTER TABLE `free_pass`
  ADD KEY `free_pass_ibfk_1` (`player_id`);

--
-- Índices para tabela `global_storage`
--
ALTER TABLE `global_storage`
  ADD UNIQUE KEY `key` (`key`);

--
-- Índices para tabela `guilds`
--
ALTER TABLE `guilds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `ownerid` (`ownerid`);

--
-- Índices para tabela `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warid` (`warid`);

--
-- Índices para tabela `guild_actions_h`
--
ALTER TABLE `guild_actions_h`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `guild_events`
--
ALTER TABLE `guild_events`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD PRIMARY KEY (`player_id`,`guild_id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Índices para tabela `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `guild_id` (`guild_id`),
  ADD KEY `rank_id` (`rank_id`);

--
-- Índices para tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Índices para tabela `guild_transfer_h`
--
ALTER TABLE `guild_transfer_h`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild1` (`guild1`),
  ADD KEY `guild2` (`guild2`);

--
-- Índices para tabela `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`),
  ADD KEY `town_id` (`town_id`);

--
-- Índices para tabela `house_lists`
--
ALTER TABLE `house_lists`
  ADD KEY `house_id` (`house_id`);

--
-- Índices para tabela `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD PRIMARY KEY (`ip`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Índices para tabela `live_casts`
--
ALTER TABLE `live_casts`
  ADD UNIQUE KEY `player_id_2` (`player_id`);

--
-- Índices para tabela `lottery`
--
ALTER TABLE `lottery`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `market_history`
--
ALTER TABLE `market_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`,`sale`);

--
-- Índices para tabela `market_offers`
--
ALTER TABLE `market_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale` (`sale`,`itemtype`),
  ADD KEY `created` (`created`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `newsticker`
--
ALTER TABLE `newsticker`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pagseguro_transactions`
--
ALTER TABLE `pagseguro_transactions`
  ADD UNIQUE KEY `transaction_code` (`transaction_code`,`status`),
  ADD KEY `name` (`name`),
  ADD KEY `status` (`status`);

--
-- Índices para tabela `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `vocation` (`vocation`);

--
-- Índices para tabela `players_online`
--
ALTER TABLE `players_online`
  ADD PRIMARY KEY (`player_id`);

--
-- Índices para tabela `player_badges`
--
ALTER TABLE `player_badges`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `player_binary_items`
--
ALTER TABLE `player_binary_items`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`type`);

--
-- Índices para tabela `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD KEY `player_id` (`player_id`),
  ADD KEY `killed_by` (`killed_by`),
  ADD KEY `mostdamage_by` (`mostdamage_by`);

--
-- Índices para tabela `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Índices para tabela `player_depotlockeritems`
--
ALTER TABLE `player_depotlockeritems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Índices para tabela `player_display`
--
ALTER TABLE `player_display`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `player_former_names`
--
ALTER TABLE `player_former_names`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `player_hirelings`
--
ALTER TABLE `player_hirelings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Índices para tabela `player_items`
--
ALTER TABLE `player_items`
  ADD KEY `player_id` (`player_id`),
  ADD KEY `sid` (`sid`);

--
-- Índices para tabela `player_kills`
--
ALTER TABLE `player_kills`
  ADD KEY `player_kills_ibfk_1` (`player_id`),
  ADD KEY `player_kills_ibfk_2` (`target`);

--
-- Índices para tabela `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `namelocked_by` (`namelocked_by`);

--
-- Índices para tabela `player_preydata`
--
ALTER TABLE `player_preydata`
  ADD PRIMARY KEY (`player_id`);

--
-- Índices para tabela `player_rewards`
--
ALTER TABLE `player_rewards`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Índices para tabela `player_spells`
--
ALTER TABLE `player_spells`
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `player_storage`
--
ALTER TABLE `player_storage`
  ADD PRIMARY KEY (`player_id`,`key`);

--
-- Índices para tabela `prey_slots`
--
ALTER TABLE `prey_slots`
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `quickloot_containers`
--
ALTER TABLE `quickloot_containers`
  ADD KEY `fk_quickloot_containers_player_id` (`player_id`);

--
-- Índices para tabela `sellchar`
--
ALTER TABLE `sellchar`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sell_players`
--
ALTER TABLE `sell_players`
  ADD PRIMARY KEY (`player_id`);

--
-- Índices para tabela `sell_players_history`
--
ALTER TABLE `sell_players_history`
  ADD PRIMARY KEY (`player_id`,`buytime`) USING BTREE;

--
-- Índices para tabela `server_config`
--
ALTER TABLE `server_config`
  ADD PRIMARY KEY (`config`);

--
-- Índices para tabela `snowballwar`
--
ALTER TABLE `snowballwar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Índices para tabela `store_history`
--
ALTER TABLE `store_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `store_history_pk` (`account_id`);

--
-- Índices para tabela `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `tickets_ibfk_1` (`ticket_author_acc_id`);

--
-- Índices para tabela `tickets_reply`
--
ALTER TABLE `tickets_reply`
  ADD PRIMARY KEY (`reply_id`),
  ADD KEY `tickets_reply_ibfk_1` (`ticket_id`);

--
-- Índices para tabela `tile_store`
--
ALTER TABLE `tile_store`
  ADD KEY `house_id` (`house_id`);

--
-- Índices para tabela `towns`
--
ALTER TABLE `towns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices para tabela `woe`
--
ALTER TABLE `woe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices para tabela `z_forum`
--
ALTER TABLE `z_forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section` (`section`);

--
-- Índices para tabela `z_hunt_wiki`
--
ALTER TABLE `z_hunt_wiki`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_ots_guildcomunication`
--
ALTER TABLE `z_ots_guildcomunication`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_shop_category`
--
ALTER TABLE `z_shop_category`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_shop_donates`
--
ALTER TABLE `z_shop_donates`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_shop_donate_confirm`
--
ALTER TABLE `z_shop_donate_confirm`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `z_shop_payment`
--
ALTER TABLE `z_shop_payment`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `account_authentication`
--
ALTER TABLE `account_authentication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `account_ban_history`
--
ALTER TABLE `account_ban_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `account_character_sale`
--
ALTER TABLE `account_character_sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `account_registration`
--
ALTER TABLE `account_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `atr_wikki_category`
--
ALTER TABLE `atr_wikki_category`
  MODIFY `id_atr_wikki_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `atr_wikki_subcategory`
--
ALTER TABLE `atr_wikki_subcategory`
  MODIFY `id_atr_wikki_subcategory` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_achievements`
--
ALTER TABLE `canary_achievements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_badges`
--
ALTER TABLE `canary_badges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_boss`
--
ALTER TABLE `canary_boss`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_compendium`
--
ALTER TABLE `canary_compendium`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_countdowns`
--
ALTER TABLE `canary_countdowns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_creatures`
--
ALTER TABLE `canary_creatures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_groups`
--
ALTER TABLE `canary_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `canary_items`
--
ALTER TABLE `canary_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_news`
--
ALTER TABLE `canary_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_payments`
--
ALTER TABLE `canary_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_polls`
--
ALTER TABLE `canary_polls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_polls_answers`
--
ALTER TABLE `canary_polls_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_polls_questions`
--
ALTER TABLE `canary_polls_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_products`
--
ALTER TABLE `canary_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `canary_samples`
--
ALTER TABLE `canary_samples`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `canary_towns`
--
ALTER TABLE `canary_towns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `canary_uploads`
--
ALTER TABLE `canary_uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_website`
--
ALTER TABLE `canary_website`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `canary_worldquests`
--
ALTER TABLE `canary_worldquests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `canary_worlds`
--
ALTER TABLE `canary_worlds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `castle`
--
ALTER TABLE `castle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `coins_transactions`
--
ALTER TABLE `coins_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `daily_reward_history`
--
ALTER TABLE `daily_reward_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `forge_history`
--
ALTER TABLE `forge_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1829;

--
-- AUTO_INCREMENT de tabela `guilds`
--
ALTER TABLE `guilds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guild_actions_h`
--
ALTER TABLE `guild_actions_h`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guild_events`
--
ALTER TABLE `guild_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `guild_transfer_h`
--
ALTER TABLE `guild_transfer_h`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=659;

--
-- AUTO_INCREMENT de tabela `lottery`
--
ALTER TABLE `lottery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `market_history`
--
ALTER TABLE `market_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `market_offers`
--
ALTER TABLE `market_offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `newsticker`
--
ALTER TABLE `newsticker`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `player_badges`
--
ALTER TABLE `player_badges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `player_display`
--
ALTER TABLE `player_display`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `player_former_names`
--
ALTER TABLE `player_former_names`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `player_hirelings`
--
ALTER TABLE `player_hirelings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sellchar`
--
ALTER TABLE `sellchar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `snowballwar`
--
ALTER TABLE `snowballwar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `store_history`
--
ALTER TABLE `store_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tickets_reply`
--
ALTER TABLE `tickets_reply`
  MODIFY `reply_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `towns`
--
ALTER TABLE `towns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `woe`
--
ALTER TABLE `woe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `z_forum`
--
ALTER TABLE `z_forum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `z_hunt_wiki`
--
ALTER TABLE `z_hunt_wiki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `z_ots_guildcomunication`
--
ALTER TABLE `z_ots_guildcomunication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `z_shop_category`
--
ALTER TABLE `z_shop_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `z_shop_donates`
--
ALTER TABLE `z_shop_donates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `z_shop_donate_confirm`
--
ALTER TABLE `z_shop_donate_confirm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `z_shop_payment`
--
ALTER TABLE `z_shop_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `accounts_storage`
--
ALTER TABLE `accounts_storage`
  ADD CONSTRAINT `accounts_storage_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `account_bans`
--
ALTER TABLE `account_bans`
  ADD CONSTRAINT `account_bans_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_bans_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD CONSTRAINT `account_ban_history_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ban_history_ibfk_3` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ban_history_ibfk_4` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ban_history_ibfk_5` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ban_history_ibfk_6` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `account_character_sale`
--
ALTER TABLE `account_character_sale`
  ADD CONSTRAINT `account_character_sale_ibfk_1` FOREIGN KEY (`id_player`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_character_sale_ibfk_2` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `atr_wikki_subcategory`
--
ALTER TABLE `atr_wikki_subcategory`
  ADD CONSTRAINT `FK_ID_WIKKI_CATEGORY` FOREIGN KEY (`id_atr_wikki_category`) REFERENCES `atr_wikki_category` (`id_atr_wikki_category`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `blessings_history`
--
ALTER TABLE `blessings_history`
  ADD CONSTRAINT `blessings_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `forge_history`
--
ALTER TABLE `forge_history`
  ADD CONSTRAINT `forge_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `free_pass`
--
ALTER TABLE `free_pass`
  ADD CONSTRAINT `free_pass_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guilds`
--
ALTER TABLE `guilds`
  ADD CONSTRAINT `guilds_ibfk_1` FOREIGN KEY (`ownerid`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD CONSTRAINT `guildwar_kills_ibfk_1` FOREIGN KEY (`warid`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD CONSTRAINT `guild_membership_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_ibfk_3` FOREIGN KEY (`rank_id`) REFERENCES `guild_ranks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `house_lists`
--
ALTER TABLE `house_lists`
  ADD CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD CONSTRAINT `ip_bans_ibfk_1` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `live_casts`
--
ALTER TABLE `live_casts`
  ADD CONSTRAINT `live_casts_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `market_history`
--
ALTER TABLE `market_history`
  ADD CONSTRAINT `market_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `market_offers`
--
ALTER TABLE `market_offers`
  ADD CONSTRAINT `market_offers_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD CONSTRAINT `player_depotitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_depotlockeritems`
--
ALTER TABLE `player_depotlockeritems`
  ADD CONSTRAINT `player_depotlockeritems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_hirelings`
--
ALTER TABLE `player_hirelings`
  ADD CONSTRAINT `player_hirelings_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD CONSTRAINT `player_inboxitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_items`
--
ALTER TABLE `player_items`
  ADD CONSTRAINT `player_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_kills`
--
ALTER TABLE `player_kills`
  ADD CONSTRAINT `player_kills_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_kills_ibfk_2` FOREIGN KEY (`target`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `player_namelocks_ibfk_2` FOREIGN KEY (`namelocked_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `player_preydata`
--
ALTER TABLE `player_preydata`
  ADD CONSTRAINT `player_preydata_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `player_rewards`
--
ALTER TABLE `player_rewards`
  ADD CONSTRAINT `player_rewards_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_spells`
--
ALTER TABLE `player_spells`
  ADD CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_storage`
--
ALTER TABLE `player_storage`
  ADD CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `prey_slots`
--
ALTER TABLE `prey_slots`
  ADD CONSTRAINT `prey_slots_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `quickloot_containers`
--
ALTER TABLE `quickloot_containers`
  ADD CONSTRAINT `fk_quickloot_containers_player_id` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`);

--
-- Limitadores para a tabela `sellchar`
--
ALTER TABLE `sellchar`
  ADD CONSTRAINT `sellchar_ibfk_1` FOREIGN KEY (`id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `sell_players`
--
ALTER TABLE `sell_players`
  ADD CONSTRAINT `sell_players_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `sell_players_history`
--
ALTER TABLE `sell_players_history`
  ADD CONSTRAINT `sell_players_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`ticket_author_acc_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tickets_reply`
--
ALTER TABLE `tickets_reply`
  ADD CONSTRAINT `tickets_reply_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tile_store`
--
ALTER TABLE `tile_store`
  ADD CONSTRAINT `tile_store_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
