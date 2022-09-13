-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09-Set-2022 às 14:24
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `canaryaac`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `password` char(40) NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `page_access` int(11) NOT NULL DEFAULT 0,
  `premdays` int(11) NOT NULL DEFAULT 0,
  `lastday` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `coins` int(12) UNSIGNED NOT NULL DEFAULT 0,
  `creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `recruiter` int(6) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `password`, `email`, `page_access`, `premdays`, `lastday`, `type`, `coins`, `creation`, `recruiter`) VALUES
(1, '', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 'test@test.com', 3, 0, 0, 5, 0, '2022-08-03 08:44:10', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_authentication`
--

CREATE TABLE `account_authentication` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_bans`
--

CREATE TABLE `account_bans` (
  `account_id` int(11) UNSIGNED NOT NULL,
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
  `id` int(11) NOT NULL,
  `account_id` int(11) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expired_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `account_viplist`
--

CREATE TABLE `account_viplist` (
  `account_id` int(11) UNSIGNED NOT NULL COMMENT 'id of account whose viplist entry it is',
  `player_id` int(11) NOT NULL COMMENT 'id of target player of viplist entry',
  `description` varchar(128) NOT NULL DEFAULT '',
  `icon` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `notify` tinyint(1) NOT NULL DEFAULT 0
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(334, 0, 0, 0, 0, 0, 0, '31', 'Draken Warmaster', '617');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `canary_achievements`
--

INSERT INTO `canary_achievements` (`id`, `name`, `description`, `grade`, `points`, `storage`, `secret`) VALUES
(1, 'Allow Cookies?', 'With a perfectly harmless smile you fooled all of those wisecrackers into eating your exploding cookies. Consider a boy or girl scout outfit next time to make the trick even better.', 1, 2, 1, 0),
(2, 'Allowance Collector', 'You certainly have your ways when it comes to acquiring money. Many of them are pink and paved with broken fragments of porcelain.', 1, 2, 2, 1),
(3, 'Amateur Actor', 'You helped bringing Princess Buttercup, Doctor Dumbness and Lucky the Wonder Dog to life - and will probably dream of them tonight, since you memorised your lines perfectly. What a .. special piece of.. screenplay.', 1, 2, 3, 0),
(4, 'Animal Activist', 'You have a soft spot for little, weak animals, and you do everything in your power to protect them - even if you probably eat dragons for breakfast.', 1, 2, 4, 0),
(5, 'Annihilator', 'You\'ve daringly jumped into the infamous Annihilator and survived - taking home fame, glory and your reward.', 2, 5, 5, 0),
(6, 'Archpostman', 'Delivering letters and parcels has always been a secret passion of yours, and now you can officially put on your blue hat, blow your Post Horn and do what you like to do most. Beware of dogs!', 1, 3, 6, 0),
(7, 'Backpack Tourist', 'If someone lost a random thing in a random place, you\'re probably a good person to ask and go find it, even if you don\'t know what and where.', 1, 1, 7, 1),
(8, 'Beach Tamer', 'You re-enacted the Taming of the Shrew on a beach setting and proved that you can handle capricious girls quite well. With or without fish tails.', 1, 2, 8, 0),
(9, 'Bearhugger', 'Warm, furry and cuddly - though that same bear you just hugged would probably rip you into pieces if he had been conscious, he reminded you of that old teddy bear which always slept in your bed when you were still small.', 1, 1, 9, 0),
(10, 'Blessed!', 'You travelled the world for an almost meaningless prayer - but at least you don\'t have to do that again and can get a new blessed stake in the blink of an eye.', 1, 2, 10, 0),
(11, 'Bone Brother', 'You\'ve joined the undead bone brothers - making death your enemy and your weapon as well. Devouring what\'s weak and leaving space for what\'s strong is your primary goal.', 1, 1, 11, 0),
(12, 'Castlemania', 'You have an eye for suspicious places and love to read other people\'s diaries, especially those with vampire stories in it. You\'re also a dedicated token collector and explorer. Respect!', 2, 5, 12, 1),
(13, 'Champion of Chazorai', 'You won the merciless 2 vs. 2 team tournament on the Isle of Strife and wiped out wave after wave of fearsome opponents. Death or victory - you certainly chose the latter.', 2, 4, 13, 0),
(14, 'Chorister', 'Lalalala... you now know the cult\'s hymn sung in Liberty Bay', 1, 1, 14, 0),
(15, 'Clay Fighter', 'You love getting your hands wet and dirty - and covered with clay. Your perfect sculpture of Brog, the raging Titan is your true masterpiece.', 1, 3, 15, 1),
(16, 'Clay to Fame', 'Sculpting Brog, the raging Titan, is your secret passion. Numerous perfect little clay statues with your name on them can be found everywhere around Tibia.', 2, 6, 16, 1),
(17, 'Cold as Ice', 'Take an ice cube and an obsidian knife and you\'ll very likely shape something really pretty from it. Mostly cute little mammoths, which are a hit with all the girls.', 2, 6, 17, 1),
(18, 'Culinary Master', 'Simple hams and bread merely make you laugh. You\'re the master of the extra-ordinaire, melter of cheese, fryer of bat wings and shaker of shakes. Delicious!', 2, 4, 18, 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `canary_badges`
--

INSERT INTO `canary_badges` (`id`, `image`, `name`, `description`, `number`) VALUES
(1, 'badge_accountage4.png', 'Ancient Hero', 'The account is older than 15 years.', 15),
(2, 'badge_accountage3.png', 'Senior Hero', 'The account is older than 10 years.', 10),
(3, 'badge_accountage2.png', 'Veteran Hero', 'The account is older than 5 years.', 5),
(4, 'badge_accountage1.png', 'Fledgeling Hero', 'The account is older than 1 year.', 1),
(5, 'badge_tibialoyalist1.png', 'Tibia Loyalist (Grade 1)', 'The account earned more than 100 loyalty points.', 100),
(6, 'badge_globalplayer1.png', 'Global Player (Grade 1)', 'Summing up the levels of all characters on the account amounts to at least 500.', 500),
(7, 'badge_exaltedhero1.png', 'Exalted Hero', 'The account is older than 20 years.', 20),
(8, 'badge_.png', 'Tibia Loyalist (Grade 3)', 'The account earned more than 5000 loyalty points.', 5000),
(9, 'badge_.png', 'Tibia Loyalist (Grade 2)', 'The account earned more than 1000 loyalty points.', 1000),
(10, 'badge_.png', 'Global Player (Grade 3)', 'Summing up the levels of all characters on the account amounts to at least 2000.', 2000),
(11, 'badge_.png', 'Global Player (Grade 2)', 'Summing up the levels of all characters on the account amounts to at least 1000.', 1000),
(12, 'badge_.png', 'Hero of the Tournament', 'The account participated 10x in a Tournament.', 10),
(13, 'badge_.png', 'Regular of the Tournament', 'The account participated 5x in a Tournament.', 5),
(14, 'badge_.png', 'Freshman of the Tournament', 'The account participated 1x in a Tournament.', 1),
(15, 'badge_.png', 'Tournament Champion', 'The account reached a Tournament Rating of 10000 (equals the Tournament Coins earned in all Tournaments).', 10000),
(16, 'badge_.png', 'Tournament Master', 'The account reached a Tournament Rating of 5000 (equals the Tournament Coins earned in all Tournaments).', 5000),
(17, 'badge_.png', 'Tournament Challenger', 'The account reached a Tournament Rating of 2500 (equals the Tournament Coins earned in all Tournaments).', 2500),
(18, 'badge_.png', 'Tournament Competitor', 'The account reached a Tournament Rating of 1000 (equals the Tournament Coins earned in all Tournaments).', 1000),
(19, 'badge_.png', 'Master Class (Grade 3)', 'The account has reached at least level 500 with all four vocations.', 500),
(20, 'badge_.png', 'Master Class (Grade 2)', 'The account has reached at least level 250 with all four vocations.', 250),
(21, 'badge_.png', 'Master Class (Grade 1)', 'The account has reached at least level 100 with all four vocations.', 100);

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_boss`
--

