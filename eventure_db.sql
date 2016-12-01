-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2016 at 12:44 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eventure_db`
--

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
(2, '2016 Creating Vital Solutions Update', '<p>Join us this year as we unveil our Creating Vital Solutions 2016 update for Oakville. Together with our partners; caring members of our community, civic leaders, local charities, businesses and local educational institutions we''ll be looking at how far we''ve come and what still needs doing to make our town a better place.</p>\n<p>We would like to thank all the hard work of our 2016 Creating Vital Solutions Title Sponsor <strong>First Ontario Credit</strong> <strong>Union</strong> for helping make this document possible.</p>\n<h3><img src="https://cdn.evbuc.com/eventlogos/16567635/fcuprocessblueorange.jpg" /></h3>', 29, 'http://localhost:9000/uploads/events/f2edb392-8a54-40e4-b595-3795ff656a86.evbuc', '171 Speers Rd, Oakville, ON L6K 3W8, Canada', 0, NULL, '2016-10-18 09:00:00', '2016-10-18 11:00:00', 0, '2016-10-17 16:17:49', '2016-10-19 06:34:04', '43.4464924000', '-79.6903662000'),
(3, 'Younique BossBabe Training', '<p>Join Karyn Medeiros and 6 amazing leaders with special guest Debra Joseph, VP Canadian Market (Younique) for a day of business building training.&nbsp;</p>\n<p>Each leader will be speaking on their specialty :)&nbsp;</p>\n<p>✔️ Lunch is provided</p>\n<p>✔️ $35 per ticket (covers lunch and room)&nbsp;</p>\n<p>✔️10-4 pm&nbsp;</p>\n<p>✔️ 100 seats available only (First come, first serve)&nbsp;</p>\n<p>&nbsp;</p>', 29, 'http://localhost:9000/uploads/events/6754b4a8-0485-4061-9323-f80160048970.evbuc', 'This is an online event', 0, NULL, '2016-10-30 10:00:00', '2016-10-30 16:00:00', 0, '2016-10-17 18:37:59', '2016-10-20 03:07:43', '0.0000000000', '0.0000000000'),
(4, 'Post Secondary Pathways What You Need to Know', '<p>After the success of Bridging the Gap convention, ICNA Relief Canada presents a FREE info night for Grades 11 and 12 students and their Parents to help guide you through Post-Secondary selection and application process.</p>\n<p>There is growing concern that highschool guidance is insufficient, university admission requirements are very competetive, and parents/students are indecisive when it''s time to apply in Gr. 12. Sign up below for an opportunity where frequently asked questions and myths related to pathways from Gr. 12 to post-secondary institution are addressed. </p>\n<p>The event features an informative presentation followed by a panel Q&amp;A session. This will be the night to&nbsp; prepare, get tips, and ask questions so you make the Right Decision...the most important decision for you and your child!</p>\n<h3>Register early to guarantee spot (spaces limited). <strong>Entry limited to ONLY high school students and accompanying parents.&nbsp;</strong></h3>\n<p>For further information, contact&nbsp;<a href="mailto:icnauniversity@gmail.com" target="_blank" rel="noopener noreferrer nofollow">icnauniversity@gmail.com</a>.</p>\n<hr />\n<p>&nbsp;</p>\n<p><strong>Event Agenda:</strong></p>\n<p>5:50&nbsp; - Registration starts<br />6:00 - 7:00 PM - Presentation<br />7:00 - 7:30 PM - Panel Q&amp;A</p>\n<p>7:00 - 7:30 PM - Individual Q&amp;A (for those who wish)</p>\n<p><strong>Agreement: </strong>By coming to this event, you release the organizers of this event from any claim arising from loss, damange or injury, howsoever incurred in result of any participation in or about the event. You agree that during this event, you may be photographed, videotaped or featured in electronic media. </p>', 29, 'http://localhost:9000/uploads/events/133edc3f-9792-45bb-8f7f-96d37fe6631c.evbuc', '2233 S Millway, Mississauga, ON L5L 3H7, Canada', 0, NULL, '2016-10-29 18:00:00', '2016-10-29 20:00:00', 0, '2016-10-18 17:28:28', '2016-10-18 17:28:28', '43.5422597000', '-79.6840550000'),
(5, 'ACTION Conference 2016', '<p>&nbsp;</p>\n<ul>\n<li class="g-cell g-cell-1-1 g-cell-md-1-3 g-cell-lg-1-4">\n<div class="avatar avatar--flexible"><img src="https://schd.ws/a10/3281533/avatar.jpg?22e" alt="Lotfi Belkhir" /></div>\n<h3 class="list-person__name">Lotfi Belkhir</h3>\n<p class="list-person__company">W Booth School of Engineering Practice</p>\n<p class="list-person__role">Associate Professor</p>\n</li>\n<li class="g-cell g-cell-1-1 g-cell-md-1-3 g-cell-lg-1-4">\n<div class="avatar avatar--flexible"><img src="https://schd.ws/a10/3306980/avatar.jpg?0bc" alt="Denise Brosseau" /></div>\n<h3 class="list-person__name">Denise Brosseau</h3>\n<p class="list-person__company">Thought Leadership Lab</p>\n<p class="list-person__role">CEO</p>\n</li>\n<li class="g-cell g-cell-1-1 g-cell-md-1-3 g-cell-lg-1-4">\n<div class="avatar avatar--flexible"><img src="https://schd.ws/a10/3281536/avatar.jpg?f1f" alt="Gerard Buckley" /></div>\n<h3 class="list-person__name">Gerard Buckley</h3>\n<p class="list-person__company">Jaguar Capital Inc</p>\n<p class="list-person__role">CEO and Founding Partner</p>\n</li>\n<li class="g-cell g-cell-1-1 g-cell-md-1-3 g-cell-lg-1-4">\n<div class="avatar avatar--flexible"><img src="https://schd.ws/a10/3360197/avatar.jpg?38f" alt="Carol Chong" /></div>\n<h3 class="list-person__name">Carol Chong</h3>\n<p class="list-person__company">Sklar Wilton &amp; Associates</p>\n<p class="list-person__role">Director</p>\n</li>\n<li class="g-cell g-cell-1-1 g-cell-md-1-3 g-cell-lg-1-4">\n<div class="avatar avatar--flexible"><img src="https://s.evbuc.com/https_proxy?url=http%3A%2F%2Fstatic.sched.org%2Fa10%2F3307003%2Favatar.jpg%3Fe7e&amp;sig=ADR2i7_uoCP5FoETWF8Cn2QFuC-sO64UcA" alt="Mustafa Dossajee" /></div>\n<h3 class="list-person__name">Mustafa Dossajee</h3>\n<p class="list-person__company">SB Partners LLP</p>\n<p class="list-person__role">Partner</p>\n</li>\n<li class="g-cell g-cell-1-1 g-cell-md-1-3 g-cell-lg-1-4">\n<div class="avatar avatar--flexible"><img src="https://schd.ws/a10/3281549/avatar.jpg?37e" alt="Yossi Feinberg" /></div>\n<h3 class="list-person__name">Yossi Feinberg</h3>\n<p class="list-person__company">Stanford University Graduate School of Business</p>\n<p class="list-person__role">Professor</p>\n</li>\n<li class="g-cell g-cell-1-1 g-cell-md-1-3 g-cell-lg-1-4">\n<div class="avatar avatar--flexible"><img src="https://schd.ws/a10/3281538/avatar.jpg?af1" alt="Claude Gauthier" /></div>\n<h3 class="list-person__name">Claude Gauthier</h3>\n<p class="list-person__company">OmniPhy</p>\n<p class="list-person__role">CTO and Co-Founder</p>\n</li>\n<li class="g-cell g-cell-1-1 g-cell-md-1-3 g-cell-lg-1-4">\n<div class="avatar avatar--flexible"><img src="https://schd.ws/a10/3281539/avatar.jpg?c4e" alt="Randall Howard" /></div>\n<h3 class="list-person__name">Randall Howard</h3>\n<p class="list-person__company">VERDEXUS</p>\n<p class="list-person__role">General Partner</p>\n</li>\n<li class="g-cell g-cell-1-1 g-cell-md-1-3 g-cell-lg-1-4">\n<div class="avatar avatar--flexible"><img src="https://schd.ws/a10/3360186/avatar.jpg?262" alt="Michael Kelly" /></div>\n<h3 class="list-person__name">Michael Kelly</h3>\n<p class="list-person__company">Global Affinity Partners</p>\n<p class="list-person__role">Managing Director</p>\n</li>\n<li class="g-cell g-cell-1-1 g-cell-md-1-3 g-cell-lg-1-4">\n<div class="avatar avatar--flexible"><img src="https://schd.ws/a10/3281540/avatar.jpg?b13" alt="Steven Leach" /></div>\n<h3 class="list-person__name">Steven Leach</h3>\n<p class="list-person__company">Ridout &amp; Maybee LLP</p>\n<p class="list-person__role">Partner</p>\n</li>\n<li class="g-cell g-cell-1-1 g-cell-md-1-3 g-cell-lg-1-4">\n<div class="avatar avatar--flexible"><img src="https://schd.ws/a10/3281541/avatar.jpg?8bb" alt="Chris Lipp" /></div>\n<h3 class="list-person__name">Chris Lipp</h3>\n<p class="list-person__company">Stanford University Graduate School of Business</p>\n<p class="list-person__role">Associate Director</p>\n</li>\n<li class="g-cell g-cell-1-1 g-cell-md-1-3 g-cell-lg-1-4">\n<div class="avatar avatar--flexible"><img src="https://schd.ws/a10/3281542/avatar.jpg?b48" alt="Charles Mire" /></div>\n<h3 class="list-person__name">Charles Mire</h3>\n<p class="list-person__company">Structur3D Printing</p>\n<p class="list-person__role">CEO and Co-Founder</p>\n</li>\n<li class="g-cell g-cell-1-1 g-cell-md-1-3 g-cell-lg-1-4">\n<div class="avatar avatar--flexible"><img src="https://schd.ws/a10/3281544/avatar.jpg?620" alt="Ron Neumann" /></div>\n<h3 class="list-person__name">Ron Neumann</h3>\n<p class="list-person__company">Vistashift</p>\n<p class="list-person__role">CEO and Founder</p>\n</li>\n<li class="g-cell g-cell-1-1 g-cell-md-1-3 g-cell-lg-1-4">\n<div class="avatar avatar--flexible"><img src="https://schd.ws/a10/3315511/avatar.jpg?f54" alt="Gary Svoboda" /></div>\n<h3 class="list-person__name">Gary Svoboda</h3>\n<p class="list-person__company">Adventus Research Consulting Inc.</p>\n<p class="list-person__role">CEO</p>\n</li>\n<li class="g-cell g-cell-1-1 g-cell-md-1-3 g-cell-lg-1-4">\n<div class="avatar avatar--flexible"><img src="https://schd.ws/a10/3360201/avatar.jpg?4e8" alt="Laurie Thompson" /></div>\n<h3 class="list-person__name">Laurie Thompson</h3>\n<p class="list-person__company">Sklar Wilton &amp; Associates</p>\n<p class="list-person__role">Director</p>\n</li>\n<li class="g-cell g-cell-1-1 g-cell-md-1-3 g-cell-lg-1-4">\n<div class="avatar avatar--flexible"><img src="https://schd.ws/a10/3319204/avatar.jpg?e74" alt="Robert Valle&eacute;" /></div>\n<h3 class="list-person__name">Robert Valle&eacute;</h3>\n<p class="list-person__company">Speak &amp; Impress!</p>\n<p class="list-person__role">Founder and Coach</p>\n</li>\n<li class="g-cell g-cell-1-1 g-cell-md-1-3 g-cell-lg-1-4">\n<div class="avatar avatar--flexible"><img src="https://schd.ws/a10/3281548/avatar.jpg?b50" alt="Gerald Weiner" /></div>\n<h3 class="list-person__name">Gerald Weiner</h3>\n<p class="list-person__company">Landmark Canada</p>\n<p class="list-person__role">CEO</p>\n</li>\n</ul>', 41, 'http://localhost:9000/uploads/events/0e55913d-0ad3-4970-af5a-d60476123f70.evbuc', '4350 S Service Rd, Burlington, ON L7L 4X5, Canada', 0, NULL, '2016-11-05 08:00:00', '2016-11-05 18:00:00', 0, '2016-10-18 17:38:22', '2016-10-19 06:25:09', '43.3739237000', '-79.7780796000'),
(6, 'LIGHT IT UP "Diwaleen" Halloween & Diwali Celebration', '<p>Event Name: Diwaleen&nbsp;</p>\n<p>When: Thursday Oct 27th 2016</p>\n<p>Time: 9PM-2AM</p>\n<p>Age Limit: 19+</p>\n<p>Ticket Cost: $10</p>\n<p>Venue: Face Resto Bar.</p>\n<p>137 City View Dr,&nbsp;Etobicoke,&nbsp;ON&nbsp;M9W 5B1</p>\n<p>Dress Code: Suits Or Costumes</p>\n<p>Music By "Rokit Beats" All the way From Newyork</p>\n<p>Type of music: Hip hop, Bhangra, Bollywood, Top 40, Reggae, etc.</p>\n<p>Special guest appearances: Will be released shortly.</p>\n<p>Performances: Will be released shortly.</p>\n<p>Contact Information: 647 787&nbsp;7903</p>', 31, 'http://localhost:9000/uploads/events/f5a9a838-43b2-4a49-b573-9ff8f0e717de.evbuc', '137 City View Dr, Etobicoke, ON M9W 5B1, Canada', 1, NULL, '2016-10-27 21:00:00', '2016-10-28 02:00:00', 0, '2016-10-19 00:18:27', '2016-10-19 00:18:27', '43.7028968000', '-79.5885127000'),
(7, 'Amaretti Night with Anthony Macri', '<p>Join Master Baker, Anthony Macri, for an unforgettable evening on Monday, October 24th, 2016 as he shares with us the tradition of Amaretti. From 7:00-9:00pm at The Kitchen Academy, Anthony will instruct a 2 hour, hands on, workshop demonstrating how he makes his famous Sweet Boutique amaretti.&nbsp;</p>\n<p>Learn, observe &amp; make your own! This fun workshop involves cookies, wine, laughs and your favourite sugar daddy with take-home goodie bags for all!</p>\n<p>Included:</p>\n<p><br />-Sweet Boutique Amaretti recipe</p>\n<p>-Sweet Boutique Apron</p>\n<p>-1.5 KG of amaretti to take home</p>\n<p>-Wine, Champagne, Coffee &amp; Sweets at the venue</p>\n<p>&nbsp;</p>\n<p><strong>FAQs</strong></p>\n<p>&nbsp;</p>\n<p><strong>What are my parking options at the event?</strong></p>\n<p>There is plenty of FREE parking at the venue.&nbsp;</p>\n<p>&nbsp;</p>\n<p><strong>Where can I contact the organizer with any questions?</strong></p>\n<p>Please contact Isabella at 905-851-8388 x224.</p>\n<p>&nbsp;&nbsp;</p>\n<p><strong>Do I have to bring my printed ticket to the event?</strong></p>\n<p>Please bring either a printed out copy of your ticket to the event, or proof of ticket purchase through eventbrite.ca email confirmation.</p>\n<p>&nbsp;</p>\n<p><strong>What is the refund policy?</strong></p>\n<p><em>Cancellation limited time:</em></p>\n<p>Please understand, due to organization and cost of ingerdients, cancellations must be received 72 hours (3 full days) prior to the start of the class.</p>\n<p><em>Cancellations received after the limited time:</em></p>\n<p>We do not offer refunds or class credit for cancellations receive later than 72 hours (3 full days) prior to the start of class.</p>\n<p><em>Cancellations received before the limited time:</em></p>\n<p>We do not offer refunds for cancellations prior to the limited time. Store credit is offered. Credit may be applied to another class of your choice or can be transferred to a friend.</p>\n<p><em>Cancellation of class by the Chef:</em></p>\n<p>In the unlikely event that the chef needs to cancel a class, your credit will be applied to another class of your choice or you can request a refund in writing including the class registration details, your name, signature and mailing address to: isabella@sweetboutique.ca.</p>', 49, 'http://localhost:9000/uploads/events/1a0b88bd-fa4d-47e2-a554-be6af7e5903a.evbuc', '830 Rowntree Dairy Rd, Woodbridge, ON L4L 5V8, Canada', 0, NULL, '2016-10-24 19:00:00', '2016-10-24 21:00:00', 0, '2016-10-19 00:25:44', '2016-10-19 06:34:13', '43.7798101000', '-79.5707552000'),
(8, 'Get Fired Up with Traeger in Mississauga', '<p>With a Traeger grill, you have the freedom to fire up healthy and delicious wood-fired food every day of the week. Smoke, bake, grill, roast, braise, and barbecue your way into the hearts of those you feed. A Traeger grill enhances your recipes with flavor and transforms them into memorable meals.&nbsp;So come check out our live Traeger demo in Mississauga, and let the expert show you just how satisfying it is grilling on a Traeger.</p>\n<p>&nbsp;</p>\n<hr />\n<h3>&nbsp;</h3>\n<h4>Saturday October 22nd, 2016 - LIVE GRILLING DEMO&nbsp;</h4>\n<p>TA Appliances &amp; Barbecues at 1655 Dundas St E Unit B, Mississauga</p>\n<p>11:00am - 4:00pm **Weather permitting**</p>\n<p>- Live demo on the Traeger grill</p>\n<p>- Tutorials on loading pellets, grilling, smoking and more!</p>\n<p>- Q&amp;A with our on hand expert</p>\n<p>- Come check us out!</p>', 51, 'http://localhost:9000/uploads/events/5da11fac-420a-48f1-9c21-7862bca4bc87.evbuc', '1655 Dundas St E, Mississauga, ON L4X 2Z3, Canada', 0, NULL, '2016-10-22 11:00:00', '2016-10-22 16:00:00', 0, '2016-10-19 00:29:48', '2016-10-19 00:29:48', '43.6152147000', '-79.5788255000'),
(9, 'Importing A Taste of Home: A Special Event at the Pasquale Brothers Warehouse', '<p>Pasquale Brothers has been a family run business since 1917. When Edward Pasquale, an Italian immigrant, founded the company in the historic Ward its sole purpose was to supply fellow Italian immigrants with familiar foods. It quickly grew in popularity and Torontonians beyond the Italian community began to frequent the shop. Pasquale Brothers soon became a go to destination for the rapidly growing and diverse population of Toronto eventually growing to manufacture its own products.&nbsp; </p>\n<p>In 1969 the family decided to focus its energy on the store they opened at 145 King Street East where their passion for food flourished, and the manufacturing end was consolidated into the Unico brand.</p>\n<p>The store on King soon became a gathering place for people with a passion for food. Chefs mingled with customers; recipes, cooking tips and travel adventures were all exchanged right in the midst of the store and amongst the very ingredients that often became the topic of conversation.</p>\n<p>Now, on the eve of the company''s 100th anniversary, join the Pasquale family in their warehouse and uncover the family stories behind one of Toronto''s most recognized food brands.</p>\n<p><strong>Host: Anna Marie Kalcevich</strong></p>\n<p>Thirteen years ago the company moved its operations to Etobicoke. It is now owned by Anna Marie Kalcevich, the granddaughter of Edward C. Pasquale Sr. and the daughter of his son-in-law Henry Madott, who once ran the company. Anna Marie is the third generation of the family to run Pasquale Brothers.</p>\n<p>Join Anna Marie and her family for this exciting event as she shares her family''s story in the heart of the Pasquale Brothers warehouse.</p>\n<p><strong>SPONSORS</strong></p>\n<p><strong><img src="https://cdn.evbuc.com/eventlogos/166587522/pblogo.jpg" /></strong></p>\n<p><strong><img src="https://cdn.evbuc.com/eventlogos/166587522/collectiveartslogoart2bbrewinground.jpg" /></strong></p>\n<p>&nbsp;</p>', 51, 'http://localhost:9000/uploads/events/fe2eddd7-7210-4339-9665-4943d82b3281.evbuc', '16 Goodrich Rd, Etobicoke, ON M8Z 2H1, Canada', 1, NULL, '2016-11-26 18:00:00', '2016-11-26 21:00:00', 0, '2016-10-19 00:33:55', '2016-10-21 03:03:37', '43.6282166000', '-79.5258236000'),
(10, 'Technology Job Fair- CASIP', '<p class="MsoBodyText3">Technology Job Fair hosted by CASIP (Consortium of Agencies Serving Internationally-trained Persons) for:</p>\n<p class="MsoHeader">&nbsp;Highly Skilled Professional Newcomers to Canada&nbsp;</p>\n<p class="MsoHeader">This event is coordinated by CASIP (Consortium of Agencies Serving Internationally trained Persons) and CASIP''s 11 Partner Organizations: <strong>ACCES Employment, CollegeBoreal, COSTI, Humber, Job Skills, JobStart, JVS, MicroSkills, Skills for Change, Seneca and WoodGreen</strong>.&nbsp;</p>\n<ul>\n<li>\n<p>This is a great opportunity to meet with local employers from across the Greater Toronto Area who are looking to hire newcomers.</p>\n</li>\n<li>\n<p>This event is for internationally trained professionals who have technical experience or would like to work in technological industries.</p>\n</li>\n<li>\n<p>There will be onsite interviews and resume critiques.</p>\n</li>\n<li>\n<p>Participating companies and their vacant positions will be announced closer to the event.</p>\n</li>\n</ul>', 51, 'http://localhost:9000/uploads/events/26e7bbb0-e25d-4b53-b5cf-d31ba37bec32.evbuc', '44 Peel Centre Dr, Brampton, ON L6T 0E2, Canada', 0, NULL, '2016-10-26 15:00:00', '2016-10-26 19:00:00', 0, '2016-10-19 00:40:09', '2016-10-19 06:33:49', '43.7158140000', '-79.7260970000'),
(11, 'If I could show you a way to make money with your smartphone', '<div>\n<h2 class="_1mf _1mj">Learn why business owners, professionals, busy moms, retirees, Gen Y and Z''ers are taking advantage of this company and how YOU CAN TOO!</h2>\n</div>\n<div class="_1mf _1mj">&nbsp;</div>\n<div class="_1mf _1mj">Come join us and see how much fun, easy and creative this can be for you. http://bit.ly/make-money-with-your-smartphone</div>\n<div class="_1mf _1mj">&nbsp;</div>\n<div class="_1mf _1mj">See how much fun putting your friends, family and others Facebook pictures into a card and sending it to them can be and oh yeh, how will they react when you include 2 of the best tasting brownies you have ever tasted.</div>\n<div class="_1mf _1mj">&nbsp;</div>\n<div class="_1mf _1mj">Discover how people are benefiting from this system and financial opportunity attached -- people are leveraging the opportunity in their spare time, alongside what they already do.</div>\n<div class="_1mf _1mj">&nbsp;</div>\n<div class="_1mf _1mj">If you are a scrapbooker, you will love this system!</div>\n<div class="_1mf _1mj">&nbsp;</div>\n<div class="_1mf _1mj">If you are a business person looking to convert more leads, you will be fully impressed with what this will do to your conversion rate.</div>\n<div class="_1mf _1mj">&nbsp;</div>\n<div class="_1mf _1mj">Whether you''re an existing customer, simply curious, or searching for something to enhance your existing business or personal life, this is an event ANYONE can benefit from.</div>\n<div class="_1mf _1mj">&nbsp;</div>\n<div class="_1mf _1mj">Hundreds of thousands of people around the world have been using this system for years and NOW that we''ve gone mobile, we''re on track to becoming a billion-dollar company and global household name.</div>\n<div class="_1mf _1mj">&nbsp;</div>\n<div class="_1mf _1mj">Thursday, October 20, 2016 7:00 pm</div>\n<div class="_1mf _1mj">&nbsp;</div>\n<div class="_1mf _1mj">Blackthorn Group</div>\n<div class="_1mf _1mj">2120 North Park Dr. Suite #9</div>\n<div class="_1mf _1mj">Brampton, ON</div>\n<div class="_1mf _1mj">L6S 0C9</div>\n<div class="_1mf _1mj">&nbsp;</div>\n<div class="_1mf _1mj">Register now to secure your spot. Seating is limited.</div>\n<div>\n<h2 class="_1mf _1mj">http://bit.ly/make-money-with-your-smartphone</h2>\n</div>', 47, 'http://localhost:9000/uploads/events/e0b4782b-b1ee-4663-886f-a04656a8e8e9.evbuc', '2120 N Park Dr, Brampton, ON L6S 0C9, Canada', 0, NULL, '2016-10-20 19:00:00', '2016-10-20 21:00:00', 0, '2016-10-19 00:46:22', '2016-10-19 06:25:24', '43.7506687000', '-79.7268173000'),
(12, 'CREATIVE EXCHANGE | CONNECTING THE ARTS | DECEMBER 14, 2016', '<p class="MsoNormal"><strong>NETWORKING EVENT WITH GUEST SPEAKER</strong></p>\n<p class="MsoNormal">Join your colleagues at the Creative Exchange networking event. Connecting artists, artisans and arts groups in all arts disciplines, to each other and to Arts and Culture staff at the City of Brampton. This is an opportunity to discuss topics ranging from inspiration to initiatives with like-minded creative individuals and organizations in the home of Brampton&rsquo;s performing arts, The Rose Theatre.</p>\n<p class="MsoNormal">We will be meeting in the Studio at the Rose Theatre and enjoying coffee and snacks from 7:00PM to 8:30PM. Parking is complimentary in the Rose Theatre''s underground parking lot.&nbsp;A guest speaker is on the agenda for this meeting, but you''ll need to attend to find out who it is and what they''ll be talking about! It''s always enjoyable to learn something new!</p>\n<p class="MsoNormal">The City of Brampton Arts and Culture team will update attendees on initiatives and opportunities available, and plenty of time will be available for connecting with each other. Registration is required, please.</p>\n<p class="MsoNormal">For more information, please contact Joan Doane, Coordinator, Cultural Development, Arts and Culture, City of Brampton at 905-874-3439 or email<span class="apple-converted-space">&nbsp;</span><a href="mailto:joan.doane@brampton.ca" target="_blank" rel="noopener noreferrer nofollow">joan.doane@brampton.ca</a>.&nbsp;</p>\n<p class="MsoNormal">To subscribe to the Creative Exchange newsletter for updates and relevant news, click&nbsp;<a href="http://www.brampton.ca/sites/Rose-Theatre/EN/plan-your-experience/Pages/e-newsletter.aspx" target="_blank" rel="noopener noreferrer nofollow">HERE</a>.&nbsp;</p>', 47, 'http://localhost:9000/uploads/events/349c5f0a-c88b-42e8-a309-49443a4441e0.evbuc', '1 Theatre Ln, Brampton, ON L6V 0A3, Canada', 0, NULL, '2016-12-14 19:00:00', '2016-12-14 20:30:00', 0, '2016-10-19 00:50:50', '2016-11-16 14:47:13', '43.6871407000', '-79.7601445000'),
(13, 'Looking for a Business Opportunity? We can help', '<p>Join us on this night to get alot knowledge about how to build and grow your existing business and/or start a new business with very low investment cost.&nbsp;Through our platform, we make a positive difference for families and individuals throughout North America.</p>\n<p>&nbsp;</p>\n<p>Our business platform provides our associates with the resources they need to build their own businesses and find limitless success by serving everyday individuals and families who are often overlooked by the financial services industry. This platform helps people create financial turning points that can lead to better futures.&nbsp;</p>\n<p>&nbsp;</p>\n<p>Please come and ask for Jazz, or contact at 416-887-2664. (jgfinance02@gmail.com)</p>\n<p>Please invite your friends and family members.&nbsp;</p>\n<p>"If you dont build your bild your dreams, someone else will hire you to help build theirs"</p>\n<p>&nbsp;</p>', 40, 'http://localhost:9000/uploads/events/0fa91e3d-4f4f-41c2-8fe9-76fd8598f488.evbuc', '1332 Khalsa Dr, Mississauga, ON L5S 0A2, Canada', 0, NULL, '2016-10-19 18:30:39', '2016-10-19 20:00:00', 0, '2016-10-19 06:13:39', '2016-10-19 06:13:39', '43.6735273000', '-79.6780402000'),
(14, 'October Toronto Regional Event', '<p>Friday, October 21 - 7pm to 10pm (Ticket Required)</p>\n<p>Saturday October 22 -10am - 11am BOM Free / 11am-2pm Training (Ticket Required)</p>\n<p>Please note there will be no lunch break</p>\n<p>TICKETS NON REFUNDABLE</p>\n<p>ABSOLUTELY NO SAVING SEATS PLEASE!</p>', 40, 'http://localhost:9000/uploads/events/90b13103-0254-47c0-88cf-f25fabff9c7a.evbuc', '272 Attwell Dr, Etobicoke, ON M9W 6M3, Canada', 0, NULL, '2016-10-21 19:00:00', '2016-10-22 09:00:00', 0, '2016-10-19 06:17:21', '2016-10-19 06:17:21', '43.6957576000', '-79.5916404000'),
(15, 'AFC6 AT NASHVILLE NORTH', '<p>Ace Fighting Championships returns to Nashville North on November 11th 2016 as AFC Champion Adam DeFreitas puts his belt on the line along with a full list of exciting bouts sure to please any MMA enthusiast. Join us as our event is recorded for the first time to be aired on The Fight Network. Make sure to get your tickets and come to the event early, as our event at Nashville North last time was sold out!! See you November 11th at Nashville North!</p>\n<p>&nbsp;</p>', 40, 'http://localhost:9000/uploads/events/26a0a72d-70d2-4a59-a2d7-8e1b808cfdce.evbuc', '530 Guelph St, Norval, ON L0P 1K0, Canada', 1, NULL, '2016-11-11 19:00:00', '2016-11-11 23:30:00', 0, '2016-10-19 06:22:53', '2016-10-19 06:22:53', '43.6469895000', '-79.8574998000'),
(16, 'LOLË FALL SERIES: OPEN YOUR HEART WITH ALLIE', '<p>Come celebrate Fall&nbsp;with Lol&euml;&nbsp;and join us in continuing our series of free heath and fitness meet-ups happening every month.&nbsp;</p>\n<p>Join us Sunday, October 23rd at 10:00am for some morning yoga! Our very own Allie Day will be leading a heart opening sequence that will focus on back bends and shoulder openers.&nbsp;</p>\n<p>The class will take place in the store and all on site participants will receive a Lol&euml;&nbsp;gift bag.&nbsp;The yoga session will run from 10:00 to 11:00 and will be followed by some light snacks and refreshments.&nbsp;&nbsp;Please bring your own yoga mat and water bottle.</p>', 43, 'http://localhost:9000/uploads/events/c7028142-b1df-46ad-9560-34ac055e57fb.evbuc', '13850 Steeles Ave, Halton Hills, ON L0P, Canada', 0, NULL, '2016-10-23 10:00:00', '2016-10-23 11:00:00', 0, '2016-10-19 06:28:59', '2016-10-19 06:28:59', '43.5752794000', '-79.8295941000'),
(17, 'SAMBA FITNESS WORKSHOP', '<p><img src="https://cdn.evbuc.com/eventlogos/32577315/unnamed2-1.jpg" /></p>\n<h2><strong>THIS EVENT IS ORGANIZED BY SAMBA PASSISTAS TORONTO</strong></h2>\n<p>&nbsp;</p>\n<p>I&nbsp;am an experienced professional dancer and teacher trained in Paris by the renowned training institute Rick Odums. Skilled in Samba, Dancehall, Hip hop (Ladies Style), Bachata, Afro Jazz etc.&nbsp;<br /><br />I am now offering a&nbsp;Samba Fitness&nbsp;class for all.<br /><br />When? Saturday Oct. 29th&nbsp;<br />Time : 6.30-7.30 pm&nbsp;<br /><br />To pre register for the workshop, send an email to&nbsp;<a target="_blank" rel="noopener noreferrer nofollow">sambapassistas@gmail.com</a>&nbsp;with your name.</p>', 43, 'http://localhost:9000/uploads/events/73b55081-2236-4751-93c9-418363db7361.evbuc', '427 Bloor St W, Toronto, ON M5S 1X6, Canada', 1, NULL, '2016-10-29 18:30:00', '2016-10-29 19:30:00', 0, '2016-10-19 06:32:36', '2016-10-19 06:32:36', '43.6660231000', '-79.4056810000'),
(18, 'Information Session: OAC Artists in the Community/Workplace Grant', '<div class="js-xd-read-more-contents l-mar-top-3">\n<p>To encourage artists and arts organizations from all arts disciplines to work with communities through a collaborative co-creative process, the Ontario Arts Council offers the Artists in the Community/Workplace Grant. The grant is designed to integrate the arts into community life through artistic projects. This information session will be an opportunity for artists to learn about the grant, how to write the grant, as well as what projects are eligible for the program.</p>\n<p><br />You can check out the grant application and guidelines on the OAC website:&nbsp;<a href="http://arts.on.ca/Page95.aspx" target="_blank" rel="noopener noreferrer nofollow">arts.on.ca/Page95.aspx</a><br /><br />Who knows, your next community-engaged art project could begin here! Want to learn more? Attend our free info session!<br /><br />Event Image: Camille Turner, 5&amp;Dime Walking Tour, 2014. Photo: Leah Snyder</p>\n</div>', 46, 'http://localhost:9000/uploads/events/2b383519-5695-49ed-ab18-79db3df4fb09.evbuc', '300 City Centre Dr, Mississauga, ON L5B 2G6, Canada', 0, NULL, '2016-11-10 18:30:00', '2016-11-10 20:00:00', 0, '2016-10-19 06:38:29', '2016-10-19 11:17:02', '43.5887716000', '-79.6443947000'),
(19, 'Groomology 101 Presents The 1st Annual Halloween Barber Battle & Bash', '<div class="has-user-generated-content js-d-read-more read-more js-read-more read-more--medium-down read-more--expanded" data-xd-wired="read-more">\n<div class="js-xd-read-more-toggle-view read-more__toggle-view">\n<div class="js-xd-read-more-contents l-mar-top-3">\n<p>GROOMOLOGY 101 has returned with our first annual Barber Battle &amp; Bash. Our focus is on education, competition and celebrationg the great state of our industry. On October 30th 2016 we will come together as one to learn, to grow and to celebrate as North American Barbers &amp; Hairstylists!</p>\n<p>REGISTER NOW</p>\n<p>Judges and Educators:</p>\n<p>Mr. Official</p>\n<p>Los Cut It</p>\n<p>Moody</p>\n<p>Famos</p>\n<p>Barbers Inc TV</p>\n<p>&amp; Special Guests</p>\n<p><br /> Contact for more info and vendor opportunities:</p>\n<p>Adam 905-867-7913 | adam@adamtheapprentice.com</p>\n<p>Shawn 416-545-7630</p>\n<p>Khan 416-666-1515</p>\n</div>\n</div>\n<div class="js-xd-read-more-toggle-director read-more__toggle-director l-pad-bot-4 l-sm-pad-bot-3"><a class="read-more__more" data-read-type="ReadMore" data-checkpoint-name="read_more">Read more</a> <a class="read-more__less" data-read-type="ReadLess" data-checkpoint-name="read_less">Read less</a></div>\n</div>', 48, 'http://localhost:9000/uploads/events/5e789603-751c-48bc-9522-5f8664a4e29f.evbuc', '1224 Dundas St E, Toronto, ON M4M 1S3, Canada', 0, NULL, '2016-10-30 09:00:00', '2016-10-30 23:30:45', 0, '2016-10-19 10:37:01', '2016-10-20 15:58:59', '43.6652873000', '-79.3406142000'),
(20, 'Magic and Martini - James Alan', '<div class="has-user-generated-content js-d-read-more read-more js-read-more read-more--medium-down read-more--contents-overflow read-more--expanded" data-xd-wired="read-more">\n<div class="js-xd-read-more-toggle-view read-more__toggle-view is-active" style="max-height: 1292px;">\n<div class="js-xd-read-more-contents l-mar-top-3">\n<h3><em>"James Alan blew us away! We wanted to see more"</em><br />&nbsp; &nbsp; &nbsp; -CP24</h3>\n<h3><strong><em>"Fantastic... it turns out magic really </em>is<em> for grownups."&nbsp;</em><br />&nbsp; &nbsp; &nbsp; -Globe Reivew</strong></h3>\n<p>Enjoy cocktails and cuisine while watching one of the world''s best conjurers, <a href="http://www.jamesalan.ca" target="_blank" rel="noopener noreferrer nofollow">James Alan</a>, in a full evening show. You and your astonished guests will experience an evening quite unlike any theatrical performance you have ever encountered.</p>\n<p>An intimate evening of world class conjuring and cocktails in an elegant private club atmosphere! Your full details will be provided to you in confidence once you''ve purchased your tickets and made your reservation.</p>\n<p><img src="https://scontent-yyz1-1.xx.fbcdn.net/t31.0-8/12525652_1046936312043866_3501315913942188531_o.jpg" alt="Magic and Martini Poster" /></p>\n<p><strong>6:30</strong>&nbsp;- Doors Open<br /><strong>7:30</strong>&nbsp;- ShowTime</p>\n<p>Tickets include:</p>\n<p>* The secret&nbsp;<em>Password</em>&nbsp;to enter our Private Magic &amp; Martini Club for the evening&nbsp;</p>\n<p>* Admission to an astonishing performance by&nbsp;<em><strong>James Alan</strong></em>, one of the finest classic magicians in the world</p>\n<p>* Grand Spirits Cocktail Pamphlet &amp; Recipes for crafting at home</p>\n<p>*&nbsp;<a title="Grand Spirits" href="http://www.artofgin.com/" target="_blank" rel="noopener noreferrer nofollow">Grand Spirits</a>&nbsp;Society Membership &amp; Privledges for 2016!</p>\n<h2>Seating is limited.&nbsp;<em>Evenings will Sell Out well before performance dates.&nbsp;Please reserve your space as soon as possible. For more information, visit <a href="http://www.magicandmartini.ca" target="_blank" rel="noopener noreferrer nofollow">www.MagicAndMartini.ca</a>.&nbsp;</em></h2>\n<p>Dress Code: Cocktail Dresses and Jackets &amp; Ties</p>\n<p>Please Note: Restricted to 19+.&nbsp;Dinner, Drinks, Desserts, Gratuities Extra.&nbsp;<em>Outstanding Food &amp; Drink Options available for purchase separately.&nbsp;</em></p>\n</div>\n</div>\n<div class="js-xd-read-more-toggle-director read-more__toggle-director l-pad-bot-4 l-sm-pad-bot-3 is-active"><a class="read-more__more" data-read-type="ReadMore" data-checkpoint-name="read_more">Read more</a> <a class="read-more__less" data-read-type="ReadLess" data-checkpoint-name="read_less">Read less</a></div>\n</div>', 48, 'http://localhost:9000/uploads/events/5f87b9ad-952c-4ed3-abb5-e52745fe45a7.evbuc', '136 Church St, Oakville, ON L6J 1M9, Canada', 0, NULL, '2016-10-21 18:30:00', '2016-10-21 21:30:00', 0, '2016-10-19 10:52:49', '2016-10-19 10:52:49', '43.4446891000', '-79.6704043000'),
(21, 'Arvinda''s Curries From All Around Asia cooking class', '<div class="has-user-generated-content js-d-read-more read-more js-read-more read-more--medium-down read-more--expanded" data-xd-wired="read-more">\n<div class="js-xd-read-more-toggle-view read-more__toggle-view">\n<div class="js-xd-read-more-contents l-mar-top-3">\n<p>In this class, we&rsquo;re featuring curries from all around Asia discussing which ingredients make each one unique. Our journey starts in North India highlighting Creamy Almond Chicken Curry. Our next dish is Malaysian-Style Fragrant Chicken Curry and then to Thailand for a Lemongrass Green Tofu Curry. Our curries are served with Scented Jasmine Rice and with a refreshing Ginger Infused Pineapple Juice, finished with Lemongrass Masala Chai. Bring these warming and aromatic Asian curries into your home for the cooler weather!</p>\n</div>\n</div>\n<div class="js-xd-read-more-toggle-director read-more__toggle-director l-pad-bot-4 l-sm-pad-bot-3"><a class="read-more__more" data-read-type="ReadMore" data-checkpoint-name="read_more">Read more</a> <a class="read-more__less" data-read-type="ReadLess" data-checkpoint-name="read_less">Read less</a></div>\n</div>', 48, 'http://localhost:9000/uploads/events/4e1efce3-4812-4665-8d7b-02a05f8fd006.evbuc', '301 Cornwall Rd, Oakville, ON L6J 7Z5, Canada', 0, NULL, '2016-10-22 12:00:00', '2016-10-22 14:30:00', 0, '2016-10-19 10:58:17', '2016-10-19 10:58:17', '43.4566574000', '-79.6791886000'),
(22, 'BollyWood Scream Halloween Haunt', '<div class="has-user-generated-content js-d-read-more read-more js-read-more read-more--medium-down read-more--expanded" data-xd-wired="read-more">\n<div class="js-xd-read-more-toggle-view read-more__toggle-view">\n<div class="js-xd-read-more-contents l-mar-top-3">\n<p>808 Enterianment &amp; DJ SHUJA Present .. BOLLYWOOD SCREAM HALLOWEEN PARTY inside the Luxurious Atmosfera Resto Lounge, Mississauga .. Dress up in your scariest. sexiest and darkest costume and dance the NIGHT away at the Number one Bollywood Party in the West End, with Canada''s Most Requested and 808 entertainment''s Bollywood Guru... DJ SHUJA<br />Bollywood. Top 40. Bhangra.<br />Limited Early Bird Tickets $20.00.. More at the Door<br />For Booths and Bottle Service contact us at &nbsp;416 617 9287</p>\n</div>\n</div>\n<div class="js-xd-read-more-toggle-director read-more__toggle-director l-pad-bot-4 l-sm-pad-bot-3"><a class="read-more__more" data-read-type="ReadMore" data-checkpoint-name="read_more">Read more</a> <a class="read-more__less" data-read-type="ReadLess" data-checkpoint-name="read_less">Read less</a></div>\n</div>', 41, 'http://localhost:9000/uploads/events/188e3278-288e-4e25-8d82-d86f17975795.evbuc', '6781 Hurontario St, Mississauga, ON L5T 2X9, Canada', 0, NULL, '2016-10-29 22:00:00', '2016-10-30 02:30:00', 0, '2016-10-19 11:05:05', '2016-10-19 11:05:05', '43.6425767000', '-79.7005896000'),
(24, 'Drum Circle', '<div class="has-user-generated-content js-d-read-more read-more js-read-more read-more--medium-down read-more--collapsed read-more--contents-overflow" data-xd-wired="read-more">\n<div class="js-xd-read-more-toggle-view read-more__toggle-view">\n<div class="js-xd-read-more-contents l-mar-top-3">\n<p class="gmail_msg">It''s the very first<a title="Orrett Music Academy" href="http://www.orrrettmusicacademy.com" target="_blank" rel="noopener noreferrer nofollow">&nbsp;<span class="lG">Orrett</span>&nbsp;Music Academy</a> Drum Circle! And you are invited!! All are welcome, from ages 8 and up, beginner to advanced, to join the circle and have some fun drumming.</p>\n<p class="gmail_msg">Learn new methods and make some new friends as&nbsp;<span class="lG">Orrett</span>&nbsp;drum instructor Charlie McKittrick leads the circle through group-oriented exercises that focus on the basic fundamentals of rhythm, improvisation, listening and timing.</p>\n<p class="gmail_msg">Rhythm is an innate human instinct that lives inside all of us. If you can tap your foot, you can drum! You can drum alone or with friends in the living room, at the campsite, in your car and so many other places! It''s time to connect with your inner drummer and feel the rhythmic energy flow through you.</p>\n</div>\n</div>\n</div>', 41, 'http://localhost:9000/uploads/events/c178346a-49f5-4cac-b391-1d2d0e55e35a.evbuc', '3107 Bloor St W, Etobicoke, ON M8X 1E2, Canada', 0, NULL, '2016-11-02 19:00:00', '2016-12-01 05:00:00', 0, '2016-10-19 11:11:10', '2016-12-01 06:27:25', '43.6460797000', '-79.5160644000'),
(25, 'International Project Management Day Toronto Celebrations', '<div class="has-user-generated-content js-d-read-more read-more js-read-more read-more--medium-down read-more--expanded" data-xd-wired="read-more">\n<div class="js-xd-read-more-toggle-view read-more__toggle-view">\n<div class="js-xd-read-more-contents l-mar-top-3">\n<p>This free 1-day mini-conference takes place on the first Thursday of November each year.&nbsp;In 2016, the event will be held on November 3rd at the Travelodge Dixon Road Hotel at the corner of Dixon &amp; Carlingview in Toronto, near the Pearson airport. Admission is FREE (just nominal $25 to cover catering)&nbsp; -- mention it to your friends. (And, yes, you get PDUs, CEUs and other professional recertification credits for attending.)&nbsp; This year the event will be co-sponsored by several organizations including Procept Associates, PMI, Project Management Association of Canada, GenXus Management Consulting, and others.</p>\n<p>The 2016 lineup will include five speakers.</p>\n<hr />\n<p>&nbsp;</p>\n<p><strong>AGENDA</strong>:</p>\n<p>08:00 &nbsp;Registration &amp; continental breakfast</p>\n<p>08:30 &nbsp;Welcome and introductions</p>\n<p>09:00 &nbsp;<strong><em>Make it So, Number One: Why many projects'' chance for success is doomed and how to fix it</em><br />by <a href="https://nebula.wsimg.com/1266a9afc06fa61ba097105b6fe7b637?AccessKeyId=312C5D60F30E02EA74BD&amp;disposition=0&amp;alloworigin=1" target="_blank" rel="noopener noreferrer nofollow">Ori Schibi,&nbsp;MBA, PMP, PMI-PBA</a></strong></p>\n<p>The goal of this dynamic and exciting session is to explore ways to improve project management and the way we manage projects, which will lead to better results, value and organizational benefits. We will do so by looking at why so many projects do not end up delivering success, and what to do in order to get out of this cycle.</p>\n<p>10:15 &nbsp;Networking &amp; Refreshments Break</p>\n<p>10:30 &nbsp;<strong><em>The Communication Connection: Get it Right in Our Virtual World</em><br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;by <a href="http://procept.com/team/claire-sookman" target="_blank" rel="noopener noreferrer nofollow">Claire Sookman</a></strong></p>\n<p>Virtual teams must learn to work together as if they were in the same room. The balance of any great team is dependent on the interaction of different personality types. In this one hour&nbsp;session,&nbsp;we will use the DiSC Behavioral Profile to address two of the most common challenges that virtual teams face: connection and communication. Gaining insight into these elements can help us understand how to build stronger and more successful virtual teams. At the end of the session participants will be able to describe the strengths and challenges each style brings to the team and develop strategies for identifying and adapting to others&rsquo; styles.</p>\n<p>11:45 &nbsp;Prize Draw &amp; PM research survey</p>\n<p>Noon &nbsp;Complimentary Lunch &amp; Networking</p>\n<p>12:30 &nbsp;Introducing the Final Stage of the 6th Annual Project Management Paper Competition and Announcing the Opening of the 2017 (7th) Competition</p>\n<p>12:45 &nbsp;Paper Competition Finalist Round: Team 1</p>\n<p>13:15 &nbsp;Paper Competition Finalist Round: Team 2</p>\n<p>13:45 &nbsp;<strong><em>The Risks Inherent in Planning for and Delivering Promised Value &amp; Benefits</em><br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;by <a href="http://www.atocrates.com/about-us/" target="_blank" rel="noopener noreferrer nofollow">Dr. Bud Lush</a></strong></p>\n<p>Integrated project planning is a process- and expertise-driven approach to ensuring project success. As project managers and leaders of highly-qualified teams, you need to understand how the many elements of the product scope and project scope are connected and the risks associated with them. Through a collaborative and inclusive process, you can develop an effective, well-designed plan providing enhanced assurance of successful project completion. Furthermore, critical to the success of projects is an ongoing rigorous integrated risk assessment and management process. As not all processes, procedures, or functions perform as expected, your experience, along with a pre-defined risk assessment and management process, will enable you to factor in current possibilities and work closely with your extended team to execute a plan and utilize contingencies as necessary. Pre-defined risk assessment and management processes will greatly enhance you and your team''s ability to deliver the value and benefits anticipated by your stakeholders.</p>\n<p>Learn the PM&rsquo;s key responsibilities throughout a project, how to keep key stakeholders and the team committed throughout the project, the Golden Rules of project risk management, six detailed processes critical to effective risk management, what to look for and what questions to ask to get a true picture of project status, and how to apply practical risk management techniques in the planning, tracking and health monitoring of your project.</p>\n<p>15:00 &nbsp;Networking &amp; Refreshments Break</p>\n<p>15:15 &nbsp;PMP Paper Competition Winner Announcement and Awards Presentation</p>\n<p>15:30 &nbsp;<strong><em>Learning Agility: The New Differentiator</em><br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;by <a href="http://procept.com/team/bill-richardson" target="_blank" rel="noopener noreferrer nofollow">Bill Richardson</a></strong></p>\n<p class="MsoNormal">This session will help project managers develop the most important differentiator for successfully managing projects at today&rsquo;s speed of change&mdash;learning agility, defined as the ability to stay open to new ways of thinking and to continuously learn new skills&mdash;understand why it&rsquo;s important, how to enable it, and what it looks like when done right.</p>\n<p>16:45 &nbsp;Wrap Up</p>\n<p>17:00 &nbsp;Close</p>\n</div>\n</div>\n<div class="js-xd-read-more-toggle-director read-more__toggle-director l-pad-bot-4 l-sm-pad-bot-3"><a class="read-more__more" data-read-type="ReadMore" data-checkpoint-name="read_more">Read more</a> <a class="read-more__less" data-read-type="ReadLess" data-checkpoint-name="read_less">Read less</a></div>\n</div>', 53, 'http://localhost:9000/uploads/events/1d9e6e53-c2ff-4f4c-a200-53092344fe3b.evbuc', '925 Dixon Rd, Etobicoke, ON M9W 1J8, Canada', 0, NULL, '2016-11-03 20:00:00', '2016-11-03 16:30:00', 0, '2016-10-21 02:00:40', '2016-10-21 02:00:40', '43.6861588000', '-79.5962318000'),
(27, 'capstone prsentation', '<p>description here vgsfgfgfsg</p>', 41, 'http://localhost:9000/uploads/events/59285ff7-20f4-4b40-8fbe-f28e3c60590a.PNG', '898 Tambourine Terrace, Mississauga, ON L5W 1R5, Canada', 0, NULL, '2016-10-21 13:19:42', '2016-10-21 13:19:42', 0, '2016-10-21 12:20:34', '2016-10-21 12:20:34', '43.6205896000', '-79.7135910000');

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
(8, 10, 9),
(9, 11, 9),
(10, 12, 9),
(11, 13, 9),
(12, 14, 9),
(13, 14, 6),
(14, 15, 3),
(15, 16, 4),
(16, 16, 3),
(17, 17, 4),
(18, 17, 3),
(19, 18, 8),
(20, 19, 16),
(21, 19, 8),
(22, 20, 8),
(23, 21, 17),
(24, 22, 10),
(26, 24, 10),
(27, 25, 9),
(29, 8, 17),
(32, 9, 17),
(33, 5, 9),
(34, 3, 9),
(35, 2, 6),
(36, 2, 15),
(37, 7, 17),
(38, 4, 5),
(39, 6, 6),
(40, 27, 8);

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
(1, 48, 19, 0, 1),
(2, 41, 9, 1, 0),
(3, 41, 12, 0, 1),
(5, 41, 27, 0, 1),
(6, 41, 5, 0, 1),
(7, 41, 24, 0, 1),
(8, 29, 24, 1, 0);

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
(41, NULL, NULL, 'jwilliams199055@gmail.com', 'jlive', '$2a$10$J5B54RrO0TAZly4WCw6Td.ouDnfxGxIOciyqKPnksFilhf9biEjbC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'local', 0, '2016-10-18 14:36:32', '2016-10-18 14:36:32', NULL),
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
(54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '10157603110180599', 'EAAPx5RfJ3gwBABcaipNoJIXnWduv5DQCTMOJZAxTFnbPgOKqKmagZAmSZC3YZBpJvvr1VDPcGCbcU672b3RNOBtL0dwa0gimjcFZBaoSPCa5W9VSs8VQ7EVgWzZBY62CYgbjIkG40HImmYyFjZBevdGLE30t8DekHsZD', 'Josh Williams', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'facebook', 0, '2016-11-16 14:19:04', '2016-11-16 14:19:04', NULL);

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
(1, 29, 12),
(2, 29, 5),
(3, 40, 12),
(4, 40, 10),
(5, 40, 7),
(6, 43, 5),
(7, 43, 11),
(9, 46, 10),
(10, 46, 2),
(11, 46, 7),
(13, 41, 12),
(15, 41, 18),
(17, 41, 3),
(18, 41, 19),
(19, 53, 9),
(20, 54, 12),
(23, 29, 24),
(24, 30, 24),
(25, 31, 24);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `events_categories`
--
ALTER TABLE `events_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `users_categories`
--
ALTER TABLE `users_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users_events`
--
ALTER TABLE `users_events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
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
  ADD CONSTRAINT `events_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `events` (`id`),
  ADD CONSTRAINT `events_categories_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  ADD CONSTRAINT `ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

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
  ADD CONSTRAINT `users_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `users_categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users_events`
--
ALTER TABLE `users_events`
  ADD CONSTRAINT `users_events_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  ADD CONSTRAINT `users_events_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users_friends`
--
ALTER TABLE `users_friends`
  ADD CONSTRAINT `users_friends_friend_id_foreign` FOREIGN KEY (`friend_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_friends_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
