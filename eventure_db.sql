-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 07, 2016 at 11:41 PM
-- Server version: 5.7.16-0ubuntu0.16.04.1
-- PHP Version: 7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eventure_db`
--
CREATE DATABASE IF NOT EXISTS `eventure_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `eventure_db`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(8, 'Art'),
(9, 'Business'),
(15, 'Casual'),
(20, 'Charity & Causes'),
(6, 'Community'),
(16, 'Convention'),
(5, 'Education'),
(19, 'Expo'),
(22, 'Family'),
(12, 'Fashion'),
(11, 'Film & Media'),
(4, 'Fitness'),
(17, 'Food & Drink'),
(2, 'Gaming'),
(21, 'Health'),
(14, 'Hobbies'),
(23, 'Home & Lifestyle'),
(27, 'Networking'),
(1, 'Outdoors'),
(25, 'Seminar'),
(13, 'Spirituality'),
(3, 'Sports'),
(7, 'Technology'),
(18, 'Travel');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `html_comment` mediumtext NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `likes` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(99) NOT NULL,
  `html_description` mediumtext NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `picture_url` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `private` tinyint(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `saved` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `latitude` decimal(20,10) DEFAULT NULL,
  `longitude` decimal(20,10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `html_description`, `user_id`, `picture_url`, `address`, `private`, `password`, `start_date`, `end_date`, `saved`, `created_at`, `updated_at`, `latitude`, `longitude`) VALUES
(28, 'secret santa', '<p style="text-align: center;"><span class="fsl">Hosting Christmas this year, save the date everyone! <br /> <br />Sam will&nbsp;post a elfster&nbsp;link closer to the date.</span></p>\n<p style="text-align: center;">&nbsp;</p>\n<p style="text-align: left;"><span class="fsl">Make sure to type out what your bringing for the potluck as well in the comments bellow!</span></p>\n<p style="text-align: left;"><span class="fsl">We still need to figure out a theme for everyone as well!</span></p>\n<p style="text-align: left;"><span class="fsl">Min: $50<br />Max: $100</span></p>\n<p style="text-align: left;"><span class="fsl">Dont wait until last minute!</span></p>', 55, 'http://67.205.153.9:9000/uploads/events/be4ca9ea-fc28-446c-b283-5215a68b21cf.jpg', '275 Elgin Dr, Brampton, ON L6Y 2V2, Canada', 0, NULL, '2016-12-17 22:00:00', '2016-12-17 05:00:00', 0, '2016-12-02 01:09:08', '2016-12-02 16:25:30', '43.6599425000', '-79.7578358000'),
(29, 'SDNE Grad Party - Blue Mountain Ontario', '<p>Calling all hardworking&nbsp;<strong>SDNE </strong>graduates&nbsp;to come and enjoy a day filled with <strong>FUN&nbsp;</strong>and&nbsp;<strong>ADVENTURE </strong>at Blue Mountain Ontario.&nbsp;</p>\n<p><strong>The Blue Mountains</strong> is a town in <a title="Grey County" href="https://en.wikipedia.org/wiki/Grey_County">Grey County</a>, <a title="Southwestern Ontario" href="https://en.wikipedia.org/wiki/Southwestern_Ontario">southwestern</a> <a title="Ontario" href="https://en.wikipedia.org/wiki/Ontario">Ontario</a>, <a title="Canada" href="https://en.wikipedia.org/wiki/Canada">Canada</a>, located where the <a title="Beaver River (Grey County)" href="https://en.wikipedia.org/wiki/Beaver_River_(Grey_County)">Beaver River</a> flows into <a title="Nottawasaga Bay" href="https://en.wikipedia.org/wiki/Nottawasaga_Bay">Nottawasaga Bay</a>.&nbsp;</p>\n<p>With tons of activities like skiing, cycling, snowboarding, roller coasters, scavenger hunts, zip lining and much more, your bound &nbsp;to have fun!</p>\n<p>Apart from the endless activities, there are beautiful breath taking sites for you to admire.</p>\n<p>So come and enjoy, because you deserve it! :)</p>\n<p>&nbsp;&nbsp;</p>', 56, 'http://67.205.153.9:9000/uploads/events/df99453e-a23d-4eb1-a408-882816a519e4.jpg', 'The Blue Mountains, ON, Canada', 1, '$2a$10$G0xLhp/U0riXD6hMsFa0v.d2060M0kiJT9VYKeiJ89IJiIv80ujEK', '2016-12-20 14:00:00', '2016-12-21 06:00:00', 0, '2016-12-02 02:02:23', '2016-12-06 21:06:22', '44.5404905000', '-80.4080947000'),
(32, 'Capstone!!!!!', '<p>The future is displayed!!</p>', 65, 'http://67.205.153.9:9000/uploads/events/b3c56241-5260-40c5-ab96-ae36d18650a9.jpg', '7899 McLaughlin Rd, Brampton, ON L6Y 5H9, Canada', 0, NULL, '2016-12-02 16:20:53', '2016-12-02 19:00:53', 0, '2016-12-02 16:08:49', '2016-12-02 16:59:43', '43.6566155000', '-79.7387036000'),
(33, 'the best day ever', '<p>Get those pesky capstone presentations out of the way!</p>', 62, 'http://67.205.153.9:9000/uploads/events/22fadab8-38db-4a73-9744-01d9bcf506a1.jpg', '7899 McLaughlin Rd, Brampton, ON L6Y 5H9, Canada', 0, NULL, '2016-12-02 16:20:17', '2016-12-02 17:00:17', 0, '2016-12-02 16:13:29', '2016-12-02 16:25:34', '43.6566155000', '-79.7387036000'),
(34, 'Shishalicious gathering', '<ul>\n<li>Smoke some shisha</li>\n<li>Have some drinks</li>\n<li>Socialize</li>\n<li>They serve food too</li>\n<li>Let\'s take advantage of smoking shisha before it becomes illegal</li>\n</ul>\n<p>&nbsp;</p>', 66, 'http://67.205.153.9:9000/uploads/events/041a2ee1-56c4-443c-8b2b-8d1cd037e977.jpg', '5130 Dixie Rd, Mississauga, ON L4W, Canada', 0, NULL, '2016-12-03 00:00:00', '2016-12-03 04:00:00', 0, '2016-12-02 16:15:05', '2016-12-02 19:30:49', '43.6367572000', '-79.6240942000'),
(37, 'Hooka Party - Lets blow some O\'s', '<p>Decadent hangout with Middle Eastern fusion cuisine, live bands &amp; DJs, shisha &amp; classic board games.<br />Great place, great shisha, great vibe, great ambiance, and great food!<br />HALAL FOOD options vailable!</p>', 56, 'http://67.205.153.9:9000/uploads/events/dfa42959-6cb1-4bf7-ae80-2f7ba9781669.jpg', '4230 Sherwoodtowne Blvd, Mississauga, ON L4Z 2G6, Canada', 0, NULL, '2016-12-02 23:00:40', '2016-12-03 02:00:40', 0, '2016-12-02 16:27:12', '2016-12-03 16:30:47', '43.5998268000', '-79.6402613000'),
(38, 'APPetite!', '<p>Hungry!?? Don\'t know where to eat?? LOOK NO MORE! Just go to myappetite.ca and with a few clicks of your mouse, you will have restaurants to choose from!</p>', 65, 'http://67.205.153.9:9000/uploads/events/c0f65d0f-7c92-467f-b839-1bf42e82d746.jpg', 'This is an online event', 0, NULL, '2016-12-02 17:15:03', '2016-12-02 17:20:03', 0, '2016-12-02 16:29:24', '2016-12-02 16:39:10', '43.6566155000', '-79.7387036000'),
(39, 'Corners', '<p>We are planning a Japan trip!</p>\n<p>Hope you guys do well on your capstone finals!</p>', 72, 'http://67.205.153.9:9000/uploads/default.jpg', '14B Mississauga, ON L4Y 2C5, 1225 Dundas St E, Mississauga, ON L4Y 2C5, Canada', 1, '$2a$10$GllSu.Pv7zMvsmdAH/hK/uyoc5IXKrCyY/NliKPuCzoP9yhiXWT9q', '2016-12-04 20:42:49', '2016-12-04 23:52:49', 0, '2016-12-04 19:57:03', '2016-12-04 19:57:03', '43.6064687000', '-79.5883466000'),
(40, 'Secret Santa SDNE - the right way', '<h1 style="text-align: center;"><span style="text-decoration: underline;"><strong>Secret Santa Sheridan College - Software Development &amp; Network Engineering</strong></span></h1>\n<p style="padding-left: 30px;"><strong>Happening on the last day together as students, to celebrate the holiday spirit lets &nbsp;get each other some awesome gifts.</strong></p>\n<p><strong>....but not to awesome because I dont got moneys. Anyways heres the details,</strong></p>\n<h3><strong>Rules are as follows:</strong></h3>\n<ul style="list-style-type: square;">\n<li><strong>Gifts must be $20.00 or under. (please dont make me look bad)</strong></li>\n<li><strong>Keep it appropriate</strong></li>\n<li><strong>Let\'s say the gift has to be atleast $10. Nobody likes a scrouge<br /><br /></strong><strong>If you\'re joining please join the event, or post a comment down below.</strong></li>\n</ul>\n<p style="text-align: center;"><strong>Thanks!</strong></p>\n<p style="text-align: center;"><strong><img src="https://image.spreadshirtmedia.com/image-server/v1/designs/12143016,width=178,height=178/santa-smiley-face-for-christmas.png" alt="Santa Smiley" width="164" height="164" /></strong></p>', 54, 'http://67.205.153.9:9000/uploads/events/d9994686-9bac-4c85-8015-600942b93f5e.jpg', '7899 McLaughlin Rd, Brampton, ON L6Y 5H9, Canada', 1, '$2a$10$ZSrvfIjFfJ5hPa5pMbzqP.7zAwMrSn2bIKFRu0h.D/zDqw/HvKNI6', '2016-12-16 20:00:00', '2016-12-17 02:00:54', 0, '2016-12-07 03:38:37', '2016-12-07 03:38:37', '43.6566155000', '-79.7387036000');

-- --------------------------------------------------------

--
-- Table structure for table `events_categories`
--

DROP TABLE IF EXISTS `events_categories`;
CREATE TABLE `events_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `events_categories`
--

INSERT INTO `events_categories` (`id`, `event_id`, `category_id`) VALUES
(61, 28, 22),
(62, 28, 15),
(63, 29, 17),
(64, 29, 1),
(65, 29, 15),
(72, 32, 7),
(73, 32, 5),
(74, 33, 13),
(77, 34, 13),
(78, 34, 17),
(84, 37, 17),
(89, 39, 15),
(90, 39, 22),
(91, 39, 17),
(92, 40, 15),
(93, 40, 22);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int(10) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `sender_id` int(10) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `receiver_id`, `sender_id`, `event_id`, `type`, `message`, `is_read`, `created_at`, `updated_at`) VALUES
(25, 55, 57, 28, 'event_joined', '<a href=\'/organizerProfile/57\'>Mir</a> has joined your event <a href=\'/eventDetails/28\'>secret santa</a>', 1, '2016-12-02 01:24:38', '2016-12-02 01:26:01'),
(26, 55, 58, 28, 'event_joined', '<a href=\'/organizerProfile/58\'>Shotwell</a> has joined your event <a href=\'/eventDetails/28\'>secret santa</a>', 1, '2016-12-02 01:24:52', '2016-12-02 01:26:03'),
(27, 55, 57, 28, 'event_liked', '<a href=\'/organizerProfile/57\'>Mir</a> has liked your event, <a href=\'/eventDetails/28\'>secret santa</a>', 1, '2016-12-02 01:25:23', '2016-12-02 01:26:03'),
(28, 57, 55, 28, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/28\'>secret santa</a> for changes', 1, '2016-12-02 01:27:38', '2016-12-02 01:28:25'),
(29, 58, 55, 28, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/28\'>secret santa</a> for changes', 1, '2016-12-02 01:27:38', '2016-12-02 01:28:00'),
(30, 56, 55, 29, 'event_joined', '<a href=\'/organizerProfile/55\'>Ivanyahoo</a> has joined your event <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a>', 1, '2016-12-02 02:03:25', '2016-12-02 02:07:25'),
(31, 55, 56, 28, 'event_liked', '<a href=\'/organizerProfile/56\'>Rukhsar</a> has liked your event, <a href=\'/eventDetails/28\'>secret santa</a>', 1, '2016-12-02 02:04:00', '2016-12-02 02:35:42'),
(32, 56, 55, 29, 'event_liked', '<a href=\'/organizerProfile/55\'>Ivanyahoo</a> has liked your event, <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a>', 1, '2016-12-02 02:05:05', '2016-12-02 04:55:29'),
(33, 55, 56, 29, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a> for changes', 1, '2016-12-02 02:08:00', '2016-12-02 02:35:42'),
(34, 56, 57, 29, 'event_liked', '<a href=\'/organizerProfile/57\'>Mir</a> has liked your event, <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a>', 1, '2016-12-02 02:08:05', '2016-12-02 02:08:47'),
(35, 56, 57, 29, 'event_joined', '<a href=\'/organizerProfile/57\'>Mir</a> has joined your event <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a>', 1, '2016-12-02 02:08:13', '2016-12-02 02:22:19'),
(36, 56, 58, 29, 'event_joined', '<a href=\'/organizerProfile/58\'>Shotwell</a> has joined your event <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a>', 1, '2016-12-02 02:15:01', '2016-12-02 02:15:20'),
(37, 56, 58, 29, 'event_liked', '<a href=\'/organizerProfile/58\'>Shotwell</a> has liked your event, <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a>', 1, '2016-12-02 02:15:04', '2016-12-02 02:15:22'),
(38, 56, 41, 29, 'event_liked', '<a href=\'/organizerProfile/41\'>jlive</a> has liked your event, <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a>', 0, '2016-12-02 02:30:22', '2016-12-05 22:31:06'),
(39, 56, 41, 29, 'event_joined', '<a href=\'/organizerProfile/41\'>jlive</a> has joined your event <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a>', 1, '2016-12-02 02:30:36', '2016-12-02 02:36:38'),
(40, 55, 56, 29, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a> for changes', 1, '2016-12-02 02:38:00', '2016-12-02 02:38:26'),
(41, 58, 56, 29, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a> for changes', 0, '2016-12-02 02:38:00', '2016-12-02 02:38:00'),
(42, 57, 56, 29, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a> for changes', 0, '2016-12-02 02:38:00', '2016-12-02 02:38:00'),
(43, 41, 56, 29, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a> for changes', 1, '2016-12-02 02:38:00', '2016-12-02 02:38:57'),
(44, 58, 56, 29, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a> for changes', 0, '2016-12-02 02:41:39', '2016-12-02 02:41:39'),
(45, 57, 56, 29, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a> for changes', 0, '2016-12-02 02:41:39', '2016-12-02 02:41:39'),
(46, 58, 56, 29, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a> for changes', 0, '2016-12-02 02:41:59', '2016-12-02 02:41:59'),
(47, 57, 56, 29, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a> for changes', 0, '2016-12-02 02:42:00', '2016-12-02 02:42:00'),
(48, 58, 56, 29, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a> for changes', 0, '2016-12-02 02:43:19', '2016-12-02 02:43:19'),
(49, 57, 56, 29, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a> for changes', 0, '2016-12-02 02:43:19', '2016-12-02 02:43:19'),
(50, 41, 56, 29, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a> for changes', 1, '2016-12-02 02:43:19', '2016-12-02 02:45:25'),
(51, 55, 56, 29, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a> for changes', 1, '2016-12-02 02:43:19', '2016-12-02 02:43:32'),
(52, 58, 56, 29, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a> for changes', 0, '2016-12-02 02:45:40', '2016-12-02 02:45:40'),
(53, 57, 56, 29, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a> for changes', 0, '2016-12-02 02:45:40', '2016-12-02 02:45:40'),
(54, 41, 56, 29, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a> for changes', 1, '2016-12-02 02:45:40', '2016-12-02 02:45:46'),
(55, 55, 56, 29, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a> for changes', 1, '2016-12-02 02:45:40', '2016-12-02 03:03:18'),
(56, 57, 55, 28, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/28\'>secret santa</a> for changes', 0, '2016-12-02 02:59:34', '2016-12-02 02:59:34'),
(57, 58, 55, 28, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/28\'>secret santa</a> for changes', 0, '2016-12-02 02:59:34', '2016-12-02 02:59:34'),
(58, 57, 55, 28, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/28\'>secret santa</a> for changes', 0, '2016-12-02 03:00:01', '2016-12-02 03:00:01'),
(59, 58, 55, 28, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/28\'>secret santa</a> for changes', 0, '2016-12-02 03:00:01', '2016-12-02 03:00:01'),
(60, 57, 55, 28, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/28\'>secret santa</a> for changes', 0, '2016-12-02 03:01:02', '2016-12-02 03:01:02'),
(61, 58, 55, 28, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/28\'>secret santa</a> for changes', 0, '2016-12-02 03:01:03', '2016-12-02 03:01:03'),
(62, 55, 56, 28, 'event_joined', '<a href=\'/organizerProfile/56\'>Rukhsar</a> has joined your event <a href=\'/eventDetails/28\'>secret santa</a>', 1, '2016-12-02 03:03:52', '2016-12-02 03:10:00'),
(63, 57, 55, 28, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/28\'>secret santa</a> for changes', 0, '2016-12-02 03:05:26', '2016-12-02 03:05:26'),
(64, 58, 55, 28, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/28\'>secret santa</a> for changes', 0, '2016-12-02 03:05:26', '2016-12-02 03:05:26'),
(65, 56, 55, 28, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/28\'>secret santa</a> for changes', 1, '2016-12-02 03:05:26', '2016-12-02 04:55:30'),
(66, 57, 55, 28, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/28\'>secret santa</a> for changes', 0, '2016-12-02 03:06:46', '2016-12-02 03:06:46'),
(67, 58, 55, 28, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/28\'>secret santa</a> for changes', 0, '2016-12-02 03:06:47', '2016-12-02 03:06:47'),
(68, 56, 55, 28, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/28\'>secret santa</a> for changes', 1, '2016-12-02 03:06:47', '2016-12-02 04:55:32'),
(69, 57, 55, 28, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/28\'>secret santa</a> for changes', 0, '2016-12-02 03:10:37', '2016-12-02 03:10:37'),
(70, 58, 55, 28, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/28\'>secret santa</a> for changes', 0, '2016-12-02 03:10:38', '2016-12-02 03:10:38'),
(71, 56, 55, 28, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/28\'>secret santa</a> for changes', 1, '2016-12-02 03:10:38', '2016-12-02 04:55:34'),
(72, 57, 55, 28, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/28\'>secret santa</a> for changes', 0, '2016-12-02 03:12:23', '2016-12-02 03:12:23'),
(73, 58, 55, 28, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/28\'>secret santa</a> for changes', 0, '2016-12-02 03:12:24', '2016-12-02 03:12:24'),
(74, 56, 55, 28, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/28\'>secret santa</a> for changes', 1, '2016-12-02 03:12:24', '2016-12-02 04:55:35'),
(75, 57, 55, 28, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/28\'>secret santa</a> for changes', 0, '2016-12-02 03:13:08', '2016-12-02 03:13:08'),
(76, 58, 55, 28, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/28\'>secret santa</a> for changes', 0, '2016-12-02 03:13:08', '2016-12-02 03:13:08'),
(77, 56, 55, 28, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/28\'>secret santa</a> for changes', 1, '2016-12-02 03:13:08', '2016-12-02 04:55:36'),
(78, 57, 55, 28, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/28\'>secret santa</a> for changes', 0, '2016-12-02 03:14:25', '2016-12-02 03:14:25'),
(79, 58, 55, 28, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/28\'>secret santa</a> for changes', 0, '2016-12-02 03:14:25', '2016-12-02 03:14:25'),
(80, 56, 55, 28, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/28\'>secret santa</a> for changes', 1, '2016-12-02 03:14:25', '2016-12-02 04:55:37'),
(81, 58, 56, 29, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a> for changes', 0, '2016-12-02 04:04:54', '2016-12-02 04:04:54'),
(82, 57, 56, 29, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a> for changes', 0, '2016-12-02 04:04:55', '2016-12-02 04:04:55'),
(83, 41, 56, 29, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a> for changes', 1, '2016-12-02 04:04:55', '2016-12-02 04:44:57'),
(84, 55, 56, 29, 'event_edited', 'An event you joined has been updated. Check <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a> for changes', 1, '2016-12-02 04:04:55', '2016-12-02 04:11:22'),
(85, 55, 41, 28, 'event_joined', '<a href=\'/organizerProfile/41\'>jlive</a> has joined your event <a href=\'/eventDetails/28\'>secret santa</a>', 1, '2016-12-02 04:43:35', '2016-12-02 06:52:59'),
(86, 55, 54, 28, 'event_joined', '<a href=\'/organizerProfile/54\'>Josh Williams</a> has joined your event <a href=\'/eventDetails/28\'>secret santa</a>', 1, '2016-12-02 13:40:28', '2016-12-02 17:02:57'),
(87, 55, 54, 28, 'event_liked', '<a href=\'/organizerProfile/54\'>Josh Williams</a> has liked your event, <a href=\'/eventDetails/28\'>secret santa</a>', 1, '2016-12-02 13:40:52', '2016-12-02 17:02:58'),
(88, 65, 62, 32, 'event_joined', '<a href=\'/organizerProfile/62\'>Chase Carreiro</a> has joined your event <a href=\'/eventDetails/32\'>Capstone!!!!!</a>', 0, '2016-12-02 16:13:51', '2016-12-02 16:13:51'),
(89, 65, 67, 32, 'event_liked', '<a href=\'/organizerProfile/67\'>KurtisJohnson</a> has liked your event, <a href=\'/eventDetails/32\'>Capstone!!!!!</a>', 0, '2016-12-02 16:17:59', '2016-12-02 16:17:59'),
(90, 65, 62, 32, 'event_liked', '<a href=\'/organizerProfile/62\'>Chase Carreiro</a> has liked your event, <a href=\'/eventDetails/32\'>Capstone!!!!!</a>', 0, '2016-12-02 16:19:24', '2016-12-02 16:19:24'),
(91, 56, 63, 29, 'event_liked', '<a href=\'/organizerProfile/63\'>The6God</a> has liked your event, <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a>', 1, '2016-12-02 16:23:14', '2016-12-02 16:24:53'),
(92, 56, 64, 29, 'event_liked', '<a href=\'/organizerProfile/64\'>Newbury</a> has liked your event, <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a>', 1, '2016-12-02 16:23:17', '2016-12-02 18:09:37'),
(93, 56, 67, 29, 'event_liked', '<a href=\'/organizerProfile/67\'>KurtisJohnson</a> has liked your event, <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a>', 0, '2016-12-02 16:23:19', '2016-12-02 16:23:19'),
(94, 68, 62, 36, 'event_joined', '<a href=\'/organizerProfile/62\'>Chase Carreiro</a> has joined your event <a href=\'/eventDetails/36\'>Make awkward Conversation</a>', 1, '2016-12-02 16:23:23', '2016-12-02 16:24:11'),
(95, 56, 68, 29, 'event_liked', '<a href=\'/organizerProfile/68\'>The Professor</a> has liked your event, <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a>', 0, '2016-12-02 16:24:59', '2016-12-02 16:24:59'),
(96, 62, 68, 33, 'event_joined', '<a href=\'/organizerProfile/68\'>The Professor</a> has joined your event <a href=\'/eventDetails/33\'>the best day ever</a>', 1, '2016-12-02 16:25:34', '2016-12-02 16:26:44'),
(97, 56, 66, 37, 'event_joined', '<a href=\'/organizerProfile/66\'>musks</a> has joined your event <a href=\'/eventDetails/37\'>Hooka Party - Lets blow some O\'s</a>', 0, '2016-12-02 16:27:25', '2016-12-02 16:27:25'),
(98, 56, 66, 37, 'event_liked', '<a href=\'/organizerProfile/66\'>musks</a> has liked your event, <a href=\'/eventDetails/37\'>Hooka Party - Lets blow some O\'s</a>', 0, '2016-12-02 16:27:31', '2016-12-02 16:27:31'),
(99, 56, 67, 37, 'event_joined', '<a href=\'/organizerProfile/67\'>KurtisJohnson</a> has joined your event <a href=\'/eventDetails/37\'>Hooka Party - Lets blow some O\'s</a>', 0, '2016-12-02 16:27:51', '2016-12-02 16:27:51'),
(100, 65, 56, 38, 'event_liked', '<a href=\'/organizerProfile/56\'>Rukhsar</a> has liked your event, <a href=\'/eventDetails/38\'>APPetite!</a>', 0, '2016-12-02 16:41:16', '2016-12-02 16:41:16'),
(101, 62, 56, 33, 'event_liked', '<a href=\'/organizerProfile/56\'>Rukhsar</a> has liked your event, <a href=\'/eventDetails/33\'>the best day ever</a>', 0, '2016-12-02 16:41:55', '2016-12-02 16:41:55'),
(102, 65, 54, 32, 'event_liked', '<a href=\'/organizerProfile/54\'>Josh Williams</a> has liked your event, <a href=\'/eventDetails/32\'>Capstone!!!!!</a>', 0, '2016-12-02 16:59:31', '2016-12-02 16:59:31'),
(103, 65, 54, 32, 'event_joined', '<a href=\'/organizerProfile/54\'>Josh Williams</a> has joined your event <a href=\'/eventDetails/32\'>Capstone!!!!!</a>', 0, '2016-12-02 16:59:43', '2016-12-02 16:59:43'),
(104, 66, 71, 34, 'event_joined', '<a href=\'/organizerProfile/71\'>Twisha</a> has joined your event <a href=\'/eventDetails/34\'>Shishalicious gathering</a>', 0, '2016-12-02 17:46:18', '2016-12-02 17:46:18'),
(105, 56, 71, 29, 'event_liked', '<a href=\'/organizerProfile/71\'>Twisha</a> has liked your event, <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a>', 0, '2016-12-02 17:49:36', '2016-12-02 17:49:36'),
(106, 66, 54, 34, 'event_liked', '<a href=\'/organizerProfile/54\'>Josh Williams</a> has liked your event, <a href=\'/eventDetails/34\'>Shishalicious gathering</a>', 0, '2016-12-02 19:25:30', '2016-12-02 19:25:30'),
(107, 66, 54, 34, 'event_joined', '<a href=\'/organizerProfile/54\'>Josh Williams</a> has joined your event <a href=\'/eventDetails/34\'>Shishalicious gathering</a>', 0, '2016-12-02 19:30:49', '2016-12-02 19:30:49'),
(108, 56, 64, 37, 'event_joined', '<a href=\'/organizerProfile/64\'>Newbury</a> has joined your event <a href=\'/eventDetails/37\'>Hooka Party - Lets blow some O\'s</a>', 0, '2016-12-02 20:56:17', '2016-12-02 20:56:17'),
(109, 56, 41, 37, 'event_joined', '<a href=\'/organizerProfile/41\'>jlive</a> has joined your event <a href=\'/eventDetails/37\'>Hooka Party - Lets blow some O\'s</a>', 0, '2016-12-02 23:53:04', '2016-12-02 23:53:04'),
(110, 56, 41, 37, 'event_liked', '<a href=\'/organizerProfile/41\'>jlive</a> has liked your event, <a href=\'/eventDetails/37\'>Hooka Party - Lets blow some O\'s</a>', 0, '2016-12-02 23:53:18', '2016-12-02 23:53:18'),
(111, 56, 72, 29, 'event_liked', '<a href=\'/organizerProfile/72\'>Chanchans</a> has liked your event, <a href=\'/eventDetails/29\'>SDNE Grad Party - Blue Mountain Ontario</a>', 0, '2016-12-04 20:01:59', '2016-12-04 20:01:59');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
CREATE TABLE `ratings` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `dislike` tinyint(1) DEFAULT NULL,
  `like` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `user_id`, `event_id`, `dislike`, `like`) VALUES
(10, 55, 28, 0, 1),
(11, 57, 28, 0, 1),
(12, 56, 28, 0, 1),
(13, 55, 29, 0, 1),
(14, 57, 29, 0, 1),
(15, 56, 29, 1, 0),
(16, 58, 29, 0, 1),
(17, 41, 29, 0, 1),
(18, 54, 28, 0, 1),
(19, 67, 32, 0, 1),
(20, 62, 32, 0, 1),
(21, 63, 29, 0, 1),
(22, 64, 29, 0, 1),
(23, 67, 29, 0, 1),
(24, 68, 29, 0, 1),
(25, 66, 34, 0, 1),
(26, 66, 37, 0, 1),
(27, 56, 38, 0, 1),
(28, 65, 38, 0, 1),
(29, 56, 33, 0, 1),
(30, 54, 32, 0, 1),
(31, 71, 29, 0, 1),
(32, 54, 34, 0, 1),
(33, 41, 37, 0, 1),
(34, 72, 29, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `amount` double UNSIGNED NOT NULL,
  `transaction_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `username` varchar(14) DEFAULT NULL,
  `password` varchar(254) DEFAULT NULL,
  `first_name` varchar(150) DEFAULT NULL,
  `last_name` varchar(150) DEFAULT NULL,
  `phone_number` bigint(20) UNSIGNED DEFAULT NULL,
  `facebook_id` varchar(255) DEFAULT NULL,
  `facebook_token` varchar(255) DEFAULT NULL,
  `facebook_name` varchar(255) DEFAULT NULL,
  `facebook_email` varchar(255) DEFAULT NULL,
  `twitter_id` varchar(255) DEFAULT NULL,
  `twitter_token` varchar(255) DEFAULT NULL,
  `twitter_username` varchar(255) DEFAULT NULL,
  `twitter_displayName` varchar(255) DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `google_token` varchar(255) DEFAULT NULL,
  `google_name` varchar(255) DEFAULT NULL,
  `google_email` varchar(255) DEFAULT NULL,
  `primary_account` varchar(30) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `profile_pic_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `gender`, `date_of_birth`, `email`, `username`, `password`, `first_name`, `last_name`, `phone_number`, `facebook_id`, `facebook_token`, `facebook_name`, `facebook_email`, `twitter_id`, `twitter_token`, `twitter_username`, `twitter_displayName`, `google_id`, `google_token`, `google_name`, `google_email`, `primary_account`, `admin`, `created_at`, `updated_at`, `profile_pic_url`) VALUES
(29, NULL, NULL, 'gurpreet.s@gmail.com', 'gursingh1', '$2a$10$iW3lvBKxOzYNfsevSkSkeOKr46p.Lg0BhDzLd7r.H8BS6cxnL8muq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-10-17 15:07:17', '2016-10-17 15:07:17', NULL),
(30, NULL, NULL, 'harpreet_kaur@gmail.com', 'harpreet.kaur', '$2a$10$ZaIQzorqVqo0kYF97KJlGeKSt5T8mNW9pZEKdLdITy4PgBVOKUM5u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-10-18 14:32:18', '2016-10-18 14:32:18', NULL),
(31, NULL, NULL, 'navi01@hotmail.com', 'navi_singh', '$2a$10$frKggg0EdV1WZ1QjwB.5j.McC3XkPVqCV93cvSTq.wxbWqQh5FVQW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-10-18 14:32:34', '2016-10-18 14:32:34', NULL),
(32, NULL, NULL, 'gurJazz@hotmail.com', 'gurSidhu', '$2a$10$3sRKZJfuxZE8IMfgxk2nI.1swLQPQ.5lqEj1kZShAqWMkVsjMEV4C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-10-18 14:32:53', '2016-10-18 14:32:53', NULL),
(33, NULL, NULL, 'puniHeir@yahoo.com', 'p.heir', '$2a$10$F.rySH7kTWvzBfbuwzQaE.axaFhhwbfzJ6WUn2Vt17CyrSr7SKUJ.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-10-18 14:33:17', '2016-10-18 14:33:17', NULL),
(34, NULL, NULL, 'manu-g@yahoo.com', 'manu22', '$2a$10$vjTSWu68O0QqhtOCeqzXg.gLCXmEGg6bnWLF7VBoIrRkgLTMJz4xW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-10-18 14:33:35', '2016-10-18 14:33:35', NULL),
(35, NULL, NULL, 'f.rehman@gmail.com', 'farah.rehman', '$2a$10$EX43rAtQxnTrbhPdxTBkLeAurKyhuBQ4iL4DykonskXl4X8zDGHXa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-10-18 14:33:52', '2016-10-18 14:33:52', NULL),
(36, NULL, NULL, 'humzau.04@gmail.com', 'humzaumar.4', '$2a$10$AUoDrpinr1dTzO.LV.Q3uezT22uOHlCeOtfHKKrx3cLcWo9BmwfYe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-10-18 14:34:15', '2016-10-18 14:34:15', NULL),
(37, NULL, NULL, 'khan.tani@hotmail.com', 'tani.pak', '$2a$10$nnTEAL6RiITCiH7vl7HvtOsHMFJldI/YDqza7Hm05e.cCc9PFcWIK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-10-18 14:35:25', '2016-10-18 14:35:25', NULL),
(38, NULL, NULL, 'mir.arasian@yahoo.com', 'mir.arasian', '$2a$10$z9a6bwl5pSn05H9q.4MvWOnclnahgniQDKTjM.y8DR/y4wECo2Jiq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-10-18 14:35:44', '2016-10-18 14:35:44', NULL),
(39, NULL, NULL, 'rami.khan@yahoo.com', 'rami_k', '$2a$10$RsCZKGV9ociBkULtdYxpD.N5BNyaaVoh6HKf7JSegZSh84YLL8uz6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-10-18 14:35:58', '2016-10-18 14:35:58', NULL),
(40, NULL, NULL, 'delly09@gmail.com', 'dellyIsaacs', '$2a$10$aCy37nTPppo.xZoT2OZE.OuYA3voJOL7mEucbekV9lxYosdf75mPa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-10-18 14:36:17', '2016-10-18 14:36:17', NULL),
(41, 'male', NULL, 'jwilliams199055@gmail.com', 'jlive', '$2a$10$J5B54RrO0TAZly4WCw6Td.ouDnfxGxIOciyqKPnksFilhf9biEjbC', 'Joshua', 'Williams', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-10-18 14:36:32', '2016-12-03 18:19:35', NULL),
(42, NULL, NULL, 'burt.tyr@hotmail.com', 'tyr.burt04', '$2a$10$xqWqt7V1/Us.jE970XWbm.v7YJCKoRMTClPBLV8l.zig9SVBjOKHa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-10-18 14:36:53', '2016-10-18 14:36:53', NULL),
(43, NULL, NULL, 'aliyah.jord@hotmail.com', 'ali.jord', '$2a$10$BH7lmqHh85dd7kmd86uWgO5XVbzX5bkAMkARUQs6Nll/f8KvLafLO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-10-18 14:37:12', '2016-10-18 14:37:12', NULL),
(44, NULL, NULL, 'kiesh_john1@yahoo.com', 'johnson.kieha1', '$2a$10$9fNJ8KQFOo7soSaFuh8.EONW3OXwR1xqbbjTMRQkkh3m3IgeRKJey', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-10-18 14:37:30', '2016-10-18 14:37:30', NULL),
(45, NULL, NULL, 'jaidlo@yahoo.com', 'jaid.lo', '$2a$10$g8xe.wQqSBFr/02eWHglQuRSngrYoEErMJdM.7uOuZKGGqbB97EyK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-10-18 14:37:46', '2016-10-18 14:37:46', NULL),
(46, NULL, NULL, 'ben.house@gmail.com', 'beji_houser', '$2a$10$53JLeRfynvJ64QlDWu3wEej/k4jSgEJeuRgPuoJzWt9K5cdHDhx0S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-10-18 14:38:05', '2016-10-18 14:38:05', NULL),
(47, NULL, NULL, 'jarryr.14@gmail.com', 'jarry.rush', '$2a$10$VEAcRYyHEGDqYmdOCuGMu.rcVRjXZZHL9REZM6ZmXAppjtQZzl5H.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-10-18 14:38:20', '2016-10-18 14:38:20', NULL),
(48, NULL, NULL, 'april_tez@hotmailcom', 'april_benitezz', '$2a$10$x0tDaqFVlRQxY9XuoesyoOjckSaNkqYovI5hgiTPltr29cW/VBh.q', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-10-18 14:39:10', '2016-10-18 14:39:10', NULL),
(49, NULL, NULL, 'nancy_dol@hotmail.com', 'nancy.dols', '$2a$10$mNv3pcNkxgviky5LuwwnRek3rLjj9EdsjeOHrScOvmq7zcK8hCHYe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-10-18 14:39:43', '2016-10-18 14:39:43', NULL),
(50, NULL, NULL, 'cremer.pat@yahoo.com', 'cremer.pat10', '$2a$10$fbaifYtmiat18NDKr7MRgegC1CjgL3XtDnFZIS7zDWdu9BNjfgXZm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-10-18 14:40:00', '2016-10-18 14:40:00', NULL),
(51, NULL, NULL, 'kaspmill@yahoo.com', 'mill_kasp11', '$2a$10$fZeFAM5k68u4ePMhphosUOe7dMxndiD008JxYr4DTGp82x2Lciohu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-10-18 14:40:18', '2016-10-18 14:40:18', NULL),
(52, NULL, NULL, 'joshuawilliams@hotmail.com', 'JLIVEog', '$2a$10$QjMJze9QdJYFiLceic6GQeMIk3NmkAwO1J2m8mrFifHvYtwOuWpWy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-10-21 01:44:36', '2016-10-21 01:44:36', NULL),
(53, NULL, NULL, 'anewpaul@hotmail.com', 'a-aron', '$2a$10$rsCTi7a904SUe3xIOc.iPejGif3fKz6R50ZZUxDhCeZdt/YwWKu/6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-10-21 01:48:35', '2016-10-21 01:48:35', NULL),
(54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '10157603110180599', 'EAAPx5RfJ3gwBABcaipNoJIXnWduv5DQCTMOJZAxTFnbPgOKqKmagZAmSZC3YZBpJvvr1VDPcGCbcU672b3RNOBtL0dwa0gimjcFZBaoSPCa5W9VSs8VQ7EVgWzZBY62CYgbjIkG40HImmYyFjZBevdGLE30t8DekHsZD', 'Josh Williams', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'facebook', 0, '2016-11-16 14:19:04', '2016-12-02 13:42:39', 'http://67.205.153.9:9000/uploads/users/8effe94c-3316-4e10-9c9b-2d1a2158784a.jpg'),
(55, 'male', '1994-09-05', 'ivanshotwell@yahoo.com', 'Ivanyahoo', '$2a$10$lU8QzVCdF8XTdV3T/PNFVOFGIf6otVXY47Sl.U5pB9SC6eeZp0OvS', 'Ivan', 'Shotwell', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-12-02 00:55:37', '2016-12-02 15:45:14', 'http://67.205.153.9:9000/uploads/users/3d079efd-df83-4dd9-bf04-74a7c1cff927.png'),
(56, NULL, NULL, 'srshakeel08@gmail.com', 'Rukhsar', '$2a$10$T8iXcqTSyF.CPOOtSWEYFe6zwpBfH4NWd.NnFHTmLJZ7/Ng2UIrna', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-12-02 01:17:19', '2016-12-02 18:09:09', 'http://67.205.153.9:9000/uploads/users/5c8705f2-8122-429f-82d6-ac9cd5345979.32'),
(57, NULL, NULL, 'mir_araisian@hotmail.com', 'Mir', '$2a$10$L7hnHIoobdbqXV3t6jolEeZ4kBMPEW2yA6jyiFN/nKCEEYwJfdbqe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-12-02 01:17:19', '2016-12-02 01:17:19', NULL),
(58, 'male', '1994-09-05', 'i.r.shotwell@hotmail.com', 'Shotwell', '$2a$10$jYuczDZOI.2kEKioCl6g6e3NiyxoydvQzHqXWzf9fOjv3hePSNs.a', 'Ivan', 'Shotwell', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-12-02 01:24:40', '2016-12-02 01:47:19', 'http://67.205.153.9:9000/uploads/users/24204b42-a27a-4325-b569-5178587381a1.png'),
(59, NULL, NULL, 'crasykid2@hotmail.com', 'Asemco', '$2a$10$jQs5jQxEZTcVOrho1osggutC6zjNlHPDLrZfis5qT2c4SrqVWyOca', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-12-02 03:43:56', '2016-12-02 03:43:56', NULL),
(60, NULL, NULL, 'alan@laddr.xyz', 'Alan', '$2a$10$Nsfmo9oD7DLDk06AjC.8Tu67PuUQ7gL1QXPrwO7MePxScerH9zLfu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-12-02 03:45:36', '2016-12-02 03:45:36', NULL),
(61, NULL, NULL, 'aksdn', 'Dhondup', '$2a$10$BoLTiuNSImMcqOgpDUx1e.FqC02vOcLbfX9ll.qGfWPZMRK64iGj.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-12-02 16:01:26', '2016-12-02 16:01:26', NULL),
(62, 'male', NULL, 'chase.carreiro@gmail.com', 'Chase Carreiro', '$2a$10$qOO.J8dcy6tmTE/aWG9o/.pV9hwQ3rGK1Qg.Q.lT9onr2VkVdRzcu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-12-02 16:02:11', '2016-12-02 16:18:34', 'http://67.205.153.9:9000/uploads/users/feffe17c-913a-4995-a1ad-de698373a999.jpg'),
(63, NULL, NULL, 'kurtisj1992@gmail.com', 'The6God', '$2a$10$GcVurhXpIcqTS6jmW/lH8.LepeB.qI/ZM3n/wWrkHOc6iGJpLEXh2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-12-02 16:03:12', '2016-12-02 16:03:12', NULL),
(64, 'male', NULL, 'kevinnewbury@hotmail.com', 'Newbury', '$2a$10$noxDZPiprJoYePM6Zffim.WjjGHu66d9T0S4mZAef/wecikMJhZam', 'Kevin', 'Newbury', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-12-02 16:04:38', '2016-12-02 16:29:57', NULL),
(65, 'male', '1995-07-25', 'dhondup-471@hotmail.com', 'Dhondup Dorjee', '$2a$10$mknuM4Ho1IfsfH2GwLIkyuZVd/VTpLflMaE48DIVLl4ow8WVxc9ey', 'Dhondup', 'Dorjee', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-12-02 16:05:01', '2016-12-02 16:17:14', NULL),
(66, NULL, NULL, 'muska@laddr.xyz', 'musks', '$2a$10$tLdNlb07vMKv5EsM.46dQuKYWs4QovUK6AEZPDT7bhXyFeQ.X7jKC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-12-02 16:12:36', '2016-12-02 16:12:36', NULL),
(67, 'male', '1995-09-02', 'mharc_1995@hotmail.com', 'KurtisJohnson', '$2a$10$CezXzYwKN67BrOBg6HQZouHATuPEE5tAhx.a8fgndguD0LRLGxWJG', 'Mharc', 'Pacaanas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-12-02 16:15:41', '2016-12-02 16:17:16', NULL),
(68, NULL, NULL, 'lol@fake.com', 'The Professor', '$2a$10$pD0K48pCLbIX6Xnl32SQ0OuQAK0b7v8Oya3SZWFZMkNyqbFzgdEhC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-12-02 16:16:12', '2016-12-02 16:16:12', NULL),
(69, NULL, NULL, 'peter@laddr.xyz', 'Peter', '$2a$10$oSTqiQYV68jXGCYLjV/mUuTQbsIPDcXfQT1bvm7DcgQNS2Y7J9hDy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-12-02 16:21:57', '2016-12-02 16:21:57', NULL),
(70, NULL, NULL, 'rahul_singh8@hotmail.com', 'rahul', '$2a$10$rTd1CYxO1UmGu0juB5xWzeYuDwOiwPMzj4JVBTBwOU4ujMnQ/FASe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-12-02 16:29:37', '2016-12-02 16:29:37', NULL),
(71, NULL, NULL, 'twisha95@gamil.com', 'Twisha', '$2a$10$t8rX/t1l398es.M7b/mWMOSWNVpBzye5bEEdkG5D6JbZxOvWvGjGm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-12-02 17:46:13', '2016-12-02 17:46:13', NULL),
(72, 'male', '2016-12-09', 'ChristianReyes', 'Chanchans', '$2a$10$V1wrWtjduaztO2/ShF4hdeSfxGbGmwiAFfff2R.fJhasIl7ic.CU.', 'Christian', 'Reyes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-12-04 19:51:38', '2016-12-04 19:59:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_categories`
--

DROP TABLE IF EXISTS `users_categories`;
CREATE TABLE `users_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_categories`
--

INSERT INTO `users_categories` (`id`, `user_id`, `category_id`) VALUES
(1, 58, 22),
(29, 55, 2),
(30, 55, 18),
(31, 55, 22),
(32, 55, 15),
(33, 55, 3),
(34, 55, 14),
(35, 55, 1),
(36, 65, 3),
(37, 65, 2),
(38, 65, 7),
(39, 67, 8),
(40, 67, 17),
(41, 67, 12),
(42, 67, 14),
(43, 67, 1),
(44, 67, 25),
(45, 67, 7),
(46, 67, 18),
(47, 67, 27),
(48, 67, 21),
(49, 67, 4),
(50, 67, 15),
(51, 67, 2),
(52, 67, 9),
(53, 64, 12),
(54, 64, 17),
(55, 64, 1),
(56, 64, 2),
(57, 64, 11),
(58, 64, 19),
(59, 64, 7),
(60, 64, 16),
(65, 56, 9),
(66, 56, 8),
(67, 56, 20),
(68, 56, 12),
(69, 56, 14),
(80, 72, 18),
(81, 72, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users_events`
--

DROP TABLE IF EXISTS `users_events`;
CREATE TABLE `users_events` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_events`
--

INSERT INTO `users_events` (`id`, `user_id`, `event_id`) VALUES
(29, 57, 28),
(30, 58, 28),
(33, 58, 29),
(47, 57, 29),
(52, 41, 28),
(54, 54, 28),
(55, 62, 32),
(56, 60, 29),
(57, 66, 29),
(58, 69, 29),
(59, 62, 29),
(60, 63, 29),
(61, 67, 29),
(62, 64, 29),
(63, 55, 29),
(65, 68, 33),
(66, 66, 37),
(67, 67, 37),
(68, 54, 32),
(70, 54, 34),
(71, 64, 37),
(73, 54, 29);

-- --------------------------------------------------------

--
-- Table structure for table `users_friends`
--

DROP TABLE IF EXISTS `users_friends`;
CREATE TABLE `users_friends` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `friend_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_event_id_foreign` (`event_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_user_id_foreign` (`user_id`);

--
-- Indexes for table `events_categories`
--
ALTER TABLE `events_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_categories_event_id_foreign` (`event_id`),
  ADD KEY `events_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratings_user_id_foreign` (`user_id`),
  ADD KEY `ratings_event_id_foreign` (`event_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_event_id_foreign` (`event_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_facebook_id_unique` (`facebook_id`),
  ADD UNIQUE KEY `users_facebook_email_unique` (`facebook_email`),
  ADD UNIQUE KEY `users_twitter_id_unique` (`twitter_id`),
  ADD UNIQUE KEY `users_twitter_username_unique` (`twitter_username`),
  ADD UNIQUE KEY `users_google_id_unique` (`google_id`),
  ADD UNIQUE KEY `users_google_email_unique` (`google_email`);

--
-- Indexes for table `users_categories`
--
ALTER TABLE `users_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_categories_user_id_foreign` (`user_id`),
  ADD KEY `users_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `users_events`
--
ALTER TABLE `users_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_events_user_id_foreign` (`user_id`),
  ADD KEY `users_events_event_id_foreign` (`event_id`);

--
-- Indexes for table `users_friends`
--
ALTER TABLE `users_friends`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_friends_user_id_foreign` (`user_id`),
  ADD KEY `users_friends_friend_id_foreign` (`friend_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `events_categories`
--
ALTER TABLE `events_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;
--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `users_categories`
--
ALTER TABLE `users_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
--
-- AUTO_INCREMENT for table `users_events`
--
ALTER TABLE `users_events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT for table `users_friends`
--
ALTER TABLE `users_friends`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `events_categories`
--
ALTER TABLE `events_categories`
  ADD CONSTRAINT `events_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `events_categories_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users_categories`
--
ALTER TABLE `users_categories`
  ADD CONSTRAINT `users_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users_events`
--
ALTER TABLE `users_events`
  ADD CONSTRAINT `users_events_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_events_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users_friends`
--
ALTER TABLE `users_friends`
  ADD CONSTRAINT `users_friends_friend_id_foreign` FOREIGN KEY (`friend_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_friends_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