CREATE TABLE `canary_boss` (
  `id` int(11) NOT NULL,
  `tag` varchar(255) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `canary_boss`
--

INSERT INTO `canary_boss` (`id`, `tag`, `name`) VALUES
(1, 'abyssador', 'Abyssador'),
(2, 'ameneftheburning', 'Amenef The Burning'),
(3, 'anomaly', 'Anomaly'),
(4, 'vixen', 'Black Vixen'),
(5, 'bloodhoof', 'Bloodback'),
(6, 'brainhead', 'Brain Head'),
(7, 'brokul', 'Brokul'),
(8, 'countvlarkort', 'Count Vlarkorth');

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_compendium`
--

CREATE TABLE `canary_compendium` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `headline` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `publishdate` int(11) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `canary_compendium`
--

INSERT INTO `canary_compendium` (`id`, `category`, `headline`, `message`, `publishdate`, `type`) VALUES
(1, 3, '<p>Find Person on Optional PvP</p>', '<center>Decide&nbsp;who can locate your character&nbsp;with the Find Person spell \\\"exiva\\\" on Optional PvP worlds.<br />&nbsp;<img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" />\\n<table style=\\\"height: 202px; margin-left: auto; margin-right: auto; width: 749px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr style=\\\"height: 198px;\\\">\\n<td style=\\\"width: 33px; height: 198px; vertical-align: top;\\\"><img src=\\\"https://static.tibia.com/images/news/exiva01.png\\\" width=\\\"227\\\" height=\\\"319\\\" /></td>\\n<td style=\\\"width: 484px; height: 198px; vertical-align: top;\\\">\\n<p>Click on this icon above your chat console to open the Exiva Options dialog.</p>\\n<p>&nbsp;</p>\\n<p>Per default, only party and guild members are allowed to use the Find Person spell on you.</p>\\n<p>&nbsp;</p>\\n<p>This dialog allows you to customise your settings for the Find Person spell further.</p>\\n<p>You can allow it for all characters, you can allow it for pre-defined groups and you can also set up whitelists to allow the spell for specific characters or guilds.</p>\\n<p>&nbsp;</p>\\n<p>Please note: if your guild participates in a guild war, all members of your guild, as well as the enemy guild will be able to use the Find Person spell on your character, regardless of your settings.</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>To add characters to your whitelist, you can either enter their names via the text field in the dialog window (A) or you can directly add single character names via the context menu in your VIP list (B).</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/exiva02.png\\\" alt=\\\"\\\" width=\\\"583\\\" height=\\\"159\\\" /></p>\\n<p>&nbsp;</p>\\n<p>You can even set a hotkey via the hotkey menu to toggle between the option \\\"Allow all characters to use Exiva on me\\\" and your previous&nbsp;setting for the spell:</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/exiva03new.png\\\" width=\\\"497\\\" height=\\\"62\\\" /></p>\\n<table style=\\\"height: 102px; margin-left: auto; margin-right: auto; width: 648px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr style=\\\"height: 65px;\\\">\\n<td style=\\\"width: 411px; height: 65px; vertical-align: middle;\\\">\\n<p>If you use the spell on a character whom you are not allowed to locate, you will be notified in your server log.</p>\\n<p>The regular amount of mana will still be consumed when casting the spell.</p>\\n</td>\\n<td style=\\\"width: 205px; height: 65px; vertical-align: middle;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/exiva04.png\\\" width=\\\"403\\\" height=\\\"90\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<table style=\\\"height: 102px; margin-left: auto; margin-right: auto; width: 644px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr style=\\\"height: 65px;\\\">\\n<td style=\\\"width: 154.5px; height: 65px; vertical-align: middle;\\\"><img src=\\\"https://static.tibia.com/images/news/exiva05.png\\\" width=\\\"155\\\" height=\\\"43\\\" /></td>\\n<td style=\\\"width: 459.5px; height: 65px; vertical-align: middle;\\\">\\n<p>If someone uses the spell on you but is not allowed to locate you, a quick glow of the Exiva Options icon will inform you about the attempt.</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n</center>', 1512050400, 1),
(2, 3, '<p>Premium Features</p>', '<center>Get premium status to enjoy exclusive abilities and advantages inside and outside the game.<br />&nbsp;<img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" />\\n<p>Treat yourself to Premium Time to access everything listed here:</p>\\n<div style=\\\"vertical-align: middle;\\\">\\n<table style=\\\"height: 231px; margin-left: auto; margin-right: auto; width: 566px;\\\" border=\\\"1\\\" cellpadding=\\\"2\\\">\\n<tbody>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">Benefit</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">Premium Details</th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;Free</th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Premium</th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px; text-align: center;\\\">XP boost</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_stamina.png\\\" alt=\\\"\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;0</th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;+50%</th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">Offline training</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_trainingstatues.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_no.png\\\" width=\\\"15\\\" height=\\\"14\\\" /></th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_yes.png\\\" width=\\\"15\\\" height=\\\"11\\\" /></th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">Refined quick looting</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_quickloot.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_no.png\\\" width=\\\"15\\\" height=\\\"14\\\" /></th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_yes.png\\\" width=\\\"15\\\" height=\\\"11\\\" /></th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Areas</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_newareas.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;5 areas and cities</th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;17+ areas and cities</th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">Efficient supply stash</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/supplystash10.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">retrieve</th>\\n<th style=\\\"width: 134px; height: 15px;\\\">stow and retrieve</th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Spells</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_spells.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;55</th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;139+</th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Instant travelling</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_travel.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_no.png\\\" width=\\\"15\\\" height=\\\"14\\\" /></th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_yes.png\\\" width=\\\"15\\\" height=\\\"11\\\" /></th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Outfits</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_outfit.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;4 +1 unlockable</th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;32+</th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Mounts</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_mount.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;3 (rentable) +1 unlockable</th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;41+</th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Death penalty</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_death.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;0% reduction</th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;30% reduction</th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Market offers</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_market.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_no.png\\\" width=\\\"15\\\" height=\\\"14\\\" /></th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_yes.png\\\" width=\\\"15\\\" height=\\\"11\\\" /></th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;House ownership</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_house.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_no.png\\\" width=\\\"15\\\" height=\\\"14\\\" /></th>\\n<th style=\\\"width: 134px; height: 15px;\\\">\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_yes.png\\\" width=\\\"15\\\" height=\\\"11\\\" /><br />900+ houses</p>\\n</th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;VIP list entries</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_vip.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;20</th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;100</th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Depot space</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_depot.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;2,000</th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;10,000</th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Private chat channels</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_chat.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_no.png\\\" width=\\\"15\\\" height=\\\"14\\\" /></th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_yes.png\\\" width=\\\"15\\\" height=\\\"11\\\" /></th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Character promotion</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_promotion.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_no.png\\\" width=\\\"15\\\" height=\\\"14\\\" /></th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_yes.png\\\" width=\\\"15\\\" height=\\\"11\\\" /></th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;VIP groups</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_vipgroups.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;3</th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;3+5</th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Challenging arenas</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_pvparena.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_no.png\\\" width=\\\"15\\\" height=\\\"14\\\" /></th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_yes.png\\\" width=\\\"15\\\" height=\\\"11\\\" /></th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Free prey slots</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_prey.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;1</th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;2</th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Imbuements</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_imbuing.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;basic</th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;basic,<br /> intricate,<br />powerful</th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Daily rewards</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_dailyreward.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;basic</th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;extended <br /> (more than twice)</th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Advanced analytics features</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_analytics.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_no.png\\\" width=\\\"15\\\" height=\\\"14\\\" /></th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_yes.png\\\" width=\\\"15\\\" height=\\\"11\\\" /></th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Quests</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_quests.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;~ 80</th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;280+</th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Priority login</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_login.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_no.png\\\" width=\\\"15\\\" height=\\\"14\\\" /></th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_yes.png\\\" width=\\\"15\\\" height=\\\"11\\\" /></th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Mighty summons</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_summons.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_no.png\\\" width=\\\"15\\\" height=\\\"14\\\" /></th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_yes.png\\\" width=\\\"15\\\" height=\\\"11\\\" /></th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Guild leadership</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_guild.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_no.png\\\" width=\\\"15\\\" height=\\\"14\\\" /></th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_yes.png\\\" width=\\\"15\\\" height=\\\"11\\\" /></th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Exclusive outfit addons</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_addons.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_no.png\\\" width=\\\"15\\\" height=\\\"14\\\" /></th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_yes.png\\\" width=\\\"15\\\" height=\\\"11\\\" /></th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Premium worlds</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_worlds.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_no.png\\\" width=\\\"15\\\" height=\\\"14\\\" /></th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_yes.png\\\" width=\\\"15\\\" height=\\\"11\\\" /></th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Mana and HP regeneration</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_regeneration.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;slow regeneration</th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;fast regeneration</th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Loyalty system</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_loyalty.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_no.png\\\" width=\\\"15\\\" height=\\\"14\\\" /></th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_yes.png\\\" width=\\\"15\\\" height=\\\"11\\\" /></th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Trackable items</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_trackloot.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;5</th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;50</th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Soul points</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_soulpoints.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;100<br />slow regeneration</th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;200<br />fast regeneration</th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;Trackable quests</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_trackquests.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;5</th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;20</th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">More active charms</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_charms.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">2</th>\\n<th style=\\\"width: 134px; height: 15px;\\\">6</th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">Tournaments</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicons_tournaments.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_no.png\\\" width=\\\"15\\\" height=\\\"14\\\" /></th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_yes.png\\\" width=\\\"15\\\" height=\\\"11\\\" /></th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">Party List</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_partylist.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_no.png\\\" width=\\\"15\\\" height=\\\"14\\\" /></th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_yes.png\\\" width=\\\"15\\\" height=\\\"11\\\" /></th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">Secondary Battle Lists</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_secondarybattlelists1.png\\\" width=\\\"35\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_no.png\\\" width=\\\"15\\\" height=\\\"14\\\" /></th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_yes.png\\\" width=\\\"15\\\" height=\\\"11\\\" /></th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">Free Hunting Task slots</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon-preyhuntingtask.png\\\" width=\\\"34\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">1</th>\\n<th style=\\\"width: 134px; height: 15px;\\\">2</th>\\n</tr>\\n<tr style=\\\"height: 15px;\\\">\\n<th style=\\\"width: 134px; height: 15px;\\\">Team Finder</th>\\n<th style=\\\"width: 123.033px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon-partyfinder.png\\\" width=\\\"34\\\" height=\\\"34\\\" /></th>\\n<th style=\\\"width: 144.967px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_no.png\\\" width=\\\"15\\\" height=\\\"14\\\" /></th>\\n<th style=\\\"width: 134px; height: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/premiumicon_yes.png\\\" width=\\\"15\\\" height=\\\"11\\\" /></th>\\n</tr>\\n</tbody>\\n</table>\\n</div>\\n<p>Further information on Premium Time and these benefits can be found on our <a href=\\\"http://www.tibia.com/abouttibia/?subtopic=premiumfeatures\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\">website</a>.</p>\\n</center>', 1649479911, 1),
(3, 3, '<p>Loyalty System</p>', '<center>Being a loyal premium player grants you additional rewards. <br />\\n<table style=\\\"height: 23px; margin-left: auto; margin-right: auto;\\\" width=\\\"55\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 45px;\\\"><img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" /></td>\\n</tr>\\n</tbody>\\n</table>\\n<p>Every already used premium day on your account equals one loyalty point. You can check your loyalty points on your account page under General Information.</p>\\n<table style=\\\"height: 150px; margin-left: auto; margin-right: auto;\\\" width=\\\"168\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 253px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/loyalty02b.png\\\" width=\\\"241\\\" height=\\\"151\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>&nbsp;Depending on the number of loyalty points on your account, you may receive an honourable title, appear in the loyalty highscores or even enjoy a bonus of up to 50% on your skill points.</p>\\n<table style=\\\"height: 39px; margin-left: auto; margin-right: auto;\\\" width=\\\"193\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 183px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/loyalty03.png\\\" width=\\\"291\\\" height=\\\"49\\\" align=\\\"middle\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>&nbsp;</p>\\n<p>If you have earned yourself a place in the loyalty highscores, you can select which of your characters should be displayed there.</p>\\n<p>Click <img src=\\\"https://static.tibia.com/images/news/manage_account.png\\\" vspace=\\\"1\\\" width=\\\"136\\\" height=\\\"27\\\" align=\\\"middle\\\" /> on your account page to open your account management.<br /><br /></p>\\n<table style=\\\"height: 266px; width: 564px; margin-left: auto; margin-right: auto;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 206.433px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/loyalty05b.png\\\" alt=\\\"\\\" width=\\\"229\\\" height=\\\"106\\\" /></p>\\n</td>\\n<td style=\\\"width: 451.567px;\\\" align=\\\"left\\\" valign=\\\"middle\\\">\\n<p>Click on <em>Loyalty Highscore Character</em> in the navigation bar or scroll down to the respective section.</p>\\n<p>Select the character of your choice via the dropdown menu. You can only select characters that are not hidden.</p>\\n<p>You will appear in the loyalty highscores of the game world your selected character belongs to.</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<table style=\\\"height: 23px; margin-left: auto; margin-right: auto;\\\" width=\\\"55\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 45px;\\\"><img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" /></td>\\n</tr>\\n</tbody>\\n</table>\\n<p>The manual on our website provides you with more details about the <a href=\\\"http://www.tibia.com/gameguides/?subtopic=manual&amp;section=accounts#loyalty\\\">loyalty system</a>, including a list of all titles you can earn and an example of how the skill bonus exactly works.</p>\\n</center>', 1649480370, 1),
(4, 4, '<p>Recovery TAN</p>', '<center>Add your mobile phone number to your registration to be able to change your registered email address instantly whenever you order a new recovery key.<br />&nbsp;<img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" /> <br /><br />\\n<table style=\\\"height: 69px;\\\" width=\\\"516\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 506px; vertical-align: middle;\\\">If you add a valid mobile phone number to your registration, you will receive a recovery TAN via SMS text message whenever you order a new recovery key.\\n<ul>\\n<li>If you add a valid mobile phone number to your registration, you will receive a recovery TAN via SMS text message whenever you order a new recovery key.</li>\\n<li>The recovery TAN can be used to change the email address of an account instantly. A recovery TAN is only valid for 24 hours and can only be used once.</li>\\n</ul>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>How to add a mobile phone number to your registration:</p>\\n<p>Click <img src=\\\"https://static.tibia.com/images/news/manage_account.png\\\" vspace=\\\"1\\\" width=\\\"136\\\" height=\\\"27\\\" align=\\\"middle\\\" /> on your account page to open your account management.</p>\\n<p>Use the navigation bar or scroll down to go to the section <em>Registration</em>&nbsp;<br />and click <em>Edit</em> to open the <em>Change Registration Data</em> interface.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/recoverytan01.png\\\" width=\\\"381\\\" height=\\\"86\\\" /></p>\\n<table style=\\\"height: 202px; margin-left: auto; margin-right: auto; width: 637px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr style=\\\"height: 198px;\\\">\\n<td style=\\\"width: 238.5px; height: 198px;\\\" valign=\\\"middle\\\"><img src=\\\"https://static.tibia.com/images/news/recoverytan02.png\\\" width=\\\"379\\\" height=\\\"193\\\" /></td>\\n<td style=\\\"width: 365.5px; height: 198px;\\\" valign=\\\"middle\\\">\\n<p>Enter a valid mobile phone number in the respective line.&nbsp;</p>\\n<p>You also need to enter your password before you can click <em>Submit</em>&nbsp;to confirm the request to change your registration data.</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>&nbsp;</p>\\n<table style=\\\"height: 376px; width: 533.5px;\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 525.5px;\\\">\\n<p>Within the next few minutes, you should receive a verificaction TAN via SMS on your mobile phone.</p>\\n<center>This verification TAN will only be valid for 15 minutes.</center>\\n<p>(1) Enter this TAN on the following page of the Change Registration Data interface.</p>\\n<center>&nbsp;<img src=\\\"https://static.tibia.com/images/news/recoverytan03.png\\\" width=\\\"381\\\" height=\\\"233\\\" /></center>\\n<p>(2) Click on Submit to verify your mobile phone number.</p>\\n<p>You can confirm your registration change after a waiting period of 30 days has passed. Please note that you need to verify your mobile phone number to be able to finalise the change.</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>&nbsp;If you do not receive a verificaction TAN via SMS, you can request a new one.</p>\\n<table style=\\\"height: 118px; width: 695px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 445px; height: 65px;\\\" valign=\\\"middle\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/recoverytan04.png\\\" width=\\\"383\\\" height=\\\"215\\\" /></p>\\n</td>\\n<td style=\\\"width: 759px; height: 65px;\\\" valign=\\\"middle\\\">\\n<p>(1) Open your registration data in your account management and request a new verification TAN.</p>\\n<p>(2) Click <em>Send SMS</em> on the next page.</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n</center>', 1649480432, 1),
(5, 4, '<p>Webshop</p>', '<center>In the Tibia Webshop you can order Premium Time, Tibia Coins or Extra Services for your account. Various payment methods are available <span class=\\\"st\\\">for your purchases</span>. <br /> &nbsp;<img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" /></center><center>\\n<p>Click <img src=\\\"https://static.tibia.com/images/news/manage_account.png\\\" vspace=\\\"1\\\" width=\\\"136\\\" height=\\\"27\\\" align=\\\"middle\\\" /> on your account page to open your account management.</p>\\n<p>Use the navigation bar or scroll down to go to the section <em>Products Available</em> from where you can access the Tibia Webshop or redeem a game code.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/webshop01.png\\\" alt=\\\"\\\" width=\\\"381\\\" height=\\\"64\\\" /></p>\\n<p>Click one of these three buttons to open the respective section of the Webshop:</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/webshop02.png\\\" alt=\\\"\\\" width=\\\"639\\\" height=\\\"251\\\" /></p>\\n<p>If no country is preselected or to change the selected country, please use the drop-down menu. All prices are shown in the currency of the country you have selected.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/webshop09.png\\\" alt=\\\"\\\" width=\\\"373\\\" height=\\\"53\\\" /></p>\\n<table style=\\\"height: 258px; margin-left: auto; margin-right: auto; width: 657px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 169.95px;\\\" valign=\\\"middle\\\">\\n<p>(1) Click on one of the tabs to navigate through the Webshop and check which products are available.</p>\\n<p>(2) Select the product you would like to purchase by clicking on it.</p>\\n<p>Now you can see all payment methods you can use to purchase this product.</p>\\n</td>\\n<td style=\\\"width: 455.05px;\\\" valign=\\\"middle\\\"><img src=\\\"https://static.tibia.com/images/news/webshop10.png\\\" alt=\\\"\\\" width=\\\"391\\\" height=\\\"156\\\" /></td>\\n</tr>\\n</tbody>\\n</table>\\n<p>The price for the product you have selected may vary depending on the payment method you choose.</p>\\n<p>Click <em>Next</em> to proceed once you have selected the product and payment method of your choice.</p>\\n<table style=\\\"height: 174px; margin-left: auto; margin-right: auto; width: 635px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr style=\\\"height: 198px;\\\">\\n<td style=\\\"width: 381px; height: 198px;\\\" valign=\\\"middle\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/webshop05.png\\\" width=\\\"381\\\" height=\\\"169\\\" /></p>\\n</td>\\n<td style=\\\"width: 222px; height: 198px;\\\" valign=\\\"middle\\\">You will now be asked to enter payment data depending on the payment method you selected. Hover over the question marks to get additional info about the data you need to enter.</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>Click <em>Next</em> to proceed to the confirmation page. <br />All data you entered will be shown so please check it thoroughly.</p>\\n<table style=\\\"height: 207px; margin-left: auto; margin-right: auto; width: 623px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr style=\\\"height: 198px;\\\">\\n<td style=\\\"width: 429px; height: 198px;\\\" valign=\\\"middle\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/webshop11.png\\\" width=\\\"429\\\" height=\\\"251\\\" /></p>\\n</td>\\n<td style=\\\"width: 162px; height: 198px;\\\" valign=\\\"middle\\\">\\n<p>(1) If everything has been entered correctly, check this box to accept the Extended Tibia Service Agreement and the Tibia Privacy Policy.</p>\\n<p>(2) When you are ready to submit your order, click <em>Buy Now</em>.</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>On the last page, you will receive a summary of your order and see whether or not your order was successful. Depending on the payment method you chose, you may also be provided with further instructions on how to complete your order (e.g. payment details for bank transfers, redirection to payment providers).</p>\\n<p>&nbsp;</p>\\n<p>You bought a game code from one of our official resellers? Click the button <em>Use Game Code</em> in the section <em>Products Available</em> on your account management page to redeem it.</p>\\n<table style=\\\"height: 202px; margin-left: auto; margin-right: auto; width: 637px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr style=\\\"height: 198px;\\\">\\n<td style=\\\"width: 202px; height: 198px;\\\" valign=\\\"middle\\\">\\n<p>(1) Enter the 20-digit code. Make sure to enter all letters and numbers correctly.</p>\\n<p>(2) Click <em>Next</em> to proceed. If you have entered a valid and correct game code, the code will be shown to you once more on the next page together with the service for which the game code is valid. If everything is correct, click <em>Next</em> again to activate the code.</p>\\n</td>\\n<td style=\\\"width: 403px; height: 198px;\\\" valign=\\\"middle\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/webshop08.png\\\" width=\\\"403\\\" height=\\\"183\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n</center>', 1649480472, 1),
(6, 4, '<p>The Store</p>', '<center>The Store offers a wide range of Tibia products that you can buy without having to leave the game.</center><center>Purchases are made with Tibia Coins, a special currency in Tibia.<br />\\n<table style=\\\"height: 23px; margin-left: auto; margin-right: auto;\\\" width=\\\"55\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 45px;\\\"><img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" /></td>\\n</tr>\\n</tbody>\\n</table>\\n<p>Click on this button below your inventory to open the Store.</p>\\n<table style=\\\"margin-left: auto; margin-right: auto; height: 40px;\\\" width=\\\"123\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 107px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/store01.png\\\" width=\\\"107\\\" height=\\\"54\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>You can check you current balance of Tibia Coins here:</p>\\n<table style=\\\"margin-left: auto; margin-right: auto; height: 43px;\\\" width=\\\"354\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 336px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/store02.png\\\" width=\\\"437\\\" height=\\\"43\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>&nbsp;<br />Tibia Coins can be bought in our Webshop. Click this button to open the Tibia website in a browser window and log in to access the Webshop.</p>\\n<table style=\\\"margin-left: auto; margin-right: auto; height: 43px;\\\" width=\\\"316\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 305px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/store03.png\\\" width=\\\"421\\\" height=\\\"43\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>You can also buy Tibia Coins from other players ingame via the Market.<br /><br /></p>\\n<table style=\\\"margin-left: auto; margin-right: auto; height: 349px; width: 534px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 295px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/store05new.png\\\" width=\\\"183\\\" height=\\\"305\\\" /></p>\\n</td>\\n<td style=\\\"width: 207px; vertical-align: bottom;\\\">\\n<p>Click on a category to see the products within it. Some categories have subcategories (indicated by a small arrow) for easier navigation.</p>\\n<p>&nbsp;</p>\\n<p>&nbsp;</p>\\n<p>&nbsp;</p>\\n<p>&nbsp;</p>\\n<p>&nbsp;</p>\\n<p>If a product and its Buy button are greyed out, the product is currently not available for your character. Hover of the Buy button to find out why.&nbsp;</p>\\n<p>Please note that products which cannot be used by your character at all, e.g. due to a vocation restriction, will not be displayed.&nbsp;</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p><br />&nbsp;<img src=\\\"https://static.tibia.com/images/news/store06.png\\\" width=\\\"647\\\" height=\\\"136\\\" /></p>\\n<table style=\\\"height: 56px;\\\" width=\\\"417\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 407px;\\\">\\n<p>(1) In some categories, you are able to filter products further by clicking on \\\"Show All\\\" and selecting the filter of your choice. <br />(2) You can also change the display order of products via the right dropdown menu.</p>\\n<p><img src=\\\"https://static.tibia.com/images/news/store13new.png\\\" alt=\\\"\\\" width=\\\"565\\\" height=\\\"83\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p><br />You can also use the search function in the Store if you are looking for specific products.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/store14.png\\\" alt=\\\"\\\" width=\\\"339\\\" height=\\\"206\\\" /></p>\\n<p>&nbsp;</p>\\n<p>To buy something, select the product of your choice and click the Buy button. Confirm your purchase by clicking Buy in the next window.</p>\\n<table style=\\\"margin-left: auto; margin-right: auto; height: 255px;\\\" width=\\\"339\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 365px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/store07new.png\\\" width=\\\"513\\\" height=\\\"154\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>&nbsp;Check the box \\\"Do not show this dialog again!\\\" if you want to buy products instantly without any confirmation.&nbsp;</p>\\n<p>You can also change this setting via the General Options menu.</p>\\n<table style=\\\"height: 62px;\\\" width=\\\"229\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 221px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/store09new.png\\\" width=\\\"221\\\" height=\\\"61\\\" />&nbsp;</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>After a purchase, click this box to open it and close the window to continue.</p>\\n<table style=\\\"margin-left: auto; margin-right: auto; height: 112px;\\\" width=\\\"331\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 329px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/store10.png\\\" width=\\\"329\\\" height=\\\"147\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>Portable items you have bought in the Store (e.g. potions) will be sent to your Store inbox.<br />You can open the Store inbox wherever you are.</p>\\n<table style=\\\"margin-left: auto; margin-right: auto; height: 210px; width: 651px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr style=\\\"height: 81px;\\\">\\n<td style=\\\"width: 310.433px; height: 81px;\\\" valign=\\\"top\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/store11.png\\\" width=\\\"341\\\" height=\\\"167\\\" /></p>\\n</td>\\n<td style=\\\"width: 307.567px; height: 81px;\\\" valign=\\\"middle\\\">\\n<p>Items purchased in the Store can only be used by the character that purchased them.</p>\\n<p>Pieces of furniture or decoration bought in the Store can only be unwrapped in a house owned by this character.</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p><br />You can also use the Store to gift Tibia Coins to other accounts. <br />You can only gift <a href=\\\"http://www.tibia.com/support/?subtopic=faq&amp;question=transferrequirements\\\">transferable Tibia Coins</a>.</p>\\n<table style=\\\"margin-left: auto; margin-right: auto; height: 112px;\\\" width=\\\"331\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 329px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/store12.png\\\" width=\\\"377\\\" height=\\\"240\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p><br />Click <em>History</em> to see a history all of your Tibia Coins transactions.</p>\\n<table style=\\\"margin-left: auto; margin-right: auto; height: 50px;\\\" width=\\\"270\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 283px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/store04new.png\\\" width=\\\"283\\\" height=\\\"107\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>Curious how a certain outfit or mount would look on your character?</p>\\n<table style=\\\"height: 280px;\\\" width=\\\"527\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 517px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/store15new.png\\\" alt=\\\"\\\" width=\\\"551\\\" height=\\\"200\\\" /></p>\\n<p>Select the mount or outfit of your choice and click the \\\"Try On\\\" button to open a preview dialog. Here, you can try out various combinations of outfits and mounts. <br /><br />You can also rotate your character in the preview window to see it from different sides and you can preview walking or riding animations. <br /><br />Please note that any settings or combinations you select via the \\\"Try Outfit\\\" dialog will neither be saved nor trigger a purchase. <br /><br />If you want to buy an outfit or mount you need to click the \\\"Buy\\\" button in the Store.</p>\\n<p>&nbsp;</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<table style=\\\"height: 328px;\\\" width=\\\"523\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 312px;\\\"><img src=\\\"https://static.tibia.com/images/news/store16new.png\\\" alt=\\\"\\\" width=\\\"243\\\" height=\\\"317\\\" /></td>\\n<td style=\\\"width: 195px; vertical-align: top;\\\">If you want to actually change your character outfit, its colours or your mount ingame, use the \\\"Set Outfit\\\" dialog.</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>&nbsp;</p>\\n</center>', 1649480507, 1),
(7, 4, '<p>Need Help?</p>', '<center>A wealth of information is available to help you find your way around in Tibia.<br />\\n<table style=\\\"height: 23px; margin-left: auto; margin-right: auto;\\\" width=\\\"55\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 45px;\\\"><img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" /></td>\\n</tr>\\n</tbody>\\n</table>\\n<p>Hover your mouse cursor over a button or a bar in the client interface to have a tooltip appear.</p>\\n<table style=\\\"height: 38px; margin-left: auto; margin-right: auto;\\\" width=\\\"224\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr style=\\\"height: 45px;\\\">\\n<td style=\\\"width: 207px; height: 45px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/help01.png\\\" width=\\\"207\\\" height=\\\"47\\\" /></p>\\n</td>\\n<td style=\\\"width: 207px; height: 45px;\\\"><img src=\\\"https://static.tibia.com/images/news/help04.png\\\" alt=\\\"\\\" width=\\\"367\\\" height=\\\"55\\\" /></td>\\n</tr>\\n</tbody>\\n</table>\\n<br />\\n<p>Turn your mouse cursor into a magnifying glass by pressing <img src=\\\"https://static.tibia.com/images/news/help05.png\\\" alt=\\\"\\\" width=\\\"152\\\" height=\\\"42\\\" align=\\\"middle\\\" /></p>\\n<table style=\\\"height: 205px; margin-left: auto; margin-right: auto; width: 498px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 370.983px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/help02.png\\\" width=\\\"353\\\" height=\\\"159\\\" align=\\\"middle\\\" /></p>\\n</td>\\n<td style=\\\"width: 95.0167px;\\\" valign=\\\"middle\\\">Now hover over certain elements of the client to get additional information displayed.</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>&nbsp;</p>\\n<p>You can also select the Help tab in the Options menu to get ingame help or to access specific help sections of the Tibia website.</p>\\n<table style=\\\"margin-left: auto; margin-right: auto; height: 191px;\\\" width=\\\"277\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 281px;\\\"><img src=\\\"https://static.tibia.com/images/news/help03new.png\\\" width=\\\"281\\\" height=\\\"195\\\" /></td>\\n</tr>\\n</tbody>\\n</table>\\n<table style=\\\"height: 23px; margin-left: auto; margin-right: auto;\\\" width=\\\"55\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 45px;\\\"><img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" /></td>\\n</tr>\\n</tbody>\\n</table>\\n<p>The <a href=\\\"http://www.tibia.com/support/?subtopic=gethelp\\\">Get Help</a> section on our website provides you with useful links to various topics related to the game itself and your account.</p>\\n</center>', 1649480533, 1);
INSERT INTO `canary_compendium` (`id`, `category`, `headline`, `message`, `publishdate`, `type`) VALUES
(8, 13, '<p>Mount and Outfit Presets</p>', '<center>\\n<p>The Customise Character dialog allows for the creation of presets with which you can quickly change your appearance.<br />&nbsp;<img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" /></p>\\n<p>Right-click on your character and choose <em>Customise Character</em>.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/mountandoutfitpresets01.png\\\" alt=\\\"\\\" width=\\\"216\\\" height=\\\"161\\\" /></p>\\n<p>To create a new preset, click on the radio button next to Preset and then on <em>New</em> under Manage Presets. The new preset will appear in the list on the right. The colours of the outfit, the mount, and the familiar will be saved.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/mountandoutfitpresets02.png\\\" alt=\\\"\\\" width=\\\"267\\\" height=\\\"313\\\" /></p>\\n<p>If you change your appearance and click on <em>Save</em>, the selected preset will be overwritten with the new configuration.</p>\\n<p>&nbsp;</p>\\n<p>By clicking <em>Copy (colours)</em> when selecting outfits or colourisable mounts, the colour of your outfit or mount will be copied to clipboard. If you selected an outfit, you can then use <em>Paste (colours)</em> when selecting a colourisable mount to transfer the colours to it, and vice versa. <em>Copy (all)</em> copies the information about the outfit, the colours, the mount, and the familiar to clipboard. You can share this data with others who, after copying it to clipboard, can use <em>Paste (all)</em> to get your configuration.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/mountandoutfitpresets03.png\\\" alt=\\\"\\\" width=\\\"238\\\" height=\\\"95\\\" /></p>\\n</center>', 1649480590, 1),
(9, 13, '<p>Client Settings and Minimap Export and Import</p>', '<center>\\n<p>Use the export and import function to easily backup your client settings and minimap.<br /> &nbsp;<img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" /></p>\\n<p>Under <em>Help</em> in the options menu you can find the buttons <em>Export All Options</em>, which exports your settings (including hotkeys) and action bars, as well as <em>Export Minimap</em>, which lets you export your current minimap.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/backup01.png\\\" /></p>\\n<p><em>Import Options/Minimap</em> allows you to import both options and minimap after export.</p>\\n</center>', 1649480622, 1),
(10, 13, '<p>Team Finder</p>', '<center>\\n<p>Use the Team Finder to quickly and easily organise a hunt or find a group to play with.<br /> &nbsp;<img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" /></p>\\n<p><span style=\\\"text-decoration: underline;\\\">Organise an Activity</span></p>\\n<p>Go to the <em>Assemble Team</em> tab in the Social dialog.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/findteams01.png\\\" /></p>\\n<p>Choose the settings which reflect what kind of team members you are looking for.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/findteams03.png\\\" /></p>\\n<p>By clicking on the shield icon, you can set the level range which allows sharing XP between the lowest level player and the highest level player, with your level being in the middle.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/findteams02.png\\\" /></p>\\n<p>Click on <img src=\\\"https://static.tibia.com/images/news/findteams04.png\\\" /> to create your notice, which also opens a chat channel.</p>\\n<p>You can then either accept, invite or reject players who want to join. Inviting them adds them to the team channel, giving you a chance to talk to them before either accepting or rejecting them.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/findteams05.png\\\" /></p>\\n<p><span style=\\\"text-decoration: underline;\\\">Look for a Team</span></p>\\n<p>Go to the <em>Join Team</em> tab in the Social dialog.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/findteams06.png\\\" /></p>\\n<p>Choose the settings which reflect what kind of team you are looking for.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/findteams07.png\\\" /></p>\\n<p>Once you have found a team you would like to join, select <em>Join Team</em>.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/findteams08.png\\\" /></p>\\n<p>You will be notified once you have been accepted, invited or rejected. In case you are accepted or invited to the team, you will automatically join the team channel.</p>\\n</center>', 1649480644, 1),
(11, 13, '<p>Depot Search</p>', '<center>The depot search allows you to search your locker for items by name.<br />\\n<table style=\\\"height: 23px; margin-left: auto; margin-right: auto;\\\" width=\\\"55\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 47px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>You do not need to type the full name to get results.</p>\\n<table style=\\\"height: 150px; margin-left: auto; margin-right: auto;\\\" width=\\\"168\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 47px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/depotsearch01.png\\\" alt=\\\"button\\\" width=\\\"369\\\" height=\\\"275\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>&nbsp;</p>\\n<p>Tick the box \\\"Show Locker only\\\" if you only want to see items that you own.</p>\\n<table style=\\\"height: 27px; margin-left: auto; margin-right: auto;\\\" width=\\\"57\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 47px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/depotsearch02.png\\\" alt=\\\"spacebar\\\" width=\\\"145\\\" height=\\\"57\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>&nbsp;</p>\\n<p>After clicking on \\\"Show search result.\\\" at the bottom right,<br />you can see whether the items are located in the depot, stash or inbox.</p>\\n<table style=\\\"height: 146px; margin-left: auto; margin-right: auto;\\\" width=\\\"193\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 47px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/depotsearch03.png\\\" alt=\\\"filters\\\" width=\\\"247\\\" height=\\\"223\\\" align=\\\"middle\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>&nbsp;</p>\\n<p>You can retrieve all items at once by clicking \\\"Retrieve displayed Items\\\"<br />or you can retrieve a single item with drag-and-drop.</p>\\n<table style=\\\"height: 235px; width: 323px; margin-left: auto; margin-right: auto;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 47px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/depotsearch04.png\\\" alt=\\\"sorting\\\" width=\\\"181\\\" height=\\\"35\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>With the summer update 2022, the depot search has received a filter option, in which you can select trader NPCs like Rashid or the Djinns, for example.</p>\\n</center>', 1649480674, 1),
(12, 13, '<p>Party List</p>', '<center>The party list is a Premium feature which shows all party members and their summons.<br />When they are nearby, their health points and mana will be displayed as well.<br />\\n<table style=\\\"height: 23px; margin-left: auto; margin-right: auto;\\\" width=\\\"55\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 47px;\\\"><img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" /></td>\\n</tr>\\n</tbody>\\n</table>\\n<p>Click the party list button in your sidebar:</p>\\n<table style=\\\"height: 150px; margin-left: auto; margin-right: auto;\\\" width=\\\"168\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 47px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/partylist01.png\\\" alt=\\\"button\\\" width=\\\"253\\\" height=\\\"81\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>&nbsp;</p>\\n<p>Party list filters allow you to show or hide members of six different groups:<br />players, knights, paladins, druids, sorcerers and summons.</p>\\n<table style=\\\"height: 27px; margin-left: auto; margin-right: auto;\\\" width=\\\"57\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 47px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/partylist02.png\\\" alt=\\\"spacebar\\\" width=\\\"385\\\" height=\\\"101\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>&nbsp;</p>\\n<p>You can also sort your party members by certain criteria.</p>\\n<table style=\\\"height: 146px; margin-left: auto; margin-right: auto;\\\" width=\\\"193\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 47px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/partylist03.png\\\" alt=\\\"filters\\\" width=\\\"379\\\" height=\\\"181\\\" align=\\\"middle\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>&nbsp;</p>\\n<p>Right-click on it to open the context menu with further options.</p>\\n<table style=\\\"height: 235px; width: 323px; margin-left: auto; margin-right: auto;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 47px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/partylist04.png\\\" alt=\\\"sorting\\\" width=\\\"269\\\" height=\\\"240\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n</center>', 1649480696, 1),
(13, 13, '<p>Colourised Loot Value</p>', '<center>Based on their gold value, items are highlighted with a coloured frame.<br />&nbsp;<img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" />\\n<p>This allows to identify the approximate value of the item at a glance.</p>\\n<p>The colour depends on the loot value, which can be determined in the <em>Items</em> section of the Cyclopedia, either using the NPC buy value, the average Market price or your own preferred value.<br /><br /></p>\\n<table>\\n<tbody>\\n<tr>\\n<td><center>\\n<p>Each colour represents a certain gold value range:</p>\\n</center>\\n<ul>\\n<li>No frame means a gold value has yet to be defined in the Cyclopedia or equals 0.</li>\\n<li><span style=\\\"color: #aaaaaa;\\\">Grey</span> frame means a gold value of 1 - 999.</li>\\n<li><span style=\\\"color: #00f000;\\\">Green</span> frame means a gold value of 1,000 - 9,999.</li>\\n<li><span style=\\\"color: #20a0ff;\\\">Blue</span> frame means a gold value of 10,000 - 99,999.</li>\\n<li><span style=\\\"color: #ff68ff;\\\">Purple</span> frame means a gold value of 100,000 - 999,999.</li>\\n<li><span style=\\\"color: #f0f000;\\\">Yellow</span> frame means a gold value of 1,000,000+.</li>\\n</ul>\\n</td>\\n<td>\\n<p style=\\\"margin-right: 40px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/lootvalue01.png\\\" alt=\\\"\\\" width=\\\"179\\\" height=\\\"135\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>According to this colour pattern, the individual items in every loot message are also highlighted in the respective colour.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/lootvalue02.png\\\" alt=\\\"\\\" width=\\\"511\\\" height=\\\"17\\\" /></p>\\n<p>In case you prefer a rather subtle coloured hint in the upper left corner instead of the frames or do not want to use see value colours at all, you can change it in the client\\\'s <em>Interface</em> options.</p>\\n</center>', 1649480720, 1),
(14, 13, '<p>Auto Screenshots</p>', '<center>Activate this feature to automatically take screenshots of important events.<br />&nbsp;<img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" />\\n<p>The Auto Screenshots feature can be configured in the client options.</p>\\n<p>Activate <em>Show Advanced Options</em> to access the <em>Misc</em> category and the corresponding <em>Screenshots</em> subcategory.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/autoscreenshots01.png\\\" alt=\\\"\\\" width=\\\"143\\\" height=\\\"104\\\" /></p>\\n<p>Choose if you want your whole client interface to be included in the screenshots or if you only want to capture the game window.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/autoscreenshots02.png\\\" alt=\\\"\\\" width=\\\"241\\\" height=\\\"28\\\" /></p>\\n<p>You can select different ingame events that will trigger an automatic screenshot. <br />Hover over the&nbsp;<img src=\\\"https://static.tibia.com/images/news/infosymbol.png\\\" alt=\\\"\\\" width=\\\"13\\\" height=\\\"12\\\" />&nbsp;button with your mouse cursor to learn more about each event.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/autoscreenshots03.png\\\" alt=\\\"\\\" width=\\\"449\\\" height=\\\"191\\\" /></p>\\n<p>Your local screenshots folder can be accessed via the client.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/autoscreenshots04.png\\\" alt=\\\"\\\" width=\\\"165\\\" height=\\\"42\\\" /></p>\\n<p>All screenshots are named after a certain pattern:</p>\\n<p><em>date, time, character name, event name, backlog number</em>.</p>\\n<p>Assign a hotkey in the <em>general hotkeys</em> section to&nbsp;trigger the&nbsp;screenshots feature manually.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/autoscreenshots05.png\\\" alt=\\\"\\\" width=\\\"517\\\" height=\\\"185\\\" /></p>\\n</center>', 1649480751, 1),
(15, 13, '<p>VIP List</p>', '<center>\\n<p>The VIP list helps you to keep track of your friends and enemies.<br />&nbsp;<img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" /></p>\\n</center><center></center><center>Open VIP list: Press <img src=\\\"https://static.tibia.com/images/news/viplist02.png\\\" alt=\\\"\\\" width=\\\"87\\\" height=\\\"42\\\" /> or click the VIP list button to open the VIP list in your sidebar.\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/viplist01.png\\\" alt=\\\"\\\" width=\\\"419\\\" height=\\\"186\\\" /></p>\\n<p><span style=\\\"text-decoration: underline;\\\">Add VIP</span></p>\\n<p>Enter a character\\\'s name to create the corresponding entry in your VIP list.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/viplist03.png\\\" alt=\\\"\\\" width=\\\"595\\\" height=\\\"181\\\" /></p>\\n<p><span style=\\\"text-decoration: underline;\\\">Edit VIP</span></p>\\n<p>VIP list entries can be edited. You can assign a special icon and enter a short description. Set a check mark if you want to receive an automatic message whenever the selected character logs into the game and tick the groups you want the character to be listed in.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/viplist04.png\\\" alt=\\\"\\\" width=\\\"513\\\" height=\\\"368\\\" /></p>\\n<p><span style=\\\"text-decoration: underline;\\\">VIP List Filters</span></p>\\n<p>You can sort your VIP list by certain criteria and clear it up by hiding offline characters and group names.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/viplist05.png\\\" alt=\\\"\\\" width=\\\"207\\\" height=\\\"181\\\" /></p>\\n<p><span style=\\\"text-decoration: underline;\\\">Add Groups</span></p>\\n<p>Keep your VIP list neat and tidy and categorise your entries in groups. Premium players can add up to 5 additional groups to their VIP list.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/viplist06.png\\\" alt=\\\"\\\" width=\\\"589\\\" height=\\\"181\\\" /></p>\\n</center>', 1649480772, 1),
(16, 13, '<p>Quick Looting</p>', '<center>Use quick looting to loot more efficiently and customise it to your liking.<br />&nbsp;<img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" />\\n<p>Quick looting allows you to loot all items in a monster corpse with&nbsp;a&nbsp;single click.</p>\\n<p>If you use Classic Controls, you can choose between the following mouse options to quick loot:</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/quicklooting01.png\\\" alt=\\\"\\\" width=\\\"503\\\" height=\\\"99\\\" /></p>\\n<p>&nbsp;</p>\\n<table style=\\\"height: 52px;\\\" width=\\\"556\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 268px; vertical-align: top;\\\">\\n<p>If you use Left Smart-Click, you quick loot all items if you press Alt + left click on a corpse.</p>\\n</td>\\n<td style=\\\"width: 272px; vertical-align: top;\\\">\\n<p>If you use Regular Controls, you quick loot all items if you press Shift + right click on a corpse.</p>\\n</td>\\n</tr>\\n<tr>\\n<td style=\\\"width: 268px; text-align: center;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/quicklooting02.png\\\" alt=\\\"\\\" width=\\\"91\\\" height=\\\"154\\\" /></td>\\n<td style=\\\"width: 272px; text-align: center;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/quicklooting07.png\\\" alt=\\\"\\\" width=\\\"91\\\" height=\\\"154\\\" /></td>\\n</tr>\\n</tbody>\\n</table>\\n<p>As a premium player, you can also loot a specific item within a corpse with a single click:</p>\\n<p>&nbsp;</p>\\n<table style=\\\"height: 30px;\\\" width=\\\"608\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 194px; text-align: center;\\\">Classic Controls</td>\\n<td style=\\\"width: 194px; text-align: center;\\\">Left Smart-Click</td>\\n<td style=\\\"width: 196px; text-align: center;\\\">Regular Controls</td>\\n</tr>\\n<tr>\\n<td style=\\\"width: 194px; text-align: center;\\\"><img src=\\\"https://static.tibia.com/images/news/quicklooting06.png\\\" alt=\\\"\\\" width=\\\"179\\\" height=\\\"105\\\" /></td>\\n<td style=\\\"width: 194px; text-align: center;\\\"><img src=\\\"https://static.tibia.com/images/news/quicklooting03.png\\\" alt=\\\"\\\" width=\\\"179\\\" height=\\\"105\\\" /></td>\\n<td style=\\\"width: 196px; text-align: center;\\\"><img src=\\\"https://static.tibia.com/images/news/quicklooting08.png\\\" alt=\\\"\\\" width=\\\"179\\\" height=\\\"105\\\" /></td>\\n</tr>\\n</tbody>\\n</table>\\n<p>If you use the animated mouse cursor, a special icon will indicate quick looting. You can activate this cursor in the Options menu.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/quicklooting09.png\\\" alt=\\\"\\\" width=\\\"327\\\" height=\\\"56\\\" /></p>\\n<p>Premium status allows you to refine quick looting with two filters: Skipped Loot and Accepted Loot.<br />While you can only use one of the two filters at a time, you can switch between the two of them as you please.</p>\\n<p>Here\\\'s how you set them up:</p>\\n<p>Open the Manage Loot Containers dialog. <br />You can access it via the Cyclopedia, the context menu of a container or a hotkey which you can assign in the Hotkey section of the Options menu.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/quicklooting10.png\\\" width=\\\"411\\\" height=\\\"271\\\" /></p>\\n<p>Choose <em>Skipped Loot</em> to exclude certain items from quick looting:</p>\\n<table style=\\\"height: 75px; width: 509px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 239px; vertical-align: top;\\\">(A) You can add an item to your Skipped Loot list via an item\\\'s context menu. Once added, you can remove that item from the list again via its context menu.</td>\\n<td style=\\\"width: 254px; vertical-align: top;\\\">(B) You can also add or remove items via the \\\"Skip when Quick Looting\\\" tick box in the Item Cyclopedia.</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/quicklooting12.png\\\" alt=\\\"\\\" width=\\\"513\\\" height=\\\"402\\\" /></p>\\n<p>Choose <em>Accepted Loot</em> to only quick loot items that you have added to your accepted loot list. You can add an item to your Accepted Loot list or remove it via the item\\\'s context menu, similar to how it works with the Skipped Loot list.</p>\\n<p>You can also remove an item on the right-hand side of the Manage Loot Containers dialog by clicking the X-button.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/quicklooting15.png\\\" alt=\\\"\\\" width=\\\"135\\\" height=\\\"40\\\" /></p>\\n<p>You can add up to 500 items to both your skipped loot list and your accepted loot list.<br />&nbsp;</p>\\n<p>How to manage and sort your loot conveniently:</p>\\n<p>The Manage Loot Containers dialog allows you to assign categories to your containers to automatically sort quick looted items if you have premium status.<br /><br /></p>\\n<table style=\\\"height: 102px; margin-left: auto; margin-right: auto; width: 648px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr style=\\\"height: 65px;\\\">\\n<td style=\\\"width: 411px; height: 65px; vertical-align: middle;\\\">\\n<p>To assign a loot categoy, press the crosshairs button next to it and click on the container of your choice. Done!</p>\\n<p>From now on, quick looted items of this category will be automatically put into that container.</p>\\n<p>To remove a loot category from a container, simply press the X button next to the category in the Manage Loot Containers dialog.</p>\\n<p>You can assign multiple categories to the same loot container.</p>\\n<p>If you hover over the small bag icon in the lower right corner of a container that has at least one category assigned to it, these categories will be displayed.</p>\\n</td>\\n<td style=\\\"width: 205px; height: 65px; vertical-align: middle;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/quicklooting13.png\\\" width=\\\"341\\\" height=\\\"306\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<table style=\\\"height: 102px; margin-left: auto; margin-right: auto; width: 644px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr style=\\\"height: 65px;\\\">\\n<td style=\\\"width: 154.5px; height: 65px; vertical-align: middle;\\\"><img src=\\\"https://static.tibia.com/images/news/quicklooting14.png\\\" width=\\\"201\\\" height=\\\"136\\\" /></td>\\n<td style=\\\"width: 459.5px; height: 65px; vertical-align: middle;\\\">\\n<p>Items that belong to categories which you have not assigned to a specific container, will be quick looted into the <em>Unassigned Loot</em> container.</p>\\n<p>Per default, this is your main container, the one you have equipped in&nbsp;the body slot. You can also&nbsp;select a different container for unassigned loot via the Manage Loot Containers dialog.</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n</center>', 1649480797, 1),
(17, 13, '<p>Hotkeys</p>', '<center>Hotkeys allow you to quickly trigger actions by pressing a specific key or key combination. <br />Define hotkey presets for your characters to optimise your gameplay!<br />\\n<table style=\\\"height: 23px; margin-left: auto; margin-right: auto;\\\" width=\\\"55\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 45px;\\\"><img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" /></td>\\n</tr>\\n</tbody>\\n</table>\\n<p>You can have the hotkey preset for a specific character automatically activated upon login.</p>\\n<p>Press <img src=\\\"https://static.tibia.com/images/news/hotkeys12.png\\\" width=\\\"82\\\" height=\\\"41\\\" align=\\\"middle\\\" /> or open the Options menu and go to the Hotkeys section. Check this box:</p>\\n<table style=\\\"height: 80px; margin-left: auto; margin-right: auto;\\\" width=\\\"253\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 243px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/hotkeys02.png\\\" width=\\\"243\\\" height=\\\"84\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>Either click <em>Add</em> to create a new hotkey preset or <em>Rename</em> to change the name an existing one.</p>\\n<table style=\\\"margin-left: auto; margin-right: auto; height: 75px;\\\" width=\\\"192\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 181px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/hotkeys11.png\\\" width=\\\"181\\\" height=\\\"52\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>Make sure to name the hotkey preset exactly like the character it is meant for and click OK. Done!</p>\\n<table style=\\\"margin-left: auto; margin-right: auto; height: 75px;\\\" width=\\\"192\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 181px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/hotkeys03.png\\\" width=\\\"363\\\" height=\\\"164\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>&nbsp;<br />There are two chat modes in Tibia. This is important to know for your hotkey presets.</p>\\n<table style=\\\"margin-left: auto; margin-right: auto; width: 354px; height: 328px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 161.917px;\\\" valign=\\\"top\\\">\\n<p style=\\\"text-align: center;\\\"><span style=\\\"text-decoration: underline;\\\">Chat On</span></p>\\n<p>You can write text in the chat console.</p>\\n<p>If you have assigned an action to a letter key (e.g. A), pressing this key will trigger the action but you will not be able to type the letter in the entry line of the chat console.</p>\\n</td>\\n<td style=\\\"width: 160.083px;\\\" valign=\\\"top\\\">\\n<p style=\\\"text-align: center;\\\"><span style=\\\"text-decoration: underline;\\\">Chat Off</span></p>\\n<p>You cannot write any text in the entry line of the console.</p>\\n<p>Per default, you can walk with WASD in this mode.</p>\\n</td>\\n</tr>\\n<tr>\\n<td style=\\\"width: 336px;\\\" colspan=\\\"2\\\" valign=\\\"top\\\">\\n<p style=\\\"text-align: center;\\\">Chat On*</p>\\n<p>This temporary mode is a special case. Per default, if you press the Return key in Chat Off mode, it temporarily switches to Chat On* so that you can write one message in the console. As soon as you press Return to send the message, your chat mode will be set to Chat Off again.</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<table style=\\\"margin-left: auto; margin-right: auto; width: 593px; height: 128px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 403.433px;\\\" valign=\\\"middle\\\">The small button on the right side of the entry line of the chat console tells you which chat mode is currently active. Click it to switch between the two chat modes.</td>\\n<td style=\\\"width: 156.567px;\\\"><img src=\\\"https://static.tibia.com/images/news/hotkeys06a.png\\\" alt=\\\"\\\" width=\\\"223\\\" height=\\\"110\\\" /></td>\\n</tr>\\n</tbody>\\n</table>\\n<p>To assign and edit hotkeys, first select the hotkey preset you want to edit.</p>\\n<table style=\\\"margin-left: auto; margin-right: auto; height: 74px; width: 303px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 317px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/hotkeys05new.png\\\" width=\\\"317\\\" height=\\\"90\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>Now select the chat mode for which you want to edit hotkeys:</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/hotkeys04new.png\\\" width=\\\"255\\\" height=\\\"57\\\" align=\\\"middle\\\" /></p>\\n<p><br />If you want your hotkeys to work in both modes, you need to set them in both modes! <br />So this basically means that you have to set up your hotkeys twice.</p>\\n<p>&nbsp;</p>\\n<table style=\\\"margin-left: auto; margin-right: auto; width: 523px; height: 81px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 327px;\\\" valign=\\\"middle\\\">\\n<p>Check the box <em>Show Advanced Options</em> to access all hotkeys via the three hotkey subsections under Controls: general hotkeys, action bar hotkeys and custom hotkeys.</p>\\n<p>If you leave the box unchecked, only basic options will be displayed in the Options menu. With this setting,&nbsp;you can only assign hotkeys to predefined actions&nbsp;via&nbsp;the button <em>Hotkeys</em>:&nbsp;<img src=\\\"https://static.tibia.com/images/news/hotkeys07new.png\\\" width=\\\"119\\\" height=\\\"32\\\" align=\\\"middle\\\" /></p>\\n</td>\\n<td style=\\\"width: 164px;\\\" valign=\\\"middle\\\"><img src=\\\"https://static.tibia.com/images/news/hotkeys17.png\\\" alt=\\\"\\\" width=\\\"191\\\" height=\\\"153\\\" /></td>\\n</tr>\\n</tbody>\\n</table>\\n<p><br />If you have checked the box <em>Show Advanced Options</em>, <br />you can set your personal hotkeys in the subsection <em>Custom Hotkeys</em>.</p>\\n<p>Let\\\'s create a new entry:</p>\\n<p>Click on <em>New Action</em> and select the action of your choice.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/hotkeys08new.png\\\" width=\\\"463\\\" height=\\\"196\\\" /></p>\\n<table style=\\\"margin-left: auto; margin-right: auto; height: 179px; width: 647px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr style=\\\"height: 21px;\\\">\\n<td style=\\\"width: 490px; height: 21px;\\\" valign=\\\"middle\\\">\\n<p>(1) Click on <em>Assign Spell</em> to open a small window listing the various spells. Select a spell.</p>\\n<p>(2) Click OK to close this window.</p>\\n</td>\\n<td style=\\\"width: 130px; height: 21px; vertical-align: middle;\\\" valign=\\\"middle\\\"><img src=\\\"https://static.tibia.com/images/news/hotkeys13.png\\\" width=\\\"183\\\" height=\\\"200\\\" /></td>\\n</tr>\\n</tbody>\\n</table>\\n<br />\\n<table style=\\\"margin-left: auto; margin-right: auto; height: 179px; width: 649px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr style=\\\"height: 21px;\\\">\\n<td style=\\\"width: 364px; height: 21px;\\\" valign=\\\"middle\\\"><img src=\\\"https://static.tibia.com/images/news/hotkeys14.png\\\" width=\\\"427\\\" height=\\\"306\\\" />\\n<p>&nbsp;</p>\\n</td>\\n<td style=\\\"width: 256px; height: 21px; vertical-align: middle;\\\" valign=\\\"middle\\\">\\n<p>If you select <em>Assign Object</em>, your mouse cursor will turn into a crosshair. Click on an item and choose your preferred action in the window that will pop up.</p>\\n<p>Click OK&nbsp;to close this window.</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<table style=\\\"margin-left: auto; margin-right: auto; height: 197px; width: 776px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr style=\\\"height: 121px;\\\">\\n<td style=\\\"width: 303.5px; height: 121px;\\\" valign=\\\"top\\\"><img src=\\\"https://static.tibia.com/images/news/hotkeys15.png\\\" width=\\\"321\\\" height=\\\"150\\\" /></td>\\n<td style=\\\"width: 442.5px; height: 121px; vertical-align: middle;\\\" valign=\\\"middle\\\">\\n<p>(1) Click on <em>Assign Text</em> to open a small window and enter your text message.</p>\\n<p>(2) Click OK to close this window. If you want to send the text right away when clicking the action button, select send automatically before hitting OK.</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>Now we need to actually assign a hotkey to the action we just selected:<br /><br /></p>\\n<table style=\\\"margin-left: auto; margin-right: auto; height: 133px; width: 737px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr style=\\\"height: 121px;\\\">\\n<td style=\\\"width: 409px; height: 121px; vertical-align: middle;\\\">\\n<p>(1) To do so, click on the small pencil icon in the field <em>First Key</em>. This will open a window where you can edit the hotkey.&nbsp;</p>\\n<p>(2) Press the key or key combination of your choice.</p>\\n<p>(3) Click OK to close this window.</p>\\n<p>&nbsp;</p>\\n</td>\\n<td style=\\\"width: 296px; height: 121px; vertical-align: middle;\\\" valign=\\\"middle\\\"><img src=\\\"https://static.tibia.com/images/news/hotkeys09new.png\\\" width=\\\"245\\\" height=\\\"240\\\" />&nbsp;</td>\\n</tr>\\n</tbody>\\n</table>\\n<p><br />You can assign up to 2 hotkeys to every action. You need to have a hotkey assigned in the column <em>First Key</em> to be able to assign a hotkey in the column&nbsp;<em>Second Key</em>.</p>\\n<p>Always remember to save your hotkey changes and settings before closing the hotkey dialog! <br />To do so you can either click Apply to save your changes or click OK to save your changes and close the dialog.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/hotkeys10.png\\\" /></p>\\n<p>If you are looking for a specific hotkey in a hotkey section, you can also use the search bar.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/hotkeys16.png\\\" width=\\\"517\\\" height=\\\"216\\\" /></p>\\n<p>How to assign a hotkey to toggle between Chat On an Off:</p>\\n<table style=\\\"margin-left: auto; margin-right: auto; height: 140px; width: 470px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr style=\\\"height: 121px;\\\">\\n<td style=\\\"width: 452px; height: 121px;\\\" valign=\\\"top\\\">\\n<ul>\\n<li>Set <em>hotkey preset for chat mode</em> to Chat Off, scroll to the predefined action <em>Chat Mode: Set to Chat On</em>. Assign the hotkey of your choice.</li>\\n</ul>\\n<ul>\\n<li>Set <em>hotkey preset for chat mode</em> to Chat On, scroll to the predefined action <em>Chat Mode: Set to Chat Off</em>. Assign the same hotkey.</li>\\n</ul>\\n<ul>\\n<li>Click Apply to save or OK to save and close the hotkey dialog. Pressing this hotkey now toggles between the chat modes.</li>\\n</ul>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n</center>', 1649480828, 1),
(18, 15, '<p>Exaltation Forge</p>', '<center>The Exaltation Forge allows players to upgrade weapons, armour, and helmets with powerful effects. Items can be increased in tiers, with the maximum number of tiers for an item being limited by its classification into one of four groups.<br />\\n<table style=\\\"height: 23px; margin-left: auto; margin-right: auto;\\\" width=\\\"55\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 45px;\\\"><img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" /></td>\\n</tr>\\n</tbody>\\n</table>\\n<p>&nbsp;</p>\\n<table style=\\\"height: 242px; margin-left: auto; margin-right: auto; width: 485px;\\\" width=\\\"500\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 228px;\\\" valign=\\\"middle\\\">The Exaltation Forge lies north of the Adventurers\\\' Guild.</td>\\n<td style=\\\"width: 233.75px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/exaltationforge01.png\\\" width=\\\"192\\\" height=\\\"191\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>&nbsp;</p>\\n<p><span style=\\\"text-decoration: underline;\\\">Influenced Creatures</span></p>\\n<p>&nbsp;</p>\\n<table style=\\\"height: 152px; margin-left: auto; margin-right: auto; width: 594px;\\\" width=\\\"560\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 311.05px;\\\" valign=\\\"middle\\\">\\n<p>In order to make use of the forge, resources are required. The first one is <em>dust</em>. In order to get dust, which is non-tradable, players have to kill <em>influenced</em> monsters.</p>\\n</td>\\n<td style=\\\"width: 259.7px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/exaltationforge02.png\\\" width=\\\"180\\\" height=\\\"60\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>&nbsp;</p>\\n<p>These creatures have a low chance to spawn in place of a regular monster and are stronger versions of regular monsters. The higher the number below their name, the stronger they are, and the higher the potential to yield more dust.</p>\\n<p>&nbsp;</p>\\n<p><span style=\\\"text-decoration: underline;\\\">Fiendish Creatures</span></p>\\n<p>&nbsp;</p>\\n<table style=\\\"height: 155px; margin-left: auto; margin-right: auto; width: 584px;\\\" width=\\\"560\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 287.517px;\\\" valign=\\\"middle\\\">\\n<p><em>Fiendish</em> monsters are even stronger than influenced monsters. They also give more dust, as well as a new tradable resource called <em>slivers</em>.</p>\\n</td>\\n<td style=\\\"width: 273.233px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/exaltationforge03.png\\\" width=\\\"204\\\" height=\\\"62\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>&nbsp;</p>\\n<p>Fiendish monsters are much rarer than influenced monsters. The spell Find Fiend indicates the direction to the nearest fiendish creature.</p>\\n<p>&nbsp;</p>\\n<p><span style=\\\"text-decoration: underline;\\\">Dust Limit and Conversion<br /></span></p>\\n<p>&nbsp;</p>\\n<table style=\\\"height: 277px; margin-left: auto; margin-right: auto; width: 655px;\\\" width=\\\"619\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 291.367px;\\\" valign=\\\"middle\\\">\\n<p>A player can only carry 100 dust at first, but this limit can be increased to a maximum of 225 by spending dust.</p>\\n</td>\\n<td style=\\\"width: 336.35px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/exaltationforge04.png\\\" width=\\\"306\\\" height=\\\"214\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>&nbsp;</p>\\n<p>Dust can also be converted into slivers, and slivers can be converted into exalted cores.</p>\\n<p>&nbsp;</p>\\n<table style=\\\"height: 200px; margin-left: auto; margin-right: auto; width: 400px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 174px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/exaltationforge05.png\\\" width=\\\"174\\\" height=\\\"89\\\" /></p>\\n</td>\\n<td style=\\\"width: 174px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/exaltationforge06.png\\\" width=\\\"174\\\" height=\\\"89\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>&nbsp;</p>\\n<p><span style=\\\"text-decoration: underline;\\\">Effects</span></p>\\n<p>Upgrading an item through the Exaltation Forge provides it with the following effects:</p>\\n<ul>\\n<li style=\\\"text-align: center;\\\">Onslaught (for weapons): An attack may deal 60% bonus damage, which is additive to critical hits.</li>\\n<li style=\\\"text-align: center;\\\">Ruse (for armour): Provides a chance of completely avoiding damage from an attack.</li>\\n<li style=\\\"text-align: center;\\\">Momentum (for helmets): Grants a chance every two seconds to reduce all existing spell cooldowns by two seconds if the battle sign is present. This affects individual spell cooldown and the secondary group cooldown, but not the primary group cooldown.</li>\\n</ul>\\n<p>A higher tier increases the trigger chance of these effects.</p>\\n<p>&nbsp;</p>\\n<p><span style=\\\"text-decoration: underline;\\\">Fusion</span></p>\\n<p>&nbsp;</p>\\n<table style=\\\"height: 303px; margin-left: auto; margin-right: auto; width: 879px;\\\" width=\\\"700\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 542px;\\\" valign=\\\"middle\\\">\\n<p>Two of the same item need to be fused, in addition to a sum of gold (higher tiers demand higher prices), and 100 dust.</p>\\n<p>Success of a fusion is not guaranteed &ndash; there is a possibility that the second item will be either reduced by one tier, or, in case it was a tier 0 item, it will be destroyed. Using exalted cores, the success of the operation can be increased, however, and the risk of losing a tier gets reduced, should the fusion fail.</p>\\n</td>\\n<td style=\\\"width: 314px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/exaltationforge07.png\\\" width=\\\"312\\\" height=\\\"243\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>&nbsp;</p>\\n<p><span style=\\\"text-decoration: underline;\\\">Transfer</span></p>\\n<p>&nbsp;</p>\\n<table style=\\\"height: 294px; margin-left: auto; margin-right: auto; width: 930px;\\\" width=\\\"700\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 360px;\\\" valign=\\\"middle\\\">\\n<p>A a tier can be transferred from another item of the same classification. The target item, which is to receive the tier, has to be tier 0, while the source item, from which the tier is transferred, has to be at least tier 2. This process requires 100 dust, one exalted core, and a sum of gold.</p>\\n<p>The transfer is guaranteed to succeed. The target item receives the source item\\\'s tier by a reduction of one tier, while the source item itself will be destroyed during the transfer.</p>\\n</td>\\n<td style=\\\"width: 424.317px;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/exaltationforge08.png\\\" width=\\\"325\\\" height=\\\"243\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n</center>', 1649480914, 1),
(19, 15, '<p>Tibiadrome</p>', '<center>\\n<p>The Tibiadrome allows players to prove their combat skills in arena fights against creatures which become progressively harder. A variety of rewards await players who are successful in combat.<br />&nbsp;<img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" /></p>\\n<p>Tibiadromes can be found in&nbsp;Ankrahmun, Edron, Kazordoon, Rathleton, and Thais. Any player who has reached at least level 50 can enter the arena. At most, five players can enter at the same time. Once a player has left the arena, they have to wait 60 minutes before they can enter again.</p>\\n<p><em><strong>Levels</strong></em></p>\\n<p>Your starting level signifies on which wave you will begin when entering a fight. Each player starts on wave 1. Each wave lasts a maximum of 120 seconds, in which all the monsters have to be killed to advance to the next wave. Once you have beaten a wave, your drome level and starting level will be raised by one. If you are entering as a group, the lowest starting level of any participant will determine on which wave you start. Once a rotation which lasts two weeks is over, the drome level of all players will be reset to zero and their starting level will be reduced by five.</p>\\n<p><em><strong>Difficulty scaling</strong></em></p>\\n<p>The difficulty of a fight in the Tibiadrome scales via group size and current wave level. The more players participate in the fight, the more creatures spawn in a wave, and the higher the wave level, the stronger the creatures are.</p>\\n<p><em><strong>Combat modifiers</strong></em></p>\\n<p>A&nbsp;number of combat modifiers which trigger certain effects pose an additional challenge.&nbsp;At the beginning of a rotation, two modifiers are randomly selected which are the same across all game worlds and are active in all waves during this period. The modifiers are:</p>\\n<ul>\\n<li style=\\\"text-align: center;\\\">Somersault: All melee monsters have a 15% chance to teleport to the furthest player.</li>\\n<li style=\\\"text-align: center;\\\">Going Down With Me: Upon death, monsters trigger an AoE that hits the lasthitter and all players around him for 25% of their current hp.</li>\\n<li style=\\\"text-align: center;\\\">Exploding Corpses: Monsters explode in an AoE upon death, hitting all players around them for 40% of their current hp.</li>\\n<li style=\\\"text-align: center;\\\">That Escalated Quickly: Monsters that drop below 25% increase their power as if they were 5 wave levels higher.</li>\\n<li style=\\\"text-align: center;\\\">The Floor is Lava: Every 15 seconds 100 random fields will be marked. After 3 seconds they deal damage equal to 60% of the current hp of players standing on them.</li>\\n<li style=\\\"text-align: center;\\\">Beam me Up!: Every 15 seconds 100 random fields will be marked. After 3 seconds all players on them will be teleported to a random position in the arena.</li>\\n<li style=\\\"text-align: center;\\\">Tanked Up: Every 15 seconds 100 random fields will be marked. After 3 seconds all players on them will be superdrunk for 10 seconds.</li>\\n<li style=\\\"text-align: center;\\\">Sown Sorrow: Every 20/17/14/11/8 seconds, depending on the number of participants, a seed will spawn. If no player steps on it within 6 seconds it will explode and fear all players for 2 seconds.</li>\\n<li style=\\\"text-align: center;\\\">Bad Roots: Every 20/17/14/11/8 seconds, depending on the number of participants, a seed will spawn. If no player steps on it within 6 seconds it will explode and root all players for 3 seconds.</li>\\n</ul>\\n<p><em><strong>Special conditions</strong></em></p>\\n<p>Since the Tibiadrome is a special environment, certain rules outside of it do not apply here. There is no death penalty, and mana, life and spirit potions, as well as runes, bolts, and arrows will not be consumed when used. There is no stamina drain and skill or level progression inside the Tibiadrome, and spells which cost soul points are deactivated.</p>\\n<p><em><strong>Rewards</strong></em></p>\\n<p>Besides a new highscore category, there is also a leaderboard on the website showing the standing of the participants in the current rotation. Players who have beaten at least one wave in the rotation will receive drome points after it has ended, which can be exchanged for decorative items, cosmetics, or a drome cube containing a powerful potion.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/tidr_su21_potions.png\\\" alt=\\\"\\\" width=\\\"224\\\" height=\\\"96\\\" /></p>\\n<p>The players ranking among the top 20 also receive a certain amount of randomly selected powerful potions after a rotation, depending on how well they fared. Additionally, a certain amount of potions equal to 20% of the remaining participants (but not more than 50 in total) will be raffled among these participants. Those who have made the top 5 in a rotation will also receive a temporary title which will last until the next rotation ends.</p>\\n</center>', 1649480936, 1);
INSERT INTO `canary_compendium` (`id`, `category`, `headline`, `message`, `publishdate`, `type`) VALUES
(20, 15, '<p>Character Auctions</p>', '<center>\\n<p>Character auctions allow you to sell your own characters or acquire other players\\\' characters.<br /> &nbsp;<img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" /></p>\\n<p><span style=\\\"text-decoration: underline;\\\">How to auction a character</span></p>\\n<p>On the bottom of the Store is a button that will open a dialog in which you can set up an auction to sell the character with which you are logged in.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/characterauctions01.png\\\" /></p>\\n<p><em>Requirements</em></p>\\n<p>On the first page, you can check if all required conditions to sell this character are fulfilled. If you only see green checkmarks, you may click on <em>Next</em>.</p>\\n<p><em>Configure Auction</em></p>\\n<p>On the next page, the auction can be individualised, with several options to do so:</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/characterauctions02.png\\\" /></p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/characterauctions04.png\\\" /> Set the starting price of the auction. It has to be at least 57 Tibia Coins.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/characterauctions05.png\\\" /> Choose at which day and time the auction should end. Note that your <em>local time</em> is displayed there. The length of the auction must be between one and 29 days from the server save following the set-up of the auction.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/characterauctions06.png\\\" /> Select up to 4 of your rarest and most valuable items to be prominently displayed in the Char Bazaar.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/characterauctions07.png\\\" /> Select up to 5 of your best skills, your greatest achievements or other outstanding features of your character to be prominently displayed in the Char Bazaar.</p>\\n<p>All other relevant information about your character will be displayed in the Char Bazaar\\\'s auction details.</p>\\n<p><em>Confirm Auction</em></p>\\n<p>Finally on the last page, you can recheck your auction set-up. Read everything carefully.</p>\\n<p>If you have selected everything correctly and you are sure that you want to put up this character for auction, <em>Confirm</em> your choice. Go back to a <em>Previous</em> page to change your current set up. If you have changed your mind and do not want to sell this character any longer, simply <em>Cancel</em> this set-up.</p>\\n<p>Once the auction has been set up, you can no longer access the character to change it in any way, as you will be logged out and can no longer log on your character. If you want to cancel the auction, you have to use the account management on the website.</p>\\n<p><em>Further info</em></p>\\n<p>The auction itself will be hosted on the Tibia website in the section Char Bazaar.</p>\\n<p>For more information on the auctioning process, please take a look at the <a href=\\\"https://www.tibia.com/news/?subtopic=latestnews&amp;id=5692\\\">FAQ</a>.</p>\\n<p><span style=\\\"text-decoration: underline;\\\">How to bid on a character</span></p>\\n<p>Bids are submitted on the Tibia website in the section Char Bazaar. Every relevant character detail is visible in the auction details. In this section you can not only bid on characters, but also watch auctions you are particularly interested in or see auctions which have ended in the last 30 days.</p>\\n<p>If you want to bid for a character, you can submit a bid limit, which has to be at least as high as the minimum bid or higher than the current bid, in case somebody has already bid on the character. Even though your bid limit may be much higher than the minimum or current bid, you only bid as much as you need in order to have the highest bid.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/characterauctions03.png\\\" /></p>\\n<p>Once you have clicked on <em>Submit Bid</em>, read carefully before finally confirming your bid.</p>\\n<p>Once the auction has ended and you hold the highest bid, the price will be paid automatically if you have sufficient funds. If you lack the necessary funds, you have 7 days to pay the selling price. When paid, the character will appear in your character list after the next server save.</p>\\n<p><em>Further info</em></p>\\n<p>For more information on the bidding process, please take a look at the <a href=\\\"https://www.tibia.com/news/?subtopic=latestnews&amp;id=5692\\\">FAQ</a>.</p>\\n</center>', 1649480961, 1),
(21, 15, '<p>Hunting Tasks</p>', '<center>Create a hunting task to gain rewards by killing a certain amount of a creature!<br /> &nbsp;<img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" />\\n<p>Press <img src=\\\"https://static.tibia.com/images/news/prey07.png\\\" alt=\\\"\\\" width=\\\"83\\\" height=\\\"42\\\" /> to open the prey dialog. Select the right tab \\\"Hunting Tasks\\\" at the top.</p>\\n<p>&nbsp;</p>\\n<table>\\n<tbody>\\n<tr>\\n<td>\\n<p style=\\\"margin-right: 5px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/preyhuntingtask01.png\\\" alt=\\\"\\\" width=\\\"257\\\" height=\\\"181\\\" /></p>\\n</td>\\n<td>\\n<p>(1) You can also click the prey button to open the prey window in your sidebar.</p>\\n<p>(2) Left-click in the prey window under \\\"Hunting Tasks\\\" to open the prey dialog.</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<br />\\n<table>\\n<tbody>\\n<tr>\\n<td>\\n<p style=\\\"margin-left: 30px;\\\">Select the creature to hunt or click here if you want to reroll the monsters to choose from:</p>\\n<center>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/preyhuntingtask02.png\\\" alt=\\\"\\\" width=\\\"111\\\" height=\\\"179\\\" /></p>\\n</center></td>\\n<td>\\n<p style=\\\"margin-left: 30px;\\\">The gold price for a list reroll depends on your character level.</p>\\n<center>\\n<p>&nbsp;</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/preyhuntingtask03.png\\\" alt=\\\"\\\" width=\\\"221\\\" height=\\\"105\\\" /></p>\\n</center></td>\\n</tr>\\n</tbody>\\n</table>\\n<br />\\n<table>\\n<tbody>\\n<tr>\\n<td>\\n<p style=\\\"margin-left: 30px;\\\">Choose the amount of creatures you want to kill. The higher amount is only available once the creature\\\'s Bestiary entry has been completed.</p>\\n<p style=\\\"margin-left: 30px;\\\">&nbsp;</p>\\n<center>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/preyhuntingtask04.png\\\" alt=\\\"\\\" width=\\\"191\\\" height=\\\"28\\\" /></p>\\n</center></td>\\n<td>\\n<p style=\\\"margin-left: 30px;\\\">Once you have selected the creature you wish to hunt, click here to start the hunting task.</p>\\n<center>\\n<p style=\\\"margin-right: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/preyhuntingtask05.png\\\" alt=\\\"\\\" width=\\\"91\\\" height=\\\"93\\\" /></p>\\n</center></td>\\n</tr>\\n</tbody>\\n</table>\\n<br />\\n<table>\\n<tbody>\\n<tr>\\n<td>\\n<p style=\\\"margin-left: 30px;\\\">If you are looking for a specific monster, you can use two Prey Wildcards to directly select the prey of your choice.</p>\\n<p style=\\\"margin-left: 30px;\\\">&nbsp;</p>\\n<center>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/preyhuntingtask06.png\\\" alt=\\\"\\\" width=\\\"145\\\" height=\\\"110\\\" /></p>\\n</center></td>\\n<td>\\n<p style=\\\"margin-left: 30px;\\\">Use a Prey Wildcard to get higher rewards. While higher rewards are selected, you will get a chance to win additional Hunting Task Points.<br />Prey Wildcards can be purchased for Tibia Coins in the Store or can be obtained at the reward shrine.</p>\\n<center>\\n<p style=\\\"margin-right: 1px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/preyhuntingtask07.png\\\" alt=\\\"\\\" width=\\\"145\\\" height=\\\"110\\\" /></p>\\n</center></td>\\n</tr>\\n</tbody>\\n</table>\\n<p><br />The prey window shows your current hunted creature(s) and the amount that needs to be slain to fulfill the task.<br />Hover over your prey for a tooltip with details.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/preyhuntingtask08.png\\\" alt=\\\"\\\" width=\\\"179\\\" height=\\\"176\\\" /></p>\\n<br />\\n<table>\\n<tbody>\\n<tr>\\n<td>\\n<p>&nbsp;</p>\\n<p style=\\\"margin-left: 30px;\\\">Once you have killed the required amount of monsters, click here to receive Hunting Task Points.</p>\\n</td>\\n<td>\\n<p style=\\\"margin-right: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/preyhuntingtask09.png\\\" alt=\\\"\\\" width=\\\"89\\\" height=\\\"93\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<br />\\n<p style=\\\"margin-left: 30px;\\\">Hunting Task Points can be exchanged for an outfit, a mount and items by talking to the NPC Walter Jaeger in Thais.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" /></p>\\n<p>You can create up to three hunting tasks simultaneously.<br />All players can use the first hunting task slot, Premium players can also use the second slot. Additional hunting task slots can be unlocked permanently by purchasing them for Tibia Coins in the Store.</p>\\n</center>', 1649480984, 1),
(22, 15, '<p>Improved Respawn Rate</p>', '<center>\\n<p>All players of a game world can donate gold to areas in order to activate a temporary improved respawn rate bonus. <br />&nbsp;<img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" /></p>\\n</center><center>\\n<table>\\n<tbody>\\n<tr>\\n<td>\\n<p>&nbsp;</p>\\n<p>Click on the map icon to open your Cyclopedia Map.</p>\\n</td>\\n<td>\\n<p style=\\\"margin-left: 4px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/respawnareabonus01.png\\\" alt=\\\"\\\" width=\\\"31\\\" height=\\\"57\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<table>\\n<tbody>\\n<tr>\\n<td>\\n<p style=\\\"margin-right: 4px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/respawnareabonus02.png\\\" alt=\\\"\\\" width=\\\"115\\\" height=\\\"74\\\" /></p>\\n</td>\\n<td>\\n<p>&nbsp;</p>\\n<p>Select the area for which you want to make a donation.</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<br />\\n<table>\\n<tbody>\\n<tr>\\n<td>\\n<p>On the left side you can see the current amount of gold donated for your selected area.</p>\\n<p>Enter the amount of gold you want to donate and click the \\\"Donate\\\" button in order to raise the gold donations of the respective area.</p>\\n<p>Hover your mouse over \\\"Improved Respawn Rate\\\" to&nbsp;see a donation overview&nbsp;of all areas.</p>\\n<p>The area with the highest amount of gold donations is granted the respawn bonus on a daily basis.</p>\\n<p>Furthermore, each day,&nbsp;one randomly drawn area receives that bonus as well.</p>\\n</td>\\n<td>\\n<p style=\\\"margin-left: 4px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/respawnareabonus04.png\\\" alt=\\\"\\\" width=\\\"255\\\" height=\\\"210\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<br />\\n<table>\\n<tbody>\\n<tr>\\n<td>Areas and subareas with a <img src=\\\"https://static.tibia.com/images/news/respawnareabonus05.png\\\" alt=\\\"\\\" width=\\\"23\\\" height=\\\"23\\\" /> next to their name have an improved respawn rate bonus running. <br />The improved respawn rate bonus of an area is active for one server save cycle. Afterwards, that area cannot receive another bonus for at least 24 hours.</td>\\n<td>\\n<p style=\\\"margin-left: 4px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/respawnareabonus06.png\\\" alt=\\\"\\\" width=\\\"143\\\" height=\\\"73\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<br />\\n<table>\\n<tbody>\\n<tr>\\n<td>\\n<p style=\\\"margin-right: 5px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/respawnareabonus07.png\\\" alt=\\\"\\\" width=\\\"149\\\" height=\\\"133\\\" /></p>\\n</td>\\n<td>\\n<p>&nbsp;</p>\\n<p>In case you are not sure to which area your hunting ground belongs,&nbsp;you can check the navigation tab of the Cyclopedia Map.</p>\\n<p>It&nbsp;displays the name of the area in which you are currently standing.</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n</center>', 1649481008, 1),
(23, 15, '<p>Supply Stash</p>', '<center>The Supply Stash is a storage container in your depot locker into which premium players can stow stackable items.<br />&nbsp;<img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" />\\n<p>In order to access the Supply Stash you need to stand on a glowing switch and open your locker.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/supplystash01.png\\\" alt=\\\"\\\" width=\\\"179\\\" height=\\\"68\\\" /></p>\\n<p><span style=\\\"text-decoration: underline;\\\">Stow items in the Supply Stash</span></p>\\n<p>There are different ways to stow items in the Supply Stash:<br /><br /></p>\\n<table>\\n<tbody>\\n<tr>\\n<td style=\\\"text-align: center;\\\">Drag &amp; drop an item on the Supply Stash symbol</td>\\n<td style=\\\"text-align: center;\\\">Select <em>Stow</em> or <em>Stow all items of this type </em>in the item\\\'s context menu.</td>\\n<td style=\\\"text-align: center;\\\">Drag &amp; drop a container on the stash symbol. All stowable items in it will be moved to the stash.</td>\\n</tr>\\n<tr>\\n<td style=\\\"text-align: center;\\\">\\n<p>&nbsp;<br />&nbsp;</p>\\n<p><br />&nbsp;</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/supplystash04.png\\\" alt=\\\"\\\" width=\\\"171\\\" height=\\\"49\\\" /></p>\\n</td>\\n<td style=\\\"border-width: thin 10px thin 10px; text-align: center;\\\">\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/supplystash02.png\\\" alt=\\\"\\\" width=\\\"239\\\" height=\\\"246\\\" /></p>\\n</td>\\n<td style=\\\"text-align: center;\\\">\\n<p>&nbsp;</p>\\n<p>&nbsp;</p>\\n<p>&nbsp;</p>\\n<p><br />&nbsp;<img src=\\\"https://static.tibia.com/images/news/supplystash03.png\\\" alt=\\\"\\\" width=\\\"213\\\" height=\\\"68\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p><span style=\\\"text-decoration: underline;\\\">Retrieve items from the Supply Stash</span></p>\\n<p>To retrieve items from the stash, click on the item and select or type the amount you want to retrieve.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/supplystash05.png\\\" alt=\\\"\\\" width=\\\"189\\\" height=\\\"148\\\" /></p>\\n<p><span style=\\\"text-decoration: underline;\\\">Define loot containers to sort retrieved items</span></p>\\n<p>Depending on your loot container setup, retrieved items from the stash are automatically sorted into the respective containers in your inventory. If you want all retrieved items to be sent to only one container instead, you can&nbsp;assign a Stash Retrieve container.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/supplystash06.png\\\" alt=\\\"\\\" width=\\\"519\\\" height=\\\"51\\\" /></p>\\n<p>Use predefined filters (1) to list only items of a designated category or use NPC filters (2) to display only items that can be sold to the selected NPC. If you are looking for a specific item, type its name into the search bar (3).</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/supplystash07.png\\\" alt=\\\"\\\" width=\\\"607\\\" height=\\\"186\\\" /></p>\\n<p>Stowed astral sources will be taken directly from your Supply Stash if you want to imbue your equipment at an imbuing shrine.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/supplystash08.png\\\" alt=\\\"\\\" width=\\\"291\\\" height=\\\"244\\\" /></p>\\n</center>', 1649481030, 1),
(24, 15, '<p>Cyclopedia Map</p>', '<center>The Cyclopedia Map is a world map of Tibia. <br />Discover areas to gradually unlock interesting info and details about the world.<br />&nbsp;<img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" />\\n<p>You can open the Cyclopedia Map directly by clicking on the respective button next to the minimap.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/cyclopediamap01.png\\\" width=\\\"545\\\" height=\\\"271\\\" /></p>\\n<p>&nbsp;</p>\\n<table style=\\\"height: 52px; width: 544px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr style=\\\"height: 56px;\\\">\\n<td style=\\\"width: 78.5px; height: 56px; vertical-align: middle;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/cyclopediamap02.png\\\" alt=\\\"\\\" width=\\\"71\\\" height=\\\"70\\\" /></p>\\n</td>\\n<td style=\\\"width: 893.5px; height: 56px; vertical-align: middle;\\\">\\n<p>Your character\\\'s current position is marked with a red pin on the map. This position is centered when you open the Cyclopedia map.</p>\\n<p>Use your mouse cursor to drag and drop the map in order to move it around.&nbsp;To zoom in and out of the map, hover your mouse cursor over the map and scroll the mouse wheel. Using the mouse wheel in combination with the SHIFT key changes the current floor.</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<table style=\\\"height: 52px; width: 546px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr style=\\\"height: 56px;\\\">\\n<td style=\\\"width: 45.5px; height: 56px; vertical-align: middle;\\\"><img src=\\\"https://static.tibia.com/images/news/cyclopediamap03.png\\\" alt=\\\"\\\" width=\\\"55\\\" height=\\\"53\\\" /></td>\\n<td style=\\\"width: 490.5px; height: 56px; vertical-align: middle;\\\">\\n<p>If you want to center the map back to your character\\\'s current position, click the middle of the compass rose.</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>You can also use the navigation slider to switch the map to upper or lower floors.</p>\\n<table style=\\\"height: 30px; width: 524px;\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 128px; text-align: center; vertical-align: middle;\\\"><img src=\\\"https://static.tibia.com/images/news/cyclopediamap04.png\\\" width=\\\"31\\\" height=\\\"76\\\" /></td>\\n<td style=\\\"width: 485.5px; vertical-align: middle;\\\">&nbsp;</td>\\n<td style=\\\"width: 4383.5px; vertical-align: middle;\\\">Hover your mouse cursor over the slider and scroll your mouse wheel up or down to switch floors.<br />A click on the blue or red section of the slider will show the map of the floor above or below you.<br />You can also drag and drop the slider to the map floor you would like to see.</td>\\n</tr>\\n</tbody>\\n</table>\\n<table style=\\\"height: 52px; width: 550px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr style=\\\"height: 18px;\\\">\\n<td style=\\\"width: 487.5px; height: 18px; vertical-align: middle;\\\">\\n<p>Choose your preferred view of the map and the filter marks you would like to see displayed on the map.</p>\\n<p>The Cyclopedia Map is subdivided in different areas and subareas.</p>\\n<p>Click on the name of an area or subarea to select and highlight it on the map.</p>\\n</td>\\n<td style=\\\"width: 50.5px; height: 18px; vertical-align: top;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/cyclopediamap05.png\\\" width=\\\"181\\\" height=\\\"135\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<center><br />You can use the Cyclopdia Map to navigate your character. <br />SHIFT+Left-click in your Cyclopedia Map and your character starts walking to the desired position as long as the destination is reachable, within range and on the same layer.<br /><br /></center>\\n<table style=\\\"height: 85px; width: 511.5px;\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 503.5px;\\\"><center>Discover subareas!</center>\\n<p>1) Select a subarea.<br />2) Click the respective button to start discovering.</p>\\n<center>&nbsp;<img src=\\\"https://static.tibia.com/images/news/cyclopediamap06.png\\\" alt=\\\"\\\" width=\\\"497\\\" height=\\\"221\\\" /></center>\\n<p>Points of Interest will now be randomly placed in the selected subarea. You will have to find 7 of them in order to discover the subarea completely.</p>\\n<center>&nbsp;<img src=\\\"https://static.tibia.com/images/news/cyclopediamap07.png\\\" alt=\\\"\\\" width=\\\"473\\\" height=\\\"205\\\" /></center>\\n<p>If you have trouble finding enough of them, you can click the button Reset Points of Interest. All points will be randomly placed again and you can start over. Please note, though, that you will lose your current discovery progress of the subarea in question if you reset Points of Interest.</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>Once you have fully discovered enough subareas, you will unlock new useful features of the Cyclopedia Map:</p>\\n<table style=\\\"height: 75px; width: 503px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr style=\\\"height: 27px;\\\">\\n<td style=\\\"width: 278px; height: 27px; vertical-align: middle;\\\">\\n<p>Fully discovered at least 30% of all subareas of an area: locations of NPCs within that respective area can be shown on the map.</p>\\n</td>\\n<td style=\\\"width: 215px; height: 27px; text-align: center; vertical-align: middle;\\\"><img src=\\\"https://static.tibia.com/images/news/cyclopediamap08.png\\\" alt=\\\"\\\" width=\\\"125\\\" height=\\\"44\\\" /></td>\\n</tr>\\n<tr style=\\\"height: 27px;\\\">\\n<td style=\\\"width: 278px; height: 27px; vertical-align: middle;\\\">\\n<p>Fully discovered at least 70%: passages to subareas on other floor and teleports are displayed as stair symbols on the map.</p>\\n</td>\\n<td style=\\\"width: 215px; height: 27px; vertical-align: middle;\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/cyclopediamap09.png\\\" alt=\\\"\\\" width=\\\"225\\\" height=\\\"44\\\" /></p>\\n</td>\\n</tr>\\n<tr style=\\\"height: 27px;\\\">\\n<td style=\\\"width: 278px; height: 27px; vertical-align: middle;\\\">\\n<p>Fully discovered all subareas of an area: creatures that occur in those subareas are listed when you click on a subarea\\\'s name or on a passages symbol that leads to this subarea. Creatures for which the Bestiary entry has not yet been unlocked are displayed as a silhouette.</p>\\n<p>In addition, a player who has completed an area will be notified whenever a raid is about to take place in that area within the next hour.</p>\\n</td>\\n<td style=\\\"width: 215px; height: 27px; text-align: center; vertical-align: middle;\\\"><img src=\\\"https://static.tibia.com/images/news/cyclopediamap10.png\\\" alt=\\\"\\\" width=\\\"143\\\" height=\\\"109\\\" /></td>\\n</tr>\\n</tbody>\\n</table>\\n<p>Visit to NPC Charos in the Adventurers\\\' Guild to find out more about a special outfit you can unlock through discovering the Tibian world.</p>\\n</center>', 1649481053, 1),
(25, 15, '<p>Bestiary and Charms</p>', '<center>Gather useful details about Tibian creatures in the Bestiary to unlock hunting benefits.<br />&nbsp;<img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" />\\n<p>You can access the Bestiary via the respective tab in the Tibia Cyclopedia.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/bestiary01.png\\\" width=\\\"411\\\" height=\\\"271\\\" /></p>\\n<p>&nbsp;</p>\\n<table style=\\\"height: 52px; width: 554px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 343.5px; vertical-align: middle;\\\">\\n<p>Here, you can see various creature classes in Tibia, the total number of creatures in each class and how many of them you have already killed at least once.</p>\\n<p>Click on a class to see all creatures within that class.</p>\\n<p>A creature is considered unknown to you if you have not killed it at least once after the winter update 2017.&nbsp;</p>\\n</td>\\n<td style=\\\"width: 196.5px; text-align: left; vertical-align: middle;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/bestiary02.png\\\" alt=\\\"\\\" width=\\\"129\\\" height=\\\"121\\\" /></td>\\n</tr>\\n</tbody>\\n</table>\\n<p>Unknown creatures appear as shadows. As soon as you kill a creature for the first time, it will be displayed with its name and in colour and you can click on it to see details about it.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/bestiary03.png\\\" alt=\\\"\\\" width=\\\"431\\\" height=\\\"351\\\" />&nbsp;</p>\\n<table style=\\\"height: 52px; width: 554px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 343.5px; vertical-align: middle;\\\">\\n<p>&nbsp;</p>\\n<p>On a creature\\\'s detailed page, you can see its difficulty level and a kill counter which&nbsp;tells you how many times you need to kill this creature to unlock further details.</p>\\n<p>The number of kills you need to unlock each of the three stages of detail, depends on a creature\\\'s difficulty level.</p>\\n<p>Unlocking the third stage of detail completes a creature\\\'s entry. It now provides&nbsp;a wealth of information about the creature, ranging from basic stats to elemental sensitivities and loot drops, for example.</p>\\n<p>Speaking of loot: If a creature drops very rare loot items, they will only be displayed if you have completed the creature\\\'s entry and looted the item at least once.</p>\\n</td>\\n<td style=\\\"width: 196.5px; text-align: center; vertical-align: middle;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/bestiary04.png\\\" width=\\\"205\\\" height=\\\"122\\\" /></td>\\n</tr>\\n</tbody>\\n</table>\\n<p><br />The Bestiary Tracker keeps track of your kills.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/bestiary10.png\\\" width=\\\"249\\\" height=\\\"85\\\" /></p>\\n<p><br />You can add a creature by ticking the box \\\"Track Kills\\\" in a Bestiary entry.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/bestiary09.png\\\" width=\\\"347\\\" height=\\\"215\\\" /></p>\\n<p>Completing a creature\\\'s entry will be rewarded with charm points which you can spend&nbsp;to unlock&nbsp;charms - various offensive, defensive or passive bonus effects.</p>\\n<p>You can check all available charms and their prices in the Charms tab in the Cyclopedia.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/bestiary05.png\\\" width=\\\"353\\\" height=\\\"271\\\" /></p>\\n<p>The number of charm points you receive for completing a creature\\\'s entry depends on&nbsp;the creature\\\'s&nbsp;difficulty level.</p>\\n<table style=\\\"height: 79px;\\\" width=\\\"215\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 205px;\\\">\\n<ul>\\n<li>Trivial: 5 charm points</li>\\n<li>Easy: 15 charm&nbsp;points</li>\\n<li>Medium: 25 charm&nbsp;points</li>\\n<li>Hard: 50 charm&nbsp;points</li>\\n</ul>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>How to unlock a charm:</p>\\n<table style=\\\"height: 297px; width: 631px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 246px; vertical-align: middle;\\\">\\n<p>1) Collect enough charm points to unlock the charm of your choice.</p>\\n<p>2) Go to the Charms tab and click on the charm to select it.</p>\\n<p>3) Unlock it by clicking the respective button.</p>\\n<p>&nbsp;</p>\\n<p>Unlocked charms can be assigned to creatures with completed entries in the Bestiary.</p>\\n<p>A charm can only be used against one creature at a time. Also, a creature can only have one charm assigned at a time.</p>\\n</td>\\n<td style=\\\"width: 353px; text-align: center;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/bestiary06.png\\\" width=\\\"353\\\" height=\\\"271\\\" /></td>\\n</tr>\\n</tbody>\\n</table>\\n<p><br />You can assign charms via the Charms tab or directly on a creature\\\'s completed Bestiary page.</p>\\n<p>Via the Charms tab:</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/bestiary07.png\\\" width=\\\"573\\\" height=\\\"224\\\" /></p>\\n<table style=\\\"height: 114px;\\\" width=\\\"497\\\">\\n<tbody>\\n<tr style=\\\"height: 109px;\\\">\\n<td style=\\\"width: 487px; height: 109px;\\\">\\n<p>1) Click on the charm you want to assign.&nbsp;</p>\\n<p>2) Click on the creature against which you want to use the charm. You can only select creatures with completed entries and which do not have a charm assigned at the moment.&nbsp;</p>\\n<p>3) Click Select to assign the charm to this creature.</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>&nbsp;</p>\\n<p>Via a completed creature page:</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/bestiary08.png\\\" width=\\\"509\\\" height=\\\"318\\\" /></p>\\n&nbsp;\\n<table style=\\\"height: 95px;\\\" width=\\\"398\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 388px;\\\">\\n<p>&nbsp;</p>\\n<p>1) Use the drop down menu and click on the charm you want to assign. You can only select unlocked charms which are currently not assigned to a creature.</p>\\n<p>2) Click on the charm you want to use against this creature.&nbsp;</p>\\n<p>3) Click Select to assign the charm to this creature.</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>&nbsp;</p>\\n<p>If you want to use an assigned charm against a different creature or if you want to assign a different charm to a creature that is already linked to a charm, you can remove the charm for a gold fee via the Charms tab or on the creature\\\'s Bestiary page.</p>\\n<p>Premium players can assign up to six charms to different creatures at the same time, while free accounts can assign up to two.&nbsp;The Store allows you to purchase the permanent ability to assign all of your unlocked charms at the same time. It also reduces the amount of gold you have to pay for every charm removal by 25%.</p>\\n</center>', 1649481078, 1),
(26, 15, '<p>The Market</p>', '<center>The Market allows you to trade items and Tibia Coins with other players.<br />&nbsp;<img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" />\\n<p>Open the Market by by clicking on the respective button in your depot locker.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/market01.png\\\" width=\\\"377\\\" height=\\\"359\\\" /></p>\\n<p>&nbsp;</p>\\n<table style=\\\"height: 102px; margin-left: auto; margin-right: auto; width: 648px;\\\" cellpadding=\\\"5\\\">\\n<tbody>\\n<tr style=\\\"height: 83px;\\\">\\n<td style=\\\"width: 89px; height: 83px;\\\" valign=\\\"top\\\">\\n<p><img src=\\\"https://static.tibia.com/images/news/market02.png\\\" width=\\\"89\\\" height=\\\"241\\\" align=\\\"right\\\" /></p>\\n</td>\\n<td style=\\\"width: 527px; height: 83px;\\\" valign=\\\"middle\\\">\\n<p>Browse through the various categories (1) or use the search (2) to find the item you are interested in.</p>\\n<p>Select an item in the object list below Categories to see its current sell and buy offers sorted by the piece price.</p>\\n<table style=\\\"height: 18px; width: 525px;\\\">\\n<tbody>\\n<tr style=\\\"height: 216px;\\\">\\n<td style=\\\"width: 220.5px; height: 216px;\\\" valign=\\\"middle\\\">\\n<p><br />The average item prices are calculated on a daily basis for each game world.</p>\\n<p>Sell offers that are 25 % or more above a game world\\\'s average price are displayed in <strong style=\\\"color: #e06757;\\\">red</strong>, as are buy offers that are 25 % or more below the average.</p>\\n<p>If you lack the money or items to accept a sell or buy offer, this offer will be greyed out.</p>\\n</td>\\n<td style=\\\"width: 280px; height: 216px;\\\" valign=\\\"middle\\\"><img src=\\\"https://static.tibia.com/images/news/market03.png\\\" alt=\\\"\\\" width=\\\"279\\\" height=\\\"183\\\" /></td>\\n</tr>\\n</tbody>\\n</table>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>For more details on the selected item, including trading statistics of the last 30 days, click on the <em>Details</em> button in the lower right corner of the Market window.</p>\\n<center>&nbsp;<img src=\\\"https://static.tibia.com/images/news/market04.png\\\" width=\\\"325\\\" height=\\\"198\\\" /></center>\\n<p><br />How to create a SELL offer:</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/market06.png\\\" alt=\\\"\\\" width=\\\"577\\\" height=\\\"108\\\" /></p>\\n<table style=\\\"height: 123px; width: 540px;\\\">\\n<tbody>\\n<tr style=\\\"height: 19px;\\\">\\n<td style=\\\"width: 699px; height: 19px;\\\" colspan=\\\"2\\\">\\n<p><br />1) Select an item and click <em>Sell</em> in the <em>Create Offer</em> section. You can only sell items that are stored in your depot chest.<br />2) Enter the <em>Piece Price </em>you want to charge for one unit of the item you are about to offer.<br />3) Select the number of item units you want to sell via the slider <em>Amount</em>. To increase the slider\\\'s step size, hold Shift, Ctrl or Shift+Ctrl while using the slider.<br />4) Tick the box <em>Anonymous</em> if you do not want to reveal that you are the creator of this offer.<br />5) If you have entered everything correctly, click on <em>Create</em> to place the offer.</p>\\n<p><img src=\\\"https://static.tibia.com/images/news/market05.png\\\" hspace=\\\"10\\\" width=\\\"301\\\" height=\\\"65\\\" align=\\\"right\\\" /></p>\\n<p>You can only place a sell offer if you have enough gold to pay the fee. Hover over your balance in the lower left corner of the Market window to see how much you have in cash and in your bank account.</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p><br />How to accept a SELL offer to buy something from someone else:</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/market09.png\\\" width=\\\"573\\\" height=\\\"76\\\" /></p>\\n<table style=\\\"height: 45px; width: 549px;\\\">\\n<tbody>\\n<tr style=\\\"height: 19px;\\\">\\n<td style=\\\"width: 539px; height: 19px;\\\">\\n<p><br />1) Select an item and click on the offer of your choice in the <em>Sell Offers</em> list. <br />2) Set the number of item units you want to buy via the slider <em>Amount</em>. <br />3) Check the total amount you will have to pay and click on <em>Accept</em> to seal the deal.</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p><br />How to create a BUY offer:</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/market07.png\\\" width=\\\"577\\\" height=\\\"108\\\" /></p>\\n<table style=\\\"height: 123px; width: 540px;\\\">\\n<tbody>\\n<tr style=\\\"height: 19px;\\\">\\n<td style=\\\"width: 500px; height: 19px;\\\">\\n<p><br />1) Select an item and click <em>Buy</em> in the <em>Create Offer</em> section. You can only place a buy offer if you have enough gold to pay the fee and your offered price.<br />2) Enter the <em>Piece Price</em> you are willing to spend on one unit of the item you want to buy. <br />3) Select the number of item units you want to buy via the slider <em>Amount</em>. To increase the slider\\\'s step size, hold Shift, Ctrl or Shift+Ctrl while using the slider.<br />4) Tick the box <em>Anonymous</em> if you do not want others to know that you are the creator of this offer. <br />5) If you have entered everything correctly, click on <em>Create</em> to place the offer.</p>\\n<p>Items from the Market will be transferred directly to your mail inbox which you access via your depot locker.</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>How to accept a BUY offer to sell something to someone else:</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/market08.png\\\" alt=\\\"\\\" width=\\\"573\\\" height=\\\"76\\\" /></p>\\n<table style=\\\"height: 61px; width: 532px;\\\">\\n<tbody>\\n<tr style=\\\"height: 19px;\\\">\\n<td style=\\\"width: 522px; height: 19px;\\\">\\n<p><br />1) Select an item and click on the offer of your choice in the <em>Buy Offers</em> list. You can only sell items that are stored in your depot chest.<br />2) Set the number of item units you want to sell via the slider <em>Amount</em>. <br />3) Check the total amount you will earn and click on <em>Accept</em> to seal the deal.</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p>&nbsp;</p>\\n<p>Check the section <em>My Offers</em> to get an overview of your current offers and your offer history.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/market10.png\\\" width=\\\"325\\\" height=\\\"28\\\" /></p>\\n</center>', 1649481101, 1),
(27, 15, '<p>Prey Creatures</p>', '<center>Activate a prey to gain a bonus when hunting certain monsters!<br /> &nbsp;<img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" />\\n<p>Press <img src=\\\"https://static.tibia.com/images/news/prey07.png\\\" alt=\\\"\\\" width=\\\"83\\\" height=\\\"42\\\" /> to open the prey dialog.</p>\\n<p>&nbsp;</p>\\n<table>\\n<tbody>\\n<tr>\\n<td>\\n<p style=\\\"margin-right: 5px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/prey01.png\\\" alt=\\\"\\\" width=\\\"257\\\" height=\\\"171\\\" /></p>\\n</td>\\n<td>\\n<p>(1) You can also click the prey button to open the prey window in your sidebar.</p>\\n<p>(2) Left-click in the prey window to open the prey dialog.</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<br />\\n<table>\\n<tbody>\\n<tr>\\n<td>\\n<p style=\\\"margin-left: 30px;\\\">Select your prey or click here if you want to reroll the monsters to choose from:</p>\\n<center>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/prey02.png\\\" alt=\\\"\\\" width=\\\"109\\\" height=\\\"163\\\" /></p>\\n</center></td>\\n<td>\\n<p style=\\\"margin-left: 30px;\\\">You get a free list reroll every 20 hours. The gold price for a list reroll depends on your character level.</p>\\n<center>\\n<p>&nbsp;</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/prey04.png\\\" alt=\\\"\\\" width=\\\"215\\\" height=\\\"113\\\" /></p>\\n</center></td>\\n</tr>\\n</tbody>\\n</table>\\n<br />\\n<table>\\n<tbody>\\n<tr>\\n<td>\\n<p>&nbsp;</p>\\n<p style=\\\"margin-left: 30px;\\\">Once you have selected your prey, click here to activate it and get a random bonus: damage boost, damage reduction, bonus XP, or improved loot.</p>\\n</td>\\n<td>\\n<p style=\\\"margin-right: 15px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/prey03.png\\\" alt=\\\"\\\" width=\\\"91\\\" height=\\\"95\\\" /></p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<br />\\n<table>\\n<tbody>\\n<tr>\\n<td>\\n<p style=\\\"margin-left: 30px;\\\">If you are looking for a specific monster, you can use five Prey Wildcards to directly select the prey of your choice.</p>\\n<p style=\\\"margin-left: 30px;\\\">&nbsp;</p>\\n<center>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/prey11.png\\\" alt=\\\"\\\" width=\\\"147\\\" height=\\\"116\\\" /></p>\\n</center></td>\\n<td>\\n<p style=\\\"margin-left: 30px;\\\">Use a Prey Wildcard to reroll your bonus to get one with a higher value. <br />Prey Wildcards can be purchased for Tibia Coins in the Store or can be obtained at the reward shrine.&nbsp;</p>\\n<center>\\n<p style=\\\"margin-right: 1px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/prey05.png\\\" alt=\\\"\\\" width=\\\"215\\\" height=\\\"104\\\" /></p>\\n</center></td>\\n</tr>\\n<tr>\\n<td>\\n<p style=\\\"margin-left: 30px;\\\"><br />You want a different prey but would like to keep your current bonus?</p>\\n<p style=\\\"margin-left: 30px;\\\">Roll for a new monster list while you already have an active prey. Select a new prey from the list and activate it. Your hunting time will be reset to 2 hours.</p>\\n<center>\\n<p style=\\\"margin-bottom: 1px;\\\">&nbsp;<img src=\\\"https://static.tibia.com/images/news/prey08.png\\\" alt=\\\"\\\" width=\\\"229\\\" height=\\\"79\\\" /></p>\\n</center>\\n<p>&nbsp;</p>\\n<p style=\\\"margin-left: 30px;\\\">Tick the option \\\"Automatic Bonus Reroll\\\" if you want to have your prey bonus rerolled automatically whenever it is about to expire. Please note that each Automatic Bonus Reroll consumes one of the&nbsp;Prey Wildcards&nbsp;you have bought in the Store.</p>\\n<center>&nbsp;<img src=\\\"https://static.tibia.com/images/news/prey10.png\\\" alt=\\\"\\\" width=\\\"215\\\" height=\\\"151\\\" /></center></td>\\n<td>\\n<p style=\\\"margin-left: 30px;\\\"><br />You want a different bonus but would like to keep your current prey?</p>\\n<p style=\\\"margin-left: 30px; margin-bottom: 25px;\\\">Roll for a new bonus while you already have an active prey. Your hunting time will be reset to 2 hours with your new bonus.</p>\\n<center>&nbsp;<img src=\\\"https://static.tibia.com/images/news/prey09.png\\\" width=\\\"228\\\" height=\\\"79\\\" /></center>\\n<p>&nbsp;</p>\\n<p style=\\\"margin-left: 30px;\\\">You have found your perfect prey and bonus combination? Tick the option \\\"Lock Prey\\\" and your prey time will be set back whenever it is about to expire. Please note that each time the Lock Prey option triggers, it will consume five of your Prey Wildcards.</p>\\n<p style=\\\"margin-left: 30px;\\\">&nbsp;</p>\\n<center>&nbsp;<img src=\\\"https://static.tibia.com/images/news/prey12.png\\\" width=\\\"215\\\" height=\\\"59\\\" /></center>\\n<p>&nbsp;</p>\\n<p>&nbsp;</p>\\n</td>\\n</tr>\\n</tbody>\\n</table>\\n<p><br />The prey window shows your current prey, your bonus and the remaining time for the prey. <br />Hover over your prey for a tooltip with details.</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/prey13.png\\\" alt=\\\"\\\" width=\\\"179\\\" height=\\\"215\\\" /></p>\\n<p>By the way: Prey time only decreases while hunting!</p>\\n<p>&nbsp;<img src=\\\"https://static.tibia.com/images/news/line1px.png\\\" alt=\\\"\\\" width=\\\"550\\\" height=\\\"1\\\" /></p>\\n<p>You can activate up to 3 preys simultaneously. <br />All players can use the first prey slot, Premium players can also use the second slot. Additional prey slots can be unlocked permanently by purchasing them for Tibia Coins in the Store.</p>\\n</center>', 1649481125, 1),
(28, 20, '<p>Winter Update 2017</p>', '<center>\\n<table style=\\\"height: 88px;\\\" width=\\\"406\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 396px; vertical-align: top;\\\"><center>\\n<p><img src=\\\"https://static.tibia.com/images/news/winter2017.jpg\\\" width=\\\"480\\\" height=\\\"380\\\" /></p>\\n<p>If you would like to find out more, check the <a href=\\\"http://www.tibia.com/news/?subtopic=newsarchive&amp;id=4389\\\">release news</a> on our website.</p>\\n</center></td>\\n</tr>\\n</tbody>\\n</table>\\n</center>', 1649481203, 1),
(29, 20, '<p>Summer Update 2018</p>', '<center>\\n<table style=\\\"height: 88px;\\\" width=\\\"406\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 396px; vertical-align: top;\\\"><center>&nbsp;<img src=\\\"https://static.tibia.com/images/news/summer2018.jpg\\\" width=\\\"481\\\" height=\\\"381\\\" />\\n<p>If you would like to find out more, check the <a href=\\\"http://www.tibia.com/news/?subtopic=newsarchive&amp;id=4668\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\">release news</a> on our website.</p>\\n</center></td>\\n</tr>\\n</tbody>\\n</table>\\n</center>', 1649481224, 1),
(30, 20, '<p>Winter Update 2018</p>', '<center>\\n<table style=\\\"height: 88px;\\\" width=\\\"406\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 396px; vertical-align: top;\\\"><center>&nbsp;<img src=\\\"https://static.tibia.com/images/news/winter2018.jpg\\\" width=\\\"481\\\" height=\\\"381\\\" />\\n<p>If you would like to find out more, check the <a href=\\\"http://www.tibia.com/news/?subtopic=newsarchive&amp;id=4828\\\">release news</a> on our website.</p>\\n<p>Also, Compendium entries have been created and adjusted to explain the new features Colourised Loot Value, Supply Stash Expansion and Cycpopedia Map Walk further.</p>\\n</center></td>\\n</tr>\\n</tbody>\\n</table>\\n</center>', 1649481246, 1),
(31, 20, '<p>Summer Update 2019</p>', '<center>\\n<table style=\\\"height: 88px;\\\" width=\\\"406\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 396px; vertical-align: top;\\\"><center>&nbsp;<img src=\\\"https://static.tibia.com/images/news/summer2019.jpg\\\" width=\\\"479\\\" height=\\\"379\\\" />\\n<p>If you would like to find out more, check the <a href=\\\"http://www.tibia.com/news/?subtopic=newsarchive&amp;id=5141\\\">release news</a> on our website.</p>\\n</center></td>\\n</tr>\\n</tbody>\\n</table>\\n</center>', 1649481270, 1),
(32, 20, '<p>Winter Update 2019</p>', '<center>\\n<table style=\\\"height: 88px;\\\" width=\\\"406\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 396px; vertical-align: top;\\\"><center>&nbsp;<img src=\\\"https://static.tibia.com/images/news/2019_updatenews_goldenborder.png\\\" width=\\\"482\\\" height=\\\"382\\\" />\\n<p>If you would like to find out more, check the <a href=\\\"http://www.tibia.com/news/?subtopic=newsarchive&amp;id=5294\\\">release news</a> on our website.</p>\\n</center></td>\\n</tr>\\n</tbody>\\n</table>\\n</center>', 1649481316, 1),
(33, 20, '<p>Summer Update 2020</p>', '<center>\\n<table style=\\\"height: 88px;\\\" width=\\\"406\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 396px; vertical-align: top;\\\"><center>&nbsp;<img src=\\\"https://static.tibia.com/images/news/2020_updatenews_01_goldenborder.png\\\" width=\\\"482\\\" height=\\\"382\\\" />\\n<p>If you would like to find out more, check the <a href=\\\"http://www.tibia.com/news/?subtopic=newsarchive&amp;id=5622\\\">release news</a> on our website.</p>\\n</center></td>\\n</tr>\\n</tbody>\\n</table>\\n</center>', 1649481338, 1),
(34, 20, '<p>Winter Update 2020</p>', '<center>\\n<table style=\\\"height: 88px;\\\" width=\\\"406\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 396px; vertical-align: top;\\\"><center>&nbsp;<img src=\\\"https://static.tibia.com/images/news/2020_updatenews_website_goldenborder.jpg\\\" width=\\\"482\\\" height=\\\"372\\\" />\\n<p>If you would like to find out more, check the <a href=\\\"http://www.tibia.com/news/?subtopic=newsarchive&amp;id=5867\\\">release news</a> on our website.</p>\\n</center></td>\\n</tr>\\n</tbody>\\n</table>\\n</center>', 1649481359, 1),
(35, 20, '<p>Summer Update 2021</p>', '<center>\\n<table style=\\\"height: 88px;\\\" width=\\\"406\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 396px; vertical-align: top;\\\"><center>&nbsp;<img src=\\\"https://static.tibia.com/images/news/2021_updatenews_goldenborder.png\\\" width=\\\"482\\\" height=\\\"372\\\" />\\n<p>If you would like to find out more, check the <a href=\\\"http://www.tibia.com/news/?subtopic=newsarchive&amp;id=6191\\\">release news</a> on our website.</p>\\n</center></td>\\n</tr>\\n</tbody>\\n</table>\\n</center>', 1649481387, 1),
(36, 20, '<p>Winter Update 2021</p>', '<center>\\n<table style=\\\"height: 88px;\\\" width=\\\"406\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 396px; vertical-align: top;\\\"><center>&nbsp;<img src=\\\"https://static.tibia.com/images/news/2021_updatenews_image_website_goldenborder.jpg\\\" width=\\\"502\\\" height=\\\"372\\\" />\\n<p>If you would like to find out more, check the <a href=\\\"http://www.tibia.com/news/?subtopic=newsarchive&amp;id=6435\\\">release news</a> on our website.</p>\\n</center></td>\\n</tr>\\n</tbody>\\n</table>\\n</center>', 1649481433, 1),
(37, 20, '<p>Summer Update 2022</p>', '<center>\\n<table style=\\\"height: 88px;\\\" width=\\\"406\\\">\\n<tbody>\\n<tr>\\n<td style=\\\"width: 396px; vertical-align: top;\\\"><center>&nbsp;<img src=\\\"https://static.tibia.com/images/news/su2022_compendium.jpg\\\" width=\\\"502\\\" height=\\\"372\\\" />\\n<p>If you would like to find out more, check the <a href=\\\"http://www.tibia.com/news/?subtopic=newsarchive&amp;id=6816\\\">release news</a> on our website.</p>\\n</center></td>\\n</tr>\\n</tbody>\\n</table>\\n</center>', 1649481455, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_creatures`
--

CREATE TABLE `canary_creatures` (
  `id` int(11) NOT NULL,
  `tag` varchar(255) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `canary_creatures`
--

INSERT INTO `canary_creatures` (`id`, `tag`, `name`, `description`) VALUES
(1, 'acidblob', 'Acid Blobs', 'Highly destructive and corrosive, the Acid Blob has little in common with the ordinary slime. They are much better in finding and pursuing a target than their distant cousins. While the ordinary slime is driven by the primal urge to get food, the Acid Blob is out for destruction. It is indeed a frightening sight when a bunch of these creatures crawls towards a single target with the intention to completely destroy it.\r\nSome researchers speculate that Acid Blobs share their intelligence with blobs all over the world. As Acid Blobs reproduce themselves by splitting into two entities, this thesis might have an element of truth.\r\nBe it as it may, the Acid Blob is a constant threat particularly to the environment. Since living creatures are often smart and quick enough to avoid the attacks of the blobs, any kind of plants, constructions and the like are usually not that lucky and are annihilated by their attacks.\r\nIn the past, some eccentric madmen used Acid Blobs as waste disposal, which was considered to be somewhat stylish. However, after the Acid Blobs had digested a certain amount of waste, they started reproducing themselves multiple times which started to become a real problem. After several unpleasant incidents, this way of waste disposal was stopped, however, the results of such folly can still be seen at various places.\r\n\r\nAcid Blobs have 250 hitpoints. They are immune to death and earth damage. Moreover, they are strong against ice damage. On the other hand, they are weak against energy and fire damage. These creatures can neither be summoned nor convinced.\r\n\r\nAcid Blobs yield 250 experience points. They carry globs of acid slime with them.'),
(2, 'cultacolyte', 'Acolytes Of The Cult', ''),
(3, 'cultadept', 'Adepts Of The Cult', 'Adept of the Cult is the highest rank that a normal cultist can dream to acquire. Strong-willed and loyal, they use the secrets of the cult to amplify their magic to a threatening degree. Ruthless and cunning, they pose a threat to every opponent. They see themselves as too valuable to the cult to be lost. For this reason, they are always accompanied by some members of lower ranks who support and protect them. Their esteem of other cultists is not very high though and they sacrifice them at their whim whenever a threat occurs. They hold important knowledge about the cult and they are so fanatic that they would rather die than to get caught alive.\r\n\r\nAdepts Of The Cult have 430 hitpoints. They are strong against earth, holy and ice damage. On the other hand, they are weak against death and energy damage. These creatures can neither be summoned nor convinced. In addition, they are able to sense invisible creatures.\r\n\r\nAdepts Of The Cult yield 400 experience points. They carry cultish robes, gold coins, rope belts and sometimes other items with them.'),
(4, 'adultgoanna', 'Adult Goannas', 'Goannas are large predatory lizards with sharp teeth and claws. They have thick skin with camouflage that ranges from bands and stripes to speckles and circles. The skin colour changes as the creatures mature, with juveniles being blue and adult animals being bright red. Goannas lay eggs in a nest or burrow, but sometimes also inside termite mounds, which offers protection as well as incubation. Additionally, the termites provide a meal for the young as they hatch. Goanna eggs are a sought after meal for the human population of Kilmaresh. But as getting them is a dangerous task, they make a rather expensive menu.\r\n\r\nGoannas are found throughout the steppes of Kilmaresh. They prey on insects, smaller lizards, snakes, birds, mammals and also humans if they have the chance to do so. But they are also eaters of carrion and thus attracted to rotting meat. There\'s a debate whether goannas are venomous or not. It is a fact that goanna bites cause incessant bleeding and many sages assume that this is because of toxin-producing glands in the lizards\' mouth.\r\n\r\nAdult Goannas have 8300 hitpoints. They cannot be paralysed. Moreover, they are strong against earth damage. On the other hand, they are weak against energy damage. These creatures can neither be summoned nor convinced. In addition, they are able to sense invisible creatures.\r\n\r\nAdult Goannas yield 6650 experience points. They carry earth arrows, emerald bangles, envenomed arrows, goanna meats, platinum coins and sometimes other items with them.'),
(5, 'afflictedstrider', 'Afflicted Striders', 'The afflicted striders are purposely infected with a rare parasite that significantly alters their physiology and psyche. It mainly seems to make them more aggressive and physically capable, though it also significantly reduces their life span. Those Below always showed little restraint in using such methods in disregard of their minions but such tactics and with them the deployment of afflicted striders have become more common recently. This might hint at a shift of leadership or strategy.\r\nThe afflicted striders behave even more violently und unforeseeable under the influence of the parasites, yet they seem strangely more prone to acts of violence aimed purposely to be discarded as the effect of raised aggression. The suggestion that the tiny parasites are raising the striders intelligence or are intelligent themselves and acting on purpose seems a bit farfetched though. A more recent theory suggests that the parasites make the striders more susceptible to the influence of creatures such as the feared brainstealer. This would explain their existence in certain battle forces while they are lacking in others. A further, more daring theory even suggests that the small parasites are part of a hive mind and that there is one or more master parasites hidden in the depths of Those Below territory that mastermind their control. This would still leave unexplained why they are spread amongst forces in such unequal manner and the efficiency of said method would be questionable at best. Even the inflicted striders are obviously only beasts that primarily follow their basic impulses and don\'t express any higher strategy of some kind. Still they are a dangerous foe and even disjointed from any army are a threat to any area that they are encountered in.\r\nThough the parasites seem only to infest striders, everyone who loots items from such a creature should clean them thoroughly.\r\n\r\nAfflicted Striders have 10000 hitpoints. They cannot be paralysed. Moreover, they are strong against death, earth and physical damage. On the other hand, they are weak against fire damage. These creatures can neither be summoned nor convinced. In addition, they are able to sense invisible creatures.\r\n\r\nAfflicted Striders yield 5700 experience points. They carry afflicted strider worms, platinum coins and sometimes other items with them.'),
(6, 'amazon', 'Amazons', 'Amazons are communities of martial women who have erected some hideouts in the swamps in the east of Tibia. They attack every intruder of their sphere vigorously and cut off the heads of their victims in order to keep them as some kind of trophies. They are not only quite strong in close combat but are also able to throw knives with deadly precision.\r\n\r\nAmazons have 110 hitpoints. They are weak against death and physical damage. It takes 390 mana to summon or convince these creatures.\r\n\r\nAmazons yield 60 experience points. They carry brown breads, daggers, girlish hair decorations, gold coins, sabres, skulls and sometimes other items with them.'),
(7, 'ancientscarab', 'Ancient Scarabs', 'The Ancient Scarab is ancient indeed - it is said that there are specimens that are aeons old. Rumours say that unless killed, a scarab will not die of old age but continue to grow and grow to enormous proportions. Their usual pace of movement is not impressively fast, but they are capable of doing sudden charges to catch their opponents off guard. Even more dangerous, their poison is strong enough to allow these creatures to emit large clouds of stinking death and mayhem around themselves. Ancient Scarabs are said to be the keepers of mysterious secrets swallowed by the sands long time ago. So don\'t be surprised if some of them might display even more cunning tactics and devastating magic.\r\n\r\nAncient Scarabs have 1000 hitpoints. They are immune to earth damage and cannot be paralysed. Moreover, they are strong against energy and physical damage. On the other hand, they are weak against fire and ice damage. These creatures can neither be summoned nor convinced. In addition, they are able to sense invisible creatures.\r\n\r\nAncient Scarabs yield 720 experience points. They carry gold coins, magic light wands and sometimes other items with them.'),
(8, 'animatedfeather', 'Animated Feathers', 'Animated feathers are usually created as simple golems that serve as copyists and automated scribes. Unspectacular and not sentient on their own, they are mere tools for powerful magicians. There are rumours, though, of ancient feathers that copied so many arcane texts, that some of the knowledge gradually accumulated in them. Slowly but steadily they grow in power and sentience. Eventually they acquired some sort of self awareness. Becoming less of a tool and more of a being, they grew less useful for their original purpose. At some point they are pulled from their copy duties and act more like librarians. Their main function becomes to contain dangerous knowledge with the use of their acquired skills in glyphs and wards. Still they are obsessed with their original purpose and copy random books in their spare time, accumulating more and more knowledge in the process. They are highly skilled in the use of arcane sigils but in the time of need and urgency they rather employ spontaneous bursts of the magic they acquired. Even when protecting themselves or their libraries, they still act more like emotionless constructs reacting on a more practical base. Their fighting style might also best be described as \'efficient\'. It takes an extremely long time for an animated feather to display some kind of personality. Most perish to the teeth of time and accidents. The few that endure can become quite intelligent, even quirky. Rumour has it, that a few feathers authored books on their own, not even just compiled knowledge they acquired but genuinely new and creative works with astounding insights. At least one extremely old animated feather chose to author books of comedic limericks while another specialized on acclaimed love poems.\r\n\r\nAnimated Feathers have 13000 hitpoints. They are immune to ice damage and cannot be paralysed. On the other hand, they are weak against fire damage. These creatures can neither be summoned nor convinced. In addition, they are able to sense invisible creatures.\r\n\r\nAnimated Feathers yield 9860 experience points. They carry energy rings, glowing runes, ice cubes, platinum coins, quills, small sapphires, ultimate mana potions and sometimes other items with them.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_groups`
--

CREATE TABLE `canary_groups` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Estrutura da tabela `canary_news`
--

CREATE TABLE `canary_news` (
  `id` int(11) NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 NOT NULL,
  `body` text CHARACTER SET utf8 NOT NULL,
  `type` tinyint(4) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `category` tinyint(4) NOT NULL,
  `player_id` int(11) NOT NULL,
  `last_modified_by` int(11) NOT NULL,
  `last_modified_date` datetime NOT NULL,
  `comments` varchar(50) CHARACTER SET utf8 NOT NULL,
  `article_text` varchar(300) CHARACTER SET utf8 NOT NULL,
  `article_image` varchar(100) CHARACTER SET utf8 NOT NULL,
  `hidden` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `canary_news`
--

INSERT INTO `canary_news` (`id`, `title`, `body`, `type`, `date`, `category`, `player_id`, `last_modified_by`, `last_modified_date`, `comments`, `article_text`, `article_image`, `hidden`) VALUES
(1, 'Summer Update 2022\r\n\r\n', '<p><img src=\"https://static.tibia.com/images/global/letters/letter_martel_A.gif\" border=\"0\" align=\"bottom\">fter seven update teasers <img src=\"https://static.tibia.com/images/news/updatetreesummer135x135.png\" border=\"0\" hspace=\"10\" vspace=\"0\" width=\"135\" height=\"135\" align=\"right\">and an intensive testing phase, the summer update of 2022 has finally been released. Let us go over what is new in Tibia: <br><br>If you feel comfortable hunting in Asura Palace, for example, you should now try to gain access to Marapur, a new island south of Roshamuul, and <a href=\"https://www.tibia.com/news/?subtopic=newsarchive&amp;id=6746\" target=\"_blank\" rel=\"noopener noreferrer\"> meet the Nagas</a>! Test your talent in quests, fights against mini bosses, and a bigger bossfight. With Marapur, the 20th area Tibians have been searching for was finally discovered.<br><br>Nagas have a strong sense for aesthetics that does not only show in decorated buildings, but also extends to their craftsmanship and their battle gear. Thanks to them, new equipment with an elaborate and elegant look is now available. If you like to <a href=\"https://www.tibia.com/news/?subtopic=newsarchive&amp;id=6736\" target=\"_blank\" rel=\"noopener noreferrer\">dress to impress</a>, you will most certainly also enjoy the new and extraordinary gear that can be obtained deep down below the surface in Gnomprona. Make sure to strive for the three new best-in-slot equipment pieces that are now available for each vocation.<br>Let yourself be recruited by the Gnomcruiter in Noodles Academy of Modern Magic after you have spent some time in Marapur, for a chance to show your bravery by fighting against new <a href=\"https://www.tibia.com/news/?subtopic=newsarchive&amp;id=6735\" target=\"_blank\" rel=\"noopener noreferrer\">primordial creatures</a>. These creatures become more and more dangerous and resonate in difficulty with your qualification. Raise your hazard qualification by killing the primal menace, a miniboss with a cooldown of 20 hours. This perilious new system will spice up your hunts in Gnomprona. If you have shown enough bravery, Gnomadness will reward you with your very own ripptor mount, and one out of the mentioned new best-in-slot equipment pieces. Wear the new <a href=\"https://www.tibia.com/news/?subtopic=newsarchive&amp;id=6734\" target=\"_blank\" rel=\"noopener noreferrer\">flaming hot outfit</a> that you can obtain there with pride.</p>\r\n<center><img src=\"https://static.tibia.com/images/news/2022_updatenews_web1307.jpg\" hspace=\"10\" vspace=\"10\" width=\"500\" height=\"370\"></center>\r\n<p>You are a boss hunter at heart and have always wanted a feature that helps you keep track of your heroic deeds, and adds more meaning to what you are doing? Take a look at the new Bosstiary that you can find in the Tibia Cyclopedia. The rewards for the three different progress levels might even encourage one or the other Tibian who has not been a boss hunter yet, to <a href=\"https://www.tibia.com/news/?subtopic=newsarchive&amp;id=6733\" target=\"_blank\" rel=\"noopener noreferrer\">boss up</a>. The new \"daily boosted bosses\" will help you fill the Bosstiary.<br><br>Speaking about bosses. There is now a Boss Cooldowns widget that will let you <a href=\"https://www.tibia.com/news/?subtopic=newsarchive&amp;id=6732\" target=\"_blank\" rel=\"noopener noreferrer\">track your archfoes\' cooldowns</a>. In addition to this, several further <a href=\"https://www.tibia.com/news/?subtopic=newsarchive&amp;id=6711\" target=\"_blank\" rel=\"noopener noreferrer\">convenience features</a> were added with this year\'s summer update. The new options to adjust the look of the arcs that display your hitpoints and mana enable you to customise your Tibian experience more to your liking. Surely, the new NPC filter option in the Search Locker widget, or the search field in NPC trade windows, as well as the option to buy and sell larger amounts of stackable items at once will also come in handy. The new indicator that informs you about time or charges left on items will make your Tibian life easier, too. You can also customise this display via the Options menu.<br><br>We hope you enjoy the new content and features!<br>Your Community Managers</p>', 1, '2022-08-05 03:00:00', 1, 2, 0, '0000-00-00 00:00:00', '', '', '', 0),
(2, 'CanaryAAC', 'CanaryAAC', 2, '2022-08-03 10:23:34', 1, 3, 0, '0000-00-00 00:00:00', '', '', '', 0),
(3, 'CanaryAAC by Lucas Giovanni', 'Favor reportar qualquer erro.', 3, '2022-09-04 16:23:48', 2, 27, 0, '0000-00-00 00:00:00', '', '', '', 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_products`
--

CREATE TABLE `canary_products` (
  `id` int(11) NOT NULL,
  `coins` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `name` varchar(80) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `canary_towns`
--

INSERT INTO `canary_towns` (`id`, `town_id`, `name`) VALUES
(1, 0, 'No Town'),
(2, 1, 'Tutorial City'),
(3, 5, 'AbDendriel'),
(4, 6, 'Carlin'),
(5, 8, 'Thais'),
(6, 9, 'Venore'),
(7, 10, 'Ankrahmun'),
(8, 11, 'Edron'),
(9, 12, 'Farmine'),
(10, 13, 'Darashia'),
(11, 14, 'Liberty Bay'),
(12, 15, 'Port Hope'),
(13, 16, 'Svargrond'),
(14, 17, 'Yalahar'),
(15, 20, 'Rathleton');

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_website`
--

CREATE TABLE `canary_website` (
  `id` int(11) NOT NULL,
  `timezone` varchar(150) NOT NULL,
  `title` varchar(70) CHARACTER SET utf8 NOT NULL,
  `downloads` varchar(250) NOT NULL,
  `player_voc` int(11) NOT NULL COMMENT '0 off and 1 on',
  `player_max` int(11) NOT NULL COMMENT 'players por conta',
  `player_guild` int(11) NOT NULL COMMENT 'level',
  `donates` int(11) NOT NULL COMMENT '0 off and 1 on',
  `coin_price` decimal(10,2) NOT NULL,
  `mercadopago` int(11) NOT NULL,
  `pagseguro` int(11) NOT NULL,
  `paypal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `canary_website`
--

INSERT INTO `canary_website` (`id`, `timezone`, `title`, `downloads`, `player_voc`, `player_max`, `player_guild`, `donates`, `coin_price`, `mercadopago`, `pagseguro`, `paypal`) VALUES
(1, 'America/Sao_Paulo', 'CanaryAAC v1', 'http://www.google.com', 1, 10, 100, 1, '0.10', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `canary_worldquests`
--

CREATE TABLE `canary_worldquests` (
  `id` int(11) NOT NULL,
  `storage` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `canary_worldquests`
--

INSERT INTO `canary_worldquests` (`id`, `storage`, `name`, `description`) VALUES
(1, 35000, 'Last Creep Standing', ''),
(2, 35001, 'A Pirate\'s Death to Me', '');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `canary_worlds`
--

INSERT INTO `canary_worlds` (`id`, `name`, `creation`, `location`, `pvp_type`, `premium_type`, `transfer_type`, `battle_eye`, `world_type`, `ip`, `port`) VALUES
(1, 'CanaryAAC', '2022-09-09 23:16:36', 7, 1, 0, 0, 0, 1, '127.0.0.1', 7172);

-- --------------------------------------------------------

--
-- Estrutura da tabela `coins_transactions`
--

CREATE TABLE `coins_transactions` (
  `id` int(11) UNSIGNED NOT NULL,
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
  `id` int(11) NOT NULL,
  `daystreak` smallint(2) NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `global_storage`
--

CREATE TABLE `global_storage` (
  `key` varchar(32) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `guilds`
--

CREATE TABLE `guilds` (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` timestamp(1) NOT NULL DEFAULT current_timestamp(1),
  `motd` varchar(255) NOT NULL DEFAULT '',
  `residence` int(11) NOT NULL DEFAULT 0,
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `points` int(11) NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `logo_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Estrutura da tabela `guild_applications`
--

CREATE TABLE `guild_applications` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `account_id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL DEFAULT 0,
  `text` text CHARACTER SET utf8 NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `date` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `date` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `price1` int(11) NOT NULL,
  `price2` int(11) NOT NULL,
  `frags` int(11) NOT NULL,
  `comment` text NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `started` bigint(15) NOT NULL DEFAULT 0,
  `ended` bigint(15) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `houses`
--

CREATE TABLE `houses` (
  `id` int(11) NOT NULL,
  `house_id` int(11) NOT NULL,
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
-- Estrutura da tabela `ip_bans`
--

CREATE TABLE `ip_bans` (
  `ip` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `market_history`
--

CREATE TABLE `market_history` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `expires_at` bigint(20) UNSIGNED NOT NULL,
  `inserted` bigint(20) UNSIGNED NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `market_offers`
--

CREATE TABLE `market_offers` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `created` bigint(20) UNSIGNED NOT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT 0,
  `price` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT 1,
  `account_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `main` int(11) NOT NULL DEFAULT 0,
  `comment` text NOT NULL,
  `level` int(11) NOT NULL DEFAULT 1,
  `vocation` int(11) NOT NULL DEFAULT 0,
  `health` int(11) NOT NULL DEFAULT 150,
  `healthmax` int(11) NOT NULL DEFAULT 150,
  `experience` bigint(20) NOT NULL DEFAULT 0,
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
  `town_id` int(11) NOT NULL DEFAULT 1,
  `world` int(11) NOT NULL DEFAULT 0,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0,
  `conditions` blob NOT NULL,
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
  `onlinetime` int(11) NOT NULL DEFAULT 0,
  `deletion` bigint(15) NOT NULL DEFAULT 0,
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
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
  `xpboost_stamina` smallint(5) DEFAULT NULL,
  `xpboost_value` tinyint(4) DEFAULT NULL,
  `marriage_status` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `marriage_spouse` int(11) NOT NULL DEFAULT -1,
  `bonus_rerolls` bigint(21) NOT NULL DEFAULT 0,
  `prey_wildcard` bigint(21) NOT NULL DEFAULT 0,
  `task_points` bigint(21) NOT NULL DEFAULT 0,
  `quickloot_fallback` tinyint(1) DEFAULT 0,
  `lookmountbody` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lookmountfeet` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lookmounthead` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lookmountlegs` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lookfamiliarstype` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `isreward` tinyint(1) NOT NULL DEFAULT 1,
  `istutorial` tinyint(1) NOT NULL DEFAULT 0,
  `hidden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `players`
--

INSERT INTO `players` (`id`, `name`, `group_id`, `account_id`, `main`, `comment`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `world`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `lastlogout`, `blessings`, `blessings1`, `blessings2`, `blessings3`, `blessings4`, `blessings5`, `blessings6`, `blessings7`, `blessings8`, `onlinetime`, `deletion`, `balance`, `offlinetraining_time`, `offlinetraining_skill`, `stamina`, `skill_fist`, `skill_fist_tries`, `skill_club`, `skill_club_tries`, `skill_sword`, `skill_sword_tries`, `skill_axe`, `skill_axe_tries`, `skill_dist`, `skill_dist_tries`, `skill_shielding`, `skill_shielding_tries`, `skill_fishing`, `skill_fishing_tries`, `skill_critical_hit_chance`, `skill_critical_hit_chance_tries`, `skill_critical_hit_damage`, `skill_critical_hit_damage_tries`, `skill_life_leech_chance`, `skill_life_leech_chance_tries`, `skill_life_leech_amount`, `skill_life_leech_amount_tries`, `skill_mana_leech_chance`, `skill_mana_leech_chance_tries`, `skill_mana_leech_amount`, `skill_mana_leech_amount_tries`, `skill_criticalhit_chance`, `skill_criticalhit_damage`, `skill_lifeleech_chance`, `skill_lifeleech_amount`, `skill_manaleech_chance`, `skill_manaleech_amount`, `manashield`, `max_manashield`, `xpboost_stamina`, `xpboost_value`, `marriage_status`, `marriage_spouse`, `bonus_rerolls`, `prey_wildcard`, `task_points`, `quickloot_fallback`, `lookmountbody`, `lookmountfeet`, `lookmounthead`, `lookmountlegs`, `lookfamiliarstype`, `isreward`, `istutorial`, `hidden`) VALUES
(1, 'CanaryAAC', 6, 1, 1, '', 8, 3, 185, 185, 4200, 113, 115, 95, 39, 130, 3, 0, 90, 90, 0, 0, 2, 1, 4978, 5312, 5, '', 470, 1, 1661995126, 16777343, 1, 0, 0, 1661995776, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1365, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0);

--
-- Acionadores `players`
--
DELIMITER $$
CREATE TRIGGER `ondelete_players` BEFORE DELETE ON `players` FOR EACH ROW BEGIN
		UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `players_online`
--

CREATE TABLE `players_online` (
  `player_id` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `player_badges`
--

CREATE TABLE `player_badges` (
  `id` int(11) NOT NULL,
  `badge_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
('db_version', '20', '2022-05-03 02:47:18'),
('motd_hash', '125ab277e842c29437dd25428f4ec3d6ddd2b21f', '2022-09-01 00:49:59'),
('motd_num', '1', '2022-09-01 00:49:59'),
('players_record', '1', '2022-09-01 00:33:01');

-- --------------------------------------------------------

--
-- Estrutura da tabela `store_history`
--

CREATE TABLE `store_history` (
  `id` int(11) NOT NULL,
  `account_id` int(11) UNSIGNED NOT NULL,
  `mode` smallint(2) NOT NULL DEFAULT 0,
  `description` varchar(3500) NOT NULL,
  `coin_amount` int(12) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `coins` int(11) NOT NULL DEFAULT 0
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
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `banned_by` (`banned_by`);

--
-- Índices para tabela `account_registration`
--
ALTER TABLE `account_registration`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD UNIQUE KEY `account_viplist_unique` (`account_id`,`player_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `boosted_boss`
--
ALTER TABLE `boosted_boss`
  ADD PRIMARY KEY (`id`);

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
-- Índices para tabela `coins_transactions`
--
ALTER TABLE `coins_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Índices para tabela `daily_reward_history`
--
ALTER TABLE `daily_reward_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`);

--
-- Índices para tabela `global_storage`
--
ALTER TABLE `global_storage`
  ADD UNIQUE KEY `global_storage_unique` (`key`);

--
-- Índices para tabela `guilds`
--
ALTER TABLE `guilds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `guilds_name_unique` (`name`),
  ADD UNIQUE KEY `guilds_owner_unique` (`ownerid`);

--
-- Índices para tabela `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `guildwar_kills_unique` (`warid`),
  ADD KEY `warid` (`warid`);

--
-- Índices para tabela `guild_applications`
--
ALTER TABLE `guild_applications`
  ADD PRIMARY KEY (`player_id`);

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
-- Índices para tabela `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `players_unique` (`name`),
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
  ADD UNIQUE KEY `player_depotitems_unique` (`player_id`,`sid`);

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
  ADD UNIQUE KEY `player_inboxitems_unique` (`player_id`,`sid`);

--
-- Índices para tabela `player_items`
--
ALTER TABLE `player_items`
  ADD KEY `player_id` (`player_id`),
  ADD KEY `sid` (`sid`);

--
-- Índices para tabela `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD UNIQUE KEY `player_namelocks_unique` (`player_id`),
  ADD KEY `namelocked_by` (`namelocked_by`);

--
-- Índices para tabela `player_rewards`
--
ALTER TABLE `player_rewards`
  ADD UNIQUE KEY `player_rewards_unique` (`player_id`,`sid`);

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
-- Índices para tabela `server_config`
--
ALTER TABLE `server_config`
  ADD PRIMARY KEY (`config`);

--
-- Índices para tabela `store_history`
--
ALTER TABLE `store_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Índices para tabela `tile_store`
--
ALTER TABLE `tile_store`
  ADD KEY `house_id` (`house_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `account_authentication`
--
ALTER TABLE `account_authentication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `account_ban_history`
--
ALTER TABLE `account_ban_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `account_registration`
--
ALTER TABLE `account_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `boosted_boss`
--
ALTER TABLE `boosted_boss`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `canary_achievements`
--
ALTER TABLE `canary_achievements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `canary_badges`
--
ALTER TABLE `canary_badges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `canary_boss`
--
ALTER TABLE `canary_boss`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `canary_compendium`
--
ALTER TABLE `canary_compendium`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de tabela `canary_creatures`
--
ALTER TABLE `canary_creatures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `canary_groups`
--
ALTER TABLE `canary_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `canary_news`
--
ALTER TABLE `canary_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `canary_payments`
--
ALTER TABLE `canary_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
  
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `canary_website`
--
ALTER TABLE `canary_website`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `canary_worldquests`
--
ALTER TABLE `canary_worldquests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `canary_worlds`
--
ALTER TABLE `canary_worlds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `coins_transactions`
--
ALTER TABLE `coins_transactions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `daily_reward_history`
--
ALTER TABLE `daily_reward_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guilds`
--
ALTER TABLE `guilds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `guild_events`
--
ALTER TABLE `guild_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de tabela `guild_wars`
--
ALTER TABLE `guild_wars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1045;

--
-- AUTO_INCREMENT de tabela `market_history`
--
ALTER TABLE `market_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `market_offers`
--
ALTER TABLE `market_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `player_badges`
--
ALTER TABLE `player_badges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `player_hirelings`
--
ALTER TABLE `player_hirelings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `store_history`
--
ALTER TABLE `store_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `account_bans`
--
ALTER TABLE `account_bans`
  ADD CONSTRAINT `account_bans_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_bans_player_fk` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD CONSTRAINT `account_bans_history_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_bans_history_player_fk` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD CONSTRAINT `account_viplist_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_viplist_player_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `coins_transactions`
--
ALTER TABLE `coins_transactions`
  ADD CONSTRAINT `coins_transactions_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `daily_reward_history`
--
ALTER TABLE `daily_reward_history`
  ADD CONSTRAINT `daily_reward_history_player_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guilds`
--
ALTER TABLE `guilds`
  ADD CONSTRAINT `guilds_ownerid_fk` FOREIGN KEY (`ownerid`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD CONSTRAINT `guildwar_kills_warid_fk` FOREIGN KEY (`warid`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD CONSTRAINT `guild_invites_guild_fk` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_player_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD CONSTRAINT `guild_membership_guild_fk` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_player_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_rank_fk` FOREIGN KEY (`rank_id`) REFERENCES `guild_ranks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD CONSTRAINT `guild_ranks_fk` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `house_lists`
--
ALTER TABLE `house_lists`
  ADD CONSTRAINT `houses_list_house_fk` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD CONSTRAINT `ip_bans_players_fk` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `market_history`
--
ALTER TABLE `market_history`
  ADD CONSTRAINT `market_history_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `market_offers`
--
ALTER TABLE `market_offers`
  ADD CONSTRAINT `market_offers_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD CONSTRAINT `player_deaths_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD CONSTRAINT `player_depotitems_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_hirelings`
--
ALTER TABLE `player_hirelings`
  ADD CONSTRAINT `player_hirelings_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD CONSTRAINT `player_inboxitems_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_items`
--
ALTER TABLE `player_items`
  ADD CONSTRAINT `player_items_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD CONSTRAINT `player_namelocks_players2_fk` FOREIGN KEY (`namelocked_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `player_namelocks_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `player_rewards`
--
ALTER TABLE `player_rewards`
  ADD CONSTRAINT `player_rewards_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_spells`
--
ALTER TABLE `player_spells`
  ADD CONSTRAINT `player_spells_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `player_storage`
--
ALTER TABLE `player_storage`
  ADD CONSTRAINT `player_storage_players_fk` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `store_history`
--
ALTER TABLE `store_history`
  ADD CONSTRAINT `store_history_account_fk` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tile_store`
--
ALTER TABLE `tile_store`
  ADD CONSTRAINT `tile_store_account_fk` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
