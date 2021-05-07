-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 02, 2021 at 11:33 AM
-- Server version: 5.7.24
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `garisung_ashley_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE `activations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, '0OYMIdJY4CBv0NpkWEvLBueNyusuqpoi', 1, '2020-06-12 18:23:22', '2020-06-12 18:23:22', '2020-06-12 18:23:22');

-- --------------------------------------------------------

--
-- Table structure for table `audit_histories`
--

CREATE TABLE `audit_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` text COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` int(10) UNSIGNED NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_histories`
--

INSERT INTO `audit_histories` (`id`, `user_id`, `module`, `request`, `action`, `user_agent`, `ip_address`, `reference_user`, `reference_id`, `reference_name`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 'plugin-order', '{\"ids\":[\"19\",\"18\",\"17\"],\"class\":\"Botble\\\\Ecommerce\\\\Tables\\\\OrderTable\"}', 'deleted', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '127.0.0.1', 1, 19, '', 'danger', '2021-05-02 11:00:56', '2021-05-02 11:00:56'),
(2, 1, 'plugin-order', '{\"ids\":[\"19\",\"18\",\"17\"],\"class\":\"Botble\\\\Ecommerce\\\\Tables\\\\OrderTable\"}', 'deleted', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '127.0.0.1', 1, 18, '', 'danger', '2021-05-02 11:00:57', '2021-05-02 11:00:57'),
(3, 1, 'plugin-order', '{\"ids\":[\"19\",\"18\",\"17\"],\"class\":\"Botble\\\\Ecommerce\\\\Tables\\\\OrderTable\"}', 'deleted', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '127.0.0.1', 1, 17, '', 'danger', '2021-05-02 11:00:57', '2021-05-02 11:00:57');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT '0',
  `is_featured` tinyint(4) NOT NULL DEFAULT '0',
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `description`, `status`, `author_id`, `author_type`, `icon`, `order`, `is_featured`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Ecommerce', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 1, '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(2, 'Fashion', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(3, 'Electronic', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(4, 'Commercial', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2020-11-07 02:12:50', '2020-11-07 02:12:50');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `address`, `subject`, `content`, `status`, `created_at`, `updated_at`) VALUES
(35, 'David Polson', 'wmrcapital@mail2world.com', '87427625748', 'https://www.no-site.com', 'Small Business Loan', 'Good morning, \r\n \r\nI hope you are well. We\'re currently proving low cost unsecured working capital facilities for UK small businesses. \r\n \r\nIf your business would benefit from a flexible line of credit, please do not hesitate to contact us today. \r\n \r\nA few details below: \r\n \r\n- Interest rates from just 2.9% \r\n- Flexible repayment terms \r\n- Same day decision (24-hour pay out) \r\n- Unsecured \r\n \r\nYou can get a quick, no obligation qupotation here: https://le0fvqw34em.typeform.com/to/ow6nmxFn \r\n \r\nHope to hear from you soon! \r\n \r\nDavid \r\n \r\nWMR Capital', 'unread', '2021-03-10 16:17:54', '2021-03-10 16:17:54'),
(36, 'Mis-Sold Car Finance', 'missoldcar462@gmail.com', '84523586185', 'https://www.no-site.com', 'Mis-Sold Car Finance Claims Now Paying Out', 'If you have a car that costs £20k or above, please note that we are now achieving successful claims on Mis-sold Car Finance in relation to hidden commissions with payouts ranging from £5k to £50k. Also, if you have been making monthly payments for the last 2-3 years, we can fast track your claim direct to our solicitors. \r\n \r\nWe operate on a no win, no fee basis; so, there is no upfront charge or fee for our services. This also means that we are now going to take on every case, provided that the finance was taken out within the last 6 years. \r\n \r\nApologies if this email is unexpected but we understand that there are many people going through difficult times financially during this pandemic and we have been able to help a lot of people that were struggling to get payouts for Missold Car Finance. \r\n \r\nDue to the number of cases that we are now dealing with, we are asking all our clients to call us on 0333 344 8970 or visit our website http://www.missoldcarfinance.com \r\n \r\nRegards, \r\nMis-Sold Car Finance', 'unread', '2021-03-11 15:11:06', '2021-03-11 15:11:06'),
(37, 'Mike Adderiy', 'no-replyliste@gmail.com', '87267442878', 'https://no-site.com', 'Local SEO for more business', 'Hello \r\n \r\nI have just verified your SEO on  ashleyhdf.co.uk for its Local SEO Trend and seen that your website could use a push. \r\n \r\nWe will enhance your Local Ranks organically and safely, using only whitehat methods, while providing Google maps and website offsite work at the same time. \r\n \r\nPlease check our pricelist here, we offer SEO at cheap rates. \r\nhttps://speed-seo.net/product/local-seo-package/ \r\n \r\nStart enhancing your local visibility with us, today! \r\n \r\nregards \r\nMike Adderiy\r\n \r\nSpeed SEO Digital Agency \r\nsupport@speed-seo.net', 'unread', '2021-03-12 21:23:25', '2021-03-12 21:23:25'),
(38, 'Barrie Ingram', 'aacccconts12pppriiic@gmail.com', '84376166766', 'https://www.no-site.com', 'Taxi App trials needed', 'TAXI APP - Automation  Now you can afford a taxi app start free right now \r\n(you may qualify as a small user to use for free for ever) \r\n \r\n“Let me explain. \r\nThe software I have developed has three entry panels. \r\nThe company and customer Panel where bookings can be made and the driver, where bookings are sent, manually or with AI. \r\nAll panels can be logged into via a desktop app or mobile app screen. The App is mobile compliant, that means you can look and work on it from a mobile device, anywhere with the internet. \r\nThe app will work on any device meaning Apple, Android PC, Ipad or similar device. \r\nAnything you can browse on the internet. \r\nIf you can open email you can open this app. \r\n \r\n“do you want to save this app on your desktop” \r\n \r\nYou don\'t have to download this app, once you\'ve logged with a link via a text or email you get a pop up that says “ do you want to save this app on your desktop”. That\'s your app on your device. \r\n \r\nNO SET UP FEES  - JUST register here to use free of charge instantly  https://pobdash.co.uk \r\nWe need trials - please help - its a great peace of software - you just register login & use! \r\nOr check the POBDASH  channel on youtube  to see videos of the app. \r\nhttps://www.youtube.com/channel/UCH8BjPpW2JjwgFj9QQKW2XQ \r\n \r\nOr on Loom - see videos \r\nhttps://loom.com/share/folder/16775ec8f11c4515acc38ee0bbf49d20 \r\n \r\nCall me on 07908228472 (or text or whats app) \r\nOr email on info@pobdash.uk \r\n \r\nRegards \r\n \r\nBarrie Ingram    developer and owner of POB (in the cloud) UK', 'unread', '2021-03-14 08:53:04', '2021-03-14 08:53:04'),
(39, 'Mike Kennett', 'no-reply@google.com', '88725829991', 'https://google.com', 'affordable monthly SEO plans', 'Howdy \r\n \r\nI have just took an in depth look on your  ashleyhdf.co.uk for its SEO Trend and saw that your website could use a boost. \r\n \r\nWe will enhance your SEO metrics and ranks organically and safely, using only whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nPlease check our plans here, we offer SEO at cheap rates. \r\nhttps://www.hilkom-digital.de/cheap-seo-packages/ \r\n \r\nStart improving your sales and leads with us, today! \r\n \r\nregards \r\nMike Kennett\r\n \r\nHilkom Digital Team \r\nsupport@hilkom-digital.de', 'unread', '2021-03-18 14:43:44', '2021-03-18 14:43:44'),
(40, 'Eric Jones', 'eric.jones.z.mail@gmail.com', '555-555-1212', '420 Lexington Ave', 'Instead, congrats', 'Good day, \r\n\r\nMy name is Eric and unlike a lot of emails you might get, I wanted to instead provide you with a word of encouragement – Congratulations\r\n\r\nWhat for?  \r\n\r\nPart of my job is to check out websites and the work you’ve done with ashleyhdf.co.uk definitely stands out. \r\n\r\nIt’s clear you took building a website seriously and made a real investment of time and resources into making it top quality.\r\n\r\nThere is, however, a catch… more accurately, a question…\r\n\r\nSo when someone like me happens to find your site – maybe at the top of the search results (nice job BTW) or just through a random link, how do you know? \r\n\r\nMore importantly, how do you make a connection with that person?\r\n\r\nStudies show that 7 out of 10 visitors don’t stick around – they’re there one second and then gone with the wind.\r\n\r\nHere’s a way to create INSTANT engagement that you may not have known about… \r\n\r\nTalk With Web Visitor is a software widget that’s works on your site, ready to capture any visitor’s Name, Email address and Phone Number.  It lets you know INSTANTLY that they’re interested – so that you can talk to that lead while they’re literally checking out ashleyhdf.co.uk.\r\n\r\nCLICK HERE https://talkwithwebvisitors.com to try out a Live Demo with Talk With Web Visitor now to see exactly how it works.\r\n\r\nIt could be a game-changer for your business – and it gets even better… once you’ve captured their phone number, with our new SMS Text With Lead feature, you can automatically start a text (SMS) conversation – immediately (and there’s literally a 100X difference between contacting someone within 5 minutes versus 30 minutes.)\r\n\r\nPlus then, even if you don’t close a deal right away, you can connect later on with text messages for new offers, content links, even just follow up notes to build a relationship.\r\n\r\nEverything I’ve just described is simple, easy, and effective. \r\n\r\nCLICK HERE https://talkwithwebvisitors.com to discover what Talk With Web Visitor can do for your business.\r\n\r\nYou could be converting up to 100X more leads today!\r\n\r\nEric\r\nPS: Talk With Web Visitor offers a FREE 14 days trial – and it even includes International Long Distance Calling. \r\nYou have customers waiting to talk with you right now… don’t keep them waiting. \r\nCLICK HERE https://talkwithwebvisitors.com to try Talk With Web Visitor now.\r\n\r\nIf you\'d like to unsubscribe click here http://talkwithwebvisitors.com/unsubscribe.aspx?d=ashleyhdf.co.uk', 'unread', '2021-03-22 19:36:06', '2021-03-22 19:36:06'),
(41, 'Justina Gillen', 'justina@bestlocaldata.com', 'NA', 'NA', 'BestLocalData.com', 'Hello,\r\n\r\nBestLocalData.com has a special package you get any group of databases for $49 or $249 for all 16 databases and unlimited emails for a year(Domain, IP, Dashboard included).\r\n\r\nYou can purchase it on BestLocalData.com and see samples if you are interested.', 'unread', '2021-03-25 13:17:01', '2021-03-25 13:17:01'),
(42, 'Eric Jones', 'eric.jones.z.mail@gmail.com', '555-555-1212', '420 Lexington Ave', 'Strike when the iron’s hot', 'Hey there, I just found your site, quick question…\r\n\r\nMy name’s Eric, I found ashleyhdf.co.uk after doing a quick search – you showed up near the top of the rankings, so whatever you’re doing for SEO, looks like it’s working well.\r\n\r\nSo here’s my question – what happens AFTER someone lands on your site?  Anything?\r\n\r\nResearch tells us at least 70% of the people who find your site, after a quick once-over, they disappear… forever.\r\n\r\nThat means that all the work and effort you put into getting them to show up, goes down the tubes.\r\n\r\nWhy would you want all that good work – and the great site you’ve built – go to waste?\r\n\r\nBecause the odds are they’ll just skip over calling or even grabbing their phone, leaving you high and dry.\r\n\r\nBut here’s a thought… what if you could make it super-simple for someone to raise their hand, say, “okay, let’s talk” without requiring them to even pull their cell phone from their pocket?\r\n  \r\nYou can – thanks to revolutionary new software that can literally make that first call happen NOW.\r\n\r\nTalk With Web Visitor is a software widget that sits on your site, ready and waiting to capture any visitor’s Name, Email address and Phone Number.  It lets you know IMMEDIATELY – so that you can talk to that lead while they’re still there at your site.\r\n  \r\nYou know, strike when the iron’s hot!\r\n\r\nCLICK HERE http://talkwithcustomer.com to try out a Live Demo with Talk With Web Visitor now to see exactly how it works.\r\n\r\nWhen targeting leads, you HAVE to act fast – the difference between contacting someone within 5 minutes versus 30 minutes later is huge – like 100 times better!\r\n\r\nThat’s why you should check out our new SMS Text With Lead feature as well… once you’ve captured the phone number of the website visitor, you can automatically kick off a text message (SMS) conversation with them. \r\n \r\nImagine how powerful this could be – even if they don’t take you up on your offer immediately, you can stay in touch with them using text messages to make new offers, provide links to great content, and build your credibility.\r\n\r\nJust this alone could be a game changer to make your website even more effective.\r\n\r\nStrike when  the iron’s hot!\r\n\r\nCLICK HERE http://talkwithcustomer.com to learn more about everything Talk With Web Visitor can do for your business – you’ll be amazed.\r\n\r\nThanks and keep up the great work!\r\n\r\nEric\r\nPS: Talk With Web Visitor offers a FREE 14 days trial – you could be converting up to 100x more leads immediately!   \r\nIt even includes International Long Distance Calling. \r\nStop wasting money chasing eyeballs that don’t turn into paying customers. \r\nCLICK HERE http://talkwithcustomer.com to try Talk With Web Visitor now.\r\n\r\nIf you\'d like to unsubscribe click here http://talkwithcustomer.com/unsubscribe.aspx?d=ashleyhdf.co.uk', 'unread', '2021-03-25 16:05:43', '2021-03-25 16:05:43'),
(43, 'David Hope', 'wmrcapital@mail2world.com', '89773761388', 'http://no-site.com', 'Small Business Loan', 'Good morning \r\n \r\nI hope you are well. We\'re currently proving low cost unsecured working capital facilities for UK small businesses. \r\n \r\nIf your business would benefit from a flexible line of credit, please do not hesitate to contact us today. \r\n \r\nA few details below: \r\n \r\n- Interest rates from just 2.9% \r\n- Flexible repayment terms \r\n- Same day decision (24-hour pay out) \r\n- Unsecured \r\n \r\nYou can get a quick, no obligation qupotation here: https://le0fvqw34em.typeform.com/to/ow6nmxFn \r\n \r\nHope to hear from you soon! \r\n \r\nDavid \r\n \r\nWMR Capital', 'unread', '2021-03-26 08:31:36', '2021-03-26 08:31:36'),
(44, 'Coleman Craigie', 'coleman.craigie@hotmail.com', '0711 71 63 02', 'Neue Ro?Str. 24', 'Do you accept Guest Posts?', 'Hi,\r\n\r\nWe’re reaching out to ask if you’d be interested in featuring a guest post on your website. We believe we can add value to your audience on a few related topics that would resonate with your readers. \r\n\r\nIf our offer is of interest to you, please complete the form here: https://backlinkpro.club/add-your-site\r\n\r\nKind Regards,\r\nColeman', 'unread', '2021-03-27 02:26:05', '2021-03-27 02:26:05'),
(45, 'Emanuel Hollander', 'emanuel.hollander@gmail.com', NULL, 'Salzburger Strasse 9', 'REPURPOSE - PUBLISH - PROFIT', 'Your All In One Solution For Creating All The Content You\'ll Ever Need.\r\n\r\nProprietary AI Turns YouTube Videos Into Traffic Getting Articles At The Press Of A Button!\r\n\r\nWe’ve Been Getting Free Autopilot Traffic From Google Without SEO Experience For Over 2 Years By Converting Others YouTube Videos Into Articles…\r\n\r\nhttps://warriorplus.com/o2/a/gmvfs/0', 'unread', '2021-03-28 17:09:13', '2021-03-28 17:09:13'),
(46, 'Karolin Valente', 'valente.karolin38@googlemail.com', '813-774-9772', '2505 Saints Alley', 'Need extra income?', 'Need extra income?\r\n\r\nA fully hosted, done for you content + monetisation and a stunning design web based software that creates a fully automated done for you cryptocurrency affiliate site,\r\n\r\nVisit us: https://warriorplus.com/o2/a/f5s4y/0', 'unread', '2021-03-29 21:31:33', '2021-03-29 21:31:33'),
(47, 'Eric Jones', 'eric.jones.z.mail@gmail.com', '555-555-1212', '420 Lexington Ave', 'Your site – more leads?', 'Hey, this is Eric and I ran across ashleyhdf.co.uk a few minutes ago.\r\n\r\nLooks great… but now what?\r\n\r\nBy that I mean, when someone like me finds your website – either through Search or just bouncing around – what happens next?  Do you get a lot of leads from your site, or at least enough to make you happy?\r\n\r\nHonestly, most business websites fall a bit short when it comes to generating paying customers. Studies show that 70% of a site’s visitors disappear and are gone forever after just a moment.\r\n\r\nHere’s an idea…\r\n \r\nHow about making it really EASY for every visitor who shows up to get a personal phone call you as soon as they hit your site…\r\n \r\nYou can –\r\n  \r\nTalk With Web Visitor is a software widget that’s works on your site, ready to capture any visitor’s Name, Email address and Phone Number.  It signals you the moment they let you know they’re interested – so that you can talk to that lead while they’re literally looking over your site.\r\n\r\nCLICK HERE http://talkwithcustomer.com to try out a Live Demo with Talk With Web Visitor now to see exactly how it works.\r\n\r\nYou’ll be amazed - the difference between contacting someone within 5 minutes versus a half-hour or more later could increase your results 100-fold.\r\n\r\nIt gets even better… once you’ve captured their phone number, with our new SMS Text With Lead feature, you can automatically start a text (SMS) conversation.\r\n  \r\nThat way, even if you don’t close a deal right away, you can follow up with text messages for new offers, content links, even just “how you doing?” notes to build a relationship.\r\n\r\nPretty sweet – AND effective.\r\n\r\nCLICK HERE http://talkwithcustomer.com to discover what Talk With Web Visitor can do for your business.\r\n\r\nYou could be converting up to 100X more leads today!\r\n\r\nEric\r\nPS: Talk With Web Visitor offers a FREE 14 days trial – and it even includes International Long Distance Calling. \r\nYou have customers waiting to talk with you right now… don’t keep them waiting. \r\nCLICK HERE http://talkwithcustomer.com to try Talk With Web Visitor now.\r\n\r\nIf you\'d like to unsubscribe click here http://talkwithcustomer.com/unsubscribe.aspx?d=ashleyhdf.co.uk', 'unread', '2021-03-30 16:59:05', '2021-03-30 16:59:05'),
(48, 'Mis-Sold Car Finance', 'missoldfinance@hotmail.com', '81513921324', 'https://www.no-site.com', 'Over 85% of Car Finance Deals are Missold!', 'Our average claim amount is £10,000 and the most common area of Misselling is hidden commissions and we are achieving payouts now. \r\n \r\nFor a Free check or to fast track a 5-minute Application visit our website http://www.missoldcarfinance.com \r\nas you could be due a payout. Alternatively, you can call us on 0333 344 8970. \r\n \r\nApologies if this email is unexpected but we understand that there are many people going through difficult times financially during this pandemic and we have been able to help a lot of people that were struggling to get payouts for Missold Car Finance. \r\n \r\nRegards, \r\nMis-Sold Car Finance', 'unread', '2021-04-01 02:25:28', '2021-04-01 02:25:28'),
(49, 'BI Claims', 'biclaims1@outlook.com', '86273943765', 'https://www.no-site.com', 'Notice to UK Companies that were rejected for Business Interruption Insurance', 'Companies with Business Interruption Insurance who were previously rejected are now being paid out thanks to our expert legal team. Visit https://www.businessinterruptioninsuranceclaims.co.uk/policy-checker/index.html and fill out our simple form for a free policy check and instant advice. \r\n \r\nWe now have thousands of businesses using our NO WIN, NO FEE service. Visit https://vimeo.com/showcase/8268824 to watch videos on the benefits of using a third party like BI Claims. \r\n \r\nWe apologize if this email is unexpected but it is vital to check your policy as you could be due a huge payout. \r\n \r\nKind regards, \r\nBI Claims', 'unread', '2021-04-01 19:45:46', '2021-04-01 19:45:46'),
(50, 'Mike Francis', 'see-email-in-message@monkeydigital.co', '88817511785', 'https://www.monkeydigital.co/product-category/special-offers/', 'Increase sales for ashleyhdf.co.uk', 'Hi there \r\n \r\nDo you want a quick boost in ranks and sales for your ashleyhdf.co.uk website? \r\nHaving a high DA score, always helps \r\n \r\nGet your ashleyhdf.co.uk to have a DA between 50 to 60 points in Moz with us today and rip the benefits of such a great feat. \r\n \r\nSee our offers here: \r\nhttps://www.monkeydigital.co/product/moz-da50-seo-plan/ \r\n \r\nNEW: \r\nhttps://www.monkeydigital.co/product/ahrefs-dr60/ \r\n \r\n \r\nthank you \r\nMike Francis\r\n \r\nsupport@monkeydigital.co \r\nMonkey Digital', 'unread', '2021-04-02 12:00:33', '2021-04-02 12:00:33'),
(51, 'Linda Miller', 'lindamillerleads@gmail.com', '555-555-1212', '420 Lexington Ave', 'How To Master Internet Lead Conversion?', 'How To Master Internet Lead Conversion?\r\n\r\nI spent the last 10+ years generating, calling and closing Internet leads. I will be sharing my decade long conversion code for you to copy during this new, free webinar!\r\nDuring the webinar, I will show you:\r\n\r\nEvery business needs to capture more leads, create more appointments, and close more deals.\r\n\r\nIf you commit to mastering the content in this session, you will earn more money immediately– not in six months or a year, but literally as soon as you put your new knowledge to work. I have used this method on 1,000\'s of Internet leads of all price points. \r\n\r\nIf you want Internet leads, I have the key to CONVERTING them. Hope you can make it... https://TalkWithWebTraffic.com/Webinar\r\n\r\nIf getting more Hot Phone Leads is a part of your business plan (and why wouldn\'t it be?), I\'ve got great news for you.\r\n\r\n1. 12 ways to generate seller leads\r\n2. How to get seller leads on the phone\r\n3. What to say on the phone so you get instant sales\r\n4. The Key to SMS Marketing\r\n5  Never Cold Call Again\r\n6. Better leads = Faster conversions\r\n7. The four keys to inside sales success\r\n8. The 10 steps to a perfect sales call with an Internet lead\r\n\r\nMore than 7,000 people have already registered. The last time I did a webinar with Top Producers, hundreds of people got locked out and could only watch the replay. Get your spot now and tune in early!\r\n\r\n==> Save my spot https://TalkWithWebTraffic.com/Webinar\r\n\r\nWe\'ve become obsessed with making sure our clients are converting the leads we generate for them. \r\n\r\nHow much are you getting back in commissions compared to how much are you spending on advertising? But what is even better than a great ROI is a quick ROI. During this live webinar I will show you how we can help you generate higher quality leads that are easier to convert, fast.\r\n\r\n==>  Register at https://TalkWithWebTraffic.com/Webinar\r\n\r\nYour #1 Fan, \r\nLinda Miller\r\nBe there or be square.\r\n\r\nIf you\'d like to unsubscribe click here http://talkwithwebtraffic.com/unsubscribe.aspx?d=ashleyhdf.co.uk', 'unread', '2021-04-06 22:57:44', '2021-04-06 22:57:44'),
(52, 'Mike Stevenson', 'no-replyliste@gmail.com', '84384676965', 'https://no-site.com', 'Local SEO for more business', 'Greetings \r\n \r\nI have just took a look on your SEO for  ashleyhdf.co.uk for its Local SEO Trend and seen that your website could use an upgrade. \r\n \r\nWe will improve your Local Ranks organically and safely, using only whitehat methods, while providing Google maps and website offsite work at the same time. \r\n \r\nPlease check our pricelist here, we offer SEO at cheap rates. \r\nhttps://speed-seo.net/product/local-seo-package/ \r\n \r\nStart improving your local visibility with us, today! \r\n \r\nregards \r\nMike Stevenson\r\n \r\nSpeed SEO Digital Agency \r\nsupport@speed-seo.net', 'unread', '2021-04-07 08:19:38', '2021-04-07 08:19:38'),
(53, 'Benjamin Ehinger', 'writingbyb@gmail.com', '81142969736', 'http://no-site.com', 'Content Writing Help', 'Hi! \r\n \r\nDo you struggle to find time to write articles? \r\n \r\nHire the best team of writers online today! \r\n \r\nWe do all the research and provide well-written, unique SEO content perfect for higher search engine ranking and better visitor engagement. \r\n \r\nIf you need fresh articles for your blog, check out our current content specials here: \r\n \r\nhttps://writingbybenjamin.com/best-seo-articles/ \r\n \r\nWe also offer guest posting services to help you gain exposure and better SEO: \r\n \r\nhttps://writingbybenjamin.com/guest-posting-services/ \r\n \r\nYou can also contact me directly at WBB@writingbybenjamin.com', 'unread', '2021-04-07 15:52:53', '2021-04-07 15:52:53'),
(54, 'Mike Sharp', 'faceleads@outlook.com', '87793833918', 'https://www.no-site.com', 'Facebook Leads', 'Hey, \r\nAre you interested in having your competitor customer database? We can pull Facebook profiles data that like their Facebook Page. \r\nSince these people follow the page, they have an interest in the products and services they offer. \r\nWe provide their E-Mails, Numbers, Full names, Locations, Genders and Birthdays. The cost for 3000 leads is 79 USD. \r\n \r\nPlease share the target Facebook page/group and  I will send you the sample within a day. \r\n \r\nThanks, let me know. \r\n \r\nMike Sharp \r\nFacebook Leads Provider \r\nTelegram - @facelead Skype live:mikehezron_1 WhatsApp -  +1213 376-4955 \r\nfaceleads@outlook.com', 'unread', '2021-04-08 01:16:36', '2021-04-08 01:16:36'),
(55, 'Danelle Custance', 'danelle.custance@outlook.com', '989-890-0459', '4969 Juniper Drive', 'lifemail.studio', 'Hey,\r\n\r\nIt was nice speaking to you the other day, this is the service I was telling you about that helped us boost our ROI almost 2000%\r\n\r\nIts a company called Lifemail.studio sorry it took so long to get back to you. They allow you to send any email doesn\'t matter what.\r\n\r\nWe dealt with a guy named Michael, he was friendly and got us setup really quickly.\r\n\r\nRegards,\r\nDanelle', 'unread', '2021-04-08 11:10:26', '2021-04-08 11:10:26'),
(56, 'Keira St Julian', 'keira.stjulian@msn.com', '(03) 6225 8435', '95 Flinstone Drive', NULL, 'Want more visitors for your website? Acquire lots of people who are ready to buy sent directly to your website. Increase your profits fast. You\'ll see results in as little as 24 hours. For more info Visit: http://bit.ly/web-traffic-targeted-for-your-niche', 'unread', '2021-04-09 03:19:47', '2021-04-09 03:19:47'),
(57, 'Mike Dutton', 'no-reply@google.com', '82969895993', 'https://google.com', 'quality monthly SEO plans', 'Howdy \r\n \r\nI have just checked  ashleyhdf.co.uk for  the current search visibility and saw that your website could use a push. \r\n \r\nWe will enhance your SEO metrics and ranks organically and safely, using only whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nPlease check our plans here, we offer SEO at cheap rates. \r\nhttps://www.hilkom-digital.de/cheap-seo-packages/ \r\n \r\nStart increasing your sales and leads with us, today! \r\n \r\nregards \r\nMike Dutton\r\n \r\nHilkom Digital Team \r\nsupport@hilkom-digital.de', 'unread', '2021-04-12 17:25:16', '2021-04-12 17:25:16'),
(58, 'Ruthie Costas', 'ruthie@lifemailnow.com', '647-219-3494', '4998 Bay Street', 'LifeMailNow.com - One Time cost, unlimited Emails', 'Hello,\r\n\r\nSend unlimited emails to unlimited lists with one click and no monthly fees!\r\n\r\n$99 once off!\r\n\r\nLifeMailNow.com', 'unread', '2021-04-14 05:45:47', '2021-04-14 05:45:47'),
(59, 'Kaley Corey', 'kaley@bestlocaldata.com', '02.04.26.63.56', '81 Boulevard Aristide Briand', 'BestLocalData.com', 'Do you need clients?\r\n\r\nWe compiled some of the world\'s top databases for you at ridiculous low prices. $49 for any of our databases or $99 for all 16 databases!\r\n\r\nVisit BestLocalData.com\r\n\r\nRegards,\r\nKaley', 'unread', '2021-04-17 14:26:18', '2021-04-17 14:26:18'),
(60, 'Thomas', 'thomas.mooner@gmail.com', '330-932-4072', '1918 Horner Street', 'Talented Freelancers ready to work with you', 'In today\'s digital world it is always the case that some form of help is needed. To write a program code snippet, modify website content or structure, work with graphic, video or audio programs. Create-manage marketing campaigns, analyze dataset or simple need some one as virtual assistant, etc...\r\nOne of the best idea, to hire a freelancer (from a large pool of hundred thousands) who can step in immediately, experienced and budget friendly. Let\'s see what I found for you: https://bit.ly/37iRqoy\r\n\r\nIf you need marketing service, then please drop me a message with subject \"MARKETING\" (all capital letters), we are ready to help for you.\r\n\r\nSincerely,\r\nThomas Mooner\r\nthomas.mooner@gmail.com', 'unread', '2021-04-18 23:55:28', '2021-04-18 23:55:28'),
(61, 'Eric Jones', 'eric.jones.z.mail@gmail.com', '555-555-1212', '420 Lexington Ave', 'Why not TALK with your leads?', 'My name’s Eric and I just found your site ashleyhdf.co.uk.\r\n\r\nIt’s got a lot going for it, but here’s an idea to make it even MORE effective.\r\n\r\nTalk With Web Visitor – CLICK HERE https://talkwithwebvisitors.com for a live demo now.\r\n\r\nTalk With Web Visitor is a software widget that’s works on your site, ready to capture any visitor’s Name, Email address and Phone Number.  It signals you the moment they let you know they’re interested – so that you can talk to that lead while they’re literally looking over your site.\r\n\r\nAnd once you’ve captured their phone number, with our new SMS Text With Lead feature, you can automatically start a text (SMS) conversation… and if they don’t take you up on your offer then, you can follow up with text messages for new offers, content links, even just “how you doing?” notes to build a relationship.\r\n\r\nCLICK HERE https://talkwithwebvisitors.com to discover what Talk With Web Visitor can do for your business.\r\n\r\nThe difference between contacting someone within 5 minutes versus a half-hour means you could be converting up to 100X more leads today!\r\n\r\nEric\r\nPS: Studies show that 70% of a site’s visitors disappear and are gone forever after just a moment. Don’t keep losing them. \r\nTalk With Web Visitor offers a FREE 14 days trial – and it even includes International Long Distance Calling. \r\nYou have customers waiting to talk with you right now… don’t keep them waiting. \r\nCLICK HERE https://talkwithwebvisitors.com to try Talk With Web Visitor now.\r\n\r\nIf you\'d like to unsubscribe click here http://talkwithwebvisitors.com/unsubscribe.aspx?d=ashleyhdf.co.uk', 'unread', '2021-04-22 10:59:09', '2021-04-22 10:59:09'),
(62, 'Ash', 'ash@techknowspace.com', '888-938-8893', 'Breitenstrasse 95', NULL, 'Hello,\r\n\r\nMy Name is Ash and I Run Tech Know Space https://techknowspace.com We are your Premium GO-TO Service Centre for All Logic Board & Mainboard Repair\r\n\r\nWhen other shops say \"it can\'t be fixed\" WE CAN HELP!\r\n\r\nALL iPHONE 8 & NEWER\r\nBACK GLASS REPAIR - 1 HOUR\r\n\r\nDevices We Repair\r\nAudio Devices Audio Device Repair\r\n\r\nBluetooth Speakers - Headphones - iPod Touch\r\nComputers All Computer Repair\r\n\r\nAll Brands & Models - Custom Built - PC & Mac\r\nGame Consoles Game Console Repair\r\n\r\nPS4 - XBox One - Nintendo Switch\r\nLaptops All Laptop Repair\r\n\r\nAll Brands & Models - Acer, Asus, Compaq, Dell, HP, Lenovo, Toshiba\r\nMacBooks All MacBook Repair\r\n\r\nAll Series & Models - Air, Classic, Pro\r\nPhones All Phone Repair\r\n\r\nAll Brands & Models - BlackBerry, Huawei, iPhone, LG, OnePlus, Samsung, Sony\r\nSmart Watches Apple Watch Repair\r\n\r\nApple Watch - Samsung Gear - Moto 360\r\nTablets All Tablet Repair\r\n\r\nAll Brands & Models - iPad, Lenovo Yoga, Microsoft Surface, Samsung Tab\r\n\r\nDrone Repair\r\n\r\nCall us and tell us your issues today!\r\n\r\nToll Free: (888) 938-8893\r\nhttps://techknowspace.com\r\n\r\nAsh Mansukhani\r\nash@techknowspace.com\r\n<img src=\"https://yt3.ggpht.com/ytc/AAUvwnhUhkYdWNeEvgk0Kb1HPFRGjLlXdAKaAXUhwNjC=s900-c-k-c0x00ffffff-no-rj\" alt=\"Ash Mansukhani\" width=\"500\" height=\"600\">', 'unread', '2021-04-23 08:43:42', '2021-04-23 08:43:42'),
(63, 'Eric Jones', 'eric.jones.z.mail@gmail.com', '555-555-1212', '420 Lexington Ave', 'instead, congrats', 'Good day, \r\n\r\nMy name is Eric and unlike a lot of emails you might get, I wanted to instead provide you with a word of encouragement – Congratulations\r\n\r\nWhat for?  \r\n\r\nPart of my job is to check out websites and the work you’ve done with ashleyhdf.co.uk definitely stands out. \r\n\r\nIt’s clear you took building a website seriously and made a real investment of time and resources into making it top quality.\r\n\r\nThere is, however, a catch… more accurately, a question…\r\n\r\nSo when someone like me happens to find your site – maybe at the top of the search results (nice job BTW) or just through a random link, how do you know? \r\n\r\nMore importantly, how do you make a connection with that person?\r\n\r\nStudies show that 7 out of 10 visitors don’t stick around – they’re there one second and then gone with the wind.\r\n\r\nHere’s a way to create INSTANT engagement that you may not have known about… \r\n\r\nTalk With Web Visitor is a software widget that’s works on your site, ready to capture any visitor’s Name, Email address and Phone Number.  It lets you know INSTANTLY that they’re interested – so that you can talk to that lead while they’re literally checking out ashleyhdf.co.uk.\r\n\r\nCLICK HERE http://talkwithcustomer.com to try out a Live Demo with Talk With Web Visitor now to see exactly how it works.\r\n\r\nIt could be a game-changer for your business – and it gets even better… once you’ve captured their phone number, with our new SMS Text With Lead feature, you can automatically start a text (SMS) conversation – immediately (and there’s literally a 100X difference between contacting someone within 5 minutes versus 30 minutes.)\r\n\r\nPlus then, even if you don’t close a deal right away, you can connect later on with text messages for new offers, content links, even just follow up notes to build a relationship.\r\n\r\nEverything I’ve just described is simple, easy, and effective. \r\n\r\nCLICK HERE http://talkwithcustomer.com to discover what Talk With Web Visitor can do for your business.\r\n\r\nYou could be converting up to 100X more leads today!\r\n\r\nEric\r\nPS: Talk With Web Visitor offers a FREE 14 days trial – and it even includes International Long Distance Calling. \r\nYou have customers waiting to talk with you right now… don’t keep them waiting. \r\nCLICK HERE http://talkwithcustomer.com to try Talk With Web Visitor now.\r\n\r\nIf you\'d like to unsubscribe click here http://talkwithcustomer.com/unsubscribe.aspx?d=ashleyhdf.co.uk', 'unread', '2021-04-23 16:26:02', '2021-04-23 16:26:02'),
(64, 'Enriquecor', 'no-replyexastylax@gmail.com', '87481546982', 'https://www.no-site.com', 'A new method of email distribution.', 'Good day!  ashleyhdf.co.uk \r\n \r\nDo you know the simplest way to point out your merchandise or services? Sending messages exploitation contact forms can permit you to simply enter the markets of any country (full geographical coverage for all countries of the world).  The advantage of such a mailing  is that the emails that will be sent through it\'ll find yourself within the mailbox that\'s meant for such messages. Sending messages using Feedback forms is not blocked by mail systems, which means it is certain to reach the client. You may be able to send your offer to potential customers who were previously unprocurable thanks to email filters. \r\nWe offer you to check our service for free. We are going to send up to fifty thousand message for you. \r\nThe cost of sending one million messages is us $ 49. \r\n \r\nThis letter is created automatically. Please use the contact details below to contact us. \r\n \r\nContact us. \r\nTelegram - @FeedbackMessages \r\nSkype  live:contactform_18 \r\nWhatsApp - +375259112693', 'unread', '2021-04-24 23:19:45', '2021-04-24 23:19:45'),
(65, 'Keith Slack', 'w.or.dp.r.e.s.s.4.5.5.4.8.5+bertero@gmail.com', '021 840 14 51', 'Via Gabbietta 13', 'Question', 'Hi There,\r\n\r\nAre you presently utilising Wordpress/Woocommerce or maybe you project to utilise it sooner or later ? We provide over 2500 premium plugins and also themes to download : http://shortsy.buzz/m0qXP\r\n\r\nThank You,\r\n\r\nKeith', 'unread', '2021-04-24 23:38:32', '2021-04-24 23:38:32'),
(66, 'John Wang', 'noreply@googlemail.com', '85834646569', 'https://no-site.com', 'TREAT AS CONFIDENTIAL', 'Hello, \r\nI am contacting you regarding a transaction of mutual benefit, I am an Auditor who managed a client\'s account that passed away many years ago with same last name as yours, he passed away without any known relative. \r\nWe can work together mutually to process and receive the funds, let me know if you wish to know more about my proposal and I shall provide you with more information. \r\n \r\nRegards, \r\nMr John Wang \r\njohnwanghkk@gmail.com', 'unread', '2021-04-28 13:36:14', '2021-04-28 13:36:14'),
(67, 'Isobel Howey', 'isobel@bestlocaldata.com', '0482 99 92 96', 'Rue Du Manoir 291', 'BestLocalData.com', 'Hey!\r\n\r\nBestLocalData has an amazing special. 16 databases for $99. \r\n\r\nLinkedIn(43million records) USA B2B (28 million companies), Australia, South Africa, UK, Germany and all of that included. \r\n\r\nInstant delivery! \r\n\r\nhttps://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=7S34LZQSKKQHG\r\n\r\nOr check out more on our website!\r\n\r\nRegards,\r\nIsobel', 'unread', '2021-04-28 17:12:56', '2021-04-28 17:12:56'),
(68, 'Jack Jones', 'agency7imarketing@gmail.com', '84592427914', 'https://www.no-site.com', 'Statistically, 94% of Crypto investors lose their money. Be among the 6% who grow it easily!', 'Start profitable crypto trading today - http://crpt.sndforbz.email \r\n \r\nStatistically, 94% of Crypto investors lose their money. \r\nWe are offering a chance to be among those 6% who actually grow their investments. \r\nThe biggest mistake of each investor is not purchasing or selling at the right time, as this is very emotional process. \r\nSpecifically for that we have deployed an incredible Artificial Intelligence and combined it with our knowledge. \r\nOur team is following all of the Crypto market 24/7 and provides the best signals for Cryptocurrencies, some of them are even free. \r\n \r\nDo not worry, it is never too late to invest into trading and cryptocurrencies, \r\nwe are here to guide you with full how-to-start guide and the exact directions where and when to invest to be profitable. \r\n \r\nRegister now: \r\n \r\n--> http://crpt.sndforbz.email', 'unread', '2021-04-29 10:49:43', '2021-04-29 10:49:43'),
(69, 'Mike Owen', 'see-email-in-message@monkeydigital.co', '87919817239', 'https://www.monkeydigital.co/product-category/special-offers/', 'Increase Domain Strength for ashleyhdf.co.uk', 'Hi there \r\n \r\nDo you want a quick boost in ranks and sales for your ashleyhdf.co.uk website? \r\nHaving a high DA score, always helps \r\n \r\nGet your ashleyhdf.co.uk to have a DA between 50 to 60 points in Moz with us today and rip the benefits of such a great feat. \r\n \r\nSee our offers here: \r\nhttps://www.monkeydigital.co/product/moz-da50-seo-plan/ \r\n \r\nNEW: \r\nhttps://www.monkeydigital.co/product/ahrefs-DR50-UR70/ \r\n \r\n \r\nthank you \r\nMike Owen\r\n \r\nsupport@monkeydigital.co', 'unread', '2021-04-30 09:18:24', '2021-04-30 09:18:24'),
(70, 'Carlota Logsdon', 'logsdon.carlota@yahoo.com', '06-48033437', 'Burgemeester Kirkelsstraat 154', NULL, 'Want to get more customers for your website? We can provide targeted visitors precisely for your business model\r\n To get details Visit: http://bit.ly/webtraffic-foryourniche', 'unread', '2021-04-30 20:41:32', '2021-04-30 20:41:32');

-- --------------------------------------------------------

--
-- Table structure for table `contact_replies`
--

CREATE TABLE `contact_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widgets`
--

CREATE TABLE `dashboard_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dashboard_widgets`
--

INSERT INTO `dashboard_widgets` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'widget_total_users', '2020-06-12 18:40:50', '2020-06-12 18:40:50'),
(2, 'widget_total_pages', '2020-06-12 18:40:50', '2020-06-12 18:40:50'),
(3, 'widget_total_plugins', '2020-06-12 18:40:50', '2020-06-12 18:40:50'),
(4, 'widget_total_themes', '2020-06-12 18:40:50', '2020-06-12 18:40:50'),
(6, 'widget_analytics_general', '2020-06-13 01:14:29', '2020-06-13 01:14:29'),
(7, 'widget_analytics_page', '2020-06-13 01:14:29', '2020-06-13 01:14:29'),
(8, 'widget_analytics_browser', '2020-06-13 01:14:29', '2020-06-13 01:14:29'),
(9, 'widget_posts_recent', '2020-06-13 01:14:29', '2020-06-13 01:14:29'),
(10, 'widget_analytics_referrer', '2020-06-13 01:14:29', '2020-06-13 01:14:29'),
(11, 'widget_audit_logs', '2020-06-13 01:14:29', '2020-06-13 01:14:29'),
(12, 'widget_ecommerce_report_general', '2020-06-22 21:33:14', '2020-06-22 21:33:14'),
(13, 'widget_total_1', '2021-05-02 07:59:48', '2021-05-02 07:59:48'),
(14, 'widget_total_2', '2021-05-02 07:59:49', '2021-05-02 07:59:49'),
(15, 'widget_total_3', '2021-05-02 07:59:49', '2021-05-02 07:59:49'),
(16, 'widget_total_4', '2021-05-02 07:59:49', '2021-05-02 07:59:49');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widget_settings`
--

CREATE TABLE `dashboard_widget_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `widget_id` int(10) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dashboard_widget_settings`
--

INSERT INTO `dashboard_widget_settings` (`id`, `settings`, `user_id`, `widget_id`, `order`, `status`, `created_at`, `updated_at`) VALUES
(1, '{\"state\":\"collapse\"}', 1, 6, 100, 0, '2020-11-25 15:59:12', '2020-12-31 12:01:23'),
(2, '{\"state\":\"collapse\"}', 1, 8, 101, 0, '2020-11-25 15:59:13', '2020-12-31 12:01:23'),
(3, '{\"state\":\"collapse\"}', 1, 7, 102, 0, '2020-11-25 15:59:23', '2020-12-31 12:00:17'),
(4, '{\"state\":\"collapse\"}', 1, 10, 103, 0, '2020-11-25 15:59:28', '2020-12-31 12:00:17'),
(5, '{\"state\":\"collapse\"}', 1, 9, 104, 0, '2020-11-25 19:42:24', '2020-12-31 12:01:47'),
(6, NULL, 1, 1, 0, 1, '2020-12-31 12:00:17', '2020-12-31 12:00:17'),
(7, NULL, 1, 2, 0, 1, '2020-12-31 12:00:17', '2020-12-31 12:00:17'),
(8, NULL, 1, 3, 0, 1, '2020-12-31 12:00:17', '2020-12-31 12:00:17'),
(9, NULL, 1, 4, 0, 1, '2020-12-31 12:00:17', '2020-12-31 12:00:17'),
(10, NULL, 1, 11, 0, 1, '2020-12-31 12:00:17', '2020-12-31 12:00:17'),
(11, NULL, 1, 12, 0, 1, '2020-12-31 12:00:17', '2020-12-31 12:00:17');

-- --------------------------------------------------------

--
-- Table structure for table `ec_brands`
--

CREATE TABLE `ec_brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_brands`
--

INSERT INTO `ec_brands` (`id`, `name`, `description`, `website`, `logo`, `status`, `order`, `is_featured`, `created_at`, `updated_at`) VALUES
(1, 'Candlelight', '<p><em>Candlelight</em>&nbsp;Products are the&nbsp;<em>UK&#39;s</em>&nbsp;leading supplier of wholesale gifts, home d&eacute;cor &amp; home accessories. Choose from a wide range of categories &amp; products.</p>', NULL, 'brands/cl-logo.png', 'published', 0, 1, '2020-11-07 02:12:22', '2021-01-20 20:28:06'),
(3, 'Cocod’Or', '<p><em>Cocod&rsquo;Or</em>&nbsp;- Vintage Inspired Mugs, Home and Kitchen Accessories.</p>', '#', NULL, 'published', 1, 1, '2020-11-07 02:12:22', '2021-02-12 22:45:26'),
(8, 'Bath and Body', '<p>Love is grand! And so is this Art Deco Envelope Seal from our&nbsp;<em>Deco Glam</em>&nbsp;design suite.</p>', '#', NULL, 'published', 0, 0, '2021-01-22 03:28:41', '2021-02-12 22:44:39'),
(9, 'Millefiori Milano', '<p>Millefiori Milano offering a unique selection of one and two bedroom apartments and townhomes for rent. Fresh interior renovations and upgrades feature hardwood style flooring, brushed nickel fixtures, premium appliance and lighting packages and washer/dryer connections.&nbsp;</p>', 'https://www.summermeadowsapts.com/', NULL, 'published', 0, 0, '2021-01-23 16:23:18', '2021-02-12 22:46:11'),
(10, 'Ashley In-House', '<p>This is&nbsp;Ashley In-House products.&nbsp;</p>', 'https://www.ashleyhdf.co.uk/', 'general/rsz-rlogo-1.png', 'published', 0, 0, '2021-02-12 22:47:29', '2021-02-12 22:47:29');

-- --------------------------------------------------------

--
-- Table structure for table `ec_cart`
--

CREATE TABLE `ec_cart` (
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_currencies`
--

CREATE TABLE `ec_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `decimals` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `order` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_currencies`
--

INSERT INTO `ec_currencies` (`id`, `title`, `symbol`, `is_prefix_symbol`, `decimals`, `order`, `is_default`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(4, 'GBP', '£', 1, 2, 0, 1, 1, '2021-04-21 00:37:58', '2021-04-24 15:21:15');

-- --------------------------------------------------------

--
-- Table structure for table `ec_customers`
--

CREATE TABLE `ec_customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_customers`
--

INSERT INTO `ec_customers` (`id`, `name`, `email`, `password`, `avatar`, `dob`, `phone`, `remember_token`, `created_at`, `updated_at`) VALUES
(12, 'Jonah Rimamchirika', 'jboyi@gmail.com', '$2y$10$Jfz/f6kNK/6u6m4uKdrdxuP.s5CN0P8M4W4Pn.TEMNocWNQUSXCSW', NULL, NULL, NULL, NULL, '2020-11-19 18:01:21', '2020-11-19 18:01:21'),
(13, 'Abayomi Ogunsola', 'ogunsola.abayomi@gmail.com', '$2y$10$PD0gRmeWZgLGLlJ1WMaMTuunPwci1HeLk8BqbrU0JpUhnTSmdorem', NULL, NULL, NULL, 'A4NAdNfAoFrZBUmdJtCpHfR7laWlXqay0mqbslOSh7uWbw5eeC8ILc5nbD4D', '2021-03-10 02:24:04', '2021-03-10 02:24:04'),
(14, 'Elisha Ado', 'elishaado1@gmail.com', '$2y$10$FcqrZVXzbfB7PX5sJc7cH.bDeTaqy4pctHPmq0GIxFJqoG0.hU.He', NULL, NULL, NULL, NULL, '2021-03-10 02:46:59', '2021-03-10 02:46:59'),
(15, 'Aisha Salami', 'isha.salami@gmail.com', '$2y$10$9tYA5AauspGX9lWuCXWire3mfTryXORx0BKAj6QlrN/p0w0mHcQz.', NULL, NULL, NULL, NULL, '2021-03-12 20:16:02', '2021-03-12 20:16:02'),
(16, 'Alfonsoimaft', 'aleksandra.626@mail.com', '$2y$10$N2tb.SPf3Z1LhjxwpMLNyO767DFCUTJPfpb3yy64yW/lqMBegFZnO', NULL, NULL, NULL, NULL, '2021-03-14 04:57:02', '2021-03-14 04:57:02'),
(17, 'Michael', 'michaelameyaw7@gmail.com', '$2y$10$rLfMxayz78Qt3KC3u2rSceBfct83VyCuxHtK25hKKl6b5tC8cgF.O', NULL, '2013-02-06', '0000000000', NULL, '2021-04-19 12:17:01', '2021-04-19 12:18:17');

-- --------------------------------------------------------

--
-- Table structure for table `ec_customer_addresses`
--

CREATE TABLE `ec_customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_customer_addresses`
--

INSERT INTO `ec_customer_addresses` (`id`, `name`, `email`, `phone`, `country`, `state`, `city`, `address`, `customer_id`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'John Smith', 'john.smith@botble.com', '996.213.6067 x71487', 'ID', 'North Carolina', 'West Caleigh', '2536 Laurence Lodge', 1, 1, '2020-11-07 02:12:42', '2020-11-07 02:12:42'),
(2, 'John Smith', 'john.smith@botble.com', '789-514-4868', 'VG', 'Louisiana', 'Port Hermina', '292 Alvera Island', 1, 0, '2020-11-07 02:12:42', '2020-11-07 02:12:42'),
(3, 'Delphia Glover', 'amparo.turcotte@example.org', '(342) 722-9617 x865', 'VE', 'Oklahoma', 'Trudieland', '4577 Maggio Cliff Apt. 908', 2, 1, '2020-11-07 02:12:42', '2020-11-07 02:12:42'),
(4, 'Xzavier Steuber', 'denesik.oswald@example.org', '741-658-3196', 'CI', 'Oregon', 'East Jamarcusstad', '6498 Jessie Vista', 3, 1, '2020-11-07 02:12:42', '2020-11-07 02:12:42'),
(5, 'Dr. Nichole Turner', 'garnet60@example.net', '(997) 800-6741 x28710', 'SI', 'Oklahoma', 'New Evansburgh', '134 Berge Walks Apt. 468', 4, 1, '2020-11-07 02:12:43', '2020-11-07 02:12:43'),
(6, 'Gregg Zieme Jr.', 'alize.okuneva@example.org', '1-997-745-1955 x535', 'FM', 'South Dakota', 'Port Braden', '155 Schmeler Court Apt. 541', 5, 1, '2020-11-07 02:12:43', '2020-11-07 02:12:43'),
(7, 'Jamarcus Stracke', 'ohermiston@example.net', '212.641.2847 x350', 'YE', 'New Hampshire', 'East Erikaside', '7337 Jerrold Trafficway Apt. 540', 6, 1, '2020-11-07 02:12:43', '2020-11-07 02:12:43'),
(8, 'Angie Koepp', 'salvador60@example.org', '1-795-553-5413 x330', 'ZW', 'Montana', 'Rockymouth', '65228 Robin River', 7, 1, '2020-11-07 02:12:44', '2020-11-07 02:12:44'),
(9, 'Arianna Connelly', 'aurelie81@example.com', '935-339-1357 x062', 'BF', 'Michigan', 'Satterfieldmouth', '63478 Dorian Common Suite 872', 8, 1, '2020-11-07 02:12:44', '2020-11-07 02:12:44'),
(10, 'Caroline Beier', 'echamplin@example.org', '(328) 257-8347 x2059', 'IR', 'Georgia', 'Agustinborough', '65057 Lehner Expressway', 9, 1, '2020-11-07 02:12:44', '2020-11-07 02:12:44'),
(11, 'Rolando Fritsch', 'stevie.cartwright@example.org', '383.359.9995 x53703', 'EG', 'New Hampshire', 'Port Jarred', '4058 Paris Greens', 10, 1, '2020-11-07 02:12:44', '2020-11-07 02:12:44'),
(12, 'Elise Cormier', 'ankunding.elijah@example.com', '231.535.9905', 'PE', 'Tennessee', 'Shaniyaland', '48665 Karianne Hill Apt. 483', 11, 1, '2020-11-07 02:12:45', '2020-11-07 02:12:45'),
(13, 'jonah rimamchirika', 'jboyi@gmail.com', '09071752006', 'NG', 'Choose One...', 'Abuja', 'no.31 samora machel street asokoro abuja, fct', 12, 1, '2020-11-19 18:02:13', '2020-11-19 18:02:13'),
(14, 'Abayomi Ogunsola', 'ogunsola.abayomi@gmail.com', '07774404449', 'GB', 'Worcestershire', 'Stoke Prior, Bromsgrove', '8 Furnival Drive, Stoke Prior', 13, 1, '2021-03-10 02:24:04', '2021-03-10 02:24:04'),
(15, 'Elisha Ado', 'elishaado1@gmail.com', '09071752006', 'NG', 'FCT', 'Abuja', '31 samora', 14, 1, '2021-03-10 02:50:11', '2021-03-10 02:50:11'),
(16, 'Michael', 'michaelameyaw7@gmail.com', '000000000', 'GH', 'Greater Accra', 'Accra', 'McCarthy Hill', 17, 1, '2021-04-19 12:23:37', '2021-04-19 12:23:37');

-- --------------------------------------------------------

--
-- Table structure for table `ec_customer_password_resets`
--

CREATE TABLE `ec_customer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_discounts`
--

CREATE TABLE `ec_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_used` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `value` double DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'coupon',
  `can_use_with_promotion` tinyint(1) DEFAULT '0',
  `discount_on` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` int(10) UNSIGNED DEFAULT NULL,
  `type_option` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'amount',
  `target` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'all-orders',
  `min_order_price` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_discount_customers`
--

CREATE TABLE `ec_discount_customers` (
  `discount_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_discount_products`
--

CREATE TABLE `ec_discount_products` (
  `discount_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_discount_product_collections`
--

CREATE TABLE `ec_discount_product_collections` (
  `discount_id` int(10) UNSIGNED NOT NULL,
  `product_collection_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_flash_sales`
--

CREATE TABLE `ec_flash_sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` datetime NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_flash_sale_products`
--

CREATE TABLE `ec_flash_sale_products` (
  `flash_sale_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `price` double UNSIGNED DEFAULT NULL,
  `quantity` int(10) UNSIGNED DEFAULT NULL,
  `sold` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_grouped_products`
--

CREATE TABLE `ec_grouped_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_product_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `fixed_qty` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_orders`
--

CREATE TABLE `ec_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `shipping_option` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `amount` decimal(15,2) NOT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_amount` decimal(8,2) DEFAULT NULL,
  `shipping_amount` decimal(8,2) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `coupon_code` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(15,2) DEFAULT NULL,
  `sub_total` decimal(15,2) NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `discount_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_finished` tinyint(1) DEFAULT '1',
  `token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_orders`
--

INSERT INTO `ec_orders` (`id`, `user_id`, `shipping_option`, `shipping_method`, `status`, `amount`, `payment_id`, `currency_id`, `tax_amount`, `shipping_amount`, `description`, `coupon_code`, `discount_amount`, `sub_total`, `is_confirmed`, `discount_description`, `is_finished`, `token`, `created_at`, `updated_at`) VALUES
(1, 0, '4', 'default', 'pending', '306.60', 1, 1, '26.96', '10.00', 'Please call me', NULL, '0.00', '269.64', 0, NULL, 1, '2fc8debf4b6e74f79fa3da7a321e2b36', '2020-11-19 17:56:52', '2020-11-19 17:57:08'),
(2, 12, '4', 'default', 'pending', '133.42', 2, 1, '11.22', '10.00', 'Please call me', NULL, '0.00', '112.20', 0, NULL, 1, '22c26a7aa79e789614eefafad4ab16ba', '2020-11-19 18:02:13', '2020-11-19 18:02:16'),
(3, 0, '4', 'default', 'pending', '410.03', 3, 3, '36.37', '10.00', 'qwertyukl;lkjhgfds', NULL, '0.00', '363.66', 0, NULL, 1, '64d62737643bc44ec415e22776b649aa', '2020-11-20 23:17:06', '2020-11-20 23:17:32'),
(4, 0, '4', 'default', 'pending', '15.99', 4, 3, '0.00', '10.00', NULL, NULL, '0.00', '5.99', 0, NULL, 1, '596ff22e4e2318666af72db93ca06007', '2020-12-31 22:53:09', '2020-12-31 22:58:55'),
(5, 13, '7', 'default', 'pending', '24.99', NULL, 3, '0.00', '10.00', NULL, NULL, '0.00', '14.99', 0, NULL, 1, '34c567bfe8d77bdd4110311691b83c13', '2021-03-10 02:22:31', '2021-03-10 02:24:58'),
(6, 13, '4', 'default', 'pending', '24.99', 5, 3, '0.00', '10.00', NULL, NULL, '0.00', '14.99', 0, NULL, 1, '64bc787463bad7713b1b4b09a1152065', '2021-03-10 02:29:41', '2021-03-10 02:29:41'),
(7, 0, '4', 'default', 'pending', '31.99', NULL, 3, '2.00', '10.00', 'Please deliver to my house', NULL, '0.00', '19.99', 0, NULL, 1, '77fdae60c21581b86167a910dcc87955', '2021-03-10 02:35:03', '2021-03-10 02:35:18'),
(8, 14, '4', 'default', 'pending', '33.72', NULL, 3, '1.16', '10.00', NULL, NULL, '0.00', '22.56', 0, NULL, 1, '55ad1a47d5d99127f285c47bbf677625', '2021-03-10 02:50:11', '2021-03-10 02:50:18'),
(9, 0, '4', 'default', 'pending', '24.99', NULL, 3, '0.00', '10.00', 'jhjhjhj', NULL, '0.00', '14.99', 0, NULL, 1, '58a7d6c7bfedba31dcbc6c55de006296', '2021-03-12 02:47:04', '2021-03-12 02:47:10'),
(10, 0, '4', 'default', 'pending', '31.99', NULL, 3, '2.00', '10.00', 'hhhhhhhhhhhhh', NULL, '0.00', '19.99', 0, NULL, 1, 'f9575fe11a199715c71fbe8ac9c93832', '2021-03-12 02:51:44', '2021-03-12 02:51:54'),
(11, 0, '4', 'default', 'pending', '20.00', NULL, 3, '0.00', '10.00', NULL, NULL, '0.00', '10.00', 0, NULL, 1, 'edb098093bd653d1b855c3038281e03a', '2021-03-12 22:55:16', '2021-03-12 22:55:43'),
(12, 0, '7', 'default', 'pending', '29.99', 6, 3, '0.00', '10.00', NULL, NULL, '0.00', '19.99', 0, NULL, 1, 'af7e1f5d7653b6b937d7f9aed9f08708', '2021-03-12 23:10:36', '2021-03-12 23:15:27'),
(13, 0, '4', 'default', 'pending', '21.99', NULL, 3, '2.00', '0.00', NULL, NULL, '0.00', '19.99', 0, NULL, 0, '692395df8e804fa7032e4ee9db10ed61', '2021-03-12 23:16:37', '2021-03-12 23:16:37'),
(14, 0, '4', 'default', 'pending', '24.99', NULL, 3, '0.00', '10.00', NULL, NULL, '0.00', '14.99', 0, NULL, 1, '3d99fcf993d4b80056d9c82cd10d6429', '2021-03-13 00:54:08', '2021-03-13 00:54:34'),
(15, 0, '4', 'default', 'pending', '29.99', 7, 3, '0.00', '10.00', NULL, NULL, '0.00', '19.99', 0, NULL, 1, '21986809c16734c286d92416cf573e6c', '2021-04-15 19:11:33', '2021-04-15 19:17:26'),
(16, 0, '7', 'default', 'pending', '31.99', NULL, 3, '2.00', '10.00', NULL, NULL, '0.00', '19.99', 0, NULL, 1, 'dd3aa1162f488b3a579e9d9f91ff34e0', '2021-04-15 19:18:53', '2021-04-15 19:19:05'),
(20, 0, '8', 'default', 'pending', '66.70', NULL, 4, '3.16', '10.00', 'test', NULL, '0.00', '53.54', 0, NULL, 1, 'a3bc59c3d9e87f60e864a5e95359f91f', '2021-05-02 11:04:41', '2021-05-02 11:07:22');

-- --------------------------------------------------------

--
-- Table structure for table `ec_order_addresses`
--

CREATE TABLE `ec_order_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_order_addresses`
--

INSERT INTO `ec_order_addresses` (`id`, `name`, `phone`, `country`, `state`, `city`, `address`, `order_id`, `email`) VALUES
(1, 'jonah rimamchirika', '09071752006', 'NG', 'Choose One...', 'Abuja', 'no.31 samora machel street asokoro abuja, fct', 1, 'jboyi@gmail.com'),
(2, 'jonah rimamchirika', '09071752006', 'NG', 'Choose One...', 'Abuja', 'no.31 samora machel street asokoro abuja, fct', 2, 'jboyi@gmail.com'),
(3, 'musa joe', '08171624968', 'NG', 'F.C.T', 'Abuja', 'no.31 samora machel street asokoro abuja, fct', 3, 'musajj@gmail.com'),
(4, 'Abayomi Ogunsola', '07774404449', 'GB', 'Worcestershire', 'Stoke Prior, Bromsgrove', '8, Furnival Drive', 4, 'ogunsola.abayomi@gmail.com'),
(5, 'Abayomi Ogunsola', '07774404449', 'GB', 'Worcestershire', 'Stoke Prior, Bromsgrove', '8 Furnival Drive, Stoke Prior', 5, 'ogunsola.abayomi@gmail.com'),
(6, 'Abayomi Ogunsola', '07774404449', 'GB', 'Worcestershire', 'Stoke Prior, Bromsgrove', '8 Furnival Drive, Stoke Prior', 5, 'ogunsola.abayomi@gmail.com'),
(7, 'Abayomi Ogunsola', '07774404449', 'GB', 'Worcestershire', 'Stoke Prior, Bromsgrove', '8 Furnival Drive, Stoke Prior', 6, 'ogunsola.abayomi@gmail.com'),
(8, 'Elisha Ado', '09071752006', 'NG', 'FCT', 'Abuja', '31 samora', 7, 'elishaado@gmail.com'),
(9, 'Elisha Ado', '09071752007', 'NG', 'FCT', 'Abuja', '31 samora', 8, 'elishaado1@gmail.com'),
(10, 'danladi kifasi', '08065544992', 'NG', 'Federal Capital Territory', 'Asokoro', '31 Samora Machel street', 9, 'ashley123@gmail.com'),
(11, 'danladi kifasi', '08065544992', 'NG', 'Federal Capital Territory', 'Asokoro', '31 Samora Machel street', 10, 'jboyi@gmail.com'),
(12, 'Musa jj', '08065544992', 'NG', 'Federal Capital Territory', 'Asokoro', '31 Samora Machel street', 11, 'musajj@gmail.com'),
(13, 'Abayomi Ogunsola', '07774404449', 'GB', 'Worcestershire', 'Stoke Prior, Bromsgrove', '8 Furnival Drive, Stoke Prior', 12, 'ogunsola.abayomi@gmail.com'),
(14, 'Abayomi Ogunsola', '07774404449', 'GB', 'Worcestershire', 'Stoke Prior, Bromsgrove', '8 Furnival Drive, Stoke Prior', 13, 'ogunsola.abayomi@gmail.com'),
(15, 'Abayomi Ogunsola', '07774404449', 'GB', 'West Midlands', 'Worcestershire', '8 Furnival Drive, Stoke Prior Bromsgrove, B60 4FX', 14, 'ogunsola.abayomi@gmail.com'),
(17, 'Yomi Oguns', '07774404449', 'GB', 'Worcestershire', 'Stoke Prior, Bromsgrove', '8 Furnival Drive, Stoke Prior', 16, 'oak2angel@yahoo.com'),
(21, 'Tester', '0000000000', 'GH', 'Accra', 'Accra', 'New McCarthyHill Add', 19, 'mike.test@gmail.com'),
(22, 'Tester', '0000000000', 'GH', 'Accra', 'Accra', 'New McCarthyHill Add', 19, 'mike.test@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `ec_order_histories`
--

CREATE TABLE `ec_order_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `extras` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_order_histories`
--

INSERT INTO `ec_order_histories` (`id`, `action`, `description`, `user_id`, `order_id`, `extras`, `created_at`, `updated_at`) VALUES
(1, 'create_order_from_payment_page', 'Order is created from checkout page', NULL, 1, NULL, '2020-11-19 17:57:08', '2020-11-19 17:57:08'),
(2, 'create_order', 'New order #ST-10000001 from jonah rimamchirika', NULL, 1, NULL, '2020-11-19 17:57:14', '2020-11-19 17:57:14'),
(3, 'send_order_confirmation_email', 'The email confirmation was sent to customer', NULL, 1, NULL, '2020-11-19 17:57:44', '2020-11-19 17:57:44'),
(4, 'create_order_from_payment_page', 'Order is created from checkout page', NULL, 2, NULL, '2020-11-19 18:02:16', '2020-11-19 18:02:16'),
(5, 'create_order', 'New order #ST-10000002 from Jonah Rimamchirika', NULL, 2, NULL, '2020-11-19 18:02:18', '2020-11-19 18:02:18'),
(6, 'send_order_confirmation_email', 'The email confirmation was sent to customer', NULL, 2, NULL, '2020-11-19 18:02:48', '2020-11-19 18:02:48'),
(7, 'create_order_from_payment_page', 'Order is created from checkout page', NULL, 3, NULL, '2020-11-20 23:17:32', '2020-11-20 23:17:32'),
(8, 'create_order', 'New order #ST-10000003 from musa joe', NULL, 3, NULL, '2020-11-20 23:17:39', '2020-11-20 23:17:39'),
(9, 'send_order_confirmation_email', 'The email confirmation was sent to customer', NULL, 3, NULL, '2020-11-20 23:18:10', '2020-11-20 23:18:10'),
(10, 'create_order_from_payment_page', 'Order is created from checkout page', NULL, 4, NULL, '2020-12-31 22:55:20', '2020-12-31 22:55:20'),
(11, 'create_order', 'New order #ST-10000004 from Abayomi Ogunsola', NULL, 4, NULL, '2020-12-31 22:58:58', '2020-12-31 22:58:58'),
(12, 'create_order_from_payment_page', 'Order is created from checkout page', NULL, 5, NULL, '2021-03-10 02:24:58', '2021-03-10 02:24:58'),
(13, 'create_order', 'New order #ST-10000005 from Abayomi Ogunsola', NULL, 5, NULL, '2021-03-10 02:25:04', '2021-03-10 02:25:04'),
(14, 'create_order_from_payment_page', 'Order is created from checkout page', NULL, 6, NULL, '2021-03-10 02:29:41', '2021-03-10 02:29:41'),
(15, 'create_order', 'New order #ST-10000006 from Abayomi Ogunsola', NULL, 6, NULL, '2021-03-10 02:29:43', '2021-03-10 02:29:43'),
(16, 'create_order_from_payment_page', 'Order is created from checkout page', NULL, 7, NULL, '2021-03-10 02:35:18', '2021-03-10 02:35:18'),
(17, 'create_order', 'New order #ST-10000007 from Elisha Ado', NULL, 7, NULL, '2021-03-10 02:35:20', '2021-03-10 02:35:20'),
(18, 'create_order_from_payment_page', 'Order is created from checkout page', NULL, 8, NULL, '2021-03-10 02:50:18', '2021-03-10 02:50:18'),
(19, 'create_order', 'New order #ST-10000008 from Elisha Ado', NULL, 8, NULL, '2021-03-10 02:50:20', '2021-03-10 02:50:20'),
(20, 'create_order_from_payment_page', 'Order is created from checkout page', NULL, 9, NULL, '2021-03-12 02:47:10', '2021-03-12 02:47:10'),
(21, 'create_order', 'New order #ST-10000009 from danladi kifasi', NULL, 9, NULL, '2021-03-12 02:47:15', '2021-03-12 02:47:15'),
(22, 'create_order_from_payment_page', 'Order is created from checkout page', NULL, 10, NULL, '2021-03-12 02:51:54', '2021-03-12 02:51:54'),
(23, 'create_order', 'New order #ST-10000010 from danladi kifasi', NULL, 10, NULL, '2021-03-12 02:51:56', '2021-03-12 02:51:56'),
(24, 'create_order_from_payment_page', 'Order is created from checkout page', NULL, 11, NULL, '2021-03-12 22:55:43', '2021-03-12 22:55:43'),
(25, 'create_order_from_payment_page', 'Order is created from checkout page', NULL, 12, NULL, '2021-03-12 23:13:11', '2021-03-12 23:13:11'),
(26, 'create_order_from_payment_page', 'Order is created from checkout page', NULL, 12, NULL, '2021-03-12 23:15:27', '2021-03-12 23:15:27'),
(27, 'create_order', 'New order #ST-10000012 from Abayomi Ogunsola', NULL, 12, NULL, '2021-03-12 23:15:31', '2021-03-12 23:15:31'),
(28, 'create_order_from_payment_page', 'Order is created from checkout page', NULL, 14, NULL, '2021-03-13 00:54:34', '2021-03-13 00:54:34'),
(29, 'create_order_from_payment_page', 'Order is created from checkout page', NULL, 15, NULL, '2021-04-15 19:12:59', '2021-04-15 19:12:59'),
(30, 'create_order_from_payment_page', 'Order is created from checkout page', NULL, 15, NULL, '2021-04-15 19:17:26', '2021-04-15 19:17:26'),
(31, 'create_order', 'New order #ST-10000015 from Yomi Oguns', NULL, 15, NULL, '2021-04-15 19:17:29', '2021-04-15 19:17:29'),
(32, 'create_order_from_payment_page', 'Order is created from checkout page', NULL, 16, NULL, '2021-04-15 19:19:05', '2021-04-15 19:19:05'),
(54, 'create_order_from_payment_page', 'Order is created from checkout page', NULL, 20, NULL, '2021-05-02 11:04:41', '2021-05-02 11:04:41'),
(55, 'create_order_from_payment_page', 'Order is created from checkout page', NULL, 20, NULL, '2021-05-02 11:07:22', '2021-05-02 11:07:22');

-- --------------------------------------------------------

--
-- Table structure for table `ec_order_product`
--

CREATE TABLE `ec_order_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` double(8,2) DEFAULT '0.00',
  `restock_quantity` int(10) UNSIGNED DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_order_product`
--

INSERT INTO `ec_order_product` (`id`, `order_id`, `qty`, `price`, `tax_amount`, `options`, `product_id`, `product_name`, `weight`, `restock_quantity`, `created_at`, `updated_at`) VALUES
(2, 1, 1, '269.64', '26.96', '[]', 11, 'Clutch handmade', 686.00, 0, '2020-11-19 17:57:08', '2020-11-19 17:57:08'),
(5, 2, 1, '42.90', '4.29', '[]', 27, 'The Marc Jacobs', 1295.00, 0, '2020-11-19 18:02:16', '2020-11-19 18:02:16'),
(6, 2, 2, '34.65', '3.47', '[]', 23, 'Cyan Boheme', 1295.00, 0, '2020-11-19 18:02:16', '2020-11-19 18:02:16'),
(8, 3, 1, '363.66', '36.37', '[]', 13, 'Gucci Zip Around Wallet', 687.00, 0, '2020-11-20 23:17:32', '2020-11-20 23:17:32'),
(10, 4, 1, '5.99', '0.00', '[]', 147, 'Deco Glam Round Glass Wax Filled Candle Pot Prosecco Scent', 220.00, 0, '2020-12-31 22:55:20', '2020-12-31 22:55:20'),
(12, 5, 1, '14.99', '0.00', '[]', 462, 'Ashley In-House-Aromatherapy, Handpoured scented soy wax candles presented in Silver Round Tin with Open Cover', 0.10, 0, '2021-03-10 02:24:58', '2021-03-10 02:24:58'),
(14, 6, 1, '14.99', '0.00', '[]', 462, 'Ashley In-House-Aromatherapy, Handpoured scented soy wax candles presented in Silver Round Tin with Open Cover', 0.10, 0, '2021-03-10 02:29:41', '2021-03-10 02:29:41'),
(16, 7, 1, '19.99', '2.00', '[]', 414, 'Ashley in-House Aromatherapy, Handpoured scented soy wax candles presented in Clear Glass', 0.10, 0, '2021-03-10 02:35:18', '2021-03-10 02:35:18'),
(19, 8, 1, '10.95', '0.00', '[]', 45, 'Star Fireworks 3D Lamp Silver', 18.00, 0, '2021-03-10 02:50:18', '2021-03-10 02:50:18'),
(20, 8, 1, '11.61', '1.16', '[]', 320, 'Ashley In-House-Soy Wax Melts presented in Small size clipped Lid top clear glass Jar', 18.00, 0, '2021-03-10 02:50:18', '2021-03-10 02:50:18'),
(22, 9, 1, '14.99', '0.00', '[]', 462, 'Ashley In-House-Aromatherapy, Handpoured scented soy wax candles presented in Silver Round Tin with Open Cover', 0.10, 0, '2021-03-12 02:47:10', '2021-03-12 02:47:10'),
(24, 10, 1, '19.99', '2.00', '[]', 414, 'Ashley in-House Aromatherapy, Handpoured scented soy wax candles presented in Clear Glass', 0.10, 0, '2021-03-12 02:51:54', '2021-03-12 02:51:54'),
(26, 11, 1, '10.00', '0.00', '[]', 603, 'Display Flower', 0.10, 0, '2021-03-12 22:55:43', '2021-03-12 22:55:43'),
(29, 12, 1, '19.99', '0.00', '[]', 497, 'Ashley in-House Aromatherapy, Handpoured scented soy wax candles presented in Clear Glass', 0.10, 0, '2021-03-12 23:15:27', '2021-03-12 23:15:27'),
(30, 13, 1, '19.99', '2.00', '[]', 430, 'Ashley in-House Aromatherapy, Handpoured scented soy wax candles presented in Clear Glass', 20.00, 0, '2021-03-12 23:16:37', '2021-03-12 23:16:37'),
(32, 14, 1, '14.99', '0.00', '[]', 467, 'Ashley In-House-Aromatherapy, Handpoured scented soy wax candles presented in Silver Round Tin with Open Cover', 0.10, 0, '2021-03-13 00:54:34', '2021-03-13 00:54:34'),
(35, 15, 1, '19.99', '0.00', '[]', 484, 'Ashley in-House Aromatherapy, Handpoured scented soy wax candles presented in Clear Glass', 0.10, 0, '2021-04-15 19:17:26', '2021-04-15 19:17:26'),
(37, 16, 1, '19.99', '2.00', '[]', 414, 'Ashley in-House Aromatherapy, Handpoured scented soy wax candles presented in Clear Glass', 0.10, 0, '2021-04-15 19:19:05', '2021-04-15 19:19:05'),
(113, 20, 1, '11.94', '0.00', '[]', 272, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', 53.00, 0, '2021-05-02 11:07:22', '2021-05-02 11:07:22'),
(114, 20, 1, '10.00', '0.00', '[]', 603, 'Display Flower', 53.00, 0, '2021-05-02 11:07:22', '2021-05-02 11:07:22'),
(115, 20, 1, '19.99', '2.00', '[]', 414, 'Ashley in-House Aromatherapy, Handpoured scented soy wax candles presented in Clear Glass', 53.00, 0, '2021-05-02 11:07:22', '2021-05-02 11:07:22'),
(116, 20, 1, '11.61', '1.16', '[]', 320, 'Ashley In-House-Soy Wax Melts presented in Small size clipped Lid top clear glass Jar', 53.00, 0, '2021-05-02 11:07:22', '2021-05-02 11:07:22');

-- --------------------------------------------------------

--
-- Table structure for table `ec_products`
--

CREATE TABLE `ec_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `images` text COLLATE utf8mb4_unicode_ci,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `quantity` int(10) UNSIGNED DEFAULT NULL,
  `allow_checkout_when_out_of_stock` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `with_storehouse_management` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `is_variation` tinyint(4) NOT NULL DEFAULT '0',
  `is_searchable` tinyint(4) NOT NULL DEFAULT '0',
  `is_show_on_list` tinyint(4) NOT NULL DEFAULT '0',
  `sale_type` tinyint(4) NOT NULL DEFAULT '0',
  `price` double UNSIGNED DEFAULT NULL,
  `sale_price` double UNSIGNED DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `length` double(8,2) DEFAULT NULL,
  `wide` double(8,2) DEFAULT NULL,
  `height` double(8,2) DEFAULT NULL,
  `weight` double(8,2) DEFAULT NULL,
  `barcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `length_unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wide_unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height_unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight_unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `views` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_products`
--

INSERT INTO `ec_products` (`id`, `name`, `description`, `content`, `status`, `images`, `sku`, `order`, `quantity`, `allow_checkout_when_out_of_stock`, `with_storehouse_management`, `is_featured`, `options`, `category_id`, `is_variation`, `is_searchable`, `is_show_on_list`, `sale_type`, `price`, `sale_price`, `start_date`, `end_date`, `length`, `wide`, `height`, `weight`, `barcode`, `length_unit`, `wide_unit`, `height_unit`, `weight_unit`, `brand_id`, `created_at`, `updated_at`, `tax_id`, `views`) VALUES
(4, 'Trio-set-of-3-mini-votive-candles-gift-box-pineapple-scent-50g', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\r\n\r\n<p>- Casual unisex fit</p>\r\n\r\n<p>- 64% polyester, 36% polyurethane</p>\r\n\r\n<p>- Water column pressure: 4000 mm</p>\r\n\r\n<p>- Model is 187cm tall and wearing a size S / M</p>\r\n\r\n<p>- Unisex fit</p>\r\n\r\n<p>- Drawstring hood with built-in cap</p>\r\n\r\n<p>- Front placket with snap buttons</p>\r\n\r\n<p>- Ventilation under armpit</p>\r\n\r\n<p>- Adjustable cuffs</p>\r\n\r\n<p>- Double welted front pockets</p>\r\n\r\n<p>- Adjustable elastic string at hempen</p>\r\n\r\n<p>- Ultrasonically welded seams</p>\r\n\r\n<p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/trio-set-of-3-mini-votive-candles-gift-box-pineapple-scent-50g.jpg\",\"products\\/thailand-set-of-3-mini-votive-candles-in-gift-box-thai-flower-market-scent-50g.jpg\"]', 'HS-127-A0', 0, 11, 0, 1, 1, NULL, NULL, 0, 0, 0, 0, 7.99, 0, NULL, NULL, 13.00, 15.00, 11.00, 599.00, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-07 02:12:41', '2021-04-28 01:49:25', 1, 71685),
(5, 'Candlelight Happy Reed Diffuser in Gift Box Wild Fig Scent 100ml', '<p>The Candlelight Happy Reed Diffuser is presented in a beautiful happy themed gift box.</p>', '<p>The wild fig fragrance can fill any room in a customers house with its delightful scent. This reed diffuser would make an amazing gift. Each reed diffuser contains 100ml of fragranced oil and 6 reeds which help maximise the scent for up to 45 days.</p>', 'published', '[\"products\\/room-fragrance\\/wild-fig-scent-1.jpg\"]', 'HS-147-A0', 0, 12, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 9.99, NULL, NULL, NULL, NULL, NULL, NULL, 10.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-11-07 02:12:41', '2021-04-30 07:10:59', 1, 86658),
(6, 'black-lily-and-pomegranate', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>', '<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\r\n\r\n<p>- Casual unisex fit</p>\r\n\r\n<p>- 64% polyester, 36% polyurethane</p>\r\n\r\n<p>- Water column pressure: 4000 mm</p>\r\n\r\n<p>- Model is 187cm tall and wearing a size S / M</p>\r\n\r\n<p>- Unisex fit</p>\r\n\r\n<p>- Drawstring hood with built-in cap</p>\r\n\r\n<p>- Front placket with snap buttons</p>\r\n\r\n<p>- Ventilation under armpit</p>\r\n\r\n<p>- Adjustable cuffs</p>\r\n\r\n<p>- Double welted front pockets</p>\r\n\r\n<p>- Adjustable elastic string at hempen</p>\r\n\r\n<p>- Ultrasonically welded seams</p>\r\n\r\n<p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>', 'published', '[\"products\\/room-fragrance\\/pink-pepper-1.jpg\"]', 'HS-130-A0', 0, 7, 0, 1, 1, NULL, NULL, 0, 0, 0, 0, 12.99, NULL, NULL, NULL, 12.00, 10.00, 20.00, 626.00, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-07 02:12:41', '2021-05-01 18:28:11', 1, 135092),
(7, 'White LED Aroma Lamp', '<p>New and exciting Aroma Lamp that is also an oil and wax melt fragrance burner.</p>', '<p>The touch Lamp has 3 light settings that are controlled by touching the base or by the top&nbsp;rim. The casing is a white&nbsp;colour with tree pattern that has 3 warm colour setting to create the mood in the room whilst the burner on top fills the room with your favourite aroma making for a relaxing experience. The lamp runs of mains supply. 10 cm x 12 cm.</p>', 'published', '[\"products\\/lights\\/white-led-aroma-lamp.png\"]', 'HS-131-A0', 0, 18, 0, 1, 1, NULL, NULL, 0, 0, 0, 0, 29.99, NULL, NULL, NULL, 10.00, 20.00, 17.00, 669.00, NULL, NULL, NULL, NULL, NULL, 0, '2020-11-07 02:12:41', '2021-05-01 18:37:14', 1, 196611),
(16, 'Snapshot Standard', NULL, NULL, 'published', '[\"products\\/trio-set-of-3-mini-votive-candles-gift-box-pineapple-scent-50g.jpg\",\"products\\/thailand-set-of-3-mini-votive-candles-in-gift-box-thai-flower-market-scent-50g.jpg\"]', 'HS-127-A0', 0, 11, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 7.99, 0, NULL, NULL, 13.00, 15.00, 11.00, 599.00, NULL, NULL, NULL, NULL, NULL, 7, '2020-11-07 02:12:41', '2021-04-12 09:10:50', NULL, 40),
(23, 'Cyan Boheme', NULL, NULL, 'published', '[\"products\\/room-fragrance\\/pink-pepper-1.jpg\"]', 'HS-130-A0', 0, 7, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 12.99, NULL, NULL, NULL, 12.00, 10.00, 20.00, 626.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-11-07 02:12:41', '2021-03-20 22:49:20', NULL, 0),
(27, 'The Marc Jacobs', NULL, NULL, 'published', '[\"products\\/lights\\/white-led-aroma-lamp.png\"]', 'HS-131-A0', 0, 18, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 10.00, 20.00, 17.00, 669.00, NULL, NULL, NULL, NULL, NULL, 7, '2020-11-07 02:12:41', '2021-04-27 17:36:19', NULL, 19),
(31, 'White Rose Gold Aroma Touch Lamp', '<p>New and exciting Aroma Lamp that is also an oil and wax melt fragrance burner.</p>', '<p>The touch Lamp has 3 light settings that are controlled by touching the base or by the top&nbsp;rim. The casing is a rose gold&nbsp;colour with tree pattern that has 3 warm colour setting to create the mood in the room whilst the burner on top fills the room with your favourite aroma making for a relaxing experience.</p>\r\n\r\n<p>The lamp runs of mains supply.</p>\r\n\r\n<p>10 cm x 12 cm.</p>', 'published', '[\"products\\/lights\\/white-rose-gold-aroma-touch-lamp.png\"]', 'AH-1-0', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 24.99, NULL, NULL, NULL, 10.00, 0.00, 12.00, 0.00, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-04 13:04:25', '2021-04-21 06:56:06', 0, 21),
(32, 'Red Silver Xmas Touch Lamp', '<p>New and exciting Aroma Lamp that is also an oil and wax melt fragrance burner.</p>', '<p>The touch Lamp has 3 light settings that are controlled by touching the base or by the top&nbsp;rim. The casing is&nbsp; red silver&nbsp;colour ,has 3 warm colour setting to create the mood in the room whilst the burner on top fills the room with your favourite aroma making for a relaxing experience.The lamp runs of mains supply.</p>', 'published', '[\"products\\/lights\\/red-silver-xmas-touch-lamp.png\"]', 'AH-1-1', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 24.99, NULL, NULL, NULL, 10.00, 0.00, 12.00, 0.00, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-04 13:13:35', '2021-04-21 07:56:32', 0, 8),
(33, 'Purple-Silver Hearts Touch Lamps', '<p>New and exciting Aroma Lamp that is also an oil and wax melt fragrance burner.</p>', '<p>The touch Lamp has 3 light settings that are controlled by touching the base or by the top&nbsp;rim. The casing is purple-silver&nbsp;colour with hearts&nbsp;pattern that has 3 warm colour setting to create the mood in the room whilst the burner on top fills the room with your favourite aroma making for a relaxing experience. The lamp runs of mains supply and it&rsquo;s 10 cm x 12 cm in size.</p>', 'published', '[\"products\\/lights\\/purple-silver-hearts-touch-lamps.png\"]', 'AH-1-2', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 24.99, NULL, NULL, NULL, 10.00, 0.00, 12.00, 0.00, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-04 13:17:00', '2021-03-31 13:11:05', 1, 7),
(34, 'Purple Silver Aroma Touch Lamp', '<p>New and exciting Aroma Lamp that is also an oil and wax melt fragrance burner.</p>', '<p>The touch Lamp has 3 light settings that are controlled by touching the base or by the top silver rim. The casing is a silver colour with tree pattern that has 3 warm colour setting to create the mood in the room whilst the burner on top fills the room with your favourite aroma making for a relaxing experience. The lamp runs of mains supply. 10 cm x 12 cm.</p>', 'published', '[\"products\\/lights\\/purple-silver-aroma-touch-lamp.png\"]', 'AH-1-3', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 23.99, NULL, NULL, NULL, 10.00, 0.00, 12.00, 0.00, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-04 13:25:42', '2021-04-30 18:16:24', 1, 6),
(35, 'White Rose Gold Hearts Touch Lamp', '<p>New and exciting Aroma Lamp that is also an oil and wax melt fragrance burner.</p>', '<p>The touch Lamp has 3 light settings that are controlled by touching the base or by the top&nbsp;rim. The casing is white rose gold&nbsp;colour with hearts&nbsp;pattern that has 3 warm colour setting to create the mood in the room whilst the burner on top fills the room with your favourite aroma making for a relaxing experience. The lamp runs of mains supply. 10 cm x 12 cm</p>', 'published', '[\"products\\/lights\\/white-rose-gold-hearts-touch-lamp.png\"]', 'AH-1-4', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 24.99, NULL, NULL, NULL, 10.00, 0.00, 12.00, 0.00, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-04 13:37:57', '2021-04-25 22:11:33', 1, 12),
(36, 'Hearts Colour Changing LED Silver Casing', '<p>This exciting new range of LED burners not only melt your favourite wax from our collections to fill your room with the fragrance your choice, but you have the choice of different colour settings or colour changing shuffle that really lights up the experience.</p>', '<p>This exciting new range of LED burners not only melt your favourite wax from our collections to fill your room with the fragrance your choice, but you have the choice of different colour settings or colour changing shuffle that really lights up the experience.</p>\r\n\r\n<p>Choose from 7 colours, on either shuffle mode or the colour of your choosing.</p>\r\n\r\n<p>For use with wax melts or oils.</p>\r\n\r\n<p>(Switch operated).</p>\r\n\r\n<p>The lamp runs of mains supply.</p>\r\n\r\n<p>10 cm x 12 cm.</p>', 'published', '[\"products\\/lights\\/hearts-colour-changing-led-silver-casing.png\"]', 'AH-1-5', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 29.99, NULL, NULL, NULL, 10.00, 0.00, 12.00, 0.00, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-04 13:51:49', '2021-04-30 18:19:28', 1, 13),
(37, 'Hearts Colour Changing LED Black Casing', '<p>An exciting new range of LED burners</p>', '<p>This exciting new range of LED burners not only melt your favourite wax from our collections to fill your room with the fragrance your choice, but you have the choice of different colour settings or colour changing shuffle that really lights up the experience.</p>\r\n\r\n<p>Choose from 7 colours, on either shuffle mode or the colour of your choosing.</p>\r\n\r\n<p>For use with wax melts or oils.</p>\r\n\r\n<p>(Switch operated).</p>\r\n\r\n<p>The lamp runs of mains supply.</p>\r\n\r\n<p>10 cm x 12 cm.</p>', 'published', '[\"products\\/lights\\/hearts-colour-changing-led-black-casing.png\"]', 'AH-1-6', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 29.99, NULL, NULL, NULL, 10.00, 0.00, 12.00, 0.00, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-04 14:24:08', '2021-04-27 20:36:40', 0, 10),
(38, 'Maple Leaf Colour Changing LED Silver Casing', '<p>A new range of LED burners not only melt your favourite wax from our collections to fill your room with the fragrance your choice.</p>', '<p>This exciting new range of LED burners not only melt your favourite wax from our collections to fill your room with the fragrance your choice, but you have the choice of different colour settings or colour changing shuffle that really lights up the experience.</p>\r\n\r\n<p>Choose from 7 colours, on either shuffle mode or the colour of your choosing.</p>\r\n\r\n<p>For use with wax melts or oils.</p>\r\n\r\n<p>(Switch operated).</p>\r\n\r\n<p>The lamp runs of mains supply.</p>\r\n\r\n<p>10 cm x 12 cm.</p>', 'published', '[\"products\\/lights\\/maple-leaf-colour-changing-led-silver-casing.png\"]', 'AH-1-7', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 29.99, NULL, NULL, NULL, 10.00, 0.00, 12.00, 0.00, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-04 14:52:47', '2021-04-11 05:55:52', 0, 12),
(39, 'Universe Colour Changing LED Silver Casing', '<p>A new range of LED burners not only melt your favourite wax from our collections to fill your room with the fragrance of your choice.</p>', '<p>This exciting new range of LED burners not only melt your favourite wax from our collections to fill your room with the fragrance of your choice, but you have the choice of different colour settings or colour changing shuffle that really lights up the experience. Choose from 7 colours, on either shuffle mode or the colour of your choosing.</p>\r\n\r\n<p>For use with wax melts or oils.</p>\r\n\r\n<p>(Switch operated).</p>\r\n\r\n<p>The lamp runs of mains supply.</p>\r\n\r\n<p>10 cm x 12 cm.</p>', 'published', '[\"products\\/lights\\/universe-colour-changing-led-silver-casing.png\"]', 'AH-1-8', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 29.99, NULL, NULL, NULL, 10.00, 0.00, 12.00, 0.00, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-04 14:56:04', '2021-04-28 04:41:17', 0, 15),
(40, 'Walnut Tree Wood Grain Colour Changing LED', '<p>A new range of LED burners not only melt your favourite wax from our collections to. fill your room with the fragrance of your choice</p>', '<p>This exciting new range of LED burners not only melt your favourite wax from our collections to fill your room with the fragrance of your choice, but you have the choice of different colour settings or colour changing shuffle that really lights up the experience.</p>\r\n\r\n<p>Choose from 7 colours, on either shuffle mode or the colour of your choosing.</p>\r\n\r\n<p>For use with wax melts or oils.</p>\r\n\r\n<p>(Switch operated).</p>\r\n\r\n<p>The lamp runs of mains supply.</p>\r\n\r\n<p>10 cm x 12 cm.</p>', 'published', '[\"products\\/lights\\/walnut-tree-wood-grain-colour-changing-led.png\"]', 'AH-1-9', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 29.99, NULL, NULL, NULL, 10.00, 0.00, 12.00, 0.00, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-04 15:15:05', '2021-04-25 19:43:57', 0, 12),
(41, 'Xmas Colour Changing LED Silver', '<p>A Christmas unique range of LED burners. Designed to melt your favourite wax from our collections and fill your room with our top fragrance of your choice for the holiday season.</p>', '<p>2020 Christmas unique range of LED burners. Designed to melt your favourite wax from our collections and fill your room with our top fragrance of your choice for the holiday season, with the choice of different colour settings and colour changing shuffle that really lights up the holiday experience.</p>\r\n\r\n<p>Choose from 7 colours, on either shuffle mode or the colour of your choosing.</p>\r\n\r\n<p>For use with wax melts or oils.</p>\r\n\r\n<p>(Switch operated).</p>\r\n\r\n<p>The lamp runs of mains supply.</p>\r\n\r\n<p>10 cm x 12 cm.</p>', 'published', '[\"products\\/lights\\/xmas-colour-changing-led-silver.png\"]', 'AH-1-10', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 29.99, NULL, NULL, NULL, 10.00, 0.00, 12.00, 0.00, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-04 15:37:59', '2021-04-28 01:30:24', 0, 13),
(42, 'Xmas Colour Changing LED White', '<p>A Christmas unique range of LED burners. Designed to melt your favourite wax from our collections and fill your room with our top fragrance of your choice for the holiday season</p>', '<p>2020 Christmas unique range of LED burners. Designed to melt your favourite wax from our collections and fill your room with our top fragrance of your choice for the holiday season, with the choice of different colour settings and colour changing shuffle that really lights up the holiday experience.</p>\r\n\r\n<p>Choose from 7 colours, on either shuffle mode or the colour of your choosing.</p>\r\n\r\n<p>For use with wax melts or oils.</p>\r\n\r\n<p>(Switch operated). The lamp runs of mains supply. 10 cm x 12 cm.</p>', 'published', '[\"products\\/lights\\/xmas-colour-changing-led-white.png\"]', 'AH-1-11', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 29.99, NULL, NULL, NULL, 10.00, 0.00, 12.00, 0.00, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-04 15:41:53', '2021-04-29 08:42:03', 0, 10),
(43, 'Rose Gold LED Aroma Lamp', '<p>A new range of LED burners not only melt your favourite wax from our collections to fill your room with the fragrance your choice</p>', '<p>This exciting new range of LED burners not only melt your favourite wax from our collections to fill your room with the fragrance your choice, but you have the choice of different colour settings or colour changing shuffle that really lights up the experience.</p>\r\n\r\n<p>Choose from 7 colours, on either shuffle mode or the colour of your choosing.</p>\r\n\r\n<p>For use with wax melts or oils.</p>\r\n\r\n<p>(Switch operated).&nbsp; The lamp runs of mains supply. 10 cm x 12 cm.</p>', 'published', '[\"products\\/lights\\/rose-gold-led-aroma-lamp.png\"]', 'AH-1-12', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 24.99, NULL, NULL, NULL, 10.00, 0.00, 12.00, 0.00, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-04 15:48:23', '2021-04-30 18:16:24', 0, 8),
(44, 'Butterflies 3D Lamp Silver Base', '<p>A new and exciting range of stunning Glass 3D Wax Melt Burner with &#39;touch technology&#39; creates a soothing atmosphere by heating wax melts, releasing your favourite scent whilst the colour changing light up pattern further adds to the experience in the room</p>', '<p>Our new and exciting range of stunning Glass 3D Wax Melt Burner with &#39;touch technology&#39; creates a soothing atmosphere by heating wax melts, releasing your favourite scent whilst the colour changing light up pattern further adds to the experience in the room.</p>\r\n\r\n<p>Just place your favourite scented wax melt from our collections in the bowl, turn on the burner and relax as the room is filled with your favourite fragrance and creates the perfect calming atmosphere.</p>\r\n\r\n<p>Touching the burner will give you three different levels of heat/light so you can control the mood of your burner.</p>', 'published', '[\"products\\/lights\\/col4-1.png\"]', 'AH-1-13', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 10.95, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-04 15:58:09', '2021-04-15 01:14:28', 1, 16),
(45, 'Star Fireworks 3D Lamp Silver', '<p>A new and exciting range of stunning Glass 3D Wax Melt Burner with &#39;touch technology&#39; creates a soothing atmosphere by heating wax melts</p>', '<p>Our new and exciting range of stunning Glass 3D Wax Melt Burner with &#39;touch technology&#39; creates a soothing atmosphere by heating wax melts, releasing your favourite scent whilst the colour changing light up pattern further adds to the experience in the room.</p>\r\n\r\n<p>Just place your favourite scented wax melt from our collections in the bowl, turn on the burner and relax as the room is filled with your favourite fragrance and creates the perfect calming atmosphere.</p>\r\n\r\n<p>Touching the burner will give you three different levels of heat/light so you can control the mood of your burner.</p>', 'published', '[\"products\\/lights\\/col4-1.png\"]', 'AH-1-14', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 10.95, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-04 16:08:29', '2021-04-27 20:49:06', 0, 44),
(46, 'Midas 2-in-1 Classic Fragrance Warmer', '<p>A Clean and bold gold touches accent this grey-beige&nbsp;2-in-1 Fragrance Warmer, which melts both wax melts in its beautiful dish and candles10 oz. and under on the warming plate</p>', '<p>Clean and bold gold touches accent this grey-beige&nbsp;2-in-1 Fragrance Warmer, which melts both wax melts in its beautiful dish and candles10 oz. and under on the warming plate.</p>\r\n\r\n<p>&bull;2-in-1 Classic Fragrance Warmers&nbsp;feature a versatile design that allows you to warm wax melts in the dish, or place a jar candle directly on the warming plate.&nbsp;</p>\r\n\r\n<p>&bull;Candle and&nbsp;wax warmers&nbsp;allow you to enjoy the fragrance of a lit candle, without flame, soot, or other pollutants.&nbsp;Simply place&nbsp;your favorite candle on the warming plate, or add wax melts to the dish, turn it on, and enjoy your favorite fragrance as it spreads through the room.&nbsp;</p>', 'published', '[\"products\\/lights\\/classic-collection.png\",\"hampers\\/c2.png\",\"hampers\\/c1.png\"]', 'AH-1-15', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 1, 10.95, NULL, '2020-12-31 13:54:52', '2021-07-21 12:54:56', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-04 16:12:25', '2021-04-24 20:55:25', 0, 69),
(49, 'Simple Large Wax Filled Pot 2 Wick Candle Black Lily and Pomegranate Scent', '<p>A Simple Large Wax Filled Pot 2 Wick Candle is a stylish wax filled put with shiny silver lid.</p>', '<p>The Simple Large Wax Filled Pot 2 Wick Candle is a stylish wax filled put with shiny silver lid. The candle is simple and stylish and would be a welcome addition to any customers home. The candle features a &#39;calm&#39; message to inspire relaxation. The 260g scented candle has a black lily &amp; pomegranate fragrance, and a burn time of 16 hours, and should always be handled with care once lit.</p>', 'published', '[\"products\\/candle-with-lid-black-lily-and-pomegranate-scent-130g.jpg\"]', 'AH-1-18', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 260.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-04 18:17:31', '2021-04-28 22:08:45', 0, 9),
(50, 'Candlelight Great Minds Drink Alike Reed Diffuser in Gift Box Midnight Rose Scent', '<p>A Candlelight Great Minds Drink Alike Reed Diffuser makes the ideal gift for any celebration.</p>', '<p>The Candlelight Great Minds Drink Alike Reed Diffuser makes the ideal gift for any celebration. The midnight rose scented oil can fill any room in a customers home with its fresh fragrance. The reed oil diffuser comes packaged in a coloured cylinder with the &#39;Great minds drink alike&#39; message in foil. Each reed diffuser is made of frosted glass, with a screw top lid. Each reed diffuser includes 6 reeds which help maximise the scent for up to 45 days.</p>', 'published', '[\"products\\/room-fragrance\\/great-minds-drink-alike-1.jpg\"]', 'AH-1-19', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 10.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-04 18:25:17', '2021-04-30 04:04:03', 0, 6),
(51, 'Candlelight Great Minds Drink Alike Large Wax Filled Pot Candle Midnight Rose Scent', '<p>A&nbsp; Candlelight Great Minds Drink Alike Large Wax Filled Pot Candle is a perfect gift with its &#39;Great minds drink alike&#39; message</p>', '<p>The Candlelight Great Minds Drink Alike Large Wax Filled Pot Candle is a perfect gift with its &#39;Great minds drink alike&#39; message.The midnight rose scented candle is contained in a frosted glass pot with a frosted glass lid, around the pot is its distinctive coloured band and inspirational message. Each 380g candle has a burn time of 45 hours and should always be handled with care once lit</p>', 'published', '[\"products\\/great-minds-drink-alike-large-wax-filled-pot-candle-midnight-rose-scent-380g.jpg\"]', 'AH-1-20', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 380.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-04 18:31:02', '2021-04-28 01:22:43', 0, 18),
(52, 'Candlelight Keep it Sassy Reed Diffuser in Gift Box White Flowers Scent', '<p>A Candlelight Keep it Sassy Reed Diffuser makes the perfect gift.</p>', '<p>The Candlelight Keep it Sassy Reed Diffuser makes the perfect gift. The reed oil diffuser comes packaged in a coloured cylinder with the &#39;Keep it sassy&#39; message in foil. Each reed diffuser contains a fresh white flowers fragranced oil, and is made of frosted glass, with a screw top lid. Each reed diffuser includes 6 reeds which help maximise the scent for up to 45 days.</p>', 'published', '[\"products\\/room-fragrance\\/keep-it-sassy-1.jpg\"]', 'AH-1-21', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 10.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-04 18:36:09', '2021-04-28 04:39:07', 1, 11),
(54, 'Candlelight Keep it Sassy Large Wax Filled Pot Candle White Flowers Scent', '<p>A Candlelight Keep it Sassy Large Wax Filled Pot Candle is a perfect addition to any customers home, and with its inspirational message, makes the perfect gift</p>', '<p>The Candlelight Keep it Sassy Large Wax Filled Pot Candle is a perfect addition to any customers home, and with its inspirational message, makes the perfect gift. The white flowers scented candle is contained in a frosted glass pot with a frosted glass lid, around the pot is its distinctive coloured band and inspirational message. Each 380g candle has a burn time of 45 hours and should always be handled with care once lit.&nbsp;</p>', 'published', '[\"products\\/keep-it-sassy-large-wax-filled-pot-candle-white-flowers-scent-380g.jpg\"]', 'AH-1-22', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 380.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-04 18:40:57', '2021-04-06 05:25:27', 1, 6),
(55, 'Candlelight Let\'s Get It On Reed Diffuser in Gift Box Honeysuckle and Ivy Scent', '<p>A Candlelight Let&#39;s Get It On Reed Diffuser can be a subtle addition to any customers home, and with its inspirational message, makes the perfect gift.</p>', '<p>The Candlelight Let&#39;s Get It On Reed Diffuser can be a subtle addition to any customers home, and with its inspirational message, makes the perfect gift. The reed oil diffuser comes packaged in a coloured cylinder with the Let&#39;s get it on&#39; message in silver foil. Each reed diffuser contains a distinctive honeysuckle &amp; ivy fragranced oil, and is made of frosted glass, with a screw top lid. Each reed diffuser includes 6 reeds which help maximise the scent for up to 45 days.</p>', 'published', '[\"products\\/room-fragrance\\/honeysuckle-and-ivy-1.jpg\"]', 'AH-1-23', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 10.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-04 18:45:16', '2021-04-27 21:09:01', 0, 10),
(57, 'Candlelight Let\'s Get It On Large Wax Filled Pot Candle Honeysucke and Ivy Scent', '<p>A Candlelight Let&#39;s Get It On Large Wax Filled Pot Candle makes the perfect gift with its inspiration message and pale blue band.</p>', '<p>The Candlelight Let&#39;s Get It On Large Wax Filled Pot Candle makes the perfect gift with its inspiration message and pale blue band. The scented candle is contained in a frosted glass pot with a frosted glass lid, around the pot is its distinctive coloured band and inspirational lets get it on message. Each 380g candle has a burn time of 45 hours and should always be handled with care once lit</p>', 'published', '[\"products\\/let-s-get-it-on-large-wax-filled-pot-candle-honeysucke-and-ivy-scent-380g.jpg\"]', 'AH-1-24', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 380.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-04 18:49:19', '2021-04-25 17:53:43', 0, 5),
(58, 'Candlelight Bohemian Reed Diffuser in Gift Box Amber Lily Scent', '<p>A Candlelight Bohemian Reed Diffuser is perfect for placing around the home. The amber lily scented oil can fill any room in a customers home with its delightful fragrance</p>', '<p>The Candlelight Bohemian Reed Diffuser is perfect for placing around the home. The amber lily scented oil can fill any room in a customers home with its delightful fragrance. The reed oil diffuser comes packaged in a coloured cylinder with the ochre and gold pattern. Each reed diffuser is made of glass with a printed gold pattern, with a screw top lid. Each reed diffuser contains 150ml of fragranced oil and 6 reeds which help maximise the scent for up to 45 days.</p>', 'published', '[\"products\\/room-fragrance\\/amber-lily-1.jpg\"]', 'AH-1-25', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 10.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-04 18:53:12', '2021-04-24 15:51:53', 1, 6),
(59, 'Candlelight Bohemian Small Tin Candle Amber Lily Scent', '<p>A Candlelight Bohemian Small Tin Candle is presented in an elegant gold colour tin with ochre and gold coloured label, this item is ideal for customers to place around their homes.</p>', '<p>The Candlelight Bohemian Small Tin Candle is presented in an elegant gold colour tin with ochre and gold coloured label, this item is ideal for customers to place around their homes. Its distinctive amber lily scent can fill the room with its fragrance, with a burn time of 6 hours. Each 60g candle should always be handled with care once lit.</p>', 'published', '[\"products\\/bohemian-large-tin-candle-amber-lily-scent-130g.jpg\"]', 'AH-1-26', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 2.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 60.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-04 18:58:58', '2021-04-28 19:09:27', 0, 9),
(60, 'Candlelight Let There Be Candlelight Reed Diffuser in Gift Box Orangeblossom Musk Scent', '<p>A Candlelight Let There Be Candlelight Reed Diffuser is a perfect addition to any customers home, and with its inspirational message, makes the perfect gift.</p>', '<p>The Candlelight Let There Be Candlelight Reed Diffuser is a perfect addition to any customers home, and with its inspirational message, makes the perfect gift. The reed oil diffuser comes packaged in a coloured cylinder with the &#39;Let there be Candlelight&#39; message in gold foil. Each reed diffuser contains orangeblossom musk fragranced oil, and is made of frosted glass, with a gold effect screw top lid. Each reed diffuser includes 6 reeds which help maximise the scent for up to 45 days.</p>', 'published', '[\"products\\/room-fragrance\\/orangeblossom-musk-1.jpg\"]', 'AH-1-27', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 10.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-04 19:05:58', '2021-04-26 02:57:30', 0, 8),
(61, 'Candlelight Let There Be Candlelight Large Wax Filled Pot Candle Orangeblossom Musk Scent', '<p>A Candlelight Let There Be Candlelight Large Wax Filled Pot Candle makes the perfect gift with its inspiration message and uplifting orangeblossom musk fragrance</p>', '<p>The Candlelight Let There Be Candlelight Large Wax Filled Pot Candle makes the perfect gift with its inspiration message and uplifting orangeblossom musk fragrance. The scented candle is contained in a frosted glass pot with a frosted glass lid, around the pot is its distinctive coloured band and contemporary gold foil inspirational message. Each 380g candle has a burn time of 45 hours and should always be handled with care once lit.</p>', 'published', '[\"products\\/let-there-be-candlelight-large-wax-filled-pot-candle-orangeblossom-musk-scent-380g.jpg\"]', 'AH-1-28', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 380.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-04 19:12:40', '2021-04-17 22:42:09', 1, 7),
(62, 'Candlelight Morocco Reed Diffuser in Gift Box Moroccan Red Cinnamon Scent', '<p>A Candlelight Moroccan Reed Diffuser is packed in a stunning Moroccan inspired gift box, with the pot itself being printed in an themed print to match</p>', '<p>The Candlelight Moroccan Reed Diffuser is packed in a stunning Moroccan inspired gift box, with the pot itself being printed in an themed print to match. This item is the perfect gift, but is also ideal for customers to place around the home to re live the sights and scents of foreign travel. Each reed diffuser contains 150ml of indulgent Moroccan red cinnamon fragranced oil and 6 reeds which help maximise the scent for up to 45 days.</p>', 'published', '[\"products\\/room-fragrance\\/moroccan-red-cinnamon-1.jpg\"]', 'AH-1-29', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 10.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-04 19:19:00', '2021-04-27 23:13:22', 1, 8),
(63, 'Candlelight Morocco Small Wax Filled Pot Candle in Gift Box Moroccan Red Cinnamon Scent', '<p>Candlelight Moroccan Small Wax Filled Pot Candle is packed in a stunning Moroccan inspired gift box, with the pot itself being printed in an themed print to match.</p>', '<p>The Candlelight Moroccan Small Wax Filled Pot Candle is packed in a stunning Moroccan inspired gift box, with the pot itself being printed in an themed print to match. This item is the perfect gift, but is also ideal for customers to place around the home to re live the sights and scents of foreign travel. The indulgant Moroccan red cinnamon 380g scented candle has a burn time of 26 hours and should always be handled with care once lit.&nbsp;</p>', 'published', '[\"products\\/candle-in-gift-box-moroccan-red-cinnamon-scent-220g.jpg\"]', 'AH-1-30', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 220.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-04 19:25:29', '2021-04-30 01:53:59', 0, 7),
(65, 'Candlelight Morocco Wax Filled Pot 2 Wick Candle Moroccan Red Cinnamon Scent', '<p>A Candlelight Moroccan Wax Filled Pot 2 Wick Candle is contained in a stunning bold glass pot with a themed colour label</p>', '<p>The Candlelight Moroccan Wax Filled Pot 2 Wick Candle is contained in a stunning bold glass pot with a themed colour label. This item is the perfect gift, but is also ideal for customers to place around the home as a bold statement with its bright colour and scent. The indulgant Moroccan red cinnamon 380g scented candle has a burn time of 30 hours and should always be handled with care once lit.</p>', 'published', '[\"products\\/2-wick-candle-moroccan-red-cinnamon-scent-380g.jpg\"]', 'AH-1-31', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 380.00, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-04 19:39:43', '2021-04-27 16:59:28', 1, 7),
(66, 'Candlelight Morocco Set of 3 Mini Votive Candles in Gift Box Moroccan Red Cinnamon Scent', '<p>A Candlelight Moroccan Set of 3 Mini Votive Candles are presented in an elegant collection of gift boxes, each named with themed names such as &quot;Spice, Amber &amp; Jasmine</p>', '<p>The Candlelight Moroccan Set of 3 Mini Votive Candles are presented in an elegant collection of gift boxes, each named with themed names such as &quot;Spice, Amber &amp; Jasmine&quot;. Each gift box contains a 50g scented mini votive candle in a mix of bold colours in a simple glass jar, perfect for placing around the home, or for the perfect candle gift set. Each candle has an approximate burn time of up to 7 hours, and should always be handled with care once lit.</p>', 'published', '[\"products\\/morocco-set-of-3-mini-votive-candles-in-gift-box-moroccan-red-cinnamon-scent-50g.jpg\"]', 'AH-1-32', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 50.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-04 19:53:41', '2021-04-21 07:30:17', 1, 5),
(67, 'Candlelight Bohemian Reed Diffuser in Gift Box Angel Flower Scent', '<p>A Candlelight Bohemian Reed Diffuser is perfect for placing around the home. The angel flower scented oil can fill any room in a customers home with its delightful fragrance.</p>', '<p>The Candlelight Bohemian Reed Diffuser is perfect for placing around the home. The angel flower scented oil can fill any room in a customers home with its delightful fragrance. The reed oil diffuser comes packaged in a coloured cylinder with the plum and gold pattern. Each reed diffuser is made of glass with a printed gold pattern, with a screw top lid. Each reed diffuser contains 150ml of fragranced oil and 6 reeds which help maximise the scent for up to 45 days.</p>', 'published', '[\"products\\/room-fragrance\\/angel-flower-1.jpg\"]', 'AH-1-33', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 10.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-04 20:01:11', '2021-04-14 22:55:23', 1, 5),
(68, 'Candlelight Bohemian Set of 3 Small Tin Candles Amber Shea, Angel Flower, Amber Lily Scent', '<p>A&nbsp; Candlelight Bohemian Set of 3 Small Tin Candles are presented in an elegant card tray.</p>', '<p>The Candlelight Bohemian Set of 3 Small Tin Candles are presented in an elegant card tray. Each tin contains a 60g scented candle, including the scents of Angel flower, amber shea and amber lily, perfect for placing around the home, or for the perfect candle gift set. Each candle has an approximate burn time of up to 6 hours, and should always be handled with care once lit.</p>', 'published', '[\"products\\/3-small-tin-candles-amber-shea-angel-flower-amber-lily-scent-60g.jpg\"]', 'AH-1-34', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 60.00, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-04 20:05:14', '2021-04-20 02:14:58', 0, 6),
(70, 'Candlelight Japan Reed Diffuser in Gift Box Japanese Wild Summer Cherry Scent', '<p>A Candlelight Japan Reed Diffuser is packed in a stunning Japan inspired gift box, with the pot itself being printed in an themed print to match.</p>', '<p>The Candlelight Japan Reed Diffuser is packed in a stunning Japan inspired gift box, with the pot itself being printed in an themed print to match. This item is the perfect gift, but is also ideal for customers to place around the home to re live the sights and scents of foreign travel. Each reed diffuser contains 150ml of delightful Japanese wild summer cherry fragranced oil and 6 reeds which help maximise the scent for up to 45 days.</p>', 'published', '[\"products\\/room-fragrance\\/japanese-wild-summer-cherry-1.jpg\"]', 'AH-1-36', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 10.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-04 20:18:17', '2021-05-01 02:58:36', 0, 6),
(71, 'Candlelight Japan Small Wax Filled Pot Candle in Gift Box Japanese Wild Summer Cherry Scent', '<p>A Candlelight Japan Small Wax Filled Pot Candle is packed in a stunning Japan inspired gift box, with the pot itself being printed in an themed print to match.</p>', '<p>The Candlelight Japan Small Wax Filled Pot Candle is packed in a stunning Japan inspired gift box, with the pot itself being printed in an themed print to match. This item is the perfect gift, but is also ideal for customers to place around the home to re live the sights and scents of foreign travel. The delightful Japanese wild summer cherry 380g scented candle has a burn time of 26 hours and should always be handled with care once lit.</p>', 'published', '[\"products\\/candle-in-gift-box-japanese-wild-summer-cherry-scent-220g.jpg\"]', 'AH-1-37', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 220.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-04 20:24:47', '2021-04-26 05:32:16', 0, 6),
(72, 'Candlelight Japan Wax Filled Pot 2 Wick Candle Japanese Wild Summer Cherry Scent', '<p>A Candlelight Japan Wax Filled Pot 2 Wick Candle is contained in a stunning purple glass pot with a themed colour label.</p>', '<p>The Candlelight Japan Wax Filled Pot 2 Wick Candle is contained in a stunning purple glass pot with a themed colour label. This item is the perfect gift, but is also ideal for customers to place around the home as a bold statement with its bright colour and scent. The delightful Japanese wild summer cherry 380g scented candle has a burn time of 30 hours and should always be handled with care once lit.&nbsp;</p>', 'published', '[\"products\\/2-wick-candle-japanese-wild-summer-cherry-scent-380g.jpg\"]', 'AH-1-38', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 380.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-04 20:29:59', '2021-04-28 03:31:05', 1, 6),
(73, 'Candlelight Japan Set of 3 Mini Votive Candles in Gift Box Japanese Wild Summer Cherry Scent', '<p>A Candlelight Japan Set of 3 Mini Votive Candles are presented in an elegant collection of gift boxes, each named with themed names such as &quot;Cherry, apple &amp; Pear&quot;</p>', '<p>The Candlelight Japan Set of 3 Mini Votive Candles are presented in an elegant collection of gift boxes, each named with themed names such as &quot;Cherry, apple &amp; Pear&quot;. Each gift box contains a 50g scented mini votive candle in a mix of bold colours in a simple glass jar, perfect for placing around the home, or for the perfect candle gift set. Each candle has an approximate burn time of up to 7 hours, and should always be handled with care once lit.</p>', 'published', '[\"products\\/3-mini-votive-candles-in-gift-box-japanese-wild-summer-cherry-scent-50g.jpg\"]', 'AH-1-39', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 50.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-04 20:36:20', '2021-04-17 03:07:54', 0, 10),
(74, 'Candlelight India Reed Diffuser in Gift Box Kashmir and Fig Scent', '<p>A Candlelight India Reed Diffuser is packed in a stunning Indian inspired gift box, with the pot itself being printed in an themed print to match.</p>', '<p>The Candlelight India Reed Diffuser is packed in a stunning Indian inspired gift box, with the pot itself being printed in an themed print to match. This item is the perfect gift, but is also ideal for customers to place around the home to re live the sights and scents of foreign travel. Each reed diffuser contains 150ml of indulgent Kashmir pear &amp; fig fragranced oil and 6 reeds which help maximise the scent for up to 45 days.</p>', 'published', '[\"products\\/room-fragrance\\/kashmir-and-fig-1.jpg\"]', 'AH-1-40', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 10.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-04 22:32:30', '2021-04-26 00:03:01', 0, 6),
(75, 'Candlelight India Small Wax Filled Pot Candle in Gift Box Kashmir and Fig Scent', '<p>A Candlelight India Small Wax Filled Pot Candle is packed in a stunning Indian inspired gift box.</p>', '<p>The Candlelight India Small Wax Filled Pot Candle is packed in a stunning Indian inspired gift box, with the pot itself being printed in an themed print to match. This item is the perfect gift, but is also ideal for customers to place around the home to re live the sights and scents of foreign travel. The indulgent Kashmir pear &amp; fig 380g scented candle has a burn time of 26 hours and should always be handled with care once lit.</p>', 'published', '[\"products\\/india-small-wax-filled-pot-candle-in-gift-box-kashmir-and-fig-scent-220g.jpg\"]', 'AH-1-41', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 220.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-04 22:37:33', '2021-04-27 23:22:56', 0, 7),
(76, 'Candlelight India Wax Filled Pot 2 Wick Candle Kashmir and Fig Scent', '<p>A Candlelight India Wax Filled Pot 2 Wick Candle is contained in a stunning purple glass pot with a themed colour label</p>', '<p>The Candlelight India Wax Filled Pot 2 Wick Candle is contained in a stunning purple glass pot with a themed colour label. This item is the perfect gift, but is also ideal for customers to place around the home as a bold statement with its bright colour and scent. The indulgent Kashmir pear &amp; fig 380g scented candle has a burn time of 30 hours and should always be handled with care once lit.</p>', 'published', '[\"products\\/2-wick-candle-kashmir-and-fig-scent-380g.jpg\"]', 'AH-1-42', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 38.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-04 22:41:07', '2021-04-27 22:13:26', 1, 7),
(77, 'Candlelight India Set of 3 Mini Votive Candles in Gift Box Kashmir and Fig Scent', '<p>A Candlelight India Set of 3 Mini Votive Candles are presented in an elegant collection of gift boxes, each named with themed names such as &quot;Pear, Fig &amp; Plum&quot;</p>', '<p>The Candlelight India Set of 3 Mini Votive Candles are presented in an elegant collection of gift boxes, each named with themed names such as &quot;Pear, Fig &amp; Plum&quot;. Each gift box contains a 50g scented mini votive candle in a mix of bold colours in a simple glass jar, perfect for placing around the home, or for the perfect candle gift set. Each candle has an approximate burn time of up to 7 hours, and should always be handled with care once lit.</p>', 'published', '[\"products\\/india-set-of-3-mini-votive-candles-in-gift-box-kashmir-and-fig-scent-50g.jpg\"]', 'AH-1-43', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 50.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-04 22:45:08', '2021-05-01 14:56:04', 1, 7),
(78, 'Candlelight Siesta Reed Diffuser in Gift Box Pineapple Scent', '<p>A Candlelight Siesta reed diffuser is a delightful addition to any customers home, or for the perfect gift.</p>', '<p>The Candlelight Siesta reed diffuser is a delightful addition to any customers home, or for the perfect gift. Presented in a beautiful gift box, the Siesta design features on a wide range of products from Candlelight, making this reed oil diffuser the perfect companion to our range of scented candles. Contained within the gift box is a 150ml glass bottle containing pineapple aroma scented oil, along with 6 individual reeds for maximum scent coverage or prolonging the lifetime of the diffuser.</p>', 'published', '[\"products\\/room-fragrance\\/candlelight-home-reed-diffuser-candlelight-siesta-reed-diffuser-in-gift-box-pineapple-scent-150ml.jpg\"]', 'AH-1-44', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 10.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-04 23:37:46', '2021-04-29 06:57:49', 1, 9),
(108, 'Candlelight Chinoiserie Reed Diffuser Oriental Flower Scent', '<p>A Candlelight Chinoiserie collection features a stunning &amp; vibrant floral design across wax filled candle pots and reed diffusers.</p>', '<p>The Candlelight Chinoiserie collection features a stunning &amp; vibrant floral design across wax filled candle pots and reed diffusers. The reed diffuser is presented in a cylinder gift box with a stunning floral design with a pink background, finished with elegant gold foil and an open window showing the glass vessel. Contained in each gift box is the glass bottle which contains 150ml oriental flower fragranced oil, and 6 individual reeds for maximum scent coverage for up to 45 days.</p>', 'published', '[\"products\\/baskets\\/candle.jpg\"]', 'AH-1-64', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 12.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-05 23:00:22', '2021-04-12 11:09:44', 1, 5),
(109, 'Candlelight Chinoiserie 2 Wick Wax Filled Candle Pot Oriental Flower Scent', '<p>A Chinoiserie 2 wick wax filled candle pot is the perfect addition to add colour to any room finished frosted pink glass.</p>', '<p>The Chinoiserie 2 wick wax filled candle pot is the perfect addition to add colour to any room finished frosted pink glass. The scented candle is packed with a wick disc with an eye-catching floral design over a pink background, finished with elegant gold foiling. The oriental flower 380g scented candle has a burn time of 30 hours.</p>', 'published', '[\"products\\/baskets\\/filled-candle.jpg\"]', 'AH-1-65', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 380.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-05 23:03:56', '2021-04-15 01:10:53', 1, 2);
INSERT INTO `ec_products` (`id`, `name`, `description`, `content`, `status`, `images`, `sku`, `order`, `quantity`, `allow_checkout_when_out_of_stock`, `with_storehouse_management`, `is_featured`, `options`, `category_id`, `is_variation`, `is_searchable`, `is_show_on_list`, `sale_type`, `price`, `sale_price`, `start_date`, `end_date`, `length`, `wide`, `height`, `weight`, `barcode`, `length_unit`, `wide_unit`, `height_unit`, `weight_unit`, `brand_id`, `created_at`, `updated_at`, `tax_id`, `views`) VALUES
(110, 'Candlelight Chinoiserie Set of 3 Wax Filled Candle Pots Oriental Flower Scent', '<p>A Candlelight Chinoiserie collection features a stunning &amp; vibrant floral design across wax filled candle pots and reed diffusers.</p>', '<p>The Candlelight Chinoiserie collection features a stunning &amp; vibrant floral design across wax filled candle pots and reed diffusers. The set of 3 wax filled pots are packaged with an eye-catching floral design over a pink background, finished with elegant gold foiling. The pots are each finished in frosted pink glass. The beautiful oriental flower 50g scented candles have a burn time of 8 hours.</p>', 'published', '[\"products\\/baskets\\/wax-1.jpg\"]', 'AH-1-66', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 50.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-05 23:14:59', '2021-04-28 05:48:55', 1, 3),
(111, 'Candlelight Chinoiserie Reed Diffuser Oriental Lily Scent', '<p>A Candlelight Chinoiserie collection features a stunning &amp; vibrant floral design across wax filled candle pots and reed diffusers.</p>', '<p>The Candlelight Chinoiserie collection features a stunning &amp; vibrant floral design across wax filled candle pots and reed diffusers. The reed diffuser is presented in a cylinder gift box with a stunning floral design with an ochre background, finished with elegant gold foil and an open window showing the glass vessel. Contained in each gift box is the glass bottle which contains 150ml oriental lily fragranced oil, and 6 individual reeds for maximum scent coverage for up to 45 days.</p>', 'published', '[\"products\\/baskets\\/reed.jpg\"]', 'AH-1-67', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 12.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-05 23:21:19', '2021-04-14 19:55:52', 1, 3),
(112, 'Candlelight Chinoiserie 2 Wick Wax Filled Candle Pot Oriental Lily Scent', '<p>A Chinoiserie 2 wick wax filled candle pot is the perfect addition to add colour to any room.</p>', '<p>The Chinoiserie 2 wick wax filled candle pot is the perfect addition to add colour to any room. The pot is finished frosted bright pink glass. The scented candle is packed with a wick disc with an eye-catching floral design over an ochre background, finished with elegant gold foiling. The oriental lily 380g scented candle has a burn time of 30 hours.</p>', 'published', '[\"products\\/baskets\\/wick.jpg\"]', 'AH-1-68', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 380.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-05 23:25:12', '2021-04-28 14:05:54', 1, 3),
(113, 'Candlelight Chinoiserie Set of 3 Wax Filled Candle Pots Oriental Lily Scent', '<p>A Candlelight Chinoiserie collection features a stunning &amp; vibrant floral design across wax filled candle pots and reed diffusers.</p>', '<p>The Candlelight Chinoiserie collection features a stunning &amp; vibrant floral design across wax filled candle pots and reed diffusers. The set of 3 wax filled pots are packaged with an eye-catching floral design over an ochre background, finished with elegant gold foiling. The pots are each finished in frosted bright pink glass. The beautiful oriental lily 50g scented candles have a burn time of 8 hours each.</p>', 'published', '[\"products\\/baskets\\/lily.jpg\"]', 'AH-1-69', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 50.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-05 23:34:18', '2021-04-21 01:16:32', 0, 3),
(114, 'Candlelight Chinoiserie Reed Diffuser Aromatic Shea Scent', '<p>A Candlelight Chinoiserie collection features a stunning &amp; vibrant floral design across wax filled candle pots and reed diffusers.</p>', '<p>The Candlelight Chinoiserie collection features a stunning &amp; vibrant floral design across wax filled candle pots and reed diffusers. The reed diffuser is presented in a cylinder gift box with a stunning floral design with an ether background, finished with elegant gold foil and an open window showing the glass vessel. Contained in each gift box is the glass bottle which contains 150ml aromatic shea fragranced oil, and 6 individual reeds for maximum scent coverage for up to 45 days.</p>', 'published', '[\"products\\/baskets\\/shea.jpg\"]', 'AH-1-70', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 12.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-05 23:39:33', '2021-04-29 04:32:19', 1, 3),
(115, 'Candlelight Chinoiserie 2 Wick Wax Filled Candle Pot Aromatic Shea Scent', '<p>A Chinoiserie 2 wick wax filled candle pot is the perfect addition to add colour to any room. The pot is finished frosted bright pink glass.</p>', '<p>The Chinoiserie 2 wick wax filled candle pot is the perfect addition to add colour to any room. The pot is finished frosted bright pink glass. The scented candle is packed with a wick disc with an eye-catching floral design over an ether background, finished with elegant gold foiling. The aromatic shea 380g scented candle has a burn time of 30 hours.</p>', 'published', '[\"products\\/baskets\\/pot.jpg\"]', 'AH-1-71', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 380.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-05 23:43:24', '2021-04-14 16:06:31', 1, 2),
(116, 'Candlelight Chinoiserie Set of 3 Wax Filled Candle Pots Aromatic Shea Scent', '<p>A Candlelight Chinoiserie collection features a stunning &amp; vibrant floral design across wax filled candle pots and reed diffusers.</p>', '<p>The Candlelight Chinoiserie collection features a stunning &amp; vibrant floral design across wax filled candle pots and reed diffusers. The set of 3 wax filled pots are packaged with an eye-catching floral design over an ether background, finished with elegant gold foiling. The pots are each finished in frosted bright pink glass. The beautiful aromatic shea 50g scented candles have a burn time of 8 hours each.</p>', 'published', '[\"products\\/baskets\\/3wax.jpg\"]', 'AH-1-72', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-06 00:18:16', '2021-04-28 00:27:18', 1, 7),
(117, 'Candlelight Spa Day Relax Reed Diffuser Lavender & Vanilla Scent', '<p>A Spa Day reed diffuser is an ideal to inspire relaxation. The reed diffuser is presented in a stunning cream &amp; gold cylindrical gift box.</p>', '<p>The Spa Day reed diffuser is an ideal to inspire relaxation. The reed diffuser is presented in a stunning cream &amp; gold cylindrical gift box. Each glass bottle is decorated with a gold foil. Contained in each gift box is the glass bottle which contains 150ml lavender &amp; vanilla fragranced oil, and 6 individual reeds for maximum scent coverage for up to 45 days.</p>', 'published', '[\"products\\/baskets\\/relax.jpg\"]', 'AH-1-73', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 12.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-06 00:24:32', '2021-04-21 00:34:43', 1, 8),
(118, 'Candlelight Spa Day Relax 2 Wick Wax Filled Glass Candle Pot Lavender & Vanilla Scent', '<p>The Candlelight Spa Day 2 wick wax filled candle pot is the perfect addition to any relaxing room setting.&nbsp;</p>', '<p>The Candlelight Spa Day 2 wick wax filled candle pot is the perfect addition to any relaxing room setting. The glass pot is finished with a gold foil swirl to make the item stand out. The scented candle is packed with a cream coloured wick disc with the same gold foil swirl and &#39;relax&#39; message. The lavender &amp; vanilla 340g scented candle has a burn time of 26 hours</p>', 'published', '[\"products\\/baskets\\/relax2.jpg\"]', 'AH-1-74', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 340.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-06 00:27:59', '2021-04-29 05:06:12', 1, 10),
(119, 'Candlelight Spa Day Relax Set of 3 Glass Wax Filled Pots Lavender & Vanilla Scent', '<p>A Candlelight Spa Day set of 3 wax filled candle pots are the perfect addition to any relaxing room setting</p>', '<p>The Candlelight Spa Day set of 3 wax filled candle pots are the perfect addition to any relaxing room setting. The glass pots are each finished with a gold foil swirl to make the items stand out. These wax filled candle pots can be placed together as a collection or placed in different rooms around the home. The scented candles are packed in a cream coloured card wrap with the same silver gold swirl and &#39;relax&#39; message. The lavender &amp; vanilla 50g scented candles have a burn time of 8 hours.</p>', 'published', '[\"products\\/baskets\\/3relax.jpg\"]', 'AH-1-75', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 50.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-06 00:30:52', '2021-04-28 21:42:30', 1, 6),
(120, 'Candlelight Spa Day Relax Round Wax Filled Pot Lavender & Vanilla Scent', '<p>A Candlelight Spa Day wax filled candle pot is the perfect addition to any relaxing room setting.</p>', '<p>The Candlelight Spa Day wax filled candle pot is the perfect addition to any relaxing room setting. The glass pot is finished with a gold foil swirl to make the item stand out. The scented candle is packed in a cream coloured card wrap with the same gold foil swirl and &#39;relax&#39; message. The lavender &amp; vanilla 220g scented candle has a burn time of 28 hours.</p>', 'published', '[\"products\\/baskets\\/round.jpg\"]', 'AH-1-76', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 220.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-06 00:34:22', '2021-04-19 22:11:06', 1, 13),
(121, 'Candlelight Spa Day Revitalise Reed Diffuser Green Tea Scent', '<p>A Spa Day reed diffuser is an ideal to inspire relaxation</p>', '<p>The Spa Day reed diffuser is an ideal to inspire relaxation. The reed diffuser is presented in a stunning blue &amp; silver cylindrical gift box. Each glass bottle is decorated with a silver foil. Contained in each gift box is the glass bottle which contains 150ml green tea fragranced oil, and 6 individual reeds for maximum scent coverage for up to 45 days.</p>', 'published', '[\"products\\/baskets\\/tea-scent.jpg\"]', 'AH-1-77', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 12.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-06 00:37:49', '2021-04-29 01:00:49', 1, 6),
(122, 'Candlelight Spa Day Revitalise 2 Wick Wax Filled Glass Candle Pot Green Tea Scent', '<p>A Candlelight Spa Day 2 wick wax filled candle pot is the perfect addition to any relaxing room setting</p>', '<p>The Candlelight Spa Day 2 wick wax filled candle pot is the perfect addition to any relaxing room setting. The glass pot is finished with a silver foil swirl to make the item stand out. The scented candle is packed with a blue coloured wick disc with the same silver foil swirl and &#39;revitalise&#39; message. The green tea 340g scented candle has a burn time of 26 hours.</p>', 'published', '[\"products\\/baskets\\/wick-wax.jpg\"]', 'AH-1-78', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 340.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-06 00:41:42', '2021-04-17 03:36:35', 1, 5),
(123, 'Candlelight Spa Day Revitalise Set of 3 Glass Wax Filled Pots Green Tea Scent', '<p>A Candlelight Spa Day set of 3 wax filled candle pots are the perfect addition to any relaxing room setting.</p>', '<p>The Candlelight Spa Day set of 3 wax filled candle pots are the perfect addition to any relaxing room setting. The glass pots are each finished with a silver foil swirl to make the items stand out. These wax filled candle pots can be placed together as a collection or placed in different rooms around the home. The scented candles are packed in a blue coloured card wrap with the same silver foil swirl and &#39;revitalise&#39; message. The green tea 50g scented candles have a burn time of 8 hours each.</p>', 'published', '[\"products\\/baskets\\/set.jpg\"]', 'AH-1-79', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 50.00, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-06 00:45:28', '2021-02-19 13:33:18', 0, 3),
(124, 'Candlelight Spa Day Revitalise Round Wax Filled Pot Green Tea Scent', '<p>A Candlelight Spa Day wax filled candle pot is the perfect addition to any relaxing room setting.</p>', '<p>The Candlelight Spa Day wax filled candle pot is the perfect addition to any relaxing room setting. The glass pot is finished with a silver foil swirl to make the item stand out. The scented candle is packed in a blue coloured card wrap with the same silver foil swirl and &#39;revitalise&#39; message. The green tea 220g scented candle has a burn time of 28 hours.</p>', 'published', '[\"products\\/baskets\\/11.jpg\"]', 'AH-1-80', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 220.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-06 00:48:48', '2021-04-28 22:49:21', 0, 5),
(125, 'Candlelight Spa Day Restore Reed Diffuser Aloe Vera & Cucumber Scent', '<p>A Spa Day reed diffuser is presented in a stunning grey &amp; copper cylindrical gift box</p>', '<p>The Spa Day reed diffuser is presented in a stunning grey &amp; copper cylindrical gift box. Each glass bottle is decorated with a copper foil. Contained in each gift box is the glass diffuser bottle which contains 150ml aloe vera &amp; cucumber fragranced oil, and 6 individual reeds for maximum scent coverage for up to 45 days.</p>', 'published', '[\"products\\/baskets\\/vera.jpg\"]', 'AH-1-81', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 12.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-06 00:54:13', '2021-04-30 21:50:25', 1, 13),
(126, 'Candlelight Spa Day Restore 2 Wick Wax Filled Glass Candle Pot Aloe Vera & Cucumber Scent', '<p>A Candlelight Spa Day 2 wick wax filled candle pot is the perfect addition to any relaxing room setting.</p>', '<p>The Candlelight Spa Day 2 wick wax filled candle pot is the perfect addition to any relaxing room setting. The glass pot is finished with a copper foil swirl to make the item stand out. The scented candle is packed with a grey coloured wick disc with the same copper foil swirl and &#39;restore&#39; message. The aloe vera &amp; cucumber 340g scented candle has a burn time of 26 hours.</p>', 'published', '[\"products\\/baskets\\/3spa-1.jpg\"]', 'AH-1-82', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 340.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-06 01:16:05', '2021-04-24 04:25:06', 0, 6),
(127, 'Candlelight Spa Day Restore Round Wax Filled Pot Aloe Vera & Cucumber Scent', '<p>A Candlelight Spa Day wax filled candle pot is the perfect addition to any relaxing room setting.</p>', '<p>The Candlelight Spa Day wax filled candle pot is the perfect addition to any relaxing room setting. The glass pot is finished with a copper foil swirl to make the item stand out. The scented candle is packed in a grey coloured card wrap with the same copper foil swirl and &#39;restore&#39; message. The aloe vera &amp; cucumber 220g scented candle has a burn time of 28 hours.</p>', 'published', '[\"products\\/baskets\\/big.jpg\"]', 'AH-1-83', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 220.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-06 01:23:56', '2021-04-28 00:08:50', 0, 7),
(128, 'Candlelight Animal Luxe Reed Diffuser Leopard Midnight Pomegranate Scent', '<p>A Animal Luxe midnight pomegranate scented Reed Diffuser</p>', '<p>Our Animal Luxe midnight pomegranate scented Reed Diffuser is presented in a stunning leopard print box and comes with 6 reeds and 150ml of fragrance oil for maximum scent coverage for up to 45 days.</p>', 'published', '[\"products\\/baskets\\/luxe.jpg\"]', 'AH-1-84', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 12.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-06 01:30:40', '2021-04-14 18:13:03', 1, 3),
(129, 'Candlelight Animal Luxe 2 Wick Wax Filled Candle Pot Midnight Pomegranate Scent', '<p>A Animal Luxe collection is perfect for customers who want to add a hint of elegance to their home.</p>', '<p>The Animal Luxe collection is perfect for customers who want to add a hint of elegance to their home. The midnight pomegranate 2 wick candle is presented in a glass pot with an all over leopard print, finished in stunning electroplated gold. Each 380g scented candle has a burn time of around 30 hours.</p>', 'published', '[\"products\\/baskets\\/luxe2.jpg\"]', 'AH-1-85', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 380.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-06 01:41:04', '2021-04-14 16:58:25', 0, 3),
(130, 'Candlelight Animal Luxe Set of 3 Wax Filled Candle Pots with Leopard Print Midnight Pomegranate Scent', '<p>A Animal Luxe collection is perfect for customers who want to add a hint of elegance to their home.</p>', '<p>Our Animal Luxe collection is perfect for customers who want to add a hint of elegance to their home. The midnight pomegranate set of 3 candles is presented in a stunning card tray with gold leopard print, each pot is finished in stunning electroplated gold. Each scented candle has a burn time of around 40 hours.</p>', 'published', '[\"products\\/baskets\\/luxe3.jpg\"]', 'AH-1-86', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 50.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-06 01:44:00', '2021-04-15 05:39:57', 1, 3),
(131, 'Candlelight Animal Luxe Round Wax Filled Candle Pot with Leopard Print Midnight Pomegranate Scent', '<p>A Animal Luxe collection is perfect for customers who want to add a hint of elegance to their home</p>', '<p>The Animal Luxe collection is perfect for customers who want to add a hint of elegance to their home. The midnight pomegranate wax filled candle pot is presented in a glass pot with an all over leopard print, finished in stunning electroplated gold. Each 220g scented candle has a burn time of around 28 hours.</p>', 'published', '[\"products\\/baskets\\/luxe4.jpg\"]', 'AH-1-87', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 220.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-06 01:47:38', '2021-04-26 05:29:39', 0, 7),
(134, 'Katie Alice Vintage Indigo 2 Wick Wax Filled Candle Pot Thai Flower Scent', '<p>A Katie Alice collection features this beautiful&nbsp;Vintage Indigo design 2 wick Thai Flower scent candle</p>', '<p>The Katie Alice collection features this beautiful&nbsp;Vintage Indigo design 2 wick Thai Flower scent candle. Presented in a glass pot wrapped with Katie&#39;s signature design and logo. This&nbsp;380g 2 wick scented candle has a burn time of around 30 hours</p>', 'published', '[\"products\\/baskets\\/alice2.jpg\"]', 'AH-1-89', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 380.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-06 02:03:27', '2021-05-01 11:23:23', 0, 10),
(135, 'Katie Alice Vintage Indigo Set of 3 Wax Filled Candles Thai Flower Scent', '<p>A Katie Alice collection features the Vintage Indigo design set of 3 Thai Flower scented wax filled candles</p>', '<p>The Katie Alice collection features the Vintage Indigo design set of 3 Thai Flower scented wax filled candles. Each candle is beautifully boxed and presented in a tray all wrapped in Katie&#39;s signature vintage floral design. Each 50g scented candle has a burn time of around 8 hours.</p>', 'published', '[\"products\\/baskets\\/alice3.jpg\"]', 'AH-1-90', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 50.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-06 02:07:10', '2021-04-15 01:20:20', 0, 6),
(136, 'Katie Alice Vintage Indigo Frosted Glass Wax Filled Jar Thai Flower Scent', '<p>A Katie Alice collection features the Vintage Indigo design Thai Flower scent frosted glass wax filled jar.</p>', '<p>The Katie Alice collection features the Vintage Indigo design Thai Flower scent frosted glass wax filled jar. Each 380g jar is wrapped with Katie&#39;s signature vintage floral design and logo with a burn time of 45 hours.</p>', 'published', '[\"products\\/baskets\\/alice4.jpg\"]', 'AH-1-91', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 380.00, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-06 02:10:24', '2021-04-28 01:39:30', 1, 10),
(138, 'Katie Alice Vintage Indigo 2 Wick Wax Filled Candle Pot Thai Flower Scent', '<p>A Katie Alice collection features this beautiful Wild Apricity design 2 wick Angel Flower scent candle.</p>', '<p>The Katie Alice collection features this beautiful Wild Apricity design 2 wick Angel Flower scent candle. Presented in a glass pot wrapped with Katie&#39;s signature vintage floral design and logo. This&nbsp;380g 2 wick scented candle has a burn time of around 30 hours and is supplied to our wholesale customers in pack size of 4 units.</p>', 'published', '[\"products\\/baskets\\/ceramic-2.jpg\"]', 'AH-1-93', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 380.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-06 02:51:44', '2021-04-25 17:30:36', 0, 15),
(139, 'Katie Alice Wild Apricity Frosted Glass Wax Filled Jar Angel Flower Scent', '<p>A Katie Alice collection features the Wild Apricity design Angel Flower scent frosted glass wax filled jar.</p>', '<p>The Katie Alice collection features the Wild Apricity design Angel Flower scent frosted glass wax filled jar. Each 380g jar is wrapped with Katie&#39;s signature vintage floral design and logo with a burn time of 45 hours.</p>', 'published', '[\"products\\/baskets\\/ceramic3.jpg\"]', 'AH-1-94', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 380.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-06 04:04:31', '2021-04-27 23:38:58', 1, 11),
(140, 'Katie Alice Wild Apricity Set of 3 Wax Filled Candles Angel Flower Scent', '<p>A Katie Alice collection features the Wild Apricity design set of 3 Angel Flower scented wax filled candles.</p>', '<p>The Katie Alice collection features the Wild Apricity design set of 3 Angel Flower scented wax filled candles. Each candle is beautifully boxed and presented in a tray all wrapped in Katie&#39;s signature vintage floral design. Each 50g scented candle has a burn time of around 8 hours.</p>', 'published', '[\"products\\/baskets\\/ceramic4.jpg\"]', 'AH-1-95', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 50.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-06 04:14:07', '2021-04-14 19:00:21', 0, 11),
(142, 'Katie Alice Bohemian Spirit 2 Wick Wax Filled Candle Pot Amber Lily Scent', '<p>A Katie Alice collection features this beautiful Bohemian Spirit design 2 wick Amber Lily scent candle.</p>', '<p>The Katie Alice collection features this beautiful Bohemian Spirit design 2 wick Amber Lily scent candle. Presented in a glass pot wrapped with Katie&#39;s signature vintage floral design and logo. This&nbsp;380g 2 wick scented candle has a burn time of around 30 hours.</p>', 'published', '[\"products\\/baskets\\/spirit2.jpg\"]', 'AH-1-97', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 380.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-06 04:23:20', '2021-04-28 05:52:29', 1, 11),
(143, 'Katie Alice Bohemian Spirit Frosted Glass Wax Filled Jar Amber Lily Scent', '<p>A Katie Alice collections features the Bohemian Spirit design Amber Lily scent frosted glass wax filled jar.</p>', '<p>The Katie Alice collections features the Bohemian Spirit design Amber Lily scent frosted glass wax filled jar. Each 380g jar is wrapped with Katie&#39;s signature vintage floral design and logo with a burn time of 45 hours.</p>', 'published', '[\"products\\/baskets\\/spirit3.jpg\"]', 'AH-1-98', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 380.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-06 04:26:39', '2021-04-28 01:28:47', 1, 9),
(144, 'Katie Alice Bohemian Spirit Set of 3 Wax Filled Candles Amber Lily Scent', '<p>A Katie Alice collection features the Bohemian Spirit design set of 3 Amber Lily scented wax filled candles.</p>', '<p>The Katie Alice collection features the Bohemian Spirit design set of 3 Amber Lily scented wax filled candles. Each candle is beautifully boxed and presented in a tray all wrapped in Katie&#39;s signature vintage floral design. Each 50g scented candle has a burn time of around 8 hours.</p>', 'published', '[\"products\\/baskets\\/spirit4.jpg\"]', 'AH-1-99', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 50.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-06 04:30:23', '2021-04-27 04:37:07', 1, 20),
(145, 'Deco Glam Glass Reed Diffuser Prosecco Scent', '<p>A Candlelight&#39;s Deco Glam collection features this beautiful Reed Diffuser which is presented in a gift box.</p>', '<p>Candlelight&#39;s Deco Glam collection features this beautiful Reed Diffuser which is presented in a gift box. With a luxurious Prosecco scent. Each reed diffuser contains 100ml of fragranced oil and 6 reeds which help maximise the scent for up to 45 days.</p>', 'published', '[\"products\\/baskets\\/scent.jpg\"]', 'AH-1-100', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 12.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-06 04:34:47', '2021-04-29 01:29:44', 0, 6),
(146, 'Deco Glam 2 Wick Wax Filled Candle Pot Prosecco Scent', '<p>A</p>\r\n\r\n<p>Deco Glam 2 Wick Wax Filled Candle Pot Prosecco Scent 260g</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Candlelight&#39;s Deco Glam collection features this beautiful Glass Wax Filled Pot 2 Wick Candle.</p>', '<p>Candlelight&#39;s Deco Glam collection features this beautiful Glass Wax Filled Pot 2 Wick Candle. With a luxurious Prosecco scent. The glass pot is printed with the beautiful gold colour pattern. Each 260g candle has an approximate burn time of up to 16 hours.</p>', 'published', '[\"products\\/baskets\\/scent2.jpg\"]', '101', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 260.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-06 04:39:10', '2021-04-29 06:31:28', 0, 7),
(147, 'Deco Glam Round Glass Wax Filled Candle Pot Prosecco Scent', '<p>A Candlelight&#39;s Deco Glam collection features this beautiful Glass Wax Filled Pot Candle. With a luxurious Prosecco scent.</p>', '<p>Candlelight&#39;s Deco Glam collection features this beautiful Glass Wax Filled Pot Candle. With a luxurious Prosecco scent. The glass pot is printed with the beautiful gold colour pattern. Each 220g candle has an approximate burn time of up to 16 hours.</p>', 'published', '[\"products\\/baskets\\/scent3.jpg\"]', 'AH-1-48', 0, 0, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 220.00, NULL, NULL, NULL, NULL, NULL, 1, '2020-12-06 04:42:54', '2021-04-27 15:59:16', 0, 22),
(148, 'Candlelight Spa Day Restore Set of 3 Glass Wax Filled Pots Aloe Vera & Cucumber Scent', '<p>The Candlelight Spa Day set of 3 wax filled candle pots are the perfect addition to any relaxing room setting.&nbsp;</p>', '<p>The glass pots are each finished with a copper foil swirl to make the items stand out. The scented candles are packed in a grey coloured card wrap with the same silver gold swirl and &#39;restore&#39; message. The aloe vera &amp; cucumber 50g scented candles have a burn time of 8 hours.</p>', 'published', '[\"products\\/3-glass-wax-filled-pots-aloe-vera-cucumber-scent-50g.jpg\"]', 'AH-1-49', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 50.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-22 01:58:57', '2021-04-26 02:34:38', 0, 4),
(149, 'Katie Alice Vintage Indigo Ceramic Reed Diffuser Thai Flower Scent', '<p>The Katie Alice collection features the Vintage Indigo design reed diffuser with a Thai Flower scent.&nbsp;</p>', '<p>The glass diffuser is presented in a cylindrical box wrapped with Katie&#39;s signature design and logo. Each pack contains 150ml of fragranced oil and 6 reeds which help maximise the scent for up to 45 days.</p>', 'published', '[\"products\\/baskets\\/alice.jpg\"]', 'AH-1-50', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 12.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 150.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-22 02:25:56', '2021-04-20 01:55:53', 0, 3),
(150, 'Katie Alice Wild Apricity Ceramic Reed Diffuser Angel Flower Scent', '<p>The Katie Alice collection features the Wild Apricity design reed diffuser with Angel Flower scent.&nbsp;</p>', '<p>The glass diffuser is presented in a cylindrical box wrapped with Katie&#39;s signature vintage floral design and logo. Each pack contains 150ml of fragranced oil and 6 reeds which help maximise the scent for up to 45 days.</p>', 'published', '[\"products\\/baskets\\/ceramic.jpg\"]', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 12.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-22 02:37:37', '2021-04-15 05:18:56', 0, 3),
(151, 'Katie Alice Wild Apricity 2 Wick Wax Filled Candle Pot Angel Flower Scent', '<p>The Katie Alice collection features this beautiful Wild Apricity design 2 wick Angel Flower scent candle.&nbsp;</p>', '<p>&nbsp;Presented in a glass pot wrapped with Katie&#39;s signature vintage floral design and logo. This&nbsp;380g 2 wick scented candle has a burn time of around 30 hours and is supplied to our wholesale customers in pack size of 4 units.</p>', 'published', '[\"products\\/baskets\\/ceramic-2.jpg\"]', 'AH-1-99', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 380.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-22 02:42:35', '2021-04-21 05:27:05', 0, 6),
(152, 'Katie Alice Bohemian Spirit Ceramic Reed Diffuser Amber Lily Scent', '<p>The Katie Alice collection features the Bohemian Spirit design reed diffuser with Amber Lily scent.&nbsp;</p>', '<p>The glass diffuser is presented in a cylindrical box wrapped with Katie&#39;s signature vintage floral design and logo. Each pack contains 150ml of fragranced oil and 6 reeds which help maximise the scent for up to 45 days.</p>', 'published', '[\"products\\/baskets\\/spirit.jpg\"]', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 12.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 150.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-22 03:05:04', '2021-03-31 07:48:44', 1, 2),
(153, 'Simple Large Reed Diffuser in Gift Box Black Lily and Pomegranate Scent', '<p>The Simple Large Reed Diffuser is presented in a beautiful simple cylinder gift box.&nbsp;</p>', '<p>The black lily &amp; pomegranate fragrance can fill any room in a customers house with its delightful scent. This reed diffuser would make an amazing gift. Each reed diffuser contains 150ml of fragranced oil and 6 reeds which help maximise the scent for up to 45 days.</p>', 'published', '[\"products\\/room-fragrance\\/black-lily-and-pomegranate-1.jpg\"]', 'AH-1-101', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 10.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 150.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-22 03:41:31', '2021-04-27 15:42:25', 0, 5),
(154, 'Candlelight Siesta Wax Filled Pot Candle in Gift Box Pineapple Scent', '<p>The Candlelight Siesta wax filled pot candle is presented in a beautiful gift box ideal for those looking to treat themselves or purchase as a gift for a special occasion.</p>', '<p>Each pineapple scented candle is contained in a decorative glass jar, themed to the gift box itself which will look amazing in any room around the home. Each 220g candle has an approximate burn time of up to 26 hours, and should always be handled with care once lit.</p>', 'published', '[\"products\\/siesta-wax-filled-pot-candle-in-gift-box-pineapple-scent-220g.jpg\"]', 'AH-1-43', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 220.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-22 04:34:05', '2021-04-14 22:25:56', 1, 8),
(155, 'Candlelight Trio Set of 3 Mini Votive Candles Gift Box Pineapple Scent', '<p>The Candlelight Trio set of 3 mini votive scented candles are presented in an elegant collection of gift boxes, each named with relaxing statements such as &quot;Paradise, Siesta &amp; Tropic&quot;.&nbsp;</p>', '<p>Each gift box contains a 50g tropical scented mini votive candle in a mix of pastel colours in a simple glass jar, perfect for placing around the home, or for the perfect candle gift set. Each candle has an approximate burn time of up to 7 hours, and should always be handled with care once lit.</p>', 'published', '[\"products\\/trio-set-of-3-mini-votive-candles-gift-box-pineapple-scent-50g.jpg\"]', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-22 04:36:16', '2021-04-28 02:08:36', 1, 5),
(156, 'Candlelight Glow Getter Reed Diffuser in Gift Box Pear Flower Scent', '<p>The Candlelight Glow Getter Reed Diffuser makes the ideal gift for any celebration.</p>', '<p>The pear flower scented oil can fill any room in a customers home with its delightful fragrance. The reed oil diffuser comes packaged in a coloured cylinder with the &#39;Glow getter&#39; message in foil. Each reed diffuser is made of frosted glass, with a screw top lid. Each reed diffuser includes 6 reeds which help maximise the scent for up to 45 days.</p>', 'published', '[\"products\\/room-fragrance\\/pear-flower-1.jpg\"]', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 10.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 150.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 15:43:01', '2021-04-14 21:41:37', 0, 6),
(157, 'Candlelight Glow Getter Large Wax Filled Pot Candle Pear Flower Scent', '<p>The Candlelight Glow Getter Large Wax Filled Pot Candle makes an ideal gift with its &#39;Glow getter&#39; inspirational message.</p>', '<p>The distinctive pear flower scented candle is contained in a frosted glass pot with a frosted glass lid, around the pot is its coloured band and inspirational message. Each 380g candle has a burn time of 45 hours and should always be handled with care once lit.&nbsp;</p>', 'published', '[\"products\\/glow-getter-large-wax-filled-pot-candle-pear-flower-scent-380g.jpg\"]', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 380.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 15:45:20', '2021-04-15 02:36:39', 0, 6),
(158, 'Candlelight Love Reed Diffuser in Gift Box Midnight Pomegranate Scent', '<p>The Candlelight Love Reed Diffuser is presented in a beautiful love themed gift box.</p>', '<p>The beautiful midnight pomegranate fragrance can fill any room in a customers house with its delightful scent. This reed diffuser would make an amazing gift. Each reed diffuser contains 100ml of fragranced oil and 6 reeds which help maximise the scent for up to 45 days.</p>', 'published', '[\"products\\/room-fragrance\\/midnight-pomegranate-1.jpg\"]', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 9.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 100.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 15:48:03', '2021-04-14 23:37:20', 1, 4),
(159, 'Candlelight Love Large Frosted Glass Candle Midnight Pomegranate Scent', '<p>The Candlelight Love Large Frosted Glass Candle is presented in a pink frosted glass jar, with a frosted glass lid and &#39;Candlelight&#39; swing ticket.&nbsp;</p>', '<p>This item is an ideal gift, either on its own or as a companion to other scented candles or reed diffusers from the Candlelight Wellbeing range. . The beautiful midnight pomegranate scent can fill any room. Each 360g candle has an approximate burn time of up to 45 hours, and should always be handled with care once lit.</p>', 'published', '[\"products\\/midnight-pomegranate-scent-360g.jpg\",\"products\\/candle-wild-fig-scent-360g.jpg\"]', 'AH-1-111', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 360.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 15:51:56', '2021-04-28 06:17:16', 0, 8),
(160, 'Candlelight Happy Small Wax Filled Pot Candle in Gift Box Wild Fig Scent', '<p>The Candlelight Happy Small Wax Filled Pot Candle is presented in a beautiful happy themed gift box.</p>', '<p>The wild fig scented candle is contained in a pink frosted glass pot, allowing the customer to make a statement in any room. Each 60g candle has an approximate burn time of up to 8 hours, and should always be handled with care once lit.</p>', 'published', '[\"products\\/happy-small-wax-filled-pot-candle-in-gift-box-wild-fig-scent-60g.jpg\"]', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 60.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 15:57:09', '2021-04-15 00:56:28', 1, 4),
(161, 'Candlelight Calm Reed Diffuser in Gift Box Pineapple and Coconut Scent', '<p>The Candlelight Calm Reed Diffuser is presented in a beautiful calm themed gift box.</p>', '<p>The fresh pineapple &amp; coconut fragrance can fill any room in a customers house with its delightful scent. This reed diffuser would make an amazing gift. Each reed diffuser contains 100ml of fragranced oil and 6 reeds which help maximise the scent for up to 45 days.</p>', 'published', '[\"products\\/room-fragrance\\/diffuser-in-gift-box-pineapple-and-coconut-1.jpg\"]', 'AH-1-112', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 9.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 100.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 16:03:18', '2021-04-27 16:53:42', 0, 5),
(162, 'Candlelight Calm Large Frosted Glass Candle Pineapple and Coconut Scent', '<p>The Candlelight Calm Large Frosted Glass Candle is presented in a green frosted glass jar, with a frosted glass lid and &#39;Candlelight&#39; swing ticket.</p>', '<p>This item is an ideal gift, either on its own or as a companion to other scented candles or reed diffusers from the Candlelight Wellbeing range. Its fresh pineapple &amp; coconut scent can fill any room. Each 360g candle has an approximate burn time of up to 45 hours, and should always be handled with care once lit.&nbsp;</p>', 'published', '[\"products\\/peace-large-frosted-glass-candle-redcurrant-and-ivy-scent-360g.jpg\",\"products\\/pineapple-and-coconut-scent-360g.jpg\"]', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 16:06:30', '2021-04-14 17:15:53', 0, 7),
(163, 'Candlelight Calm Large Wax Filled Pot Candle in Gift Box Pineapple and Coconut Scent', '<p>The Candlelight Calm Large Wax Filled Pot Candle is presented in a beautiful calm themed gift box.</p>', '<p>The fresh pineapple &amp; coconut scented candle is contained in a green frosted glass pot, allowing the customer to make a statement in any room. Each 220g candle has an approximate burn time of up to 26 hours, and should always be handled with care once lit.&nbsp;</p>', 'published', '[\"products\\/pineapple-and-coconut-scent-220g.jpg\"]', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 220.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 16:17:29', '2021-04-26 02:03:27', 0, 6),
(164, 'Summer Meadows Reed Diffuser in Gift Box Floral', '<p>The Summer Meadows Reed Diffuser is packed in a stunning floral print gift box, with the pot itself being printed in an themed print to match.&nbsp;</p>', '<p>&nbsp;This item is the perfect gift, but is also ideal for customers to place around the home to bring the outside in. Each reed diffuser contains 100ml of fresh honeysuckle &amp; ivy fragranced oil and 6 reeds which help maximise the scent for up to 45 days.</p>', 'published', '[\"products\\/room-fragrance\\/summer-meadows-1.jpg\"]', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 25.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 16:21:08', '2021-04-28 00:20:25', 0, 5),
(165, 'Summer Meadows Wax Filled Pot Candle in Gift Box Floral', '<p>The Summer Meadows glass wax filled pot candle is packaged in a beautiful gift box, printed with a floral print. Each 220g floral bouquet scented candle is contained in an elegant glass pot with a floral print.</p>', '<p>This scented candle makes an ideal gift, either on its own or together with other items in this stunning co-ordinating range. Each candle has a burn time of 26 hours and should always be handled with care once lit.&nbsp;</p>', 'published', '[\"products\\/summer-meadows-wax-filled-pot-candle-in-gift-box-floral-11cm.jpg\"]', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 16:26:03', '2021-02-11 05:12:51', 0, 0),
(166, 'Summer Meadows 2 Wick Glass Wax Filled Pot Candle Floral', '<p>The Summer Meadows Glass Wax Filled Pot 2 Wick Candle is ideal for customers to place in any room around their home, or given as a gift. Its delightful pink rose scent can fill any room.</p>', '<p>The glass pot is printed with the beautiful floral print. Each 340g candle has an approximate burn time of up to 24 hours, and should always be handled with care once lit.</p>', 'published', '[\"products\\/summer-meadows-2-wick-glass-wax-filled-pot-candle-floral-8cm.jpg\"]', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 8.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 16:27:44', '2021-04-27 17:51:32', 0, 10),
(167, 'Summer Meadows Assorted Wax Filled Tin Candles Floral', '<p>The assorted Summer Meadows wax filled tin candles are presented in an elegant collection of tins, each with a printed label and wrap.</p>', '<p>Each tin contains 130g of scented wax a mix of honeysuckle &amp; ivy, floral bouquet and pink rose scents, perfect for placing around the home, or for the perfect candle gift set. Each candle has an approximate burn time of up to 12 hours, and should always be handled with care once lit.&nbsp;</p>', 'published', '[\"products\\/summer-meadows-assorted-wax-filled-tin-candles-floral-5cm.jpg\"]', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 5.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 16:29:42', '2021-04-30 18:16:28', 0, 3),
(168, 'Candlelight Burn It At Both Ends Reed Diffuser in Gift Box Pink Petal Scent', '<p>The Candlelight Burn It At Both Ends Reed Diffuser makes the perfect gift for the busy lifestyle. The scented oil can fill any room in a customers home with its delightful pink petal scent.</p>', '<p>The reed oil diffuser comes packaged in a coloured cylinder with the &#39;Burn it at both ends&#39; message in foil. Each reed diffuser is made of frosted glass, with a screw top lid. Each reed diffuser includes 6 reeds which help maximise the scent for up to 45 days.&nbsp;</p>', 'published', '[\"products\\/room-fragrance\\/burn-it-at-both-ends-1.jpg\"]', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 10.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 16:32:22', '2021-04-28 21:09:32', 0, 12),
(169, 'Candlelight Burn It At Both Ends Large Wax Filled Pot Candle Pink Petal Scent', '<p>The Candlelight Burn It At Both Ends Large Wax Filled Pot Candle is a perfect gift for those with a busy lifestyle.</p>', '<p>The pink petal scented candle is contained in a frosted glass pot with a frosted glass lid, around the pot is its distinctive coloured band and inspirational &#39;burn it at both ends &#39;message. Each 380g candle has a burn time of 45 hours and should always be handled with care once lit.</p>', 'published', '[\"products\\/burn-it-at-both-ends-large-wax-filled-pot-candle-pink-petal-scent-380g.jpg\"]', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 380.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 16:36:36', '2021-04-28 05:10:37', 0, 9),
(170, 'Candlelight Start Your Spark Here Reed Diffuser in Gift Box White Petal Scent', '<p>The Candlelight Start Your Spark Here Reed Diffuser is a perfect addition to any customers home, and with its inspirational message, makes the perfect gift.</p>', '<p>The reed oil diffuser comes packaged in a coloured cylinder with the &#39;Start your spark here&#39; message in gold foil. Each reed diffuser contains a fresh white petal fragranced oil, and is made of frosted glass, with a screw top lid. Each reed diffuser includes 6 reeds which help maximise the scent for up to 45 days.&nbsp;</p>', 'published', '[\"products\\/room-fragrance\\/start-your-spark-1.jpg\"]', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 10.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 150.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 16:39:08', '2021-04-29 17:16:40', 0, 10),
(171, 'Candlelight Start Your Spark Here Large Wax Filled Pot Candle White Petal Scent', '<p>The Candlelight Start Your Spark Here Large Wax Filled Pot Candle makes the perfect gift with its inspiration message and uplifting white petal scent.</p>', '<p>The scented candle is contained in a frosted glass pot with a frosted glass lid, around the pot is its distinctive coloured band and contemporary gold foil inspirational message. Each 380g candle has a burn time of 45 hours and should always be handled with care once lit.</p>', 'published', '[\"products\\/start-your-spark-here-large-wax-filled-pot-candle-white-petal-scent-380g.jpg\"]', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 380.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 16:40:58', '2021-04-28 21:54:51', 0, 9),
(172, 'Hugs & Kisses Reed Diffuser in Gift Box Prosecco Scent', '<p>The Hugs &amp; Kisses reed diffuser is perfect for any romantic setting.</p>', '<p>The reed diffuser is presented in a beautiful cylindrical gift box, and each glass bottle is decorated with XOXO in gold foil. Contained in each gift box is the glass bottle which contains 100ml prosecco fragranced oil, and 6 individual reeds for maximum scent coverage for up to 45 days.</p>', 'published', '[\"products\\/room-fragrance\\/hugs-kisses-1.jpg\"]', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 10.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 100.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 16:44:10', '2021-04-28 19:10:30', 0, 4),
(173, 'Candlelight Hugs & Kisses Wax Filled Pot Candle in Gift Box Prosecco Scent', '<p>The Hugs &amp; Kisses wax filled pot candle comes presented in a beautiful gift box, making this an ideal gift for a loved one, or an addition for a romantic room setting.</p>', '<p>Each prosecco scented candle in contained in a glass jar with &#39;XOXO&#39; printed in gold foil. Each 220g candle has an approximate burn time of 26 hours and should be handled with care once lit.</p>', 'published', '[\"products\\/hug-and-kisses-candelight.jpg\"]', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 220.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 16:49:22', '2021-04-27 21:01:14', 0, 2),
(174, 'Love Always Reed Diffuser Prosecco Scent', '<p>The Love Always reed diffuser is an ideal gift for a loved one or for any room around a customers home.</p>', '<p>The reed diffuser is presented in a stunning cylindrical gift box, and each glass bottle is decorated with a kiss in gold foil. Contained in each gift box is the glass bottle which contains 100ml prosecco fragranced oil, and 6 individual reeds for maximum scent coverage for up to 45 days.&nbsp;</p>', 'published', '[\"products\\/room-fragrance\\/love-always-1.jpg\"]', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 10.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 100.00, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-23 17:01:44', '2021-04-29 12:50:09', 0, 3),
(175, 'Candlelight Love Always Wax Filled Pot Candle in Gift Box Prosecco Scent', '<p>The Love Always wax filled pot candle comes presented in a beautiful gift box with &#39;Love Always&#39; message, making this an ideal addition for a romantic room setting, or gift for someone special.</p>', '<p>Each prosecco scented candle in contained in a glass jar with a kiss printed in gold foil. Each 220g candle has an approximate burn time of 26 hours and should be handled with care once lit.</p>', 'published', '[\"products\\/love-always-wax-filled-pot-candle-in-gift-box-prosecco-scent-220g.jpg\"]', 'AH-1-113', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 220.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 17:06:00', '2021-04-27 18:03:00', 0, 2),
(176, 'Candlelight Tropic Reed Diffuser in Gift Box Pineapple Scent', '<p>The Candlelight Tropic reed diffuser is a perfect gift or an addition to any customers home.</p>', '<p>Presented in a beautiful gift box with a gold foil design, the Tropic reed diffuser can make a statement in any home, either on its own, or when coupled with a scented candle from the Candlelight Blush &amp; Mint collection. Contained within the gift box is a 150ml glass bottle containing pineapple aroma scented oil, along with 6 individual reeds for maximum scent coverage or prolonging the lifetime of the diffuser for up to 45 days.</p>', 'published', '[\"products\\/room-fragrance\\/tropic-1.jpg\"]', 'AH-1-114', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 10.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 150.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 17:09:08', '2021-04-29 08:57:02', 0, 4);
INSERT INTO `ec_products` (`id`, `name`, `description`, `content`, `status`, `images`, `sku`, `order`, `quantity`, `allow_checkout_when_out_of_stock`, `with_storehouse_management`, `is_featured`, `options`, `category_id`, `is_variation`, `is_searchable`, `is_show_on_list`, `sale_type`, `price`, `sale_price`, `start_date`, `end_date`, `length`, `wide`, `height`, `weight`, `barcode`, `length_unit`, `wide_unit`, `height_unit`, `weight_unit`, `brand_id`, `created_at`, `updated_at`, `tax_id`, `views`) VALUES
(177, 'Candlelight Tropic Wax Filled Pot Candle in Gift Box Pineapple Scent', '<p>The Candlelight Tropic wax filled pot candle is presented in a beautiful gift box, making this an ideal gift for a special occasion or for someone looking for a little treat for themselves.</p>', '<p>The pineapple scented candle is contained in a glass jar decorated with gold foil, which make this an ideal centrepiece to any room setting. Each 220g candle has an approximate burn time of up to 26 hours, and should always be handled with care once lit.</p>', 'published', '[\"products\\/tropic-wax-filled-pot-candle-in-gift-box-pineapple-scent-220g.jpg\"]', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 220.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 17:13:39', '2021-04-27 17:34:36', 0, 3),
(178, 'With Love XO Reed Diffuser in Gift Box Prosecco Scent 100ml', '<p>The With Love reed diffuser is an ideal gift for a special occasion. The reed diffuser is presented in a stunning pink and white cylindrical gift box. Each glass bottle is decorated with a gold foil in an all over print.</p>', '<p>Contained in each gift box is the glass bottle which contains 100ml prosecco fragranced oil, and 6 individual reeds for maximum scent coverage for up to 45 days.</p>', 'published', '[\"products\\/room-fragrance\\/candlelight-home-reed-diffuser-with-love-xo-reed-diffuser-in-gift-box-prosecco-scent-100ml.jpg\"]', 'AH-1-114', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 10.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-23 17:27:33', '2021-05-01 16:55:26', 0, 3),
(179, 'Simple Large Wax Filled Pot 2 Wick Candle Fresh Cotton Scent', '<p>The Simple Large Wax Filled Pot 2 Wick Candle is a stylish wax filled put with shiny silver lid. The candle is simple and stylish and would be a welcome addition to any customers home.</p>', '<p>The candle features a &#39;relax&#39; message to inspire relaxation. The 260g scented candle has an uplifting fresh cotton fragrance, and a burn time of 16 hours, and should always be handled with care once lit.</p>', 'published', '[\"products\\/2-wick-candle-fresh-cotton-scent-260g.jpg\"]', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 260.00, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-23 17:32:31', '2021-04-14 23:35:13', 0, 4),
(180, 'Simple Large Reed Diffuser in Gift Box Pink Pepper Scent', '<p>The Simple Large Reed Diffuser is presented in a beautiful simple cylinder gift box.</p>', '<p>The pink pepper fragrance can fill any room in a customers house with its delightful scent. This reed diffuser would make an amazing gift. Each reed diffuser contains 150ml of fragranced oil and 6 reeds which help maximise the scent for up to 45 days.</p>', 'published', '[\"products\\/room-fragrance\\/black-lily-and-pomegranate-1.jpg\"]', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 10.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 150.00, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-23 17:36:34', '2021-04-14 19:41:57', 0, 3),
(181, 'Simple Small Wax Filled Pot Candle with Lid Pink Pepper Scent', '<p>The Simple Small Wax Filled Pot Candle is a stylish wax filled put with shiny silver lid.</p>', '<p>The candle is simple and stylish and would be a welcome addition to any customers home. The candle features an &#39;unwind&#39; message to inspire relaxation. The 130g scented candle has a pink pepper fragrance, and a burn time of 15 hours, and should always be handled with care once lit.</p>', 'published', '[\"products\\/hugs-kisses-wax-filled-pot-candle-in-gift-box-prosecco-scent-220g.jpg\"]', 'AH-1-115', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 130.00, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-23 17:39:32', '2021-04-27 20:06:45', 0, 3),
(182, 'Candlelight Nantucket Bay Reed Diffuser in Gift Box Seasalt Scent', '<p>The Candlelight Nantucket Bay Reed Diffuser is packed in a stunning Nantucket Bay inspired gift box, with the pot itself being printed in an themed print to match.</p>', '<p>This item is the perfect gift, but is also ideal for customers to place around the home to re live the sights and scents of foreign travel. Each reed diffuser contains 150ml of distinctive seasalt fragranced oil and 6 reeds which help maximise the scent for up to 45 days.&nbsp;</p>', 'published', '[\"products\\/room-fragrance\\/candlelight-home-reed-diffuser-candlelight-nantucket-bay-reed-diffuser-in-gift-box-seasalt-scent-150ml.jpg\"]', 'AH-1-116', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 10.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 150.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 17:51:46', '2021-04-15 07:06:48', 0, 3),
(183, 'Candlelight Nantucket Bay Small Wax Filled Pot Candle in Gift Box Seasalt Scent', '<p>The Candlelight Nantucket Bay Small Wax Filled Pot Candle is packed in a stunning Nantucket Bay inspired gift box, with the pot itself being printed in an themed print to match.</p>', '<p>This item is the perfect gift, but is also ideal for customers to place around the home to re live the sights and scents of foreign travel. The distinctive seasalt 380g scented candle has a burn time of 26 hours and should always be handled with care once lit.</p>', 'published', '[\"products\\/nantucket-bay-small-wax-filled-pot-candle-in-gift-box-seasalt-scent-220g.jpg\"]', 'AH-1-117', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 150.00, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-23 17:53:55', '2021-04-21 00:38:35', 0, 3),
(184, 'Candlelight Nantucket Bay Wax Filled Pot 2 Wick Candle Seasalt Scent', '<p>The Candlelight Nantucket Bay Wax Filled Pot 2 Wick Candle is contained in a stunning white glass pot with a themed colour label.</p>', '<p>This item is the perfect gift, but is also ideal for customers to place around the home as a bold statement with its bright colour and scent. The distinctive seasalt 380g scented candle has a burn time of 30 hours and should always be handled with care once lit.</p>', 'published', '[\"products\\/2-wick-candle-seasalt-scent-380g.jpg\"]', 'AH-1-118', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 380.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 17:57:32', '2021-04-15 00:55:37', 0, 3),
(185, 'Candlelight Nantucket Bay Set of 3 Mini Votive Candles in Gift Box Seasalt Scent', '<p>The Candlelight Nantucket Bay Set of 3 Mini Votive Candles are presented in an elegant collection of gift boxes, each named with themed names such as &quot;Waves, Breeze &amp; Ocean&quot;.</p>', '<p>Each gift box contains a 50g seasalt scented mini votive candle in a mix of bold colours in a simple glass jar, perfect for placing around the home, or for the perfect candle gift set. Each candle has an approximate burn time of up to 7 hours, and should always be handled with care once lit.&nbsp;</p>', 'published', '[\"products\\/3-mini-votive-candles-in-gift-box-seasalt-scent-50g.jpg\"]', 'AH-1-119', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 50.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 18:03:26', '2021-04-29 08:59:27', 1, 5),
(186, 'Candlelight Africa Reed Diffuser in Gift Box Savannah White Poppy Scent', '<p>The Candlelight Africa Reed Diffuser is packed in a stunning African inspired gift box, with the pot itself being printed in an themed print to match.</p>', '<p>This item is the perfect gift, but is also ideal for customers to place around the home to re live the sights and scents of foreign travel. Each reed diffuser contains 150ml of indulgent Savannah White Poppy fragranced oil and 6 reeds which help maximise the scent for up to 45 days.</p>', 'published', '[\"products\\/room-fragrance\\/savanah-white-1.jpg\"]', 'AH-1-200', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 10.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 150.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 18:07:20', '2021-04-29 02:43:19', 1, 9),
(187, 'Candlelight Africa Small Wax Filled Pot Candle in Gift Box Savannah White Poppy Scent', '<p>The Candlelight Africa Small Wax Filled Pot Candle is packed in a stunning African inspired gift box, with the pot itself being printed in an themed print to match.</p>', '<p>This item is the perfect gift, but is also ideal for customers to place around the home to re live the sights and scents of foreign travel. The indulgent Savannah White Poppy 380g scented candle has a burn time of 26 hours and should always be handled with care once lit.</p>', 'published', '[\"products\\/savannah-white-poppy-scent-220g.jpg\"]', 'AH-1-201', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 220.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 18:09:33', '2021-04-26 01:25:28', 0, 6),
(188, 'Candlelight Africa Wax Filled Pot 2 Wick Candle Savannah White Poppy Scent', '<p>The Candlelight Africa Wax Filled Pot 2 Wick Candle is contained in a stunning purple glass pot with a themed colour label.</p>', '<p>This item is the perfect gift, but is also ideal for customers to place around the home as a bold statement with its bright colour and scent. The indulgent Savannah White Poppy 380g scented candle has a burn time of 30 hours and should always be handled with care once lit.</p>', 'published', '[\"products\\/2-wick-candle-savannah-white-poppy-scent-380g.jpg\"]', 'AH-1-202', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 380.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 18:12:03', '2021-04-28 22:51:46', 1, 5),
(189, 'Candlelight Africa Set of 3 Mini Votive Candles in Gift Box Savannah White Poppy Scent', '<p>The Candlelight Africa Set of 3 Mini Votive Candles are presented in an elegant collection of gift boxes, each named with themed names such as &quot;Dawn, Haze &amp; Dusk&quot;.</p>', '<p>Each gift box contains a 50g Savannah White Poppy scented mini votive candle in a mix of bold colours in a simple glass jar, perfect for placing around the home, or for the perfect candle gift set. Each candle has an approximate burn time of up to 7 hours, and should always be handled with care once lit.</p>', 'published', '[\"products\\/africa-set-of-3-mini-votive-candles-in-gift-box-savannah-white-poppy-scent-50g.jpg\"]', 'AH-1-203', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 50.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 18:14:49', '2021-04-14 15:46:33', 0, 11),
(190, 'Candlelight Thailand Reed Diffuser in Gift Box Thai Flower Market Scent', '<p>The Candlelight Thailand Reed Diffuser is packed in a stunning Thai inspired gift box, with the pot itself being printed in an themed print to match.</p>', '<p>This item is the perfect gift, but is also ideal for customers to place around the home to re live the sights and scents of foreign travel. Each reed diffuser contains 150ml of indulgent Thai Flower Market fragranced oil and 6 reeds which help maximise the scent for up to 45 days.&nbsp;</p>', 'published', '[\"products\\/room-fragrance\\/thai-1.jpg\"]', 'AH-1-204', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 10.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 150.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-23 22:42:35', '2021-04-24 17:08:22', 0, 7),
(191, 'Candlelight Thailand Small Wax Filled Pot Candle in Gift Box Thai Flower Market Scent', '<p>The Candlelight Thailand Small Wax Filled Pot Candle is packed in a stunning Thai inspired gift box, with the pot itself being printed in an themed print to match.</p>', '<p>This item is the perfect gift, but is also ideal for customers to place around the home to re live the sights and scents of foreign travel. The indulgent Thai Flower Market 380g scented candle has a burn time of 26 hours and should always be handled with care once lit.</p>', 'published', '[\"products\\/thailand-small-wax-filled-pot-candle-in-gift-box-thai-flower-market-scent-220g.jpg\"]', 'AH-1-204', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 220.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-24 00:27:13', '2021-04-27 15:24:37', 1, 7),
(192, 'Candlelight Thailand Wax Filled Pot 2 Wick Candle Thai Flower Market Scent', '<p>The Candlelight Thailand Wax Filled Pot 2 Wick Candle is contained in a stunning purple glass pot with a themed colour label.</p>', '<p>This item is the perfect gift, but is also ideal for customers to place around the home as a bold statement with its bright colour and scent. The indulgent Thai Flower Market 380g scented candle has a burn time of 30 hours and should always be handled with care once lit.</p>', 'published', '[\"products\\/2-wick-candle-thai-flower-market-scent-380g.jpg\"]', 'AH-1-205', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 380.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-24 00:30:32', '2021-04-29 17:36:40', 0, 5),
(193, 'Candlelight Thailand Set of 3 Mini Votive Candles in Gift Box Thai Flower Market Scent', '<p>The Candlelight Thailand Set of 3 Mini Votive Candles are presented in an elegant collection of gift boxes, each named with themed names such as &quot;Orchid, Lily &amp; Jasmine&quot;.</p>', '<p>Each gift box contains a 50g Thai Flower Market scented mini votive candle in a mix of bold colours in a simple glass jar, perfect for placing around the home, or for the perfect candle gift set. Each candle has an approximate burn time of up to 7 hours, and should always be handled with care once lit.</p>', 'published', '[\"products\\/thailand-set-of-3-mini-votive-candles-in-gift-box-thai-flower-market-scent-50g.jpg\"]', 'AH-1-205', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 50.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-24 00:32:17', '2021-04-29 16:52:59', 0, 6),
(194, 'Candlelight Bohemian Reed Diffuser in Gift Box Amber Shea Scent', '<p>The Candlelight Bohemian Reed Diffuser is perfect for placing around the home.</p>', '<p>The amber shea scented oil can fill any room in a customers home with its delightful fragrance. The reed oil diffuser comes packaged in a coloured cylinder with the blue and gold pattern. Each reed diffuser is made of glass with a printed gold pattern, with a screw top lid. Each reed diffuser contains 150ml of fragranced oil and 6 reeds which help maximise the scent for up to 45 days.&nbsp;</p>', 'published', '[\"products\\/room-fragrance\\/candlelight-home-reed-diffuser-candlelight-bohemian-reed-diffuser-in-gift-box-amber-shea-scent-150ml.jpg\"]', 'AH-1-206', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 10.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 150.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-24 00:35:03', '2021-04-29 10:00:19', 1, 7),
(195, 'Candlelight Bohemian Large Tin Candle Amber Shea Scent', '<p>The Candlelight Bohemian Large Tin Candle is presented in an elegant gold colour tin with blue and gold coloured label.</p>', '<p>This item is ideal for customers to place around their homes either on its own, or as part of a larger collection of candles and reed diffusers from the Candlelight Bohemian collection. Its amber shea scent can fill the room with its delightful fragrance, with a burn time of 12 hours. Each 130g candle should always be handled with care once lit.&nbsp;</p>', 'published', '[\"products\\/3-small-tin-candles-amber-shea-angel-flower-amber-lily-scent-60g.jpg\"]', 'AH-1-207', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 60.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-24 01:15:47', '2021-04-30 05:28:52', 0, 9),
(196, 'Candlelight Peace Reed Diffuser in Gift Box Redcurrant and Ivy Scent', '<p>The Candlelight Peace Reed Diffuser is presented in a beautiful peace themed gift box.</p>', '<p>The distinctive redcurrant &amp; ivy fragrance can fill any room in a customers house with its delightful scent. This reed diffuser would make an amazing gift. Each reed diffuser contains 100ml of fragranced oil and 6 reeds which help maximise the scent for up to 45 days.&nbsp;</p>', 'published', '[\"products\\/room-fragrance\\/candlesss.jpg\"]', 'AH-1-208', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 10.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 100.00, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-24 02:00:26', '2021-04-28 21:54:06', 0, 6),
(197, 'Candlelight Peace Large Wax Filled Pot Candle in Gift Box Redcurrant and Ivy Scent', '<p>The Candlelight Peace Large Wax Filled Pot Candle is presented in a beautiful peace themed gift box.</p>', '<p>The distinctive redcurrant &amp; ivy scented candle is contained in a grey frosted glass pot, allowing the customer to make a statement in any room. Each 220g candle has an approximate burn time of up to 26 hours, and should always be handled with care once lit.&nbsp;</p>', 'published', '[\"products\\/c2.jpg\"]', 'AH-1-208', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 100.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-24 02:11:23', '2021-04-29 20:20:19', 0, 10),
(198, 'Posey Reed Diffuser in Gift Box Angel Rose Scent', '<p>The Posey reed diffuser is displayed in a distinctive pink gift box, with an open window showing the beautiful frosted glass bottle which has a gold screw top lid and gold details.&nbsp;</p>', '<p>This item is an ideal statement piece for any customers homes. Each display box contains the glass bottle, containing 75ml of angel flower fragrance oil, and 6 individual reeds to allow for maximum scent coverage for up to 30 days.&nbsp;</p>', 'published', '[\"products\\/room-fragrance\\/posey.jpg\"]', 'AH-1-209', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 6.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 75.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-24 02:41:55', '2021-05-01 00:23:22', 0, 11),
(199, 'Posey Small Tin Candle Angel Rose Scent', '<p>The Posey small tin candle is presented in an attractive pink and gold.</p>', '<p>This product is&nbsp;designed tin, With its indulgent angel flower fragrance, which has a burn time of 6 hours, the Posey scented candle is ideal as a small gift or placing around the home. Each candle is 60g and should always be handled with care once lit.&nbsp;</p>', 'published', '[\"products\\/posey-small-tin-candle-angel-rose-scent-60g.jpg\"]', 'AH-1-210', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 2.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 60.00, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-24 02:47:00', '2021-05-01 08:03:35', 0, 9),
(200, 'Candlelight Totally Lit Reed Diffuser in Gift Box Mimosa Scent', '<p>The Candlelight Totally Lit Reed Diffuser makes the ideal gift for any celebration.</p>', '<p>The mimosa scented oil can fill any room in a customers home with its fresh fragrance. The reed oil diffuser comes packaged in a coloured cylinder with the &#39;Totally lit&#39; message in foil. Each reed diffuser is made of frosted glass, with a screw top lid. Each reed diffuser includes 6 reeds which help maximise the scent for up to 45 days</p>', 'published', '[\"products\\/room-fragrance\\/mimosa-scent.jpg\"]', 'AH-1-211', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 10.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 150.00, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-24 02:52:12', '2021-04-25 19:43:53', 0, 15),
(201, 'Candlelight Totally Lit Large Wax Filled Pot Candle Mimosa Scent', '<p>The Candlelight Totally Lit Large Wax Filled Pot is an ideal addition to any customers home.</p>', '<p>The mimosa scented candle is contained in a frosted glass pot with a frosted glass lid, around the pot is its distinctive coloured band and inspirational message. Each 380g candle has a burn time of 45 hours and should always be handled with care once lit.&nbsp;</p>', 'published', '[\"products\\/totally-lit-large-wax-filled-pot-candle-mimosa-scent-380g.jpg\"]', 'AH-1-209', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 380.00, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-24 02:55:34', '2021-04-25 21:47:53', 0, 11),
(202, 'Candlelight Paradise Reed Diffuser in Gift Box Pineapple Scent', '<p>The Candlelight Paradise reed diffuser is part of our Blush &amp; Mint range of reed diffusers and scented candles. The Paradise reed diffuser is a delightful addition to any customers home, or for the perfect gift. Presented in a beautiful gift box, the Paradise design features on a wide range of products from Candlelight.</p>', '<p>Contained within the gift box is a 150ml glass bottle containing pineapple aroma scented oil, along with 6 individual reeds for maximum scent coverage or prolonging the lifetime of the diffuser for up to 45 days.</p>', 'published', '[\"products\\/room-fragrance\\/paradise1.jpg\"]', 'AH-1-213', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 10.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 150.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-24 03:01:37', '2021-04-20 22:44:17', 1, 13),
(203, 'Candlelight Paradise Wax Filled Pot Candle in Gift Box Pineapple Scent', '<p>The Candlelight Paradise wax filled pot candle is presented in a delightful gift box making it an ideal gift for a special occasion or as an addition to any customers home.</p>', '<p>Each pineapple scented candle is contained in a decorative glass jar, themed to the gift box itself which will look amazing in any room around the home. Each 220g candle has an approximate burn time of up to 26 hours, and should always be handled with care once lit.</p>', 'published', '[\"products\\/paradise-wax-filled-pot-candle-in-gift-box-pineapple-scent-220g.jpg\"]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 5.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 220.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-24 03:04:02', '2021-04-26 02:11:07', 0, 18),
(204, 'Zesty Reed Diffuser in Gift Box Pineapple Scent', '<p>The Zesty reed diffuser is displayed in a distinctive gift box, with an open window showing the beautiful green frosted glass bottle which has a silver screw top lid. This item is an ideal statement piece for any customers homes.</p>', '<p>Each display box contains the glass bottle, containing 75ml of pineapple fragrance oil, and 6 individual reeds to allow for maximum scent coverage for up to 30 days.&nbsp;</p>', 'published', '[\"products\\/room-fragrance\\/zeety-difusser.jpg\"]', 'AH-1-217-blue', 0, 200, 1, 1, 0, NULL, NULL, 0, 0, 0, 0, 6.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 75.00, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-24 03:10:44', '2021-04-25 04:08:44', 1, 18),
(205, 'Zesty Small Tin Candle Pineapple Scent', '<p>The Zesty small tin scented candle is presented with a simple yet stylish design and is the perfect companion for our large range of scented candles and reed diffusers in our Blush range, ideal for placing around a customers home.</p>', '<p>Each 60g candle has a pineapple scent, with each candle having a burn time of 6 hours and should always be handled with care once lit.</p>', 'published', '[\"products\\/zesty-calm-posey-set-of-3-small-tin-candles-pineapple-frensh-linen-angel-rose-scent-60g.jpg\"]', 'AH-1-218', 0, 0, 0, 1, 0, NULL, NULL, 0, 0, 0, 0, 7.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 60.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-24 03:13:26', '2021-04-16 17:45:28', 1, 13),
(206, 'Zesty Frosted Glass Wax Filled Pot Candle in Gift Box Pineapple Scent', '<p>The Zesty frosted glass wax filled pot candle is packaged in an attractive and stylish cylinder green display box, with silver foil details. Each 220g pineapple scented candle is contained in a green frosted glass pot, with silver foil detail in an all over print.</p>', '<p>This scented candle makes an ideal gift, either on its own or together with other items in this stunning co-ordinating range. Each candle has a burn time of 26 hours and should always be handled with care once lit.</p>\r\n\r\n<hr />', 'published', '[\"products\\/zesty-frosted-glass-wax-filled-pot-candle-in-gift-box-pineapple-scent-220g.jpg\"]', NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 7.8, NULL, NULL, NULL, 0.00, 0.00, 0.00, 220.00, NULL, NULL, NULL, NULL, NULL, 1, '2021-01-24 03:15:28', '2021-04-21 22:51:12', 1, 23),
(207, 'Zesty Large Tin Candle Pineapple Scent', '<p>Our Zesty large tin scented candle is presented with a stylish white and green design with subtle silver foil dots.</p>', '<p>Each candle has an attractive pineapple scent, capable of filling any room with a fresh, fruity scent. Each large tin scented candle has a burn time of 12 hours and should always be handled with care once lit.</p>', 'published', '[\"products\\/zesty-large-tin-candle-pineapple-scent-130g-6pk.jpg\"]', 'AH-1-219', 0, 0, 0, 1, 0, NULL, NULL, 0, 0, 0, 0, 2.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 130.00, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-24 03:19:55', '2021-04-25 20:29:38', 0, 21),
(208, 'Ashley Handmade Aromatherapy Scented Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', '<p>Ashley In-House-Soy Wax Melts: Aromatherapy, Handpoured scented soy wax melts in 18g size decorated with dried flowers shrubs &amp; petals and presented in large and small clear glass jars.</p>\r\n\r\n<p><strong>Packages:&nbsp;</strong> 20 pieces of oval shaped melts in a Large Size Clear Glass jar with Bamboo Lid.&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>\r\n\r\n<p><strong>Burn Time:</strong>&nbsp;3-4 Hours.</p>\r\n\r\n<p><strong><span style=\"color:#33cccc;\">Enjoy Selecting one of our beatiful fragrances (See fragrance descriptions&#39; below).</span></strong></p>', '<p>Let your space breathe out freshness! This highly scented soy wax melts offer delicately clean and uplifting fragrance that delights your space.</p>\r\n\r\n<p>This pure and safe vegetable based natural soy wax melts are entirely free from toxins, paraffin, and harmful residues. It burns clean and releases long lasting aroma from the unique combination of fragrance oil.</p>\r\n\r\n<p>Natural Soy wax blend melts have Therapeutic Aroma that calms the nerves and relieves anxiety, making them the best stress-relieving wax melts. It can be used also for insomnia, meditation, aromatherapy, removing odours, etc.</p>\r\n\r\n<p>Buy this organic wax melts along with our range of wax burners and warmers to purify the air in your home. Our melts come in sizes of &asymp;18g and above and are presented in Large clear glass Bamboo topped jar and Small clear glass clipped top jar.&nbsp;</p>\r\n\r\n<p>The wax melts also come in a two piece; container and lid innovative form of tart/melt in a shinning recyclable plastic pods packaging, containing about 1 oz of wax that make them stand out.</p>\r\n\r\n<p>Our wax melts are also available in luxury clear glass bowl also with glass lid and can be elegantly packaged as perfect gifts as may be desired by you! This will make a wonderful gift for all occasions for friends, loved one, birthday, housewarming, thank you, Mothers &amp; Father&rsquo;s Days gifts and an even better a treat for yourself.</p>\r\n\r\n<p>This hand poured soy wax melts are in unique shapes and sizes with natural soy wax and elegant fragrance oil combination. They are 100% natural and pure, non-toxic, vegan friendly products, with a burn time of 3-4 hours per melts.</p>\r\n\r\n<p>The wax melts are presented in varieties of fragrance notes to choose from and a cumulative of 47 fragrance types, all with unique and beautiful combination of decorated dried flowers and petals, bringing aromatherapy benefits and wellness to your space.</p>', 'published', '[\"products\\/wax-melts\\/4-4.png\",\"products\\/wax-melts\\/1-3.jpg\",\"products\\/wax-melts\\/2-3.jpg\",\"products\\/wax-melts\\/3-4.png\",\"products\\/wax-melts\\/5-3.jpg\",\"products\\/wax-melts\\/4-3.jpg\",\"products\\/wax-melts\\/3-3.jpg\"]', 'AH-1-211', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-01-26 00:29:42', '2021-04-23 19:08:36', 0, 49),
(211, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', '<p>Ashley In-House-Soy Wax Melts: Aromatherapy, Handpoured scented soy Tealights heart and round shaped ocean blue containers in 15g size decorated with dried shrubs &amp; petals and presented in clear glass jar.</p>\r\n\r\n<p><strong>Size:&nbsp;</strong> &asymp;15g per Tealights (including container)</p>\r\n\r\n<p><strong>Packages:</strong>&nbsp; 18 pieces of tealights in clear containers packaged in clear glass Jar with lid&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>\r\n\r\n<p><strong>Burn Time:</strong>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 2-3 Hours</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"color:#33cccc;\"><strong>Enjoy Selecting one of our beautiful fragrances (See fragrance descriptions&#39; below).</strong></span></p>', '<p>Let your space breathe out freshness! This highly scented soy wax tealights offer delicately clean and uplifting fragrance that delights your space.</p>\r\n\r\n<p>This pure and safe vegetable based natural soy wax tealights are entirely free from toxins, paraffin, and harmful residues. It burns clean and releases long lasting aroma from the unique combination of fragrance oil.</p>\r\n\r\n<p>Natural Soy wax blend tealight melts have Therapeutic Aroma that calms the nerves and relieves anxiety, making them the best stress-relieving tealights. It can be used also for insomnia, meditation, aromatherapy, removing odours, etc.</p>\r\n\r\n<p>Buy this organic tealights along with our range of designers tealights stands, lanterns and holders to complement and purify the air in your home. Our tealights come in 15g and are presented in clear large glass&nbsp; jar&nbsp; containing 18 pieces of tealights.&nbsp;&nbsp;</p>\r\n\r\n<p>Our tealight are also available in luxury clear glass bowl with glass lid and can be elegantly packaged as perfect gifts as may be desired by you! This would make a wonderful gift for all occasions for friends, loved one, birthday, housewarming, thank you, Mothers &amp; Father&rsquo;s Days gifts and an even better a treat for yourself.</p>\r\n\r\n<p>This hand poured soy wax tealights are in unique shapes and sizes with natural soy wax and elegant fragrance oil combination. They are 100% natural and pure, non-toxic, vegan friendly products, with a burn time of 2-3 hours per tealight.</p>\r\n\r\n<p>The wax tealights are presented in varieties of fragrance notes to choose from and a cumulative of 47 fragrance types, all with unique and beautiful combination of decorated dried flowers and petals, bringing aromatherapy benefits and wellness to your space.</p>', 'published', '[\"products\\/tealights\\/tealights.jpg\",\"products\\/tealights\\/7.jpg\",\"products\\/tealights\\/7.jpg\",\"products\\/tealights\\/6.jpg\",\"products\\/tealights\\/5.jpg\",\"products\\/tealights\\/4.jpg\",\"products\\/tealights\\/3.jpg\",\"products\\/tealights\\/2.jpg\",\"products\\/tealights\\/1.jpg\"]', 'AH-1-214-back', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-01-26 00:58:33', '2021-04-25 01:18:40', 0, 50),
(212, 'Ashley in-House Handpoured Aromatherapy Candle - purple flavor', '<p>These are c<b>andles</b>&nbsp;on the other&nbsp;<b>hand</b>&nbsp;are usually&nbsp;<b>made</b>&nbsp;from far superior materials.</p>\r\n\r\n<p><span style=\"color:#33cccc;\">Enjoy Selecting one of our beautiful fragrances (See fragrance descriptions&#39; below).</span></p>', '<p>In the case of Busy Bee&nbsp;<b>Candles</b>, all of our products are&nbsp;<b>handmade</b>&nbsp;and are&nbsp;<b>made</b>&nbsp;from natural soy wax.</p>', 'draft', '[\"products\\/candles\\/candle4.jpg\"]', 'AH-1-300', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-02-12 22:19:55', '2021-03-07 02:26:13', 0, 20),
(213, 'Ashley in-House Handpoured Aromatherapy Candles - Orange and Green flavor', '<p>These are candles&nbsp;on the other&nbsp;hand&nbsp;are usually&nbsp;made&nbsp;from far superior materials.</p>\r\n\r\n<p><br />\r\n<span style=\"color:#33cccc;\"><strong>Enjoy Selecting one of our beautiful fragrances (See fragrance descriptions&#39; below).</strong></span></p>', '<p>In the case of Busy Bee&nbsp;Candles, all of our products are&nbsp;handmade&nbsp;and are&nbsp;made&nbsp;from natural soy wax.</p>', 'draft', '[\"products\\/candles\\/candle2.jpg\"]', 'AH-1-301', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-02-12 22:23:18', '2021-03-07 02:25:15', 1, 13),
(214, 'Ashley in-House Handpoured Aromatherapy Candles - Blue flavor', '<p>These are candles&nbsp;on the other&nbsp;hand&nbsp;are usually&nbsp;made&nbsp;from far superior materials.</p>\r\n\r\n<p><br />\r\n<span style=\"color:#33cccc;\"><strong>Enjoy Selecting one of our beautiful fragrances (See fragrance descriptions&#39; below).</strong></span></p>', '<p>In the case of Busy Bee&nbsp;Candles, all of our products are&nbsp;handmade&nbsp;and are&nbsp;made&nbsp;from natural soy wax.</p>', 'draft', '[\"products\\/candles\\/candle6.jpg\"]', 'AH-1-305', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-02-12 22:26:42', '2021-03-07 02:24:30', 0, 17),
(215, 'Ashley in-House Aromatherapy, Handpoured scented soy wax candles presented in Clear Glass', '<p>Ashley In-House - Soy Wax Candles: Aromatherapy, Handpoured scented soy wax candle in <u>18.60(FL oz) </u><u>detailed in</u><u> clear glass</u> topped with dried flowers &amp; petals.</p>\r\n\r\n<p><strong>Size:&nbsp;&nbsp;</strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;12.5cm (D) x 7cm (H)</p>\r\n\r\n<p><strong>Container:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Clear Glass</p>\r\n\r\n<p><strong>Material:&nbsp;</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Soy Wax, Scented Fragrance Oil, Flowers &amp; Petals, Wick</p>\r\n\r\n<p><strong>Burn Time:&nbsp;</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 100+ Hours.</p>\r\n\r\n<p>These are candles on the other hand are usually made from far superior materials.</p>\r\n\r\n<p><span style=\"color:#33cccc;\"><strong>Enjoy Selecting one of our beautiful fragrances (See fragrance descriptions&#39; below).</strong></span></p>', '<p>Let your space breathe out freshness! This highly scented candle offers delicately clean and uplifting fragrance that delights your space.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>This pure and safe vegetable based natural soy wax candle are entirely free from toxins, paraffin, and harmful residues. It burns clean and releases long lasting aroma from the unique combination of fragrance oil.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Natural Soy wax blend candles have Therapeutic Aroma that calms the nerves and relieves anxiety, making them the best stress-relieving candles. It can be used also for insomnia, meditation, aromatherapy, removing odours, etc.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Long &amp; Clean Burning. This organic candle burns clean to purify the air in your home for over 100+ hours depending on usage. It comes in an 18.60FL oz clear glass for an aesthetically pleasing look.&nbsp; This scented candle is bigger thus burns 3 to 5 times longer than most smaller candles.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Perfect Gift and Elegantly packaged! This will make a wonderful gift for all occasions for friends, loved one, birthday, housewarming, thank you, Mothers &amp; Fathers Days gifts and an even better a treat for yourself.</p>\r\n\r\n<p>This hand poured soy wax candles comes in two different containers of crystal glass and silver round tin with open see through cover with natural soy wax and elegant fragrance oil combination. They are 100% natural and pure, non-toxic, vegan friendly products, with a burn time of up to 100+ hours and 75+ hours respectively.</p>\r\n\r\n<p>Our winter/spring collection presents you with five distinct types of fragrance notes to choose from and a cumulative of 24 fragrance types, all with unique and beautiful combination of decorated dried flowers and petals, bringing aromatherapy benefits and wellness to your space.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Floral/Fresh Scent &ndash; Has a potential natural&nbsp;healing&nbsp;element and substantial mental or emotional&nbsp;benefits such as naturally easing mood, relieving anxiety &amp; fatigue and maintaining memory abilities for individuals with memory disorders.&nbsp;Choose variants: 1.) Peony &amp; Blush Suede; 2.) Black Amber &amp; Lavender; 3.) English Pear &amp; Freesia; 4.) Sheer Lily &amp; White Rose</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Fruity/Sweet Scents- Fruits may be well known for their mineral properties and the&nbsp;smell&nbsp;of the fruits&nbsp;can&nbsp;boost your body&#39;s production of serotonin, a hormone that makes you feel happy. , but simply by sniffing most fruit, they also are energy boosters that may help reduce feelings of stress, anxiety, depression and irritability. Choose variants: 1.) Passionfruit &amp; Martini; 2.) Strawberry Fizz; 3.) Black Raspberry &amp; Vanilla.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Citrusy Scents &ndash; Diffusing Citrus scents are known to effectively boost the immune system, makes your home smell wonderful, eliminate germs in the air, help to reduce feelings of anxiety and irritability, as well as other mood disorders. Lemon might be the most powerful of the&nbsp;citrus&nbsp;smells&mdash; it has been shown that smelling it&nbsp;can&nbsp;increase mental stimulation.Choose variants: 1.) Lime, Basil &amp; Mandarin; 2.) Lemongrass &amp; Persian Lime; 3.) Lemon &amp; Musk.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Woody/Spicy Scents &ndash; Woody family typically contain Sandalwood, Pine, Patchouli, Vetiver and Cedarwood &ndash; fresh smell of the forest! Woody&nbsp;family&nbsp;have a lot in common and diffusing them may bring healing benefits and calming effect while boosting positive emotions. They contain terpenes which are anti-inflammatory, antibacterial, antiseptic, anti-viral and disinfectant, and are useful in purifying the air and also repelling insects, including head lice and bedbugs. Choose variants: 1.) Wood Sage &amp; Sea Salt; 2.) Pine, Jasmine &amp; Amber; 3.) Oriental Rose; 4.) Vetiver Cedarwood &amp; Fir; 5.) Oud Wood.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Luxury/Spa/Perfume Signature Inspired Scents &ndash; A sense of&nbsp;smell&nbsp;plays an important role in the physiological effects of mood, emotions, stress, and working capacity. Fragrance smell from various natural sources have been used therapeutically for immediate relaxation, to access the deep parts of the subconscious where a great deal of decision making is done and finally to stimulates feelings of euphoria and happiness. We can also help you incorporate your perfume or signature smell into your space. Choose variants: 1.) Velvet Rose &amp; Oud; 2.) Snug As A Bug; 3.) Coconut Lime; 4.) Egyptian Amber</li>\r\n</ul>', 'published', '[\"products\\/candles\\/29.jpg\",\"products\\/candles\\/candle1.jpg\",\"products\\/candles\\/35.jpg\",\"products\\/candles\\/36.jpg\",\"products\\/candles\\/34.jpg\",\"products\\/candles\\/33.jpg\",\"products\\/candles\\/28.jpg\",\"products\\/candles\\/21.jpg\",\"products\\/candles\\/31.jpg\",\"products\\/candles\\/38.jpg\",\"products\\/candles\\/30.jpg\",\"products\\/candles\\/27.jpg\",\"products\\/candles\\/26.png\",\"products\\/candles\\/22.jpg\",\"products\\/candles\\/25.jpg\",\"products\\/candles\\/24.jpg\",\"products\\/candles\\/20.jpg\"]', 'AH-1-302-red', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-02-12 22:31:41', '2021-04-30 21:23:26', 0, 101),
(216, 'Ashley In-House-Aromatherapy, Handpoured scented soy wax candles presented in Silver Round Tin with Open Cover', '<p>Ashley In-House - Soy Wax Candles: Aromatherapy, Handpoured scented soy wax candle in 14.10(FL oz) detailed in Silver Round Tin with Open (see through) cover &amp; topped with dried flowers &amp; petals.</p>\r\n\r\n<p><strong>Size:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9.5cm (D) x 6.5cm (H)</p>\r\n\r\n<p><strong>Container:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Silver Round Tin with Open Window&nbsp;&nbsp;&nbsp;</p>\r\n\r\n<p><strong>Material:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Soy Wax, Scented Fragrance Oil, Flowers &amp; Petals, Wick</p>\r\n\r\n<p><strong>Burn Time:</strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;75+ Hours.</p>\r\n\r\n<p><span style=\"color:#33cccc;\"><strong>Enjoy Selecting one of our beautiful fragrances (See fragrance descriptions&#39; below).</strong></span></p>', '<p>Let your space breathe out freshness! This highly scented candle offers delicately clean and uplifting fragrance that delights your space.</p>\r\n\r\n<p>This pure and safe vegetable based natural soy wax candle are entirely free from toxins, paraffin, and harmful residues. It burns clean and releases long lasting aroma from the unique combination of fragrance oil.</p>\r\n\r\n<p>Natural Soy wax blend candles have Therapeutic Aroma that calms the nerves and relieves anxiety, making them the best stress-relieving candles. It can be used also for insomnia, meditation, aromatherapy, removing odours, etc.</p>\r\n\r\n<p>Long &amp; Clean Burning. This organic candle burns clean to purify the air in your home for over 75+ hours depending on usage. It comes in an 14.10FL oz silver round tin with see through cover for an aesthetically pleasing look.&nbsp; This scented candle is bigger thus burns 3 to 5 times longer than most smaller candles.</p>\r\n\r\n<p>Perfect Gift and Elegantly packaged! This will make a wonderful gift for all occasions for friends, loved one, birthday, housewarming, thank you, Mothers &amp; Fathers&rsquo; Days gifts and an even better a treat for yourself.</p>\r\n\r\n<p>This hand poured soy wax candles comes in two different containers of crystal glass and silver round tin with open see through cover with natural soy wax and elegant fragrance oil combination. They are 100% natural and pure, non-toxic, vegan friendly products, with a burn time of up to 100+ hours and 75+ hours respectively.</p>\r\n\r\n<p>Our winter/spring collection presents you with five distinct types of fragrance notes to choose from and a cumulative of 24 fragrance types, all with unique and beautiful combination of decorated dried flowers and petals, bringing aromatherapy benefits and wellness to your space.</p>\r\n\r\n<ul>\r\n	<li>Floral/Fresh Scent &ndash; Has a potential natural&nbsp;healing&nbsp;element and substantial mental or emotional&nbsp;benefits such as naturally easing mood, relieving anxiety &amp; fatigue and maintaining memory abilities for individuals with memory disorders.&nbsp;Choose variants: 1.) Peony &amp; Blush Suede; 2.) Black Amber &amp; Lavender; 3.) English Pear &amp; Freesia; 4.) Sheer Lily &amp; White Rose</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Fruity/Sweet Scents- Fruits may be well known for their mineral properties and the&nbsp;smell&nbsp;of the fruits&nbsp;can&nbsp;boost your body&#39;s production of serotonin, a hormone that makes you feel happy. , but simply by sniffing most fruit, they also are energy boosters that may help reduce feelings of stress, anxiety, depression and irritability. Choose variants: 1.) Passionfruit &amp; Martini; 2.) Strawberry Fizz; 3.) Black Raspberry &amp; Vanilla.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Citrusy Scents &ndash; Diffusing Citrus scents are known to effectively boost the immune system, makes your home smell wonderful, eliminate germs in the air, help to reduce feelings of anxiety and irritability, as well as other mood disorders. Lemon might be the most powerful of the&nbsp;citrus&nbsp;smells&mdash; it has been shown that smelling it&nbsp;can&nbsp;increase mental stimulation. Choose variants: 1.) Lime, Basil &amp; Mandarin; 2.) Lemongrass &amp; Persian Lime; 3.) Lemon &amp; Musk.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Woody/Spicy Scents &ndash; Woody family typically contain Sandalwood, Pine, Patchouli, Vetiver and Cedarwood &ndash; fresh smell of the forest! Woody&nbsp;family&nbsp;have a lot in common and diffusing them may bring healing benefits and calming effect while boosting positive emotions. They contain terpenes which are anti-inflammatory, antibacterial, antiseptic, anti-viral and disinfectant, and are useful in purifying the air and also repelling insects, including head lice and bedbugs. Choose variants: 1.) Wood Sage &amp; Sea Salt; 2.) Pine, Jasmine &amp; Amber; 3.) Oriental Rose; 4.) Vetiver Cedarwood &amp; Fir; 5.) Oud Wood.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Luxury/Spa/Perfume Signature Inspired Scents &ndash; A sense of&nbsp;smell&nbsp;plays an important role in the physiological effects of mood, emotions, stress, and working capacity. Fragrance smell from various natural sources have been used therapeutically for immediate relaxation, to access the deep parts of the subconscious where a great deal of decision making is done and finally to stimulates feelings of euphoria and happiness. We can also help you incorporate your perfume or signature smell into your space. Choose variants: 1.) Velvet Rose &amp; Oud; 2.) Snug As A Bug; 3.) Coconut Lime; 4.) Egyptian Amber</li>\r\n</ul>', 'published', '[\"products\\/candles\\/13.jpg\",\"products\\/candles\\/66i.jpg\",\"products\\/candles\\/picture1.jpg\",\"products\\/candles\\/611.jpg\",\"products\\/candles\\/61.jpg\",\"products\\/candles\\/12.png\",\"products\\/candles\\/5.jpg\",\"products\\/candles\\/4.jpg\",\"products\\/candles\\/3.jpg\",\"products\\/candles\\/10.jpg\",\"products\\/candles\\/9.jpg\",\"products\\/candles\\/8.jpg\",\"products\\/candles\\/7.jpg\",\"products\\/candles\\/2.jpg\",\"products\\/candles\\/1.jpg\"]', 'AH-1-303', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 14.99, NULL, NULL, NULL, 0.00, 9.50, 6.50, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-02-12 22:36:30', '2021-04-30 15:33:26', 0, 92);
INSERT INTO `ec_products` (`id`, `name`, `description`, `content`, `status`, `images`, `sku`, `order`, `quantity`, `allow_checkout_when_out_of_stock`, `with_storehouse_management`, `is_featured`, `options`, `category_id`, `is_variation`, `is_searchable`, `is_show_on_list`, `sale_type`, `price`, `sale_price`, `start_date`, `end_date`, `length`, `wide`, `height`, `weight`, `barcode`, `length_unit`, `wide_unit`, `height_unit`, `weight_unit`, `brand_id`, `created_at`, `updated_at`, `tax_id`, `views`) VALUES
(217, 'Ashley in-House Aromatherapy, Handpoured scented soy wax candles presented in Clear Glass', '<p>Ashley In-House - Soy Wax Candles: Aromatherapy, Handpoured scented soy wax candle in <u>18.60(FL oz) </u><u>detailed in</u><u> clear glass</u> topped with dried flowers &amp; petals.</p>\r\n\r\n<p><strong>Size:&nbsp;&nbsp;</strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;12.5cm (D) x 7cm (H)</p>\r\n\r\n<p><strong>Container:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Clear Glass</p>\r\n\r\n<p><strong>Material:&nbsp;</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Soy Wax, Scented Fragrance Oil, Flowers &amp; Petals, Wick</p>\r\n\r\n<p><strong>Burn Time:&nbsp;</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 100+ Hours.</p>\r\n\r\n<p>These are candles on the other hand are usually made from far superior materials.</p>\r\n\r\n<p><span style=\"color:#33cccc;\"><strong>Enjoy Selecting one of our beautiful fragrances (See fragrance descriptions&#39; below).</strong></span></p>', '<p>Let your space breathe out freshness! This highly scented candle offers delicately clean and uplifting fragrance that delights your space.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>This pure and safe vegetable based natural soy wax candle are entirely free from toxins, paraffin, and harmful residues. It burns clean and releases long lasting aroma from the unique combination of fragrance oil.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Natural Soy wax blend candles have Therapeutic Aroma that calms the nerves and relieves anxiety, making them the best stress-relieving candles. It can be used also for insomnia, meditation, aromatherapy, removing odours, etc.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Long &amp; Clean Burning. This organic candle burns clean to purify the air in your home for over 100+ hours depending on usage. It comes in an 18.60FL oz clear glass for an aesthetically pleasing look.&nbsp; This scented candle is bigger thus burns 3 to 5 times longer than most smaller candles.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Perfect Gift and Elegantly packaged! This will make a wonderful gift for all occasions for friends, loved one, birthday, housewarming, thank you, Mothers &amp; Fathers Days gifts and an even better a treat for yourself.</p>\r\n\r\n<p>This hand poured soy wax candles comes in two different containers of crystal glass and silver round tin with open see through cover with natural soy wax and elegant fragrance oil combination. They are 100% natural and pure, non-toxic, vegan friendly products, with a burn time of up to 100+ hours and 75+ hours respectively.</p>\r\n\r\n<p>Our winter/spring collection presents you with five distinct types of fragrance notes to choose from and a cumulative of 24 fragrance types, all with unique and beautiful combination of decorated dried flowers and petals, bringing aromatherapy benefits and wellness to your space.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Floral/Fresh Scent &ndash; Has a potential natural&nbsp;healing&nbsp;element and substantial mental or emotional&nbsp;benefits such as naturally easing mood, relieving anxiety &amp; fatigue and maintaining memory abilities for individuals with memory disorders.&nbsp;Choose variants: 1.) Peony &amp; Blush Suede; 2.) Black Amber &amp; Lavender; 3.) English Pear &amp; Freesia; 4.) Sheer Lily &amp; White Rose</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Fruity/Sweet Scents- Fruits may be well known for their mineral properties and the&nbsp;smell&nbsp;of the fruits&nbsp;can&nbsp;boost your body&#39;s production of serotonin, a hormone that makes you feel happy. , but simply by sniffing most fruit, they also are energy boosters that may help reduce feelings of stress, anxiety, depression and irritability. Choose variants: 1.) Passionfruit &amp; Martini; 2.) Strawberry Fizz; 3.) Black Raspberry &amp; Vanilla.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Citrusy Scents &ndash; Diffusing Citrus scents are known to effectively boost the immune system, makes your home smell wonderful, eliminate germs in the air, help to reduce feelings of anxiety and irritability, as well as other mood disorders. Lemon might be the most powerful of the&nbsp;citrus&nbsp;smells&mdash; it has been shown that smelling it&nbsp;can&nbsp;increase mental stimulation.Choose variants: 1.) Lime, Basil &amp; Mandarin; 2.) Lemongrass &amp; Persian Lime; 3.) Lemon &amp; Musk.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Woody/Spicy Scents &ndash; Woody family typically contain Sandalwood, Pine, Patchouli, Vetiver and Cedarwood &ndash; fresh smell of the forest! Woody&nbsp;family&nbsp;have a lot in common and diffusing them may bring healing benefits and calming effect while boosting positive emotions. They contain terpenes which are anti-inflammatory, antibacterial, antiseptic, anti-viral and disinfectant, and are useful in purifying the air and also repelling insects, including head lice and bedbugs. Choose variants: 1.) Wood Sage &amp; Sea Salt; 2.) Pine, Jasmine &amp; Amber; 3.) Oriental Rose; 4.) Vetiver Cedarwood &amp; Fir; 5.) Oud Wood.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Luxury/Spa/Perfume Signature Inspired Scents &ndash; A sense of&nbsp;smell&nbsp;plays an important role in the physiological effects of mood, emotions, stress, and working capacity. Fragrance smell from various natural sources have been used therapeutically for immediate relaxation, to access the deep parts of the subconscious where a great deal of decision making is done and finally to stimulates feelings of euphoria and happiness. We can also help you incorporate your perfume or signature smell into your space. Choose variants: 1.) Velvet Rose &amp; Oud; 2.) Snug As A Bug; 3.) Coconut Lime; 4.) Egyptian Amber</li>\r\n</ul>', 'published', '[\"products\\/candles\\/candle8.jpg\",\"products\\/candles\\/37.jpg\"]', 'AH-1-304-red', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, NULL, NULL, NULL, NULL, NULL, NULL, 10, '2021-02-12 22:38:36', '2021-05-02 08:33:48', 1, 148),
(220, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', '<p>Ashley In-House-Soy Wax Melts: Aromatherapy, Handpoured scented soy wax melts in 18g size decorated with dried flowers shrubs &amp; petals and presented in large and small clear glass jars.</p>\r\n\r\n<p><strong>Packages:</strong> 15 pieces of oval shaped melts in luxury clear glass bowl with glass lid</p>\r\n\r\n<p><strong>Burn Time: </strong>3-4 Hours.</p>\r\n\r\n<p><span style=\"color:#33cccc;\"><strong>Enjoy Selecting one of our beautiful fragrances (See fragrance descriptions&#39; below).</strong></span></p>', '<p>Let your space breathe out freshness! This highly scented soy wax melts offer delicately clean and uplifting fragrance that delights your space.</p>\r\n\r\n<p>This pure and safe vegetable based natural soy wax melts are entirely free from toxins, paraffin, and harmful residues. It burns clean and releases long lasting aroma from the unique combination of fragrance oil.</p>\r\n\r\n<p>Natural Soy wax blend melts have Therapeutic Aroma that calms the nerves and relieves anxiety, making them the best stress-relieving wax melts. It can be used also for insomnia, meditation, aromatherapy, removing odours, etc.</p>\r\n\r\n<p>Buy this organic wax melts along with our range of wax burners and warmers to purify the air in your home. Our melts come in sizes of &asymp;18g and above and are presented in Large clear glass Bamboo topped jar and Small clear glass clipped top jar.&nbsp;</p>\r\n\r\n<p>The wax melts also come in a two piece; container and lid innovative form of tart/melt in a shinning recyclable plastic pods packaging, containing about 1 oz of wax that make them stand out.</p>\r\n\r\n<p>Our wax melts are also available in luxury clear glass bowl with glass lid and can be elegantly packaged as perfect gifts as may be desired by you! This will make a wonderful gift for all occasions for friends, loved one, birthday, housewarming, thank you, Mothers &amp; Father&rsquo;s Days gifts and an even better a treat for yourself.</p>\r\n\r\n<p>This hand poured soy wax melts are in unique shapes and sizes with natural soy wax and elegant fragrance oil combination. They are 100% natural and pure, non-toxic, vegan friendly products, with a burn time of 3-4 hours per melts.</p>\r\n\r\n<p>The wax melts are presented in varieties of fragrance notes to choose from and a cumulative of 47 fragrance types, all with unique and beautiful combination of decorated dried flowers and petals, bringing aromatherapy benefits and wellness to your space.</p>', 'published', '[\"products\\/wax-melts\\/1.jpg\",\"products\\/wax-melts\\/5.jpg\",\"products\\/wax-melts\\/4.jpg\",\"products\\/wax-melts\\/3.jpg\",\"products\\/wax-melts\\/2.jpg\"]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:01:32', '2021-04-27 00:15:56', 0, 27),
(221, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01-back', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:03:07', '2021-05-01 08:53:22', NULL, 2),
(222, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:04:10', '2021-04-26 16:02:23', NULL, 4),
(223, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:04:55', '2021-04-26 06:51:47', NULL, 3),
(224, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:06:15', '2021-04-15 03:34:14', NULL, 2),
(225, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:06:42', '2021-04-14 18:47:07', NULL, 2),
(226, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:07:07', '2021-04-26 06:18:24', NULL, 3),
(227, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:07:30', '2021-04-25 23:45:38', NULL, 2),
(228, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:07:51', '2021-04-14 18:05:01', NULL, 2),
(229, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:08:05', '2021-04-14 16:51:51', NULL, 2),
(230, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:08:18', '2021-04-26 16:41:37', NULL, 3),
(231, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:08:36', '2021-04-15 03:05:22', NULL, 2),
(232, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:08:48', '2021-04-25 20:26:16', NULL, 2),
(233, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:09:00', '2021-04-26 06:56:58', NULL, 2),
(234, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:09:14', '2021-04-28 04:56:48', NULL, 3),
(235, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:09:30', '2021-04-26 08:44:34', NULL, 3),
(236, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:09:47', '2021-04-15 06:15:11', NULL, 1),
(237, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:10:02', '2021-04-19 23:50:30', NULL, 2),
(238, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01-Birthday Cake', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:10:15', '2021-04-24 12:28:23', NULL, 2),
(239, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:10:44', '2021-04-26 07:15:25', NULL, 3),
(240, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:11:04', '2021-04-26 05:19:25', NULL, 2),
(241, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:11:26', '2021-04-25 22:27:56', NULL, 2),
(242, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:11:55', '2021-04-30 00:14:21', NULL, 3),
(243, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:12:08', '2021-04-25 16:56:36', NULL, 2),
(244, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:12:53', '2021-04-14 22:01:44', NULL, 1),
(245, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:13:10', '2021-04-25 21:46:17', NULL, 2),
(246, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:13:27', '2021-04-14 16:49:19', NULL, 2),
(247, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01-Pumpkin Pecan ', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:13:46', '2021-04-29 02:54:22', NULL, 3),
(248, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:14:22', '2021-04-30 09:08:01', NULL, 3),
(249, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:14:42', '2021-04-26 06:10:34', NULL, 3),
(250, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:14:58', '2021-04-29 03:17:54', NULL, 3),
(251, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:15:18', '2021-04-27 05:50:56', NULL, 2),
(252, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:15:34', '2021-04-26 21:33:39', NULL, 2),
(253, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:15:53', '2021-04-25 18:48:50', NULL, 2),
(254, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:16:08', '2021-05-01 13:55:36', NULL, 2),
(255, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:16:20', '2021-04-15 02:53:17', NULL, 1),
(256, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:16:52', '2021-04-26 03:35:04', NULL, 2),
(257, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:17:07', '2021-04-26 04:16:43', NULL, 3),
(258, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:17:21', '2021-04-15 00:04:41', NULL, 2),
(259, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:17:36', '2021-04-25 22:06:30', NULL, 2),
(260, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:17:53', '2021-04-25 16:48:31', NULL, 3),
(261, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:18:04', '2021-04-29 03:08:06', NULL, 4),
(262, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:18:31', '2021-04-19 00:27:46', NULL, 2),
(263, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:18:43', '2021-04-26 01:09:24', NULL, 3),
(264, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:18:58', '2021-04-26 05:50:10', NULL, 2),
(265, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:21:51', '2021-04-29 01:01:23', NULL, 2),
(266, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:22:03', '2021-04-28 00:26:26', NULL, 3),
(267, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 19:22:30', '2021-04-25 18:17:15', NULL, 3),
(268, 'Ashley In-House-Soy Wax Melts presented in Luxury Clear Glass Bowl With Glass Lid', NULL, NULL, 'published', '[]', 'AH-4-01', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 31.99, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-02 21:38:42', '2021-04-29 09:03:50', NULL, 3),
(269, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', '<p>Ashley In-House-Soy Wax Melts: Aromatherapy, Handpoured scented soy wax melts in gross weight of 35g per pod decorated with dried flowers shrubs &amp; petals and presented in a box of 6 wax melt sealed pods.</p>\r\n\r\n<p><strong>Package:&nbsp;</strong> 6 pieces in a two piece container &amp; lid recyclable pods. Price:&nbsp; &pound;11.94 per box of 6 pods&nbsp;</p>\r\n\r\n<p><strong>Burn Time:&nbsp;</strong>&nbsp;&nbsp;&nbsp; &nbsp; 3-4 Hours</p>\r\n\r\n<p><span style=\"color:#33cccc;\"><strong>Enjoy Selecting one of our beautiful fragrances (See fragrance descriptions&#39; below).</strong></span></p>\r\n\r\n<p>&nbsp;</p>', '<p>Let your space breathe out freshness! This highly scented soy wax melts offer delicately clean and uplifting fragrance that delights your space.</p>\r\n\r\n<p>This pure and safe vegetable based natural soy wax melts are entirely free from toxins, paraffin, and harmful residues. It burns clean and releases long lasting aroma from the unique combination of fragrance oil.</p>\r\n\r\n<p>Natural Soy wax blend melts have Therapeutic Aroma that calms the nerves and relieves anxiety, making them the best stress-relieving wax melts. It can be used also for insomnia, meditation, aromatherapy, removing odours, etc.</p>\r\n\r\n<p>Buy this organic wax melts along with our range of wax burners and warmers to purify the air in your home. Our melts come in sizes of &asymp;18g and above and are presented in Large clear glass Bamboo topped jar and Small clear glass clipped top jar.&nbsp;</p>\r\n\r\n<p>The wax melts also come in a two piece; container and lid innovative form of tart/melt in a shinning recyclable plastic pods packaging, containing about 1 oz of wax that make them stand out.</p>\r\n\r\n<p>Our wax melts are also available in luxury clear glass bowl with glass lid and can be elegantly packaged as perfect gifts as may be desired by you! This will make a wonderful gift for all occasions for friends, loved one, birthday, housewarming, thank you, Mothers &amp; Father&rsquo;s Days gifts and an even better a treat for yourself.</p>\r\n\r\n<p>This hand poured soy wax melts are in unique shapes and sizes with natural soy wax and elegant fragrance oil combination. They are 100% natural and pure, non-toxic, vegan friendly products, with a burn time of 3-4 hours per melts.</p>\r\n\r\n<p>The wax melts are presented in varieties of fragrance notes to choose from and a cumulative of 47 fragrance types, all with unique and beautiful combination of decorated dried flowers and petals, bringing aromatherapy benefits and wellness to your space.</p>', 'published', '[\"products\\/wax-melts\\/19.jpg\",\"products\\/wax-melts\\/17.jpg\",\"products\\/wax-melts\\/15.jpg\",\"products\\/wax-melts\\/13.jpg\",\"products\\/wax-melts\\/11.jpg\",\"products\\/wax-melts\\/7.jpg\",\"products\\/wax-melts\\/6.jpg\"]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 03:08:29', '2021-05-02 07:56:38', 0, 32),
(272, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02-back', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:14:52', '2021-04-26 00:22:36', NULL, 3),
(273, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:15:36', '2021-03-03 09:15:51', NULL, 0),
(274, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02-Cinnamon, Apple and Peach', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:17:52', '2021-04-14 22:06:34', NULL, 1),
(275, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02-Cinnamon, Sugar and Vanilla', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:18:07', '2021-04-24 20:58:09', NULL, 3),
(276, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:18:36', '2021-05-01 19:17:23', NULL, 3),
(277, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:18:56', '2021-05-01 00:46:53', NULL, 4),
(278, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:19:40', '2021-04-25 00:00:22', NULL, 3),
(279, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:21:04', '2021-04-25 02:32:37', NULL, 1),
(280, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:21:35', '2021-04-24 18:59:24', NULL, 1),
(281, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:22:04', '2021-04-26 02:54:45', NULL, 3),
(282, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:22:43', '2021-04-21 07:48:54', NULL, 2),
(283, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:23:54', '2021-04-24 22:23:08', NULL, 3),
(284, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:24:23', '2021-04-18 01:31:35', NULL, 2),
(285, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:24:55', '2021-04-24 21:26:54', NULL, 2),
(286, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:25:31', '2021-04-25 04:54:09', NULL, 2),
(287, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:25:53', '2021-04-14 17:57:27', NULL, 1),
(288, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:26:50', '2021-04-20 19:36:40', NULL, 3),
(289, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:27:10', '2021-04-20 13:50:50', NULL, 2),
(290, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:27:27', '2021-04-25 18:52:38', NULL, 3),
(291, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02-Lavender, Geranium and Cedar', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:27:53', '2021-04-29 02:52:05', NULL, 2),
(292, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:28:17', '2021-04-25 04:37:17', NULL, 3),
(293, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:28:34', '2021-04-24 14:47:56', NULL, 3),
(294, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:32:25', '2021-04-25 06:48:37', NULL, 3),
(295, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:33:08', '2021-04-15 17:40:03', NULL, 2),
(296, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:34:25', '2021-04-24 20:25:44', NULL, 2),
(297, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:35:02', '2021-04-26 03:50:22', NULL, 3),
(298, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:35:40', '2021-04-15 01:34:44', NULL, 2),
(299, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:35:57', '2021-04-26 18:10:10', NULL, 3),
(300, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:36:23', '2021-04-30 18:53:53', NULL, 2),
(301, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:36:49', '2021-04-29 19:25:16', NULL, 3),
(302, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:37:18', '2021-04-25 20:50:07', NULL, 3),
(303, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:37:56', '2021-04-24 21:38:46', NULL, 3),
(304, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:38:27', '2021-04-28 21:21:31', NULL, 4),
(305, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:39:50', '2021-04-26 22:06:08', NULL, 3),
(306, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:40:32', '2021-04-24 20:47:04', NULL, 2),
(307, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:41:29', '2021-04-27 23:34:55', NULL, 3),
(308, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:41:56', '2021-04-19 08:21:24', NULL, 2),
(309, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02-Fresh Cut Grass', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:42:57', '2021-04-27 02:52:51', NULL, 3),
(310, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:43:14', '2021-04-24 15:35:36', NULL, 2),
(311, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:43:36', '2021-04-24 10:19:01', NULL, 2),
(312, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:43:56', '2021-04-24 19:50:16', NULL, 2),
(313, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:44:26', '2021-04-24 20:42:22', NULL, 2),
(314, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:44:49', '2021-04-24 22:38:04', NULL, 2),
(315, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:45:06', '2021-04-20 17:58:50', NULL, 2),
(316, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:45:47', '2021-04-15 05:50:55', NULL, 1),
(317, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:46:06', '2021-04-24 19:59:25', NULL, 2),
(318, 'Ashley in-house-soy wax melts presented in two-piece container and lid innovative shinning recyclable plastic pods', NULL, NULL, 'published', '[]', 'AH-4-02', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.94, NULL, NULL, NULL, 0.00, 0.00, 0.00, 35.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 09:53:08', '2021-04-25 04:05:46', NULL, 3),
(319, 'Ashley In-House-Soy Wax Melts presented in Small size clipped Lid top clear glass Jar', '<p>Ashley In-House-Soy Wax Melts: Aromatherapy, Handpoured scented soy wax melts in 18g size decorated with dried flowers shrubs &amp; petals and presented in large and small clear glass bottles.</p>\r\n\r\n<p><strong>Package:&nbsp;</strong> 7 pieces of oval shaped melts in clear glass jar with glass clipped Lid&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n\r\n<p><strong>Burn Time:&nbsp;</strong>&nbsp;&nbsp;&nbsp; &nbsp; 3-4 Hours.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"color:#33cccc;\"><strong>Enjoy Selecting one of our beautiful fragrances (See fragrance descriptions&#39; below).</strong></span></p>\r\n\r\n<p>&nbsp;</p>', '<p>Let your space breathe out freshness! This highly scented soy wax melts offer delicately clean and uplifting fragrance that delights your space.</p>\r\n\r\n<p>This pure and safe vegetable based natural soy wax melts are entirely free from toxins, paraffin, and harmful residues. It burns clean and releases long lasting aroma from the unique combination of fragrance oil.</p>\r\n\r\n<p>Natural Soy wax blend melts have Therapeutic Aroma that calms the nerves and relieves anxiety, making them the best stress-relieving wax melts. It can be used also for insomnia, meditation, aromatherapy, removing odours, etc.</p>\r\n\r\n<p>Buy this organic wax melts along with our range of wax burners and warmers to purify the air in your home. Our melts come in sizes of &asymp;18g and above and are presented in Large clear glass Bamboo topped jar and Small clear glass clipped top jar containing 7pieces of wax melts.&nbsp;</p>\r\n\r\n<p>The wax melts also come in a two piece; container and lid innovative form of tart/melt in a shinning recyclable plastic pods packaging, containing about 1 oz of wax that make them stand out.</p>\r\n\r\n<p>Our wax melts are also available in luxury clear glass bowl with glass lid and can be elegantly packaged as perfect gifts as may be desired by you! This will make a wonderful gift for all occasions for friends, loved one, birthday, housewarming, thank you, Mothers &amp; Father&rsquo;s Days gifts and an even better a treat for yourself.</p>\r\n\r\n<p>This hand poured soy wax melts are in unique shapes and sizes with natural soy wax and elegant fragrance oil combination. They are 100% natural and pure, non-toxic, vegan friendly products, with a burn time of 3-4 hours per melts.</p>\r\n\r\n<p>The wax melts are presented in varieties of fragrance notes to choose from and a cumulative of 47 fragrance types, all with unique and beautiful combination of decorated dried flowers and petals, bringing aromatherapy benefits and wellness to your space.</p>', 'published', '[\"products\\/wax-melts\\/6-1.jpg\",\"products\\/wax-melts\\/5-2.jpg\",\"products\\/wax-melts\\/4-2.jpg\",\"products\\/wax-melts\\/3-2.jpg\",\"products\\/wax-melts\\/2-2.jpg\",\"products\\/wax-melts\\/1-2.jpg\"]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 14:22:40', '2021-05-02 10:18:09', 1, 27),
(320, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[\"products\\/wax-melts\\/6-1.jpg\",\"products\\/wax-melts\\/5-2.jpg\",\"products\\/wax-melts\\/4-2.jpg\",\"products\\/wax-melts\\/3-2.jpg\",\"products\\/wax-melts\\/2-2.jpg\",\"products\\/wax-melts\\/1-2.jpg\"]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 14:22:41', '2021-04-27 03:26:32', NULL, 6),
(321, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 14:24:54', '2021-04-25 19:36:51', NULL, 2),
(322, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 14:25:06', '2021-04-26 01:50:58', NULL, 2),
(323, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 14:25:18', '2021-04-25 23:23:31', NULL, 3),
(324, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 14:25:32', '2021-04-29 02:14:43', NULL, 4),
(325, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 14:25:41', '2021-04-25 16:32:27', NULL, 3),
(326, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 14:25:52', '2021-04-15 00:46:41', NULL, 1);
INSERT INTO `ec_products` (`id`, `name`, `description`, `content`, `status`, `images`, `sku`, `order`, `quantity`, `allow_checkout_when_out_of_stock`, `with_storehouse_management`, `is_featured`, `options`, `category_id`, `is_variation`, `is_searchable`, `is_show_on_list`, `sale_type`, `price`, `sale_price`, `start_date`, `end_date`, `length`, `wide`, `height`, `weight`, `barcode`, `length_unit`, `wide_unit`, `height_unit`, `weight_unit`, `brand_id`, `created_at`, `updated_at`, `tax_id`, `views`) VALUES
(327, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 14:26:08', '2021-04-26 02:40:13', NULL, 2),
(328, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 14:26:46', '2021-04-26 06:34:52', NULL, 3),
(329, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 14:27:05', '2021-04-29 09:21:43', NULL, 3),
(330, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 14:27:30', '2021-04-26 03:25:29', NULL, 3),
(331, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 14:27:58', '2021-04-20 09:06:09', NULL, 2),
(332, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 14:28:14', '2021-04-14 17:51:33', NULL, 1),
(333, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 14:30:05', '2021-04-28 21:03:11', NULL, 2),
(334, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 14:31:45', '2021-04-26 08:30:17', NULL, 3),
(335, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 14:32:50', '2021-04-26 00:19:27', NULL, 2),
(336, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 14:33:37', '2021-04-25 20:26:37', NULL, 3),
(337, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 14:34:44', '2021-04-15 05:23:53', NULL, 1),
(338, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 14:35:29', '2021-04-30 21:02:30', NULL, 3),
(339, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 14:36:07', '2021-04-25 17:08:33', NULL, 3),
(340, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:05:40', '2021-04-30 00:00:06', NULL, 2),
(341, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:06:31', '2021-04-14 21:49:13', NULL, 2),
(342, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:06:52', '2021-05-01 08:33:37', NULL, 2),
(343, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:07:29', '2021-04-17 08:51:27', NULL, 2),
(344, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:07:43', '2021-04-14 21:21:40', NULL, 2),
(345, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:08:18', '2021-04-26 01:55:46', NULL, 2),
(346, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:08:41', '2021-04-25 18:32:47', NULL, 2),
(347, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:08:54', '2021-04-25 22:19:29', NULL, 2),
(348, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:09:25', '2021-04-25 18:44:24', NULL, 3),
(349, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:09:46', '2021-04-22 20:09:41', NULL, 2),
(350, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:10:26', '2021-04-25 17:16:58', NULL, 3),
(351, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:10:36', '2021-04-14 19:34:17', NULL, 1),
(352, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:11:26', '2021-04-25 18:54:41', NULL, 3),
(353, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:11:55', '2021-04-14 18:04:12', NULL, 2),
(354, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:12:06', '2021-04-21 00:29:58', NULL, 2),
(355, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:13:21', '2021-04-20 19:08:07', NULL, 2),
(356, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:13:52', '2021-04-25 21:05:42', NULL, 3),
(357, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:14:50', '2021-04-29 02:44:42', NULL, 3),
(358, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:15:07', '2021-04-26 06:08:52', NULL, 2),
(359, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:15:22', '2021-04-26 23:22:10', NULL, 3),
(360, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:15:53', '2021-04-14 18:23:59', NULL, 2),
(361, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:16:17', '2021-04-28 19:13:23', NULL, 3),
(362, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:16:40', '2021-04-26 07:39:48', NULL, 2),
(363, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:17:04', '2021-04-26 00:39:36', NULL, 2),
(364, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:17:17', '2021-04-26 07:24:38', NULL, 3),
(365, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:17:37', '2021-04-15 04:41:31', NULL, 1),
(366, 'Ashley In-House-Soy Wax Melts presented in Large Clear Glass with Bamboo Lid Jars', NULL, NULL, 'published', '[]', 'AH-4-03', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 11.61, NULL, NULL, NULL, 0.00, 0.00, 0.00, 18.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:20:41', '2021-04-26 06:10:49', NULL, 3),
(367, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[\"products\\/wax-melts\\/4-4.png\",\"products\\/wax-melts\\/1-3.jpg\",\"products\\/wax-melts\\/2-3.jpg\",\"products\\/wax-melts\\/3-4.png\",\"products\\/wax-melts\\/5-3.jpg\",\"products\\/wax-melts\\/4-3.jpg\",\"products\\/wax-melts\\/3-3.jpg\"]', 'AH-1-211', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:34:38', '2021-04-27 14:00:55', NULL, 3),
(368, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:36:34', '2021-04-27 21:44:04', NULL, 2),
(369, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:36:48', '2021-04-28 05:30:04', NULL, 2),
(370, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:36:58', '2021-04-27 21:28:46', NULL, 2),
(371, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:37:11', '2021-04-28 05:32:33', NULL, 2),
(372, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:37:25', '2021-04-27 23:42:49', NULL, 3),
(373, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:37:39', '2021-04-27 18:02:30', NULL, 2),
(374, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:38:02', '2021-04-28 17:55:04', NULL, 3),
(375, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:38:16', '2021-04-14 21:58:43', NULL, 1),
(376, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:38:29', '2021-04-27 17:28:50', NULL, 3),
(377, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:38:44', '2021-04-28 02:37:53', NULL, 3),
(378, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:39:01', '2021-04-29 10:11:44', NULL, 3),
(379, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:39:21', '2021-04-27 17:31:40', NULL, 2),
(380, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:39:32', '2021-04-27 08:59:09', NULL, 2),
(381, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:39:42', '2021-04-28 03:50:52', NULL, 2),
(382, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:40:03', '2021-04-27 22:25:07', NULL, 2),
(383, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:40:17', '2021-04-28 03:27:55', NULL, 2),
(384, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:40:29', '2021-04-28 04:50:22', NULL, 3),
(385, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:40:42', '2021-04-14 21:01:18', NULL, 2),
(386, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:40:55', '2021-04-27 20:19:46', NULL, 3),
(387, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:41:19', '2021-04-27 21:27:25', NULL, 2),
(388, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:41:30', '2021-04-14 18:01:03', NULL, 1),
(389, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:41:42', '2021-04-28 00:48:55', NULL, 2),
(390, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:41:54', '2021-04-14 17:46:09', NULL, 1),
(391, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:42:25', '2021-04-15 06:39:40', NULL, 1),
(392, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:42:37', '2021-04-27 16:36:04', NULL, 3),
(393, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:42:49', '2021-04-14 19:36:37', NULL, 2),
(394, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:43:01', '2021-04-28 01:58:36', NULL, 2),
(395, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:43:14', '2021-04-27 21:48:50', NULL, 1),
(396, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:43:28', '2021-04-15 01:12:14', NULL, 1),
(397, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:43:51', '2021-04-27 21:27:16', NULL, 2),
(398, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:44:04', '2021-04-28 00:35:10', NULL, 3),
(399, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:44:17', '2021-04-30 17:15:20', NULL, 2),
(400, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:44:49', '2021-04-14 17:07:26', NULL, 2),
(401, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:45:12', '2021-04-14 21:03:39', NULL, 1),
(402, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:45:33', '2021-04-27 16:50:15', NULL, 2),
(403, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:45:49', '2021-04-29 02:25:39', NULL, 2),
(404, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:46:11', '2021-04-27 21:35:01', NULL, 3),
(405, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:46:24', '2021-04-28 03:23:12', NULL, 2),
(406, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:46:44', '2021-04-15 04:11:04', NULL, 2),
(407, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:47:04', '2021-04-14 21:59:42', NULL, 2),
(408, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:47:16', '2021-04-14 22:27:48', NULL, 1),
(409, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:47:37', '2021-04-29 13:47:11', NULL, 2),
(410, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:47:48', '2021-04-15 05:34:53', NULL, 1),
(411, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:47:58', '2021-04-27 17:21:16', NULL, 2),
(412, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:48:24', '2021-04-15 05:41:49', NULL, 5),
(413, 'Ashley Handmade Aromatherapy Scented Wax Melts', NULL, NULL, 'published', '[]', 'AH-4-04', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 29.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 54.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 15:48:35', '2021-04-27 23:53:00', NULL, 2),
(414, 'Ashley in-House Handpoured Aromatherapy Candles - Orange flavour', NULL, NULL, 'published', '[\"products\\/candles\\/candle8.jpg\",\"products\\/candles\\/37.jpg\"]', 'AH-1-304-red', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, NULL, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:14:48', '2021-04-28 05:14:42', NULL, 3),
(415, 'Ashley in-House Handpoured Aromatherapy Candles - Orange flavour', NULL, NULL, 'published', '[\"products\\/candles\\/candle8.jpg\"]', 'AH-1-304', 0, 0, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 5.00, 20.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:15:55', '2021-03-12 23:51:01', NULL, 0),
(416, 'Ashley in-House Handpoured Aromatherapy Candles - Orange flavour', NULL, NULL, 'published', '[]', 'AH-1-304', 0, 0, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 20.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:16:46', '2021-03-12 23:56:30', NULL, 0),
(417, 'Ashley in-House Handpoured Aromatherapy Candles - Orange flavour', NULL, NULL, 'published', '[\"products\\/candles\\/candle8.jpg\"]', 'AH-1-304', 0, 0, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 20.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:20:08', '2021-03-12 23:52:41', NULL, 0),
(418, 'Ashley in-House Handpoured Aromatherapy Candles - Orange flavour', NULL, NULL, 'published', '[]', 'AH-1-304', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 20.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:20:18', '2021-03-07 02:43:39', NULL, 0),
(419, 'Ashley in-House Handpoured Aromatherapy Candles - Orange flavour', NULL, NULL, 'published', '[]', 'AH-1-304', 0, 50, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 20.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:20:41', '2021-03-12 23:49:19', NULL, 0),
(420, 'Ashley in-House Handpoured Aromatherapy Candles - Orange flavour', NULL, NULL, 'published', '[]', 'AH-1-304', 0, 0, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 20.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:20:58', '2021-03-12 23:55:47', NULL, 0),
(421, 'Ashley in-House Handpoured Aromatherapy Candles - Orange flavour', NULL, NULL, 'published', '[\"products\\/candles\\/candle8.jpg\"]', 'AH-1-304', 0, 0, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 20.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:21:30', '2021-03-13 00:20:23', NULL, 0),
(422, 'Ashley in-House Handpoured Aromatherapy Candles - Orange flavour', NULL, NULL, 'published', '[\"products\\/candles\\/candle8.jpg\"]', 'AH-1-304', 0, 0, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 20.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:21:44', '2021-03-13 00:26:46', NULL, 0),
(423, 'Ashley in-House Handpoured Aromatherapy Candles - Orange flavour', NULL, NULL, 'published', '[]', 'AH-1-304', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 20.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:21:58', '2021-03-07 02:54:06', NULL, 0),
(424, 'Ashley in-House Handpoured Aromatherapy Candles - Orange flavour', NULL, NULL, 'published', '[]', 'AH-1-304', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 20.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:22:14', '2021-03-07 02:51:01', NULL, 0),
(425, 'Ashley in-House Handpoured Aromatherapy Candles - Orange flavour', NULL, NULL, 'published', '[]', 'AH-1-304', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 20.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:22:29', '2021-03-07 02:51:30', NULL, 0),
(426, 'Ashley in-House Handpoured Aromatherapy Candles - Orange flavour', NULL, NULL, 'published', '[]', 'AH-1-304', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 20.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:22:43', '2021-03-07 02:51:55', NULL, 0),
(427, 'Ashley in-House Handpoured Aromatherapy Candles - Orange flavour', NULL, NULL, 'published', '[]', 'AH-1-304', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 20.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:23:13', '2021-03-07 02:55:36', NULL, 0),
(428, 'Ashley in-House Handpoured Aromatherapy Candles - Orange flavour', NULL, NULL, 'published', '[]', 'AH-1-304', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 20.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:23:32', '2021-03-12 23:33:00', NULL, 0),
(429, 'Ashley in-House Handpoured Aromatherapy Candles - Orange flavour', NULL, NULL, 'published', '[]', 'AH-1-304', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 20.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:23:54', '2021-03-07 02:56:58', NULL, 0),
(430, 'Ashley in-House Handpoured Aromatherapy Candles - Orange flavour', NULL, NULL, 'published', '[]', 'AH-1-304', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 20.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:24:08', '2021-03-07 02:57:45', NULL, 0),
(431, 'Ashley in-House Handpoured Aromatherapy Candles - Orange flavour', NULL, NULL, 'published', '[]', 'AH-1-304', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 20.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:24:21', '2021-03-07 03:00:10', NULL, 0),
(432, 'Ashley in-House Handpoured Aromatherapy Candles - Orange flavour', NULL, NULL, 'published', '[]', 'AH-1-304', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 20.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:24:35', '2021-03-07 03:00:56', NULL, 0),
(433, 'Ashley in-House Handpoured Aromatherapy Candles - Orange flavour', NULL, NULL, 'published', '[]', 'AH-1-304', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 20.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:25:01', '2021-03-07 02:59:13', NULL, 0),
(434, 'Ashley in-House Handpoured Aromatherapy Candles - Orange flavour', NULL, NULL, 'published', '[]', 'AH-1-304', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 20.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:25:22', '2021-03-07 02:58:21', NULL, 0),
(435, 'Ashley in-House Handpoured Aromatherapy Candles - Orange flavour', NULL, NULL, 'published', '[]', 'AH-1-304', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 20.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:25:49', '2021-03-07 02:50:14', NULL, 0),
(436, 'Ashley in-House Handpoured Aromatherapy Candles - Orange flavour', NULL, NULL, 'published', '[]', 'AH-1-304', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 20.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:26:12', '2021-03-07 02:49:28', NULL, 0),
(438, 'Ashley in-House Handpoured Aromatherapy Candles - Orange and Green flavor', NULL, NULL, 'published', '[]', 'AH-1-301-red', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:40:57', '2021-04-19 03:47:35', NULL, 2),
(439, 'Ashley in-House Handpoured Aromatherapy Candles - Orange and Green flavor', NULL, NULL, 'published', '[]', 'AH-1-301', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:42:03', '2021-04-27 17:18:25', NULL, 2),
(440, 'Ashley in-House Handpoured Aromatherapy Candles - Orange and Green flavor', NULL, NULL, 'published', '[]', 'AH-1-301', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:42:17', '2021-04-14 21:46:50', NULL, 1),
(441, 'Ashley in-House Handpoured Aromatherapy Candles - Orange and Green flavor', NULL, NULL, 'published', '[]', 'AH-1-301', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:46:50', '2021-04-27 15:12:32', NULL, 3),
(442, 'Ashley in-House Handpoured Aromatherapy Candles - Orange and Green flavor', NULL, NULL, 'published', '[]', 'AH-1-301', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:47:35', '2021-04-25 16:54:57', NULL, 3),
(443, 'Ashley in-House Handpoured Aromatherapy Candles - Orange and Green flavor', NULL, NULL, 'published', '[]', 'AH-1-301', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:48:54', '2021-04-26 08:06:16', NULL, 2),
(444, 'Ashley in-House Handpoured Aromatherapy Candles - Orange and Green flavor', NULL, NULL, 'published', '[]', 'AH-1-301', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:52:37', '2021-04-28 04:13:14', NULL, 3),
(445, 'Ashley in-House Handpoured Aromatherapy Candles - Orange and Green flavor', NULL, NULL, 'published', '[]', 'AH-1-301', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:52:49', '2021-04-25 22:35:46', NULL, 2),
(446, 'Ashley in-House Handpoured Aromatherapy Candles - Orange and Green flavor', NULL, NULL, 'published', '[]', 'AH-1-301', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:53:41', '2021-04-15 02:22:50', NULL, 2),
(447, 'Ashley in-House Handpoured Aromatherapy Candles - Orange and Green flavor', NULL, NULL, 'published', '[]', 'AH-1-301', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:54:17', '2021-04-25 19:15:32', NULL, 2),
(448, 'Ashley in-House Handpoured Aromatherapy Candles - Orange and Green flavor', NULL, NULL, 'published', '[]', 'AH-1-301', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:55:30', '2021-04-14 21:17:19', NULL, 1),
(449, 'Ashley in-House Handpoured Aromatherapy Candles - Orange and Green flavor', NULL, NULL, 'published', '[]', 'AH-1-301', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:55:43', '2021-04-26 07:04:38', NULL, 2),
(450, 'Ashley in-House Handpoured Aromatherapy Candles - Orange and Green flavor', NULL, NULL, 'published', '[]', 'AH-1-301', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:56:07', '2021-04-15 03:14:51', NULL, 1),
(451, 'Ashley in-House Handpoured Aromatherapy Candles - Orange and Green flavor', NULL, NULL, 'published', '[]', 'AH-1-301', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:56:32', '2021-04-28 01:46:11', NULL, 2),
(452, 'Ashley in-House Handpoured Aromatherapy Candles - Orange and Green flavor', NULL, NULL, 'published', '[]', 'AH-1-301', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:56:51', '2021-04-25 19:59:42', NULL, 2),
(453, 'Ashley in-House Handpoured Aromatherapy Candles - Orange and Green flavor', NULL, NULL, 'published', '[]', 'AH-1-301', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:57:06', '2021-04-27 17:28:54', NULL, 3),
(454, 'Ashley in-House Handpoured Aromatherapy Candles - Orange and Green flavor', NULL, NULL, 'published', '[]', 'AH-1-301-Oriental Rose', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:57:46', '2021-04-27 19:53:27', NULL, 3),
(455, 'Ashley in-House Handpoured Aromatherapy Candles - Orange and Green flavor', NULL, NULL, 'published', '[]', 'AH-1-301', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:58:25', '2021-04-26 01:33:53', NULL, 2),
(456, 'Ashley in-House Handpoured Aromatherapy Candles - Orange and Green flavor', NULL, NULL, 'published', '[]', 'AH-1-301', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:58:35', '2021-04-27 23:39:50', NULL, 2),
(457, 'Ashley in-House Handpoured Aromatherapy Candles - Orange and Green flavor', NULL, NULL, 'published', '[]', 'AH-1-301', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:59:04', '2021-04-14 16:39:37', NULL, 1),
(458, 'Ashley in-House Handpoured Aromatherapy Candles - Orange and Green flavor', NULL, NULL, 'published', '[]', 'AH-1-301', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 16:59:17', '2021-04-15 03:11:35', NULL, 1),
(459, 'Ashley in-House Handpoured Aromatherapy Candles - Orange and Green flavor', NULL, NULL, 'published', '[]', 'AH-1-301', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:01:25', '2021-04-25 21:32:57', NULL, 2),
(460, 'Ashley in-House Handpoured Aromatherapy Candles - Orange and Green flavor', NULL, NULL, 'published', '[]', 'AH-1-301', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:01:36', '2021-04-27 03:30:30', NULL, 3),
(461, 'Ashley in-House Handpoured Aromatherapy Candles - Orange and Green flavor', NULL, NULL, 'published', '[]', 'AH-1-301', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:02:07', '2021-04-28 08:31:23', NULL, 3),
(462, 'Ashley in-House Handpoured Aromatherapy Candles- purple and pink flavor', NULL, NULL, 'published', '[\"products\\/candles\\/13.jpg\",\"products\\/candles\\/66i.jpg\",\"products\\/candles\\/picture1.jpg\",\"products\\/candles\\/611.jpg\",\"products\\/candles\\/61.jpg\",\"products\\/candles\\/12.png\",\"products\\/candles\\/5.jpg\",\"products\\/candles\\/4.jpg\",\"products\\/candles\\/3.jpg\",\"products\\/candles\\/10.jpg\",\"products\\/candles\\/9.jpg\",\"products\\/candles\\/8.jpg\",\"products\\/candles\\/7.jpg\",\"products\\/candles\\/2.jpg\",\"products\\/candles\\/1.jpg\"]', 'AH-1-303', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 0.00, 9.50, 6.50, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:03:45', '2021-04-13 22:04:03', NULL, 8),
(463, 'Ashley in-House Handpoured Aromatherapy Candles- purple and pink flavor', NULL, NULL, 'published', '[]', 'AH-1-303', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 0.00, 9.50, 6.50, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:04:52', '2021-03-05 23:58:18', NULL, 0),
(464, 'Ashley in-House Handpoured Aromatherapy Candles- purple and pink flavor', NULL, NULL, 'published', '[]', 'AH-1-303', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 0.00, 9.50, 6.50, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:05:35', '2021-03-05 23:58:39', NULL, 0),
(465, 'Ashley in-House Handpoured Aromatherapy Candles- purple and pink flavor', NULL, NULL, 'published', '[]', 'AH-1-303', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, NULL, 9.50, 6.50, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:05:45', '2021-03-05 23:59:34', NULL, 0),
(466, 'Ashley in-House Handpoured Aromatherapy Candles- purple and pink flavor', NULL, NULL, 'published', '[]', 'AH-1-303', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 0.00, 9.50, 6.50, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:05:55', '2021-03-06 00:01:20', NULL, 0),
(467, 'Ashley in-House Handpoured Aromatherapy Candles- purple and pink flavor', NULL, NULL, 'published', '[]', 'AH-1-303', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 0.00, 9.50, 6.50, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:06:08', '2021-03-06 00:01:41', NULL, 0),
(468, 'Ashley in-House Handpoured Aromatherapy Candles- purple and pink flavor', NULL, NULL, 'published', '[]', 'AH-1-303', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 0.00, 9.50, 6.50, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:06:27', '2021-03-06 00:02:02', NULL, 0),
(469, 'Ashley in-House Handpoured Aromatherapy Candles- purple and pink flavor', NULL, NULL, 'published', '[]', 'AH-1-303', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 0.00, 9.50, 6.50, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:06:42', '2021-03-06 00:02:26', NULL, 0),
(470, 'Ashley in-House Handpoured Aromatherapy Candles- purple and pink flavor', NULL, NULL, 'published', '[]', 'AH-1-303', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 0.00, 9.50, 6.50, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:06:59', '2021-03-06 00:04:01', NULL, 0),
(471, 'Ashley in-House Handpoured Aromatherapy Candles- purple and pink flavor', NULL, NULL, 'published', '[]', 'AH-1-303', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 0.00, 9.50, 6.50, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:07:14', '2021-03-06 00:04:21', NULL, 0),
(472, 'Ashley in-House Handpoured Aromatherapy Candles- purple and pink flavor', NULL, NULL, 'published', '[]', 'AH-1-303', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 0.00, 9.50, 6.50, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:07:23', '2021-03-06 03:37:19', NULL, 0),
(473, 'Ashley in-House Handpoured Aromatherapy Candles- purple and pink flavor', NULL, NULL, 'published', '[]', 'AH-1-303', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 0.00, 9.50, 6.50, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:07:33', '2021-03-06 03:37:45', NULL, 0),
(474, 'Ashley in-House Handpoured Aromatherapy Candles- purple and pink flavor', NULL, NULL, 'published', '[]', 'AH-1-303', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 0.00, 9.50, 6.50, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:07:43', '2021-03-06 03:38:50', NULL, 0),
(475, 'Ashley in-House Handpoured Aromatherapy Candles- purple and pink flavor', NULL, NULL, 'published', '[]', 'AH-1-303', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 0.00, 9.50, 6.50, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:07:53', '2021-03-06 03:39:16', NULL, 0),
(476, 'Ashley in-House Handpoured Aromatherapy Candles- purple and pink flavor', NULL, NULL, 'published', '[]', 'AH-1-303', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 0.00, 9.50, 6.50, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:08:04', '2021-03-06 03:39:41', NULL, 0),
(477, 'Ashley in-House Handpoured Aromatherapy Candles- purple and pink flavor', NULL, NULL, 'published', '[]', 'AH-1-303', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 0.00, 5.90, 6.50, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:08:13', '2021-03-06 03:20:21', NULL, 0),
(478, 'Ashley in-House Handpoured Aromatherapy Candles- purple and pink flavor', NULL, NULL, 'published', '[]', 'AH-1-303', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 0.00, 5.90, 6.50, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:08:24', '2021-03-06 03:20:01', NULL, 0),
(479, 'Ashley in-House Handpoured Aromatherapy Candles- purple and pink flavor', NULL, NULL, 'published', '[]', 'AH-1-303', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 0.00, 5.90, 6.50, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:08:35', '2021-03-06 03:19:37', NULL, 0),
(480, 'Ashley in-House Handpoured Aromatherapy Candles- purple and pink flavor', NULL, NULL, 'published', '[]', 'AH-1-303', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 0.00, 5.90, 6.50, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:08:57', '2021-03-06 03:19:09', NULL, 0),
(481, 'Ashley in-House Handpoured Aromatherapy Candles- purple and pink flavor', NULL, NULL, 'published', '[]', 'AH-1-303', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 0.00, 5.90, 6.50, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:09:11', '2021-03-06 03:18:51', NULL, 0),
(482, 'Ashley in-House Handpoured Aromatherapy Candles- purple and pink flavor', NULL, NULL, 'published', '[]', 'AH-1-303', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 0.00, 5.90, 6.50, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:09:36', '2021-03-06 03:18:28', NULL, 0),
(484, 'Ashley in-House Handpoured Aromatherapy Candles - Brown-Flavor', NULL, NULL, 'published', '[\"products\\/candles\\/29.jpg\",\"products\\/candles\\/candle1.jpg\",\"products\\/candles\\/35.jpg\",\"products\\/candles\\/36.jpg\",\"products\\/candles\\/34.jpg\",\"products\\/candles\\/33.jpg\",\"products\\/candles\\/28.jpg\",\"products\\/candles\\/21.jpg\",\"products\\/candles\\/31.jpg\",\"products\\/candles\\/38.jpg\",\"products\\/candles\\/30.jpg\",\"products\\/candles\\/27.jpg\",\"products\\/candles\\/26.png\",\"products\\/candles\\/22.jpg\",\"products\\/candles\\/25.jpg\",\"products\\/candles\\/24.jpg\",\"products\\/candles\\/20.jpg\"]', 'AH-1-302-red', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:13:29', '2021-04-16 17:52:38', NULL, 2),
(485, 'Ashley in-House Handpoured Aromatherapy Candles - Brown-Flavor', NULL, NULL, 'published', '[\"products\\/candles\\/29.jpg\"]', 'AH-1-302', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:21:27', '2021-03-13 00:45:08', NULL, 0),
(486, 'Ashley in-House Handpoured Aromatherapy Candles - Brown-Flavor', NULL, NULL, 'published', '[\"products\\/candles\\/29.jpg\"]', 'AH-1-302', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:21:38', '2021-03-13 00:45:24', NULL, 0),
(487, 'Ashley in-House Handpoured Aromatherapy Candles - Brown-Flavor', NULL, NULL, 'published', '[\"products\\/candles\\/29.jpg\"]', 'AH-1-302', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:21:46', '2021-03-13 00:45:38', NULL, 0),
(488, 'Ashley in-House Handpoured Aromatherapy Candles - Brown-Flavor', NULL, NULL, 'published', '[]', 'AH-1-302', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:21:57', '2021-03-07 01:22:41', NULL, 0),
(489, 'Ashley in-House Handpoured Aromatherapy Candles - Brown-Flavor', NULL, NULL, 'published', '[]', 'AH-1-302', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:22:08', '2021-03-07 01:59:54', NULL, 0),
(490, 'Ashley in-House Handpoured Aromatherapy Candles - Brown-Flavor', NULL, NULL, 'published', '[]', 'AH-1-302', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:22:23', '2021-03-07 02:00:17', NULL, 0);
INSERT INTO `ec_products` (`id`, `name`, `description`, `content`, `status`, `images`, `sku`, `order`, `quantity`, `allow_checkout_when_out_of_stock`, `with_storehouse_management`, `is_featured`, `options`, `category_id`, `is_variation`, `is_searchable`, `is_show_on_list`, `sale_type`, `price`, `sale_price`, `start_date`, `end_date`, `length`, `wide`, `height`, `weight`, `barcode`, `length_unit`, `wide_unit`, `height_unit`, `weight_unit`, `brand_id`, `created_at`, `updated_at`, `tax_id`, `views`) VALUES
(491, 'Ashley in-House Handpoured Aromatherapy Candles - Brown-Flavor', NULL, NULL, 'published', '[]', 'AH-1-302', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:22:36', '2021-03-07 02:00:52', NULL, 0),
(492, 'Ashley in-House Handpoured Aromatherapy Candles - Brown-Flavor', NULL, NULL, 'published', '[]', 'AH-1-302', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:22:48', '2021-03-07 02:01:25', NULL, 0),
(493, 'Ashley in-House Handpoured Aromatherapy Candles - Brown-Flavor', NULL, NULL, 'published', '[]', 'AH-1-302', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:23:05', '2021-03-07 02:01:47', NULL, 0),
(494, 'Ashley in-House Handpoured Aromatherapy Candles - Brown-Flavor', NULL, NULL, 'published', '[]', 'AH-1-302', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:23:20', '2021-03-07 02:02:25', NULL, 0),
(495, 'Ashley in-House Handpoured Aromatherapy Candles - Brown-Flavor', NULL, NULL, 'published', '[]', 'AH-1-302', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:23:32', '2021-03-07 02:02:56', NULL, 0),
(496, 'Ashley in-House Handpoured Aromatherapy Candles - Brown-Flavor', NULL, NULL, 'published', '[]', 'AH-1-302', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:23:45', '2021-03-07 02:03:46', NULL, 0),
(497, 'Ashley in-House Handpoured Aromatherapy Candles - Brown-Flavor', NULL, NULL, 'published', '[]', 'AH-1-302', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:23:56', '2021-03-07 02:04:10', NULL, 0),
(498, 'Ashley in-House Handpoured Aromatherapy Candles - Brown-Flavor', NULL, NULL, 'published', '[]', 'AH-1-302', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:24:16', '2021-03-07 02:04:45', NULL, 0),
(499, 'Ashley in-House Handpoured Aromatherapy Candles - Brown-Flavor', NULL, NULL, 'published', '[]', 'AH-1-302', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:24:28', '2021-03-07 02:05:06', NULL, 0),
(500, 'Ashley in-House Handpoured Aromatherapy Candles - Brown-Flavor', NULL, NULL, 'published', '[]', 'AH-1-302', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:24:40', '2021-03-07 02:05:29', NULL, 0),
(501, 'Ashley in-House Handpoured Aromatherapy Candles - Brown-Flavor', NULL, NULL, 'published', '[]', 'AH-1-302', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:24:51', '2021-03-07 02:05:54', NULL, 0),
(502, 'Ashley in-House Handpoured Aromatherapy Candles - Brown-Flavor', NULL, NULL, 'published', '[]', 'AH-1-302', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:25:09', '2021-03-07 02:06:23', NULL, 0),
(503, 'Ashley in-House Handpoured Aromatherapy Candles - Brown-Flavor', NULL, NULL, 'published', '[]', 'AH-1-302', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:25:19', '2021-03-07 02:07:02', NULL, 0),
(504, 'Ashley in-House Handpoured Aromatherapy Candles - Brown-Flavor', NULL, NULL, 'published', '[]', 'AH-1-302', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:25:30', '2021-03-07 02:07:32', NULL, 0),
(505, 'Ashley in-House Handpoured Aromatherapy Candles - Brown-Flavor', NULL, NULL, 'published', '[]', 'AH-1-302', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:25:41', '2021-03-07 02:07:57', NULL, 0),
(506, 'Ashley in-House Handpoured Aromatherapy Candles - Brown-Flavor', NULL, NULL, 'published', '[]', 'AH-1-302', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:26:02', '2021-03-07 02:08:30', NULL, 0),
(507, 'Ashley in-House Handpoured Aromatherapy Candles - Brown-Flavor', NULL, NULL, 'published', '[]', 'AH-1-302', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:26:15', '2021-03-07 02:08:58', NULL, 0),
(508, 'Ashley in-House Handpoured Aromatherapy Candles - Blue flavor', NULL, NULL, 'published', '[]', 'AH-1-305-red', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:28:08', '2021-04-14 20:39:41', NULL, 2),
(509, 'Ashley in-House Handpoured Aromatherapy Candles - Blue flavor', NULL, NULL, 'published', '[]', 'AH-1-305', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:28:31', '2021-04-28 01:24:23', NULL, 3),
(510, 'Ashley in-House Handpoured Aromatherapy Candles - Blue flavor', NULL, NULL, 'published', '[]', 'AH-1-305', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:28:41', '2021-04-27 16:01:06', NULL, 3),
(511, 'Ashley in-House Handpoured Aromatherapy Candles - Blue flavor', NULL, NULL, 'published', '[]', 'AH-1-305', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:28:52', '2021-04-28 04:58:09', NULL, 3),
(512, 'Ashley in-House Handpoured Aromatherapy Candles - Blue flavor', NULL, NULL, 'published', '[]', 'AH-1-305', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:29:02', '2021-04-25 02:09:07', NULL, 2),
(513, 'Ashley in-House Handpoured Aromatherapy Candles - Blue flavor', NULL, NULL, 'published', '[]', 'AH-1-305', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:29:10', '2021-04-28 01:59:13', NULL, 2),
(514, 'Ashley in-House Handpoured Aromatherapy Candles - Blue flavor', NULL, NULL, 'published', '[]', 'AH-1-305', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:29:21', '2021-04-28 06:07:30', NULL, 1),
(515, 'Ashley in-House Handpoured Aromatherapy Candles - Blue flavor', NULL, NULL, 'published', '[]', 'AH-1-305', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:29:31', '2021-04-27 22:55:17', NULL, 3),
(516, 'Ashley in-House Handpoured Aromatherapy Candles - Blue flavor', NULL, NULL, 'published', '[]', 'AH-1-305', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:30:00', '2021-04-21 02:47:15', NULL, 3),
(517, 'Ashley in-House Handpoured Aromatherapy Candles - Blue flavor', NULL, NULL, 'published', '[]', 'AH-1-305', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:30:26', '2021-04-18 19:55:49', NULL, 2),
(518, 'Ashley in-House Handpoured Aromatherapy Candles - Blue flavor', NULL, NULL, 'published', '[]', 'AH-1-305', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:30:58', '2021-04-15 02:03:26', NULL, 1),
(519, 'Ashley in-House Handpoured Aromatherapy Candles - Blue flavor', NULL, NULL, 'published', '[]', 'AH-1-305', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:32:57', '2021-04-28 02:26:56', NULL, 3),
(520, 'Ashley in-House Handpoured Aromatherapy Candles - Blue flavor', NULL, NULL, 'published', '[]', 'AH-1-305', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:33:08', '2021-04-27 18:36:56', NULL, 2),
(521, 'Ashley in-House Handpoured Aromatherapy Candles - Blue flavor', NULL, NULL, 'published', '[]', 'AH-1-305', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:33:17', '2021-04-14 18:26:06', NULL, 1),
(522, 'Ashley in-House Handpoured Aromatherapy Candles - Blue flavor', NULL, NULL, 'published', '[]', 'AH-1-305', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:33:27', '2021-04-14 18:19:53', NULL, 2),
(523, 'Ashley in-House Handpoured Aromatherapy Candles - Blue flavor', NULL, NULL, 'published', '[]', 'AH-1-305', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:33:39', '2021-04-14 20:35:36', NULL, 1),
(524, 'Ashley in-House Handpoured Aromatherapy Candles - Blue flavor', NULL, NULL, 'published', '[]', 'AH-1-305', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:33:49', '2021-04-14 21:59:06', NULL, 1),
(525, 'Ashley in-House Handpoured Aromatherapy Candles - Blue flavor', NULL, NULL, 'published', '[]', 'AH-1-305', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:33:59', '2021-04-28 02:40:36', NULL, 2),
(526, 'Ashley in-House Handpoured Aromatherapy Candles - Blue flavor', NULL, NULL, 'published', '[]', 'AH-1-305', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:34:13', '2021-04-27 22:50:11', NULL, 3),
(527, 'Ashley in-House Handpoured Aromatherapy Candles - Blue flavor', NULL, NULL, 'published', '[]', 'AH-1-305', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:34:24', '2021-04-28 05:37:44', NULL, 2),
(528, 'Ashley in-House Handpoured Aromatherapy Candles - Blue flavor', NULL, NULL, 'published', '[]', 'AH-1-305', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:34:37', '2021-04-14 19:39:20', NULL, 1),
(529, 'Ashley in-House Handpoured Aromatherapy Candles - Blue flavor', NULL, NULL, 'published', '[]', 'AH-1-305', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:34:47', '2021-04-27 17:12:54', NULL, 3),
(530, 'Ashley in-House Handpoured Aromatherapy Candle - purple flavor', NULL, NULL, 'published', '[]', 'AH-1-300-red', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:36:17', '2021-04-28 05:50:50', NULL, 3),
(531, 'Ashley in-House Handpoured Aromatherapy Candle - purple flavor', NULL, NULL, 'published', '[]', 'AH-1-300', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:36:33', '2021-04-28 01:26:41', NULL, 2),
(532, 'Ashley in-House Handpoured Aromatherapy Candle - purple flavor', NULL, NULL, 'published', '[]', 'AH-1-300', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:36:42', '2021-04-15 22:41:28', NULL, 2),
(533, 'Ashley in-House Handpoured Aromatherapy Candle - purple flavor', NULL, NULL, 'published', '[]', 'AH-1-300', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:36:49', '2021-04-28 23:11:56', NULL, 2),
(534, 'Ashley in-House Handpoured Aromatherapy Candle - purple flavor', NULL, NULL, 'published', '[]', 'AH-1-300', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:36:57', '2021-04-14 21:41:51', NULL, 2),
(535, 'Ashley in-House Handpoured Aromatherapy Candle - purple flavor', NULL, NULL, 'published', '[]', 'AH-1-300', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:37:04', '2021-04-14 18:59:11', NULL, 1),
(536, 'Ashley in-House Handpoured Aromatherapy Candle - purple flavor', NULL, NULL, 'published', '[]', 'AH-1-300', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:37:11', '2021-04-19 23:25:45', NULL, 2),
(537, 'Ashley in-House Handpoured Aromatherapy Candle - purple flavor', NULL, NULL, 'published', '[]', 'AH-1-300', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:37:19', '2021-04-15 07:02:30', NULL, 2),
(538, 'Ashley in-House Handpoured Aromatherapy Candle - purple flavor', NULL, NULL, 'published', '[]', 'AH-1-300', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:37:27', '2021-04-24 09:07:14', NULL, 2),
(539, 'Ashley in-House Handpoured Aromatherapy Candle - purple flavor', NULL, NULL, 'published', '[]', 'AH-1-300', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:37:37', '2021-04-28 03:58:19', NULL, 3),
(540, 'Ashley in-House Handpoured Aromatherapy Candle - purple flavor', NULL, NULL, 'published', '[]', 'AH-1-300', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:37:45', '2021-04-30 07:13:31', NULL, 3),
(541, 'Ashley in-House Handpoured Aromatherapy Candle - purple flavor', NULL, NULL, 'published', '[]', 'AH-1-300', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:37:52', '2021-04-15 00:50:31', NULL, 1),
(542, 'Ashley in-House Handpoured Aromatherapy Candle - purple flavor', NULL, NULL, 'published', '[]', 'AH-1-300', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:38:00', '2021-04-27 22:57:24', NULL, 3),
(543, 'Ashley in-House Handpoured Aromatherapy Candle - purple flavor', NULL, NULL, 'published', '[]', 'AH-1-300', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:38:08', '2021-04-27 19:36:12', NULL, 3),
(544, 'Ashley in-House Handpoured Aromatherapy Candle - purple flavor', NULL, NULL, 'published', '[]', 'AH-1-300', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:38:21', '2021-04-27 20:44:42', NULL, 3),
(545, 'Ashley in-House Handpoured Aromatherapy Candle - purple flavor', NULL, NULL, 'published', '[]', 'AH-1-300', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:38:40', '2021-04-27 19:42:02', NULL, 3),
(546, 'Ashley in-House Handpoured Aromatherapy Candle - purple flavor', NULL, NULL, 'published', '[]', 'AH-1-300', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:38:51', '2021-04-27 20:37:37', NULL, 2),
(547, 'Ashley in-House Handpoured Aromatherapy Candle - purple flavor', NULL, NULL, 'published', '[]', 'AH-1-300', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:39:08', '2021-04-15 05:10:15', NULL, 1),
(548, 'Ashley in-House Handpoured Aromatherapy Candle - purple flavor', NULL, NULL, 'published', '[]', 'AH-1-300', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:39:19', '2021-04-27 15:58:35', NULL, 3),
(549, 'Ashley in-House Handpoured Aromatherapy Candle - purple flavor', NULL, NULL, 'published', '[]', 'AH-1-300', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:39:27', '2021-04-27 17:31:47', NULL, 3),
(550, 'Ashley in-House Handpoured Aromatherapy Candle - purple flavor', NULL, NULL, 'published', '[]', 'AH-1-300', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:39:35', '2021-04-27 19:41:56', NULL, 3),
(551, 'Ashley in-House Handpoured Aromatherapy Candle - purple flavor', NULL, NULL, 'published', '[]', 'AH-1-300', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:39:44', '2021-04-15 02:53:22', NULL, 2),
(552, 'Ashley in-House Handpoured Aromatherapy Candle - purple flavor', NULL, NULL, 'published', '[]', 'AH-1-300', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:40:15', '2021-04-14 22:44:58', NULL, 2),
(553, 'Ashley in-House Handpoured Aromatherapy Candle - purple flavor', NULL, NULL, 'published', '[]', 'AH-1-300', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 30, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-03 17:40:25', '2021-04-27 23:04:07', NULL, 2),
(554, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[\"products\\/tealights\\/tealights.jpg\",\"products\\/tealights\\/7.jpg\",\"products\\/tealights\\/7.jpg\",\"products\\/tealights\\/6.jpg\",\"products\\/tealights\\/5.jpg\",\"products\\/tealights\\/4.jpg\",\"products\\/tealights\\/3.jpg\",\"products\\/tealights\\/2.jpg\",\"products\\/tealights\\/1.jpg\"]', 'AH-1-214-back', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:11:53', '2021-03-05 22:52:06', NULL, 0),
(555, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:13:09', '2021-04-14 19:41:41', NULL, 2),
(556, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:13:20', '2021-04-25 02:02:28', NULL, 1),
(557, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:13:32', '2021-04-24 20:02:42', NULL, 2),
(558, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:13:49', '2021-04-24 19:45:29', NULL, 2),
(559, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:14:00', '2021-04-15 01:37:13', NULL, 1),
(560, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:14:08', '2021-04-27 01:24:48', NULL, 3),
(561, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:14:18', '2021-04-26 23:01:58', NULL, 3),
(562, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:14:29', '2021-04-24 18:40:36', NULL, 2),
(563, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:14:47', '2021-04-30 10:20:29', NULL, 3),
(564, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:15:14', '2021-04-24 23:03:36', NULL, 3),
(565, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:15:24', '2021-04-25 16:32:49', NULL, 3),
(566, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:15:37', '2021-04-29 12:13:02', NULL, 2),
(567, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:16:52', '2021-04-28 19:34:36', NULL, 3),
(568, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:17:04', '2021-04-24 21:59:19', NULL, 3),
(569, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:17:17', '2021-04-24 19:14:48', NULL, 2),
(570, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:17:27', '2021-04-25 00:13:28', NULL, 2),
(571, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:17:41', '2021-04-24 21:04:33', NULL, 2),
(572, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:17:56', '2021-04-24 17:35:24', NULL, 2),
(573, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:18:13', '2021-04-28 12:01:00', NULL, 3),
(574, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:18:27', '2021-04-27 02:20:54', NULL, 2),
(575, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:18:39', '2021-03-05 22:18:39', NULL, 0),
(576, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:19:03', '2021-04-25 04:40:16', NULL, 2),
(577, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:19:22', '2021-04-25 05:11:14', NULL, 3),
(578, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:19:35', '2021-04-30 23:22:27', NULL, 3),
(579, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:19:53', '2021-04-26 15:54:17', NULL, 4),
(580, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:20:08', '2021-04-25 06:45:19', NULL, 3),
(581, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:20:24', '2021-04-22 18:33:44', NULL, 2),
(582, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:20:41', '2021-05-01 08:49:40', NULL, 4),
(583, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:20:55', '2021-04-25 02:57:41', NULL, 2),
(584, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:21:10', '2021-04-25 00:55:37', NULL, 2),
(585, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:21:36', '2021-04-14 17:23:57', NULL, 1),
(586, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:21:52', '2021-04-15 03:57:25', NULL, 1),
(587, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:22:13', '2021-04-26 11:51:22', NULL, 2),
(588, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:22:32', '2021-04-25 05:57:53', NULL, 2),
(589, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:22:50', '2021-04-25 18:11:12', NULL, 2),
(590, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:23:09', '2021-04-30 02:30:24', NULL, 3),
(591, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:23:25', '2021-04-29 20:31:06', NULL, 2),
(592, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:23:39', '2021-04-26 18:00:29', NULL, 3),
(593, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:23:55', '2021-04-24 19:07:22', NULL, 2),
(594, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:24:11', '2021-04-25 03:06:59', NULL, 3),
(595, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:24:55', '2021-04-15 04:01:06', NULL, 1),
(596, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:25:11', '2021-05-01 19:03:43', NULL, 3),
(597, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:25:25', '2021-04-24 22:20:13', NULL, 1),
(598, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:25:40', '2021-04-30 07:31:26', NULL, 3),
(599, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:26:01', '2021-04-25 06:21:56', NULL, 3),
(600, 'Ashley Handmade Aromatherapy Scented Tealights presented in Clear Heart/Round Shaped Tealight Container', NULL, NULL, 'published', '[]', 'AH-1-214', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 9.00, 0.00, 15.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 22:26:30', '2021-04-29 22:16:00', NULL, 3),
(601, 'Ashley in-House Handpoured Aromatherapy Candles- purple and pink flavor', NULL, NULL, 'published', '[]', 'AH-1-303-Lemon and Musk', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 14.99, NULL, NULL, NULL, 0.00, 9.50, 6.50, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-05 23:57:15', '2021-04-24 22:02:27', NULL, 2),
(602, 'Display Flower', '<p><strong>Package:</strong>&nbsp; Artificial flowers bunched in Pink/Red/Peach/Dark red and White rose &nbsp; flowers</p>\r\n\r\n<p>&nbsp;</p>', '<p>Description:&nbsp; Perfect combination with Aroma Lamps and Ashley in-House wax melts &nbsp; and Candle as &nbsp; gift package for home decorations, Birthdays, Mothers &amp; &nbsp; Fathers Days etc.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', 'published', '[\"products\\/display-flower\\/col.jpg\",\"products\\/display-flower\\/1.png\",\"products\\/display-flower\\/5.png\",\"products\\/display-flower\\/4.png\",\"products\\/display-flower\\/3.png\",\"products\\/display-flower\\/2.png\"]', 'AH-5-1-brown', 0, 0, 1, 1, 0, NULL, NULL, 0, 0, 0, 0, 10, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-07 03:11:54', '2021-05-02 08:12:06', 0, 25),
(603, 'Display Flower', NULL, NULL, 'published', '[\"products\\/display-flower\\/col.jpg\",\"products\\/display-flower\\/1.png\",\"products\\/display-flower\\/5.png\",\"products\\/display-flower\\/4.png\",\"products\\/display-flower\\/3.png\",\"products\\/display-flower\\/2.png\"]', 'AH-5-1-brown', 0, 0, 1, 1, 0, NULL, NULL, 1, 0, 0, 0, 10, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-07 03:21:12', '2021-03-07 03:34:23', NULL, 0),
(604, 'Display Flower', NULL, NULL, 'published', '[\"products\\/display-flower\\/2.png\"]', 'AH-5-1-dark-red-rose-display', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 10, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-07 03:24:23', '2021-03-07 03:25:22', NULL, 0),
(605, 'Display Flower', NULL, NULL, 'published', '[\"products\\/display-flower\\/3.png\"]', 'AH-5-1-white-flower-display', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 10, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-07 03:25:44', '2021-04-28 02:09:18', NULL, 3),
(606, 'Display Flower', NULL, NULL, 'published', '[\"products\\/display-flower\\/5.png\"]', 'AH-5-1-red-rose-flower-display', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 10, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-07 03:26:07', '2021-04-17 13:46:15', NULL, 10),
(607, 'Display Flower', NULL, NULL, 'published', '[\"products\\/display-flower\\/5.png\"]', 'AH-5-1-rose-mixed-colour-flower-display', 0, 0, 0, 0, 0, NULL, NULL, 1, 0, 0, 0, 10, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-07 03:27:06', '2021-04-14 22:36:57', NULL, 1),
(612, 'Ashley in-House Aromatherapy, Handpoured scented soy wax candles presented in Clear Glass', NULL, NULL, 'published', '[\"products\\/candles\\/candle8.jpg\"]', 'AH-1-304-red-Lemon and Musk', 0, 0, 0, 1, 0, NULL, NULL, 1, 0, 0, 0, 19.99, NULL, NULL, NULL, 0.00, 12.50, 7.00, 0.00, NULL, NULL, NULL, NULL, NULL, 10, '2021-03-13 00:28:47', '2021-03-13 00:30:52', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_attributes`
--

CREATE TABLE `ec_product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_set_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED DEFAULT '0',
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_attributes`
--

INSERT INTO `ec_product_attributes` (`id`, `attribute_set_id`, `title`, `slug`, `color`, `image`, `is_default`, `order`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Green', 'green', '#5FB7D4', NULL, 1, 1, 'published', '2020-11-07 02:12:24', '2020-11-07 02:12:24'),
(2, 1, 'Blue', 'blue', '#333333', NULL, 0, 2, 'published', '2020-11-07 02:12:24', '2020-11-07 02:12:24'),
(3, 1, 'Red', 'red', '#DA323F', NULL, 0, 3, 'published', '2020-11-07 02:12:24', '2020-11-07 02:12:24'),
(4, 1, 'Black', 'back', '#2F366C', NULL, 0, 4, 'published', '2020-11-07 02:12:24', '2020-11-07 02:12:24'),
(5, 1, 'Brown', 'brown', '#87554B', NULL, 0, 5, 'published', '2020-11-07 02:12:24', '2020-11-07 02:12:24'),
(6, 2, 'S', 's', NULL, NULL, 1, 1, 'published', '2020-11-07 02:12:24', '2020-11-07 02:12:24'),
(7, 2, 'M', 'm', NULL, NULL, 1, 2, 'published', '2020-11-07 02:12:24', '2020-11-07 02:12:24'),
(8, 2, 'L', 'l', NULL, NULL, 1, 3, 'published', '2020-11-07 02:12:24', '2020-11-07 02:12:24'),
(9, 2, 'XL', 'xl', NULL, NULL, 1, 4, 'published', '2020-11-07 02:12:24', '2020-11-07 02:12:24'),
(10, 2, 'XXL', 'xxl', NULL, NULL, 1, 5, 'published', '2020-11-07 02:12:24', '2020-11-07 02:12:24'),
(11, 3, 'Peony and Blush Suede', 'Peony and Blush Suede', '#333333', '', 0, 0, 'published', '2021-03-02 03:58:13', '2021-03-02 05:33:11'),
(12, 3, 'Black Amber and Lavender', 'Black Amber and Lavender', '', '', 0, 1, 'published', '2021-03-02 03:58:13', '2021-03-02 03:58:13'),
(13, 4, 'Amber and Sandalwood', 'Amber and Sandalwood', '', '', 1, 0, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(14, 4, 'Pink Sugar ', 'Pink Sugar ', '', '', 0, 1, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(15, 4, 'Cinnamon, Apple and Peach', 'Cinnamon, Apple and Peach', '', '', 0, 2, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(16, 4, 'Cinnamon, Sugar and Vanilla', 'Cinnamon, Sugar and Vanilla', '', '', 0, 3, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(17, 4, 'Berries and Sugar', 'Berries and Sugar', '', '', 0, 4, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(18, 4, 'Marshmallow Fluff', 'Marshmallow Fluff', '', '', 0, 5, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(19, 4, 'Volcano Capri', 'Volcano Capri', '', '', 0, 6, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(20, 4, 'Vanilla Lace', 'Vanilla Lace', '', '', 0, 7, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(21, 4, 'Coconut and Vanilla', 'Coconut and Vanilla', '', '', 0, 8, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(22, 4, 'Orange and Berry', 'Orange and Berry', '', '', 0, 9, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(23, 4, 'Pomegranate Cider', 'Pomegranate Cider', '', '', 0, 10, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(24, 4, 'Cucumber and Sea Salt', 'Cucumber and Sea Salt', '', '', 0, 11, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(25, 4, 'Candy Cane', 'Candy Cane', '', '', 0, 12, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(26, 4, 'Blue Raspberry Rancher', 'Blue Raspberry Rancher', '', '', 0, 13, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(27, 4, 'Cucumber and Melon', 'Cucumber and Melon', '', '', 0, 14, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(28, 4, 'Vermont Honey Apple', 'Vermont Honey Apple', '', '', 0, 15, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(29, 4, 'Birthday Cake', 'Birthday Cake', '', '', 0, 16, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(30, 4, 'Lavender, Vanilla and Musk', 'Lavender, Vanilla and Musk', '', '', 0, 17, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(31, 4, 'Orange and Vanilla', 'Orange and Vanilla', '', '', 0, 18, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(32, 4, 'Lavender, Geranium and Cedar', 'Lavender, Geranium and Cedar', '', '', 0, 19, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(33, 4, 'Apple and Oakmoss', 'Apple and Oakmoss', '', '', 0, 20, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(34, 4, 'Cinnamon Broom', 'Cinnamon Broom', '', '', 0, 21, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(35, 4, 'Hot Cocoa and Cream', 'Hot Cocoa and Cream', '', '', 0, 22, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(36, 4, 'Fruit Loops', 'Fruit Loops', '', '', 0, 23, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(37, 4, 'Ylang Ylang and Lily', 'Ylang Ylang and Lily', '', '', 0, 24, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(38, 4, 'Lemon, Musk and Vanilla', 'Lemon, Musk and Vanilla', '', '', 0, 25, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(39, 4, 'Pumpkin Pecan ', 'Pumpkin Pecan ', '', '', 0, 26, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(40, 4, 'Honeysuckle', 'Honeysuckle', '', '', 0, 27, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(41, 4, 'Bubblegum', 'Bubblegum', '', '', 0, 28, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(42, 4, 'Grape and Vanilla', 'Grape and Vanilla', '', '', 0, 29, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(43, 4, 'Coconut, Sandalwood and Vanilla', 'Coconut, Sandalwood and Vanilla', '', '', 0, 30, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(44, 4, 'Musk and Patchouli', 'Musk and Patchouli', '', '', 0, 31, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(45, 4, 'Orchid and Musk', 'Orchid and Musk', '', '', 0, 32, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(46, 4, 'Lily and Hibiscus', 'Lily and Hibiscus', '', '', 0, 33, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(47, 4, 'Candy Corn', 'Candy Corn', '', '', 0, 34, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(48, 4, 'Bourbon Butterscotch', 'Bourbon Butterscotch', '', '', 0, 35, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(49, 4, 'Captain Crunch Berries', 'Captain Crunch Berries', '', '', 0, 36, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(50, 4, 'Vanilla Pipe Tobacco', 'Vanilla Pipe Tobacco', '', '', 0, 37, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(51, 4, 'Fresh Cut Grass', 'Fresh Cut Grass', '', '', 0, 38, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(52, 4, 'Sweet Pea', 'Sweet Pea', '', '', 0, 39, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(53, 4, 'Berry and Candy', 'Berry and Candy', '', '', 0, 40, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(54, 4, 'Blueberry Cobbler', 'Blueberry Cobbler', '', '', 0, 41, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(55, 4, 'Autumn Walk', 'Autumn Walk', '', '', 0, 42, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(56, 4, 'Watermelon Jolly', 'Watermelon Jolly', '', '', 0, 43, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(57, 4, 'Thousand Wishes', 'Thousand Wishes', '', '', 0, 44, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(58, 4, 'Bergamot Grapefruit', 'Bergamot Grapefruit', '', '', 0, 45, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(59, 4, 'Iced Cinnamon Roll', 'Iced Cinnamon Roll', '', '', 0, 46, 'published', '2021-03-02 05:11:23', '2021-03-02 05:11:23'),
(60, 3, 'English Pear and Freesia', 'English Pear and Freesia', '', '', 1, 2, 'published', '2021-03-02 05:33:11', '2021-03-02 05:33:11'),
(61, 3, 'Sheer Lily and White Rose', 'Sheer Lily and White Rose', '', '', 0, 3, 'published', '2021-03-02 05:33:11', '2021-03-02 05:33:11'),
(62, 3, 'Velvet Rose and Oud', 'Velvet Rose and Oud', '', '', 0, 4, 'published', '2021-03-02 05:33:11', '2021-03-02 05:33:11'),
(63, 3, 'Snug as a Bug', 'Snug as a Bug', '', '', 0, 5, 'published', '2021-03-02 05:33:11', '2021-03-02 05:33:11'),
(64, 3, 'Coconut Lime', 'Coconut Lime', '', '', 0, 6, 'published', '2021-03-02 05:33:11', '2021-03-02 05:33:11'),
(65, 3, 'Egyptian Amber', 'Egyptian Amber', '', '', 0, 7, 'published', '2021-03-02 05:33:11', '2021-03-02 05:33:11'),
(66, 3, 'Passionfruit and Martini', 'Passionfruit and Martini', '', '', 0, 8, 'published', '2021-03-02 05:33:11', '2021-03-02 05:33:11'),
(67, 3, 'Sauvage', 'Sauvage', '', '', 0, 9, 'published', '2021-03-02 05:33:11', '2021-03-02 05:33:11'),
(68, 3, 'The Male', 'The Male', '', '', 0, 10, 'published', '2021-03-02 05:33:11', '2021-03-02 05:33:11'),
(69, 3, 'Terry Hermes', 'Terry Hermes', '', '', 0, 11, 'published', '2021-03-02 05:33:11', '2021-03-02 05:33:11'),
(70, 3, 'Madame', 'Madame', '', '', 0, 12, 'published', '2021-03-02 05:33:11', '2021-03-02 05:33:11'),
(71, 3, 'Black Orchid', 'Black Orchid', '', '', 0, 13, 'published', '2021-03-02 05:33:11', '2021-03-02 05:33:11'),
(72, 3, 'Wood Sage and Sea Salt', 'Wood Sage and Sea Salt', '', '', 0, 14, 'published', '2021-03-02 05:33:11', '2021-03-02 05:33:11'),
(73, 3, 'Pine, Jasmine and Amber', 'Pine, Jasmine and Amber', '', '', 0, 15, 'published', '2021-03-02 05:33:11', '2021-03-02 05:33:11'),
(74, 3, 'Oriental Rose', 'Oriental Rose', '', '', 0, 16, 'published', '2021-03-02 05:33:11', '2021-03-02 05:33:11'),
(75, 3, 'Vetiver Cedarwood and Fir', 'Vetiver Cedarwood and Fir', '', '', 0, 17, 'published', '2021-03-02 05:33:11', '2021-03-02 05:33:11'),
(76, 3, 'Oud Wood', 'Oud Wood', '', '', 0, 18, 'published', '2021-03-02 05:33:11', '2021-03-02 05:33:11'),
(77, 3, 'Strawberry Fizz', 'Strawberry Fizz', '', '', 0, 19, 'published', '2021-03-02 05:33:11', '2021-03-02 05:33:11'),
(78, 3, 'Black Raspberry and Vanilla', 'Black Raspberry and Vanilla', '', '', 0, 20, 'published', '2021-03-02 05:33:11', '2021-03-02 05:33:11'),
(79, 3, 'Lime, Basil and Mandarin', 'Lime, Basil and Mandarin', '', '', 0, 21, 'published', '2021-03-02 05:33:11', '2021-03-02 05:33:11'),
(80, 3, 'Lemongrass and Persian Lime', 'Lemongrass and Persian Lime', '', '', 0, 22, 'published', '2021-03-02 05:33:11', '2021-03-02 05:33:11'),
(81, 3, 'Lemon and Musk', 'Lemon and Musk', '', '', 0, 23, 'published', '2021-03-02 05:33:11', '2021-03-02 05:33:11'),
(82, 5, 'Peach Flower Display', 'peach-flower-display', '', 'products/display-flower/1.png', 1, 0, 'published', '2021-03-07 03:20:34', '2021-03-07 03:20:34'),
(83, 5, 'Dark Red Rose Display', 'dark-red-rose-display', '', 'products/display-flower/2.png', 0, 1, 'published', '2021-03-07 03:20:34', '2021-03-07 03:20:34'),
(84, 5, 'White Flower Display', 'white-flower-display', '', 'products/display-flower/3.png', 0, 2, 'published', '2021-03-07 03:20:34', '2021-03-07 03:20:34'),
(85, 5, 'Red Rose Flower Display ', 'red-rose-flower-display', '', 'products/display-flower/5.png', 0, 3, 'published', '2021-03-07 03:20:34', '2021-03-07 03:20:34'),
(86, 5, 'Rose Mixed Colour Flower Display', 'rose-mixed-colour-flower-display', '', 'products/display-flower/4.png', 0, 4, 'published', '2021-03-07 03:20:34', '2021-03-07 03:20:34');

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_attribute_sets`
--

CREATE TABLE `ec_product_attribute_sets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_layout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'swatch_dropdown',
  `is_searchable` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `is_comparable` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `is_use_in_product_listing` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_attribute_sets`
--

INSERT INTO `ec_product_attribute_sets` (`id`, `title`, `slug`, `display_layout`, `is_searchable`, `is_comparable`, `is_use_in_product_listing`, `status`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Color', 'color', 'visual', 1, 1, 1, 'published', 0, '2020-11-07 02:12:24', '2020-11-07 02:12:24'),
(2, 'Size', 'size', 'text', 1, 1, 1, 'published', 0, '2020-11-07 02:12:24', '2020-11-07 02:12:24'),
(3, 'Candles Fragrance Types:', 'Candles Fragrance Types', 'dropdown', 1, 1, 1, 'published', 0, '2021-03-02 03:58:13', '2021-03-03 15:58:53'),
(4, 'Wax Melts and Tealights Fragrance Types:', 'Wax Melts and Tealights Fragrance Types', 'dropdown', 0, 0, 0, 'published', 0, '2021-03-02 05:11:23', '2021-03-03 15:58:41'),
(5, 'Display Flowers', 'display-flowers', 'dropdown', 0, 0, 0, 'published', 0, '2021-03-07 03:20:34', '2021-03-07 03:20:34');

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_categories`
--

CREATE TABLE `ec_product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_categories`
--

INSERT INTO `ec_product_categories` (`id`, `name`, `description`, `status`, `order`, `image`, `is_featured`, `created_at`, `updated_at`, `parent_id`) VALUES
(9, 'New Arrivals', '<p>Online shopping for&nbsp;<em>New Arrivals</em>&nbsp;from a great selection of all our products &amp; collections.</p>', 'published', 0, 'product-categories/3.png', 0, '2021-01-20 20:48:09', '2021-01-20 20:48:09', 0),
(10, 'Reed Diffusers and Candle Sets', '<p>Reed Diffusers &amp; Candle Sets product categories.</p>', 'published', 0, 'product-categories/diffusers-1.png', 0, '2021-01-20 20:50:15', '2021-01-20 20:50:15', 0),
(11, 'Ashley in-House Handpoured Aromatherapy Candles', '<p>&nbsp;Ashley in-House Handpoured Aromatherapy Candles.</p>', 'published', 0, 'product-categories/candles.jpg', 0, '2021-01-20 21:04:41', '2021-02-09 22:06:31', 0),
(12, 'Ashley in-House Handpoured Aromatherapy Wax Melts & Tealights in Jars', '<p>Ashley in-House Handpoured Aromatherapy Wax Melts &amp; Tealights in Jars</p>', 'published', 0, 'product-categories/aromatherapy-wax-melts-tealights-candles.png', 0, '2021-01-20 21:14:41', '2021-02-09 22:05:11', 0),
(13, 'Electric Wax Melt /oil burners and Candle warmers', '<p>Electric Wax Melt /oil burners &amp; Candle warmers products of ashley.</p>', 'published', 0, 'product-categories/electric-wax-melt-oil-burners-candle-warmers-1.png', 0, '2021-01-20 21:20:49', '2021-01-20 21:55:12', 0),
(14, 'Display Flowers', NULL, 'published', 0, 'product-categories/display-flowers.png', 0, '2021-01-20 21:29:48', '2021-01-20 21:29:48', 0),
(15, 'Gift Sets', '<p>Gift Sets product category.</p>', 'published', 0, 'product-categories/giftsets.png', 0, '2021-01-20 21:42:37', '2021-01-20 21:42:37', 0),
(16, 'Wholesale', '<p>Wholesale ashley products</p>', 'published', 0, 'product-categories/wholesale.png', 0, '2021-01-20 21:49:57', '2021-01-20 21:49:57', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_category_product`
--

CREATE TABLE `ec_product_category_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_category_product`
--

INSERT INTO `ec_product_category_product` (`id`, `category_id`, `product_id`) VALUES
(213, 10, 108),
(214, 9, 108),
(216, 10, 111),
(218, 10, 114),
(220, 10, 117),
(222, 10, 121),
(238, 10, 125),
(242, 10, 128),
(246, 15, 149),
(247, 10, 149),
(251, 15, 150),
(252, 10, 150),
(256, 15, 152),
(257, 10, 152),
(261, 10, 145),
(264, 10, 153),
(266, 10, 50),
(268, 10, 52),
(270, 10, 55),
(272, 10, 58),
(275, 10, 60),
(277, 10, 62),
(281, 10, 67),
(282, 10, 70),
(284, 15, 73),
(286, 10, 74),
(289, 15, 77),
(291, 10, 78),
(294, 10, 156),
(296, 10, 158),
(298, 10, 5),
(300, 10, 161),
(303, 10, 164),
(307, 10, 168),
(309, 10, 170),
(312, 10, 172),
(314, 10, 174),
(316, 10, 176),
(319, 10, 178),
(321, 10, 180),
(323, 10, 182),
(327, 10, 186),
(330, 15, 189),
(332, 15, 185),
(333, 10, 190),
(337, 10, 194),
(339, 10, 196),
(341, 10, 198),
(343, 10, 200),
(345, 10, 202),
(347, 10, 204),
(351, 13, 31),
(352, 13, 32),
(353, 13, 33),
(354, 13, 7),
(355, 13, 34),
(356, 13, 35),
(357, 13, 36),
(358, 13, 37),
(359, 13, 38),
(360, 13, 39),
(361, 13, 40),
(362, 13, 41),
(363, 13, 42),
(364, 13, 43),
(365, 13, 44),
(366, 13, 45),
(367, 13, 46),
(368, 12, 208),
(371, 12, 211),
(374, 15, 187),
(375, 15, 186),
(376, 15, 207),
(377, 10, 207),
(378, 15, 206),
(379, 10, 206),
(380, 15, 205),
(381, 10, 205),
(382, 15, 204),
(383, 15, 203),
(384, 10, 203),
(385, 15, 202),
(386, 15, 201),
(387, 10, 201),
(388, 15, 200),
(389, 15, 199),
(390, 10, 199),
(391, 15, 197),
(392, 10, 197),
(393, 10, 189),
(394, 15, 188),
(395, 10, 188),
(396, 15, 195),
(397, 10, 195),
(398, 15, 194),
(399, 15, 196),
(400, 15, 193),
(401, 10, 193),
(402, 15, 192),
(403, 10, 192),
(404, 15, 191),
(405, 10, 191),
(406, 15, 190),
(407, 10, 185),
(408, 15, 184),
(409, 10, 184),
(410, 15, 183),
(411, 10, 183),
(412, 15, 182),
(413, 15, 198),
(414, 15, 181),
(415, 10, 181),
(416, 15, 180),
(417, 15, 179),
(418, 10, 179),
(419, 15, 177),
(420, 10, 177),
(421, 15, 176),
(422, 15, 175),
(423, 10, 175),
(424, 15, 174),
(425, 15, 173),
(426, 10, 173),
(427, 15, 172),
(428, 15, 171),
(429, 10, 171),
(430, 15, 170),
(431, 15, 169),
(432, 10, 169),
(433, 15, 166),
(434, 10, 166),
(435, 15, 165),
(436, 10, 165),
(437, 15, 164),
(438, 15, 163),
(439, 10, 163),
(440, 15, 162),
(441, 10, 162),
(442, 15, 161),
(443, 15, 160),
(444, 10, 160),
(445, 15, 159),
(446, 10, 159),
(447, 15, 158),
(448, 15, 157),
(449, 10, 157),
(450, 15, 156),
(451, 15, 155),
(452, 10, 155),
(453, 15, 153),
(454, 15, 154),
(455, 10, 154),
(456, 15, 151),
(457, 10, 151),
(458, 15, 148),
(459, 10, 148),
(460, 15, 147),
(461, 10, 147),
(462, 15, 146),
(463, 10, 146),
(464, 15, 145),
(465, 15, 144),
(466, 10, 144),
(467, 15, 142),
(468, 10, 142),
(469, 15, 143),
(470, 10, 143),
(471, 15, 140),
(472, 10, 140),
(473, 15, 139),
(474, 10, 139),
(475, 15, 138),
(476, 10, 138),
(477, 15, 136),
(478, 10, 136),
(479, 15, 135),
(480, 10, 135),
(481, 15, 129),
(482, 10, 129),
(483, 15, 130),
(484, 10, 130),
(485, 15, 128),
(486, 15, 134),
(487, 10, 134),
(488, 15, 131),
(489, 10, 131),
(490, 15, 127),
(491, 10, 127),
(492, 15, 126),
(493, 10, 126),
(494, 15, 125),
(495, 15, 124),
(496, 10, 124),
(497, 15, 123),
(498, 10, 123),
(499, 15, 122),
(500, 10, 122),
(501, 15, 121),
(502, 15, 120),
(503, 10, 120),
(504, 15, 119),
(505, 10, 119),
(506, 15, 118),
(507, 10, 118),
(508, 15, 117),
(509, 15, 116),
(510, 10, 116),
(511, 15, 115),
(512, 10, 115),
(513, 15, 114),
(514, 15, 113),
(515, 10, 113),
(516, 15, 112),
(517, 10, 112),
(518, 15, 111),
(519, 15, 110),
(520, 10, 110),
(521, 15, 109),
(522, 10, 109),
(523, 15, 108),
(524, 15, 78),
(525, 10, 77),
(526, 15, 76),
(527, 10, 76),
(528, 15, 75),
(529, 15, 74),
(530, 10, 73),
(531, 15, 72),
(532, 10, 72),
(533, 15, 71),
(534, 10, 71),
(535, 15, 70),
(536, 15, 68),
(537, 10, 68),
(538, 15, 67),
(539, 15, 66),
(540, 10, 66),
(541, 15, 65),
(542, 10, 65),
(543, 15, 63),
(544, 10, 63),
(545, 15, 62),
(546, 15, 61),
(547, 10, 61),
(548, 15, 60),
(549, 15, 59),
(550, 10, 59),
(551, 15, 58),
(552, 15, 57),
(553, 10, 57),
(554, 10, 75),
(555, 15, 55),
(556, 15, 54),
(557, 10, 54),
(558, 15, 52),
(559, 15, 51),
(560, 10, 51),
(561, 15, 50),
(562, 15, 49),
(563, 10, 49),
(564, 10, 187),
(565, 15, 167),
(566, 10, 167),
(567, 11, 212),
(568, 9, 212),
(569, 11, 213),
(570, 10, 212),
(571, 10, 213),
(572, 9, 213),
(573, 11, 214),
(574, 10, 214),
(575, 9, 214),
(576, 11, 215),
(577, 10, 215),
(578, 9, 215),
(579, 11, 216),
(580, 10, 216),
(581, 9, 216),
(582, 11, 217),
(583, 10, 217),
(584, 9, 217),
(585, 12, 220),
(586, 9, 220),
(587, 12, 269),
(588, 9, 269),
(589, 12, 319),
(590, 9, 319),
(591, 9, 208),
(592, 14, 602),
(593, 9, 602);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_collections`
--

CREATE TABLE `ec_product_collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_collections`
--

INSERT INTO `ec_product_collections` (`id`, `name`, `slug`, `description`, `image`, `status`, `is_featured`, `created_at`, `updated_at`) VALUES
(1, 'New Arrival', 'new-arrival', NULL, 'product-collections/tealight.jpg', 'published', 1, '2020-11-07 02:12:24', '2021-01-25 03:17:01'),
(3, 'Electric Wax Melt', 'special-offer', 'Electric Wax Melt /oil burners & Candle warmers', 'product-collections/electric-wax-melt-oil-burners-candle-warmers.jpg', 'published', 1, '2020-11-07 02:12:24', '2021-01-18 02:36:16'),
(5, 'Gift Sets', 'gift', 'Shop for your gift now.', 'product-collections/gift.jpg', 'published', 1, '2021-01-11 14:23:36', '2021-01-27 17:42:49'),
(6, 'Diffusers and Candles', 'reed-diffusers-and-candle-sets', 'Reed Diffusers & Candle Sets', 'product-collections/diffuser-1.jpg', 'published', 1, '2021-01-18 02:17:54', '2021-02-11 05:36:51'),
(8, 'Wax melts & Tealights', 'aromatherapy-wax-melts-tealights-candles', 'Aromatherapy wax melts & Tealights Candles', 'product-collections/wax-melts.jpg', 'published', 1, '2021-01-18 02:33:42', '2021-01-25 03:10:46'),
(9, 'Wholesale', 'best-sellers', 'Wholesale', 'product-collections/ashley-bags2.jpg', 'published', 1, '2021-02-11 18:54:59', '2021-02-11 18:54:59'),
(10, 'Display Flowers', 'display-flowers', 'Display Flowers', 'products/display-flower/col.jpg', 'published', 1, '2021-02-11 19:03:27', '2021-03-07 03:13:13'),
(11, 'Aromatherapy', 'aromatherapy-scented-candles-infused-in-petals', 'aromatherapy scented candles infused in petals.', 'product-collections/aromatherapy.jpg', 'published', 1, '2021-02-11 19:06:44', '2021-02-11 19:06:44');

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_collection_products`
--

CREATE TABLE `ec_product_collection_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_collection_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_collection_products`
--

INSERT INTO `ec_product_collection_products` (`id`, `product_collection_id`, `product_id`) VALUES
(4, 1, 4),
(6, 1, 6),
(13, 1, 39),
(14, 3, 40),
(16, 1, 46),
(39, 1, 58),
(41, 1, 59),
(43, 1, 60),
(49, 1, 62),
(60, 1, 67),
(62, 1, 68),
(69, 1, 71),
(75, 1, 73),
(89, 1, 78),
(194, 1, 116),
(220, 1, 125),
(277, 1, 144),
(280, 1, 145),
(289, 1, 45),
(292, 6, 108),
(294, 6, 111),
(296, 6, 114),
(298, 6, 117),
(300, 6, 121),
(312, 6, 125),
(316, 6, 128),
(320, 5, 149),
(321, 6, 149),
(325, 5, 150),
(326, 6, 150),
(330, 5, 152),
(331, 6, 152),
(335, 6, 145),
(338, 6, 153),
(340, 6, 50),
(342, 6, 52),
(344, 6, 55),
(346, 6, 58),
(349, 6, 60),
(351, 6, 62),
(356, 6, 67),
(357, 6, 70),
(360, 6, 74),
(363, 5, 77),
(365, 6, 78),
(366, 5, 154),
(369, 6, 156),
(371, 6, 158),
(373, 6, 5),
(375, 6, 161),
(378, 6, 164),
(382, 6, 168),
(384, 6, 170),
(386, 6, 172),
(388, 6, 174),
(390, 6, 176),
(393, 6, 178),
(395, 6, 180),
(397, 6, 182),
(401, 6, 186),
(405, 6, 190),
(409, 6, 194),
(411, 6, 196),
(413, 5, 198),
(414, 6, 198),
(416, 6, 200),
(418, 6, 202),
(420, 6, 204),
(424, 3, 31),
(425, 3, 32),
(426, 3, 33),
(427, 3, 7),
(428, 3, 34),
(429, 3, 35),
(430, 3, 36),
(431, 3, 37),
(432, 3, 38),
(433, 3, 39),
(434, 3, 41),
(435, 3, 42),
(436, 3, 43),
(437, 3, 44),
(438, 3, 45),
(439, 3, 46),
(443, 8, 211),
(446, 5, 207),
(447, 6, 207),
(448, 5, 206),
(449, 6, 206),
(450, 5, 205),
(451, 6, 205),
(452, 5, 204),
(453, 5, 203),
(454, 6, 203),
(455, 5, 202),
(456, 5, 201),
(457, 6, 201),
(458, 5, 200),
(459, 5, 199),
(460, 6, 199),
(461, 5, 197),
(462, 6, 197),
(463, 6, 189),
(464, 5, 188),
(465, 6, 188),
(466, 5, 195),
(467, 6, 195),
(468, 5, 194),
(469, 5, 196),
(470, 5, 193),
(471, 6, 193),
(472, 5, 192),
(473, 6, 192),
(474, 5, 191),
(475, 6, 191),
(476, 5, 190),
(477, 5, 189),
(478, 5, 186),
(479, 5, 185),
(480, 6, 185),
(481, 5, 184),
(482, 6, 184),
(483, 5, 183),
(484, 6, 183),
(485, 5, 182),
(486, 5, 181),
(487, 6, 181),
(488, 5, 179),
(489, 6, 179),
(490, 5, 177),
(491, 6, 177),
(492, 5, 176),
(493, 5, 175),
(494, 6, 175),
(495, 5, 174),
(496, 5, 172),
(497, 5, 170),
(498, 5, 169),
(499, 6, 169),
(500, 5, 166),
(501, 6, 166),
(502, 5, 165),
(503, 6, 165),
(504, 5, 164),
(505, 5, 163),
(506, 6, 163),
(507, 5, 162),
(508, 6, 162),
(509, 5, 161),
(510, 5, 160),
(511, 6, 160),
(512, 5, 159),
(513, 6, 159),
(514, 5, 158),
(515, 5, 157),
(516, 6, 157),
(517, 5, 156),
(518, 5, 155),
(519, 6, 155),
(520, 5, 153),
(521, 6, 154),
(522, 5, 151),
(523, 6, 151),
(524, 5, 148),
(525, 6, 148),
(526, 5, 147),
(527, 6, 147),
(528, 5, 146),
(529, 6, 146),
(530, 5, 144),
(531, 6, 144),
(532, 5, 142),
(533, 6, 142),
(534, 5, 143),
(535, 6, 143),
(536, 5, 140),
(537, 6, 140),
(538, 5, 139),
(539, 6, 139),
(540, 5, 136),
(541, 6, 136),
(542, 5, 135),
(543, 6, 135),
(544, 5, 129),
(545, 6, 129),
(546, 5, 130),
(547, 6, 130),
(548, 5, 128),
(549, 5, 134),
(550, 6, 134),
(551, 5, 131),
(552, 6, 131),
(553, 5, 127),
(554, 6, 127),
(555, 5, 126),
(556, 6, 126),
(557, 5, 124),
(558, 6, 124),
(559, 5, 123),
(560, 6, 123),
(561, 5, 122),
(562, 6, 122),
(563, 5, 121),
(564, 5, 120),
(565, 6, 120),
(566, 5, 119),
(567, 6, 119),
(568, 5, 118),
(569, 6, 118),
(570, 5, 117),
(571, 5, 116),
(572, 6, 116),
(573, 5, 115),
(574, 6, 115),
(575, 5, 114),
(576, 5, 113),
(577, 6, 113),
(578, 5, 112),
(579, 6, 112),
(580, 5, 111),
(581, 5, 110),
(582, 6, 110),
(583, 5, 109),
(584, 6, 109),
(585, 5, 108),
(586, 6, 77),
(587, 5, 76),
(588, 6, 76),
(589, 5, 75),
(590, 6, 75),
(591, 5, 74),
(592, 5, 73),
(593, 6, 73),
(594, 5, 72),
(595, 6, 72),
(596, 5, 71),
(597, 6, 71),
(598, 5, 70),
(599, 5, 68),
(600, 6, 68),
(601, 5, 78),
(602, 5, 66),
(603, 6, 66),
(604, 5, 65),
(605, 6, 65),
(606, 5, 63),
(607, 6, 63),
(608, 5, 61),
(609, 6, 61),
(610, 5, 60),
(611, 5, 59),
(612, 6, 59),
(613, 5, 58),
(614, 5, 57),
(615, 6, 57),
(616, 5, 55),
(617, 5, 54),
(618, 6, 54),
(619, 5, 52),
(620, 5, 51),
(621, 6, 51),
(622, 5, 50),
(623, 5, 49),
(624, 6, 49),
(625, 5, 187),
(626, 6, 187),
(627, 5, 167),
(628, 6, 167),
(629, 5, 138),
(630, 6, 138),
(631, 6, 173),
(632, 5, 171),
(633, 6, 171),
(635, 1, 212),
(636, 6, 212),
(637, 6, 213),
(638, 11, 213),
(639, 11, 212),
(640, 1, 213),
(641, 1, 214),
(642, 6, 214),
(643, 11, 214),
(644, 1, 215),
(645, 6, 215),
(646, 11, 215),
(647, 1, 216),
(648, 6, 216),
(649, 11, 216),
(650, 1, 217),
(651, 6, 217),
(652, 11, 217),
(653, 8, 220),
(654, 8, 269),
(655, 1, 269),
(656, 8, 319),
(657, 1, 208),
(658, 8, 208),
(659, 1, 211),
(660, 10, 602);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_cross_sale_relations`
--

CREATE TABLE `ec_product_cross_sale_relations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_product_id` int(10) UNSIGNED NOT NULL,
  `to_product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_related_relations`
--

CREATE TABLE `ec_product_related_relations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_product_id` int(10) UNSIGNED NOT NULL,
  `to_product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_related_relations`
--

INSERT INTO `ec_product_related_relations` (`id`, `from_product_id`, `to_product_id`) VALUES
(4, 33, 32),
(6, 34, 31),
(7, 34, 7),
(9, 35, 7),
(11, 36, 33),
(12, 36, 35),
(14, 38, 37),
(16, 39, 31),
(18, 40, 33),
(22, 43, 7),
(26, 47, 7),
(27, 48, 31),
(32, 53, 6),
(35, 56, 7),
(42, 68, 8),
(43, 69, 8),
(50, 5, 6),
(52, 5, 8),
(54, 84, 80),
(55, 85, 80),
(56, 88, 87),
(57, 89, 88),
(58, 90, 87),
(59, 91, 90),
(60, 93, 89),
(61, 94, 88),
(62, 95, 89),
(63, 97, 96),
(64, 107, 106),
(69, 141, 5),
(70, 141, 7),
(71, 141, 31),
(72, 141, 4),
(80, 46, 7),
(82, 46, 38),
(84, 108, 50),
(112, 121, 55),
(121, 115, 134),
(122, 115, 138),
(123, 115, 109),
(126, 112, 109),
(136, 113, 110),
(137, 113, 116),
(139, 113, 135),
(140, 116, 113),
(141, 116, 110),
(171, 126, 57),
(185, 129, 51),
(192, 131, 54),
(196, 149, 136),
(197, 149, 138),
(198, 149, 135),
(200, 134, 138),
(201, 134, 136),
(202, 134, 139),
(203, 134, 135),
(204, 138, 134),
(205, 138, 136),
(206, 138, 139),
(207, 138, 135),
(208, 135, 136),
(209, 135, 134),
(210, 135, 138),
(211, 135, 139),
(213, 150, 55),
(215, 150, 50),
(222, 139, 136),
(223, 139, 138),
(228, 152, 136),
(232, 142, 51),
(237, 144, 4),
(240, 145, 50),
(241, 145, 55),
(245, 146, 51),
(250, 147, 57),
(251, 153, 52),
(252, 153, 50),
(253, 153, 58),
(255, 49, 51),
(256, 49, 57),
(257, 49, 61),
(258, 49, 54),
(262, 51, 49),
(263, 51, 54),
(265, 51, 61),
(266, 52, 58),
(267, 52, 50),
(268, 52, 60),
(269, 54, 51),
(271, 54, 57),
(273, 55, 52),
(274, 55, 50),
(275, 55, 58),
(289, 60, 52),
(290, 60, 58),
(291, 60, 55),
(295, 61, 57),
(296, 62, 50),
(302, 63, 54),
(304, 65, 51),
(306, 65, 57),
(311, 70, 52),
(324, 75, 51),
(326, 76, 51),
(332, 77, 73),
(333, 78, 50),
(334, 78, 52),
(335, 78, 55),
(340, 155, 66),
(341, 155, 4),
(342, 155, 73),
(343, 155, 77),
(344, 156, 52),
(345, 156, 55),
(346, 156, 58),
(347, 156, 50),
(348, 157, 54),
(349, 157, 51),
(350, 157, 49),
(353, 159, 118),
(356, 5, 50),
(357, 5, 55),
(358, 5, 58),
(361, 160, 51),
(365, 161, 52),
(366, 161, 55),
(369, 162, 115),
(373, 163, 63),
(377, 164, 55),
(381, 165, 61),
(386, 168, 52),
(387, 168, 50),
(388, 168, 55),
(389, 168, 58),
(390, 169, 49),
(391, 169, 51),
(392, 169, 61),
(394, 170, 52),
(395, 170, 58),
(396, 170, 50),
(397, 170, 55),
(403, 172, 55),
(404, 172, 58),
(405, 172, 50),
(410, 174, 50),
(411, 174, 52),
(412, 174, 55),
(413, 174, 58),
(415, 175, 51),
(416, 175, 49),
(419, 177, 54),
(420, 177, 57),
(422, 178, 50),
(423, 178, 52),
(427, 180, 50),
(428, 180, 52),
(431, 181, 49),
(432, 181, 51),
(433, 181, 54),
(434, 181, 57),
(435, 182, 50),
(436, 182, 52),
(441, 183, 54),
(447, 185, 4),
(451, 187, 51),
(459, 189, 4),
(463, 190, 50),
(466, 190, 58),
(482, 194, 58),
(486, 196, 5),
(490, 197, 51),
(491, 197, 49),
(498, 200, 50),
(499, 200, 52),
(500, 200, 58),
(506, 202, 50),
(507, 202, 52),
(508, 202, 58),
(510, 203, 49),
(511, 203, 54),
(513, 203, 57),
(514, 204, 52),
(515, 204, 55),
(516, 204, 58),
(520, 205, 51),
(521, 205, 49),
(527, 207, 51),
(529, 207, 57),
(530, 31, 33),
(531, 31, 34),
(532, 31, 35),
(533, 32, 33),
(534, 32, 34),
(535, 32, 35),
(536, 33, 31),
(537, 33, 7),
(538, 33, 35),
(539, 7, 34),
(540, 7, 32),
(541, 7, 35),
(542, 34, 32),
(543, 35, 33),
(544, 35, 32),
(545, 37, 32),
(546, 37, 33),
(547, 37, 7),
(548, 38, 31),
(549, 38, 7),
(550, 39, 33),
(551, 39, 34),
(552, 40, 32),
(553, 40, 31),
(554, 41, 32),
(555, 41, 33),
(556, 41, 34),
(557, 42, 32),
(558, 42, 33),
(559, 42, 34),
(560, 44, 32),
(561, 44, 31),
(562, 44, 33),
(563, 44, 34),
(564, 45, 32),
(565, 45, 7),
(566, 45, 33),
(567, 46, 32),
(568, 46, 33),
(569, 208, 51),
(570, 208, 49),
(571, 208, 54),
(573, 210, 51),
(574, 210, 54),
(575, 210, 57),
(576, 210, 61),
(577, 211, 54),
(578, 211, 57),
(579, 211, 61),
(580, 211, 51),
(581, 207, 206),
(582, 207, 205),
(583, 207, 204),
(584, 205, 204),
(585, 205, 206),
(586, 205, 207),
(587, 206, 204),
(588, 206, 205),
(589, 206, 207),
(590, 204, 205),
(591, 204, 206),
(592, 204, 207),
(593, 203, 202),
(594, 203, 51),
(595, 202, 203),
(596, 201, 200),
(597, 201, 52),
(598, 201, 55),
(599, 201, 58),
(600, 200, 201),
(601, 199, 198),
(602, 199, 52),
(603, 199, 50),
(604, 199, 58),
(605, 199, 55),
(606, 197, 196),
(607, 197, 50),
(608, 189, 186),
(609, 189, 187),
(610, 189, 188),
(611, 188, 187),
(612, 188, 186),
(613, 188, 189),
(614, 188, 51),
(615, 195, 58),
(616, 195, 59),
(617, 195, 67),
(618, 195, 68),
(619, 195, 194),
(620, 194, 59),
(621, 194, 67),
(622, 194, 68),
(623, 194, 195),
(624, 196, 197),
(625, 196, 51),
(626, 193, 190),
(627, 193, 191),
(628, 193, 192),
(629, 192, 190),
(630, 192, 191),
(631, 192, 193),
(632, 191, 190),
(633, 191, 192),
(634, 191, 193),
(635, 191, 49),
(636, 190, 191),
(637, 190, 192),
(638, 190, 193),
(639, 186, 187),
(640, 186, 188),
(641, 186, 189),
(642, 185, 182),
(643, 185, 183),
(644, 185, 184),
(645, 184, 182),
(646, 184, 183),
(647, 184, 185),
(648, 183, 184),
(649, 183, 185),
(650, 183, 182),
(651, 182, 183),
(652, 182, 184),
(653, 182, 185),
(654, 198, 199),
(655, 180, 49),
(656, 180, 179),
(657, 179, 153),
(659, 179, 49),
(660, 178, 158),
(661, 178, 159),
(662, 177, 176),
(663, 177, 49),
(664, 176, 177),
(665, 176, 55),
(666, 176, 52),
(667, 176, 58),
(668, 175, 174),
(669, 175, 50),
(670, 174, 175),
(671, 173, 172),
(672, 173, 51),
(673, 173, 71),
(674, 173, 154),
(675, 172, 173),
(676, 172, 63),
(677, 171, 170),
(678, 171, 168),
(679, 171, 169),
(680, 170, 171),
(681, 169, 168),
(682, 167, 165),
(683, 167, 164),
(684, 167, 166),
(685, 166, 164),
(686, 166, 165),
(687, 166, 167),
(688, 166, 49),
(689, 165, 164),
(690, 165, 166),
(691, 165, 167),
(692, 164, 165),
(693, 164, 166),
(694, 164, 167),
(695, 163, 162),
(696, 162, 161),
(697, 162, 163),
(698, 161, 163),
(699, 161, 162),
(700, 160, 5),
(701, 160, 49),
(702, 160, 57),
(703, 159, 158),
(704, 159, 175),
(705, 159, 120),
(706, 158, 159),
(707, 158, 175),
(708, 158, 160),
(709, 157, 156),
(710, 156, 157),
(711, 153, 49),
(712, 153, 179),
(713, 153, 180),
(714, 154, 78),
(715, 151, 139),
(716, 151, 140),
(717, 151, 150),
(718, 150, 139),
(719, 150, 140),
(720, 150, 151),
(721, 148, 117),
(722, 148, 118),
(723, 148, 119),
(724, 148, 120),
(725, 148, 121),
(726, 147, 145),
(727, 147, 146),
(728, 146, 145),
(729, 146, 147),
(730, 145, 146),
(731, 145, 147),
(732, 144, 142),
(733, 144, 143),
(734, 144, 152),
(735, 143, 144),
(736, 143, 152),
(737, 143, 142),
(738, 143, 49),
(739, 142, 143),
(740, 142, 144),
(741, 142, 152),
(742, 142, 50),
(743, 140, 139),
(744, 140, 150),
(745, 140, 151),
(746, 140, 4),
(747, 139, 140),
(748, 139, 150),
(749, 139, 151),
(750, 136, 134),
(751, 136, 135),
(752, 136, 138),
(753, 136, 149),
(754, 129, 128),
(755, 129, 130),
(756, 129, 131),
(757, 130, 128),
(758, 130, 129),
(759, 130, 131),
(760, 130, 50),
(761, 128, 129),
(762, 128, 130),
(763, 128, 131),
(764, 128, 67),
(765, 131, 128),
(766, 131, 129),
(767, 131, 130),
(768, 131, 52),
(769, 127, 125),
(770, 127, 126),
(771, 127, 148),
(772, 127, 118),
(773, 126, 125),
(774, 126, 127),
(775, 126, 148),
(776, 125, 126),
(777, 125, 127),
(778, 125, 148),
(779, 125, 120),
(780, 124, 121),
(781, 124, 122),
(782, 124, 123),
(783, 123, 121),
(784, 123, 122),
(785, 123, 124),
(786, 122, 121),
(787, 122, 123),
(788, 122, 124),
(789, 122, 54),
(790, 121, 122),
(791, 121, 123),
(792, 121, 124),
(793, 121, 57),
(794, 120, 117),
(795, 120, 118),
(796, 120, 119),
(797, 120, 51),
(798, 119, 117),
(799, 119, 118),
(800, 119, 120),
(801, 119, 4),
(802, 118, 117),
(803, 118, 119),
(804, 118, 120),
(805, 118, 148),
(806, 117, 118),
(807, 117, 119),
(808, 117, 120),
(809, 116, 108),
(810, 115, 112),
(811, 114, 108),
(812, 114, 115),
(813, 114, 116),
(814, 114, 4),
(815, 113, 108),
(816, 113, 109),
(817, 112, 111),
(818, 112, 113),
(819, 112, 110),
(820, 112, 108),
(821, 111, 112),
(822, 111, 113),
(823, 111, 110),
(824, 111, 109),
(825, 111, 108),
(826, 110, 108),
(827, 110, 109),
(828, 110, 116),
(829, 109, 108),
(830, 109, 110),
(831, 109, 111),
(832, 108, 109),
(833, 108, 110),
(834, 108, 111),
(835, 78, 154),
(836, 77, 74),
(837, 77, 75),
(838, 77, 76),
(839, 76, 74),
(840, 76, 75),
(841, 76, 77),
(842, 75, 74),
(843, 75, 76),
(844, 75, 77),
(845, 74, 75),
(846, 74, 76),
(847, 74, 77),
(848, 74, 50),
(849, 73, 70),
(850, 73, 71),
(851, 73, 72),
(852, 72, 70),
(853, 72, 71),
(854, 72, 73),
(855, 71, 70),
(856, 71, 72),
(857, 71, 73),
(858, 70, 71),
(859, 70, 72),
(860, 70, 73),
(861, 70, 55),
(862, 68, 58),
(863, 68, 59),
(864, 68, 67),
(865, 68, 194),
(866, 68, 195),
(867, 154, 49),
(868, 67, 58),
(869, 67, 59),
(870, 67, 68),
(871, 67, 194),
(872, 67, 195),
(873, 66, 62),
(874, 66, 63),
(875, 66, 65),
(876, 66, 51),
(877, 65, 62),
(878, 65, 63),
(879, 65, 66),
(880, 63, 62),
(881, 63, 65),
(882, 63, 66),
(883, 63, 52),
(884, 62, 63),
(885, 62, 65),
(886, 62, 66),
(887, 62, 52),
(888, 61, 60),
(889, 61, 55),
(890, 60, 61),
(891, 59, 58),
(892, 59, 67),
(893, 59, 68),
(894, 59, 194),
(895, 59, 195),
(896, 58, 67),
(897, 58, 59),
(898, 58, 68),
(899, 58, 194),
(900, 58, 195),
(901, 57, 58),
(902, 57, 59),
(903, 57, 67),
(904, 57, 68),
(905, 57, 194),
(906, 55, 57),
(907, 54, 52),
(908, 54, 50),
(909, 52, 54),
(910, 51, 50),
(911, 51, 52),
(912, 51, 63),
(913, 50, 51),
(914, 50, 54),
(915, 50, 57),
(916, 50, 61),
(917, 49, 179),
(918, 187, 186),
(919, 187, 188),
(920, 187, 189),
(921, 167, 57),
(922, 149, 134),
(924, 214, 212),
(926, 215, 214),
(928, 216, 215),
(929, 216, 214),
(931, 217, 216),
(932, 217, 213),
(933, 217, 215),
(934, 217, 214),
(935, 214, 217),
(937, 212, 217),
(938, 212, 213),
(939, 212, 214),
(940, 212, 215),
(941, 212, 216),
(942, 213, 214),
(943, 213, 215),
(944, 213, 216),
(945, 213, 217),
(946, 214, 215),
(947, 214, 213),
(948, 215, 216),
(949, 215, 217),
(950, 216, 217),
(951, 208, 57),
(952, 208, 209),
(953, 208, 210),
(954, 613, 6);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_tags`
--

CREATE TABLE `ec_product_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_tags`
--

INSERT INTO `ec_product_tags` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(19, 'Citrusy', '', 'published', '2021-01-12 14:50:15', '2021-01-12 14:50:15'),
(20, 'Fruity', '', 'published', '2021-01-12 14:50:59', '2021-01-12 14:50:59'),
(21, 'Veggie and Nuty', '', 'published', '2021-01-12 15:35:34', '2021-01-12 15:35:34'),
(22, 'Flowery', '', 'published', '2021-01-19 22:09:19', '2021-01-19 22:09:19'),
(23, 'Greens and Herbs', '', 'published', '2021-01-19 22:10:48', '2021-01-19 22:10:48'),
(24, 'Spicy', '', 'published', '2021-01-19 22:12:17', '2021-01-19 22:12:17'),
(25, 'Sweets an Gourmand', '', 'published', '2021-01-19 22:13:06', '2021-01-19 22:13:06'),
(26, 'Woody', '', 'published', '2021-01-19 22:14:25', '2021-01-19 22:14:25'),
(27, 'Resins and Balsams', '', 'published', '2021-01-19 22:17:35', '2021-01-19 22:17:35'),
(28, 'Beverage', '', 'published', '2021-01-19 22:21:56', '2021-01-19 22:21:56'),
(29, 'Natural and Synthetic', '', 'published', '2021-01-19 22:23:22', '2021-01-19 22:23:22'),
(30, 'Popular and weird', '', 'published', '2021-01-19 22:24:28', '2021-01-19 22:24:28');

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_tag_product`
--

CREATE TABLE `ec_product_tag_product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_tag_product`
--

INSERT INTO `ec_product_tag_product` (`product_id`, `tag_id`) VALUES
(1, 1),
(1, 3),
(1, 6),
(2, 1),
(2, 5),
(3, 3),
(3, 4),
(3, 5),
(4, 2),
(4, 3),
(4, 4),
(5, 3),
(5, 5),
(6, 2),
(6, 6),
(7, 1),
(8, 1),
(8, 4),
(8, 6),
(9, 1),
(9, 5),
(14, 4),
(14, 6),
(16, 1),
(16, 4),
(16, 6),
(19, 1),
(19, 5),
(19, 6),
(23, 3),
(23, 5),
(24, 1),
(24, 4),
(24, 5),
(29, 1),
(29, 2),
(29, 3),
(30, 1),
(30, 2),
(30, 6),
(34, 1),
(35, 1),
(35, 8),
(36, 8),
(37, 8),
(39, 8),
(40, 26),
(41, 8),
(42, 8),
(43, 8),
(44, 8),
(45, 8),
(46, 27),
(47, 8),
(48, 8),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(58, 6),
(59, 1),
(60, 1),
(60, 5),
(61, 1),
(62, 1),
(65, 1),
(66, 1),
(67, 5),
(67, 6),
(68, 1),
(69, 5),
(70, 1),
(71, 1),
(72, 22),
(73, 1),
(74, 1),
(74, 5),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(78, 6),
(81, 9),
(82, 9),
(83, 9),
(84, 9),
(85, 9),
(86, 9),
(87, 9),
(88, 9),
(89, 10),
(90, 9),
(91, 9),
(92, 9),
(93, 9),
(94, 9),
(95, 9),
(96, 11),
(99, 1),
(100, 1),
(101, 12),
(103, 13),
(106, 14),
(107, 14),
(108, 5),
(111, 6),
(116, 15),
(117, 5),
(118, 16),
(119, 16),
(120, 16),
(121, 5),
(122, 16),
(123, 16),
(124, 16),
(126, 16),
(127, 16),
(128, 5),
(128, 17),
(129, 16),
(130, 16),
(135, 16),
(137, 13),
(138, 18),
(139, 16),
(140, 16),
(143, 16),
(145, 16),
(146, 16),
(147, 16),
(193, 22),
(202, 20);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_up_sale_relations`
--

CREATE TABLE `ec_product_up_sale_relations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_product_id` int(10) UNSIGNED NOT NULL,
  `to_product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_variations`
--

CREATE TABLE `ec_product_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `configurable_product_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_variations`
--

INSERT INTO `ec_product_variations` (`id`, `product_id`, `configurable_product_id`, `is_default`) VALUES
(8, 16, 4, 1),
(15, 23, 6, 1),
(19, 27, 7, 1),
(25, 221, 220, 1),
(26, 222, 220, 0),
(27, 223, 220, 0),
(28, 224, 220, 0),
(29, 225, 220, 0),
(30, 226, 220, 0),
(31, 227, 220, 0),
(32, 228, 220, 0),
(33, 229, 220, 0),
(34, 230, 220, 0),
(35, 231, 220, 0),
(36, 232, 220, 0),
(37, 233, 220, 0),
(38, 234, 220, 0),
(39, 235, 220, 0),
(40, 236, 220, 0),
(41, 237, 220, 0),
(42, 238, 220, 0),
(43, 239, 220, 0),
(44, 240, 220, 0),
(45, 241, 220, 0),
(46, 242, 220, 0),
(47, 243, 220, 0),
(48, 244, 220, 0),
(49, 245, 220, 0),
(50, 246, 220, 0),
(51, 247, 220, 0),
(52, 248, 220, 0),
(53, 249, 220, 0),
(54, 250, 220, 0),
(55, 251, 220, 0),
(56, 252, 220, 0),
(57, 253, 220, 0),
(58, 254, 220, 0),
(59, 255, 220, 0),
(60, 256, 220, 0),
(61, 257, 220, 0),
(62, 258, 220, 0),
(63, 259, 220, 0),
(64, 260, 220, 0),
(65, 261, 220, 0),
(66, 262, 220, 0),
(67, 263, 220, 0),
(68, 264, 220, 0),
(69, 265, 220, 0),
(70, 266, 220, 0),
(71, 267, 220, 0),
(72, 268, 220, 0),
(76, 272, 269, 1),
(77, 273, 269, 0),
(79, 274, 269, 0),
(80, 275, 269, 0),
(81, 276, 269, 0),
(82, 277, 269, 0),
(83, 278, 269, 0),
(84, 279, 269, 0),
(85, 280, 269, 0),
(86, 281, 269, 0),
(87, 282, 269, 0),
(88, 283, 269, 0),
(89, 284, 269, 0),
(90, 285, 269, 0),
(91, 286, 269, 0),
(92, 287, 269, 0),
(93, 288, 269, 0),
(94, 289, 269, 0),
(95, 290, 269, 0),
(96, 291, 269, 0),
(97, 292, 269, 0),
(98, 293, 269, 0),
(99, 294, 269, 0),
(100, 295, 269, 0),
(101, 296, 269, 0),
(102, 297, 269, 0),
(103, 298, 269, 0),
(104, 299, 269, 0),
(105, 300, 269, 0),
(106, 301, 269, 0),
(107, 302, 269, 0),
(108, 303, 269, 0),
(109, 304, 269, 0),
(110, 305, 269, 0),
(111, 306, 269, 0),
(112, 307, 269, 0),
(113, 308, 269, 0),
(114, 309, 269, 0),
(115, 310, 269, 0),
(116, 311, 269, 0),
(117, 312, 269, 0),
(118, 313, 269, 0),
(119, 314, 269, 0),
(120, 315, 269, 0),
(121, 316, 269, 0),
(122, 317, 269, 0),
(123, 318, 269, 0),
(124, 320, 319, 1),
(125, 321, 319, 0),
(126, 322, 319, 0),
(127, 323, 319, 0),
(128, 324, 319, 0),
(129, 325, 319, 0),
(130, 326, 319, 0),
(131, 327, 319, 0),
(132, 328, 319, 0),
(133, 329, 319, 0),
(134, 330, 319, 0),
(135, 331, 319, 0),
(136, 332, 319, 0),
(137, 333, 319, 0),
(140, 334, 319, 0),
(141, 335, 319, 0),
(142, 336, 319, 0),
(143, 337, 319, 0),
(144, 338, 319, 0),
(145, 339, 319, 0),
(146, 340, 319, 0),
(147, 341, 319, 0),
(148, 342, 319, 0),
(149, 343, 319, 0),
(150, 344, 319, 0),
(151, 345, 319, 0),
(152, 346, 319, 0),
(153, 347, 319, 0),
(154, 348, 319, 0),
(155, 349, 319, 0),
(156, 350, 319, 0),
(157, 351, 319, 0),
(158, 352, 319, 0),
(159, 353, 319, 0),
(160, 354, 319, 0),
(161, 355, 319, 0),
(162, 356, 319, 0),
(163, 357, 319, 0),
(164, 358, 319, 0),
(165, 359, 319, 0),
(166, 360, 319, 0),
(167, 361, 319, 0),
(168, 362, 319, 0),
(169, 363, 319, 0),
(170, 364, 319, 0),
(171, 365, 319, 0),
(172, 366, 319, 0),
(173, 367, 208, 1),
(174, 368, 208, 0),
(175, 369, 208, 0),
(176, 370, 208, 0),
(177, 371, 208, 0),
(178, 372, 208, 0),
(179, 373, 208, 0),
(180, 374, 208, 0),
(181, 375, 208, 0),
(182, 376, 208, 0),
(183, 377, 208, 0),
(184, 378, 208, 0),
(185, 379, 208, 0),
(186, 380, 208, 0),
(187, 381, 208, 0),
(188, 382, 208, 0),
(189, 383, 208, 0),
(190, 384, 208, 0),
(191, 385, 208, 0),
(192, 386, 208, 0),
(193, 387, 208, 0),
(194, 388, 208, 0),
(195, 389, 208, 0),
(196, 390, 208, 0),
(197, 391, 208, 0),
(198, 392, 208, 0),
(199, 393, 208, 0),
(200, 394, 208, 0),
(201, 395, 208, 0),
(202, 396, 208, 0),
(203, 397, 208, 0),
(204, 398, 208, 0),
(205, 399, 208, 0),
(206, 400, 208, 0),
(207, 401, 208, 0),
(208, 402, 208, 0),
(209, 403, 208, 0),
(210, 404, 208, 0),
(211, 405, 208, 0),
(212, 406, 208, 0),
(213, 407, 208, 0),
(214, 408, 208, 0),
(215, 409, 208, 0),
(216, 410, 208, 0),
(217, 411, 208, 0),
(218, 412, 208, 0),
(219, 413, 208, 0),
(221, 414, 217, 1),
(222, 415, 217, 0),
(223, 416, 217, 0),
(224, 417, 217, 0),
(225, 418, 217, 0),
(226, 419, 217, 0),
(227, 420, 217, 0),
(228, 421, 217, 0),
(229, 422, 217, 0),
(230, 423, 217, 0),
(231, 424, 217, 0),
(232, 425, 217, 0),
(233, 426, 217, 0),
(234, 427, 217, 0),
(235, 428, 217, 0),
(236, 429, 217, 0),
(237, 430, 217, 0),
(238, 431, 217, 0),
(239, 432, 217, 0),
(240, 433, 217, 0),
(241, 434, 217, 0),
(242, 435, 217, 0),
(243, 436, 217, 0),
(245, 438, 213, 1),
(246, 439, 213, 0),
(247, 440, 213, 0),
(248, 441, 213, 0),
(249, 442, 213, 0),
(250, 443, 213, 0),
(251, 444, 213, 0),
(252, 445, 213, 0),
(253, 446, 213, 0),
(254, 447, 213, 0),
(255, 448, 213, 0),
(256, 449, 213, 0),
(257, 450, 213, 0),
(258, 451, 213, 0),
(259, 452, 213, 0),
(260, 453, 213, 0),
(261, 454, 213, 0),
(262, 455, 213, 0),
(263, 456, 213, 0),
(264, 457, 213, 0),
(265, 458, 213, 0),
(266, 459, 213, 0),
(267, 460, 213, 0),
(268, 461, 213, 0),
(269, 462, 216, 1),
(271, 463, 216, 0),
(272, 464, 216, 0),
(273, 465, 216, 0),
(274, 466, 216, 0),
(275, 467, 216, 0),
(276, 468, 216, 0),
(277, 469, 216, 0),
(278, 470, 216, 0),
(279, 471, 216, 0),
(280, 472, 216, 0),
(281, 473, 216, 0),
(282, 474, 216, 0),
(283, 475, 216, 0),
(284, 476, 216, 0),
(285, 477, 216, 0),
(286, 478, 216, 0),
(287, 479, 216, 0),
(288, 480, 216, 0),
(289, 481, 216, 0),
(290, 482, 216, 0),
(292, 484, 215, 1),
(293, 485, 215, 0),
(294, 486, 215, 0),
(295, 487, 215, 0),
(296, 488, 215, 0),
(297, 489, 215, 0),
(298, 490, 215, 0),
(299, 491, 215, 0),
(300, 492, 215, 0),
(301, 493, 215, 0),
(302, 494, 215, 0),
(303, 495, 215, 0),
(304, 496, 215, 0),
(305, 497, 215, 0),
(306, 498, 215, 0),
(307, 499, 215, 0),
(308, 500, 215, 0),
(309, 501, 215, 0),
(310, 502, 215, 0),
(311, 503, 215, 0),
(312, 504, 215, 0),
(313, 505, 215, 0),
(314, 506, 215, 0),
(315, 507, 215, 0),
(316, 508, 214, 1),
(317, 509, 214, 0),
(318, 510, 214, 0),
(319, 511, 214, 0),
(320, 512, 214, 0),
(321, 513, 214, 0),
(322, 514, 214, 0),
(323, 515, 214, 0),
(324, 516, 214, 0),
(325, 517, 214, 0),
(326, 518, 214, 0),
(327, 519, 214, 0),
(328, 520, 214, 0),
(329, 521, 214, 0),
(330, 522, 214, 0),
(331, 523, 214, 0),
(332, 524, 214, 0),
(333, 525, 214, 0),
(334, 526, 214, 0),
(335, 527, 214, 0),
(336, 528, 214, 0),
(337, 529, 214, 0),
(338, 530, 212, 1),
(339, 531, 212, 0),
(340, 532, 212, 0),
(341, 533, 212, 0),
(342, 534, 212, 0),
(343, 535, 212, 0),
(344, 536, 212, 0),
(345, 537, 212, 0),
(346, 538, 212, 0),
(347, 539, 212, 0),
(348, 540, 212, 0),
(349, 541, 212, 0),
(350, 542, 212, 0),
(351, 543, 212, 0),
(352, 544, 212, 0),
(353, 545, 212, 0),
(354, 546, 212, 0),
(355, 547, 212, 0),
(356, 548, 212, 0),
(357, 549, 212, 0),
(358, 550, 212, 0),
(359, 551, 212, 0),
(360, 552, 212, 0),
(361, 553, 212, 0),
(364, 554, 211, 1),
(365, 555, 211, 0),
(366, 556, 211, 0),
(367, 557, 211, 0),
(368, 558, 211, 0),
(369, 559, 211, 0),
(370, 560, 211, 0),
(371, 561, 211, 0),
(372, 562, 211, 0),
(373, 563, 211, 0),
(374, 564, 211, 0),
(375, 565, 211, 0),
(376, 566, 211, 0),
(377, 567, 211, 0),
(378, 568, 211, 0),
(379, 569, 211, 0),
(380, 570, 211, 0),
(381, 571, 211, 0),
(382, 572, 211, 0),
(383, 573, 211, 0),
(384, 574, 211, 0),
(385, 575, 211, 0),
(386, 576, 211, 0),
(387, 577, 211, 0),
(388, 578, 211, 0),
(389, 579, 211, 0),
(390, 580, 211, 0),
(391, 581, 211, 0),
(392, 582, 211, 0),
(393, 583, 211, 0),
(394, 584, 211, 0),
(395, 585, 211, 0),
(396, 586, 211, 0),
(397, 587, 211, 0),
(398, 588, 211, 0),
(399, 589, 211, 0),
(400, 590, 211, 0),
(401, 591, 211, 0),
(402, 592, 211, 0),
(403, 593, 211, 0),
(404, 594, 211, 0),
(405, 595, 211, 0),
(406, 596, 211, 0),
(407, 597, 211, 0),
(408, 598, 211, 0),
(409, 599, 211, 0),
(410, 600, 211, 0),
(413, 601, 216, 0),
(418, 603, 602, 1),
(419, 604, 602, 0),
(420, 605, 602, 0),
(421, 606, 602, 0),
(422, 607, 602, 0),
(433, 612, 217, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_variation_items`
--

CREATE TABLE `ec_product_variation_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_variation_items`
--

INSERT INTO `ec_product_variation_items` (`id`, `attribute_id`, `variation_id`) VALUES
(15, 2, 8),
(16, 7, 8),
(29, 2, 15),
(30, 9, 15),
(48, 13, 25),
(49, 13, 25),
(50, 14, 26),
(51, 15, 27),
(52, 13, 28),
(53, 17, 29),
(54, 18, 30),
(55, 16, 31),
(56, 19, 32),
(57, 20, 33),
(58, 21, 34),
(59, 22, 35),
(60, 23, 36),
(61, 24, 37),
(62, 25, 38),
(63, 26, 39),
(64, 27, 40),
(65, 28, 41),
(66, 29, 42),
(67, 30, 43),
(68, 31, 44),
(69, 32, 45),
(70, 33, 46),
(71, 34, 47),
(72, 36, 48),
(73, 37, 49),
(74, 38, 50),
(75, 39, 51),
(76, 40, 52),
(77, 41, 53),
(78, 42, 54),
(79, 43, 55),
(80, 44, 56),
(81, 45, 57),
(82, 46, 58),
(83, 47, 59),
(84, 48, 60),
(85, 49, 61),
(86, 50, 62),
(87, 51, 63),
(88, 52, 64),
(89, 53, 65),
(90, 54, 66),
(91, 55, 67),
(92, 56, 68),
(93, 57, 69),
(94, 58, 70),
(95, 59, 71),
(96, 35, 72),
(102, 13, 76),
(103, 13, 76),
(106, 14, 77),
(107, 15, 79),
(108, 16, 80),
(109, 17, 81),
(110, 18, 82),
(111, 19, 83),
(112, 20, 84),
(113, 21, 85),
(114, 22, 86),
(115, 23, 87),
(116, 24, 88),
(117, 25, 89),
(118, 26, 90),
(119, 27, 91),
(120, 28, 92),
(121, 29, 93),
(122, 30, 94),
(123, 31, 95),
(124, 32, 96),
(125, 33, 97),
(126, 34, 98),
(127, 35, 99),
(128, 36, 100),
(129, 37, 101),
(130, 38, 102),
(131, 39, 103),
(132, 40, 104),
(133, 41, 105),
(134, 42, 106),
(135, 43, 107),
(136, 44, 108),
(137, 45, 109),
(138, 46, 110),
(139, 47, 111),
(140, 48, 112),
(141, 49, 113),
(142, 51, 114),
(143, 52, 115),
(144, 53, 116),
(145, 54, 117),
(146, 55, 118),
(147, 56, 119),
(148, 57, 120),
(149, 58, 121),
(150, 59, 122),
(151, 50, 123),
(153, 14, 125),
(154, 15, 126),
(155, 16, 127),
(156, 17, 128),
(157, 18, 129),
(158, 19, 130),
(159, 20, 131),
(160, 21, 132),
(161, 22, 133),
(162, 23, 134),
(163, 24, 135),
(164, 25, 136),
(165, 26, 137),
(169, 13, 124),
(170, 27, 140),
(171, 28, 141),
(172, 30, 142),
(173, 33, 143),
(174, 31, 144),
(175, 32, 145),
(176, 34, 146),
(177, 35, 147),
(178, 36, 148),
(179, 37, 149),
(180, 38, 150),
(181, 39, 151),
(182, 40, 152),
(183, 41, 153),
(184, 42, 154),
(185, 43, 155),
(186, 44, 156),
(187, 45, 157),
(188, 46, 158),
(189, 47, 159),
(190, 48, 160),
(191, 49, 161),
(192, 50, 162),
(193, 51, 163),
(194, 52, 164),
(195, 53, 165),
(196, 54, 166),
(197, 55, 167),
(198, 56, 168),
(199, 57, 169),
(200, 58, 170),
(201, 59, 171),
(202, 29, 172),
(203, 13, 173),
(204, 13, 173),
(205, 14, 174),
(206, 15, 175),
(207, 16, 176),
(208, 17, 177),
(209, 18, 178),
(210, 19, 179),
(211, 20, 180),
(212, 21, 181),
(213, 22, 182),
(214, 23, 183),
(215, 24, 184),
(216, 25, 185),
(217, 26, 186),
(218, 27, 187),
(219, 28, 188),
(220, 29, 189),
(221, 30, 190),
(222, 31, 191),
(223, 32, 192),
(224, 33, 193),
(225, 34, 194),
(226, 35, 195),
(227, 36, 196),
(228, 37, 197),
(229, 38, 198),
(230, 39, 199),
(231, 40, 200),
(232, 41, 201),
(233, 42, 202),
(234, 43, 203),
(235, 44, 204),
(236, 45, 205),
(237, 46, 206),
(238, 47, 207),
(239, 48, 208),
(240, 49, 209),
(241, 50, 210),
(242, 51, 211),
(243, 52, 212),
(244, 53, 213),
(245, 54, 214),
(246, 55, 215),
(247, 56, 216),
(248, 57, 217),
(249, 58, 218),
(250, 59, 219),
(252, 11, 221),
(253, 11, 221),
(254, 12, 222),
(255, 60, 223),
(256, 61, 224),
(257, 62, 225),
(258, 63, 226),
(259, 64, 227),
(260, 65, 228),
(261, 66, 229),
(262, 67, 230),
(263, 68, 231),
(264, 69, 232),
(265, 70, 233),
(266, 71, 234),
(267, 72, 235),
(268, 73, 236),
(269, 74, 237),
(270, 75, 238),
(271, 76, 239),
(272, 77, 240),
(273, 78, 241),
(274, 79, 242),
(275, 80, 243),
(277, 11, 245),
(278, 11, 245),
(279, 12, 246),
(280, 60, 247),
(281, 61, 248),
(282, 62, 249),
(283, 63, 250),
(284, 64, 251),
(285, 65, 252),
(286, 66, 253),
(287, 67, 254),
(288, 68, 255),
(289, 69, 256),
(290, 70, 257),
(291, 71, 258),
(292, 72, 259),
(293, 73, 260),
(294, 74, 261),
(295, 75, 262),
(296, 76, 263),
(297, 77, 264),
(298, 78, 265),
(299, 79, 266),
(300, 80, 267),
(301, 81, 268),
(305, 11, 269),
(306, 12, 271),
(307, 60, 272),
(308, 61, 273),
(309, 62, 274),
(310, 63, 275),
(311, 64, 276),
(312, 65, 277),
(313, 66, 278),
(314, 67, 279),
(315, 68, 280),
(316, 69, 281),
(317, 70, 282),
(318, 71, 283),
(319, 72, 284),
(320, 73, 285),
(321, 74, 286),
(322, 77, 287),
(323, 78, 288),
(324, 79, 289),
(325, 80, 290),
(327, 11, 292),
(328, 11, 292),
(329, 12, 293),
(330, 60, 294),
(331, 61, 295),
(332, 62, 296),
(333, 63, 297),
(334, 64, 298),
(335, 65, 299),
(336, 66, 300),
(337, 67, 301),
(338, 68, 302),
(339, 69, 303),
(340, 70, 304),
(341, 71, 305),
(342, 72, 306),
(343, 73, 307),
(344, 74, 308),
(345, 75, 309),
(346, 76, 310),
(347, 77, 311),
(348, 78, 312),
(349, 79, 313),
(350, 80, 314),
(351, 81, 315),
(352, 11, 316),
(353, 11, 316),
(354, 12, 317),
(355, 60, 318),
(356, 61, 319),
(357, 62, 320),
(358, 63, 321),
(359, 64, 322),
(360, 65, 323),
(361, 66, 324),
(362, 67, 325),
(363, 68, 326),
(364, 71, 327),
(365, 72, 328),
(366, 73, 329),
(367, 74, 330),
(368, 75, 331),
(369, 76, 332),
(370, 77, 333),
(371, 78, 334),
(372, 79, 335),
(373, 80, 336),
(374, 81, 337),
(375, 11, 338),
(376, 11, 338),
(377, 12, 339),
(378, 60, 340),
(379, 61, 341),
(380, 62, 342),
(381, 63, 343),
(382, 64, 344),
(383, 65, 345),
(384, 66, 346),
(385, 67, 347),
(386, 68, 348),
(387, 69, 349),
(388, 70, 350),
(389, 71, 351),
(390, 72, 352),
(391, 73, 353),
(392, 74, 354),
(393, 75, 355),
(394, 76, 356),
(395, 77, 357),
(396, 78, 358),
(397, 79, 359),
(398, 80, 360),
(399, 81, 361),
(402, 13, 364),
(403, 13, 364),
(404, 14, 365),
(405, 15, 366),
(406, 16, 367),
(407, 17, 368),
(408, 18, 369),
(409, 19, 370),
(410, 20, 371),
(411, 21, 372),
(412, 22, 373),
(413, 23, 374),
(414, 24, 375),
(415, 25, 376),
(416, 26, 377),
(417, 27, 378),
(418, 28, 379),
(419, 29, 380),
(420, 30, 381),
(421, 31, 382),
(422, 32, 383),
(423, 33, 384),
(424, 34, 385),
(425, 35, 386),
(426, 36, 387),
(427, 37, 388),
(428, 38, 389),
(429, 39, 390),
(430, 40, 391),
(431, 41, 392),
(432, 42, 393),
(433, 43, 394),
(434, 44, 395),
(435, 45, 396),
(436, 46, 397),
(437, 47, 398),
(438, 48, 399),
(439, 49, 400),
(440, 50, 401),
(441, 51, 402),
(442, 52, 403),
(443, 53, 404),
(444, 54, 405),
(445, 55, 406),
(446, 56, 407),
(447, 57, 408),
(448, 58, 409),
(449, 59, 410),
(452, 81, 413),
(457, 82, 418),
(458, 82, 418),
(459, 83, 419),
(460, 84, 420),
(461, 85, 421),
(462, 86, 422),
(476, 81, 433);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_with_attribute`
--

CREATE TABLE `ec_product_with_attribute` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_with_attribute`
--

INSERT INTO `ec_product_with_attribute` (`id`, `attribute_id`, `product_id`) VALUES
(7, 3, 4),
(8, 6, 4),
(11, 4, 6),
(12, 8, 6),
(64, 13, 319),
(65, 14, 319),
(66, 15, 319),
(67, 16, 319),
(68, 17, 319),
(69, 18, 319),
(70, 19, 319),
(71, 20, 319),
(72, 21, 319),
(73, 22, 319),
(74, 23, 319),
(75, 24, 319),
(76, 25, 319),
(77, 26, 319),
(78, 27, 319),
(79, 28, 319),
(80, 29, 319),
(81, 30, 319),
(82, 31, 319),
(83, 32, 319),
(84, 33, 319),
(85, 34, 319),
(86, 35, 319),
(87, 36, 319),
(88, 37, 319),
(89, 38, 319),
(90, 39, 319),
(91, 40, 319),
(92, 41, 319),
(93, 42, 319),
(94, 43, 319),
(95, 44, 319),
(96, 45, 319),
(97, 46, 319),
(98, 47, 319),
(99, 48, 319),
(100, 49, 319),
(101, 50, 319),
(102, 51, 319),
(103, 52, 319),
(104, 53, 319),
(105, 54, 319),
(106, 55, 319),
(107, 56, 319),
(108, 57, 319),
(109, 58, 319),
(110, 59, 319),
(111, 11, 216),
(112, 12, 216),
(113, 60, 216),
(114, 61, 216),
(115, 62, 216),
(116, 63, 216),
(117, 64, 216),
(118, 65, 216),
(119, 66, 216),
(120, 67, 216),
(121, 68, 216),
(122, 69, 216),
(123, 70, 216),
(124, 71, 216),
(125, 72, 216),
(126, 73, 216),
(127, 74, 216),
(128, 75, 216),
(129, 76, 216),
(130, 77, 216),
(131, 78, 216),
(132, 79, 216),
(133, 80, 216),
(134, 81, 216);

-- --------------------------------------------------------

--
-- Table structure for table `ec_product_with_attribute_set`
--

CREATE TABLE `ec_product_with_attribute_set` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_set_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_product_with_attribute_set`
--

INSERT INTO `ec_product_with_attribute_set` (`id`, `attribute_set_id`, `product_id`, `order`) VALUES
(7, 1, 4, 0),
(8, 2, 4, 0),
(11, 1, 6, 0),
(12, 2, 6, 0),
(17, 4, 220, 0),
(19, 4, 269, 0),
(20, 4, 319, 0),
(21, 4, 208, 0),
(22, 3, 217, 0),
(23, 3, 213, 0),
(25, 3, 216, 0),
(26, 3, 215, 0),
(27, 3, 214, 0),
(28, 3, 212, 0),
(29, 4, 211, 0),
(30, 5, 602, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ec_reviews`
--

CREATE TABLE `ec_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `star` double(8,2) NOT NULL,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_reviews`
--

INSERT INTO `ec_reviews` (`id`, `customer_id`, `product_id`, `star`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(2, 17, 6, 1.00, 'Rabbit say to.', 'published', '2020-11-07 02:12:45', '2020-11-07 02:12:45'),
(6, 14, 7, 2.00, 'Be off, or I\'ll.', 'published', '2020-11-07 02:12:45', '2020-11-07 02:12:45'),
(10, 20, 6, 3.00, 'She did it so VERY.', 'published', '2020-11-07 02:12:45', '2020-11-07 02:12:45'),
(11, 20, 7, 2.00, 'Mary Ann, and be.', 'published', '2020-11-07 02:12:45', '2020-11-07 02:12:45'),
(17, 15, 5, 5.00, 'Next came the.', 'published', '2020-11-07 02:12:45', '2020-11-07 02:12:45'),
(18, 20, 5, 2.00, 'OURS they had to.', 'published', '2020-11-07 02:12:45', '2020-11-07 02:12:45'),
(22, 13, 6, 2.00, 'Queen, \'Really, my.', 'published', '2020-11-07 02:12:45', '2020-11-07 02:12:45'),
(23, 18, 7, 1.00, 'There\'s no.', 'published', '2020-11-07 02:12:45', '2020-11-07 02:12:45'),
(43, 16, 4, 1.00, 'VERY much out of.', 'published', '2020-11-07 02:12:45', '2020-11-07 02:12:45'),
(46, 19, 4, 4.00, 'Mock Turtle to.', 'published', '2020-11-07 02:12:45', '2020-11-07 02:12:45'),
(49, 19, 5, 4.00, 'IS his business!\'.', 'published', '2020-11-07 02:12:45', '2020-11-07 02:12:45');

-- --------------------------------------------------------

--
-- Table structure for table `ec_shipments`
--

CREATE TABLE `ec_shipments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `weight` double(8,2) DEFAULT '0.00',
  `shipment_id` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cod_amount` decimal(15,2) DEFAULT '0.00',
  `cod_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cross_checking_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `price` decimal(15,2) DEFAULT '0.00',
  `store_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_shipment_histories`
--

CREATE TABLE `ec_shipment_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `shipment_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_shipping`
--

CREATE TABLE `ec_shipping` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_shipping`
--

INSERT INTO `ec_shipping` (`id`, `title`, `country`, `created_at`, `updated_at`) VALUES
(6, 'All', NULL, '2020-06-26 00:20:52', '2020-06-26 00:20:52'),
(9, 'GB', 'GB', '2020-12-29 16:20:43', '2020-12-29 16:20:43'),
(10, 'GH', 'GH', '2021-04-21 00:36:21', '2021-04-21 00:36:21');

-- --------------------------------------------------------

--
-- Table structure for table `ec_shipping_rules`
--

CREATE TABLE `ec_shipping_rules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_id` int(10) UNSIGNED NOT NULL,
  `type` enum('base_on_price','base_on_weight') COLLATE utf8mb4_unicode_ci DEFAULT 'base_on_price',
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `from` decimal(15,2) DEFAULT '0.00',
  `to` decimal(15,2) DEFAULT '0.00',
  `price` decimal(15,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_shipping_rules`
--

INSERT INTO `ec_shipping_rules` (`id`, `name`, `shipping_id`, `type`, `currency_id`, `from`, `to`, `price`, `created_at`, `updated_at`) VALUES
(4, 'Flat rate', 6, 'base_on_price', NULL, '1.00', '0.00', '10.00', '2020-06-26 00:24:35', '2020-06-26 00:38:05'),
(7, 'Delivery', 9, 'base_on_price', NULL, '1.00', '0.00', '10.00', '2020-12-29 16:20:43', '2020-12-29 16:20:43'),
(8, 'Delivery', 10, 'base_on_price', NULL, '1.00', '0.00', '10.00', '2021-04-21 00:36:21', '2021-04-21 00:36:21');

-- --------------------------------------------------------

--
-- Table structure for table `ec_shipping_rule_items`
--

CREATE TABLE `ec_shipping_rule_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shipping_rule_id` int(10) UNSIGNED NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_price` decimal(15,2) DEFAULT '0.00',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_store_locators`
--

CREATE TABLE `ec_store_locators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT '0',
  `is_shipping_location` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_store_locators`
--

INSERT INTO `ec_store_locators` (`id`, `name`, `email`, `phone`, `address`, `country`, `state`, `city`, `is_primary`, `is_shipping_location`, `created_at`, `updated_at`) VALUES
(1, 'Ashley Home + Décor', 'sales@ashleyhdf.co.uk', '+447438944835', 'Grosvenor House,  11 St. Paul’s Square', 'GB', 'Birmingham B3 1RB', 'England', 1, 1, '2020-06-22 07:48:05', '2021-02-11 19:34:36');

-- --------------------------------------------------------

--
-- Table structure for table `ec_taxes`
--

CREATE TABLE `ec_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` double(8,6) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ec_taxes`
--

INSERT INTO `ec_taxes` (`id`, `title`, `percentage`, `priority`, `status`, `created_at`, `updated_at`) VALUES
(1, 'VAT', 10.000000, 1, 'published', '2020-11-07 02:12:41', '2020-11-07 02:12:41');

-- --------------------------------------------------------

--
-- Table structure for table `ec_wish_lists`
--

CREATE TABLE `ec_wish_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_meta`
--

CREATE TABLE `gallery_meta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media_files`
--

CREATE TABLE `media_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_files`
--

INSERT INTO `media_files` (`id`, `user_id`, `name`, `folder_id`, `mime_type`, `size`, `url`, `options`, `created_at`, `updated_at`, `deleted_at`) VALUES
(281, 0, '1', 24, 'image/png', 3509, 'brands/1.png', '[]', '2020-11-07 02:12:20', '2020-11-07 02:12:20', NULL),
(282, 0, '2', 24, 'image/png', 3505, 'brands/2.png', '[]', '2020-11-07 02:12:21', '2020-11-07 02:12:21', NULL),
(283, 0, '3', 24, 'image/png', 2585, 'brands/3.png', '[]', '2020-11-07 02:12:21', '2020-11-07 02:12:21', NULL),
(284, 0, '4', 24, 'image/png', 6427, 'brands/4.png', '[]', '2020-11-07 02:12:21', '2020-11-07 02:12:21', NULL),
(285, 0, '5', 24, 'image/png', 3246, 'brands/5.png', '[]', '2020-11-07 02:12:21', '2020-11-07 02:12:21', NULL),
(286, 0, '6', 24, 'image/png', 3276, 'brands/6.png', '[]', '2020-11-07 02:12:21', '2020-11-07 02:12:21', NULL),
(287, 0, '7', 24, 'image/png', 3120, 'brands/7.png', '[]', '2020-11-07 02:12:21', '2020-11-07 02:12:21', NULL),
(288, 0, '1', 5, 'image/png', 24529, 'product-categories/1.png', '[]', '2020-11-07 02:12:22', '2020-11-25 13:50:09', '2020-11-25 13:50:09'),
(289, 0, '2', 5, 'image/png', 22406, 'product-categories/2.png', '[]', '2020-11-07 02:12:22', '2020-11-07 02:12:22', NULL),
(290, 0, '3', 5, 'image/png', 23795, 'product-categories/3.png', '[]', '2020-11-07 02:12:22', '2020-11-07 02:12:22', NULL),
(291, 0, '4', 5, 'image/png', 29386, 'product-categories/4.png', '[]', '2020-11-07 02:12:22', '2020-11-25 13:50:09', '2020-11-25 13:50:09'),
(292, 0, '5', 5, 'image/png', 28764, 'product-categories/5.png', '[]', '2020-11-07 02:12:23', '2020-11-07 02:12:23', NULL),
(293, 0, '6', 5, 'image/png', 21674, 'product-categories/6.png', '[]', '2020-11-07 02:12:23', '2020-11-07 02:12:23', NULL),
(294, 0, '7', 5, 'image/png', 26121, 'product-categories/7.png', '[]', '2020-11-07 02:12:23', '2020-11-07 02:12:23', NULL),
(295, 0, '1', 8, 'image/jpeg', 134711, 'product-collections/1.jpg', '[]', '2020-11-07 02:12:23', '2021-01-18 03:05:58', '2021-01-18 03:05:58'),
(296, 0, '2', 8, 'image/jpeg', 9190, 'product-collections/2.jpg', '[]', '2020-11-07 02:12:24', '2021-01-18 03:05:58', '2021-01-18 03:05:58'),
(297, 0, '3', 8, 'image/jpeg', 67348, 'product-collections/3.jpg', '[]', '2020-11-07 02:12:24', '2021-01-18 03:05:58', '2021-01-18 03:05:58'),
(298, 0, '4', 8, 'image/jpeg', 21888, 'product-collections/4.jpg', '[]', '2020-11-07 02:12:24', '2021-01-18 03:05:58', '2021-01-18 03:05:58'),
(299, 0, '1-a', 25, 'image/jpeg', 40289, 'products/1-a.jpg', '[]', '2020-11-07 02:12:24', '2020-12-29 03:26:58', '2020-12-29 03:26:58'),
(300, 0, '1-b', 25, 'image/jpeg', 35414, 'products/1-b.jpg', '[]', '2020-11-07 02:12:25', '2020-12-29 03:26:58', '2020-12-29 03:26:58'),
(301, 0, '10-a', 25, 'image/jpeg', 115491, 'products/10-a.jpg', '[]', '2020-11-07 02:12:25', '2020-12-29 03:26:58', '2020-12-29 03:26:58'),
(302, 0, '10-b', 25, 'image/jpeg', 125726, 'products/10-b.jpg', '[]', '2020-11-07 02:12:26', '2020-12-29 03:26:58', '2020-12-29 03:26:58'),
(303, 0, '10-c', 25, 'image/jpeg', 217925, 'products/10-c.jpg', '[]', '2020-11-07 02:12:26', '2020-12-29 03:26:58', '2020-12-29 03:26:58'),
(304, 0, '11-a', 25, 'image/jpeg', 98441, 'products/11-a.jpg', '[]', '2020-11-07 02:12:26', '2020-12-29 03:26:58', '2020-12-29 03:26:58'),
(305, 0, '2-a', 25, 'image/jpeg', 58637, 'products/2-a.jpg', '[]', '2020-11-07 02:12:27', '2020-12-29 03:26:58', '2020-12-29 03:26:58'),
(306, 0, '2-b', 25, 'image/jpeg', 68052, 'products/2-b.jpg', '[]', '2020-11-07 02:12:27', '2020-12-29 03:26:58', '2020-12-29 03:26:58'),
(307, 0, '2-c', 25, 'image/jpeg', 61214, 'products/2-c.jpg', '[]', '2020-11-07 02:12:27', '2020-12-29 03:26:58', '2020-12-29 03:26:58'),
(308, 0, '2-d', 25, 'image/jpeg', 69617, 'products/2-d.jpg', '[]', '2020-11-07 02:12:28', '2020-12-29 03:26:58', '2020-12-29 03:26:58'),
(309, 0, '3-a', 25, 'image/jpeg', 76513, 'products/3-a.jpg', '[]', '2020-11-07 02:12:30', '2020-12-29 03:26:58', '2020-12-29 03:26:58'),
(310, 0, '3-b', 25, 'image/jpeg', 56238, 'products/3-b.jpg', '[]', '2020-11-07 02:12:31', '2020-12-29 03:26:58', '2020-12-29 03:26:58'),
(311, 0, '3-c', 25, 'image/jpeg', 72882, 'products/3-c.jpg', '[]', '2020-11-07 02:12:32', '2020-12-29 03:26:58', '2020-12-29 03:26:58'),
(312, 0, '3-d', 25, 'image/jpeg', 62320, 'products/3-d.jpg', '[]', '2020-11-07 02:12:33', '2020-12-29 03:26:58', '2020-12-29 03:26:58'),
(313, 0, '4-a', 25, 'image/jpeg', 109441, 'products/4-a.jpg', '[]', '2020-11-07 02:12:34', '2020-12-29 03:26:58', '2020-12-29 03:26:58'),
(314, 0, '4-b', 25, 'image/jpeg', 74366, 'products/4-b.jpg', '[]', '2020-11-07 02:12:35', '2020-12-29 03:26:58', '2020-12-29 03:26:58'),
(315, 0, '4-c', 25, 'image/jpeg', 98336, 'products/4-c.jpg', '[]', '2020-11-07 02:12:36', '2020-12-29 03:26:58', '2020-12-29 03:26:58'),
(316, 0, '5-a', 25, 'image/jpeg', 114530, 'products/5-a.jpg', '[]', '2020-11-07 02:12:36', '2020-12-29 03:26:58', '2020-12-29 03:26:58'),
(317, 0, '5-b', 25, 'image/jpeg', 136199, 'products/5-b.jpg', '[]', '2020-11-07 02:12:37', '2020-12-29 03:26:58', '2020-12-29 03:26:58'),
(318, 0, '5-c', 25, 'image/jpeg', 47358, 'products/5-c.jpg', '[]', '2020-11-07 02:12:38', '2020-12-29 03:26:58', '2020-12-29 03:26:58'),
(319, 0, '6-a', 25, 'image/jpeg', 31263, 'products/6-a.jpg', '[]', '2020-11-07 02:12:39', '2020-12-29 03:26:58', '2020-12-29 03:26:58'),
(320, 0, '6-b', 25, 'image/jpeg', 31704, 'products/6-b.jpg', '[]', '2020-11-07 02:12:39', '2020-12-29 03:26:58', '2020-12-29 03:26:58'),
(321, 0, '7-a', 25, 'image/jpeg', 161543, 'products/7-a.jpg', '[]', '2020-11-07 02:12:39', '2020-12-29 03:26:58', '2020-12-29 03:26:58'),
(322, 0, '7-b', 25, 'image/jpeg', 161029, 'products/7-b.jpg', '[]', '2020-11-07 02:12:40', '2020-12-29 03:26:58', '2020-12-29 03:26:58'),
(323, 0, '7-c', 25, 'image/jpeg', 121927, 'products/7-c.jpg', '[]', '2020-11-07 02:12:40', '2020-12-29 03:26:58', '2020-12-29 03:26:58'),
(324, 0, '8-a', 25, 'image/jpeg', 191505, 'products/8-a.jpg', '[]', '2020-11-07 02:12:40', '2020-11-07 02:12:40', NULL),
(325, 0, '9-a', 25, 'image/jpeg', 104416, 'products/9-a.jpg', '[]', '2020-11-07 02:12:41', '2020-12-29 03:26:58', '2020-12-29 03:26:58'),
(326, 0, '1', 26, 'image/jpeg', 709173, 'sliders/1.jpg', '[]', '2020-11-07 02:12:45', '2021-01-21 14:33:19', '2021-01-21 14:33:19'),
(327, 0, '2', 26, 'image/jpeg', 1019757, 'sliders/2.jpg', '[]', '2020-11-07 02:12:46', '2021-01-21 14:33:19', '2021-01-21 14:33:19'),
(328, 0, '3', 26, 'image/jpeg', 435599, 'sliders/3.jpg', '[]', '2020-11-07 02:12:47', '2021-01-21 14:33:19', '2021-01-21 14:33:19'),
(329, 0, '1', 27, 'image/jpeg', 82629, 'news/1.jpg', '[]', '2020-11-07 02:12:48', '2020-11-07 02:12:48', NULL),
(330, 0, '2', 27, 'image/jpeg', 119904, 'news/2.jpg', '[]', '2020-11-07 02:12:48', '2020-11-07 02:12:48', NULL),
(331, 0, '3', 27, 'image/jpeg', 89543, 'news/3.jpg', '[]', '2020-11-07 02:12:49', '2020-11-07 02:12:49', NULL),
(332, 0, '4', 27, 'image/jpeg', 51573, 'news/4.jpg', '[]', '2020-11-07 02:12:49', '2020-11-07 02:12:49', NULL),
(333, 0, '5', 27, 'image/jpeg', 41164, 'news/5.jpg', '[]', '2020-11-07 02:12:49', '2020-11-07 02:12:49', NULL),
(334, 0, '6', 27, 'image/jpeg', 80696, 'news/6.jpg', '[]', '2020-11-07 02:12:49', '2020-11-07 02:12:49', NULL),
(337, 0, 'open-graph-image', 28, 'image/png', 138064, 'general/open-graph-image.png', '[]', '2020-11-07 02:12:53', '2020-11-07 02:12:53', NULL),
(338, 1, 'rsz_rlogo', 28, 'image/png', 7751, 'general/rsz-rlogo.png', '[]', '2020-11-19 17:38:56', '2020-11-19 17:38:56', NULL),
(340, 1, 'rsz_rlogo-1', 28, 'image/png', 89862, 'general/rsz-rlogo-1.png', '[]', '2020-11-19 17:48:08', '2020-11-19 17:48:08', NULL),
(341, 1, 'back_logo', 28, 'image/png', 79740, 'general/back-logo.png', '[]', '2020-11-19 17:51:34', '2020-11-19 17:51:34', NULL),
(342, 1, 'favicon-2', 28, 'image/png', 29891, 'general/favicon-2.png', '[]', '2020-11-19 17:54:33', '2020-11-19 17:54:33', NULL),
(343, 1, 's6 (3)', 26, 'image/jpeg', 60700, 'sliders/s6-3.jpg', '[]', '2020-11-19 23:30:47', '2021-01-21 14:33:19', '2021-01-21 14:33:19'),
(344, 1, 's2', 26, 'image/jpeg', 316686, 'sliders/s2.jpg', '[]', '2020-11-19 23:37:34', '2021-01-21 14:33:19', '2021-01-21 14:33:19'),
(345, 1, 's6', 26, 'image/jpeg', 384046, 'sliders/s6.jpg', '[]', '2020-11-20 02:16:48', '2020-11-20 02:16:48', NULL),
(346, 1, '1st - summer-meadows-assorted-wax-filled-tin-candles-floral-5cm', 0, 'image/jpeg', 155784, '1st-summer-meadows-assorted-wax-filled-tin-candles-floral-5cm.jpg', '[]', '2020-11-20 03:14:35', '2020-11-20 03:15:52', '2020-11-20 03:15:52'),
(347, 1, '2-wick-candle-black-lily-and-pomegranate-scent-260g', 0, 'image/jpeg', 229604, '2-wick-candle-black-lily-and-pomegranate-scent-260g.jpg', '[]', '2020-11-20 03:14:39', '2020-11-20 03:15:52', '2020-11-20 03:15:52'),
(348, 1, '2-wick-candle-fresh-cotton-scent-260g', 0, 'image/jpeg', 226383, '2-wick-candle-fresh-cotton-scent-260g.jpg', '[]', '2020-11-20 03:14:42', '2020-11-20 03:15:52', '2020-11-20 03:15:52'),
(349, 1, '2-wick-candle-japanese-wild-summer-cherry-scent-380g', 0, 'image/jpeg', 109992, '2-wick-candle-japanese-wild-summer-cherry-scent-380g.jpg', '[]', '2020-11-20 03:14:44', '2020-11-20 03:15:52', '2020-11-20 03:15:52'),
(351, 1, '1st - summer-meadows-assorted-wax-filled-tin-candles-floral-5cm', 25, 'image/jpeg', 155784, 'products/1st-summer-meadows-assorted-wax-filled-tin-candles-floral-5cm.jpg', '[]', '2020-11-20 03:16:25', '2020-11-20 03:16:25', NULL),
(352, 1, '2-wick-candle-black-lily-and-pomegranate-scent-260g', 25, 'image/jpeg', 229604, 'products/2-wick-candle-black-lily-and-pomegranate-scent-260g.jpg', '[]', '2020-11-20 03:16:28', '2020-11-20 03:16:28', NULL),
(353, 1, '2-wick-candle-fresh-cotton-scent-260g', 25, 'image/jpeg', 226383, 'products/2-wick-candle-fresh-cotton-scent-260g.jpg', '[]', '2020-11-20 03:16:31', '2020-11-20 03:16:31', NULL),
(354, 1, '2-wick-candle-japanese-wild-summer-cherry-scent-380g', 25, 'image/jpeg', 109992, 'products/2-wick-candle-japanese-wild-summer-cherry-scent-380g.jpg', '[]', '2020-11-20 03:16:32', '2020-11-20 03:16:32', NULL),
(355, 1, '2-wick-candle-kashmir-and-fig-scent-380g', 25, 'image/jpeg', 109872, 'products/2-wick-candle-kashmir-and-fig-scent-380g.jpg', '[]', '2020-11-20 03:16:34', '2020-11-20 03:16:34', NULL),
(356, 1, '2-wick-candle-moroccan-red-cinnamon-scent-380g', 25, 'image/jpeg', 108785, 'products/2-wick-candle-moroccan-red-cinnamon-scent-380g.jpg', '[]', '2020-11-20 03:29:40', '2020-11-20 03:29:40', NULL),
(357, 1, '2-wick-candle-savannah-white-poppy-scent-380g', 25, 'image/jpeg', 95669, 'products/2-wick-candle-savannah-white-poppy-scent-380g.jpg', '[]', '2020-11-20 03:29:41', '2020-11-20 03:29:41', NULL),
(358, 1, '2-wick-candle-seasalt-scent-380g', 25, 'image/jpeg', 100389, 'products/2-wick-candle-seasalt-scent-380g.jpg', '[]', '2020-11-20 03:29:42', '2020-11-20 03:29:42', NULL),
(359, 1, '2-wick-candle-thai-flower-market-scent-380g', 25, 'image/jpeg', 104342, 'products/2-wick-candle-thai-flower-market-scent-380g.jpg', '[]', '2020-11-20 03:29:43', '2020-11-20 03:29:43', NULL),
(360, 1, '2-wick-wax-filled-glass-candle-pot-aloe-vera-cucumber-scent-340g', 25, 'image/jpeg', 860659, 'products/2-wick-wax-filled-glass-candle-pot-aloe-vera-cucumber-scent-340g.jpg', '[]', '2020-11-20 03:29:47', '2020-11-20 03:29:47', NULL),
(361, 1, '2-wick-wax-filled-glass-candle-pot-green-tea-scent-340g', 25, 'image/jpeg', 875173, 'products/2-wick-wax-filled-glass-candle-pot-green-tea-scent-340g.jpg', '[]', '2020-11-20 03:29:52', '2020-11-20 03:29:52', NULL),
(362, 1, '2-wick-wax-filled-glass-candle-pot-lavender-vanilla-scent-340g', 25, 'image/jpeg', 653581, 'products/2-wick-wax-filled-glass-candle-pot-lavender-vanilla-scent-340g.jpg', '[]', '2020-11-20 03:29:56', '2020-11-20 03:29:56', NULL),
(363, 1, '3-glass-wax-filled-pots-aloe-vera-cucumber-scent-50g', 25, 'image/jpeg', 821446, 'products/3-glass-wax-filled-pots-aloe-vera-cucumber-scent-50g.jpg', '[]', '2020-11-20 03:30:02', '2020-11-20 03:30:02', NULL),
(364, 1, '3-glass-wax-filled-pots-green-tea-scent-50g', 25, 'image/jpeg', 805009, 'products/3-glass-wax-filled-pots-green-tea-scent-50g.jpg', '[]', '2020-11-20 03:30:07', '2020-11-20 03:30:07', NULL),
(365, 1, '3-glass-wax-filled-pots-lavender-vanilla-scent-50g', 25, 'image/jpeg', 638231, 'products/3-glass-wax-filled-pots-lavender-vanilla-scent-50g.jpg', '[]', '2020-11-20 03:30:11', '2020-11-20 03:30:11', NULL),
(366, 1, '3-mini-votive-candles-in-gift-box-japanese-wild-summer-cherry-scent-50g', 25, 'image/jpeg', 139289, 'products/3-mini-votive-candles-in-gift-box-japanese-wild-summer-cherry-scent-50g.jpg', '[]', '2020-11-20 03:30:13', '2020-11-20 03:30:13', NULL),
(367, 1, '3-mini-votive-candles-in-gift-box-seasalt-scent-50g', 25, 'image/jpeg', 133979, 'products/3-mini-votive-candles-in-gift-box-seasalt-scent-50g.jpg', '[]', '2020-11-20 03:30:14', '2020-11-20 03:30:14', NULL),
(368, 1, '3-small-tin-candles-amber-shea-angel-flower-amber-lily-scent-60g-', 25, 'image/jpeg', 135042, 'products/3-small-tin-candles-amber-shea-angel-flower-amber-lily-scent-60g.jpg', '[]', '2020-11-20 03:30:15', '2020-11-20 03:30:15', NULL),
(369, 1, 'africa-set-of-3-mini-votive-candles-in-gift-box-savannah-white-poppy-scent-50g', 25, 'image/jpeg', 148147, 'products/africa-set-of-3-mini-votive-candles-in-gift-box-savannah-white-poppy-scent-50g.jpg', '[]', '2020-11-20 03:30:16', '2020-11-20 03:30:16', NULL),
(370, 1, 'bohemian-large-tin-candle-amber-lily-scent-130g', 25, 'image/jpeg', 131495, 'products/bohemian-large-tin-candle-amber-lily-scent-130g.jpg', '[]', '2020-11-20 03:30:17', '2020-11-20 03:30:17', NULL),
(371, 1, 'bohemian-large-tin-candle-amber-shea-scent-130g', 25, 'image/jpeg', 107610, 'products/bohemian-large-tin-candle-amber-shea-scent-130g.jpg', '[]', '2020-11-20 03:30:18', '2020-11-20 03:30:18', NULL),
(372, 1, 'bohemian-small-tin-candle-amber-lily-scent-60g', 25, 'image/jpeg', 158464, 'products/bohemian-small-tin-candle-amber-lily-scent-60g.jpg', '[]', '2020-11-20 03:30:19', '2020-11-20 03:30:19', NULL),
(373, 1, 'bohemian-small-tin-candle-amber-shea-scent-60g', 25, 'image/jpeg', 116336, 'products/bohemian-small-tin-candle-amber-shea-scent-60g.jpg', '[]', '2020-11-20 03:30:20', '2020-11-20 03:30:20', NULL),
(374, 1, 'burn-it-at-both-ends-large-wax-filled-pot-candle-pink-petal-scent-380g', 25, 'image/jpeg', 114017, 'products/burn-it-at-both-ends-large-wax-filled-pot-candle-pink-petal-scent-380g.jpg', '[]', '2020-11-20 03:30:21', '2020-11-20 03:30:21', NULL),
(375, 1, 'candle-in-gift-box-japanese-wild-summer-cherry-scent-220g', 25, 'image/jpeg', 124961, 'products/candle-in-gift-box-japanese-wild-summer-cherry-scent-220g.jpg', '[]', '2020-11-20 03:30:22', '2020-11-20 03:30:22', NULL),
(376, 1, 'candle-in-gift-box-moroccan-red-cinnamon-scent-220g', 25, 'image/jpeg', 140687, 'products/candle-in-gift-box-moroccan-red-cinnamon-scent-220g.jpg', '[]', '2020-11-20 03:30:23', '2020-11-20 03:30:23', NULL),
(377, 1, 'candle-wild-fig-scent-360g', 25, 'image/jpeg', 119732, 'products/candle-wild-fig-scent-360g.jpg', '[]', '2020-11-20 03:30:24', '2020-11-20 03:30:24', NULL),
(378, 1, 'candle-with-lid-black-lily-and-pomegranate-scent-130g', 25, 'image/jpeg', 237778, 'products/candle-with-lid-black-lily-and-pomegranate-scent-130g.jpg', '[]', '2020-11-20 03:30:26', '2020-11-20 03:30:26', NULL),
(379, 1, 'chinoiserie-2-wick-wax-filled-candle-pot-aromatic-shea-scent-380g', 25, 'image/jpeg', 225085, 'products/chinoiserie-2-wick-wax-filled-candle-pot-aromatic-shea-scent-380g.jpg', '[]', '2020-11-20 03:30:28', '2020-11-20 03:30:28', NULL),
(380, 1, 'chinoiserie-2-wick-wax-filled-candle-pot-oriental-flower-scent-380g', 25, 'image/jpeg', 550375, 'products/chinoiserie-2-wick-wax-filled-candle-pot-oriental-flower-scent-380g.jpg', '[]', '2020-11-20 03:30:31', '2020-11-20 03:30:31', NULL),
(381, 1, 'chinoiserie-2-wick-wax-filled-candle-pot-oriental-lily-scent-380g', 25, 'image/jpeg', 780968, 'products/chinoiserie-2-wick-wax-filled-candle-pot-oriental-lily-scent-380g.jpg', '[]', '2020-11-20 03:30:37', '2020-11-20 03:30:37', NULL),
(382, 1, 'chinoiserie-set-of-3-wax-filled-candle-pots-oriental-flower-scent-50g', 25, 'image/jpeg', 727796, 'products/chinoiserie-set-of-3-wax-filled-candle-pots-oriental-flower-scent-50g.jpg', '[]', '2020-11-20 03:30:41', '2020-11-20 03:30:41', NULL),
(383, 1, 'chinoiserie-set-of-3-wax-filled-candle-pots-oriental-lily-scent-50g', 25, 'image/jpeg', 864345, 'products/chinoiserie-set-of-3-wax-filled-candle-pots-oriental-lily-scent-50g.jpg', '[]', '2020-11-20 03:30:46', '2020-11-20 03:30:46', NULL),
(384, 1, 'glow-getter-large-wax-filled-pot-candle-pear-flower-scent-380g', 25, 'image/jpeg', 118409, 'products/glow-getter-large-wax-filled-pot-candle-pear-flower-scent-380g.jpg', '[]', '2020-11-20 03:30:48', '2020-11-20 03:30:48', NULL),
(385, 1, 'great-minds-drink-alike-large-wax-filled-pot-candle-midnight-rose-scent-380g', 25, 'image/jpeg', 111345, 'products/great-minds-drink-alike-large-wax-filled-pot-candle-midnight-rose-scent-380g.jpg', '[]', '2020-11-20 03:30:48', '2020-11-20 03:30:48', NULL),
(386, 1, 'happy-small-wax-filled-pot-candle-in-gift-box-wild-fig-scent-60g-', 25, 'image/jpeg', 124500, 'products/happy-small-wax-filled-pot-candle-in-gift-box-wild-fig-scent-60g.jpg', '[]', '2020-11-20 03:30:50', '2020-11-20 03:30:50', NULL),
(387, 1, 'hugs-kisses-wax-filled-pot-candle-in-gift-box-prosecco-scent-220g', 25, 'image/jpeg', 234365, 'products/hugs-kisses-wax-filled-pot-candle-in-gift-box-prosecco-scent-220g.jpg', '[]', '2020-11-20 03:30:51', '2020-11-20 03:30:51', NULL),
(388, 1, 'india-set-of-3-mini-votive-candles-in-gift-box-kashmir-and-fig-scent-50g', 25, 'image/jpeg', 141334, 'products/india-set-of-3-mini-votive-candles-in-gift-box-kashmir-and-fig-scent-50g.jpg', '[]', '2020-11-20 03:30:53', '2020-11-20 03:30:53', NULL),
(389, 1, 'india-small-wax-filled-pot-candle-in-gift-box-kashmir-and-fig-scent-220g', 25, 'image/jpeg', 138885, 'products/india-small-wax-filled-pot-candle-in-gift-box-kashmir-and-fig-scent-220g.jpg', '[]', '2020-11-20 03:30:54', '2020-11-20 03:30:54', NULL),
(390, 1, 'keep-it-sassy-large-wax-filled-pot-candle-white-flowers-scent-380g', 25, 'image/jpeg', 120600, 'products/keep-it-sassy-large-wax-filled-pot-candle-white-flowers-scent-380g.jpg', '[]', '2020-11-20 03:30:55', '2020-11-20 03:30:55', NULL),
(391, 1, 'let-s-get-it-on-large-wax-filled-pot-candle-honeysucke-and-ivy-scent-380g', 25, 'image/jpeg', 120058, 'products/let-s-get-it-on-large-wax-filled-pot-candle-honeysucke-and-ivy-scent-380g.jpg', '[]', '2020-11-20 03:30:57', '2020-11-20 03:30:57', NULL),
(392, 1, 'let-there-be-candlelight-large-wax-filled-pot-candle-orangeblossom-musk-scent-380g-', 25, 'image/jpeg', 120773, 'products/let-there-be-candlelight-large-wax-filled-pot-candle-orangeblossom-musk-scent-380g.jpg', '[]', '2020-11-20 03:30:58', '2020-11-20 03:30:58', NULL),
(393, 1, 'love-always-wax-filled-pot-candle-in-gift-box-prosecco-scent-220g', 25, 'image/jpeg', 140903, 'products/love-always-wax-filled-pot-candle-in-gift-box-prosecco-scent-220g.jpg', '[]', '2020-11-20 03:30:59', '2020-11-20 03:30:59', NULL),
(394, 1, 'midnight-pomegranate-scent-360g', 25, 'image/jpeg', 135823, 'products/midnight-pomegranate-scent-360g.jpg', '[]', '2020-11-20 03:31:01', '2020-11-20 03:31:01', NULL),
(395, 1, 'morocco-set-of-3-mini-votive-candles-in-gift-box-moroccan-red-cinnamon-scent-50g', 25, 'image/jpeg', 141819, 'products/morocco-set-of-3-mini-votive-candles-in-gift-box-moroccan-red-cinnamon-scent-50g.jpg', '[]', '2020-11-20 03:31:02', '2020-11-20 03:31:02', NULL),
(396, 1, 'nantucket-bay-small-wax-filled-pot-candle-in-gift-box-seasalt-scent-220g-', 25, 'image/jpeg', 142533, 'products/nantucket-bay-small-wax-filled-pot-candle-in-gift-box-seasalt-scent-220g.jpg', '[]', '2020-11-20 03:31:04', '2020-11-20 03:31:04', NULL),
(397, 1, 'nothing-prosecco-can-t-fix-small-tin-candle-with-ring-pull-top-prosecco-scent-100g', 25, 'image/jpeg', 122863, 'products/nothing-prosecco-can-t-fix-small-tin-candle-with-ring-pull-top-prosecco-scent-100g.jpg', '[]', '2020-11-20 03:31:05', '2020-11-20 03:31:05', NULL),
(398, 1, 'paradise-wax-filled-pot-candle-in-gift-box-pineapple-scent-220g', 25, 'image/jpeg', 170104, 'products/paradise-wax-filled-pot-candle-in-gift-box-pineapple-scent-220g.jpg', '[]', '2020-11-20 03:31:08', '2020-11-20 03:31:08', NULL),
(399, 1, 'pass-the-prosecco-small-tin-candle-with-ring-pull-top-prosecco-scent-100g', 25, 'image/jpeg', 119885, 'products/pass-the-prosecco-small-tin-candle-with-ring-pull-top-prosecco-scent-100g.jpg', '[]', '2020-11-20 03:31:09', '2020-11-20 03:31:09', NULL),
(400, 1, 'peace-large-frosted-glass-candle-redcurrant-and-ivy-scent-360g', 25, 'image/jpeg', 121345, 'products/peace-large-frosted-glass-candle-redcurrant-and-ivy-scent-360g.jpg', '[]', '2020-11-20 03:31:11', '2020-11-20 03:31:11', NULL),
(401, 1, 'pineapple-and-coconut-scent-220g', 25, 'image/jpeg', 98900, 'products/pineapple-and-coconut-scent-220g.jpg', '[]', '2020-11-20 03:31:12', '2020-11-20 03:31:12', NULL),
(402, 1, 'pineapple-and-coconut-scent-360g', 25, 'image/jpeg', 138651, 'products/pineapple-and-coconut-scent-360g.jpg', '[]', '2020-11-20 03:31:13', '2020-11-20 03:31:13', NULL),
(403, 1, 'posey-small-tin-candle-angel-rose-scent-60g', 25, 'image/jpeg', 135638, 'products/posey-small-tin-candle-angel-rose-scent-60g.jpg', '[]', '2020-11-20 03:31:15', '2020-11-20 03:31:15', NULL),
(404, 1, 'savannah-white-poppy-scent-220g', 25, 'image/jpeg', 172937, 'products/savannah-white-poppy-scent-220g.jpg', '[]', '2020-11-20 03:31:17', '2020-11-20 03:31:17', NULL),
(405, 1, 'siesta-wax-filled-pot-candle-in-gift-box-pineapple-scent-220g', 25, 'image/jpeg', 125821, 'products/siesta-wax-filled-pot-candle-in-gift-box-pineapple-scent-220g.jpg', '[]', '2020-11-20 03:31:19', '2020-11-20 03:31:19', NULL),
(406, 1, 'small-tin-candle-with-ring-pull-top-gin-and-tonic-scent-100g', 25, 'image/jpeg', 126425, 'products/small-tin-candle-with-ring-pull-top-gin-and-tonic-scent-100g.jpg', '[]', '2020-11-20 03:31:20', '2020-11-20 03:31:20', NULL),
(407, 1, 'start-your-spark-here-large-wax-filled-pot-candle-white-petal-scent-380g', 25, 'image/jpeg', 115727, 'products/start-your-spark-here-large-wax-filled-pot-candle-white-petal-scent-380g.jpg', '[]', '2020-11-20 03:31:21', '2020-11-20 03:31:21', NULL),
(408, 1, 'summer-meadows-2-wick-glass-wax-filled-pot-candle-floral-8cm', 25, 'image/jpeg', 224436, 'products/summer-meadows-2-wick-glass-wax-filled-pot-candle-floral-8cm.jpg', '[]', '2020-11-20 03:31:23', '2020-11-20 03:31:23', NULL),
(409, 1, 'summer-meadows-assorted-wax-filled-tin-candles-floral-5cm-', 25, 'image/jpeg', 716181, 'products/summer-meadows-assorted-wax-filled-tin-candles-floral-5cm.jpg', '[]', '2020-11-20 03:31:29', '2020-11-20 03:31:29', NULL),
(410, 1, 'summer-meadows-wax-filled-pot-candle-in-gift-box-floral-11cm', 25, 'image/jpeg', 218593, 'products/summer-meadows-wax-filled-pot-candle-in-gift-box-floral-11cm.jpg', '[]', '2020-11-20 03:31:31', '2020-11-20 03:31:31', NULL),
(411, 1, 'thailand-set-of-3-mini-votive-candles-in-gift-box-thai-flower-market-scent-50g', 25, 'image/jpeg', 138537, 'products/thailand-set-of-3-mini-votive-candles-in-gift-box-thai-flower-market-scent-50g.jpg', '[]', '2020-11-20 03:31:33', '2020-11-20 03:31:33', NULL),
(412, 1, 'thailand-small-wax-filled-pot-candle-in-gift-box-thai-flower-market-scent-220g', 25, 'image/jpeg', 133141, 'products/thailand-small-wax-filled-pot-candle-in-gift-box-thai-flower-market-scent-220g.jpg', '[]', '2020-11-20 03:31:34', '2020-11-20 03:31:34', NULL),
(413, 1, 'totally-lit-large-wax-filled-pot-candle-mimosa-scent-380g', 25, 'image/jpeg', 366601, 'products/totally-lit-large-wax-filled-pot-candle-mimosa-scent-380g.jpg', '[]', '2020-11-20 03:31:36', '2020-11-20 03:31:36', NULL),
(414, 1, 'trio-set-of-3-mini-votive-candles-gift-box-pineapple-scent-50g', 25, 'image/jpeg', 143580, 'products/trio-set-of-3-mini-votive-candles-gift-box-pineapple-scent-50g.jpg', '[]', '2020-11-20 03:31:38', '2020-11-20 03:31:38', NULL),
(415, 1, 'tropic-wax-filled-pot-candle-in-gift-box-pineapple-scent-220g', 25, 'image/jpeg', 137196, 'products/tropic-wax-filled-pot-candle-in-gift-box-pineapple-scent-220g.jpg', '[]', '2020-11-20 03:31:39', '2020-11-20 03:31:39', NULL),
(416, 1, 'zesty-calm-posey-set-of-3-small-tin-candles-pineapple-frensh-linen-angel-rose-scent-60g', 25, 'image/jpeg', 158466, 'products/zesty-calm-posey-set-of-3-small-tin-candles-pineapple-frensh-linen-angel-rose-scent-60g.jpg', '[]', '2020-11-20 03:31:41', '2020-11-20 03:31:41', NULL),
(417, 1, 'Zesty-frosted-glass-wax-filled-pot-candle-in-gift-box-pineapple-scent-220g', 25, 'image/jpeg', 125646, 'products/zesty-frosted-glass-wax-filled-pot-candle-in-gift-box-pineapple-scent-220g.jpg', '[]', '2020-11-20 03:31:43', '2020-11-20 03:31:43', NULL),
(418, 1, 'zesty-large-tin-candle-pineapple-scent-130g-6pk', 25, 'image/jpeg', 139974, 'products/zesty-large-tin-candle-pineapple-scent-130g-6pk.jpg', '[]', '2020-11-20 03:31:44', '2020-11-20 03:31:44', NULL),
(419, 1, 'with-love-xo 1', 29, 'image/jpeg', 156680, 'products/room-fragrance/with-love-xo-1.jpg', '[]', '2020-11-20 03:36:49', '2020-11-20 03:36:49', NULL),
(420, 1, 'Amber 1', 29, 'image/jpeg', 48631, 'products/room-fragrance/amber-1.jpg', '[]', '2020-11-20 03:36:49', '2020-11-20 03:36:49', NULL),
(421, 1, 'amber-lily 1', 29, 'image/jpeg', 150965, 'products/room-fragrance/amber-lily-1.jpg', '[]', '2020-11-20 03:36:51', '2020-11-20 03:36:51', NULL),
(422, 1, 'angel-flower 1', 29, 'image/jpeg', 159815, 'products/room-fragrance/angel-flower-1.jpg', '[]', '2020-11-20 03:36:52', '2020-11-20 03:36:52', NULL),
(423, 1, 'black-lily-and-pomegranate 1', 29, 'image/jpeg', 139642, 'products/room-fragrance/black-lily-and-pomegranate-1.jpg', '[]', '2020-11-20 03:36:53', '2020-11-20 03:36:53', NULL),
(424, 1, 'burn-it-at-both-ends 1', 29, 'image/jpeg', 129312, 'products/room-fragrance/burn-it-at-both-ends-1.jpg', '[]', '2020-11-20 03:36:54', '2020-11-20 03:36:54', NULL),
(425, 1, 'candlelight-home-reed-diffuser-candlelight-africa-reed-diffuser-in-gift-box-savannah-white-poppy-scent', 29, 'image/jpeg', 13157, 'products/room-fragrance/candlelight-home-reed-diffuser-candlelight-africa-reed-diffuser-in-gift-box-savannah-white-poppy-scent.jpg', '[]', '2020-11-20 03:36:54', '2020-11-20 03:36:54', NULL),
(426, 1, 'candlelight-home-reed-diffuser-candlelight-bohemian-reed-diffuser-in-gift-box-amber-lily-scent-150ml', 29, 'image/jpeg', 55164, 'products/room-fragrance/candlelight-home-reed-diffuser-candlelight-bohemian-reed-diffuser-in-gift-box-amber-lily-scent-150ml.jpg', '[]', '2020-11-20 03:36:55', '2020-11-20 03:36:55', NULL),
(427, 1, 'candlelight-home-reed-diffuser-candlelight-bohemian-reed-diffuser-in-gift-box-amber-shea-scent-150ml', 29, 'image/jpeg', 146732, 'products/room-fragrance/candlelight-home-reed-diffuser-candlelight-bohemian-reed-diffuser-in-gift-box-amber-shea-scent-150ml.jpg', '[]', '2020-11-20 03:36:56', '2020-11-20 03:36:56', NULL),
(428, 1, 'candlelight-home-reed-diffuser-candlelight-bohemian-reed-diffuser-in-gift-box-angel-flower-scent-150ml', 29, 'image/jpeg', 14057, 'products/room-fragrance/candlelight-home-reed-diffuser-candlelight-bohemian-reed-diffuser-in-gift-box-angel-flower-scent-150ml.jpg', '[]', '2020-11-20 03:36:57', '2020-11-20 03:36:57', NULL),
(429, 1, 'candlelight-home-reed-diffuser-candlelight-burn-it-at-both-ends-reed-diffuser-in-gift-box-pink-petal-scent-150ml', 29, 'image/jpeg', 7027, 'products/room-fragrance/candlelight-home-reed-diffuser-candlelight-burn-it-at-both-ends-reed-diffuser-in-gift-box-pink-petal-scent-150ml.jpg', '[]', '2020-11-20 03:36:57', '2020-11-20 03:36:57', NULL),
(430, 1, 'candlelight-home-reed-diffuser-candlelight-calm-reed-diffuser-in-gift-box-pineapple-and-coconut-scent-100ml', 29, 'image/jpeg', 39937, 'products/room-fragrance/candlelight-home-reed-diffuser-candlelight-calm-reed-diffuser-in-gift-box-pineapple-and-coconut-scent-100ml.jpg', '[]', '2020-11-20 03:36:58', '2020-11-20 03:36:58', NULL),
(431, 1, 'candlelight-home-reed-diffuser-candlelight-gin-is-liquid-sanity-reed-diffuser-with-ring-pull-top-gin-and-tonic-scent-75ml', 29, 'image/jpeg', 154752, 'products/room-fragrance/candlelight-home-reed-diffuser-candlelight-gin-is-liquid-sanity-reed-diffuser-with-ring-pull-top-gin-and-tonic-scent-75ml.jpg', '[]', '2020-11-20 03:36:59', '2020-11-20 03:36:59', NULL),
(432, 1, 'candlelight-home-reed-diffuser-candlelight-glow-getter-reed-diffuser-in-gift-box-pear-flower-scent-150ml', 29, 'image/jpeg', 7113, 'products/room-fragrance/candlelight-home-reed-diffuser-candlelight-glow-getter-reed-diffuser-in-gift-box-pear-flower-scent-150ml.jpg', '[]', '2020-11-20 03:36:59', '2020-11-20 03:36:59', NULL),
(433, 1, 'candlelight-home-reed-diffuser-candlelight-great-minds-drink-alike-reed-diffuser-in-gift-box-midnight-rose-scent-150ml-', 29, 'image/jpeg', 99798, 'products/room-fragrance/candlelight-home-reed-diffuser-candlelight-great-minds-drink-alike-reed-diffuser-in-gift-box-midnight-rose-scent-150ml.jpg', '[]', '2020-11-20 03:37:02', '2020-11-20 03:37:02', NULL),
(434, 1, 'candlelight-home-reed-diffuser-candlelight-happy-reed-diffuser-in-gift-box-wild-fig-scent-100ml', 29, 'image/jpeg', 34977, 'products/room-fragrance/candlelight-home-reed-diffuser-candlelight-happy-reed-diffuser-in-gift-box-wild-fig-scent-100ml.jpg', '[]', '2020-11-20 03:37:04', '2020-11-20 03:37:04', NULL),
(435, 1, 'candlelight-home-reed-diffuser-candlelight-india-reed-diffuser-in-gift-box-kashmir-and-fig-scent-150ml', 29, 'image/jpeg', 11980, 'products/room-fragrance/candlelight-home-reed-diffuser-candlelight-india-reed-diffuser-in-gift-box-kashmir-and-fig-scent-150ml.jpg', '[]', '2020-11-20 03:37:04', '2020-11-20 03:37:04', NULL),
(436, 1, 'candlelight-home-reed-diffuser-candlelight-japan-reed-diffuser-in-gift-box-japanese-wild-summer-cherry-scent-150ml', 29, 'image/jpeg', 133865, 'products/room-fragrance/candlelight-home-reed-diffuser-candlelight-japan-reed-diffuser-in-gift-box-japanese-wild-summer-cherry-scent-150ml.jpg', '[]', '2020-11-20 03:37:05', '2020-11-20 03:37:05', NULL),
(437, 1, 'candlelight-home-reed-diffuser-candlelight-keep-it-sassy-reed-diffuser-in-gift-box-white-flowers-scent-150ml', 29, 'image/jpeg', 88628, 'products/room-fragrance/candlelight-home-reed-diffuser-candlelight-keep-it-sassy-reed-diffuser-in-gift-box-white-flowers-scent-150ml.jpg', '[]', '2020-11-20 03:37:06', '2020-11-20 03:37:06', NULL),
(438, 1, 'candlelight-home-reed-diffuser-candlelight-let-s-get-it-on-reed-diffuser-in-gift-box-honeysuckle-and-ivy-scent-150ml', 29, 'image/jpeg', 82716, 'products/room-fragrance/candlelight-home-reed-diffuser-candlelight-let-s-get-it-on-reed-diffuser-in-gift-box-honeysuckle-and-ivy-scent-150ml.jpg', '[]', '2020-11-20 03:37:07', '2020-11-20 03:37:07', NULL),
(439, 1, 'candlelight-home-reed-diffuser-candlelight-let-there-be-candlelight-reed-diffuser-in-gift-box-orangeblossom-musk-scent-150ml', 29, 'image/jpeg', 7834, 'products/room-fragrance/candlelight-home-reed-diffuser-candlelight-let-there-be-candlelight-reed-diffuser-in-gift-box-orangeblossom-musk-scent-150ml.jpg', '[]', '2020-11-20 03:37:08', '2020-11-20 03:37:08', NULL),
(440, 1, 'candlelight-home-reed-diffuser-candlelight-love-reed-diffuser-in-gift-box-midnight-pomegranate-scent-100ml', 29, 'image/jpeg', 35611, 'products/room-fragrance/candlelight-home-reed-diffuser-candlelight-love-reed-diffuser-in-gift-box-midnight-pomegranate-scent-100ml.jpg', '[]', '2020-11-20 03:37:09', '2020-11-20 03:37:09', NULL),
(441, 1, 'candlelight-home-reed-diffuser-candlelight-morocco-reed-diffuser-in-gift-box-moroccan-red-cinnamon-scent-150ml', 29, 'image/jpeg', 152561, 'products/room-fragrance/candlelight-home-reed-diffuser-candlelight-morocco-reed-diffuser-in-gift-box-moroccan-red-cinnamon-scent-150ml.jpg', '[]', '2020-11-20 03:37:11', '2020-11-20 03:37:11', NULL),
(442, 1, 'candlelight-home-reed-diffuser-candlelight-nantucket-bay-reed-diffuser-in-gift-box-seasalt-scent-150ml', 29, 'image/jpeg', 160676, 'products/room-fragrance/candlelight-home-reed-diffuser-candlelight-nantucket-bay-reed-diffuser-in-gift-box-seasalt-scent-150ml.jpg', '[]', '2020-11-20 03:37:12', '2020-11-20 03:37:12', NULL),
(443, 1, 'candlelight-home-reed-diffuser-candlelight-pass-the-prosecco-reed-diffuser-with-ring-pull-top-prosecco-scent-75ml', 29, 'image/jpeg', 123200, 'products/room-fragrance/candlelight-home-reed-diffuser-candlelight-pass-the-prosecco-reed-diffuser-with-ring-pull-top-prosecco-scent-75ml.jpg', '[]', '2020-11-20 03:37:13', '2020-11-20 03:37:13', NULL),
(444, 1, 'candlelight-home-reed-diffuser-candlelight-siesta-reed-diffuser-in-gift-box-pineapple-scent-150ml', 29, 'image/jpeg', 41885, 'products/room-fragrance/candlelight-home-reed-diffuser-candlelight-siesta-reed-diffuser-in-gift-box-pineapple-scent-150ml.jpg', '[]', '2020-11-20 03:37:14', '2020-11-20 03:37:14', NULL),
(445, 1, 'candlelight-home-reed-diffuser-candlelight-start-your-spark-here-reed-diffuser-in-gift-box-white-petal-scent-150ml', 29, 'image/jpeg', 8064, 'products/room-fragrance/candlelight-home-reed-diffuser-candlelight-start-your-spark-here-reed-diffuser-in-gift-box-white-petal-scent-150ml.jpg', '[]', '2020-11-20 03:37:15', '2020-11-20 03:37:15', NULL),
(446, 1, 'candlelight-home-reed-diffuser-candlelight-thailand-reed-diffuser-in-gift-box-thai-flower-market-scent-150ml', 29, 'image/jpeg', 155502, 'products/room-fragrance/candlelight-home-reed-diffuser-candlelight-thailand-reed-diffuser-in-gift-box-thai-flower-market-scent-150ml.jpg', '[]', '2020-11-20 03:37:16', '2020-11-20 03:37:16', NULL),
(447, 1, 'candlelight-home-reed-diffuser-hugs-kisses-reed-diffuser-in-gift-box-prosecco-scent-100ml', 29, 'image/jpeg', 14106, 'products/room-fragrance/candlelight-home-reed-diffuser-hugs-kisses-reed-diffuser-in-gift-box-prosecco-scent-100ml.jpg', '[]', '2020-11-20 03:37:17', '2020-11-20 03:37:17', NULL),
(448, 1, 'candlelight-home-reed-diffuser-love-always-reed-diffuser-prosecco-scent-100ml', 29, 'image/jpeg', 161799, 'products/room-fragrance/candlelight-home-reed-diffuser-love-always-reed-diffuser-prosecco-scent-100ml.jpg', '[]', '2020-11-20 03:37:19', '2020-11-20 03:37:19', NULL),
(449, 1, 'candlelight-home-reed-diffuser-simple-large-reed-diffuser-in-gift-box-black-lily-and-pomegranate-scent-150ml', 29, 'image/jpeg', 36113, 'products/room-fragrance/candlelight-home-reed-diffuser-simple-large-reed-diffuser-in-gift-box-black-lily-and-pomegranate-scent-150ml.jpg', '[]', '2020-11-20 03:37:20', '2020-11-20 03:37:20', NULL),
(450, 1, 'candlelight-home-reed-diffuser-simple-large-reed-diffuser-in-gift-box-pink-pepper-scent-150ml', 29, 'image/jpeg', 7327, 'products/room-fragrance/candlelight-home-reed-diffuser-simple-large-reed-diffuser-in-gift-box-pink-pepper-scent-150ml.jpg', '[]', '2020-11-20 03:37:21', '2020-11-20 03:37:21', NULL),
(451, 1, 'candlelight-home-reed-diffuser-summer-meadows-reed-diffuser-in-gift-box-floral-25cm', 29, 'image/jpeg', 89177, 'products/room-fragrance/candlelight-home-reed-diffuser-summer-meadows-reed-diffuser-in-gift-box-floral-25cm.jpg', '[]', '2020-11-20 03:37:22', '2020-11-20 03:37:22', NULL),
(452, 1, 'candlelight-home-reed-diffuser-with-love-xo-reed-diffuser-in-gift-box-prosecco-scent-100ml', 29, 'image/jpeg', 10487, 'products/room-fragrance/candlelight-home-reed-diffuser-with-love-xo-reed-diffuser-in-gift-box-prosecco-scent-100ml.jpg', '[]', '2020-11-20 03:37:23', '2020-11-20 03:37:23', NULL),
(453, 1, 'diffuser-in-gift-box-pineapple-and-coconut 1', 29, 'image/jpeg', 127050, 'products/room-fragrance/diffuser-in-gift-box-pineapple-and-coconut-1.jpg', '[]', '2020-11-20 03:37:24', '2020-11-20 03:37:24', NULL),
(454, 1, 'great-minds-drink-alike 1', 29, 'image/jpeg', 127607, 'products/room-fragrance/great-minds-drink-alike-1.jpg', '[]', '2020-11-20 03:37:25', '2020-11-20 03:37:25', NULL),
(455, 1, 'honeysuckle-and-ivy 1', 29, 'image/jpeg', 126795, 'products/room-fragrance/honeysuckle-and-ivy-1.jpg', '[]', '2020-11-20 03:37:26', '2020-11-20 03:37:26', NULL),
(456, 1, 'hugs-kisses 1', 29, 'image/jpeg', 173226, 'products/room-fragrance/hugs-kisses-1.jpg', '[]', '2020-11-20 03:37:28', '2020-11-20 03:37:28', NULL),
(457, 1, 'japanese-wild-summer-cherry 1', 29, 'image/jpeg', 153178, 'products/room-fragrance/japanese-wild-summer-cherry-1.jpg', '[]', '2020-11-20 03:37:29', '2020-11-20 03:37:29', NULL),
(458, 1, 'kashmir-and-fig 1', 29, 'image/jpeg', 159672, 'products/room-fragrance/kashmir-and-fig-1.jpg', '[]', '2020-11-20 03:37:30', '2020-11-20 03:37:30', NULL),
(459, 1, 'keep-it-sassy 1', 29, 'image/jpeg', 129513, 'products/room-fragrance/keep-it-sassy-1.jpg', '[]', '2020-11-20 03:37:31', '2020-11-20 03:37:31', NULL),
(460, 1, 'love-always 1', 29, 'image/jpeg', 160942, 'products/room-fragrance/love-always-1.jpg', '[]', '2020-11-20 03:37:33', '2020-11-20 03:37:33', NULL),
(461, 1, 'midnight-pomegranate 1', 29, 'image/jpeg', 129013, 'products/room-fragrance/midnight-pomegranate-1.jpg', '[]', '2020-11-20 03:37:34', '2020-11-20 03:37:34', NULL),
(462, 1, 'moroccan-red-cinnamon 1', 29, 'image/jpeg', 159060, 'products/room-fragrance/moroccan-red-cinnamon-1.jpg', '[]', '2020-11-20 03:37:36', '2020-11-20 03:37:36', NULL),
(463, 1, 'Nantucket-bay 1', 29, 'image/jpeg', 13906, 'products/room-fragrance/nantucket-bay-1.jpg', '[]', '2020-11-20 03:37:37', '2020-11-20 03:37:37', NULL),
(464, 1, 'orangeblossom-musk 1', 29, 'image/jpeg', 126287, 'products/room-fragrance/orangeblossom-musk-1.jpg', '[]', '2020-11-20 03:37:38', '2020-11-20 03:37:38', NULL),
(465, 1, 'paradise1', 29, 'image/jpeg', 158269, 'products/room-fragrance/paradise1.jpg', '[]', '2020-11-20 03:37:40', '2020-11-20 03:37:40', NULL),
(466, 1, 'pass-the-prosecco 1', 29, 'image/jpeg', 156562, 'products/room-fragrance/pass-the-prosecco-1.jpg', '[]', '2020-11-20 03:37:41', '2020-11-20 03:37:41', NULL),
(467, 1, 'pear-flower 1', 29, 'image/jpeg', 135758, 'products/room-fragrance/pear-flower-1.jpg', '[]', '2020-11-20 03:37:43', '2020-11-20 03:37:43', NULL),
(468, 1, 'pink-pepper 1', 29, 'image/jpeg', 137863, 'products/room-fragrance/pink-pepper-1.jpg', '[]', '2020-11-20 03:37:44', '2020-11-20 03:37:44', NULL),
(469, 1, 'Savanah White 1', 29, 'image/jpeg', 179651, 'products/room-fragrance/savanah-white-1.jpg', '[]', '2020-11-20 03:37:45', '2020-11-20 03:37:45', NULL),
(470, 1, 'start-your-spark 1', 29, 'image/jpeg', 128241, 'products/room-fragrance/start-your-spark-1.jpg', '[]', '2020-11-20 03:37:47', '2020-11-20 03:37:47', NULL),
(471, 1, 'summer-meadows 1', 29, 'image/jpeg', 263234, 'products/room-fragrance/summer-meadows-1.jpg', '[]', '2020-11-20 03:37:54', '2020-11-20 03:37:54', NULL),
(472, 1, 'Thai 1', 29, 'image/jpeg', 130393, 'products/room-fragrance/thai-1.jpg', '[]', '2020-11-20 03:37:58', '2020-11-20 03:37:58', NULL),
(473, 1, 'tropic 1', 29, 'image/jpeg', 158379, 'products/room-fragrance/tropic-1.jpg', '[]', '2020-11-20 03:38:01', '2020-11-20 03:38:01', NULL),
(474, 1, 'wild-fig-scent 1', 29, 'image/jpeg', 128349, 'products/room-fragrance/wild-fig-scent-1.jpg', '[]', '2020-11-20 03:38:02', '2020-11-20 03:38:02', NULL),
(475, 1, 'Hearts Colour Changing LED Silver Casing', 30, 'image/png', 480651, 'products/lights/hearts-colour-changing-led-silver-casing.png', '[]', '2020-11-20 03:39:24', '2020-11-20 03:39:24', NULL),
(476, 1, 'Maple Leaf Colour Changing LED Silver Casing', 30, 'image/png', 468577, 'products/lights/maple-leaf-colour-changing-led-silver-casing.png', '[]', '2020-11-20 03:39:26', '2020-11-20 03:39:26', NULL),
(477, 1, 'Purple Silver Aroma Touch Lamp', 30, 'image/png', 414132, 'products/lights/purple-silver-aroma-touch-lamp.png', '[]', '2020-11-20 03:39:28', '2020-11-20 03:39:28', NULL),
(478, 1, 'Purple-Silver Hearts Touch Lamps', 30, 'image/png', 466630, 'products/lights/purple-silver-hearts-touch-lamps.png', '[]', '2020-11-20 03:39:31', '2020-11-20 03:39:31', NULL),
(479, 1, 'Red Silver Xmas Touch Lamp', 30, 'image/png', 394743, 'products/lights/red-silver-xmas-touch-lamp.png', '[]', '2020-11-20 03:39:33', '2020-11-20 03:39:33', NULL),
(480, 1, 'Rose Gold LED Aroma Lamp', 30, 'image/png', 1620295, 'products/lights/rose-gold-led-aroma-lamp.png', '[]', '2020-11-20 03:39:39', '2020-11-20 03:39:39', NULL),
(481, 1, 'Universe Colour Changing LED Silver Casing', 30, 'image/png', 467223, 'products/lights/universe-colour-changing-led-silver-casing.png', '[]', '2020-11-20 03:39:41', '2020-11-20 03:39:41', NULL),
(482, 1, 'Walnut Tree Wood Grain Colour Changing LED', 30, 'image/png', 511012, 'products/lights/walnut-tree-wood-grain-colour-changing-led.png', '[]', '2020-11-20 03:39:44', '2020-11-20 03:39:44', NULL),
(483, 1, 'White LED Aroma Lamp', 30, 'image/png', 1426840, 'products/lights/white-led-aroma-lamp.png', '[]', '2020-11-20 03:39:51', '2020-11-20 03:39:51', NULL),
(484, 1, 'White Rose Gold Aroma Touch Lamp', 30, 'image/png', 362652, 'products/lights/white-rose-gold-aroma-touch-lamp.png', '[]', '2020-11-20 03:39:54', '2020-11-20 03:39:54', NULL),
(485, 1, 'White Rose Gold Hearts Touch Lamp', 30, 'image/png', 473979, 'products/lights/white-rose-gold-hearts-touch-lamp.png', '[]', '2020-11-20 03:39:57', '2020-11-20 03:39:57', NULL),
(486, 1, 'Xmas Colour Changing LED Silver', 30, 'image/png', 422787, 'products/lights/xmas-colour-changing-led-silver.png', '[]', '2020-11-20 03:40:00', '2020-11-20 03:40:00', NULL),
(487, 1, 'Xmas Colour Changing LED White', 30, 'image/png', 321996, 'products/lights/xmas-colour-changing-led-white.png', '[]', '2020-11-20 03:40:02', '2020-11-20 03:40:02', NULL),
(488, 1, 'Hearts Colour Changing LED Black Casing', 30, 'image/png', 483775, 'products/lights/hearts-colour-changing-led-black-casing.png', '[]', '2020-11-20 03:40:04', '2020-11-20 03:40:04', NULL),
(489, 1, 'pef', 5, 'image/jpeg', 37531, 'product-categories/pef.jpg', '[]', '2020-11-22 13:42:40', '2020-11-25 13:50:09', '2020-11-25 13:50:09'),
(490, 1, 'freg', 5, 'image/png', 4723, 'product-categories/freg.png', '[]', '2020-11-22 13:44:34', '2020-11-25 13:05:03', '2020-11-25 13:05:03'),
(491, 1, 'Diffusers', 5, 'image/png', 3870, 'product-categories/diffusers.png', '[]', '2020-11-22 19:33:56', '2020-11-22 19:36:10', '2020-11-22 19:36:10'),
(492, 1, 'diffusers-1', 5, 'image/png', 3380, 'product-categories/diffusers-1.png', '[]', '2020-11-22 19:36:19', '2020-11-22 19:36:19', NULL),
(493, 1, 'freg-1', 5, 'image/png', 5839, 'product-categories/freg-1.png', '[]', '2020-11-25 13:05:10', '2020-11-25 13:17:21', '2020-11-25 13:17:21'),
(494, 1, 'ff', 5, 'image/png', 24075, 'product-categories/ff.png', '[]', '2020-11-25 13:17:12', '2020-11-25 13:17:12', NULL),
(495, 1, 'candles', 5, 'image/jpeg', 7392, 'product-categories/candles.jpg', '[]', '2020-11-25 13:23:02', '2020-11-25 13:23:02', NULL),
(496, 1, 'images', 5, 'image/png', 6237, 'product-categories/images.png', '[]', '2020-11-25 13:28:00', '2020-11-25 13:28:00', NULL),
(497, 1, 'pillow', 5, 'image/png', 2704, 'product-categories/pillow.png', '[]', '2020-11-25 13:31:26', '2020-11-25 13:50:09', '2020-11-25 13:50:09'),
(498, 1, 'pillow-1', 5, 'image/png', 2544, 'product-categories/pillow-1.png', '[]', '2020-11-25 13:36:22', '2020-11-25 13:36:22', NULL),
(499, 1, 'oill', 5, 'image/png', 5960, 'product-categories/oill.png', '[]', '2020-11-25 13:45:13', '2020-11-25 13:50:09', '2020-11-25 13:50:09'),
(500, 1, 'oill-1', 5, 'image/png', 5847, 'product-categories/oill-1.png', '[]', '2020-11-25 13:50:22', '2020-11-25 13:50:22', NULL),
(501, 1, 'pexels-lorraine-foreverblooms-834694', 8, 'image/jpeg', 37312, 'product-collections/pexels-lorraine-foreverblooms-834694.jpg', '[]', '2020-11-25 14:04:30', '2021-02-12 16:36:37', '2021-02-12 16:36:37'),
(502, 1, 'trending', 8, 'image/jpeg', 66798, 'product-collections/trending.jpg', '[]', '2020-11-25 14:08:13', '2021-02-12 16:36:37', '2021-02-12 16:36:37'),
(503, 1, 'special', 8, 'image/jpeg', 11138, 'product-collections/special.jpg', '[]', '2020-11-25 14:13:38', '2021-01-18 03:05:58', '2021-01-18 03:05:58'),
(504, 1, 'best', 8, 'image/jpeg', 14017, 'product-collections/best.jpg', '[]', '2020-11-25 14:18:54', '2021-02-12 16:36:37', '2021-02-12 16:36:37'),
(505, 1, 'special2', 8, 'image/jpeg', 15794, 'product-collections/special2.jpg', '[]', '2020-11-25 14:30:02', '2021-01-18 03:05:58', '2021-01-18 03:05:58'),
(506, 1, '2020-11-25 (1)', 28, 'image/png', 2526113, 'general/2020-11-25-1.png', '[]', '2020-11-25 16:19:23', '2020-11-25 16:19:23', NULL),
(507, 1, 'classic_collection', 30, 'image/png', 650277, 'products/lights/classic-collection.png', '[]', '2020-12-04 15:25:32', '2020-12-04 15:25:32', NULL),
(508, 1, 'col2', 30, 'image/png', 572730, 'products/lights/col2.png', '[]', '2020-12-04 15:26:01', '2020-12-04 15:26:01', NULL),
(509, 1, 'col3', 30, 'image/png', 714826, 'products/lights/col3.png', '[]', '2020-12-04 15:26:17', '2020-12-04 15:26:17', NULL),
(510, 1, 'col4', 30, 'image/png', 263589, 'products/lights/col4.png', '[]', '2020-12-04 15:55:19', '2020-12-04 15:55:34', '2020-12-04 15:55:34'),
(511, 1, 'col4-1', 30, 'image/png', 95224, 'products/lights/col4-1.png', '[]', '2020-12-04 15:56:07', '2020-12-04 15:56:07', NULL),
(512, 1, 'gift', 5, 'image/png', 3509, 'product-categories/gift.png', '[]', '2020-12-05 19:33:14', '2020-12-05 19:33:14', NULL),
(513, 1, '1', 31, 'image/jpeg', 64719, 'products/baskets/1.jpg', '[]', '2020-12-05 19:44:58', '2020-12-05 19:44:58', NULL),
(514, 1, 'bamboo', 31, 'image/png', 974576, 'products/baskets/bamboo.png', '[]', '2020-12-05 21:11:37', '2020-12-05 21:55:04', '2020-12-05 21:55:04'),
(515, 1, 'woven', 31, 'image/png', 2332673, 'products/baskets/woven.png', '[]', '2020-12-05 21:16:06', '2020-12-05 21:55:04', '2020-12-05 21:55:04'),
(516, 1, 'Picture1', 31, 'image/png', 807513, 'products/baskets/picture1.png', '[]', '2020-12-05 21:29:12', '2020-12-05 21:55:04', '2020-12-05 21:55:04'),
(517, 1, 'dove', 31, 'image/png', 2166929, 'products/baskets/dove.png', '[]', '2020-12-05 21:39:17', '2020-12-05 21:55:04', '2020-12-05 21:55:04'),
(518, 1, 'buff', 31, 'image/png', 2619917, 'products/baskets/buff.png', '[]', '2020-12-05 21:43:51', '2020-12-05 21:54:50', '2020-12-05 21:54:50'),
(519, 1, 'bamboo2', 31, 'image/jpeg', 129966, 'products/baskets/bamboo2.jpg', '[]', '2020-12-05 21:55:11', '2020-12-05 21:55:11', NULL),
(520, 1, 'woven-1', 31, 'image/jpeg', 166519, 'products/baskets/woven-1.jpg', '[]', '2020-12-05 21:59:52', '2020-12-05 21:59:52', NULL),
(521, 1, 'elegant', 31, 'image/jpeg', 102392, 'products/baskets/elegant.jpg', '[]', '2020-12-05 22:02:53', '2020-12-05 22:02:53', NULL),
(522, 1, 'dove-1', 31, 'image/jpeg', 79716, 'products/baskets/dove-1.jpg', '[]', '2020-12-05 22:05:49', '2020-12-05 22:05:49', NULL),
(523, 1, 'buff-1', 31, 'image/png', 2572683, 'products/baskets/buff-1.png', '[]', '2020-12-05 22:09:05', '2020-12-05 22:09:05', NULL),
(524, 1, 'heart', 31, 'image/png', 2662924, 'products/baskets/heart.png', '[]', '2020-12-05 22:11:13', '2020-12-05 22:11:13', NULL),
(525, 1, 'utility', 31, 'image/png', 1612451, 'products/baskets/utility.png', '[]', '2020-12-05 22:14:14', '2020-12-05 22:14:14', NULL),
(526, 1, '14inch', 31, 'image/jpeg', 57686, 'products/baskets/14inch.jpg', '[]', '2020-12-05 22:17:20', '2020-12-05 22:17:20', NULL),
(527, 1, '18inch', 31, 'image/jpeg', 98444, 'products/baskets/18inch.jpg', '[]', '2020-12-05 22:19:26', '2020-12-05 22:19:26', NULL),
(528, 1, 'card tray', 31, 'image/jpeg', 9867, 'products/baskets/card-tray.jpg', '[]', '2020-12-05 22:22:07', '2020-12-05 22:22:07', NULL),
(529, 1, 'card tray2', 31, 'image/jpeg', 21005, 'products/baskets/card-tray2.jpg', '[]', '2020-12-05 22:24:50', '2020-12-05 22:24:50', NULL),
(530, 1, 'candlestick', 31, 'image/jpeg', 4684, 'products/baskets/candlestick.jpg', '[]', '2020-12-05 22:29:07', '2020-12-05 22:29:07', NULL),
(531, 1, 'moller', 31, 'image/jpeg', 39084, 'products/baskets/moller.jpg', '[]', '2020-12-05 22:32:27', '2020-12-05 22:32:27', NULL),
(532, 1, 'moller2', 31, 'image/jpeg', 18985, 'products/baskets/moller2.jpg', '[]', '2020-12-05 22:33:47', '2020-12-05 22:33:47', NULL),
(533, 1, 'lantern', 31, 'image/jpeg', 5956, 'products/baskets/lantern.jpg', '[]', '2020-12-05 22:36:35', '2020-12-05 22:36:35', NULL),
(534, 1, 'chrisxam', 31, 'image/jpeg', 19300, 'products/baskets/chrisxam.jpg', '[]', '2020-12-05 22:40:23', '2020-12-05 22:40:23', NULL),
(535, 1, 'handmade', 31, 'image/jpeg', 19442, 'products/baskets/handmade.jpg', '[]', '2020-12-05 22:44:30', '2020-12-05 22:44:30', NULL),
(536, 1, 'red rose', 31, 'image/png', 70262, 'products/baskets/red-rose.png', '[]', '2020-12-05 22:49:34', '2020-12-05 22:49:34', NULL),
(537, 1, 'mixed', 31, 'image/png', 74321, 'products/baskets/mixed.png', '[]', '2020-12-05 22:52:27', '2020-12-05 22:52:27', NULL),
(538, 1, 'candle', 31, 'image/jpeg', 34736, 'products/baskets/candle.jpg', '[]', '2020-12-05 22:58:52', '2020-12-05 22:58:52', NULL),
(539, 1, 'filled candle', 31, 'image/jpeg', 28983, 'products/baskets/filled-candle.jpg', '[]', '2020-12-05 23:03:29', '2020-12-05 23:03:29', NULL),
(540, 1, 'wax', 31, 'image/png', 3706, 'products/baskets/wax.png', '[]', '2020-12-05 23:08:59', '2020-12-05 23:08:59', NULL),
(541, 1, 'wax-1', 31, 'image/jpeg', 28708, 'products/baskets/wax-1.jpg', '[]', '2020-12-05 23:14:33', '2020-12-05 23:14:33', NULL),
(542, 1, 'reed', 31, 'image/jpeg', 34452, 'products/baskets/reed.jpg', '[]', '2020-12-05 23:19:00', '2020-12-05 23:19:00', NULL),
(543, 1, 'WICK', 31, 'image/jpeg', 36147, 'products/baskets/wick.jpg', '[]', '2020-12-05 23:24:47', '2020-12-05 23:24:47', NULL),
(544, 1, 'LILY', 31, 'image/jpeg', 36031, 'products/baskets/lily.jpg', '[]', '2020-12-05 23:33:54', '2020-12-05 23:33:54', NULL),
(545, 1, 'shea', 31, 'image/jpeg', 36529, 'products/baskets/shea.jpg', '[]', '2020-12-05 23:38:02', '2020-12-05 23:38:02', NULL),
(546, 1, 'POT', 31, 'image/jpeg', 6485, 'products/baskets/pot.jpg', '[]', '2020-12-05 23:42:52', '2020-12-05 23:42:52', NULL),
(547, 1, '3WAX', 31, 'image/jpeg', 33912, 'products/baskets/3wax.jpg', '[]', '2020-12-06 00:19:12', '2020-12-06 00:19:12', NULL),
(548, 1, 'relax', 31, 'image/jpeg', 27920, 'products/baskets/relax.jpg', '[]', '2020-12-06 00:23:50', '2020-12-06 00:23:50', NULL),
(549, 1, 'relax2', 31, 'image/jpeg', 30410, 'products/baskets/relax2.jpg', '[]', '2020-12-06 00:27:04', '2020-12-06 00:27:04', NULL),
(550, 1, '3relax', 31, 'image/jpeg', 28565, 'products/baskets/3relax.jpg', '[]', '2020-12-06 00:30:37', '2020-12-06 00:30:37', NULL),
(551, 1, 'round', 31, 'image/jpeg', 29950, 'products/baskets/round.jpg', '[]', '2020-12-06 00:33:43', '2020-12-06 00:33:43', NULL);
INSERT INTO `media_files` (`id`, `user_id`, `name`, `folder_id`, `mime_type`, `size`, `url`, `options`, `created_at`, `updated_at`, `deleted_at`) VALUES
(552, 1, 'tea scent', 31, 'image/jpeg', 31318, 'products/baskets/tea-scent.jpg', '[]', '2020-12-06 00:37:25', '2020-12-06 00:37:25', NULL),
(553, 1, 'wick wax', 31, 'image/jpeg', 31249, 'products/baskets/wick-wax.jpg', '[]', '2020-12-06 00:41:01', '2020-12-06 00:41:01', NULL),
(554, 1, 'SET', 31, 'image/jpeg', 31178, 'products/baskets/set.jpg', '[]', '2020-12-06 00:44:38', '2020-12-06 00:44:38', NULL),
(555, 1, '11', 31, 'image/jpeg', 30182, 'products/baskets/11.jpg', '[]', '2020-12-06 00:48:06', '2020-12-06 00:48:06', NULL),
(556, 1, 'vera', 31, 'image/jpeg', 32028, 'products/baskets/vera.jpg', '[]', '2020-12-06 00:52:49', '2020-12-06 00:52:49', NULL),
(557, 1, '3spa', 31, 'image/jpeg', 31331, 'products/baskets/3spa.jpg', '[]', '2020-12-06 01:08:08', '2020-12-06 01:08:08', NULL),
(558, 1, '3spa-1', 31, 'image/jpeg', 31331, 'products/baskets/3spa-1.jpg', '[]', '2020-12-06 01:08:44', '2020-12-06 01:08:44', NULL),
(559, 1, '3spa-2', 31, 'image/jpeg', 31331, 'products/baskets/3spa-2.jpg', '[]', '2020-12-06 01:09:58', '2020-12-06 01:09:58', NULL),
(560, 1, 'big', 31, 'image/jpeg', 34133, 'products/baskets/big.jpg', '[]', '2020-12-06 01:23:30', '2020-12-06 01:23:30', NULL),
(561, 1, 'luxe', 31, 'image/jpeg', 33955, 'products/baskets/luxe.jpg', '[]', '2020-12-06 01:29:20', '2020-12-06 01:29:20', NULL),
(562, 1, 'luxe2', 31, 'image/jpeg', 38936, 'products/baskets/luxe2.jpg', '[]', '2020-12-06 01:40:16', '2020-12-06 01:40:16', NULL),
(563, 1, 'LUXE3', 31, 'image/jpeg', 36876, 'products/baskets/luxe3.jpg', '[]', '2020-12-06 01:43:31', '2020-12-06 01:43:31', NULL),
(564, 1, 'luxe4', 31, 'image/jpeg', 34732, 'products/baskets/luxe4.jpg', '[]', '2020-12-06 01:46:56', '2020-12-06 01:46:56', NULL),
(565, 1, 'alice', 31, 'image/jpeg', 44494, 'products/baskets/alice.jpg', '[]', '2020-12-06 01:52:24', '2020-12-06 01:52:24', NULL),
(566, 1, 'alice2', 31, 'image/jpeg', 31687, 'products/baskets/alice2.jpg', '[]', '2020-12-06 02:02:41', '2020-12-06 02:02:41', NULL),
(567, 1, 'alice3', 31, 'image/jpeg', 37175, 'products/baskets/alice3.jpg', '[]', '2020-12-06 02:05:50', '2020-12-06 02:05:50', NULL),
(568, 1, 'alice4', 31, 'image/jpeg', 28505, 'products/baskets/alice4.jpg', '[]', '2020-12-06 02:09:42', '2020-12-06 02:09:42', NULL),
(569, 1, 'ceramic', 31, 'image/jpeg', 44215, 'products/baskets/ceramic.jpg', '[]', '2020-12-06 02:47:16', '2020-12-06 02:47:16', NULL),
(570, 1, 'ceramic 2', 31, 'image/jpeg', 32812, 'products/baskets/ceramic-2.jpg', '[]', '2020-12-06 02:49:48', '2020-12-06 02:49:48', NULL),
(571, 1, 'ceramic3', 31, 'image/jpeg', 23829, 'products/baskets/ceramic3.jpg', '[]', '2020-12-06 04:03:40', '2020-12-06 04:03:40', NULL),
(572, 1, 'ceramic4', 31, 'image/jpeg', 37698, 'products/baskets/ceramic4.jpg', '[]', '2020-12-06 04:12:45', '2020-12-06 04:12:45', NULL),
(573, 1, 'spirit', 31, 'image/jpeg', 49176, 'products/baskets/spirit.jpg', '[]', '2020-12-06 04:16:19', '2020-12-06 04:16:19', NULL),
(574, 1, 'spirit2', 31, 'image/jpeg', 44317, 'products/baskets/spirit2.jpg', '[]', '2020-12-06 04:22:07', '2020-12-06 04:22:07', NULL),
(575, 1, 'spirit3', 31, 'image/jpeg', 35637, 'products/baskets/spirit3.jpg', '[]', '2020-12-06 04:26:06', '2020-12-06 04:26:06', NULL),
(576, 1, 'spirit4', 31, 'image/jpeg', 47733, 'products/baskets/spirit4.jpg', '[]', '2020-12-06 04:28:42', '2020-12-06 04:28:42', NULL),
(577, 1, 'scent', 31, 'image/jpeg', 32816, 'products/baskets/scent.jpg', '[]', '2020-12-06 04:33:14', '2020-12-06 04:33:14', NULL),
(578, 1, 'SCENT2', 31, 'image/jpeg', 30086, 'products/baskets/scent2.jpg', '[]', '2020-12-06 04:38:53', '2020-12-06 04:38:53', NULL),
(579, 1, 'SCENT3', 31, 'image/jpeg', 37686, 'products/baskets/scent3.jpg', '[]', '2020-12-06 04:42:43', '2020-12-06 04:42:43', NULL),
(580, 1, '1', 32, 'image/jpeg', 288873, 'hampers/1.jpeg', '[]', '2020-12-29 16:18:49', '2020-12-29 16:18:49', NULL),
(581, 1, '1-1', 32, 'image/jpeg', 284747, 'hampers/1-1.jpg', '[]', '2020-12-29 16:19:06', '2020-12-29 16:19:06', NULL),
(582, 1, '2', 32, 'image/jpeg', 341668, 'hampers/2.jpg', '[]', '2020-12-29 16:19:14', '2020-12-29 16:19:14', NULL),
(583, 1, '2a', 32, 'image/jpeg', 288873, 'hampers/2a.jpg', '[]', '2020-12-29 16:19:20', '2020-12-29 16:19:20', NULL),
(584, 1, '3', 32, 'image/jpeg', 337403, 'hampers/3.jpg', '[]', '2020-12-29 16:19:26', '2020-12-29 16:19:26', NULL),
(585, 1, '4', 32, 'image/jpeg', 562249, 'hampers/4.jpg', '[]', '2020-12-29 16:19:37', '2020-12-29 16:19:37', NULL),
(586, 1, '5', 32, 'image/jpeg', 266305, 'hampers/5.jpg', '[]', '2020-12-29 16:19:43', '2020-12-29 16:19:43', NULL),
(587, 1, '6', 32, 'image/jpeg', 292936, 'hampers/6.jpg', '[]', '2020-12-29 16:19:51', '2020-12-29 16:19:51', NULL),
(588, 1, '8', 32, 'image/jpeg', 293917, 'hampers/8.jpg', '[]', '2020-12-29 16:19:55', '2020-12-29 16:19:55', NULL),
(589, 1, '8a', 32, 'image/jpeg', 268869, 'hampers/8a.jpg', '[]', '2020-12-29 16:19:59', '2020-12-29 16:19:59', NULL),
(590, 1, '9', 32, 'image/jpeg', 360565, 'hampers/9.jpg', '[]', '2020-12-29 16:20:03', '2020-12-29 16:20:03', NULL),
(591, 1, '10', 32, 'image/jpeg', 365204, 'hampers/10.jpg', '[]', '2020-12-29 16:20:06', '2020-12-29 16:20:06', NULL),
(592, 1, '11', 32, 'image/jpeg', 358924, 'hampers/11.jpg', '[]', '2020-12-29 16:20:09', '2020-12-29 16:20:09', NULL),
(593, 1, '44', 32, 'image/jpeg', 516578, 'hampers/44.jpg', '[]', '2020-12-29 16:20:14', '2020-12-29 16:20:14', NULL),
(594, 1, '444', 32, 'image/jpeg', 337403, 'hampers/444.jpg', '[]', '2020-12-29 16:20:17', '2020-12-29 16:20:17', NULL),
(595, 1, 'c1', 32, 'image/png', 498692, 'hampers/c1.png', '[]', '2020-12-31 12:52:35', '2020-12-31 12:52:35', NULL),
(596, 1, 'c2', 32, 'image/png', 728789, 'hampers/c2.png', '[]', '2020-12-31 12:52:37', '2020-12-31 12:52:37', NULL),
(597, 1, 'kitchen-1687121_1920', 26, 'image/jpeg', 356107, 'sliders/kitchen-1687121-1920.jpg', '[]', '2021-01-08 16:00:14', '2021-01-08 16:00:14', NULL),
(598, 1, 'kitchen-4695948_1920', 26, 'image/jpeg', 638098, 'sliders/kitchen-4695948-1920.jpg', '[]', '2021-01-08 16:01:03', '2021-01-21 14:33:19', '2021-01-21 14:33:19'),
(599, 1, 'bad-1972205_1920', 26, 'image/jpeg', 283630, 'sliders/bad-1972205-1920.jpg', '[]', '2021-01-08 16:01:06', '2021-01-08 16:01:06', NULL),
(600, 1, 'hall-621741_1920', 26, 'image/jpeg', 340559, 'sliders/hall-621741-1920.jpg', '[]', '2021-01-08 16:01:08', '2021-01-21 14:33:19', '2021-01-21 14:33:19'),
(601, 1, 'Leopard_Candles_1600x', 24, 'image/jpeg', 514988, 'brands/leopard-candles-1600x.jpg', '[]', '2021-01-10 22:18:29', '2021-01-10 22:18:29', NULL),
(602, 1, 'diffuser-category', 8, 'image/jpeg', 140026, 'product-collections/diffuser-category.jpg', '[]', '2021-01-11 15:13:16', '2021-02-12 16:36:37', '2021-02-12 16:36:37'),
(603, 1, 'lamp', 5, 'image/jpeg', 140733, 'product-categories/lamp.jpg', '[]', '2021-01-14 23:11:31', '2021-01-14 23:11:31', NULL),
(604, 1, 'arocandles2', 8, 'image/jpeg', 156174, 'product-collections/arocandles2.jpg', '[]', '2021-01-18 02:09:04', '2021-01-18 02:09:04', NULL),
(605, 1, 'Aromatherapy Scented Candles infused in petals', 8, 'image/jpeg', 1412203, 'product-collections/aromatherapy-scented-candles-infused-in-petals.jpg', '[]', '2021-01-18 02:09:11', '2021-01-25 03:13:28', '2021-01-25 03:13:28'),
(606, 1, 'Display Flowers', 8, 'image/jpeg', 726846, 'product-collections/display-flowers.jpg', '[]', '2021-01-18 02:09:16', '2021-01-18 02:09:16', NULL),
(607, 1, 'Electric Wax Melt oil burners & Candle warmers', 8, 'image/jpeg', 32980, 'product-collections/electric-wax-melt-oil-burners-candle-warmers.jpg', '[]', '2021-01-18 02:09:17', '2021-01-18 02:09:17', NULL),
(608, 1, 'reed', 8, 'image/jpeg', 62050, 'product-collections/reed.jpg', '[]', '2021-01-18 02:09:18', '2021-01-18 02:09:18', NULL),
(609, 1, 'wholesale', 8, 'image/jpeg', 182267, 'product-collections/wholesale.jpg', '[]', '2021-01-18 02:09:20', '2021-01-25 03:13:13', '2021-01-25 03:13:13'),
(610, 1, '1PC-Ceramic-Aroma-Burner-Tealight-Candle-Tray-Wax-Melt-Warmer-Incense-Essential-Oil-Burners-Daisy-Home.jpg_Q90.jpg_', 8, 'image/jpeg', 192873, 'product-collections/1pc-ceramic-aroma-burner-tealight-candle-tray-wax-melt-warmer-incense-essential-oil-burners-daisy-homejpg-q90jpg.jpg', '[]', '2021-01-18 02:11:31', '2021-01-18 02:11:31', NULL),
(611, 1, 'update', 8, 'image/png', 4352631, 'product-collections/update.png', '[]', '2021-01-18 13:03:59', '2021-01-18 13:03:59', NULL),
(612, 1, 'katieAlicelogo', 24, 'image/png', 54314, 'brands/katiealicelogo.png', '[]', '2021-01-20 17:42:13', '2021-01-20 17:42:13', NULL),
(613, 1, 'cl-logo', 24, 'image/png', 46496, 'brands/cl-logo.png', '[]', '2021-01-20 20:27:52', '2021-01-20 20:27:52', NULL),
(614, 1, 'Aromatherapy wax melts & Tealights Candles', 5, 'image/png', 40648, 'product-categories/aromatherapy-wax-melts-tealights-candles.png', '[]', '2021-01-20 21:19:50', '2021-01-20 21:19:50', NULL),
(615, 1, 'Electric Wax Melt oil burners & Candle warmers', 5, 'image/png', 115566, 'product-categories/electric-wax-melt-oil-burners-candle-warmers.png', '[]', '2021-01-20 21:23:46', '2021-01-20 21:23:46', NULL),
(616, 1, 'Display Flowers', 5, 'image/png', 17504, 'product-categories/display-flowers.png', '[]', '2021-01-20 21:29:40', '2021-01-20 21:29:40', NULL),
(617, 1, 'giftsets', 5, 'image/png', 83237, 'product-categories/giftsets.png', '[]', '2021-01-20 21:42:27', '2021-01-20 21:42:27', NULL),
(618, 1, 'wholesale', 5, 'image/png', 1452, 'product-categories/wholesale.png', '[]', '2021-01-20 21:49:47', '2021-01-20 21:49:47', NULL),
(619, 1, 'Electric Wax Melt oil burners & Candle warmers-1', 5, 'image/png', 3212, 'product-categories/electric-wax-melt-oil-burners-candle-warmers-1.png', '[]', '2021-01-20 21:55:03', '2021-01-20 21:55:03', NULL),
(620, 1, 'aroma-4076727', 26, 'image/jpeg', 1428069, 'sliders/aroma-4076727.jpg', '[]', '2021-01-21 14:07:16', '2021-01-21 14:33:19', '2021-01-21 14:33:19'),
(621, 1, 'diffuser', 26, 'image/jpeg', 1484598, 'sliders/diffuser.jpg', '[]', '2021-01-21 14:07:21', '2021-01-21 14:33:19', '2021-01-21 14:33:19'),
(622, 1, 'essential-oil-3816410', 26, 'image/jpeg', 2346128, 'sliders/essential-oil-3816410.jpg', '[]', '2021-01-21 14:07:28', '2021-01-21 14:33:19', '2021-01-21 14:33:19'),
(623, 1, 'essential-oils-3084952', 26, 'image/jpeg', 1100516, 'sliders/essential-oils-3084952.jpg', '[]', '2021-01-21 14:07:36', '2021-01-21 14:33:19', '2021-01-21 14:33:19'),
(624, 1, 'aroma-4076727-1', 26, 'image/jpeg', 193439, 'sliders/aroma-4076727-1.jpg', '[]', '2021-01-21 14:36:49', '2021-01-21 14:36:49', NULL),
(625, 1, 'diffuser-1', 26, 'image/jpeg', 241008, 'sliders/diffuser-1.jpg', '[]', '2021-01-21 14:36:54', '2021-01-27 16:25:25', '2021-01-27 16:25:25'),
(626, 1, 'essential-oil-3816410-1', 26, 'image/jpeg', 373044, 'sliders/essential-oil-3816410-1.jpg', '[]', '2021-01-21 14:37:02', '2021-01-27 16:24:19', '2021-01-27 16:24:19'),
(627, 1, 'essential-oils-3084952-1', 26, 'image/jpeg', 239665, 'sliders/essential-oils-3084952-1.jpg', '[]', '2021-01-21 14:37:08', '2021-01-27 16:23:46', '2021-01-27 16:23:46'),
(628, 1, 'decoglam', 24, 'image/png', 26640, 'brands/decoglam.png', '[]', '2021-01-22 03:27:01', '2021-01-22 03:27:01', NULL),
(629, 1, 'Summer Meadows', 29, 'image/png', 46058, 'products/room-fragrance/summer-meadows.png', '[]', '2021-01-23 16:22:34', '2021-01-23 16:22:34', NULL),
(630, 1, 'hug and kisses candelight', 25, 'image/jpeg', 7596, 'products/hug-and-kisses-candelight.jpg', '[]', '2021-01-23 16:48:07', '2021-01-23 16:48:07', NULL),
(631, 1, 'candlesss', 29, 'image/jpeg', 8638, 'products/room-fragrance/candlesss.jpg', '[]', '2021-01-24 01:47:06', '2021-01-24 01:47:06', NULL),
(632, 1, 'c2', 25, 'image/jpeg', 8245, 'products/c2.jpg', '[]', '2021-01-24 02:03:33', '2021-01-24 02:03:33', NULL),
(633, 1, 'posey', 29, 'image/jpeg', 6743, 'products/room-fragrance/posey.jpg', '[]', '2021-01-24 02:36:18', '2021-01-24 02:36:18', NULL),
(634, 1, 'mimosa scent', 29, 'image/jpeg', 27541, 'products/room-fragrance/mimosa-scent.jpg', '[]', '2021-01-24 02:50:42', '2021-01-24 02:50:42', NULL),
(635, 1, 'zeety difusser', 29, 'image/jpeg', 5887, 'products/room-fragrance/zeety-difusser.jpg', '[]', '2021-01-24 03:08:01', '2021-01-24 03:08:01', NULL),
(636, 1, 'aromatherapy', 8, 'image/jpeg', 82466, 'product-collections/aromatherapy.jpg', '[]', '2021-01-25 03:00:10', '2021-01-25 03:00:10', NULL),
(637, 1, 'ASHLEY bags1', 8, 'image/jpeg', 278071, 'product-collections/ashley-bags1.jpg', '[]', '2021-01-25 03:00:13', '2021-01-25 03:00:13', NULL),
(638, 1, 'ASHLEY bags2', 8, 'image/jpeg', 232509, 'product-collections/ashley-bags2.jpg', '[]', '2021-01-25 03:00:16', '2021-01-25 03:00:16', NULL),
(639, 1, 'candles-LIGHT WAX', 8, 'image/jpeg', 442236, 'product-collections/candles-light-wax.jpg', '[]', '2021-01-25 03:00:22', '2021-01-25 03:00:22', NULL),
(640, 1, 'DIFFUSER', 8, 'image/jpeg', 4695216, 'product-collections/diffuser.jpg', '[]', '2021-01-25 03:00:58', '2021-01-25 03:01:29', '2021-01-25 03:01:29'),
(641, 1, 'GIFT', 8, 'image/jpeg', 688882, 'product-collections/gift.jpg', '[]', '2021-01-25 03:01:07', '2021-01-25 03:01:07', NULL),
(642, 1, 'TEALIGHT', 8, 'image/jpeg', 88778, 'product-collections/tealight.jpg', '[]', '2021-01-25 03:01:09', '2021-01-25 03:01:09', NULL),
(643, 1, 'wax melts', 8, 'image/jpeg', 100769, 'product-collections/wax-melts.jpg', '[]', '2021-01-25 03:01:10', '2021-01-25 03:01:10', NULL),
(644, 1, 'DIFFUSER-1', 8, 'image/jpeg', 1026748, 'product-collections/diffuser-1.jpg', '[]', '2021-01-25 03:08:23', '2021-01-25 03:08:23', NULL),
(645, 1, 'Picture1', 8, 'image/png', 86694, 'product-collections/picture1.png', '[]', '2021-01-25 23:24:37', '2021-02-12 16:36:43', '2021-02-12 16:36:43'),
(646, 1, 'Picture1-1', 31, 'image/png', 86694, 'products/baskets/picture1-1.png', '[]', '2021-01-25 23:25:28', '2021-01-25 23:25:39', '2021-01-25 23:25:39'),
(647, 1, 'Picture1-2', 31, 'image/png', 33127, 'products/baskets/picture1-2.png', '[]', '2021-01-25 23:59:57', '2021-01-25 23:59:57', NULL),
(648, 1, 'Picture2', 31, 'image/jpeg', 3890, 'products/baskets/picture2.jpg', '[]', '2021-01-26 00:45:34', '2021-01-26 00:45:34', NULL),
(649, 1, 'Picture3', 31, 'image/png', 3898, 'products/baskets/picture3.png', '[]', '2021-01-26 00:49:45', '2021-01-26 00:49:45', NULL),
(650, 1, 'Picture4', 31, 'image/png', 44741, 'products/baskets/picture4.png', '[]', '2021-01-26 00:57:47', '2021-01-26 00:57:47', NULL),
(651, 1, 'pexels-jasmin-chew-5661223', 8, 'image/jpeg', 573011, 'product-collections/pexels-jasmin-chew-5661223.jpg', '[]', '2021-01-26 01:27:58', '2021-01-26 01:27:58', NULL),
(652, 1, 'pexels-jasmin-chew-5661223', 26, 'image/jpeg', 914164, 'sliders/pexels-jasmin-chew-5661223.jpg', '[]', '2021-01-26 01:30:06', '2021-01-26 01:30:06', NULL),
(653, 1, 'essential-oil3', 26, 'image/jpeg', 203663, 'sliders/essential-oil3.jpg', '[]', '2021-01-27 16:23:37', '2021-01-27 16:23:37', NULL),
(654, 1, 'essential-oil2-fliped', 26, 'image/jpeg', 267638, 'sliders/essential-oil2-fliped.jpg', '[]', '2021-01-27 16:24:45', '2021-01-27 16:24:45', NULL),
(655, 1, 'essential-oil-fliped', 26, 'image/jpeg', 47580, 'sliders/essential-oil-fliped.jpg', '[]', '2021-01-27 16:25:31', '2021-01-27 16:25:31', NULL),
(656, 1, 'essential-oil3-1', 26, 'image/jpeg', 225104, 'sliders/essential-oil3-1.jpg', '[]', '2021-01-27 17:49:23', '2021-01-27 17:49:23', NULL),
(657, 1, 'diffuser-1737193_1920', 26, 'image/jpeg', 343869, 'sliders/diffuser-1737193-1920.jpg', '[]', '2021-01-27 18:25:02', '2021-01-27 18:25:02', NULL),
(658, 1, 'Reed-diffusers', 26, 'image/jpeg', 290524, 'sliders/reed-diffusers.jpg', '[]', '2021-01-27 18:52:12', '2021-01-27 18:54:13', '2021-01-27 18:54:13'),
(659, 1, 'Reed-diffusers-1', 26, 'image/jpeg', 306908, 'sliders/reed-diffusers-1.jpg', '[]', '2021-01-27 18:54:20', '2021-01-27 18:54:20', NULL),
(660, 1, 'ReedDiffusers_', 26, 'image/jpeg', 285268, 'sliders/reeddiffusers.jpg', '[]', '2021-01-27 19:03:46', '2021-01-27 19:03:46', NULL),
(661, 1, 'Ashley in-House Handpoured Aromatherapy Candles”', 8, 'image/jpeg', 197316, 'product-collections/ashley-in-house-handpoured-aromatherapy-candles.jpeg', '[]', '2021-02-12 16:37:18', '2021-02-12 16:37:18', NULL),
(662, 1, 'TEALIGHTs', 33, 'image/jpeg', 214383, 'products/tealights/tealights.jpg', '[]', '2021-02-12 21:29:49', '2021-02-12 21:29:49', NULL),
(663, 1, 'waxmealt', 31, 'image/jpeg', 182394, 'products/baskets/waxmealt.jpg', '[]', '2021-02-12 21:57:14', '2021-02-12 21:57:14', NULL),
(664, 1, 'waxmelt2', 34, 'image/jpeg', 152554, 'products/wax-melts/waxmelt2.jpg', '[]', '2021-02-12 22:02:42', '2021-02-12 22:02:42', NULL),
(665, 1, 'waxmelt3', 34, 'image/jpeg', 186113, 'products/wax-melts/waxmelt3.jpg', '[]', '2021-02-12 22:04:28', '2021-02-12 22:04:28', NULL),
(666, 1, 'waxmelt4', 34, 'image/jpeg', 172391, 'products/wax-melts/waxmelt4.jpg', '[]', '2021-02-12 22:07:17', '2021-02-12 22:07:17', NULL),
(667, 1, 'candle1', 35, 'image/jpeg', 261136, 'products/candles/candle1.jpg', '[]', '2021-02-12 22:18:46', '2021-02-12 22:18:46', NULL),
(668, 1, 'candle2', 35, 'image/jpeg', 231473, 'products/candles/candle2.jpg', '[]', '2021-02-12 22:18:49', '2021-02-12 22:18:49', NULL),
(669, 1, 'candle3', 35, 'image/jpeg', 228370, 'products/candles/candle3.jpg', '[]', '2021-02-12 22:18:51', '2021-02-12 22:18:51', NULL),
(670, 1, 'candle4', 35, 'image/jpeg', 277228, 'products/candles/candle4.jpg', '[]', '2021-02-12 22:18:54', '2021-02-12 22:18:54', NULL),
(671, 1, 'candle5', 35, 'image/jpeg', 237390, 'products/candles/candle5.jpg', '[]', '2021-02-12 22:18:57', '2021-02-12 22:18:57', NULL),
(672, 1, 'candle6', 35, 'image/jpeg', 241763, 'products/candles/candle6.jpg', '[]', '2021-02-12 22:19:00', '2021-02-12 22:19:00', NULL),
(673, 1, 'Ashley in-House Handpoured Aromatherapy Candles”', 35, 'image/jpeg', 197316, 'products/candles/ashley-in-house-handpoured-aromatherapy-candles.jpeg', '[]', '2021-02-12 22:35:36', '2021-02-12 22:35:36', NULL),
(674, 1, 'candle8', 35, 'image/jpeg', 193519, 'products/candles/candle8.jpg', '[]', '2021-02-12 22:36:50', '2021-02-12 22:36:50', NULL),
(675, 1, '1', 34, 'image/jpeg', 228876, 'products/wax-melts/1.jpg', '[]', '2021-03-02 19:00:06', '2021-03-02 19:00:06', NULL),
(676, 1, '2', 34, 'image/jpeg', 84498, 'products/wax-melts/2.jpg', '[]', '2021-03-02 19:00:08', '2021-03-02 19:00:08', NULL),
(677, 1, '3', 34, 'image/jpeg', 497394, 'products/wax-melts/3.jpg', '[]', '2021-03-02 19:00:12', '2021-03-02 19:00:12', NULL),
(678, 1, '4', 34, 'image/jpeg', 384808, 'products/wax-melts/4.jpg', '[]', '2021-03-02 19:00:16', '2021-03-02 19:00:16', NULL),
(679, 1, '5', 34, 'image/jpeg', 393953, 'products/wax-melts/5.jpg', '[]', '2021-03-02 19:00:21', '2021-03-02 19:00:21', NULL),
(680, 1, '1-1', 34, 'image/jpeg', 326218, 'products/wax-melts/1-1.jpg', '[]', '2021-03-02 22:34:51', '2021-03-02 22:34:51', NULL),
(681, 1, '2-1', 34, 'image/jpeg', 385712, 'products/wax-melts/2-1.jpg', '[]', '2021-03-02 22:34:54', '2021-03-02 22:34:54', NULL),
(682, 1, '3-1', 34, 'image/jpeg', 298658, 'products/wax-melts/3-1.jpg', '[]', '2021-03-02 22:34:56', '2021-03-02 22:34:56', NULL),
(683, 1, '4-1', 34, 'image/jpeg', 332958, 'products/wax-melts/4-1.jpg', '[]', '2021-03-02 22:34:58', '2021-03-02 22:34:58', NULL),
(684, 1, '5-1', 34, 'image/jpeg', 301473, 'products/wax-melts/5-1.jpg', '[]', '2021-03-02 22:35:04', '2021-03-02 22:35:04', NULL),
(685, 1, '6', 34, 'image/jpeg', 234658, 'products/wax-melts/6.jpg', '[]', '2021-03-02 22:35:09', '2021-03-02 22:35:09', NULL),
(686, 1, '7', 34, 'image/jpeg', 311015, 'products/wax-melts/7.jpg', '[]', '2021-03-02 22:35:15', '2021-03-02 22:35:15', NULL),
(687, 1, '8', 34, 'image/jpeg', 114288, 'products/wax-melts/8.jpg', '[]', '2021-03-02 22:35:19', '2021-03-02 22:35:19', NULL),
(688, 1, '9', 34, 'image/jpeg', 289926, 'products/wax-melts/9.jpg', '[]', '2021-03-02 22:35:25', '2021-03-02 22:35:25', NULL),
(689, 1, '10', 34, 'image/jpeg', 341012, 'products/wax-melts/10.jpg', '[]', '2021-03-02 22:35:32', '2021-03-02 22:35:32', NULL),
(690, 1, '11', 34, 'image/jpeg', 49397, 'products/wax-melts/11.jpg', '[]', '2021-03-02 22:35:33', '2021-03-02 22:35:33', NULL),
(691, 1, '12', 34, 'image/jpeg', 201155, 'products/wax-melts/12.jpg', '[]', '2021-03-02 22:35:35', '2021-03-02 22:35:35', NULL),
(692, 1, '13', 34, 'image/jpeg', 135095, 'products/wax-melts/13.jpg', '[]', '2021-03-02 22:35:35', '2021-03-02 22:35:35', NULL),
(693, 1, '14', 34, 'image/jpeg', 111001, 'products/wax-melts/14.jpg', '[]', '2021-03-02 22:35:36', '2021-03-02 22:35:36', NULL),
(694, 1, '15', 34, 'image/jpeg', 61085, 'products/wax-melts/15.jpg', '[]', '2021-03-02 22:35:37', '2021-03-02 22:35:37', NULL),
(695, 1, '16', 34, 'image/jpeg', 332785, 'products/wax-melts/16.jpg', '[]', '2021-03-02 22:35:38', '2021-03-02 22:35:38', NULL),
(696, 1, '17', 34, 'image/jpeg', 171339, 'products/wax-melts/17.jpg', '[]', '2021-03-02 22:35:40', '2021-03-02 22:35:40', NULL),
(697, 1, '18', 34, 'image/jpeg', 333176, 'products/wax-melts/18.jpg', '[]', '2021-03-02 22:35:41', '2021-03-02 22:35:41', NULL),
(698, 1, '19', 34, 'image/jpeg', 291532, 'products/wax-melts/19.jpg', '[]', '2021-03-02 22:35:43', '2021-03-02 22:35:43', NULL),
(699, 1, '1-2', 34, 'image/jpeg', 90279, 'products/wax-melts/1-2.jpg', '[]', '2021-03-03 14:21:23', '2021-03-03 14:21:23', NULL),
(700, 1, '2-2', 34, 'image/jpeg', 44663, 'products/wax-melts/2-2.jpg', '[]', '2021-03-03 14:21:24', '2021-03-03 14:21:24', NULL),
(701, 1, '3-2', 34, 'image/jpeg', 192633, 'products/wax-melts/3-2.jpg', '[]', '2021-03-03 14:21:26', '2021-03-03 14:21:26', NULL),
(702, 1, '4-2', 34, 'image/jpeg', 324900, 'products/wax-melts/4-2.jpg', '[]', '2021-03-03 14:21:28', '2021-03-03 14:21:28', NULL),
(703, 1, '5-2', 34, 'image/jpeg', 265735, 'products/wax-melts/5-2.jpg', '[]', '2021-03-03 14:21:30', '2021-03-03 14:21:30', NULL),
(704, 1, '6-1', 34, 'image/jpeg', 303903, 'products/wax-melts/6-1.jpg', '[]', '2021-03-03 14:21:32', '2021-03-03 14:21:32', NULL),
(705, 1, '1-3', 34, 'image/jpeg', 29841, 'products/wax-melts/1-3.jpg', '[]', '2021-03-03 15:29:44', '2021-03-03 15:29:44', NULL),
(706, 1, '2-3', 34, 'image/jpeg', 23605, 'products/wax-melts/2-3.jpg', '[]', '2021-03-03 15:29:44', '2021-03-03 15:29:44', NULL),
(707, 1, '3-3', 34, 'image/jpeg', 303903, 'products/wax-melts/3-3.jpg', '[]', '2021-03-03 15:29:46', '2021-03-03 15:29:46', NULL),
(708, 1, '3-4', 34, 'image/png', 3874565, 'products/wax-melts/3-4.png', '[]', '2021-03-03 15:29:56', '2021-03-03 15:29:56', NULL),
(709, 1, '4-3', 34, 'image/jpeg', 325350, 'products/wax-melts/4-3.jpg', '[]', '2021-03-03 15:29:58', '2021-03-03 15:29:58', NULL),
(710, 1, '4-4', 34, 'image/png', 4663105, 'products/wax-melts/4-4.png', '[]', '2021-03-03 15:30:10', '2021-03-03 15:30:10', NULL),
(711, 1, '5-3', 34, 'image/jpeg', 198158, 'products/wax-melts/5-3.jpg', '[]', '2021-03-03 15:30:13', '2021-03-03 15:30:13', NULL),
(712, 1, '1', 33, 'image/jpeg', 208408, 'products/tealights/1.jpg', '[]', '2021-03-05 22:49:34', '2021-03-05 22:49:34', NULL),
(713, 1, '2', 33, 'image/jpeg', 337849, 'products/tealights/2.jpg', '[]', '2021-03-05 22:49:36', '2021-03-05 22:49:36', NULL),
(714, 1, '3', 33, 'image/jpeg', 143533, 'products/tealights/3.jpg', '[]', '2021-03-05 22:49:38', '2021-03-05 22:49:38', NULL),
(715, 1, '4', 33, 'image/jpeg', 184142, 'products/tealights/4.jpg', '[]', '2021-03-05 22:49:39', '2021-03-05 22:49:39', NULL),
(716, 1, '5', 33, 'image/jpeg', 343227, 'products/tealights/5.jpg', '[]', '2021-03-05 22:49:41', '2021-03-05 22:49:41', NULL),
(717, 1, '6', 33, 'image/jpeg', 364776, 'products/tealights/6.jpg', '[]', '2021-03-05 22:49:42', '2021-03-05 22:49:42', NULL),
(718, 1, '7', 33, 'image/jpeg', 338457, 'products/tealights/7.jpg', '[]', '2021-03-05 22:49:44', '2021-03-05 22:49:44', NULL),
(719, 1, '13', 35, 'image/jpeg', 398135, 'products/candles/13.jpg', '[]', '2021-03-05 23:38:50', '2021-03-05 23:38:50', NULL),
(720, 1, '61', 35, 'image/jpeg', 338367, 'products/candles/61.jpg', '[]', '2021-03-05 23:38:51', '2021-03-05 23:38:51', NULL),
(721, 1, '66i', 35, 'image/jpeg', 292783, 'products/candles/66i.jpg', '[]', '2021-03-05 23:38:52', '2021-03-05 23:38:52', NULL),
(722, 1, '611', 35, 'image/jpeg', 291596, 'products/candles/611.jpg', '[]', '2021-03-05 23:38:54', '2021-03-05 23:38:54', NULL),
(723, 1, 'Picture1', 35, 'image/jpeg', 332809, 'products/candles/picture1.jpg', '[]', '2021-03-05 23:38:56', '2021-03-05 23:38:56', NULL),
(724, 1, '1', 35, 'image/jpeg', 201176, 'products/candles/1.jpg', '[]', '2021-03-05 23:55:08', '2021-03-05 23:55:08', NULL),
(725, 1, '2', 35, 'image/jpeg', 294412, 'products/candles/2.jpg', '[]', '2021-03-05 23:55:11', '2021-03-05 23:55:11', NULL),
(726, 1, '3', 35, 'image/jpeg', 347931, 'products/candles/3.jpg', '[]', '2021-03-05 23:55:13', '2021-03-05 23:55:13', NULL),
(727, 1, '4', 35, 'image/jpeg', 330352, 'products/candles/4.jpg', '[]', '2021-03-05 23:55:15', '2021-03-05 23:55:15', NULL),
(728, 1, '5', 35, 'image/jpeg', 349112, 'products/candles/5.jpg', '[]', '2021-03-05 23:55:16', '2021-03-05 23:55:16', NULL),
(729, 1, '7', 35, 'image/jpeg', 279955, 'products/candles/7.jpg', '[]', '2021-03-05 23:55:17', '2021-03-05 23:55:17', NULL),
(730, 1, '8', 35, 'image/jpeg', 300977, 'products/candles/8.jpg', '[]', '2021-03-05 23:55:19', '2021-03-05 23:55:19', NULL),
(731, 1, '9', 35, 'image/jpeg', 320499, 'products/candles/9.jpg', '[]', '2021-03-05 23:55:21', '2021-03-05 23:55:21', NULL),
(732, 1, '10', 35, 'image/jpeg', 149954, 'products/candles/10.jpg', '[]', '2021-03-05 23:55:22', '2021-03-05 23:55:22', NULL),
(733, 1, '12', 35, 'image/png', 3545793, 'products/candles/12.png', '[]', '2021-03-05 23:55:31', '2021-03-05 23:55:31', NULL),
(734, 1, '20', 35, 'image/jpeg', 306743, 'products/candles/20.jpg', '[]', '2021-03-07 00:50:29', '2021-03-07 00:50:29', NULL),
(735, 1, '21', 35, 'image/jpeg', 402316, 'products/candles/21.jpg', '[]', '2021-03-07 00:50:32', '2021-03-07 00:50:32', NULL),
(736, 1, '22', 35, 'image/jpeg', 189714, 'products/candles/22.jpg', '[]', '2021-03-07 00:50:34', '2021-03-07 00:50:34', NULL),
(737, 1, '24', 35, 'image/jpeg', 198643, 'products/candles/24.jpg', '[]', '2021-03-07 00:50:36', '2021-03-07 00:50:36', NULL),
(738, 1, '25', 35, 'image/jpeg', 159768, 'products/candles/25.jpg', '[]', '2021-03-07 00:50:38', '2021-03-07 00:50:38', NULL),
(739, 1, '26', 35, 'image/png', 2735677, 'products/candles/26.png', '[]', '2021-03-07 00:50:54', '2021-03-07 00:50:54', NULL),
(740, 1, '27', 35, 'image/jpeg', 129509, 'products/candles/27.jpg', '[]', '2021-03-07 00:51:01', '2021-03-07 00:51:01', NULL),
(741, 1, '28', 35, 'image/jpeg', 95008, 'products/candles/28.jpg', '[]', '2021-03-07 00:51:03', '2021-03-07 00:51:03', NULL),
(742, 1, '29', 35, 'image/jpeg', 221390, 'products/candles/29.jpg', '[]', '2021-03-07 00:51:06', '2021-03-07 00:51:06', NULL),
(743, 1, '30', 35, 'image/jpeg', 271956, 'products/candles/30.jpg', '[]', '2021-03-07 00:51:09', '2021-03-07 00:51:09', NULL),
(744, 1, '31', 35, 'image/jpeg', 227794, 'products/candles/31.jpg', '[]', '2021-03-07 00:51:11', '2021-03-07 00:51:11', NULL),
(745, 1, '33', 35, 'image/jpeg', 80431, 'products/candles/33.jpg', '[]', '2021-03-07 00:51:13', '2021-03-07 00:51:13', NULL),
(746, 1, '34', 35, 'image/jpeg', 131321, 'products/candles/34.jpg', '[]', '2021-03-07 00:51:15', '2021-03-07 00:51:15', NULL),
(747, 1, '35', 35, 'image/jpeg', 62960, 'products/candles/35.jpg', '[]', '2021-03-07 00:51:18', '2021-03-07 00:51:18', NULL),
(748, 1, '36', 35, 'image/jpeg', 85862, 'products/candles/36.jpg', '[]', '2021-03-07 00:51:20', '2021-03-07 00:51:20', NULL),
(749, 1, '37', 35, 'image/jpeg', 57056, 'products/candles/37.jpg', '[]', '2021-03-07 00:51:22', '2021-03-07 00:51:22', NULL),
(750, 1, '38', 35, 'image/jpeg', 274627, 'products/candles/38.jpg', '[]', '2021-03-07 00:51:24', '2021-03-07 00:51:24', NULL),
(751, 1, '1', 36, 'image/png', 1297812, 'products/display-flower/1.png', '[]', '2021-03-07 03:10:04', '2021-03-07 03:10:04', NULL),
(752, 1, '2', 36, 'image/png', 1367797, 'products/display-flower/2.png', '[]', '2021-03-07 03:10:08', '2021-03-07 03:10:08', NULL),
(753, 1, '3', 36, 'image/png', 272046, 'products/display-flower/3.png', '[]', '2021-03-07 03:10:09', '2021-03-07 03:10:09', NULL),
(754, 1, '4', 36, 'image/png', 240576, 'products/display-flower/4.png', '[]', '2021-03-07 03:10:11', '2021-03-07 03:10:11', NULL),
(755, 1, '5', 36, 'image/png', 241059, 'products/display-flower/5.png', '[]', '2021-03-07 03:10:12', '2021-03-07 03:10:12', NULL),
(756, 1, 'col', 36, 'image/jpeg', 310841, 'products/display-flower/col.jpg', '[]', '2021-03-07 03:10:14', '2021-03-07 03:10:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_folders`
--

CREATE TABLE `media_folders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_folders`
--

INSERT INTO `media_folders` (`id`, `user_id`, `name`, `slug`, `parent_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 1, 'Product categories', 'product-categories', 0, '2020-06-21 00:25:06', '2020-06-21 00:25:06', NULL),
(8, 1, 'Product Collections', 'product-collections', 0, '2020-10-01 07:17:01', '2020-10-01 07:17:01', NULL),
(24, 0, 'brands', 'brands', 0, '2020-11-07 02:12:20', '2020-11-07 02:12:20', NULL),
(25, 0, 'products', 'products', 0, '2020-11-07 02:12:24', '2020-11-07 02:12:24', NULL),
(26, 0, 'sliders', 'sliders', 0, '2020-11-07 02:12:45', '2020-11-07 02:12:45', NULL),
(27, 0, 'news', 'news', 0, '2020-11-07 02:12:48', '2020-11-07 02:12:48', NULL),
(28, 0, 'general', 'general', 0, '2020-11-07 02:12:50', '2020-11-07 02:12:50', NULL),
(29, 1, 'Room Fragrance', 'room-fragrance', 25, '2020-11-20 03:36:26', '2020-11-20 03:36:26', NULL),
(30, 1, 'Lights', 'lights', 25, '2020-11-20 03:39:03', '2020-11-20 03:39:03', NULL),
(31, 1, 'Baskets', 'baskets', 25, '2020-12-05 19:44:41', '2020-12-05 19:44:41', NULL),
(32, 1, 'hampers', 'hampers', 0, '2020-12-29 16:14:29', '2020-12-29 16:14:29', NULL),
(33, 1, 'tealights', 'tealights', 25, '2021-02-12 21:27:57', '2021-02-12 21:27:57', NULL),
(34, 1, 'wax melts', 'wax-melts', 25, '2021-02-12 21:58:43', '2021-02-12 21:58:43', NULL),
(35, 1, 'candles', 'candles', 25, '2021-02-12 22:15:16', '2021-02-12 22:15:16', NULL),
(36, 1, 'display-flower', 'display-flower', 25, '2021-03-07 03:09:40', '2021-03-07 03:09:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_settings`
--

CREATE TABLE `media_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Main menu', 'main-menu', 'published', '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(2, 'Customer services', 'customer-services', 'published', '2020-11-07 02:12:50', '2020-11-07 02:12:50');

-- --------------------------------------------------------

--
-- Table structure for table `menu_locations`
--

CREATE TABLE `menu_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_locations`
--

INSERT INTO `menu_locations` (`id`, `menu_id`, `location`, `created_at`, `updated_at`) VALUES
(2, 1, 'main-menu', '2021-01-11 23:58:35', '2021-01-11 23:58:35');

-- --------------------------------------------------------

--
-- Table structure for table `menu_nodes`
--

CREATE TABLE `menu_nodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `reference_id` int(10) UNSIGNED DEFAULT '0',
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_nodes`
--

INSERT INTO `menu_nodes` (`id`, `menu_id`, `parent_id`, `reference_id`, `reference_type`, `url`, `icon_font`, `position`, `title`, `css_class`, `target`, `has_child`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 0, NULL, '/', '', 0, 'Home', '', '_self', 0, '2020-11-07 02:12:50', '2020-11-22 12:25:24'),
(2, 1, 0, 0, NULL, '/products', '', 1, 'Products', '', '_self', 1, '2020-11-07 02:12:50', '2020-11-22 12:25:24'),
(8, 1, 0, 3, 'Botble\\Page\\Models\\Page', '/contact', '', 3, 'Contact', '', '_self', 0, '2020-11-07 02:12:50', '2020-11-22 12:25:24'),
(9, 2, 0, 0, NULL, '/login', '', 0, 'Login', '', '_self', 0, '2020-11-07 02:12:50', '2020-11-22 13:28:06'),
(10, 2, 0, 0, NULL, '/register', '', 1, 'Register', '', '_self', 0, '2020-11-07 02:12:50', '2020-11-22 13:28:06'),
(11, 2, 0, 2, 'Botble\\Page\\Models\\Page', '/blog', '', 3, 'Blogs and Insights', '', '_self', 0, '2020-11-07 02:12:50', '2021-01-12 13:55:57'),
(12, 2, 0, 3, 'Botble\\Page\\Models\\Page', '/contact', '', 4, 'Contact', '', '_self', 0, '2020-11-07 02:12:50', '2021-01-12 00:00:13'),
(18, 2, 0, 5, 'Botble\\Page\\Models\\Page', '/about-us', '', 2, 'About Us', '', '_self', 0, '2021-01-12 00:00:13', '2021-01-12 00:01:12'),
(19, 1, 0, 0, NULL, '#', '', 2, 'Blogs and Insights', '', '_self', 0, '2021-01-12 13:55:31', '2021-01-12 13:55:31'),
(20, 1, 2, 9, 'Botble\\Ecommerce\\Models\\ProductCategory', '/product-categories/new-arrivals', '', 0, 'New Arrivals', '', '_self', 0, '2021-01-20 22:05:00', '2021-01-20 22:08:21'),
(21, 1, 2, 10, 'Botble\\Ecommerce\\Models\\ProductCategory', '/product-categories/reed-diffusers-and-candle-sets', '', 1, 'Reed Diffusers and Candle Sets', '', '_self', 0, '2021-01-20 22:05:00', '2021-01-20 22:08:21'),
(24, 1, 2, 13, 'Botble\\Ecommerce\\Models\\ProductCategory', '/product-categories/electric-wax-melt-oil-burners-and-candle-warmers', '', 4, 'Electric Wax Melt /oil burners and Candle warmers', '', '_self', 0, '2021-01-20 22:08:21', '2021-02-08 23:53:55'),
(25, 1, 2, 14, 'Botble\\Ecommerce\\Models\\ProductCategory', '/product-categories/display-flowers', '', 5, 'Display Flowers', '', '_self', 0, '2021-01-20 22:08:21', '2021-02-08 23:53:55'),
(26, 1, 2, 15, 'Botble\\Ecommerce\\Models\\ProductCategory', '/product-categories/gift-sets', '', 6, 'Gift Sets', '', '_self', 0, '2021-01-20 22:08:21', '2021-02-08 23:53:55'),
(27, 1, 2, 16, 'Botble\\Ecommerce\\Models\\ProductCategory', '/product-categories/wholesale', '', 7, 'Wholesale', '', '_self', 0, '2021-01-20 22:08:21', '2021-02-08 23:53:55'),
(29, 1, 2, 12, 'Botble\\Ecommerce\\Models\\ProductCategory', '/product-categories/ashley-in-house-handpoured-aromatherapy-wax-melts-tealights-in-jars', '', 2, 'Ashley in-House Handpoured Aromatherapy Wax Melts and Tealights in Jars', '', '_self', 0, '2021-02-10 14:21:40', '2021-02-10 14:23:31'),
(30, 1, 2, 11, 'Botble\\Ecommerce\\Models\\ProductCategory', '/product-categories/ashley-in-house-handpoured-aromatherapy-candles', '', 3, 'Ashley in-House Handpoured Aromatherapy Candles', '', '_self', 0, '2021-02-10 14:21:40', '2021-02-10 14:23:31');

-- --------------------------------------------------------

--
-- Table structure for table `meta_boxes`
--

CREATE TABLE `meta_boxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meta_boxes`
--

INSERT INTO `meta_boxes` (`id`, `reference_id`, `meta_key`, `meta_value`, `reference_type`, `created_at`, `updated_at`) VALUES
(2, 1, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Category', '2020-06-13 01:46:01', '2020-06-13 01:46:01'),
(3, 1, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Post', '2020-06-13 01:46:23', '2020-06-13 01:46:23'),
(4, 2, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Post', '2020-06-13 01:46:48', '2020-06-13 01:46:48'),
(5, 3, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Post', '2020-06-13 01:47:04', '2020-06-13 01:47:04'),
(18, 31, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-06-25 03:45:17', '2020-06-25 03:45:17'),
(19, 32, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-06-25 03:49:05', '2020-06-25 03:49:05'),
(20, 33, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-06-25 06:55:07', '2020-06-25 06:55:07'),
(21, 34, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-06-25 06:55:08', '2020-06-25 06:55:08'),
(22, 36, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-06-25 06:57:44', '2020-06-25 06:57:44'),
(24, 37, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-06-25 06:57:44', '2020-06-25 06:57:44'),
(25, 38, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-06-25 07:00:40', '2020-06-25 07:00:40'),
(26, 39, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-06-25 07:00:41', '2020-06-25 07:00:41'),
(27, 42, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-06-25 07:03:26', '2020-06-25 07:03:26'),
(28, 43, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-06-25 07:03:26', '2020-06-25 07:03:26'),
(29, 1, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Brand', '2020-06-26 03:57:48', '2020-06-26 03:57:48'),
(38, 9, 'icon', '[\"flaticon-plugins\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-10-01 07:18:52', '2020-10-01 07:18:52'),
(39, 10, 'icon', '[\"flaticon-music-system\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-10-01 07:18:52', '2020-10-01 07:18:52'),
(40, 11, 'icon', '[\"flaticon-monitor\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-10-01 07:18:52', '2020-10-01 07:18:52'),
(41, 12, 'icon', '[\"flaticon-printer\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-10-01 07:18:52', '2020-10-01 07:18:52'),
(42, 13, 'icon', '[\"flaticon-tv\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-10-01 07:18:52', '2020-10-01 07:18:52'),
(43, 14, 'icon', '[\"flaticon-fax\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-10-01 07:18:52', '2020-10-01 07:18:52'),
(44, 15, 'icon', '[\"flaticon-mouse\"]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2020-10-01 07:18:52', '2020-10-01 07:18:52'),
(47, 1, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Page\\Models\\Page', '2020-11-20 14:04:37', '2020-11-20 14:04:37'),
(54, 5, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-11-22 12:20:30', '2020-11-22 12:20:30'),
(60, 35, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 13:37:58', '2020-12-04 13:37:58'),
(62, 40, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 15:15:05', '2020-12-04 15:15:05'),
(63, 41, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 15:37:59', '2020-12-04 15:37:59'),
(64, 44, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 15:58:09', '2020-12-04 15:58:09'),
(65, 45, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 16:08:29', '2020-12-04 16:08:29'),
(66, 46, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 16:12:25', '2020-12-04 16:12:25'),
(69, 49, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 18:17:31', '2020-12-04 18:17:31'),
(70, 50, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 18:25:17', '2020-12-04 18:25:17'),
(71, 51, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 18:31:02', '2020-12-04 18:31:02'),
(72, 52, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 18:36:09', '2020-12-04 18:36:09'),
(74, 54, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 18:40:57', '2020-12-04 18:40:57'),
(75, 55, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 18:45:16', '2020-12-04 18:45:16'),
(77, 57, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 18:49:19', '2020-12-04 18:49:19'),
(78, 58, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 18:53:12', '2020-12-04 18:53:12'),
(79, 59, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 18:58:58', '2020-12-04 18:58:58'),
(80, 60, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 19:05:58', '2020-12-04 19:05:58'),
(81, 61, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 19:12:40', '2020-12-04 19:12:40'),
(82, 62, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 19:19:00', '2020-12-04 19:19:00'),
(83, 63, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 19:25:29', '2020-12-04 19:25:29'),
(85, 65, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 19:39:43', '2020-12-04 19:39:43'),
(86, 66, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 19:53:41', '2020-12-04 19:53:41'),
(87, 67, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 20:01:11', '2020-12-04 20:01:11'),
(88, 68, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 20:05:14', '2020-12-04 20:05:14'),
(90, 70, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 20:18:17', '2020-12-04 20:18:17'),
(91, 71, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 20:24:47', '2020-12-04 20:24:47'),
(92, 72, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 20:29:59', '2020-12-04 20:29:59'),
(93, 73, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 20:36:20', '2020-12-04 20:36:20'),
(94, 74, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 22:32:30', '2020-12-04 22:32:30'),
(95, 75, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 22:37:33', '2020-12-04 22:37:33'),
(96, 76, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 22:41:07', '2020-12-04 22:41:07'),
(97, 77, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 22:45:08', '2020-12-04 22:45:08'),
(98, 78, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-04 23:37:46', '2020-12-04 23:37:46'),
(135, 108, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-05 23:00:22', '2020-12-05 23:00:22'),
(136, 109, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-05 23:03:56', '2020-12-05 23:03:56'),
(137, 110, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-05 23:14:59', '2020-12-05 23:14:59'),
(138, 111, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-05 23:21:19', '2020-12-05 23:21:19'),
(139, 112, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-05 23:25:12', '2020-12-05 23:25:12'),
(140, 113, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-05 23:34:18', '2020-12-05 23:34:18'),
(141, 114, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-05 23:39:33', '2020-12-05 23:39:33'),
(142, 115, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-05 23:43:24', '2020-12-05 23:43:24'),
(143, 116, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 00:18:16', '2020-12-06 00:18:16'),
(145, 117, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 00:24:32', '2020-12-06 00:24:32'),
(146, 118, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 00:27:59', '2020-12-06 00:27:59'),
(148, 119, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 00:30:52', '2020-12-06 00:30:52'),
(149, 120, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 00:34:22', '2020-12-06 00:34:22'),
(150, 121, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 00:37:49', '2020-12-06 00:37:49'),
(151, 122, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 00:41:42', '2020-12-06 00:41:42'),
(152, 123, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 00:45:28', '2020-12-06 00:45:28'),
(153, 124, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 00:48:48', '2020-12-06 00:48:48'),
(154, 125, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 00:54:13', '2020-12-06 00:54:13'),
(155, 126, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 01:16:05', '2020-12-06 01:16:05'),
(156, 127, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 01:23:56', '2020-12-06 01:23:56'),
(157, 128, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 01:30:40', '2020-12-06 01:30:40'),
(159, 129, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 01:41:04', '2020-12-06 01:41:04'),
(160, 130, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 01:44:00', '2020-12-06 01:44:00'),
(161, 131, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 01:47:38', '2020-12-06 01:47:38'),
(164, 134, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 02:03:27', '2020-12-06 02:03:27'),
(165, 135, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 02:07:10', '2020-12-06 02:07:10'),
(166, 136, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 02:10:24', '2020-12-06 02:10:24'),
(168, 138, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 02:51:44', '2020-12-06 02:51:44'),
(170, 139, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 04:04:31', '2020-12-06 04:04:31'),
(171, 140, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 04:14:08', '2020-12-06 04:14:08'),
(173, 142, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 04:23:20', '2020-12-06 04:23:20'),
(174, 143, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 04:26:39', '2020-12-06 04:26:39'),
(175, 144, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 04:30:23', '2020-12-06 04:30:23'),
(176, 145, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 04:34:47', '2020-12-06 04:34:47'),
(177, 146, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 04:39:10', '2020-12-06 04:39:10'),
(178, 147, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2020-12-06 04:42:54', '2020-12-06 04:42:54'),
(181, 5, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Page\\Models\\Page', '2021-01-11 23:56:31', '2021-01-11 23:56:31'),
(182, 19, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\ProductTag', '2021-01-12 14:50:15', '2021-01-12 14:50:15'),
(183, 20, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\ProductTag', '2021-01-12 14:50:59', '2021-01-12 14:50:59'),
(184, 21, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\ProductTag', '2021-01-12 15:35:34', '2021-01-12 15:35:34'),
(186, 22, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\ProductTag', '2021-01-19 22:09:19', '2021-01-19 22:09:19'),
(187, 23, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\ProductTag', '2021-01-19 22:10:48', '2021-01-19 22:10:48'),
(188, 24, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\ProductTag', '2021-01-19 22:12:17', '2021-01-19 22:12:17'),
(189, 25, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\ProductTag', '2021-01-19 22:13:06', '2021-01-19 22:13:06'),
(190, 26, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\ProductTag', '2021-01-19 22:14:25', '2021-01-19 22:14:25'),
(191, 27, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\ProductTag', '2021-01-19 22:17:35', '2021-01-19 22:17:35'),
(192, 28, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\ProductTag', '2021-01-19 22:21:56', '2021-01-19 22:21:56'),
(193, 29, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\ProductTag', '2021-01-19 22:23:22', '2021-01-19 22:23:22'),
(194, 30, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\ProductTag', '2021-01-19 22:24:28', '2021-01-19 22:24:28'),
(195, 3, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Brand', '2021-01-20 17:43:06', '2021-01-20 17:43:06'),
(196, 9, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2021-01-20 20:48:09', '2021-01-20 20:48:09'),
(197, 10, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2021-01-20 20:50:15', '2021-01-20 20:50:15'),
(198, 11, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2021-01-20 21:04:41', '2021-01-20 21:04:41'),
(199, 12, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2021-01-20 21:14:41', '2021-01-20 21:14:41'),
(200, 13, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2021-01-20 21:20:49', '2021-01-20 21:20:49'),
(201, 14, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2021-01-20 21:29:48', '2021-01-20 21:29:48'),
(202, 15, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2021-01-20 21:42:37', '2021-01-20 21:42:37'),
(203, 16, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\ProductCategory', '2021-01-20 21:49:57', '2021-01-20 21:49:57'),
(204, 148, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-22 01:58:57', '2021-01-22 01:58:57'),
(205, 149, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-22 02:25:56', '2021-01-22 02:25:56'),
(206, 150, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-22 02:37:37', '2021-01-22 02:37:37'),
(207, 151, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-22 02:42:35', '2021-01-22 02:42:35'),
(208, 152, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-22 03:05:04', '2021-01-22 03:05:04'),
(209, 8, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Brand', '2021-01-22 03:28:41', '2021-01-22 03:28:41'),
(210, 153, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-22 03:41:31', '2021-01-22 03:41:31'),
(211, 154, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-22 04:34:05', '2021-01-22 04:34:05'),
(212, 155, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-22 04:36:16', '2021-01-22 04:36:16'),
(213, 156, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 15:43:01', '2021-01-23 15:43:01'),
(214, 157, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 15:45:20', '2021-01-23 15:45:20'),
(215, 158, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 15:48:03', '2021-01-23 15:48:03'),
(216, 159, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 15:51:56', '2021-01-23 15:51:56'),
(217, 160, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 15:57:09', '2021-01-23 15:57:09'),
(218, 161, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 16:03:18', '2021-01-23 16:03:18'),
(219, 162, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 16:06:30', '2021-01-23 16:06:30'),
(220, 163, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 16:17:29', '2021-01-23 16:17:29'),
(221, 164, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 16:21:08', '2021-01-23 16:21:08'),
(222, 9, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Brand', '2021-01-23 16:23:18', '2021-01-23 16:23:18'),
(223, 165, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 16:26:03', '2021-01-23 16:26:03'),
(224, 166, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 16:27:44', '2021-01-23 16:27:44'),
(225, 167, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 16:29:42', '2021-01-23 16:29:42'),
(226, 168, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 16:32:22', '2021-01-23 16:32:22'),
(227, 169, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 16:36:36', '2021-01-23 16:36:36'),
(228, 170, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 16:39:08', '2021-01-23 16:39:08'),
(229, 171, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 16:40:58', '2021-01-23 16:40:58'),
(230, 172, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 16:44:10', '2021-01-23 16:44:10'),
(231, 173, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 16:49:22', '2021-01-23 16:49:22'),
(232, 174, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 17:01:44', '2021-01-23 17:01:44'),
(233, 175, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 17:06:00', '2021-01-23 17:06:00'),
(234, 176, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 17:09:08', '2021-01-23 17:09:08'),
(235, 177, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 17:13:39', '2021-01-23 17:13:39'),
(236, 178, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 17:27:33', '2021-01-23 17:27:33'),
(237, 179, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 17:32:32', '2021-01-23 17:32:32'),
(238, 180, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 17:36:34', '2021-01-23 17:36:34'),
(239, 181, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 17:39:32', '2021-01-23 17:39:32'),
(240, 182, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 17:51:46', '2021-01-23 17:51:46'),
(241, 183, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 17:53:55', '2021-01-23 17:53:55'),
(242, 184, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 17:57:33', '2021-01-23 17:57:33'),
(243, 185, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 18:03:27', '2021-01-23 18:03:27'),
(244, 186, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 18:07:20', '2021-01-23 18:07:20'),
(245, 187, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 18:09:33', '2021-01-23 18:09:33'),
(246, 188, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 18:12:03', '2021-01-23 18:12:03'),
(247, 189, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 18:14:49', '2021-01-23 18:14:49'),
(248, 190, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-23 22:42:35', '2021-01-23 22:42:35'),
(249, 191, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-24 00:27:13', '2021-01-24 00:27:13'),
(250, 192, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-24 00:30:32', '2021-01-24 00:30:32'),
(251, 193, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-24 00:32:17', '2021-01-24 00:32:17'),
(252, 194, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-24 00:35:03', '2021-01-24 00:35:03'),
(253, 195, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-24 01:15:47', '2021-01-24 01:15:47'),
(254, 196, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-24 02:00:26', '2021-01-24 02:00:26'),
(255, 197, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-24 02:11:23', '2021-01-24 02:11:23'),
(256, 198, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-24 02:41:55', '2021-01-24 02:41:55'),
(257, 199, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-24 02:47:00', '2021-01-24 02:47:00'),
(258, 200, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-24 02:52:12', '2021-01-24 02:52:12'),
(259, 201, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-24 02:55:34', '2021-01-24 02:55:34'),
(260, 202, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-24 03:01:37', '2021-01-24 03:01:37'),
(261, 203, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-24 03:04:02', '2021-01-24 03:04:02'),
(262, 204, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-24 03:10:44', '2021-01-24 03:10:44'),
(263, 205, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-24 03:13:26', '2021-01-24 03:13:26'),
(264, 206, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-24 03:15:28', '2021-01-24 03:15:28'),
(265, 207, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-01-24 03:19:55', '2021-01-24 03:19:55'),
(270, 212, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-02-12 22:19:56', '2021-02-12 22:19:56'),
(271, 213, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-02-12 22:23:18', '2021-02-12 22:23:18'),
(272, 214, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-02-12 22:26:42', '2021-02-12 22:26:42'),
(276, 10, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Brand', '2021-02-12 22:47:29', '2021-02-12 22:47:29'),
(280, 220, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-03-02 19:01:32', '2021-03-02 19:01:32'),
(281, 221, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-03-02 19:03:07', '2021-03-02 19:03:07'),
(284, 269, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-03-03 09:11:02', '2021-03-03 09:11:02'),
(285, 272, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-03-03 09:14:52', '2021-03-03 09:14:52'),
(288, 319, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-03-03 15:22:32', '2021-03-03 15:22:32'),
(291, 438, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-03-03 16:40:57', '2021-03-03 16:40:57'),
(295, 508, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-03-03 17:28:08', '2021-03-03 17:28:08'),
(296, 530, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-03-03 17:36:17', '2021-03-03 17:36:17'),
(300, 211, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-03-05 22:52:09', '2021-03-05 22:52:09'),
(304, 215, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-03-07 01:07:55', '2021-03-07 01:07:55'),
(305, 216, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-03-07 02:21:40', '2021-03-07 02:21:40'),
(311, 602, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-03-07 03:35:37', '2021-03-07 03:35:37'),
(318, 217, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-03-13 03:38:26', '2021-03-13 03:38:26'),
(319, 4, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-03-20 22:47:51', '2021-03-20 22:47:51'),
(320, 6, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-03-20 22:49:23', '2021-03-20 22:49:23'),
(322, 7, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Ecommerce\\Models\\Product', '2021-03-20 22:57:45', '2021-03-20 22:57:45');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_04_09_032329_create_base_tables', 1),
(2, '2013_04_09_062329_create_revisions_table', 1),
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(6, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(7, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(8, '2016_06_01_000004_create_oauth_clients_table', 1),
(9, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(10, '2016_06_10_230148_create_acl_tables', 1),
(11, '2016_06_14_230857_create_menus_table', 1),
(12, '2016_06_28_221418_create_pages_table', 1),
(13, '2016_10_05_074239_create_setting_table', 1),
(14, '2016_11_28_032840_create_dashboard_widget_tables', 1),
(15, '2016_12_16_084601_create_widgets_table', 1),
(16, '2017_05_09_070343_create_media_tables', 1),
(17, '2017_11_03_070450_create_slug_table', 1),
(18, '2019_07_15_042406_change_site_title_from_settings_to_theme_options', 1),
(19, '2019_08_13_033145_remove_unused_columns_in_users_table', 1),
(20, '2019_08_19_000000_create_failed_jobs_table', 1),
(21, '2019_09_07_030654_update_menu_nodes_table', 1),
(22, '2019_09_07_045041_update_slugs_table', 1),
(23, '2019_09_07_050405_update_slug_reference_for_page', 1),
(24, '2019_09_08_014859_update_meta_boxes_table', 1),
(25, '2019_09_08_015629_update_meta_box_data_for_page', 1),
(26, '2019_09_12_073711_update_media_url', 1),
(27, '2019_10_20_002256_remove_parent_id_in_pages_table', 1),
(28, '2020_03_28_020724_make_column_user_id_nullable_table_revisions', 1),
(29, '2020_05_26_014304_add_column_provider_to_oauth_clients_table', 1),
(31, '2017_05_18_080441_create_payment_tables', 3),
(32, '2020_02_03_144309_update_column_payment_channel', 3),
(33, '2020_02_11_133026_add_description_to_table_payments', 3),
(34, '2020_03_23_093053_update_payments_table', 3),
(35, '2015_06_29_025744_create_audit_history', 4),
(36, '2015_06_18_033822_create_blog_table', 5),
(37, '2019_09_07_035526_update_menu_node_reference_type_for_category', 5),
(38, '2019_09_07_050058_update_slug_reference_for_blog', 5),
(39, '2019_09_07_155716_update_language_meta_for_blog', 5),
(40, '2019_09_08_015552_update_meta_box_data_for_blog', 5),
(41, '2019_10_20_002342_remove_parent_id_in_tags_table', 5),
(42, '2017_10_24_154832_create_newsletter_table', 6),
(45, '2016_06_17_091537_create_contacts_table', 8),
(48, '2017_07_11_140018_create_simple_slider_table', 10),
(49, '2016_10_07_193005_create_translations_table', 11),
(51, '2020_06_21_035242_update_table_simple_slider_items_nullable', 13),
(55, '2020_03_05_041139_create_ecommerce_tables', 14),
(56, '2020_06_24_073338_change_column_currency_in_ce_orders_table', 15),
(57, '2020_06_27_133621_rename_column_state_in_ec_shipping_to_country', 16),
(58, '2020_09_22_135635_update_taxes_table', 17),
(59, '2020_09_29_101006_add_views_into_ec_products_table', 18),
(60, '2020_10_01_152311_make_column_image_in_product_attributes_table_nullable', 18),
(61, '2020_10_05_030817_make_column_charge_id_nullable', 19),
(62, '2020_10_06_073439_improve_ecommerce_database', 20),
(63, '2020_10_18_134416_fix_audit_logs_table', 21),
(64, '2019_01_05_053554_create_jobs_table', 22),
(65, '2020_11_01_040415_update_table_ec_order_addresses', 22),
(66, '2020_11_04_091510_make_column_phone_in_order_addresses_nullable', 23),
(73, '2021_01_01_044147_ecommerce_create_flash_sale_table', 25),
(74, '2016_10_13_150201_create_galleries_table', 26);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newsletters`
--

INSERT INTO `newsletters` (`id`, `email`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'minhsang2603@gmail.com', NULL, 'subscribed', '2020-06-13 01:31:40', '2020-06-13 01:31:40'),
(2, 'john.smith@botble.com', NULL, 'subscribed', '2020-06-13 01:32:55', '2020-06-13 01:32:55');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(4) NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `content`, `user_id`, `image`, `template`, `is_featured`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Homepage', '<div>[simple-slider key=&quot;home-slider&quot;][/simple-slider]</div>\r\n\r\n<div>[product-collections title=&quot;A change of Season&quot; description=&quot;Update your house with our new seasonal trend&quot;][/product-collections]</div>\r\n\r\n<div>[featured-products title=&quot;Our Picks For You&quot; description=&quot;Always find the best ways for you&quot; limit=&quot;8&quot;][/featured-products]</div>\r\n\r\n<div>[trending-products title=&quot;Trending Products&quot; description=&quot;Products on trending&quot; limit=&quot;8&quot;][/trending-products]</div>\r\n\r\n<div>[our-features items=&#39;{&quot;title&quot;: &quot;FREE SHIPPING&quot;, &quot;description&quot;: &quot;Enjoy FREE UK Mainland Delivery with Orders over &pound;150&quot;, &quot;icon&quot;: &quot;feather icon icon-truck&quot;}; {&quot;title&quot;: &quot;SUPPORT 24/7&quot;, &quot;description&quot;: &quot;Contact us 24 hours a day, 7 days a week&quot;, &quot;icon&quot;: &quot;feather icon icon-life-buoy&quot;};{&quot;title&quot;: &quot;30 DAYS RETURN&quot;, &quot;description&quot;: &quot;Simply return it within 30 days for an exchange&quot;, &quot;icon&quot;: &quot;feather icon icon-refresh-ccw&quot;};{&quot;title&quot;: &quot;100% PAYMENT SECURE&quot;, &quot;description&quot;: &quot;We ensure secure payment with PEV&quot;, &quot;icon&quot;: &quot;feather icon icon-shield&quot;}&#39;][/our-features]</div>', 1, NULL, 'homepage', 0, NULL, 'published', '2020-11-07 02:12:50', '2021-03-10 16:16:19'),
(2, 'Blog', '<p style=\"text-align: center\">We always share fashion tips with the hope you guys will find the best style for yourself.<br />Besides, we update the fashion trend as soon as we can.<br />Enjoy your journey!</p>', 1, NULL, 'default', 0, NULL, 'published', '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(3, 'Contact', '<p>[contact-form][/contact-form]</p>', 1, NULL, 'default', 0, NULL, 'published', '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(5, 'about-us', '<p style=\"margin-bottom:0in; text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif;\"><span style=\"line-height:150%\"><span lang=\"EN-GB\" style=\"font-size:14.0pt\"><span style=\"line-height:150%\"><strong>Ashley Ventures &amp; Services</strong> is a new family limited liability business registered with Companies House for England and Wales in 2019, with company No<b>. 12286565</b>. </span></span></span></span></p>\r\n\r\n<p style=\"margin-bottom:0in; text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"margin-bottom:0in; text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif;\"><span style=\"background:white\"><span style=\"line-height:150%\"><span lang=\"EN-GB\" style=\"font-size:14.0pt\"><span style=\"line-height:150%\"><span style=\"color:black\">The immediate idea behind the business is to create an online supermarket or superstore for its Ashley Home+D&eacute;cor brands that offers extensive product selection, excellent customer service and an easy and secure online shopping experience for different types of HOME FRAGRANCE products. </span></span></span><span lang=\"EN-GB\" style=\"font-size:14.0pt\"><span style=\"line-height:150%\"><span style=\"color:#222222\">These products include all kinds or forms of home fragrances developed by the brand from time to time including, Pure Essential Oils, Fragrance oil refills, Scented Candles, Dried Flower Candles, Aromatic Candles, Reed Diffusers, Room sprays, Wax melts, PotPourri, </span></span></span><span lang=\"EN-GB\" style=\"font-size:14.0pt\"><span style=\"line-height:150%\"><span style=\"color:black\">Sleep &amp; Pillow mist and sprays, Linen perfumes, Fabric Sanitiser sprays,</span></span></span><span lang=\"EN-GB\" style=\"font-size:14.0pt\"><span style=\"line-height:150%\"><span style=\"color:#222222\"> Car diffusers, and body perfumes/sprays. Other related products of the company will include home fragrance equipment such as Electric Diffuser, Ceramic &amp; Glass diffusers, Aroma Lamps Electric wax melt warmer, customizable plug-ins, Aromatherapy Diffusers, </span></span></span><span lang=\"EN-GB\" style=\"font-size:14.0pt\"><span style=\"line-height:150%\"><span style=\"color:black\">Air Humidifier Essential Oil Diffuser, </span></span></span><span lang=\"EN-GB\" style=\"font-size:14.0pt\"><span style=\"line-height:150%\"><span style=\"color:#222222\">Aroma</span></span></span><span lang=\"EN-GB\" style=\"font-size:14.0pt\"><span style=\"line-height:150%\"><span style=\"color:black\"> Lamp Crafts, Essential Oil Diffuser, etc. </span></span></span><span lang=\"EN-GB\" style=\"font-size:14.0pt\"><span style=\"line-height:150%\"><span style=\"color:black\">The online store will, in the short term, also sell home decorative products and equipment from different makers, top line designers and other medium line producers from anywhere and everywhere in the world. </span></span></span></span></span></span></p>\r\n\r\n<p style=\"margin-bottom:0in; text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"margin-bottom:0in; text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif;\"><span style=\"line-height:150%\"><span lang=\"EN-GB\" style=\"font-size:14.0pt\"><span style=\"line-height:150%\">The dream and vision of the promoters of Ashley Home+D&eacute;cor brand, and&nbsp; specifically for the home fragrance products, is to ensure that every space of human dwelling, be it public or private spaces, business or residential spaces, gives a pleasing smell that <b><u>relieves stress, reduces fatigues, welcomes the mind, relaxes the soul and creates a delightful ambiance, characterized by the soothing effects of aromatherapy</u></b>. </span></span></span></span></p>\r\n\r\n<p style=\"margin-bottom:0in; text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"margin-bottom:0in; text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif;\"><span style=\"line-height:150%\"><span lang=\"EN-GB\" style=\"font-size:14.0pt\"><span style=\"line-height:150%\">The mission of the business is that any space that its products, systems and services occupies creates <u>an atmosphere of &ldquo;a garden of spring&rdquo;, an atmosphere that &ldquo;breathes out elements of friendliness, love, excitement, beauty and that is always welcoming for people of different backgrounds, tastes and preferences</u>&rdquo;, using only sustainably sourced organic essential oils of the highest grade fragrances. </span></span></span></span></p>\r\n\r\n<p style=\"margin-bottom:0in; text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"margin-bottom:0in; text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif;\"><span style=\"line-height:150%\"><span lang=\"EN-GB\" style=\"font-size:14.0pt\"><span style=\"line-height:150%\">Every fragranced products of Ashley&rsquo;s are being crafted with the highest quality ingredients to ensure a positive experience and to bring the healing properties of plants and essential oils, as well as the many benefits of aromatherapy thus providing well-being through an often-overlooked &ldquo;king of the senses&rdquo;, the sense of smell that humans can&rsquo;t avoid.</span></span></span></span></p>\r\n\r\n<p style=\"margin-bottom:0in; text-align:justify\">&nbsp;</p>\r\n\r\n<p><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif;\"><span lang=\"EN-GB\" style=\"font-size:14.0pt\"><span style=\"line-height:107%\">It is our intention to evolve Ashley Home + D&eacute;cor in the short term (3 years) as a reputational and complete online lifestyle shop that will be notable as an epiphany of quality and innovation for all home related furnishing, artwork, floral, fragrance and individual accessories that pays attention to human emotions and tastes and as a one stop shop for a whole set solutions for aromatherapy product and accessories.</span></span></span></p>', 1, NULL, 'default', 0, 'About Ashley', 'published', '2021-01-11 23:56:31', '2021-01-11 23:56:31');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `charge_id` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `refunded_amount` decimal(15,2) UNSIGNED DEFAULT NULL,
  `refund_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `amount`, `currency`, `user_id`, `charge_id`, `payment_channel`, `created_at`, `updated_at`, `description`, `order_id`, `status`, `payment_type`, `customer_id`, `refunded_amount`, `refund_note`) VALUES
(1, '306.60', 'USD', 0, 'T2642VHUZN', 'cod', '2020-11-19 17:57:08', '2020-11-19 17:57:08', NULL, 1, 'pending', 'confirm', NULL, NULL, NULL),
(2, '133.42', 'USD', 0, 'BMC8WQY0DM', 'bank_transfer', '2020-11-19 18:02:16', '2020-11-19 18:02:16', NULL, 2, 'pending', 'confirm', NULL, NULL, NULL),
(3, '410.03', 'GBP', 0, 'TGXMPSXDTY', 'cod', '2020-11-20 23:17:32', '2020-11-20 23:17:32', NULL, 3, 'pending', 'confirm', NULL, NULL, NULL),
(4, '15.99', 'GBP', 0, 'PAYID-L7XBBCY9AW25855FL343521X', 'paypal', '2020-12-31 22:58:55', '2020-12-31 22:58:55', NULL, 4, 'completed', 'confirm', NULL, NULL, NULL),
(5, '24.99', 'GBP', 0, 'B2LJSQ9AJP', 'bank_transfer', '2021-03-10 02:29:41', '2021-03-10 02:29:41', NULL, 6, 'pending', 'confirm', NULL, NULL, NULL),
(6, '29.99', 'GBP', 0, 'M4SF5DFCWP', 'bank_transfer', '2021-03-12 23:15:27', '2021-03-12 23:15:27', NULL, 12, 'pending', 'confirm', NULL, NULL, NULL),
(7, '29.99', 'GBP', 0, 'VCYN8RBSPI', 'bank_transfer', '2021-04-15 19:17:26', '2021-04-15 19:17:26', NULL, 15, 'pending', 'confirm', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `name`, `description`, `content`, `status`, `author_id`, `author_type`, `is_featured`, `image`, `views`, `format_type`, `created_at`, `updated_at`) VALUES
(1, '4 Expert Tips On How To Choose The Right Men’s Wallet', 'You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" height=\"375\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" height=\"400\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" height=\"400\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/1.jpg', 740, NULL, '2020-11-07 02:12:50', '2021-04-28 01:59:12'),
(2, 'Sexy Clutches: How to Buy & Wear a Designer Clutch Bag', 'There isn’t much a girl can’t handle with the right accessories. That’s why the perfect women’s clutch bag is a wardrobe essential for first dates and spring weddings.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" height=\"375\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" height=\"400\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" height=\"400\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/2.jpg', 2505, NULL, '2020-11-07 02:12:50', '2021-04-13 22:08:29'),
(3, 'The Top 2020 Handbag Trends to Know', 'For the handbag obsessives, let\'s dive into the latter a little more. This year will bring a fresh array of bag designs, and already we\'ve gotten a sneak peek of what both spring and fall 2020 collections have to offer/', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" height=\"375\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" height=\"400\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" height=\"400\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/3.jpg', 1838, NULL, '2020-11-07 02:12:50', '2021-04-29 17:59:15'),
(4, 'How to Match the Color of Your Handbag With an Outfit', 'To match your multi-colored purses with your favorite outfits, simply select a complementary handbag hue that will make your outfit pop for work or the weekend.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" height=\"375\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" height=\"400\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" height=\"400\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/4.jpg', 1231, NULL, '2020-11-07 02:12:50', '2021-04-14 21:17:33'),
(5, 'How to Care for Leather Bags', 'A leather bag is a special, near-universally beloved object, appreciated in equal measure by bon-vivants of both sexes, who cherish the supple hand, understated burnish and heady smell that can only emanate from premium quality skin.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" height=\"375\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" height=\"400\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" height=\"400\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/5.jpg', 667, NULL, '2020-11-07 02:12:50', '2021-04-29 19:56:45'),
(6, 'We\'re Crushing Hard on Summer\'s 10 Biggest Bag Trends', 'Summer is just around the corner, and there\'s no easier way to amp up your new-season look than with a chic, new handbag. Whether you\'re wearing basic sweat shorts and a tank top or a pretty floral maxi dress, a bag is an effortless way to add interest to all your summer ensembles.', '<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" height=\"375\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" height=\"400\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" height=\"400\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/6.jpg', 2408, NULL, '2020-11-07 02:12:50', '2021-04-20 14:02:33');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `category_id`, `post_id`) VALUES
(45, 3, 4),
(50, 2, 3),
(52, 1, 1),
(53, 2, 2),
(54, 3, 5),
(55, 4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `tag_id`, `post_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 1, 2),
(7, 2, 2),
(8, 3, 2),
(9, 4, 2),
(10, 5, 2),
(11, 1, 3),
(12, 2, 3),
(13, 3, 3),
(14, 4, 3),
(15, 5, 3),
(16, 1, 4),
(17, 2, 4),
(18, 3, 4),
(19, 4, 4),
(20, 5, 4),
(21, 1, 5),
(22, 2, 5),
(23, 3, 5),
(24, 4, 5),
(25, 5, 5),
(26, 1, 6),
(27, 2, 6),
(28, 3, 6),
(29, 4, 6),
(30, 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `revisions`
--

INSERT INTO `revisions` (`id`, `revisionable_type`, `revisionable_id`, `user_id`, `key`, `old_value`, `new_value`, `created_at`, `updated_at`) VALUES
(1, 'Botble\\Page\\Models\\Page', 1, 1, 'template', 'default', 'homepage', '2020-06-12 21:25:41', '2020-06-12 21:25:41'),
(2, 'Botble\\Blog\\Models\\Post', 3, 1, 'description', NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an…', '2020-06-13 01:47:37', '2020-06-13 01:47:37'),
(3, 'Botble\\Blog\\Models\\Post', 1, 1, 'description', NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an…', '2020-06-13 01:47:47', '2020-06-13 01:47:47'),
(4, 'Botble\\Blog\\Models\\Post', 2, 1, 'description', NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an…', '2020-06-13 01:47:54', '2020-06-13 01:47:54'),
(5, 'Botble\\Blog\\Models\\Post', 3, 1, 'image', 'news/1.jpg', 'news/tui-120.png', '2020-06-25 03:59:26', '2020-06-25 03:59:26'),
(6, 'Botble\\Blog\\Models\\Post', 2, 1, 'image', 'news/1.jpg', 'news/tui-123.png', '2020-06-25 04:00:49', '2020-06-25 04:00:49'),
(7, 'Botble\\Blog\\Models\\Post', 1, 1, 'image', 'news/1.jpg', 'news/tui-04.jpg', '2020-06-25 04:01:49', '2020-06-25 04:01:49'),
(8, 'Botble\\Page\\Models\\Page', 4, 1, 'template', 'full-width', 'default', '2021-01-05 18:29:03', '2021-01-05 18:29:03'),
(9, 'Botble\\Page\\Models\\Page', 4, 1, 'status', 'published', 'draft', '2021-01-05 18:29:37', '2021-01-05 18:29:37'),
(10, 'Botble\\Page\\Models\\Page', 4, 1, 'status', 'draft', 'pending', '2021-01-05 18:30:10', '2021-01-05 18:30:10');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'theme', 'september', NULL, NULL),
(6, 'activated_plugins', '[\"payment\",\"audit-log\",\"analytics\",\"backup\",\"cookie-consent\",\"newsletter\",\"contact\",\"captcha\",\"simple-slider\",\"translation\",\"blog\",\"ecommerce\",\"social-login\",\"sagepay\",\"gallery\",\"mollie\",\"paystack\",\"razorpay\",\"sslcommerz\"]', NULL, NULL),
(7, 'membership_authorization_at', '2021-04-23 15:30:11', NULL, NULL),
(12, 'time_zone', 'UTC', NULL, NULL),
(13, 'enable_send_error_reporting_via_email', '0', NULL, NULL),
(16, 'admin_title', 'Ashley Home + Décor', NULL, NULL),
(17, 'rich_editor', 'ckeditor', NULL, NULL),
(18, 'default_admin_theme', 'default', NULL, NULL),
(19, 'enable_change_admin_theme', '1', NULL, NULL),
(20, 'enable_multi_language_in_admin', '1', NULL, NULL),
(21, 'enable_cache', '0', NULL, NULL),
(22, 'cache_time', '10', NULL, NULL),
(23, 'cache_admin_menu_enable', '0', NULL, NULL),
(26, 'cache_time_site_map', '3600', NULL, NULL),
(27, 'show_admin_bar', '1', NULL, NULL),
(31, 'cookie_consent_enable', '1', NULL, NULL),
(38, 'enable_captcha', '0', NULL, NULL),
(41, 'simple_slider_using_assets', '1', NULL, NULL),
(42, 'admin_email', 'sales@ashleyhdf.co.uk', NULL, NULL),
(68, 'blog_page_id', '2', NULL, NULL),
(75, 'ecommerce_store_name', 'Ashley Home + Décor', NULL, NULL),
(76, 'ecommerce_store_phone', '+447438944835', NULL, NULL),
(77, 'ecommerce_store_address', 'Grosvenor House,  11 St. Paul’s Square', NULL, NULL),
(78, 'ecommerce_store_state_id', '1', NULL, NULL),
(79, 'ecommerce_store_city_id', '1', NULL, NULL),
(80, 'ecommerce_store_order_prefix', 'ST', NULL, NULL),
(82, 'ecommerce_store_weight_unit', 'g', NULL, NULL),
(83, 'ecommerce_store_width_height_unit', 'cm', NULL, NULL),
(84, 'ecommerce_currencies_is_default', '0', NULL, NULL),
(103, 'show_on_front', '1', NULL, NULL),
(104, 'ecommerce_store_state', 'Birmingham B3 1RB', NULL, NULL),
(105, 'ecommerce_store_city', 'England', NULL, NULL),
(112, 'payment_cod_name', 'Cash on delivery (COD)', NULL, NULL),
(114, 'payment_cod_status', '0', NULL, NULL),
(115, 'payment_bank_transfer_name', 'Bank transfer', NULL, NULL),
(117, 'payment_bank_transfer_status', '0', NULL, NULL),
(118, 'payment_paypal_name', 'Pay online via PayPal', NULL, NULL),
(121, 'payment_paypal_mode', '1', NULL, NULL),
(122, 'payment_paypal_status', '0', NULL, NULL),
(123, 'payment_stripe_name', 'Pay online via Stripe', NULL, NULL),
(126, 'payment_stripe_status', '0', NULL, NULL),
(127, 'payment_cod_description', 'Please pay money directly to the postman, if you choose cash on delivery method (COD).', NULL, NULL),
(133, 'ecommerce_store_country', 'GB', NULL, NULL),
(159, 'captcha_type', 'v2', NULL, NULL),
(210, 'permalink-botble-page-models-page', '', NULL, NULL),
(211, 'permalink-botble-blog-models-post', 'blog', NULL, NULL),
(212, 'permalink-botble-blog-models-category', 'blog', NULL, NULL),
(213, 'permalink-botble-blog-models-tag', 'tag', NULL, NULL),
(214, 'permalink-botble-ecommerce-models-product', 'products', NULL, NULL),
(215, 'permalink-botble-ecommerce-models-brand', 'brands', NULL, NULL),
(216, 'permalink-botble-ecommerce-models-productcategory', 'product-categories', NULL, NULL),
(217, 'permalink-botble-ecommerce-models-producttag', 'product-tags', NULL, NULL),
(219, 'ecommerce_shopping_cart_enabled', '1', NULL, NULL),
(220, 'ecommerce_review_enabled', '1', NULL, NULL),
(221, 'payment_paypal_client_id', 'AVxIe9PkQHUA4y3xHPA-3isEmsjOmxSzTXTAg4mTynsvDVOMuDtprtJg8zSiZzb1uw60iO9POnrDr1C4', NULL, NULL),
(222, 'payment_paypal_client_secret', 'EB_CO6F3xUKnBuzWIDq0p3lwSVvMdwgYmBlvShxjncCNSuwWQuXUsWkLmZj1naDTYhRsJ-Yrq9DPV4DF', NULL, NULL),
(223, 'locale', 'en', NULL, NULL),
(224, 'locale_direction', 'ltr', NULL, NULL),
(232, 'captcha_hide_badge', '0', NULL, NULL),
(266, 'ecommerce_enable_quick_buy_button', '1', NULL, NULL),
(267, 'ecommerce_quick_buy_target_page', 'checkout', NULL, NULL),
(268, 'homepage_id', '1', NULL, NULL),
(283, 'theme-september-site_title', 'Ashley Home + Décor', NULL, NULL),
(284, 'theme-september-favicon', 'general/favicon-2.png', NULL, NULL),
(285, 'theme-september-logo', 'general/rsz-rlogo-1.png', NULL, NULL),
(286, 'theme-september-seo_og_image', 'general/rsz-rlogo-1.png', NULL, NULL),
(287, 'theme-september-address', 'Grosvenor House,  11 St. Paul’s Square  Birmingham B3 1RB England, United Kingdom', NULL, NULL),
(288, 'theme-september-hotline', '+44 7438 944 835', NULL, NULL),
(289, 'theme-september-facebook', 'https://facebook.com', NULL, NULL),
(290, 'theme-september-twitter', 'https://twitter.com', NULL, NULL),
(291, 'theme-september-youtube', 'https://youtube.com', NULL, NULL),
(292, 'theme-september-linkedin', 'https://linkedin.com', NULL, NULL),
(293, 'theme-september-pinterest', 'https://pinterest.com', NULL, NULL),
(294, 'theme-september-instagram', 'https://instagram.com', NULL, NULL),
(295, 'theme-september-homepage_id', '1', NULL, NULL),
(296, 'theme-september-blog_page_id', '2', NULL, NULL),
(298, 'licensed_to', 'jonahrchirika', NULL, NULL),
(299, 'theme-september-primary_font', 'Poppins', NULL, NULL),
(300, 'theme-september-primary_color', '#427588', NULL, NULL),
(301, 'theme-september-secondary_color', '#2C1DFF', NULL, NULL),
(302, 'theme-september-facebook_chat_enabled', 'yes', NULL, NULL),
(303, 'theme-september-facebook_page_id', '', NULL, NULL),
(304, 'theme-september-facebook_comment_enabled_in_post', 'yes', NULL, NULL),
(305, 'theme-september-facebook_comment_enabled_in_product', 'yes', NULL, NULL),
(306, 'theme-september-show_site_name', '0', NULL, NULL),
(307, 'theme-september-seo_title', '', NULL, NULL),
(308, 'theme-september-seo_description', '', NULL, NULL),
(309, 'theme-september-number_of_products_per_page', '12', NULL, NULL),
(310, 'theme-september-max_filter_price', '100000', NULL, NULL),
(311, 'theme-september-product_page_banner_title', '', NULL, NULL),
(312, 'theme-september-product_page_banner_image', '', NULL, NULL),
(313, 'theme-september-number_of_posts_in_a_category', '12', NULL, NULL),
(314, 'theme-september-number_of_posts_in_a_tag', '12', NULL, NULL),
(315, 'theme-september-cookie_consent_enable', 'yes', NULL, NULL),
(316, 'theme-september-cookie_consent_message', 'Your experience on this site will be improved by allowing cookies.', NULL, NULL),
(317, 'theme-september-cookie_consent_button_text', 'Allow cookies', NULL, NULL),
(318, 'theme-september-cookie_consent_background_color', '#000000', NULL, NULL),
(319, 'theme-september-cookie_consent_text_color', '#FFFFFF', NULL, NULL),
(320, 'theme-september-cookie_consent_max_width', '1170', NULL, NULL),
(321, 'admin_logo', 'general/back-logo.png', NULL, NULL),
(322, 'admin_favicon', 'general/favicon-2.png', NULL, NULL),
(331, 'plugins_ecommerce_customer_new_order_status', '0', NULL, NULL),
(332, 'plugins_ecommerce_customer_cancel_order_status', '0', NULL, NULL),
(333, 'plugins_ecommerce_customer_delivery_order_status', '0', NULL, NULL),
(334, 'plugins_ecommerce_admin_new_order_status', '0', NULL, NULL),
(335, 'plugins_ecommerce_order_confirm_status', '0', NULL, NULL),
(336, 'plugins_ecommerce_order_confirm_payment_status', '0', NULL, NULL),
(337, 'plugins_ecommerce_order_recover_status', '0', NULL, NULL),
(338, 'plugins_contact_notice_status', '0', NULL, NULL),
(339, 'plugins_newsletter_subscriber_email_status', '0', NULL, NULL),
(340, 'plugins_newsletter_admin_email_status', '0', NULL, NULL),
(351, 'payment_paypal_description', 'Payment with PayPal', NULL, NULL),
(352, 'payment_sagepay_name', 'Online payment via Sagepay', NULL, NULL),
(353, 'payment_sagepay_description', 'Payment with Sagepay', NULL, NULL),
(354, 'payment_sagepay_vendor_id', 'ashleyventuresa', NULL, NULL),
(355, 'payment_sagepay_public_secret_id', 'u9lBi8kOoubDdxsHPDe380O057oOyhS4U1VlBm6Tgw1SNhp2Q9', NULL, NULL),
(356, 'payment_sagepay_private_secret_id', 'u9lBi8kOoubDdxsHPDe380O057oOyhS4U1VlBm6Tgw1SNhp2Q9', NULL, NULL),
(357, 'payment_sagepay_callback_url', 'http://127.0.0.1:8000/sagepay/payment/callback', NULL, NULL),
(358, 'payment_sagepay_mode', '0', NULL, NULL),
(359, 'payment_sagepay_status', '1', NULL, NULL),
(360, 'default_payment_method', 'sagepay', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `simple_sliders`
--

CREATE TABLE `simple_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `simple_sliders`
--

INSERT INTO `simple_sliders` (`id`, `name`, `key`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Home slider', 'home-slider', NULL, 'published', '2020-11-07 02:12:48', '2020-11-07 02:12:48');

-- --------------------------------------------------------

--
-- Table structure for table `simple_slider_items`
--

CREATE TABLE `simple_slider_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `simple_slider_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `order` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `simple_slider_items`
--

INSERT INTO `simple_slider_items` (`id`, `simple_slider_id`, `title`, `image`, `link`, `description`, `order`, `created_at`, `updated_at`) VALUES
(1, 1, 'New Collection', 'sliders/essential-oil2-fliped.jpg', '/products', 'Your styling is not a real one—not until you decide to add our products to it. That’s when the stories can move in.', 1, '2020-11-07 02:12:48', '2021-01-27 16:24:58'),
(2, 1, 'Reed Diffusers & Candle Sets', 'sliders/reed-diffusers-1.jpg', '/products', 'Behind every attractive room, there should be a very good reason.', 2, '2020-11-07 02:12:48', '2021-01-27 19:05:59'),
(3, 1, 'Aromatherapy Scented Candles infused in petals', 'sliders/pexels-jasmin-chew-5661223.jpg', '/products', 'Ashley Ventures & different types of HOME FRAGRANCE products to inspire your life.', 3, '2020-11-07 02:12:48', '2021-01-26 01:30:18'),
(4, 1, 'Essential Oil for your awesome daily smell.', 'sliders/essential-oil3-1.jpg', '#', 'Choose from our vast array of wonderful products', 0, '2021-01-08 16:11:20', '2021-01-27 17:49:35');

-- --------------------------------------------------------

--
-- Table structure for table `slugs`
--

CREATE TABLE `slugs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slugs`
--

INSERT INTO `slugs` (`id`, `key`, `reference_id`, `reference_type`, `prefix`, `created_at`, `updated_at`) VALUES
(862, 'candlelight', 1, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2020-11-07 02:12:22', '2021-01-20 20:28:06'),
(864, 'cocodor', 3, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2020-11-07 02:12:22', '2021-02-12 22:45:27'),
(884, 'trio-set-of-3-mini-votive-candles-gift-box-pineapple-scent-50g', 4, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-11-07 02:12:41', '2020-11-25 15:49:53'),
(885, 'wild-fig-scent-1', 5, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-11-07 02:12:41', '2020-11-25 15:42:15'),
(886, 'black-lily-and-pomegranate-1', 6, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-11-07 02:12:41', '2021-01-14 22:59:14'),
(887, 'white-led-aroma-lamp', 7, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-11-07 02:12:41', '2020-12-04 13:20:03'),
(889, 'general', 1, 'Botble\\Blog\\Models\\Tag', 'tag', '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(890, 'design', 2, 'Botble\\Blog\\Models\\Tag', 'tag', '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(891, 'jquery', 3, 'Botble\\Blog\\Models\\Tag', 'tag', '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(892, 'branding', 4, 'Botble\\Blog\\Models\\Tag', 'tag', '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(893, 'modern', 5, 'Botble\\Blog\\Models\\Tag', 'tag', '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(894, 'ecommerce', 1, 'Botble\\Blog\\Models\\Category', 'blog', '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(895, 'fashion', 2, 'Botble\\Blog\\Models\\Category', 'blog', '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(896, 'electronic', 3, 'Botble\\Blog\\Models\\Category', 'blog', '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(897, 'commercial', 4, 'Botble\\Blog\\Models\\Category', 'blog', '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(898, '4-expert-tips-on-how-to-choose-the-right-mens-wallet', 1, 'Botble\\Blog\\Models\\Post', 'blog', '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(899, 'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag', 2, 'Botble\\Blog\\Models\\Post', 'blog', '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(900, 'the-top-2020-handbag-trends-to-know', 3, 'Botble\\Blog\\Models\\Post', 'blog', '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(901, 'how-to-match-the-color-of-your-handbag-with-an-outfit', 4, 'Botble\\Blog\\Models\\Post', 'blog', '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(902, 'how-to-care-for-leather-bags', 5, 'Botble\\Blog\\Models\\Post', 'blog', '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(903, 'were-crushing-hard-on-summers-10-biggest-bag-trends', 6, 'Botble\\Blog\\Models\\Post', 'blog', '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(904, 'homepage', 1, 'Botble\\Page\\Models\\Page', '', '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(905, 'blog', 2, 'Botble\\Page\\Models\\Page', '', '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(906, 'contact', 3, 'Botble\\Page\\Models\\Page', '', '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(913, 'snapshot-standard', 16, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-11-20 14:25:27', '2020-11-20 14:25:27'),
(914, 'the-marc-jacobs', 27, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-11-20 14:29:59', '2020-11-20 14:29:59'),
(917, 'cyan-boheme', 23, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-11-22 12:19:27', '2020-11-22 12:19:27'),
(921, 'white-rose-gold-aroma-touch-lamp', 31, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 13:04:25', '2020-12-04 13:04:25'),
(922, 'red-silver-xmas-touch-lamp', 32, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 13:13:35', '2020-12-04 13:13:35'),
(923, 'purple-silver-hearts-touch-lamps', 33, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 13:17:00', '2020-12-04 13:17:00'),
(924, 'purple-silver-aroma-touch-lamp', 34, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 13:25:42', '2020-12-04 13:25:42'),
(925, 'white-rose-gold-hearts-touch-lamp', 35, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 13:37:58', '2020-12-04 13:37:58'),
(927, 'hearts-colour-changing-led-silver-casing', 36, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 13:51:49', '2020-12-04 13:51:49'),
(928, 'hearts-colour-changing-led-black-casing', 37, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 14:24:08', '2020-12-04 14:24:08'),
(929, 'maple-leaf-colour-changing-led-silver-casing', 38, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 14:52:47', '2020-12-04 14:52:47'),
(930, 'universe-colour-changing-led-silver-casing', 39, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 14:56:04', '2020-12-04 14:56:04'),
(931, 'walnut-tree-wood-grain-colour-changing-led', 40, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 15:15:05', '2020-12-04 15:15:05'),
(932, 'xmas-colour-changing-led-silver', 41, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 15:37:59', '2020-12-04 15:37:59'),
(933, 'xmas-colour-changing-led-white', 42, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 15:41:53', '2020-12-04 15:41:53'),
(934, 'rose-gold-led-aroma-lamp', 43, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 15:48:23', '2020-12-04 15:48:23'),
(935, 'butterflies-3d-lamp-silver-base', 44, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 15:58:09', '2020-12-04 15:58:09'),
(936, 'star-fireworks-3d-lamp-silver', 45, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 16:08:29', '2020-12-04 16:08:29'),
(937, 'midas-2-in-1-classic-fragrance-warmer', 46, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 16:12:25', '2020-12-04 16:12:25'),
(940, 'simple-large-wax-filled-pot-2-wick-candle-black-lily-and-pomegranate-scent', 49, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 18:17:31', '2020-12-04 18:17:31'),
(941, 'candlelight-great-minds-drink-alike-reed-diffuser-in-gift-box-midnight-rose-scent', 50, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 18:25:17', '2020-12-04 18:25:17'),
(942, 'candlelight-great-minds-drink-alike-large-wax-filled-pot-candle-midnight-rose-scent', 51, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 18:31:02', '2020-12-04 18:31:02'),
(943, 'candlelight-keep-it-sassy-reed-diffuser-in-gift-box-white-flowers-scent', 52, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 18:36:09', '2020-12-04 18:36:09'),
(945, 'candlelight-keep-it-sassy-large-wax-filled-pot-candle-white-flowers-scent', 54, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 18:40:57', '2020-12-04 18:40:57'),
(946, 'candlelight-lets-get-it-on-reed-diffuser-in-gift-box-honeysuckle-and-ivy-scent', 55, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 18:45:16', '2020-12-04 18:45:16'),
(948, 'candlelight-lets-get-it-on-large-wax-filled-pot-candle-honeysucke-and-ivy-scent', 57, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 18:49:19', '2020-12-04 18:49:19'),
(949, 'candlelight-bohemian-reed-diffuser-in-gift-box-amber-lily-scent', 58, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 18:53:12', '2020-12-04 18:53:12'),
(950, 'candlelight-bohemian-small-tin-candle-amber-lily-scent', 59, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 18:58:58', '2020-12-04 18:58:58'),
(951, 'candlelight-let-there-be-candlelight-reed-diffuser-in-gift-box-orangeblossom-musk-scent', 60, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 19:05:58', '2020-12-04 19:05:58'),
(952, 'candlelight-let-there-be-candlelight-large-wax-filled-pot-candle-orangeblossom-musk-scent', 61, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 19:12:40', '2020-12-04 19:12:40'),
(953, 'candlelight-morocco-reed-diffuser-in-gift-box-moroccan-red-cinnamon-scent', 62, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 19:19:00', '2020-12-04 19:19:00'),
(954, 'candlelight-morocco-small-wax-filled-pot-candle-in-gift-box-moroccan-red-cinnamon-scent', 63, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 19:25:29', '2020-12-04 19:25:29'),
(956, 'candlelight-morocco-wax-filled-pot-2-wick-candle-moroccan-red-cinnamon-scent', 65, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 19:39:43', '2020-12-04 19:39:43'),
(957, 'candlelight-morocco-set-of-3-mini-votive-candles-in-gift-box-moroccan-red-cinnamon-scent', 66, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 19:53:41', '2020-12-04 19:53:41'),
(958, 'candlelight-bohemian-reed-diffuser-in-gift-box-angel-flower-scent', 67, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 20:01:11', '2020-12-04 20:01:11'),
(959, 'candlelight-bohemian-set-of-3-small-tin-candles-amber-shea-angel-flower-amber-lily-scent', 68, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 20:05:14', '2020-12-04 20:05:14'),
(961, 'candlelight-japan-reed-diffuser-in-gift-box-japanese-wild-summer-cherry-scent', 70, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 20:18:17', '2020-12-04 20:18:17'),
(962, 'candlelight-japan-small-wax-filled-pot-candle-in-gift-box-japanese-wild-summer-cherry-scent', 71, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 20:24:47', '2020-12-04 20:24:47'),
(963, 'candlelight-japan-wax-filled-pot-2-wick-candle-japanese-wild-summer-cherry-scent', 72, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 20:29:59', '2020-12-04 20:29:59'),
(964, 'candlelight-japan-set-of-3-mini-votive-candles-in-gift-box-japanese-wild-summer-cherry-scent', 73, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 20:36:20', '2020-12-04 20:36:20'),
(965, 'candlelight-india-reed-diffuser-is-packed-in-a-stunning-indian-inspired-gift-box-with-the-pot-itself-being-printed-in-a', 74, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 22:32:30', '2020-12-04 22:32:30'),
(966, 'candlelight-india-small-wax-filled-pot-candle-in-gift-box-kashmir-and-fig-scent', 75, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 22:37:33', '2020-12-04 22:37:33'),
(967, 'candlelight-india-wax-filled-pot-2-wick-candle-kashmir-and-fig-scent', 76, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 22:41:07', '2020-12-04 22:41:07'),
(968, 'candlelight-india-set-of-3-mini-votive-candles-in-gift-box-kashmir-and-fig-scent', 77, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 22:45:08', '2020-12-04 22:45:08'),
(969, 'candlelight-siesta-reed-diffuser-in-gift-box-pineapple-scent', 78, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-04 23:37:46', '2020-12-04 23:37:46'),
(1005, 'candlelight-chinoiserie-reed-diffuser-oriental-flower-scent', 108, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-05 23:00:22', '2020-12-05 23:00:22'),
(1006, 'candlelight-chinoiserie-2-wick-wax-filled-candle-pot-oriental-flower-scent', 109, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-05 23:03:56', '2020-12-05 23:03:56'),
(1007, 'candlelight-chinoiserie-set-of-3-wax-filled-candle-pots-oriental-flower-scent', 110, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-05 23:14:59', '2020-12-05 23:14:59'),
(1008, 'candlelight-chinoiserie-reed-diffuser-oriental-lily-scent', 111, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-05 23:21:19', '2020-12-05 23:21:19'),
(1009, 'candlelight-chinoiserie-2-wick-wax-filled-candle-pot-oriental-lily-scent', 112, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-05 23:25:12', '2020-12-05 23:25:12'),
(1010, 'Candlelight Chinoiserie Set of 3 Wax Filled Candle Pots Oriental Lily Scent', 113, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-05 23:34:18', '2020-12-05 23:34:18'),
(1011, 'candlelight-chinoiserie-reed-diffuser-aromatic-shea-scent', 114, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-05 23:39:33', '2020-12-05 23:39:33'),
(1012, 'candlelight-chinoiserie-2-wick-wax-filled-candle-pot-aromatic-shea-scent', 115, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-05 23:43:24', '2020-12-05 23:43:24'),
(1013, 'candlelight-chinoiserie-set-of-3-wax-filled-candle-pots-aromatic-shea-scent', 116, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 00:18:16', '2020-12-06 00:18:16'),
(1015, 'candlelight-spa-day-relax-reed-diffuser-lavender-vanilla-scent', 117, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 00:24:32', '2020-12-06 00:24:32'),
(1016, 'candlelight-spa-day-relax-2-wick-wax-filled-glass-candle-pot-lavender-vanilla-scent', 118, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 00:27:59', '2020-12-06 00:27:59'),
(1018, 'candlelight-spa-day-relax-set-of-3-glass-wax-filled-pots-lavender-vanilla-scent', 119, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 00:30:52', '2020-12-06 00:30:52'),
(1019, 'candlelight-spa-day-relax-round-wax-filled-pot-lavender-vanilla-scent', 120, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 00:34:22', '2020-12-06 00:34:22'),
(1020, 'candlelight-spa-day-revitalise-reed-diffuser-green-tea-scent', 121, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 00:37:49', '2020-12-06 00:37:49'),
(1021, 'candlelight-spa-day-revitalise-2-wick-wax-filled-glass-candle-pot-green-tea-scent', 122, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 00:41:42', '2020-12-06 00:41:42'),
(1022, 'candlelight-spa-day-revitalise-set-of-3-glass-wax-filled-pots-green-tea-scent', 123, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 00:45:28', '2020-12-06 00:45:28'),
(1023, 'candlelight-spa-day-revitalise-round-wax-filled-pot-green-tea-scent', 124, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 00:48:48', '2020-12-06 00:48:48'),
(1024, 'candlelight-spa-day-restore-reed-diffuser-aloe-vera-cucumber-scent', 125, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 00:54:13', '2020-12-06 00:54:13'),
(1025, 'Candlelight Spa Day Restore 2 Wick Wax Filled Glass Candle Pot Aloe Vera & Cucumber Scent', 126, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 01:16:05', '2020-12-06 01:16:05'),
(1026, 'candlelight-spa-day-restore-round-wax-filled-pot-aloe-vera-cucumber-scent', 127, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 01:23:56', '2020-12-06 01:23:56'),
(1027, 'candlelight-animal-luxe-reed-diffuser-leopard-midnight-pomegranate-scent', 128, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 01:30:40', '2020-12-06 01:30:40'),
(1029, 'candlelight-animal-luxe-2-wick-wax-filled-candle-pot-midnight-pomegranate-scent', 129, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 01:41:04', '2020-12-06 01:41:04'),
(1030, 'candlelight-animal-luxe-set-of-3-wax-filled-candle-pots-with-leopard-print-midnight-pomegranate-scent', 130, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 01:44:00', '2020-12-06 01:44:00'),
(1031, 'candlelight-animal-luxe-round-wax-filled-candle-pot-with-leopard-print-midnight-pomegranate-scent', 131, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 01:47:38', '2020-12-06 01:47:38'),
(1034, 'katie-alice-vintage-indigo-2-wick-wax-filled-candle-pot-thai-flower-scent', 134, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 02:03:27', '2020-12-06 02:03:27'),
(1035, 'katie-alice-vintage-indigo-set-of-3-wax-filled-candles-thai-flower-scent', 135, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 02:07:10', '2020-12-06 02:07:10'),
(1036, 'katie-alice-vintage-indigo-frosted-glass-wax-filled-jar-thai-flower-scent', 136, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 02:10:24', '2020-12-06 02:10:24'),
(1038, 'katie-alice-vintage-indigo-2-wick-wax-filled-candle-pot-thai-flower-scent-1', 138, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 02:51:44', '2020-12-06 02:51:44'),
(1040, 'katie-alice-wild-apricity-frosted-glass-wax-filled-jar-angel-flower-scent', 139, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 04:04:31', '2020-12-06 04:04:31'),
(1041, 'katie-alice-wild-apricity-set-of-3-wax-filled-candles-angel-flower-scent', 140, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 04:14:08', '2020-12-06 04:14:08'),
(1043, 'katie-alice-bohemian-spirit-2-wick-wax-filled-candle-pot-amber-lily-scent', 142, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 04:23:20', '2020-12-06 04:23:20'),
(1044, 'katie-alice-bohemian-spirit-frosted-glass-wax-filled-jar-amber-lily-scent', 143, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 04:26:39', '2020-12-06 04:26:39'),
(1045, 'katie-alice-bohemian-spirit-set-of-3-wax-filled-candles-amber-lily-scent-1', 144, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 04:30:23', '2020-12-06 04:30:23'),
(1046, 'deco-glam-glass-reed-diffuser-prosecco-scent', 145, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 04:34:47', '2020-12-06 04:34:47'),
(1047, 'deco-glam-2-wick-wax-filled-candle-pot-prosecco-scent', 146, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 04:39:10', '2020-12-06 04:39:10'),
(1048, 'deco-glam-round-glass-wax-filled-candle-pot-prosecco-scentdeco-glam-round-glass-wax-filled-candle-pot-prosecco-scent-220', 147, 'Botble\\Ecommerce\\Models\\Product', 'products', '2020-12-06 04:42:54', '2020-12-06 04:42:54'),
(1050, 'about-us', 5, 'Botble\\Page\\Models\\Page', '', '2021-01-11 23:56:31', '2021-01-11 23:56:31'),
(1051, 'citrusy', 19, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2021-01-12 14:50:15', '2021-01-12 14:50:15'),
(1052, 'fruity', 20, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2021-01-12 14:50:59', '2021-01-12 14:50:59'),
(1053, 'veggie-and-nuty', 21, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2021-01-12 15:35:34', '2021-01-12 15:35:34'),
(1055, 'flowery', 22, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2021-01-19 22:09:19', '2021-01-19 22:09:19'),
(1056, 'greens-and-herbs', 23, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2021-01-19 22:10:48', '2021-01-19 22:10:48'),
(1057, 'spicy', 24, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2021-01-19 22:12:17', '2021-01-19 22:12:17'),
(1058, 'sweets-an-gourmand', 25, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2021-01-19 22:13:06', '2021-01-19 22:13:06'),
(1059, 'woody', 26, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2021-01-19 22:14:25', '2021-01-19 22:14:25'),
(1060, 'resins-and-balsams', 27, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2021-01-19 22:17:35', '2021-01-19 22:17:35'),
(1061, 'beverage', 28, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2021-01-19 22:21:56', '2021-01-19 22:21:56'),
(1062, 'natural-and-synthetic', 29, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2021-01-19 22:23:22', '2021-01-19 22:23:22'),
(1063, 'popular-and-weird', 30, 'Botble\\Ecommerce\\Models\\ProductTag', 'product-tags', '2021-01-19 22:24:28', '2021-01-19 22:24:28'),
(1064, 'new-arrivals', 9, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-01-20 20:48:10', '2021-01-20 20:48:10'),
(1065, 'reed-diffusers-and-candle-sets', 10, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-01-20 20:50:15', '2021-01-20 20:50:15'),
(1066, 'ashley-in-house-handpoured-aromatherapy-candles', 11, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-01-20 21:04:41', '2021-02-09 22:06:31'),
(1067, 'ashley-in-house-handpoured-aromatherapy-wax-melts-tealights-in-jars', 12, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-01-20 21:14:41', '2021-02-09 22:05:11'),
(1068, 'electric-wax-melt-oil-burners-and-candle-warmers', 13, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-01-20 21:20:49', '2021-01-20 21:20:49'),
(1069, 'display-flowers', 14, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-01-20 21:29:48', '2021-01-20 21:29:48'),
(1070, 'gift-sets', 15, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-01-20 21:42:37', '2021-01-20 21:42:37'),
(1071, 'wholesale', 16, 'Botble\\Ecommerce\\Models\\ProductCategory', 'product-categories', '2021-01-20 21:49:57', '2021-01-20 21:49:57'),
(1072, 'candlelight-spa-day-restore-set-of-3-glass-wax-filled-pots-aloe-vera-cucumber-scent', 148, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-22 01:58:57', '2021-01-22 01:58:57'),
(1073, 'katie-alice-vintage-indigo-ceramic-reed-diffuser-thai-flower-scent', 149, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-22 02:25:56', '2021-01-22 02:25:56'),
(1074, 'katie-alice-wild-apricity-ceramic-reed-diffuser-angel-flower-scent', 150, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-22 02:37:37', '2021-01-22 02:37:37'),
(1075, 'katie-alice-wild-apricity-2-wick-wax-filled-candle-pot-angel-flower-scent', 151, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-22 02:42:35', '2021-01-22 02:42:35'),
(1076, 'katie-alice-bohemian-spirit-ceramic-reed-diffuser-amber-lily-scent', 152, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-22 03:05:04', '2021-01-22 03:05:04'),
(1077, 'bath-and-body', 8, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2021-01-22 03:28:41', '2021-02-12 22:44:39'),
(1078, 'simple-large-reed-diffuser-in-gift-box-black-lily-and-pomegranate-scent', 153, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-22 03:41:31', '2021-01-22 03:41:31'),
(1079, 'candlelight-siesta-wax-filled-pot-candle-in-gift-box-pineapple-scent', 154, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-22 04:34:05', '2021-01-22 04:34:05'),
(1080, 'candlelight-trio-set-of-3-mini-votive-candles-gift-box-pineapple-scent', 155, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-22 04:36:16', '2021-01-22 04:36:16'),
(1081, 'candlelight-glow-getter-reed-diffuser-in-gift-box-pear-flower-scent', 156, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 15:43:01', '2021-01-23 15:43:01'),
(1082, 'candlelight-glow-getter-large-wax-filled-pot-candle-pear-flower-scent', 157, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 15:45:20', '2021-01-23 15:45:20'),
(1083, 'candlelight-love-reed-diffuser-in-gift-box-midnight-pomegranate-scent', 158, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 15:48:03', '2021-01-23 15:48:03'),
(1084, 'candlelight-love-large-frosted-glass-candle-midnight-pomegranate-scent', 159, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 15:51:56', '2021-01-23 15:51:56'),
(1085, 'candlelight-happy-small-wax-filled-pot-candle-in-gift-box-wild-fig-scent', 160, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 15:57:09', '2021-01-23 15:57:09'),
(1086, 'candlelight-calm-reed-diffuser-in-gift-box-pineapple-and-coconut-scent', 161, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 16:03:18', '2021-01-23 16:03:18'),
(1087, 'candlelight-calm-large-frosted-glass-candle-pineapple-and-coconut-scent', 162, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 16:06:30', '2021-01-23 16:06:30'),
(1088, 'candlelight-calm-large-wax-filled-pot-candle-in-gift-box-pineapple-and-coconut-scent', 163, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 16:17:29', '2021-01-23 16:17:29'),
(1089, 'summer-meadows-reed-diffuser-in-gift-box-floral', 164, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 16:21:08', '2021-01-23 16:21:08'),
(1090, 'summer-meadows', 9, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2021-01-23 16:23:18', '2021-01-23 16:23:18'),
(1091, 'summer-meadows-wax-filled-pot-candle-in-gift-box-floral', 165, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 16:26:03', '2021-01-23 16:26:03'),
(1092, 'summer-meadows-2-wick-glass-wax-filled-pot-candle-floral', 166, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 16:27:44', '2021-01-23 16:27:44'),
(1093, 'summer-meadows-assorted-wax-filled-tin-candles-floral', 167, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 16:29:42', '2021-01-23 16:29:42'),
(1094, 'candlelight-burn-it-at-both-ends-reed-diffuser-in-gift-box-pink-petal-scent', 168, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 16:32:22', '2021-01-23 16:32:22'),
(1095, 'candlelight-burn-it-at-both-ends-large-wax-filled-pot-candle-pink-petal-scent', 169, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 16:36:36', '2021-01-23 16:36:36'),
(1096, 'candlelight-start-your-spark-here-reed-diffuser-in-gift-box-white-petal-scent', 170, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 16:39:08', '2021-01-23 16:39:08'),
(1097, 'candlelight-start-your-spark-here-large-wax-filled-pot-candle-white-petal-scent', 171, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 16:40:58', '2021-01-23 16:40:58'),
(1098, 'hugs-kisses-reed-diffuser-in-gift-box-prosecco-scent', 172, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 16:44:10', '2021-01-23 16:44:10'),
(1099, 'candlelight-hugs-kisses-wax-filled-pot-candle-in-gift-box-prosecco-scent', 173, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 16:49:22', '2021-01-23 16:49:22'),
(1100, 'love-always-reed-diffuser-prosecco-scent', 174, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 17:01:44', '2021-01-23 17:01:44'),
(1101, 'candlelight-love-always-wax-filled-pot-candle-in-gift-box-prosecco-scent', 175, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 17:06:00', '2021-01-23 17:06:00'),
(1102, 'candlelight-tropic-reed-diffuser-in-gift-box-pineapple-scent', 176, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 17:09:08', '2021-01-23 17:09:08'),
(1103, 'candlelight-tropic-wax-filled-pot-candle-in-gift-box-pineapple-scent', 177, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 17:13:39', '2021-01-23 17:13:39'),
(1104, 'with-love-xo-reed-diffuser-in-gift-box-prosecco-scent-100ml', 178, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 17:27:33', '2021-01-23 17:27:33'),
(1105, 'simple-large-wax-filled-pot-2-wick-candle-fresh-cotton-scent', 179, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 17:32:32', '2021-01-23 17:32:32'),
(1106, 'simple-large-reed-diffuser-in-gift-box-pink-pepper-scent', 180, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 17:36:34', '2021-01-23 17:36:34'),
(1107, 'simple-small-wax-filled-pot-candle-with-lid-pink-pepper-scent', 181, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 17:39:32', '2021-01-23 17:39:32'),
(1108, 'candlelight-nantucket-bay-reed-diffuser-in-gift-box-seasalt-scent', 182, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 17:51:46', '2021-01-23 17:51:46'),
(1109, 'candlelight-nantucket-bay-small-wax-filled-pot-candle-in-gift-box-seasalt-scent', 183, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 17:53:55', '2021-01-23 17:53:55'),
(1110, 'candlelight-nantucket-bay-wax-filled-pot-2-wick-candle-seasalt-scent', 184, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 17:57:33', '2021-01-23 17:57:33'),
(1111, 'candlelight-nantucket-bay-set-of-3-mini-votive-candles-in-gift-box-seasalt-scent', 185, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 18:03:27', '2021-01-23 18:03:27'),
(1112, 'candlelight-africa-reed-diffuser-in-gift-box-savannah-white-poppy-scent', 186, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 18:07:20', '2021-01-23 18:07:20'),
(1113, 'candlelight-africa-small-wax-filled-pot-candle-in-gift-box-savannah-white-poppy-scent', 187, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 18:09:33', '2021-01-23 18:09:33'),
(1114, 'candlelight-africa-wax-filled-pot-2-wick-candle-savannah-white-poppy-scent', 188, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 18:12:03', '2021-01-23 18:12:03'),
(1115, 'candlelight-africa-set-of-3-mini-votive-candles-in-gift-box-savannah-white-poppy-scent', 189, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 18:14:49', '2021-01-23 18:14:49'),
(1116, 'candlelight-thailand-reed-diffuser-in-gift-box-thai-flower-market-scent-150ml', 190, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-23 22:42:35', '2021-01-23 22:42:35'),
(1117, 'candlelight-thailand-small-wax-filled-pot-candle-in-gift-box-thai-flower-market-scent', 191, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-24 00:27:13', '2021-01-24 00:27:13'),
(1118, 'candlelight-thailand-wax-filled-pot-2-wick-candle-thai-flower-market-scent', 192, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-24 00:30:32', '2021-01-24 00:30:32'),
(1119, 'candlelight-thailand-set-of-3-mini-votive-candles-in-gift-box-thai-flower-market-scent', 193, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-24 00:32:17', '2021-01-24 00:32:17'),
(1120, 'candlelight-bohemian-reed-diffuser-in-gift-box-amber-shea-scent', 194, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-24 00:35:03', '2021-01-24 00:35:03'),
(1121, 'candlelight-bohemian-large-tin-candle-amber-shea-scent', 195, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-24 01:15:47', '2021-01-24 01:15:47'),
(1122, 'candlelight-peace-reed-diffuser-in-gift-box-redcurrant-and-ivy-scent', 196, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-24 02:00:26', '2021-01-24 02:00:26'),
(1123, 'candlelight-peace-large-wax-filled-pot-candle-in-gift-box-redcurrant-and-ivy-scent', 197, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-24 02:11:23', '2021-01-24 02:11:23'),
(1124, 'posey-reed-diffuser-in-gift-box-angel-rose-scent', 198, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-24 02:41:55', '2021-01-24 02:41:55'),
(1125, 'posey-small-tin-candle-angel-rose-scent', 199, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-24 02:47:00', '2021-01-24 02:47:00'),
(1126, 'candlelight-totally-lit-reed-diffuser-in-gift-box-mimosa-scent', 200, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-24 02:52:12', '2021-01-24 02:52:12'),
(1127, 'candlelight-totally-lit-large-wax-filled-pot-candle-mimosa-scent', 201, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-24 02:55:34', '2021-01-24 02:55:34'),
(1128, 'candlelight-paradise-reed-diffuser-in-gift-box-pineapple-scent', 202, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-24 03:01:37', '2021-01-24 03:01:37'),
(1129, 'candlelight-paradise-wax-filled-pot-candle-in-gift-box-pineapple-scent', 203, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-24 03:04:02', '2021-01-24 03:04:02'),
(1130, 'zesty-reed-diffuser-in-gift-box-pineapple-scent', 204, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-24 03:10:44', '2021-01-24 03:10:44'),
(1131, 'zesty-small-tin-candle-pineapple-scent', 205, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-24 03:13:26', '2021-01-24 03:13:26'),
(1132, 'zesty-frosted-glass-wax-filled-pot-candle-in-gift-box-pineapple-scent', 206, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-24 03:15:28', '2021-01-24 03:15:28'),
(1133, 'zesty-large-tin-candle-pineapple-scent', 207, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-24 03:19:55', '2021-01-24 03:19:55'),
(1134, 'ashley-handmade-aromatherapy-scented-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars', 208, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-26 00:29:42', '2021-03-03 21:48:35'),
(1137, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container', 211, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-01-26 00:58:33', '2021-03-05 22:11:53'),
(1138, 'ashley-in-house-handpoured-aromatherapy-candle', 212, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-02-12 22:19:56', '2021-02-12 22:19:56'),
(1139, 'ashley-in-house-handpoured-aromatherapy-candles-orange-and-green-flavor', 213, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-02-12 22:23:18', '2021-02-12 22:23:18'),
(1140, 'ashley-in-house-handpoured-aromatherapy-candles', 214, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-02-12 22:26:42', '2021-02-12 22:26:42'),
(1141, 'ashley-in-house-aromatheraphy-handpoured-scanted-soy-wax-candles-presented-in-clear-glass', 215, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-02-12 22:31:41', '2021-03-07 02:13:57'),
(1142, 'ashley-in-house-aromatherapy-handpoured-scanted-soy-wax-candles-presented-in-silver-round-tin-with-open-see-through-cover', 216, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-02-12 22:36:34', '2021-03-07 02:21:40'),
(1143, 'ashley-in-house-aromatherapy-handpoured-scented-soy-wax-candles-presented-in-clear-glass', 217, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-02-12 22:38:36', '2021-03-07 02:40:31'),
(1144, 'ashley-in-house', 10, 'Botble\\Ecommerce\\Models\\Brand', 'brands', '2021-02-12 22:47:29', '2021-02-12 22:47:29'),
(1147, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid', 220, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:01:32', '2021-03-02 19:01:32'),
(1148, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-1', 221, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:03:07', '2021-03-02 19:03:07'),
(1149, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-2', 222, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:04:10', '2021-03-02 19:04:10'),
(1150, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-3', 223, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:04:55', '2021-03-02 19:04:55'),
(1151, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-4', 224, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:06:15', '2021-03-02 19:06:15'),
(1152, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-5', 225, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:06:42', '2021-03-02 19:06:42'),
(1153, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-6', 226, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:07:07', '2021-03-02 19:07:07'),
(1154, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-7', 227, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:07:30', '2021-03-02 19:07:30'),
(1155, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-8', 228, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:07:51', '2021-03-02 19:07:51'),
(1156, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-9', 229, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:08:05', '2021-03-02 19:08:05'),
(1157, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-10', 230, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:08:18', '2021-03-02 19:08:18'),
(1158, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-11', 231, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:08:36', '2021-03-02 19:08:36'),
(1159, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-12', 232, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:08:48', '2021-03-02 19:08:48'),
(1160, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-13', 233, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:09:00', '2021-03-02 19:09:00'),
(1161, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-14', 234, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:09:14', '2021-03-02 19:09:14'),
(1162, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-15', 235, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:09:30', '2021-03-02 19:09:30'),
(1163, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-16', 236, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:09:47', '2021-03-02 19:09:47'),
(1164, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-17', 237, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:10:02', '2021-03-02 19:10:02'),
(1165, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-18', 238, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:10:15', '2021-03-02 19:10:15'),
(1166, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-19', 239, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:10:44', '2021-03-02 19:10:44'),
(1167, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-20', 240, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:11:04', '2021-03-02 19:11:04'),
(1168, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-21', 241, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:11:26', '2021-03-02 19:11:26'),
(1169, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-22', 242, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:11:55', '2021-03-02 19:11:55'),
(1170, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-23', 243, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:12:08', '2021-03-02 19:12:08'),
(1171, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-24', 244, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:12:53', '2021-03-02 19:12:53'),
(1172, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-25', 245, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:13:10', '2021-03-02 19:13:10'),
(1173, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-26', 246, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:13:27', '2021-03-02 19:13:27'),
(1174, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-27', 247, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:13:46', '2021-03-02 19:13:46'),
(1175, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-28', 248, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:14:22', '2021-03-02 19:14:22'),
(1176, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-29', 249, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:14:42', '2021-03-02 19:14:42'),
(1177, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-30', 250, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:14:58', '2021-03-02 19:14:58'),
(1178, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-31', 251, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:15:18', '2021-03-02 19:15:18'),
(1179, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-32', 252, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:15:34', '2021-03-02 19:15:34'),
(1180, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-33', 253, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:15:53', '2021-03-02 19:15:53'),
(1181, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-34', 254, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:16:08', '2021-03-02 19:16:08'),
(1182, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-35', 255, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:16:20', '2021-03-02 19:16:20'),
(1183, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-36', 256, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:16:53', '2021-03-02 19:16:53'),
(1184, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-37', 257, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:17:07', '2021-03-02 19:17:07'),
(1185, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-38', 258, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:17:21', '2021-03-02 19:17:21'),
(1186, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-39', 259, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:17:36', '2021-03-02 19:17:36'),
(1187, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-40', 260, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:17:53', '2021-03-02 19:17:53'),
(1188, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-41', 261, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:18:04', '2021-03-02 19:18:04'),
(1189, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-42', 262, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:18:31', '2021-03-02 19:18:31'),
(1190, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-43', 263, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:18:43', '2021-03-02 19:18:43'),
(1191, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-44', 264, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:18:58', '2021-03-02 19:18:58'),
(1192, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-45', 265, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:21:51', '2021-03-02 19:21:51'),
(1193, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-46', 266, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:22:03', '2021-03-02 19:22:03'),
(1194, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-47', 267, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 19:22:30', '2021-03-02 19:22:30'),
(1195, 'ashley-in-house-soy-wax-melts-presented-in-luxury-clear-glass-bowl-with-glass-lid-48', 268, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-02 21:38:42', '2021-03-02 21:38:42'),
(1196, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods', 269, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 03:08:29', '2021-03-03 03:08:29'),
(1199, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-1', 272, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:14:52', '2021-03-03 09:14:52'),
(1200, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods', 273, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:15:36', '2021-03-03 09:15:51'),
(1201, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-2', 274, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:17:52', '2021-03-03 09:17:52'),
(1202, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-3', 275, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:18:07', '2021-03-03 09:18:07'),
(1203, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-4', 276, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:18:36', '2021-03-03 09:18:36'),
(1204, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-5', 277, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:18:56', '2021-03-03 09:18:56'),
(1205, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-6', 278, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:19:40', '2021-03-03 09:19:40'),
(1206, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-7', 279, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:21:04', '2021-03-03 09:21:04'),
(1207, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-8', 280, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:21:35', '2021-03-03 09:21:35'),
(1208, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-9', 281, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:22:04', '2021-03-03 09:22:04'),
(1209, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-10', 282, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:22:43', '2021-03-03 09:22:43'),
(1210, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-11', 283, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:23:54', '2021-03-03 09:23:54'),
(1211, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-12', 284, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:24:23', '2021-03-03 09:24:23'),
(1212, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-13', 285, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:24:55', '2021-03-03 09:24:55'),
(1213, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-14', 286, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:25:31', '2021-03-03 09:25:31'),
(1214, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-15', 287, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:25:53', '2021-03-03 09:25:53'),
(1215, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-16', 288, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:26:50', '2021-03-03 09:26:50'),
(1216, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-17', 289, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:27:10', '2021-03-03 09:27:10'),
(1217, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-18', 290, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:27:27', '2021-03-03 09:27:27'),
(1218, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-19', 291, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:27:53', '2021-03-03 09:27:53'),
(1219, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-20', 292, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:28:17', '2021-03-03 09:28:17'),
(1220, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-21', 293, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:28:34', '2021-03-03 09:28:34'),
(1221, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-22', 294, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:32:25', '2021-03-03 09:32:25'),
(1222, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-23', 295, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:33:08', '2021-03-03 09:33:08'),
(1223, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-24', 296, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:34:25', '2021-03-03 09:34:25'),
(1224, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-25', 297, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:35:02', '2021-03-03 09:35:02'),
(1225, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-26', 298, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:35:40', '2021-03-03 09:35:40'),
(1226, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-27', 299, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:35:57', '2021-03-03 09:35:57'),
(1227, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-28', 300, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:36:23', '2021-03-03 09:36:23'),
(1228, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-29', 301, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:36:49', '2021-03-03 09:36:49'),
(1229, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-30', 302, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:37:18', '2021-03-03 09:37:18'),
(1230, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-31', 303, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:37:56', '2021-03-03 09:37:56'),
(1231, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-32', 304, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:38:27', '2021-03-03 09:38:27');
INSERT INTO `slugs` (`id`, `key`, `reference_id`, `reference_type`, `prefix`, `created_at`, `updated_at`) VALUES
(1232, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-33', 305, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:39:50', '2021-03-03 09:39:50'),
(1233, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-34', 306, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:40:32', '2021-03-03 09:40:32'),
(1234, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-35', 307, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:41:29', '2021-03-03 09:41:29'),
(1235, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-36', 308, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:41:56', '2021-03-03 09:41:56'),
(1236, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-37', 309, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:42:57', '2021-03-03 09:42:57'),
(1237, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-38', 310, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:43:14', '2021-03-03 09:43:14'),
(1238, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-39', 311, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:43:36', '2021-03-03 09:43:36'),
(1239, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-40', 312, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:43:56', '2021-03-03 09:43:56'),
(1240, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-41', 313, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:44:26', '2021-03-03 09:44:26'),
(1241, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-42', 314, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:44:49', '2021-03-03 09:44:49'),
(1242, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-43', 315, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:45:06', '2021-03-03 09:45:06'),
(1243, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-44', 316, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:45:47', '2021-03-03 09:45:47'),
(1244, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-45', 317, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:46:06', '2021-03-03 09:46:06'),
(1245, 'ashley-in-house-soy-wax-melts-presented-in-two-piece-container-and-lid-innovative-shinning-recyclable-plastic-pods-46', 318, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 09:53:08', '2021-03-03 09:53:08'),
(1246, 'ashley-in-house-soy-wax-melts-presented-in-small-size-glass-clipped-lid-top-clear-glass-jars', 319, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 14:22:40', '2021-03-03 20:56:17'),
(1247, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars', 320, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 14:22:41', '2021-03-03 14:30:30'),
(1248, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-2', 321, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 14:24:54', '2021-03-03 14:24:54'),
(1249, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-3', 322, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 14:25:06', '2021-03-03 14:25:06'),
(1250, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-4', 323, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 14:25:18', '2021-03-03 14:25:18'),
(1251, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-5', 324, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 14:25:32', '2021-03-03 14:25:32'),
(1252, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-6', 325, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 14:25:41', '2021-03-03 14:25:41'),
(1253, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-7', 326, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 14:25:52', '2021-03-03 14:25:52'),
(1254, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-8', 327, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 14:26:08', '2021-03-03 14:26:08'),
(1255, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-9', 328, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 14:26:46', '2021-03-03 14:26:46'),
(1256, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-10', 329, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 14:27:05', '2021-03-03 14:27:05'),
(1257, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-11', 330, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 14:27:30', '2021-03-03 14:27:30'),
(1258, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-12', 331, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 14:27:58', '2021-03-03 14:27:58'),
(1259, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-13', 332, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 14:28:14', '2021-03-03 14:28:14'),
(1260, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-14', 333, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 14:30:05', '2021-03-03 14:30:05'),
(1261, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-1', 334, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 14:31:45', '2021-03-03 14:31:45'),
(1262, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-15', 335, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 14:32:50', '2021-03-03 14:32:50'),
(1263, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-16', 336, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 14:33:37', '2021-03-03 14:33:37'),
(1264, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-17', 337, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 14:34:44', '2021-03-03 14:34:44'),
(1265, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-18', 338, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 14:35:29', '2021-03-03 14:35:29'),
(1266, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-19', 339, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 14:36:07', '2021-03-03 14:36:07'),
(1267, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-20', 340, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:05:41', '2021-03-03 15:05:41'),
(1268, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-21', 341, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:06:31', '2021-03-03 15:06:31'),
(1269, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-22', 342, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:06:52', '2021-03-03 15:06:52'),
(1270, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-23', 343, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:07:29', '2021-03-03 15:07:29'),
(1271, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-24', 344, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:07:43', '2021-03-03 15:07:43'),
(1272, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-25', 345, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:08:18', '2021-03-03 15:08:18'),
(1273, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-26', 346, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:08:41', '2021-03-03 15:08:41'),
(1274, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-27', 347, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:08:55', '2021-03-03 15:08:55'),
(1275, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-28', 348, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:09:25', '2021-03-03 15:09:25'),
(1276, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-29', 349, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:09:46', '2021-03-03 15:09:46'),
(1277, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-30', 350, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:10:26', '2021-03-03 15:10:26'),
(1278, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-31', 351, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:10:36', '2021-03-03 15:10:36'),
(1279, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-32', 352, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:11:26', '2021-03-03 15:11:26'),
(1280, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-33', 353, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:11:55', '2021-03-03 15:11:55'),
(1281, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-34', 354, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:12:06', '2021-03-03 15:12:06'),
(1282, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-35', 355, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:13:21', '2021-03-03 15:13:21'),
(1283, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-36', 356, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:13:52', '2021-03-03 15:13:52'),
(1284, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-37', 357, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:14:50', '2021-03-03 15:14:50'),
(1285, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-38', 358, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:15:07', '2021-03-03 15:15:07'),
(1286, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-39', 359, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:15:23', '2021-03-03 15:15:23'),
(1287, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-40', 360, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:15:53', '2021-03-03 15:15:53'),
(1288, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-41', 361, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:16:17', '2021-03-03 15:16:17'),
(1289, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-42', 362, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:16:40', '2021-03-03 15:16:40'),
(1290, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-43', 363, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:17:04', '2021-03-03 15:17:04'),
(1291, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-44', 364, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:17:17', '2021-03-03 15:17:17'),
(1292, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-45', 365, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:17:37', '2021-03-03 15:17:37'),
(1293, 'ashley-in-house-soy-wax-melts-presented-in-large-clear-glass-with-bamboo-lid-jars-46', 366, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:20:41', '2021-03-03 15:20:41'),
(1294, 'ashley-handmade-aromatherapy-scented-wax-melts', 367, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:34:38', '2021-03-03 16:03:01'),
(1295, 'ashley-handmade-aromatherapy-scented-wax-melts-4', 368, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:36:34', '2021-03-03 15:36:34'),
(1296, 'ashley-handmade-aromatherapy-scented-wax-melts-5', 369, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:36:48', '2021-03-03 15:36:48'),
(1297, 'ashley-handmade-aromatherapy-scented-wax-melts-6', 370, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:36:58', '2021-03-03 15:36:58'),
(1298, 'ashley-handmade-aromatherapy-scented-wax-melts-7', 371, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:37:11', '2021-03-03 15:37:11'),
(1299, 'ashley-handmade-aromatherapy-scented-wax-melts-8', 372, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:37:25', '2021-03-03 15:37:25'),
(1300, 'ashley-handmade-aromatherapy-scented-wax-melts-9', 373, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:37:39', '2021-03-03 15:37:39'),
(1301, 'ashley-handmade-aromatherapy-scented-wax-melts-10', 374, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:38:02', '2021-03-03 15:38:02'),
(1302, 'ashley-handmade-aromatherapy-scented-wax-melts-11', 375, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:38:16', '2021-03-03 15:38:16'),
(1303, 'ashley-handmade-aromatherapy-scented-wax-melts-12', 376, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:38:29', '2021-03-03 15:38:29'),
(1304, 'ashley-handmade-aromatherapy-scented-wax-melts-13', 377, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:38:44', '2021-03-03 15:38:44'),
(1305, 'ashley-handmade-aromatherapy-scented-wax-melts-14', 378, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:39:01', '2021-03-03 15:39:01'),
(1306, 'ashley-handmade-aromatherapy-scented-wax-melts-15', 379, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:39:21', '2021-03-03 15:39:21'),
(1307, 'ashley-handmade-aromatherapy-scented-wax-melts-16', 380, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:39:32', '2021-03-03 15:39:32'),
(1308, 'ashley-handmade-aromatherapy-scented-wax-melts-17', 381, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:39:42', '2021-03-03 15:39:42'),
(1309, 'ashley-handmade-aromatherapy-scented-wax-melts-18', 382, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:40:03', '2021-03-03 15:40:03'),
(1310, 'ashley-handmade-aromatherapy-scented-wax-melts-19', 383, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:40:17', '2021-03-03 15:40:17'),
(1311, 'ashley-handmade-aromatherapy-scented-wax-melts-20', 384, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:40:29', '2021-03-03 15:40:29'),
(1312, 'ashley-handmade-aromatherapy-scented-wax-melts-21', 385, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:40:42', '2021-03-03 15:40:42'),
(1313, 'ashley-handmade-aromatherapy-scented-wax-melts-22', 386, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:40:55', '2021-03-03 15:40:55'),
(1314, 'ashley-handmade-aromatherapy-scented-wax-melts-23', 387, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:41:19', '2021-03-03 15:41:19'),
(1315, 'ashley-handmade-aromatherapy-scented-wax-melts-24', 388, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:41:30', '2021-03-03 15:41:30'),
(1316, 'ashley-handmade-aromatherapy-scented-wax-melts-25', 389, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:41:42', '2021-03-03 15:41:42'),
(1317, 'ashley-handmade-aromatherapy-scented-wax-melts-26', 390, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:41:54', '2021-03-03 15:41:54'),
(1318, 'ashley-handmade-aromatherapy-scented-wax-melts-27', 391, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:42:25', '2021-03-03 15:42:25'),
(1319, 'ashley-handmade-aromatherapy-scented-wax-melts-28', 392, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:42:37', '2021-03-03 15:42:37'),
(1320, 'ashley-handmade-aromatherapy-scented-wax-melts-29', 393, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:42:49', '2021-03-03 15:42:49'),
(1321, 'ashley-handmade-aromatherapy-scented-wax-melts-30', 394, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:43:01', '2021-03-03 15:43:01'),
(1322, 'ashley-handmade-aromatherapy-scented-wax-melts-31', 395, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:43:15', '2021-03-03 15:43:15'),
(1323, 'ashley-handmade-aromatherapy-scented-wax-melts-32', 396, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:43:28', '2021-03-03 15:43:28'),
(1324, 'ashley-handmade-aromatherapy-scented-wax-melts-33', 397, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:43:51', '2021-03-03 15:43:51'),
(1325, 'ashley-handmade-aromatherapy-scented-wax-melts-34', 398, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:44:04', '2021-03-03 15:44:04'),
(1326, 'ashley-handmade-aromatherapy-scented-wax-melts-35', 399, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:44:17', '2021-03-03 15:44:17'),
(1327, 'ashley-handmade-aromatherapy-scented-wax-melts-36', 400, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:44:49', '2021-03-03 15:44:49'),
(1328, 'ashley-handmade-aromatherapy-scented-wax-melts-37', 401, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:45:12', '2021-03-03 15:45:12'),
(1329, 'ashley-handmade-aromatherapy-scented-wax-melts-38', 402, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:45:33', '2021-03-03 15:45:33'),
(1330, 'ashley-handmade-aromatherapy-scented-wax-melts-39', 403, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:45:49', '2021-03-03 15:45:49'),
(1331, 'ashley-handmade-aromatherapy-scented-wax-melts-40', 404, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:46:11', '2021-03-03 15:46:11'),
(1332, 'ashley-handmade-aromatherapy-scented-wax-melts-41', 405, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:46:24', '2021-03-03 15:46:24'),
(1333, 'ashley-handmade-aromatherapy-scented-wax-melts-42', 406, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:46:44', '2021-03-03 15:46:44'),
(1334, 'ashley-handmade-aromatherapy-scented-wax-melts-43', 407, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:47:04', '2021-03-03 15:47:04'),
(1335, 'ashley-handmade-aromatherapy-scented-wax-melts-44', 408, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:47:16', '2021-03-03 15:47:16'),
(1336, 'ashley-handmade-aromatherapy-scented-wax-melts-45', 409, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:47:37', '2021-03-03 15:47:37'),
(1337, 'ashley-handmade-aromatherapy-scented-wax-melts-46', 410, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:47:48', '2021-03-03 15:47:48'),
(1338, 'ashley-handmade-aromatherapy-scented-wax-melts-47', 411, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:47:58', '2021-03-03 15:47:58'),
(1339, 'ashley-handmade-aromatherapy-scented-wax-melts-48', 412, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:48:24', '2021-03-03 15:48:24'),
(1340, 'ashley-handmade-aromatherapy-scented-wax-melts-49', 413, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 15:48:35', '2021-03-03 15:48:35'),
(1341, 'ashley-in-house-handpoured-aromatherapy-candles-orange-flavour', 414, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:14:48', '2021-03-07 02:34:03'),
(1342, 'ashley-in-house-handpoured-aromatherapy-candles-orange-flavour', 415, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:15:55', '2021-03-07 02:35:10'),
(1343, 'ashley-in-house-handpoured-aromatherapy-candles-orange-flavour', 416, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:16:46', '2021-03-07 02:41:57'),
(1344, 'ashley-in-house-handpoured-aromatherapy-candles-orange-flavour', 417, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:20:08', '2021-03-07 02:42:42'),
(1345, 'ashley-in-house-handpoured-aromatherapy-candles-orange-flavour', 418, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:20:18', '2021-03-07 02:43:39'),
(1346, 'ashley-in-house-handpoured-aromatherapy-candles-orange-flavour', 419, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:20:41', '2021-03-07 02:36:21'),
(1347, 'ashley-in-house-handpoured-aromatherapy-candles-orange-flavour', 420, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:20:58', '2021-03-07 02:46:54'),
(1348, 'ashley-in-house-handpoured-aromatherapy-candles-orange-flavour', 421, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:21:30', '2021-03-07 02:47:45'),
(1349, 'ashley-in-house-handpoured-aromatherapy-candles-orange-flavour', 422, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:21:44', '2021-03-07 02:53:24'),
(1350, 'ashley-in-house-handpoured-aromatherapy-candles-orange-flavour', 423, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:21:58', '2021-03-07 02:54:06'),
(1351, 'ashley-in-house-handpoured-aromatherapy-candles-orange-flavour', 424, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:22:14', '2021-03-07 02:51:01'),
(1352, 'ashley-in-house-handpoured-aromatherapy-candles-orange-flavour', 425, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:22:29', '2021-03-07 02:51:30'),
(1353, 'ashley-in-house-handpoured-aromatherapy-candles-orange-flavour', 426, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:22:43', '2021-03-07 02:51:55'),
(1354, 'ashley-in-house-handpoured-aromatherapy-candles-orange-flavour', 427, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:23:13', '2021-03-07 02:55:36'),
(1355, 'ashley-in-house-handpoured-aromatherapy-candles-orange-flavour', 428, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:23:32', '2021-03-07 02:56:12'),
(1356, 'ashley-in-house-handpoured-aromatherapy-candles-orange-flavour', 429, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:23:55', '2021-03-07 02:56:58'),
(1357, 'ashley-in-house-handpoured-aromatherapy-candles-orange-flavour', 430, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:24:08', '2021-03-07 02:57:45'),
(1358, 'ashley-in-house-handpoured-aromatherapy-candles-orange-flavour', 431, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:24:21', '2021-03-07 03:00:10'),
(1359, 'ashley-in-house-handpoured-aromatherapy-candles-orange-flavour', 432, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:24:35', '2021-03-07 03:00:56'),
(1360, 'ashley-in-house-handpoured-aromatherapy-candles-orange-flavour', 433, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:25:01', '2021-03-07 02:59:13'),
(1361, 'ashley-in-house-handpoured-aromatherapy-candles-orange-flavour', 434, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:25:22', '2021-03-07 02:58:21'),
(1362, 'ashley-in-house-handpoured-aromatherapy-candles-orange-flavour', 435, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:25:49', '2021-03-07 02:50:14'),
(1363, 'ashley-in-house-handpoured-aromatherapy-candles-orange-flavour', 436, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:26:12', '2021-03-07 02:49:28'),
(1365, 'ashley-in-house-handpoured-aromatherapy-candles-orange-and-green-flavor-1', 438, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:40:57', '2021-03-03 16:40:57'),
(1366, 'ashley-in-house-handpoured-aromatherapy-candles-orange-and-green-flavor-2', 439, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:42:03', '2021-03-03 16:42:03'),
(1367, 'ashley-in-house-handpoured-aromatherapy-candles-orange-and-green-flavor-3', 440, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:42:17', '2021-03-03 16:42:17'),
(1368, 'ashley-in-house-handpoured-aromatherapy-candles-orange-and-green-flavor-4', 441, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:46:51', '2021-03-03 16:46:51'),
(1369, 'ashley-in-house-handpoured-aromatherapy-candles-orange-and-green-flavor-5', 442, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:47:35', '2021-03-03 16:47:35'),
(1370, 'ashley-in-house-handpoured-aromatherapy-candles-orange-and-green-flavor-6', 443, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:48:54', '2021-03-03 16:48:54'),
(1371, 'ashley-in-house-handpoured-aromatherapy-candles-orange-and-green-flavor-7', 444, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:52:37', '2021-03-03 16:52:37'),
(1372, 'ashley-in-house-handpoured-aromatherapy-candles-orange-and-green-flavor-8', 445, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:52:49', '2021-03-03 16:52:49'),
(1373, 'ashley-in-house-handpoured-aromatherapy-candles-orange-and-green-flavor-9', 446, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:53:41', '2021-03-03 16:53:41'),
(1374, 'ashley-in-house-handpoured-aromatherapy-candles-orange-and-green-flavor-10', 447, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:54:17', '2021-03-03 16:54:17'),
(1375, 'ashley-in-house-handpoured-aromatherapy-candles-orange-and-green-flavor-11', 448, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:55:30', '2021-03-03 16:55:30'),
(1376, 'ashley-in-house-handpoured-aromatherapy-candles-orange-and-green-flavor-12', 449, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:55:43', '2021-03-03 16:55:43'),
(1377, 'ashley-in-house-handpoured-aromatherapy-candles-orange-and-green-flavor-13', 450, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:56:07', '2021-03-03 16:56:07'),
(1378, 'ashley-in-house-handpoured-aromatherapy-candles-orange-and-green-flavor-14', 451, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:56:32', '2021-03-03 16:56:32'),
(1379, 'ashley-in-house-handpoured-aromatherapy-candles-orange-and-green-flavor-15', 452, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:56:51', '2021-03-03 16:56:51'),
(1380, 'ashley-in-house-handpoured-aromatherapy-candles-orange-and-green-flavor-16', 453, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:57:06', '2021-03-03 16:57:06'),
(1381, 'ashley-in-house-handpoured-aromatherapy-candles-orange-and-green-flavor-17', 454, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:57:46', '2021-03-03 16:57:46'),
(1382, 'ashley-in-house-handpoured-aromatherapy-candles-orange-and-green-flavor-18', 455, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:58:25', '2021-03-03 16:58:25'),
(1383, 'ashley-in-house-handpoured-aromatherapy-candles-orange-and-green-flavor-19', 456, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:58:35', '2021-03-03 16:58:35'),
(1384, 'ashley-in-house-handpoured-aromatherapy-candles-orange-and-green-flavor-20', 457, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:59:04', '2021-03-03 16:59:04'),
(1385, 'ashley-in-house-handpoured-aromatherapy-candles-orange-and-green-flavor-21', 458, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 16:59:17', '2021-03-03 16:59:17'),
(1386, 'ashley-in-house-handpoured-aromatherapy-candles-orange-and-green-flavor-22', 459, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:01:25', '2021-03-03 17:01:25'),
(1387, 'ashley-in-house-handpoured-aromatherapy-candles-orange-and-green-flavor-23', 460, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:01:36', '2021-03-03 17:01:36'),
(1388, 'ashley-in-house-handpoured-aromatherapy-candles-orange-and-green-flavor-24', 461, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:02:07', '2021-03-03 17:02:07'),
(1389, 'ashley-in-house-handpoured-aromatherapy-candles-purple-and-pink-flavor', 462, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:03:45', '2021-03-03 17:04:25'),
(1390, 'ashley-in-house-handpoured-aromatherapy-candles-purple-and-pink-flavor', 463, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:04:52', '2021-03-05 23:58:18'),
(1391, 'ashley-in-house-handpoured-aromatherapy-candles-purple-and-pink-flavor', 464, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:05:35', '2021-03-05 23:58:39'),
(1392, 'ashley-in-house-handpoured-aromatherapy-candles-purple-and-pink-flavor', 465, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:05:45', '2021-03-05 23:59:34'),
(1393, 'ashley-in-house-handpoured-aromatherapy-candles-purple-and-pink-flavor', 466, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:05:55', '2021-03-06 00:01:20'),
(1394, 'ashley-in-house-handpoured-aromatherapy-candles-purple-and-pink-flavor', 467, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:06:08', '2021-03-06 00:01:41'),
(1395, 'ashley-in-house-handpoured-aromatherapy-candles-purple-and-pink-flavor', 468, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:06:27', '2021-03-06 00:02:02'),
(1396, 'ashley-in-house-handpoured-aromatherapy-candles-purple-and-pink-flavor', 469, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:06:42', '2021-03-06 00:02:26'),
(1397, 'ashley-in-house-handpoured-aromatherapy-candles-purple-and-pink-flavor', 470, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:06:59', '2021-03-06 00:04:01'),
(1398, 'ashley-in-house-handpoured-aromatherapy-candles-purple-and-pink-flavor', 471, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:07:14', '2021-03-06 00:04:21'),
(1399, 'ashley-in-house-handpoured-aromatherapy-candles-purple-and-pink-flavor', 472, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:07:24', '2021-03-06 03:37:19'),
(1400, 'ashley-in-house-handpoured-aromatherapy-candles-purple-and-pink-flavor', 473, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:07:33', '2021-03-06 03:37:45'),
(1401, 'ashley-in-house-handpoured-aromatherapy-candles-purple-and-pink-flavor', 474, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:07:43', '2021-03-06 03:38:50'),
(1402, 'ashley-in-house-handpoured-aromatherapy-candles-purple-and-pink-flavor', 475, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:07:53', '2021-03-06 03:39:16'),
(1403, 'ashley-in-house-handpoured-aromatherapy-candles-purple-and-pink-flavor', 476, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:08:04', '2021-03-06 03:39:41'),
(1404, 'ashley-in-house-handpoured-aromatherapy-candles-purple-and-pink-flavor', 477, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:08:13', '2021-03-06 03:20:21'),
(1405, 'ashley-in-house-handpoured-aromatherapy-candles-purple-and-pink-flavor', 478, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:08:24', '2021-03-06 03:20:01'),
(1406, 'ashley-in-house-handpoured-aromatherapy-candles-purple-and-pink-flavor', 479, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:08:35', '2021-03-06 03:19:37'),
(1407, 'ashley-in-house-handpoured-aromatherapy-candles-purple-and-pink-flavor', 480, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:08:57', '2021-03-06 03:19:09'),
(1408, 'ashley-in-house-handpoured-aromatherapy-candles-purple-and-pink-flavor', 481, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:09:11', '2021-03-06 03:18:51'),
(1409, 'ashley-in-house-handpoured-aromatherapy-candles-purple-and-pink-flavor', 482, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:09:36', '2021-03-06 03:18:28'),
(1411, 'ashley-in-house-handpoured-aromatherapy-candles-brown-flavor', 484, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:13:29', '2021-03-06 15:46:22'),
(1412, 'ashley-in-house-handpoured-aromatherapy-candles-brown-flavor', 485, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:21:27', '2021-03-03 17:21:27'),
(1413, 'ashley-in-house-handpoured-aromatherapy-candles-brown-flavor', 486, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:21:38', '2021-03-07 01:19:54'),
(1414, 'ashley-in-house-handpoured-aromatherapy-candles-brown-flavor', 487, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:21:46', '2021-03-07 01:20:39'),
(1415, 'ashley-in-house-handpoured-aromatherapy-candles-brown-flavor', 488, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:21:57', '2021-03-07 01:22:41'),
(1416, 'ashley-in-house-handpoured-aromatherapy-candles-brown-flavor', 489, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:22:08', '2021-03-07 01:59:54'),
(1417, 'ashley-in-house-handpoured-aromatherapy-candles-brown-flavor', 490, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:22:23', '2021-03-07 02:00:17'),
(1418, 'ashley-in-house-handpoured-aromatherapy-candles-brown-flavor', 491, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:22:36', '2021-03-07 02:00:52'),
(1419, 'ashley-in-house-handpoured-aromatherapy-candles-brown-flavor', 492, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:22:48', '2021-03-07 02:01:25'),
(1420, 'ashley-in-house-handpoured-aromatherapy-candles-brown-flavor', 493, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:23:05', '2021-03-07 02:01:47'),
(1421, 'ashley-in-house-handpoured-aromatherapy-candles-brown-flavor', 494, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:23:20', '2021-03-07 02:02:25'),
(1422, 'ashley-in-house-handpoured-aromatherapy-candles-brown-flavor', 495, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:23:32', '2021-03-07 02:02:56'),
(1423, 'ashley-in-house-handpoured-aromatherapy-candles-brown-flavor', 496, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:23:45', '2021-03-07 02:03:27'),
(1424, 'ashley-in-house-handpoured-aromatherapy-candles-brown-flavor', 497, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:23:56', '2021-03-07 02:04:10'),
(1425, 'ashley-in-house-handpoured-aromatherapy-candles-brown-flavor', 498, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:24:16', '2021-03-07 02:04:45'),
(1426, 'ashley-in-house-handpoured-aromatherapy-candles-brown-flavor', 499, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:24:28', '2021-03-07 02:05:06'),
(1427, 'ashley-in-house-handpoured-aromatherapy-candles-brown-flavor', 500, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:24:40', '2021-03-07 02:05:29'),
(1428, 'ashley-in-house-handpoured-aromatherapy-candles-brown-flavor', 501, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:24:51', '2021-03-07 02:05:54'),
(1429, 'ashley-in-house-handpoured-aromatherapy-candles-brown-flavor', 502, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:25:09', '2021-03-07 02:06:23'),
(1430, 'ashley-in-house-handpoured-aromatherapy-candles-brown-flavor', 503, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:25:19', '2021-03-07 02:07:02'),
(1431, 'ashley-in-house-handpoured-aromatherapy-candles-brown-flavor', 504, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:25:30', '2021-03-07 02:07:32'),
(1432, 'ashley-in-house-handpoured-aromatherapy-candles-brown-flavor', 505, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:25:41', '2021-03-07 02:07:57'),
(1433, 'ashley-in-house-handpoured-aromatherapy-candles-brown-flavor', 506, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:26:02', '2021-03-07 02:08:30'),
(1434, 'ashley-in-house-handpoured-aromatherapy-candles-brown-flavor', 507, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:26:15', '2021-03-07 02:08:58'),
(1435, 'ashley-in-house-handpoured-aromatherapy-candles-1', 508, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:28:08', '2021-03-03 17:28:08'),
(1436, 'ashley-in-house-handpoured-aromatherapy-candles-blue-flavor', 509, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:28:31', '2021-03-03 17:28:31'),
(1437, 'ashley-in-house-handpoured-aromatherapy-candles-blue-flavor-1', 510, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:28:41', '2021-03-03 17:28:41'),
(1438, 'ashley-in-house-handpoured-aromatherapy-candles-blue-flavor-2', 511, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:28:52', '2021-03-03 17:28:52'),
(1439, 'ashley-in-house-handpoured-aromatherapy-candles-blue-flavor-3', 512, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:29:02', '2021-03-03 17:29:02'),
(1440, 'ashley-in-house-handpoured-aromatherapy-candles-blue-flavor-4', 513, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:29:10', '2021-03-03 17:29:10'),
(1441, 'ashley-in-house-handpoured-aromatherapy-candles-blue-flavor-5', 514, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:29:21', '2021-03-03 17:29:21'),
(1442, 'ashley-in-house-handpoured-aromatherapy-candles-blue-flavor-6', 515, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:29:31', '2021-03-03 17:29:31'),
(1443, 'ashley-in-house-handpoured-aromatherapy-candles-blue-flavor-7', 516, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:30:00', '2021-03-03 17:30:00'),
(1444, 'ashley-in-house-handpoured-aromatherapy-candles-blue-flavor-8', 517, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:30:26', '2021-03-03 17:30:26'),
(1445, 'ashley-in-house-handpoured-aromatherapy-candles-blue-flavor-9', 518, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:30:58', '2021-03-03 17:30:58'),
(1446, 'ashley-in-house-handpoured-aromatherapy-candles-blue-flavor-10', 519, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:32:57', '2021-03-03 17:32:57'),
(1447, 'ashley-in-house-handpoured-aromatherapy-candles-blue-flavor-11', 520, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:33:08', '2021-03-03 17:33:08'),
(1448, 'ashley-in-house-handpoured-aromatherapy-candles-blue-flavor-12', 521, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:33:17', '2021-03-03 17:33:17'),
(1449, 'ashley-in-house-handpoured-aromatherapy-candles-blue-flavor-13', 522, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:33:27', '2021-03-03 17:33:27'),
(1450, 'ashley-in-house-handpoured-aromatherapy-candles-blue-flavor-14', 523, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:33:39', '2021-03-03 17:33:39'),
(1451, 'ashley-in-house-handpoured-aromatherapy-candles-blue-flavor-15', 524, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:33:49', '2021-03-03 17:33:49'),
(1452, 'ashley-in-house-handpoured-aromatherapy-candles-blue-flavor-16', 525, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:33:59', '2021-03-03 17:33:59'),
(1453, 'ashley-in-house-handpoured-aromatherapy-candles-blue-flavor-17', 526, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:34:13', '2021-03-03 17:34:13'),
(1454, 'ashley-in-house-handpoured-aromatherapy-candles-blue-flavor-18', 527, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:34:24', '2021-03-03 17:34:24'),
(1455, 'ashley-in-house-handpoured-aromatherapy-candles-blue-flavor-19', 528, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:34:37', '2021-03-03 17:34:37'),
(1456, 'ashley-in-house-handpoured-aromatherapy-candles-blue-flavor-20', 529, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:34:47', '2021-03-03 17:34:47'),
(1457, 'ashley-in-house-handpoured-aromatherapy-candle-1', 530, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:36:18', '2021-03-03 17:36:18'),
(1458, 'ashley-in-house-handpoured-aromatherapy-candle-purple-flavor', 531, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:36:33', '2021-03-03 17:36:33'),
(1459, 'ashley-in-house-handpoured-aromatherapy-candle-purple-flavor-1', 532, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:36:42', '2021-03-03 17:36:42'),
(1460, 'ashley-in-house-handpoured-aromatherapy-candle-purple-flavor-2', 533, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:36:49', '2021-03-03 17:36:49'),
(1461, 'ashley-in-house-handpoured-aromatherapy-candle-purple-flavor-3', 534, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:36:57', '2021-03-03 17:36:57'),
(1462, 'ashley-in-house-handpoured-aromatherapy-candle-purple-flavor-4', 535, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:37:04', '2021-03-03 17:37:04'),
(1463, 'ashley-in-house-handpoured-aromatherapy-candle-purple-flavor-5', 536, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:37:11', '2021-03-03 17:37:11'),
(1464, 'ashley-in-house-handpoured-aromatherapy-candle-purple-flavor-6', 537, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:37:19', '2021-03-03 17:37:19'),
(1465, 'ashley-in-house-handpoured-aromatherapy-candle-purple-flavor-7', 538, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:37:27', '2021-03-03 17:37:27'),
(1466, 'ashley-in-house-handpoured-aromatherapy-candle-purple-flavor-8', 539, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:37:37', '2021-03-03 17:37:37'),
(1467, 'ashley-in-house-handpoured-aromatherapy-candle-purple-flavor-9', 540, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:37:45', '2021-03-03 17:37:45'),
(1468, 'ashley-in-house-handpoured-aromatherapy-candle-purple-flavor-10', 541, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:37:52', '2021-03-03 17:37:52'),
(1469, 'ashley-in-house-handpoured-aromatherapy-candle-purple-flavor-11', 542, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:38:00', '2021-03-03 17:38:00'),
(1470, 'ashley-in-house-handpoured-aromatherapy-candle-purple-flavor-12', 543, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:38:08', '2021-03-03 17:38:08'),
(1471, 'ashley-in-house-handpoured-aromatherapy-candle-purple-flavor-13', 544, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:38:21', '2021-03-03 17:38:21'),
(1472, 'ashley-in-house-handpoured-aromatherapy-candle-purple-flavor-14', 545, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:38:40', '2021-03-03 17:38:40'),
(1473, 'ashley-in-house-handpoured-aromatherapy-candle-purple-flavor-15', 546, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:38:52', '2021-03-03 17:38:52'),
(1474, 'ashley-in-house-handpoured-aromatherapy-candle-purple-flavor-16', 547, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:39:08', '2021-03-03 17:39:08'),
(1475, 'ashley-in-house-handpoured-aromatherapy-candle-purple-flavor-17', 548, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:39:19', '2021-03-03 17:39:19'),
(1476, 'ashley-in-house-handpoured-aromatherapy-candle-purple-flavor-18', 549, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:39:27', '2021-03-03 17:39:27'),
(1477, 'ashley-in-house-handpoured-aromatherapy-candle-purple-flavor-19', 550, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:39:35', '2021-03-03 17:39:35'),
(1478, 'ashley-in-house-handpoured-aromatherapy-candle-purple-flavor-20', 551, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:39:44', '2021-03-03 17:39:44'),
(1479, 'ashley-in-house-handpoured-aromatherapy-candle-purple-flavor-21', 552, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:40:15', '2021-03-03 17:40:15'),
(1480, 'ashley-in-house-handpoured-aromatherapy-candle-purple-flavor-22', 553, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-03 17:40:25', '2021-03-03 17:40:25'),
(1481, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container', 554, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:11:53', '2021-03-05 22:50:25'),
(1482, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-2', 555, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:13:09', '2021-03-05 22:13:09'),
(1483, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-3', 556, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:13:20', '2021-03-05 22:13:20'),
(1484, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-4', 557, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:13:32', '2021-03-05 22:13:32'),
(1485, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-5', 558, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:13:49', '2021-03-05 22:13:49'),
(1486, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-6', 559, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:14:00', '2021-03-05 22:14:00'),
(1487, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-7', 560, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:14:08', '2021-03-05 22:14:08'),
(1488, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-8', 561, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:14:18', '2021-03-05 22:14:18'),
(1489, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-9', 562, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:14:29', '2021-03-05 22:14:29'),
(1490, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-10', 563, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:14:47', '2021-03-05 22:14:47'),
(1491, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-11', 564, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:15:14', '2021-03-05 22:15:14'),
(1492, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-12', 565, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:15:24', '2021-03-05 22:15:24'),
(1493, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-13', 566, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:15:37', '2021-03-05 22:15:37'),
(1494, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-14', 567, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:16:52', '2021-03-05 22:16:52'),
(1495, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-15', 568, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:17:04', '2021-03-05 22:17:04'),
(1496, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-16', 569, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:17:17', '2021-03-05 22:17:17'),
(1497, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-17', 570, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:17:27', '2021-03-05 22:17:27'),
(1498, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-18', 571, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:17:41', '2021-03-05 22:17:41'),
(1499, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-19', 572, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:17:56', '2021-03-05 22:17:56'),
(1500, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-20', 573, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:18:13', '2021-03-05 22:18:13'),
(1501, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-21', 574, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:18:27', '2021-03-05 22:18:27'),
(1502, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-22', 575, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:18:39', '2021-03-05 22:18:39'),
(1503, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-23', 576, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:19:03', '2021-03-05 22:19:03'),
(1504, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-24', 577, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:19:22', '2021-03-05 22:19:22'),
(1505, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-25', 578, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:19:35', '2021-03-05 22:19:35');
INSERT INTO `slugs` (`id`, `key`, `reference_id`, `reference_type`, `prefix`, `created_at`, `updated_at`) VALUES
(1506, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-26', 579, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:19:53', '2021-03-05 22:19:53'),
(1507, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-27', 580, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:20:08', '2021-03-05 22:20:08'),
(1508, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-28', 581, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:20:24', '2021-03-05 22:20:24'),
(1509, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-29', 582, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:20:41', '2021-03-05 22:20:41'),
(1510, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-30', 583, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:20:55', '2021-03-05 22:20:55'),
(1511, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-31', 584, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:21:10', '2021-03-05 22:21:10'),
(1512, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-32', 585, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:21:36', '2021-03-05 22:21:36'),
(1513, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-33', 586, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:21:52', '2021-03-05 22:21:52'),
(1514, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-34', 587, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:22:13', '2021-03-05 22:22:13'),
(1515, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-35', 588, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:22:32', '2021-03-05 22:22:32'),
(1516, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-36', 589, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:22:50', '2021-03-05 22:22:50'),
(1517, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-37', 590, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:23:10', '2021-03-05 22:23:10'),
(1518, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-38', 591, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:23:25', '2021-03-05 22:23:25'),
(1519, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-39', 592, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:23:39', '2021-03-05 22:23:39'),
(1520, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-40', 593, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:23:55', '2021-03-05 22:23:55'),
(1521, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-41', 594, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:24:11', '2021-03-05 22:24:11'),
(1522, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-42', 595, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:24:55', '2021-03-05 22:24:55'),
(1523, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-43', 596, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:25:11', '2021-03-05 22:25:11'),
(1524, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-44', 597, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:25:25', '2021-03-05 22:25:25'),
(1525, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-45', 598, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:25:40', '2021-03-05 22:25:40'),
(1526, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-46', 599, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:26:01', '2021-03-05 22:26:01'),
(1527, 'ashley-handmade-aromatherapy-scented-tealights-presented-in-clear-heartround-shaped-tealight-container-47', 600, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 22:26:30', '2021-03-05 22:26:30'),
(1528, 'ashley-in-house-handpoured-aromatherapy-candles-purple-and-pink-flavor-21', 601, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-05 23:57:15', '2021-03-05 23:57:15'),
(1529, 'display-flower', 602, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-07 03:11:54', '2021-03-07 03:11:54'),
(1530, 'display-flower', 603, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-07 03:21:12', '2021-03-07 03:28:11'),
(1531, 'display-flower', 604, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-07 03:24:23', '2021-03-07 03:25:22'),
(1532, 'display-flower-2', 605, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-07 03:25:44', '2021-03-07 03:25:44'),
(1533, 'display-flower-3', 606, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-07 03:26:07', '2021-03-07 03:26:07'),
(1534, 'display-flower-4', 607, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-07 03:27:06', '2021-03-07 03:27:06'),
(1539, 'ashley-in-house-aromatherapy-handpoured-scented-soy-wax-candles-presented-in-clear-glass', 612, 'Botble\\Ecommerce\\Models\\Product', 'products', '2021-03-13 00:28:47', '2021-03-13 00:30:52');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `author_id`, `author_type`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'General', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(2, 'Design', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(3, 'Jquery', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(4, 'Branding', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2020-11-07 02:12:50', '2020-11-07 02:12:50'),
(5, 'Modern', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2020-11-07 02:12:50', '2020-11-07 02:12:50');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'auth', 'failed', 'These credentials do not match our records.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(2, 1, 'en', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(3, 1, 'en', 'pagination', 'previous', '&laquo; Previous', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(4, 1, 'en', 'pagination', 'next', 'Next &raquo;', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(5, 1, 'en', 'passwords', 'reset', 'Your password has been reset!', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(6, 1, 'en', 'passwords', 'sent', 'We have emailed your password reset link!', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(7, 1, 'en', 'passwords', 'throttled', 'Please wait before retrying.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(8, 1, 'en', 'passwords', 'token', 'This password reset token is invalid.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(9, 1, 'en', 'passwords', 'user', 'We can\'t find a user with that email address.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(10, 1, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(11, 1, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(12, 1, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(13, 1, 'en', 'validation', 'after_or_equal', 'The :attribute must be a date after or equal to :date.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(14, 1, 'en', 'validation', 'alpha', 'The :attribute may only contain letters.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(15, 1, 'en', 'validation', 'alpha_dash', 'The :attribute may only contain letters, numbers, dashes and underscores.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(16, 1, 'en', 'validation', 'alpha_num', 'The :attribute may only contain letters and numbers.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(17, 1, 'en', 'validation', 'array', 'The :attribute must be an array.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(18, 1, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(19, 1, 'en', 'validation', 'before_or_equal', 'The :attribute must be a date before or equal to :date.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(20, 1, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(21, 1, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(22, 1, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(23, 1, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(24, 1, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(25, 1, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(26, 1, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(27, 1, 'en', 'validation', 'date_equals', 'The :attribute must be a date equal to :date.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(28, 1, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(29, 1, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(30, 1, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(31, 1, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(32, 1, 'en', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(33, 1, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(34, 1, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(35, 1, 'en', 'validation', 'ends_with', 'The :attribute must end with one of the following: :values.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(36, 1, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(37, 1, 'en', 'validation', 'file', 'The :attribute must be a file.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(38, 1, 'en', 'validation', 'filled', 'The :attribute field must have a value.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(39, 1, 'en', 'validation', 'gt.numeric', 'The :attribute must be greater than :value.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(40, 1, 'en', 'validation', 'gt.file', 'The :attribute must be greater than :value kilobytes.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(41, 1, 'en', 'validation', 'gt.string', 'The :attribute must be greater than :value characters.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(42, 1, 'en', 'validation', 'gt.array', 'The :attribute must have more than :value items.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(43, 1, 'en', 'validation', 'gte.numeric', 'The :attribute must be greater than or equal :value.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(44, 1, 'en', 'validation', 'gte.file', 'The :attribute must be greater than or equal :value kilobytes.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(45, 1, 'en', 'validation', 'gte.string', 'The :attribute must be greater than or equal :value characters.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(46, 1, 'en', 'validation', 'gte.array', 'The :attribute must have :value items or more.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(47, 1, 'en', 'validation', 'image', 'The :attribute must be an image.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(48, 1, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(49, 1, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2020-11-15 20:58:13', '2020-11-15 20:58:13'),
(50, 1, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(51, 1, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(52, 1, 'en', 'validation', 'ipv4', 'The :attribute must be a valid IPv4 address.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(53, 1, 'en', 'validation', 'ipv6', 'The :attribute must be a valid IPv6 address.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(54, 1, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(55, 1, 'en', 'validation', 'lt.numeric', 'The :attribute must be less than :value.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(56, 1, 'en', 'validation', 'lt.file', 'The :attribute must be less than :value kilobytes.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(57, 1, 'en', 'validation', 'lt.string', 'The :attribute must be less than :value characters.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(58, 1, 'en', 'validation', 'lt.array', 'The :attribute must have less than :value items.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(59, 1, 'en', 'validation', 'lte.numeric', 'The :attribute must be less than or equal :value.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(60, 1, 'en', 'validation', 'lte.file', 'The :attribute must be less than or equal :value kilobytes.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(61, 1, 'en', 'validation', 'lte.string', 'The :attribute must be less than or equal :value characters.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(62, 1, 'en', 'validation', 'lte.array', 'The :attribute must not have more than :value items.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(63, 1, 'en', 'validation', 'max.numeric', 'The :attribute may not be greater than :max.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(64, 1, 'en', 'validation', 'max.file', 'The :attribute may not be greater than :max kilobytes.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(65, 1, 'en', 'validation', 'max.string', 'The :attribute may not be greater than :max characters.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(66, 1, 'en', 'validation', 'max.array', 'The :attribute may not have more than :max items.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(67, 1, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(68, 1, 'en', 'validation', 'mimetypes', 'The :attribute must be a file of type: :values.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(69, 1, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(70, 1, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(71, 1, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(72, 1, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(73, 1, 'en', 'validation', 'multiple_of', 'The :attribute must be a multiple of :value', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(74, 1, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(75, 1, 'en', 'validation', 'not_regex', 'The :attribute format is invalid.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(76, 1, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(77, 1, 'en', 'validation', 'password', 'The password is incorrect.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(78, 1, 'en', 'validation', 'present', 'The :attribute field must be present.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(79, 1, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(80, 1, 'en', 'validation', 'required', 'The :attribute field is required.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(81, 1, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(82, 1, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(83, 1, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(84, 1, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values are present.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(85, 1, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(86, 1, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(87, 1, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(88, 1, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(89, 1, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(90, 1, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(91, 1, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(92, 1, 'en', 'validation', 'starts_with', 'The :attribute must start with one of the following: :values.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(93, 1, 'en', 'validation', 'string', 'The :attribute must be a string.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(94, 1, 'en', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(95, 1, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(96, 1, 'en', 'validation', 'uploaded', 'The :attribute failed to upload.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(97, 1, 'en', 'validation', 'url', 'The :attribute format is invalid.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(98, 1, 'en', 'validation', 'uuid', 'The :attribute must be a valid UUID.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(99, 1, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(100, 1, 'en', 'core/acl/api', 'api_clients', 'API Clients', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(101, 1, 'en', 'core/acl/api', 'create_new_client', 'Create new client', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(102, 1, 'en', 'core/acl/api', 'create_new_client_success', 'Create new client successfully!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(103, 1, 'en', 'core/acl/api', 'edit_client', 'Edit client \":name\"', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(104, 1, 'en', 'core/acl/api', 'edit_client_success', 'Updated client successfully!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(105, 1, 'en', 'core/acl/api', 'delete_success', 'Deleted client successfully!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(106, 1, 'en', 'core/acl/api', 'confirm_delete_title', 'Confirm delete client \":name\"', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(107, 1, 'en', 'core/acl/api', 'confirm_delete_description', 'Do you really want to delete client \":name\"?', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(108, 1, 'en', 'core/acl/api', 'cancel_delete', 'No', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(109, 1, 'en', 'core/acl/api', 'continue_delete', 'Yes, let\'s delete it!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(110, 1, 'en', 'core/acl/api', 'name', 'Name', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(111, 1, 'en', 'core/acl/api', 'cancel', 'Cancel', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(112, 1, 'en', 'core/acl/api', 'save', 'Save', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(113, 1, 'en', 'core/acl/api', 'edit', 'Edit', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(114, 1, 'en', 'core/acl/api', 'delete', 'Delete', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(115, 1, 'en', 'core/acl/api', 'client_id', 'Client ID', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(116, 1, 'en', 'core/acl/api', 'secret', 'Secret', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(117, 1, 'en', 'core/acl/auth', 'login.username', 'Email/Username', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(118, 1, 'en', 'core/acl/auth', 'login.email', 'Email', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(119, 1, 'en', 'core/acl/auth', 'login.password', 'Password', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(120, 1, 'en', 'core/acl/auth', 'login.title', 'User Login', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(121, 1, 'en', 'core/acl/auth', 'login.remember', 'Remember me?', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(122, 1, 'en', 'core/acl/auth', 'login.login', 'Sign in', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(123, 1, 'en', 'core/acl/auth', 'login.placeholder.username', 'Please enter your username', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(124, 1, 'en', 'core/acl/auth', 'login.placeholder.email', 'Please enter your email', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(125, 1, 'en', 'core/acl/auth', 'login.success', 'Login successfully!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(126, 1, 'en', 'core/acl/auth', 'login.fail', 'Wrong username or password.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(127, 1, 'en', 'core/acl/auth', 'login.not_active', 'Your account has not been activated yet!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(128, 1, 'en', 'core/acl/auth', 'login.banned', 'This account is banned.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(129, 1, 'en', 'core/acl/auth', 'login.logout_success', 'Logout successfully!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(130, 1, 'en', 'core/acl/auth', 'login.dont_have_account', 'You don\'t have account on this system, please contact administrator for more information!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(131, 1, 'en', 'core/acl/auth', 'forgot_password.title', 'Forgot Password', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(132, 1, 'en', 'core/acl/auth', 'forgot_password.message', '<p>Have you forgotten your password?</p><p>Please enter your email account. System will send a email with active link to reset your password.</p>', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(133, 1, 'en', 'core/acl/auth', 'forgot_password.submit', 'Submit', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(134, 1, 'en', 'core/acl/auth', 'reset.new_password', 'New password', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(135, 1, 'en', 'core/acl/auth', 'reset.password_confirmation', 'Confirm new password', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(136, 1, 'en', 'core/acl/auth', 'reset.email', 'Email', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(137, 1, 'en', 'core/acl/auth', 'reset.title', 'Reset your password', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(138, 1, 'en', 'core/acl/auth', 'reset.update', 'Update', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(139, 1, 'en', 'core/acl/auth', 'reset.wrong_token', 'This link is invalid or expired. Please try using reset form again.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(140, 1, 'en', 'core/acl/auth', 'reset.user_not_found', 'This username is not exist.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(141, 1, 'en', 'core/acl/auth', 'reset.success', 'Reset password successfully!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(142, 1, 'en', 'core/acl/auth', 'reset.fail', 'Token is invalid, the reset password link has been expired!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(143, 1, 'en', 'core/acl/auth', 'reset.reset.title', 'Email reset password', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(144, 1, 'en', 'core/acl/auth', 'reset.send.success', 'A email was sent to your email account. Please check and complete this action.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(145, 1, 'en', 'core/acl/auth', 'reset.send.fail', 'Can not send email in this time. Please try again later.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(146, 1, 'en', 'core/acl/auth', 'reset.new-password', 'New password', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(147, 1, 'en', 'core/acl/auth', 'email.reminder.title', 'Email reset password', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(148, 1, 'en', 'core/acl/auth', 'password_confirmation', 'Password confirm', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(149, 1, 'en', 'core/acl/auth', 'failed', 'Failed', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(150, 1, 'en', 'core/acl/auth', 'throttle', 'Throttle', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(151, 1, 'en', 'core/acl/auth', 'not_member', 'Not a member yet?', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(152, 1, 'en', 'core/acl/auth', 'register_now', 'Register now', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(153, 1, 'en', 'core/acl/auth', 'lost_your_password', 'Lost your password?', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(154, 1, 'en', 'core/acl/auth', 'login_title', 'Admin', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(155, 1, 'en', 'core/acl/auth', 'login_via_social', 'Login with social networks', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(156, 1, 'en', 'core/acl/auth', 'back_to_login', 'Back to login page', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(157, 1, 'en', 'core/acl/auth', 'sign_in_below', 'Sign In Below', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(158, 1, 'en', 'core/acl/auth', 'languages', 'Languages', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(159, 1, 'en', 'core/acl/auth', 'reset_password', 'Reset Password', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(160, 1, 'en', 'core/acl/permissions', 'notices.role_in_use', 'Cannot delete this role, it is still in use!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(161, 1, 'en', 'core/acl/permissions', 'notices.role_delete_belong_user', 'You are not able to delete this role; it belongs to someone else!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(162, 1, 'en', 'core/acl/permissions', 'notices.role_edit_belong_user', 'You are not able to edit this role; it belongs to someone else!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(163, 1, 'en', 'core/acl/permissions', 'notices.delete_global_role', 'You are not allowed to delete global roles!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(164, 1, 'en', 'core/acl/permissions', 'notices.delete_success', 'The selected role was deleted successfully!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(165, 1, 'en', 'core/acl/permissions', 'notices.modified_success', 'The selected role was modified successfully!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(166, 1, 'en', 'core/acl/permissions', 'notices.create_success', 'The new role was successfully created', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(167, 1, 'en', 'core/acl/permissions', 'notices.duplicated_success', 'The selected role was duplicated successfully', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(168, 1, 'en', 'core/acl/permissions', 'notices.no_select', 'Please select at least one record to take this action!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(169, 1, 'en', 'core/acl/permissions', 'notices.not_found', 'Role not found', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(170, 1, 'en', 'core/acl/permissions', 'name', 'Name', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(171, 1, 'en', 'core/acl/permissions', 'current_role', 'Current Role', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(172, 1, 'en', 'core/acl/permissions', 'no_role_assigned', 'No role assigned', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(173, 1, 'en', 'core/acl/permissions', 'role_assigned', 'Assigned Role', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(174, 1, 'en', 'core/acl/permissions', 'create_role', 'Create New Role', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(175, 1, 'en', 'core/acl/permissions', 'role_name', 'Name', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(176, 1, 'en', 'core/acl/permissions', 'role_description', 'Description', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(177, 1, 'en', 'core/acl/permissions', 'permission_flags', 'Permission Flags', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(178, 1, 'en', 'core/acl/permissions', 'cancel', 'Cancel', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(179, 1, 'en', 'core/acl/permissions', 'reset', 'Reset', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(180, 1, 'en', 'core/acl/permissions', 'save', 'Save', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(181, 1, 'en', 'core/acl/permissions', 'global_role_msg', 'This is a global role and cannot be modified.  You can use the Duplicate button to make a copy of this role that you can then modify.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(182, 1, 'en', 'core/acl/permissions', 'details', 'Details', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(183, 1, 'en', 'core/acl/permissions', 'duplicate', 'Duplicate', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(184, 1, 'en', 'core/acl/permissions', 'all', 'All Permissions', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(185, 1, 'en', 'core/acl/permissions', 'list_role', 'List Roles', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(186, 1, 'en', 'core/acl/permissions', 'created_on', 'Created On', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(187, 1, 'en', 'core/acl/permissions', 'created_by', 'Created By', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(188, 1, 'en', 'core/acl/permissions', 'actions', 'Actions', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(189, 1, 'en', 'core/acl/permissions', 'role_in_use', 'Cannot delete this role, it is still in use!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(190, 1, 'en', 'core/acl/permissions', 'role_delete_belong_user', 'You are not able to delete this role; it belongs to someone else!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(191, 1, 'en', 'core/acl/permissions', 'delete_global_role', 'Can not delete global role', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(192, 1, 'en', 'core/acl/permissions', 'delete_success', 'Delete role successfully', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(193, 1, 'en', 'core/acl/permissions', 'no_select', 'Please select at least one role to take this action!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(194, 1, 'en', 'core/acl/permissions', 'not_found', 'No role found!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(195, 1, 'en', 'core/acl/permissions', 'role_edit_belong_user', 'You are not able to edit this role; it belongs to someone else!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(196, 1, 'en', 'core/acl/permissions', 'modified_success', 'Modified successfully', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(197, 1, 'en', 'core/acl/permissions', 'create_success', 'Create successfully', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(198, 1, 'en', 'core/acl/permissions', 'duplicated_success', 'Duplicated successfully', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(199, 1, 'en', 'core/acl/permissions', 'options', 'Options', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(200, 1, 'en', 'core/acl/permissions', 'access_denied_message', 'You are not allowed to do this action', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(201, 1, 'en', 'core/acl/permissions', 'roles', 'Roles', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(202, 1, 'en', 'core/acl/permissions', 'role_permission', 'Roles and Permissions', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(203, 1, 'en', 'core/acl/permissions', 'user_management', 'User Management', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(204, 1, 'en', 'core/acl/permissions', 'super_user_management', 'Super User Management', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(205, 1, 'en', 'core/acl/permissions', 'action_unauthorized', 'This action is unauthorized.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(206, 1, 'en', 'core/acl/reminders', 'password', 'Passwords must be at least six characters and match the confirmation.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(207, 1, 'en', 'core/acl/reminders', 'user', 'We can\'t find a user with that e-mail address.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(208, 1, 'en', 'core/acl/reminders', 'token', 'This password reset token is invalid.', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(209, 1, 'en', 'core/acl/reminders', 'sent', 'Password reminder sent!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(210, 1, 'en', 'core/acl/reminders', 'reset', 'Password has been reset!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(211, 1, 'en', 'core/acl/users', 'delete_user_logged_in', 'Can\'t delete this user. This user is logged on!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(212, 1, 'en', 'core/acl/users', 'no_select', 'Please select at least one record to take this action!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(213, 1, 'en', 'core/acl/users', 'lock_user_logged_in', 'Can\'t lock this user. This user is logged on!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(214, 1, 'en', 'core/acl/users', 'update_success', 'Update status successfully!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(215, 1, 'en', 'core/acl/users', 'save_setting_failed', 'Something went wrong when save your setting', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(216, 1, 'en', 'core/acl/users', 'not_found', 'User not found', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(217, 1, 'en', 'core/acl/users', 'email_exist', 'That email address already belongs to an existing account', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(218, 1, 'en', 'core/acl/users', 'username_exist', 'That username address already belongs to an existing account', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(219, 1, 'en', 'core/acl/users', 'update_profile_success', 'Your profile changes were successfully saved', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(220, 1, 'en', 'core/acl/users', 'password_update_success', 'Password successfully changed', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(221, 1, 'en', 'core/acl/users', 'current_password_not_valid', 'Current password is not valid', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(222, 1, 'en', 'core/acl/users', 'user_exist_in', 'User is already a member', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(223, 1, 'en', 'core/acl/users', 'email', 'Email', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(224, 1, 'en', 'core/acl/users', 'role', 'Role', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(225, 1, 'en', 'core/acl/users', 'username', 'Username', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(226, 1, 'en', 'core/acl/users', 'last_name', 'Last Name', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(227, 1, 'en', 'core/acl/users', 'first_name', 'First Name', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(228, 1, 'en', 'core/acl/users', 'message', 'Message', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(229, 1, 'en', 'core/acl/users', 'cancel_btn', 'Cancel', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(230, 1, 'en', 'core/acl/users', 'change_password', 'Change password', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(231, 1, 'en', 'core/acl/users', 'current_password', 'Current password', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(232, 1, 'en', 'core/acl/users', 'new_password', 'New Password', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(233, 1, 'en', 'core/acl/users', 'confirm_new_password', 'Confirm New Password', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(234, 1, 'en', 'core/acl/users', 'password', 'Password', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(235, 1, 'en', 'core/acl/users', 'save', 'Save', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(236, 1, 'en', 'core/acl/users', 'cannot_delete', 'User could not be deleted', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(237, 1, 'en', 'core/acl/users', 'deleted', 'User deleted', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(238, 1, 'en', 'core/acl/users', 'last_login', 'Last Login', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(239, 1, 'en', 'core/acl/users', 'error_update_profile_image', 'Error when update profile image', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(240, 1, 'en', 'core/acl/users', 'email_reminder_template', '<h3>Hello :name</h3><p>The system has received a request to restore the password for your account, to complete this task please click the link below.</p><p><a href=\":link\">Reset password now</a></p><p>If not you ask recover password, please ignore this email.</p><p>This email is valid for 60 minutes after receiving the email.</p>', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(241, 1, 'en', 'core/acl/users', 'change_profile_image', 'Change Profile Image', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(242, 1, 'en', 'core/acl/users', 'new_image', 'New Image', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(243, 1, 'en', 'core/acl/users', 'loading', 'Loading', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(244, 1, 'en', 'core/acl/users', 'close', 'Close', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(245, 1, 'en', 'core/acl/users', 'update', 'Update', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(246, 1, 'en', 'core/acl/users', 'read_image_failed', 'Failed to read the image file', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(247, 1, 'en', 'core/acl/users', 'users', 'Users', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(248, 1, 'en', 'core/acl/users', 'update_avatar_success', 'Update profile image successfully!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(249, 1, 'en', 'core/acl/users', 'info.title', 'User profile', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(250, 1, 'en', 'core/acl/users', 'info.first_name', 'First Name', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(251, 1, 'en', 'core/acl/users', 'info.last_name', 'Last Name', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(252, 1, 'en', 'core/acl/users', 'info.email', 'Email', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(253, 1, 'en', 'core/acl/users', 'info.second_email', 'Secondary Email', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(254, 1, 'en', 'core/acl/users', 'info.address', 'Address', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(255, 1, 'en', 'core/acl/users', 'info.second_address', 'Secondary Address', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(256, 1, 'en', 'core/acl/users', 'info.birth_day', 'Date of birth', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(257, 1, 'en', 'core/acl/users', 'info.job', 'Job Position', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(258, 1, 'en', 'core/acl/users', 'info.mobile_number', 'Mobile Number', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(259, 1, 'en', 'core/acl/users', 'info.second_mobile_number', 'Secondary Phone', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(260, 1, 'en', 'core/acl/users', 'info.interes', 'Interests', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(261, 1, 'en', 'core/acl/users', 'info.about', 'About', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(262, 1, 'en', 'core/acl/users', 'gender.title', 'Gender', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(263, 1, 'en', 'core/acl/users', 'gender.male', 'Male', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(264, 1, 'en', 'core/acl/users', 'gender.female', 'Female', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(265, 1, 'en', 'core/acl/users', 'total_users', 'Total users', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(266, 1, 'en', 'core/acl/users', 'statuses.activated', 'Activated', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(267, 1, 'en', 'core/acl/users', 'statuses.deactivated', 'Deactivated', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(268, 1, 'en', 'core/acl/users', 'make_super', 'Make super', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(269, 1, 'en', 'core/acl/users', 'remove_super', 'Remove super', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(270, 1, 'en', 'core/acl/users', 'is_super', 'Is super?', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(271, 1, 'en', 'core/acl/users', 'email_placeholder', 'Ex: example@gmail.com', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(272, 1, 'en', 'core/acl/users', 'password_confirmation', 'Re-type password', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(273, 1, 'en', 'core/acl/users', 'select_role', 'Select role', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(274, 1, 'en', 'core/acl/users', 'create_new_user', 'Create a new user', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(275, 1, 'en', 'core/acl/users', 'cannot_delete_super_user', 'Permission denied. Cannot delete a super user!', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(276, 1, 'en', 'core/acl/users', 'assigned_role', 'Assigned Role', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(277, 1, 'en', 'core/acl/users', 'no_role_assigned', 'No role assigned', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(278, 1, 'en', 'core/acl/users', 'view_user_profile', 'View user\'s profile', '2020-11-15 20:58:14', '2020-11-15 20:58:14'),
(425, 1, 'en', 'core/base/base', 'yes', 'Yes', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(426, 1, 'en', 'core/base/base', 'no', 'No', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(427, 1, 'en', 'core/base/base', 'is_default', 'Is default?', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(428, 1, 'en', 'core/base/base', 'proc_close_disabled_error', 'Function proc_close() is disabled. Please contact your hosting provider to enable\n    it. Or you can add to .env: CAN_EXECUTE_COMMAND=false to disable this feature.', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(429, 1, 'en', 'core/base/base', 'email_template.header', 'Email template header', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(430, 1, 'en', 'core/base/base', 'email_template.footer', 'Email template footer', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(431, 1, 'en', 'core/base/base', 'email_template.site_title', 'Site title', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(432, 1, 'en', 'core/base/base', 'email_template.site_url', 'Site URL', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(433, 1, 'en', 'core/base/base', 'email_template.site_logo', 'Site Logo', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(434, 1, 'en', 'core/base/base', 'email_template.date_time', 'Current date time', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(435, 1, 'en', 'core/base/base', 'email_template.date_year', 'Current year', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(436, 1, 'en', 'core/base/base', 'email_template.site_admin_email', 'Site admin email', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(437, 1, 'en', 'core/base/base', 'change_image', 'Change image', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(438, 1, 'en', 'core/base/base', 'delete_image', 'Delete image', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(439, 1, 'en', 'core/base/base', 'preview_image', 'Preview image', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(440, 1, 'en', 'core/base/base', 'image', 'Image', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(441, 1, 'en', 'core/base/base', 'using_button', 'Using button', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(442, 1, 'en', 'core/base/base', 'select_image', 'Select image', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(443, 1, 'en', 'core/base/base', 'to_add_more_image', 'to add more images', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(444, 1, 'en', 'core/base/base', 'add_image', 'Add image', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(445, 1, 'en', 'core/base/cache', 'cache_management', 'Cache management', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(446, 1, 'en', 'core/base/cache', 'cache_commands', 'Clear cache commands', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(447, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.title', 'Clear all CMS cache', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(448, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.description', 'Clear CMS caching: database caching, static blocks... Run this command when you don\'t see the changes after updating data.', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(449, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.success_msg', 'Cache cleaned', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(450, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.title', 'Refresh compiled views', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(451, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.description', 'Clear compiled views to make views up to date.', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(452, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.success_msg', 'Cache view refreshed', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(453, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.title', 'Clear config cache', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(454, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.description', 'You might need to refresh the config caching when you change something on production environment.', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(455, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.success_msg', 'Config cache cleaned', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(456, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.title', 'Clear route cache', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(457, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.description', 'Clear cache routing.', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(458, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.success_msg', 'The route cache has been cleaned', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(459, 1, 'en', 'core/base/cache', 'commands.clear_log.title', 'Clear log', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(460, 1, 'en', 'core/base/cache', 'commands.clear_log.description', 'Clear system log files', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(461, 1, 'en', 'core/base/cache', 'commands.clear_log.success_msg', 'The system log has been cleaned', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(462, 1, 'en', 'core/base/enums', 'statuses.draft', 'Draft', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(463, 1, 'en', 'core/base/enums', 'statuses.pending', 'Pending', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(464, 1, 'en', 'core/base/enums', 'statuses.published', 'Published', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(465, 1, 'en', 'core/base/errors', '401_title', 'Permission Denied', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(466, 1, 'en', 'core/base/errors', '401_msg', '<li>You have not been granted access to the section by the administrator.</li>\n	                <li>You may have the wrong account type.</li>\n	                <li>You are not authorized to view the requested resource.</li>\n	                <li>Your subscription may have expired.</li>', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(467, 1, 'en', 'core/base/errors', '404_title', 'Page could not be found', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(468, 1, 'en', 'core/base/errors', '404_msg', '<li>The page you requested does not exist.</li>\n	                <li>The link you clicked is no longer.</li>\n	                <li>The page may have moved to a new location.</li>\n	                <li>An error may have occurred.</li>\n	                <li>You are not authorized to view the requested resource.</li>', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(469, 1, 'en', 'core/base/errors', '500_title', 'Page could not be loaded', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(470, 1, 'en', 'core/base/errors', '500_msg', '<li>The page you requested does not exist.</li>\n	                <li>The link you clicked is no longer.</li>\n	                <li>The page may have moved to a new location.</li>\n	                <li>An error may have occurred.</li>\n	                <li>You are not authorized to view the requested resource.</li>', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(471, 1, 'en', 'core/base/errors', 'reasons', 'This may have occurred because of several reasons', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(472, 1, 'en', 'core/base/errors', 'try_again', 'Please try again in a few minutes, or alternatively return to the homepage by <a href=\"http://hasa.local/admin\">clicking here</a>.', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(473, 1, 'en', 'core/base/forms', 'choose_image', 'Choose image', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(474, 1, 'en', 'core/base/forms', 'actions', 'Actions', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(475, 1, 'en', 'core/base/forms', 'save', 'Save', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(476, 1, 'en', 'core/base/forms', 'save_and_continue', 'Save & Edit', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(477, 1, 'en', 'core/base/forms', 'image', 'Image', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(478, 1, 'en', 'core/base/forms', 'image_placeholder', 'Insert path of image or click upload button', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(479, 1, 'en', 'core/base/forms', 'create', 'Create', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(480, 1, 'en', 'core/base/forms', 'edit', 'Edit', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(481, 1, 'en', 'core/base/forms', 'permalink', 'Permalink', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(482, 1, 'en', 'core/base/forms', 'ok', 'OK', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(483, 1, 'en', 'core/base/forms', 'cancel', 'Cancel', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(484, 1, 'en', 'core/base/forms', 'character_remain', 'character(s) remain', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(485, 1, 'en', 'core/base/forms', 'template', 'Template', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(486, 1, 'en', 'core/base/forms', 'choose_file', 'Choose file', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(487, 1, 'en', 'core/base/forms', 'file', 'File', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(488, 1, 'en', 'core/base/forms', 'content', 'Content', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(489, 1, 'en', 'core/base/forms', 'description', 'Description', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(490, 1, 'en', 'core/base/forms', 'name', 'Name', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(491, 1, 'en', 'core/base/forms', 'slug', 'Slug', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(492, 1, 'en', 'core/base/forms', 'title', 'Title', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(493, 1, 'en', 'core/base/forms', 'value', 'Value', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(494, 1, 'en', 'core/base/forms', 'name_placeholder', 'Name', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(495, 1, 'en', 'core/base/forms', 'alias_placeholder', 'Alias', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(496, 1, 'en', 'core/base/forms', 'description_placeholder', 'Short description', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(497, 1, 'en', 'core/base/forms', 'parent', 'Parent', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(498, 1, 'en', 'core/base/forms', 'icon', 'Icon', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(499, 1, 'en', 'core/base/forms', 'icon_placeholder', 'Ex: fa fa-home', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(500, 1, 'en', 'core/base/forms', 'order_by', 'Order by', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(501, 1, 'en', 'core/base/forms', 'order_by_placeholder', 'Order by', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(502, 1, 'en', 'core/base/forms', 'is_featured', 'Is featured?', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(503, 1, 'en', 'core/base/forms', 'is_default', 'Is default?', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(504, 1, 'en', 'core/base/forms', 'update', 'Update', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(505, 1, 'en', 'core/base/forms', 'publish', 'Publish', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(506, 1, 'en', 'core/base/forms', 'remove_image', 'Remove image', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(507, 1, 'en', 'core/base/forms', 'remove_file', 'Remove file', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(508, 1, 'en', 'core/base/forms', 'order', 'Order', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(509, 1, 'en', 'core/base/forms', 'alias', 'Alias', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(510, 1, 'en', 'core/base/forms', 'basic_information', 'Basic information', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(511, 1, 'en', 'core/base/forms', 'short_code', 'Shortcode', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(512, 1, 'en', 'core/base/forms', 'add_short_code', 'Add a shortcode', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(513, 1, 'en', 'core/base/forms', 'add', 'Add', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(514, 1, 'en', 'core/base/forms', 'link', 'Link', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(515, 1, 'en', 'core/base/forms', 'show_hide_editor', 'Show/Hide Editor', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(516, 1, 'en', 'core/base/forms', 'basic_info_title', 'Basic information', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(517, 1, 'en', 'core/base/layouts', 'platform_admin', 'Platform Administration', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(518, 1, 'en', 'core/base/layouts', 'dashboard', 'Dashboard', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(519, 1, 'en', 'core/base/layouts', 'widgets', 'Widgets', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(520, 1, 'en', 'core/base/layouts', 'plugins', 'Plugins', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(521, 1, 'en', 'core/base/layouts', 'settings', 'Settings', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(522, 1, 'en', 'core/base/layouts', 'setting_general', 'General', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(523, 1, 'en', 'core/base/layouts', 'setting_email', 'Email', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(524, 1, 'en', 'core/base/layouts', 'system_information', 'System information', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(525, 1, 'en', 'core/base/layouts', 'theme', 'Theme', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(526, 1, 'en', 'core/base/layouts', 'copyright', 'Copyright :year &copy; :company. Version: <span>:version</span>', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(527, 1, 'en', 'core/base/layouts', 'profile', 'Profile', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(528, 1, 'en', 'core/base/layouts', 'logout', 'Logout', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(529, 1, 'en', 'core/base/layouts', 'no_search_result', 'No results found, please try with different keywords.', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(530, 1, 'en', 'core/base/layouts', 'home', 'Home', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(531, 1, 'en', 'core/base/layouts', 'search', 'Search', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(532, 1, 'en', 'core/base/layouts', 'add_new', 'Add new', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(533, 1, 'en', 'core/base/layouts', 'n_a', 'N/A', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(534, 1, 'en', 'core/base/layouts', 'page_loaded_time', 'Page loaded in', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(535, 1, 'en', 'core/base/layouts', 'view_website', 'View website', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(536, 1, 'en', 'core/base/mail', 'send-fail', 'Send email failed', '2020-11-15 20:58:15', '2020-11-15 20:58:15');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(537, 1, 'en', 'core/base/notices', 'create_success_message', 'Created successfully', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(538, 1, 'en', 'core/base/notices', 'update_success_message', 'Updated successfully', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(539, 1, 'en', 'core/base/notices', 'delete_success_message', 'Deleted successfully', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(540, 1, 'en', 'core/base/notices', 'success_header', 'Success!', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(541, 1, 'en', 'core/base/notices', 'error_header', 'Error!', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(542, 1, 'en', 'core/base/notices', 'no_select', 'Please select at least one record to perform this action!', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(543, 1, 'en', 'core/base/notices', 'processing_request', 'We are processing your request.', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(544, 1, 'en', 'core/base/notices', 'error', 'Error!', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(545, 1, 'en', 'core/base/notices', 'success', 'Success!', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(546, 1, 'en', 'core/base/notices', 'info', 'Info!', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(547, 1, 'en', 'core/base/notices', 'enum.validate_message', 'The :attribute value you have entered is invalid.', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(548, 1, 'en', 'core/base/system', 'no_select', 'Please select at least one record to take this action!', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(549, 1, 'en', 'core/base/system', 'cannot_find_user', 'Unable to find specified user', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(550, 1, 'en', 'core/base/system', 'supper_revoked', 'Super user access revoked', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(551, 1, 'en', 'core/base/system', 'cannot_revoke_yourself', 'Can not revoke supper user access permission yourself!', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(552, 1, 'en', 'core/base/system', 'cant_remove_supper', 'You don\'t has permission to remove this super user', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(553, 1, 'en', 'core/base/system', 'cant_find_user_with_email', 'Unable to find user with specified email address', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(554, 1, 'en', 'core/base/system', 'supper_granted', 'Super user access granted', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(555, 1, 'en', 'core/base/system', 'delete_log_success', 'Delete log file successfully!', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(556, 1, 'en', 'core/base/system', 'get_member_success', 'Member list retrieved successfully', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(557, 1, 'en', 'core/base/system', 'error_occur', 'The following errors occurred', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(558, 1, 'en', 'core/base/system', 'user_management', 'User Management', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(559, 1, 'en', 'core/base/system', 'user_management_description', 'Manage users.', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(560, 1, 'en', 'core/base/system', 'role_and_permission', 'Roles and Permissions', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(561, 1, 'en', 'core/base/system', 'role_and_permission_description', 'Manage the available roles.', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(562, 1, 'en', 'core/base/system', 'user.list_super', 'List Super Users', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(563, 1, 'en', 'core/base/system', 'user.email', 'Email', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(564, 1, 'en', 'core/base/system', 'user.last_login', 'Last Login', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(565, 1, 'en', 'core/base/system', 'user.username', 'Username', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(566, 1, 'en', 'core/base/system', 'user.add_user', 'Add Super User', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(567, 1, 'en', 'core/base/system', 'user.cancel', 'Cancel', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(568, 1, 'en', 'core/base/system', 'user.create', 'Create', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(569, 1, 'en', 'core/base/system', 'options.features', 'Feature Access Control', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(570, 1, 'en', 'core/base/system', 'options.feature_description', 'Manage the available.', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(571, 1, 'en', 'core/base/system', 'options.manage_super', 'Super User Management', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(572, 1, 'en', 'core/base/system', 'options.manage_super_description', 'Add/remove super users.', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(573, 1, 'en', 'core/base/system', 'options.info', 'System information', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(574, 1, 'en', 'core/base/system', 'options.info_description', 'All information about current system configuration.', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(575, 1, 'en', 'core/base/system', 'info.title', 'System information', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(576, 1, 'en', 'core/base/system', 'info.cache', 'Cache', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(577, 1, 'en', 'core/base/system', 'info.locale', 'Active locale', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(578, 1, 'en', 'core/base/system', 'info.environment', 'Environment', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(579, 1, 'en', 'core/base/system', 'disabled_in_demo_mode', 'You cannot do it in demo mode!', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(580, 1, 'en', 'core/base/system', 'report_description', 'Please share this information for troubleshooting', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(581, 1, 'en', 'core/base/system', 'get_system_report', 'Get System Report', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(582, 1, 'en', 'core/base/system', 'system_environment', 'System Environment', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(583, 1, 'en', 'core/base/system', 'framework_version', 'Framework Version', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(584, 1, 'en', 'core/base/system', 'timezone', 'Timezone', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(585, 1, 'en', 'core/base/system', 'debug_mode', 'Debug Mode', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(586, 1, 'en', 'core/base/system', 'storage_dir_writable', 'Storage Dir Writable', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(587, 1, 'en', 'core/base/system', 'cache_dir_writable', 'Cache Dir Writable', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(588, 1, 'en', 'core/base/system', 'app_size', 'App Size', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(589, 1, 'en', 'core/base/system', 'server_environment', 'Server Environment', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(590, 1, 'en', 'core/base/system', 'php_version', 'PHP Version', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(591, 1, 'en', 'core/base/system', 'server_software', 'Server Software', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(592, 1, 'en', 'core/base/system', 'server_os', 'Server OS', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(593, 1, 'en', 'core/base/system', 'database', 'Database', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(594, 1, 'en', 'core/base/system', 'ssl_installed', 'SSL Installed', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(595, 1, 'en', 'core/base/system', 'cache_driver', 'Cache Driver', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(596, 1, 'en', 'core/base/system', 'session_driver', 'Session Driver', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(597, 1, 'en', 'core/base/system', 'queue_connection', 'Queue Connection', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(598, 1, 'en', 'core/base/system', 'mbstring_ext', 'Mbstring Ext', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(599, 1, 'en', 'core/base/system', 'openssl_ext', 'OpenSSL Ext', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(600, 1, 'en', 'core/base/system', 'pdo_ext', 'PDO Ext', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(601, 1, 'en', 'core/base/system', 'curl_ext', 'CURL Ext', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(602, 1, 'en', 'core/base/system', 'exif_ext', 'Exif Ext', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(603, 1, 'en', 'core/base/system', 'file_info_ext', 'File info Ext', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(604, 1, 'en', 'core/base/system', 'tokenizer_ext', 'Tokenizer Ext', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(605, 1, 'en', 'core/base/system', 'extra_stats', 'Extra Stats', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(606, 1, 'en', 'core/base/system', 'installed_packages', 'Installed Packages and their version numbers', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(607, 1, 'en', 'core/base/system', 'extra_information', 'Extra Information', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(608, 1, 'en', 'core/base/system', 'copy_report', 'Copy Report', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(609, 1, 'en', 'core/base/system', 'package_name', 'Package Name', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(610, 1, 'en', 'core/base/system', 'dependency_name', 'Dependency Name', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(611, 1, 'en', 'core/base/system', 'version', 'Version', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(612, 1, 'en', 'core/base/system', 'cms_version', 'CMS Version', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(613, 1, 'en', 'core/base/tables', 'id', 'ID', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(614, 1, 'en', 'core/base/tables', 'name', 'Name', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(615, 1, 'en', 'core/base/tables', 'slug', 'Slug', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(616, 1, 'en', 'core/base/tables', 'title', 'Title', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(617, 1, 'en', 'core/base/tables', 'order_by', 'Order By', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(618, 1, 'en', 'core/base/tables', 'order', 'Order', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(619, 1, 'en', 'core/base/tables', 'status', 'Status', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(620, 1, 'en', 'core/base/tables', 'created_at', 'Created At', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(621, 1, 'en', 'core/base/tables', 'updated_at', 'Updated At', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(622, 1, 'en', 'core/base/tables', 'description', 'Description', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(623, 1, 'en', 'core/base/tables', 'operations', 'Operations', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(624, 1, 'en', 'core/base/tables', 'url', 'URL', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(625, 1, 'en', 'core/base/tables', 'author', 'Author', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(626, 1, 'en', 'core/base/tables', 'notes', 'Notes', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(627, 1, 'en', 'core/base/tables', 'column', 'Column', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(628, 1, 'en', 'core/base/tables', 'origin', 'Origin', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(629, 1, 'en', 'core/base/tables', 'after_change', 'After changes', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(630, 1, 'en', 'core/base/tables', 'views', 'Views', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(631, 1, 'en', 'core/base/tables', 'browser', 'Browser', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(632, 1, 'en', 'core/base/tables', 'session', 'Session', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(633, 1, 'en', 'core/base/tables', 'activated', 'activated', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(634, 1, 'en', 'core/base/tables', 'deactivated', 'deactivated', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(635, 1, 'en', 'core/base/tables', 'is_featured', 'Is featured', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(636, 1, 'en', 'core/base/tables', 'edit', 'Edit', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(637, 1, 'en', 'core/base/tables', 'delete', 'Delete', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(638, 1, 'en', 'core/base/tables', 'restore', 'Restore', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(639, 1, 'en', 'core/base/tables', 'activate', 'Activate', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(640, 1, 'en', 'core/base/tables', 'deactivate', 'Deactivate', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(641, 1, 'en', 'core/base/tables', 'excel', 'Excel', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(642, 1, 'en', 'core/base/tables', 'export', 'Export', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(643, 1, 'en', 'core/base/tables', 'csv', 'CSV', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(644, 1, 'en', 'core/base/tables', 'pdf', 'PDF', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(645, 1, 'en', 'core/base/tables', 'print', 'Print', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(646, 1, 'en', 'core/base/tables', 'reset', 'Reset', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(647, 1, 'en', 'core/base/tables', 'reload', 'Reload', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(648, 1, 'en', 'core/base/tables', 'display', 'Display', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(649, 1, 'en', 'core/base/tables', 'all', 'All', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(650, 1, 'en', 'core/base/tables', 'add_new', 'Add New', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(651, 1, 'en', 'core/base/tables', 'action', 'Actions', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(652, 1, 'en', 'core/base/tables', 'delete_entry', 'Delete', '2020-11-15 20:58:15', '2020-11-15 20:58:15'),
(653, 1, 'en', 'core/base/tables', 'view', 'View Detail', '2020-11-15 20:58:16', '2020-11-15 20:58:16'),
(654, 1, 'en', 'core/base/tables', 'save', 'Save', '2020-11-15 20:58:16', '2020-11-15 20:58:16'),
(655, 1, 'en', 'core/base/tables', 'show_from', 'Show from', '2020-11-15 20:58:16', '2020-11-15 20:58:16'),
(656, 1, 'en', 'core/base/tables', 'to', 'to', '2020-11-15 20:58:16', '2020-11-15 20:58:16'),
(657, 1, 'en', 'core/base/tables', 'in', 'in', '2020-11-15 20:58:16', '2020-11-15 20:58:16'),
(658, 1, 'en', 'core/base/tables', 'records', 'records', '2020-11-15 20:58:16', '2020-11-15 20:58:16'),
(659, 1, 'en', 'core/base/tables', 'no_data', 'No data to display', '2020-11-15 20:58:16', '2020-11-15 20:58:16'),
(660, 1, 'en', 'core/base/tables', 'no_record', 'No record', '2020-11-15 20:58:16', '2020-11-15 20:58:16'),
(661, 1, 'en', 'core/base/tables', 'confirm_delete', 'Confirm delete', '2020-11-15 20:58:16', '2020-11-15 20:58:16'),
(662, 1, 'en', 'core/base/tables', 'confirm_delete_msg', 'Do you really want to delete this record?', '2020-11-15 20:58:16', '2020-11-15 20:58:16'),
(663, 1, 'en', 'core/base/tables', 'confirm_delete_many_msg', 'Do you really want to delete selected record(s)?', '2020-11-15 20:58:16', '2020-11-15 20:58:16'),
(664, 1, 'en', 'core/base/tables', 'cancel', 'Cancel', '2020-11-15 20:58:16', '2020-11-15 20:58:16'),
(665, 1, 'en', 'core/base/tables', 'template', 'Template', '2020-11-15 20:58:16', '2020-11-15 20:58:16'),
(666, 1, 'en', 'core/base/tables', 'email', 'Email', '2020-11-15 20:58:16', '2020-11-15 20:58:16'),
(667, 1, 'en', 'core/base/tables', 'last_login', 'Last login', '2020-11-15 20:58:16', '2020-11-15 20:58:16'),
(668, 1, 'en', 'core/base/tables', 'shortcode', 'Shortcode', '2020-11-15 20:58:16', '2020-11-15 20:58:16'),
(669, 1, 'en', 'core/base/tables', 'image', 'Image', '2020-11-15 20:58:16', '2020-11-15 20:58:16'),
(670, 1, 'en', 'core/base/tables', 'bulk_changes', 'Bulk changes', '2020-11-15 20:58:16', '2020-11-15 20:58:16'),
(671, 1, 'en', 'core/base/tables', 'submit', 'Submit', '2020-11-15 20:58:16', '2020-11-15 20:58:16'),
(672, 1, 'en', 'core/base/tabs', 'detail', 'Detail', '2020-11-15 20:58:16', '2020-11-15 20:58:16'),
(673, 1, 'en', 'core/base/tabs', 'file', 'Files', '2020-11-15 20:58:16', '2020-11-15 20:58:16'),
(674, 1, 'en', 'core/base/tabs', 'record_note', 'Record Note', '2020-11-15 20:58:16', '2020-11-15 20:58:16'),
(675, 1, 'en', 'core/base/tabs', 'revision', 'Revision History', '2020-11-15 20:58:16', '2020-11-15 20:58:16'),
(910, 1, 'en', 'core/dashboard/dashboard', 'update_position_success', 'Update widget position successfully!', '2020-11-15 20:58:17', '2020-11-15 20:58:17'),
(911, 1, 'en', 'core/dashboard/dashboard', 'hide_success', 'Update widget successfully!', '2020-11-15 20:58:17', '2020-11-15 20:58:17'),
(912, 1, 'en', 'core/dashboard/dashboard', 'confirm_hide', 'Are you sure?', '2020-11-15 20:58:17', '2020-11-15 20:58:17'),
(913, 1, 'en', 'core/dashboard/dashboard', 'hide_message', 'Do you really want to hide this widget? It will be disappear on Dashboard!', '2020-11-15 20:58:17', '2020-11-15 20:58:17'),
(914, 1, 'en', 'core/dashboard/dashboard', 'confirm_hide_btn', 'Yes, hide this widget', '2020-11-15 20:58:17', '2020-11-15 20:58:17'),
(915, 1, 'en', 'core/dashboard/dashboard', 'cancel_hide_btn', 'Cancel', '2020-11-15 20:58:17', '2020-11-15 20:58:17'),
(916, 1, 'en', 'core/dashboard/dashboard', 'collapse_expand', 'Collapse/Expand', '2020-11-15 20:58:17', '2020-11-15 20:58:17'),
(917, 1, 'en', 'core/dashboard/dashboard', 'hide', 'Hide', '2020-11-15 20:58:17', '2020-11-15 20:58:17'),
(918, 1, 'en', 'core/dashboard/dashboard', 'reload', 'Reload', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(919, 1, 'en', 'core/dashboard/dashboard', 'save_setting_success', 'Save widget settings successfully!', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(920, 1, 'en', 'core/dashboard/dashboard', 'widget_not_exists', 'Widget is not exits!', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(921, 1, 'en', 'core/dashboard/dashboard', 'manage_widgets', 'Manage Widgets', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(922, 1, 'en', 'core/dashboard/dashboard', 'fullscreen', 'Full screen', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(923, 1, 'en', 'core/dashboard/dashboard', 'title', 'Dashboard', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(938, 1, 'en', 'core/media/media', 'filter', 'Filter', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(939, 1, 'en', 'core/media/media', 'everything', 'Everything', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(940, 1, 'en', 'core/media/media', 'image', 'Image', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(941, 1, 'en', 'core/media/media', 'video', 'Video', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(942, 1, 'en', 'core/media/media', 'document', 'Document', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(943, 1, 'en', 'core/media/media', 'view_in', 'View in', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(944, 1, 'en', 'core/media/media', 'all_media', 'All media', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(945, 1, 'en', 'core/media/media', 'trash', 'Trash', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(946, 1, 'en', 'core/media/media', 'recent', 'Recent', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(947, 1, 'en', 'core/media/media', 'favorites', 'Favorites', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(948, 1, 'en', 'core/media/media', 'upload', 'Upload', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(949, 1, 'en', 'core/media/media', 'create_folder', 'Create folder', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(950, 1, 'en', 'core/media/media', 'refresh', 'Refresh', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(951, 1, 'en', 'core/media/media', 'empty_trash', 'Empty trash', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(952, 1, 'en', 'core/media/media', 'search_file_and_folder', 'Search file and folder', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(953, 1, 'en', 'core/media/media', 'sort', 'Sort', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(954, 1, 'en', 'core/media/media', 'file_name_asc', 'File name - ASC', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(955, 1, 'en', 'core/media/media', 'file_name_desc', 'File name - DESC', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(956, 1, 'en', 'core/media/media', 'uploaded_date_asc', 'Uploaded date - ASC', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(957, 1, 'en', 'core/media/media', 'uploaded_date_desc', 'Uploaded date - DESC', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(958, 1, 'en', 'core/media/media', 'size_asc', 'Size - ASC', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(959, 1, 'en', 'core/media/media', 'size_desc', 'Size - DESC', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(960, 1, 'en', 'core/media/media', 'actions', 'Actions', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(961, 1, 'en', 'core/media/media', 'nothing_is_selected', 'Nothing is selected', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(962, 1, 'en', 'core/media/media', 'insert', 'Insert', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(963, 1, 'en', 'core/media/media', 'folder_name', 'Folder name', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(964, 1, 'en', 'core/media/media', 'create', 'Create', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(965, 1, 'en', 'core/media/media', 'rename', 'Rename', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(966, 1, 'en', 'core/media/media', 'close', 'Close', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(967, 1, 'en', 'core/media/media', 'save_changes', 'Save changes', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(968, 1, 'en', 'core/media/media', 'move_to_trash', 'Move items to trash', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(969, 1, 'en', 'core/media/media', 'confirm_trash', 'Are you sure you want to move these items to trash?', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(970, 1, 'en', 'core/media/media', 'confirm', 'Confirm', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(971, 1, 'en', 'core/media/media', 'confirm_delete', 'Delete item(s)', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(972, 1, 'en', 'core/media/media', 'confirm_delete_description', 'Your request cannot rollback. Are you sure you wanna delete these items?', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(973, 1, 'en', 'core/media/media', 'empty_trash_title', 'Empty trash', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(974, 1, 'en', 'core/media/media', 'empty_trash_description', 'Your request cannot rollback. Are you sure you wanna remove all items in trash?', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(975, 1, 'en', 'core/media/media', 'up_level', 'Up one level', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(976, 1, 'en', 'core/media/media', 'upload_progress', 'Upload progress', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(977, 1, 'en', 'core/media/media', 'folder_created', 'Folder is created successfully!', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(978, 1, 'en', 'core/media/media', 'gallery', 'Media gallery', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(979, 1, 'en', 'core/media/media', 'trash_error', 'Error when delete selected item(s)', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(980, 1, 'en', 'core/media/media', 'trash_success', 'Moved selected item(s) to trash successfully!', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(981, 1, 'en', 'core/media/media', 'restore_error', 'Error when restore selected item(s)', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(982, 1, 'en', 'core/media/media', 'restore_success', 'Restore selected item(s) successfully!', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(983, 1, 'en', 'core/media/media', 'copy_success', 'Copied selected item(s) successfully!', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(984, 1, 'en', 'core/media/media', 'delete_success', 'Deleted selected item(s) successfully!', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(985, 1, 'en', 'core/media/media', 'favorite_success', 'Favorite selected item(s) successfully!', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(986, 1, 'en', 'core/media/media', 'remove_favorite_success', 'Remove selected item(s) from favorites successfully!', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(987, 1, 'en', 'core/media/media', 'rename_error', 'Error when rename item(s)', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(988, 1, 'en', 'core/media/media', 'rename_success', 'Rename selected item(s) successfully!', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(989, 1, 'en', 'core/media/media', 'empty_trash_success', 'Empty trash successfully!', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(990, 1, 'en', 'core/media/media', 'invalid_action', 'Invalid action!', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(991, 1, 'en', 'core/media/media', 'file_not_exists', 'File is not exists!', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(992, 1, 'en', 'core/media/media', 'download_file_error', 'Error when downloading files!', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(993, 1, 'en', 'core/media/media', 'missing_zip_archive_extension', 'Please enable ZipArchive extension to download file!', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(994, 1, 'en', 'core/media/media', 'can_not_download_file', 'Can not download this file!', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(995, 1, 'en', 'core/media/media', 'invalid_request', 'Invalid request!', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(996, 1, 'en', 'core/media/media', 'add_success', 'Add item successfully!', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(997, 1, 'en', 'core/media/media', 'file_too_big', 'File too big. Max file upload is :size bytes', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(998, 1, 'en', 'core/media/media', 'can_not_detect_file_type', 'File type is not allowed or can not detect file type!', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(999, 1, 'en', 'core/media/media', 'upload_failed', 'The file is NOT uploaded completely. The server allows max upload file size is :size . Please check your file size OR try to upload again in case of having network errors', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1000, 1, 'en', 'core/media/media', 'menu_name', 'Media', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1001, 1, 'en', 'core/media/media', 'add', 'Add media', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1002, 1, 'en', 'core/media/media', 'javascript.name', 'Name', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1003, 1, 'en', 'core/media/media', 'javascript.url', 'Url', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1004, 1, 'en', 'core/media/media', 'javascript.full_url', 'Full url', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1005, 1, 'en', 'core/media/media', 'javascript.size', 'Size', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1006, 1, 'en', 'core/media/media', 'javascript.mime_type', 'Type', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1007, 1, 'en', 'core/media/media', 'javascript.created_at', 'Uploaded at', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1008, 1, 'en', 'core/media/media', 'javascript.updated_at', 'Modified at', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1009, 1, 'en', 'core/media/media', 'javascript.nothing_selected', 'Nothing is selected', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1010, 1, 'en', 'core/media/media', 'javascript.visit_link', 'Open link', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1011, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.icon', 'fas fa-cloud-upload-alt', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1012, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.title', 'Drop files and folders here', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1013, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.message', 'Or use the upload button above', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1014, 1, 'en', 'core/media/media', 'javascript.no_item.trash.icon', 'fas fa-trash-alt', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1015, 1, 'en', 'core/media/media', 'javascript.no_item.trash.title', 'There is nothing in your trash currently', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1016, 1, 'en', 'core/media/media', 'javascript.no_item.trash.message', 'Delete files to move them to trash automatically. Delete files from trash to remove them permanently', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1017, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.icon', 'fas fa-star', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1018, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.title', 'You have not added anything to your favorites yet', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1019, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.message', 'Add files to favorites to easily find them later', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1020, 1, 'en', 'core/media/media', 'javascript.no_item.recent.icon', 'far fa-clock', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1021, 1, 'en', 'core/media/media', 'javascript.no_item.recent.title', 'You did not opened anything yet', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1022, 1, 'en', 'core/media/media', 'javascript.no_item.recent.message', 'All recent files that you opened will be appeared here', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1023, 1, 'en', 'core/media/media', 'javascript.no_item.default.icon', 'fas fa-sync', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1024, 1, 'en', 'core/media/media', 'javascript.no_item.default.title', 'No items', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1025, 1, 'en', 'core/media/media', 'javascript.no_item.default.message', 'This directory has no item', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1026, 1, 'en', 'core/media/media', 'javascript.clipboard.success', 'These file links has been copied to clipboard', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1027, 1, 'en', 'core/media/media', 'javascript.message.error_header', 'Error', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1028, 1, 'en', 'core/media/media', 'javascript.message.success_header', 'Success', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1029, 1, 'en', 'core/media/media', 'javascript.download.error', 'No files selected or cannot download these files', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1030, 1, 'en', 'core/media/media', 'javascript.actions_list.basic.preview', 'Preview', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1031, 1, 'en', 'core/media/media', 'javascript.actions_list.file.copy_link', 'Copy link', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1032, 1, 'en', 'core/media/media', 'javascript.actions_list.file.rename', 'Rename', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1033, 1, 'en', 'core/media/media', 'javascript.actions_list.file.make_copy', 'Make a copy', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1034, 1, 'en', 'core/media/media', 'javascript.actions_list.user.favorite', 'Add to favorite', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1035, 1, 'en', 'core/media/media', 'javascript.actions_list.user.remove_favorite', 'Remove favorite', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1036, 1, 'en', 'core/media/media', 'javascript.actions_list.other.download', 'Download', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1037, 1, 'en', 'core/media/media', 'javascript.actions_list.other.trash', 'Move to trash', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1038, 1, 'en', 'core/media/media', 'javascript.actions_list.other.delete', 'Delete permanently', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1039, 1, 'en', 'core/media/media', 'javascript.actions_list.other.restore', 'Restore', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1040, 1, 'en', 'core/media/media', 'name_invalid', 'The folder name has invalid character(s).', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1041, 1, 'en', 'core/media/media', 'url_invalid', 'Please provide a valid URL', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1042, 1, 'en', 'core/media/media', 'path_invalid', 'Please provide a valid path', '2020-11-15 20:58:18', '2020-11-15 20:58:18'),
(1162, 1, 'en', 'core/setting/setting', 'title', 'Settings', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1163, 1, 'en', 'core/setting/setting', 'email_setting_title', 'Email settings', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1164, 1, 'en', 'core/setting/setting', 'general.theme', 'Theme', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1165, 1, 'en', 'core/setting/setting', 'general.description', 'Setting site information', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1166, 1, 'en', 'core/setting/setting', 'general.title', 'General', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1167, 1, 'en', 'core/setting/setting', 'general.general_block', 'General Information', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1168, 1, 'en', 'core/setting/setting', 'general.rich_editor', 'Rich Editor', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1169, 1, 'en', 'core/setting/setting', 'general.site_title', 'Site title', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1170, 1, 'en', 'core/setting/setting', 'general.admin_email', 'Admin Email', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1171, 1, 'en', 'core/setting/setting', 'general.seo_block', 'SEO Configuration', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1172, 1, 'en', 'core/setting/setting', 'general.seo_title', 'SEO Title', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1173, 1, 'en', 'core/setting/setting', 'general.seo_description', 'SEO Description', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1174, 1, 'en', 'core/setting/setting', 'general.webmaster_tools_block', 'Google Webmaster Tools', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1175, 1, 'en', 'core/setting/setting', 'general.google_site_verification', 'Google site verification', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1176, 1, 'en', 'core/setting/setting', 'general.placeholder.site_title', 'Site Title (maximum 120 characters)', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1177, 1, 'en', 'core/setting/setting', 'general.placeholder.admin_email', 'Admin Email', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1178, 1, 'en', 'core/setting/setting', 'general.placeholder.seo_title', 'SEO Title (maximum 120 characters)', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1179, 1, 'en', 'core/setting/setting', 'general.placeholder.seo_description', 'SEO Description (maximum 120 characters)', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1180, 1, 'en', 'core/setting/setting', 'general.placeholder.google_analytics', 'Google Analytics', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1181, 1, 'en', 'core/setting/setting', 'general.placeholder.google_site_verification', 'Google Site Verification', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1182, 1, 'en', 'core/setting/setting', 'general.cache_admin_menu', 'Cache admin menu?', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1183, 1, 'en', 'core/setting/setting', 'general.enable_send_error_reporting_via_email', 'Enable to send error reporting via email?', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1184, 1, 'en', 'core/setting/setting', 'general.optimize_page_speed', 'Optimize page speed (minify HTML output, inline CSS, remove comments ..)', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1185, 1, 'en', 'core/setting/setting', 'general.time_zone', 'Timezone', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1186, 1, 'en', 'core/setting/setting', 'general.default_admin_theme', 'Default admin theme', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1187, 1, 'en', 'core/setting/setting', 'general.enable_change_admin_theme', 'Enable change admin theme?', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1188, 1, 'en', 'core/setting/setting', 'general.enable_multi_language_in_admin', 'Enable multi language in admin area?', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1189, 1, 'en', 'core/setting/setting', 'general.enable', 'Enable', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1190, 1, 'en', 'core/setting/setting', 'general.disable', 'Disable', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1191, 1, 'en', 'core/setting/setting', 'general.enable_cache', 'Enable cache?', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1192, 1, 'en', 'core/setting/setting', 'general.cache_time', 'Cache time (minutes)', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1193, 1, 'en', 'core/setting/setting', 'general.cache_time_site_map', 'Cache Time Site map', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1194, 1, 'en', 'core/setting/setting', 'general.admin_logo', 'Admin logo', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1195, 1, 'en', 'core/setting/setting', 'general.admin_favicon', 'Admin favicon', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1196, 1, 'en', 'core/setting/setting', 'general.admin_title', 'Admin title', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1197, 1, 'en', 'core/setting/setting', 'general.admin_title_placeholder', 'Title show to tab of browser', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1198, 1, 'en', 'core/setting/setting', 'general.cache_block', 'Cache', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1199, 1, 'en', 'core/setting/setting', 'general.admin_appearance_title', 'Admin appearance', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1200, 1, 'en', 'core/setting/setting', 'general.admin_appearance_description', 'Setting admin appearance such as editor, language...', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1201, 1, 'en', 'core/setting/setting', 'general.seo_block_description', 'Setting site title, site meta description, site keyword for optimize SEO', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1202, 1, 'en', 'core/setting/setting', 'general.webmaster_tools_description', 'Google Webmaster Tools (GWT) is free software that helps you manage the technical side of your website', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1203, 1, 'en', 'core/setting/setting', 'general.cache_description', 'Config cache for system for optimize speed', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1204, 1, 'en', 'core/setting/setting', 'general.yes', 'Yes', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1205, 1, 'en', 'core/setting/setting', 'general.no', 'No', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1206, 1, 'en', 'core/setting/setting', 'general.show_on_front', 'Your homepage displays', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1207, 1, 'en', 'core/setting/setting', 'general.select', '— Select —', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1208, 1, 'en', 'core/setting/setting', 'general.show_site_name', 'Show site name after page title, separate with \"-\"?', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1209, 1, 'en', 'core/setting/setting', 'general.locale', 'Site language', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1210, 1, 'en', 'core/setting/setting', 'general.locale_direction', 'Language direction', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1211, 1, 'en', 'core/setting/setting', 'email.subject', 'Subject', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1212, 1, 'en', 'core/setting/setting', 'email.content', 'Content', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1213, 1, 'en', 'core/setting/setting', 'email.title', 'Setting for email template', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1214, 1, 'en', 'core/setting/setting', 'email.description', 'Email template using HTML & system variables.', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1215, 1, 'en', 'core/setting/setting', 'email.reset_to_default', 'Reset to default', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1216, 1, 'en', 'core/setting/setting', 'email.back', 'Back to settings', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1217, 1, 'en', 'core/setting/setting', 'email.reset_success', 'Reset back to default successfully', '2020-11-15 20:58:19', '2020-11-15 20:58:19'),
(1218, 1, 'en', 'core/setting/setting', 'email.confirm_reset', 'Confirm reset email template?', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1219, 1, 'en', 'core/setting/setting', 'email.confirm_message', 'Do you really want to reset this email template to default?', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1220, 1, 'en', 'core/setting/setting', 'email.continue', 'Continue', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1221, 1, 'en', 'core/setting/setting', 'email.sender_name', 'Sender name', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1222, 1, 'en', 'core/setting/setting', 'email.sender_name_placeholder', 'Name', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1223, 1, 'en', 'core/setting/setting', 'email.sender_email', 'Sender email', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1224, 1, 'en', 'core/setting/setting', 'email.mailer', 'Mailer', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1225, 1, 'en', 'core/setting/setting', 'email.port', 'Port', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1226, 1, 'en', 'core/setting/setting', 'email.port_placeholder', 'Ex: 587', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1227, 1, 'en', 'core/setting/setting', 'email.host', 'Host', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1228, 1, 'en', 'core/setting/setting', 'email.host_placeholder', 'Ex: smtp.gmail.com', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1229, 1, 'en', 'core/setting/setting', 'email.username', 'Username', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1230, 1, 'en', 'core/setting/setting', 'email.username_placeholder', 'Username to login to mail server', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1231, 1, 'en', 'core/setting/setting', 'email.password', 'Password', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1232, 1, 'en', 'core/setting/setting', 'email.password_placeholder', 'Password to login to mail server', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1233, 1, 'en', 'core/setting/setting', 'email.encryption', 'Encryption', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1234, 1, 'en', 'core/setting/setting', 'email.mail_gun_domain', 'Domain', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1235, 1, 'en', 'core/setting/setting', 'email.mail_gun_domain_placeholder', 'Domain', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1236, 1, 'en', 'core/setting/setting', 'email.mail_gun_secret', 'Secret', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1237, 1, 'en', 'core/setting/setting', 'email.mail_gun_secret_placeholder', 'Secret', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1238, 1, 'en', 'core/setting/setting', 'email.mail_gun_endpoint', 'Endpoint', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1239, 1, 'en', 'core/setting/setting', 'email.mail_gun_endpoint_placeholder', 'Endpoint', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1240, 1, 'en', 'core/setting/setting', 'email.log_channel', 'Log channel', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1241, 1, 'en', 'core/setting/setting', 'email.sendmail_path', 'Sendmail Path', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1242, 1, 'en', 'core/setting/setting', 'email.encryption_placeholder', 'Encryption: ssl or tls', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1243, 1, 'en', 'core/setting/setting', 'email.ses_key', 'Key', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1244, 1, 'en', 'core/setting/setting', 'email.ses_key_placeholder', 'Key', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1245, 1, 'en', 'core/setting/setting', 'email.ses_secret', 'Secret', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1246, 1, 'en', 'core/setting/setting', 'email.ses_secret_placeholder', 'Secret', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1247, 1, 'en', 'core/setting/setting', 'email.ses_region', 'Region', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1248, 1, 'en', 'core/setting/setting', 'email.ses_region_placeholder', 'Region', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1249, 1, 'en', 'core/setting/setting', 'email.postmark_token', 'Token', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1250, 1, 'en', 'core/setting/setting', 'email.postmark_token_placeholder', 'Token', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1251, 1, 'en', 'core/setting/setting', 'email.template_title', 'Email templates', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1252, 1, 'en', 'core/setting/setting', 'email.template_description', 'Base templates for all emails', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1253, 1, 'en', 'core/setting/setting', 'email.template_header', 'Email template header', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1254, 1, 'en', 'core/setting/setting', 'email.template_header_description', 'Template for header of emails', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1255, 1, 'en', 'core/setting/setting', 'email.template_footer', 'Email template footer', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1256, 1, 'en', 'core/setting/setting', 'email.template_footer_description', 'Template for footer of emails', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1257, 1, 'en', 'core/setting/setting', 'email.default', 'Default', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1258, 1, 'en', 'core/setting/setting', 'media.title', 'Media', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1259, 1, 'en', 'core/setting/setting', 'media.driver', 'Driver', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1260, 1, 'en', 'core/setting/setting', 'media.description', 'Settings for media', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1261, 1, 'en', 'core/setting/setting', 'media.aws_access_key_id', 'AWS Access Key ID', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1262, 1, 'en', 'core/setting/setting', 'media.aws_secret_key', 'AWS Secret Key', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1263, 1, 'en', 'core/setting/setting', 'media.aws_default_region', 'AWS Default Region', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1264, 1, 'en', 'core/setting/setting', 'media.aws_bucket', 'AWS Bucket', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1265, 1, 'en', 'core/setting/setting', 'media.aws_url', 'AWS URL', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1266, 1, 'en', 'core/setting/setting', 'media.do_spaces_access_key_id', 'DO Spaces Access Key ID', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1267, 1, 'en', 'core/setting/setting', 'media.do_spaces_secret_key', 'DO Spaces Secret Key', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1268, 1, 'en', 'core/setting/setting', 'media.do_spaces_default_region', 'DO Spaces Default Region', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1269, 1, 'en', 'core/setting/setting', 'media.do_spaces_bucket', 'DO Spaces Bucket', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1270, 1, 'en', 'core/setting/setting', 'media.do_spaces_endpoint', 'DO Spaces Endpoint', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1271, 1, 'en', 'core/setting/setting', 'media.enable_chunk', 'Enable chunk size upload?', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1272, 1, 'en', 'core/setting/setting', 'media.chunk_size', 'Chunk size (Bytes)', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1273, 1, 'en', 'core/setting/setting', 'media.chunk_size_placeholder', 'Default: 1048576 ~ 1MB', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1274, 1, 'en', 'core/setting/setting', 'media.max_file_size', 'Chunk max file size (MB)', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1275, 1, 'en', 'core/setting/setting', 'media.max_file_size_placeholder', 'Default: 1048576 ~ 1GB', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1276, 1, 'en', 'core/setting/setting', 'media.enable_watermark', 'Enable watermark?', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1277, 1, 'en', 'core/setting/setting', 'media.watermark_source', 'Watermark image', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1278, 1, 'en', 'core/setting/setting', 'media.watermark_size', 'Size of watermark (%)', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1279, 1, 'en', 'core/setting/setting', 'media.watermark_size_placeholder', 'Default: 10 (%)', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1280, 1, 'en', 'core/setting/setting', 'media.watermark_opacity', 'Watermark Opacity (%)', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1281, 1, 'en', 'core/setting/setting', 'media.watermark_opacity_placeholder', 'Default: 70 (%)', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1282, 1, 'en', 'core/setting/setting', 'media.watermark_position', 'Watermark position', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1283, 1, 'en', 'core/setting/setting', 'media.watermark_position_x', 'Watermark position X', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1284, 1, 'en', 'core/setting/setting', 'media.watermark_position_y', 'Watermark position Y', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1285, 1, 'en', 'core/setting/setting', 'media.watermark_position_top_left', 'Top left', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1286, 1, 'en', 'core/setting/setting', 'media.watermark_position_top_right', 'Top right', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1287, 1, 'en', 'core/setting/setting', 'media.watermark_position_bottom_left', 'Bottom left', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1288, 1, 'en', 'core/setting/setting', 'media.watermark_position_bottom_right', 'Bottom right', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1289, 1, 'en', 'core/setting/setting', 'media.watermark_position_center', 'Center', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1290, 1, 'en', 'core/setting/setting', 'license.purchase_code', 'Purchase code', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1291, 1, 'en', 'core/setting/setting', 'license.buyer', 'Buyer', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1292, 1, 'en', 'core/setting/setting', 'field_type_not_exists', 'This field type does not exist', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1293, 1, 'en', 'core/setting/setting', 'save_settings', 'Save settings', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1294, 1, 'en', 'core/setting/setting', 'template', 'Template', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1295, 1, 'en', 'core/setting/setting', 'description', 'Description', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1296, 1, 'en', 'core/setting/setting', 'enable', 'Enable', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1297, 1, 'en', 'core/setting/setting', 'send', 'Send', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1298, 1, 'en', 'core/setting/setting', 'test_email_description', 'To send test email, please make sure you are updated configuration to send mail!', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1299, 1, 'en', 'core/setting/setting', 'test_email_input_placeholder', 'Enter the email which you want to send test email.', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1300, 1, 'en', 'core/setting/setting', 'test_email_modal_title', 'Send a test email', '2020-11-15 20:58:20', '2020-11-15 20:58:20');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1301, 1, 'en', 'core/setting/setting', 'test_send_mail', 'Send test mail', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1302, 1, 'en', 'core/setting/setting', 'test_email_send_success', 'Send email successfully!', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1303, 1, 'en', 'core/setting/setting', 'locale_direction_ltr', 'Left to Right', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1304, 1, 'en', 'core/setting/setting', 'locale_direction_rtl', 'Right to Left', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1379, 1, 'en', 'core/table/general', 'operations', 'Operations', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1380, 1, 'en', 'core/table/general', 'loading_data', 'Loading data from server', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1381, 1, 'en', 'core/table/general', 'display', 'Display', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1382, 1, 'en', 'core/table/general', 'all', 'All', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1383, 1, 'en', 'core/table/general', 'edit_entry', 'Edit', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1384, 1, 'en', 'core/table/general', 'delete_entry', 'Delete', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1385, 1, 'en', 'core/table/general', 'show_from', 'Showing from', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1386, 1, 'en', 'core/table/general', 'to', 'to', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1387, 1, 'en', 'core/table/general', 'in', 'in', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1388, 1, 'en', 'core/table/general', 'records', 'records', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1389, 1, 'en', 'core/table/general', 'no_data', 'No data to display', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1390, 1, 'en', 'core/table/general', 'no_record', 'No record', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1391, 1, 'en', 'core/table/general', 'loading', 'Loading data from server', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1392, 1, 'en', 'core/table/general', 'confirm_delete', 'Confirm delete', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1393, 1, 'en', 'core/table/general', 'confirm_delete_msg', 'Do you really want to delete this record?', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1394, 1, 'en', 'core/table/general', 'cancel', 'Cancel', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1395, 1, 'en', 'core/table/general', 'delete', 'Delete', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1396, 1, 'en', 'core/table/general', 'close', 'Close', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1397, 1, 'en', 'core/table/general', 'contains', 'Contains', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1398, 1, 'en', 'core/table/general', 'is_equal_to', 'Is equal to', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1399, 1, 'en', 'core/table/general', 'greater_than', 'Greater than', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1400, 1, 'en', 'core/table/general', 'less_than', 'Less than', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1401, 1, 'en', 'core/table/general', 'value', 'Value', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1402, 1, 'en', 'core/table/general', 'select_field', 'Select field', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1403, 1, 'en', 'core/table/general', 'reset', 'Reset', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1404, 1, 'en', 'core/table/general', 'add_additional_filter', 'Add additional filter', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1405, 1, 'en', 'core/table/general', 'apply', 'Apply', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1406, 1, 'en', 'core/table/general', 'filters', 'Filters', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1407, 1, 'en', 'core/table/general', 'bulk_change', 'Bulk changes', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1408, 1, 'en', 'core/table/general', 'select_option', 'Select option', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1409, 1, 'en', 'core/table/general', 'bulk_actions', 'Bulk Actions', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1410, 1, 'en', 'core/table/general', 'save_bulk_change_success', 'Update data for selected record(s) successfully!', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1411, 1, 'en', 'core/table/general', 'please_select_record', 'Please select at least one record to perform this action!', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1412, 1, 'en', 'core/table/general', 'filtered', '(filtered from _MAX_ total records)', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1413, 1, 'en', 'core/table/general', 'search', 'Search...', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1414, 1, 'en', 'core/table/table', 'operations', 'Operations', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1415, 1, 'en', 'core/table/table', 'loading_data', 'Loading data from server', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1416, 1, 'en', 'core/table/table', 'display', 'Display', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1417, 1, 'en', 'core/table/table', 'all', 'All', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1418, 1, 'en', 'core/table/table', 'edit_entry', 'Edit', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1419, 1, 'en', 'core/table/table', 'delete_entry', 'Delete', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1420, 1, 'en', 'core/table/table', 'show_from', 'Showing from', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1421, 1, 'en', 'core/table/table', 'to', 'to', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1422, 1, 'en', 'core/table/table', 'in', 'in', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1423, 1, 'en', 'core/table/table', 'records', 'records', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1424, 1, 'en', 'core/table/table', 'no_data', 'No data to display', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1425, 1, 'en', 'core/table/table', 'no_record', 'No record', '2020-11-15 20:58:20', '2020-11-15 20:58:20'),
(1426, 1, 'en', 'core/table/table', 'loading', 'Loading data from server', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1427, 1, 'en', 'core/table/table', 'confirm_delete', 'Confirm delete', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1428, 1, 'en', 'core/table/table', 'confirm_delete_msg', 'Do you really want to delete this record?', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1429, 1, 'en', 'core/table/table', 'cancel', 'Cancel', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1430, 1, 'en', 'core/table/table', 'delete', 'Delete', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1431, 1, 'en', 'core/table/table', 'close', 'Close', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1432, 1, 'en', 'core/table/table', 'contains', 'Contains', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1433, 1, 'en', 'core/table/table', 'is_equal_to', 'Is equal to', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1434, 1, 'en', 'core/table/table', 'greater_than', 'Greater than', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1435, 1, 'en', 'core/table/table', 'less_than', 'Less than', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1436, 1, 'en', 'core/table/table', 'value', 'Value', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1437, 1, 'en', 'core/table/table', 'select_field', 'Select field', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1438, 1, 'en', 'core/table/table', 'reset', 'Reset', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1439, 1, 'en', 'core/table/table', 'add_additional_filter', 'Add additional filter', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1440, 1, 'en', 'core/table/table', 'apply', 'Apply', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1441, 1, 'en', 'core/table/table', 'filters', 'Filters', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1442, 1, 'en', 'core/table/table', 'bulk_change', 'Bulk changes', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1443, 1, 'en', 'core/table/table', 'select_option', 'Select option', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1444, 1, 'en', 'core/table/table', 'bulk_actions', 'Bulk Actions', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1445, 1, 'en', 'core/table/table', 'save_bulk_change_success', 'Update data for selected record(s) successfully!', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1446, 1, 'en', 'core/table/table', 'please_select_record', 'Please select at least one record to perform this action!', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1447, 1, 'en', 'core/table/table', 'filtered', '(filtered from _MAX_ total records)', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1448, 1, 'en', 'core/table/table', 'search', 'Search...', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1481, 1, 'en', 'packages/menu/menu', 'name', 'Menus', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1482, 1, 'en', 'packages/menu/menu', 'key_name', 'Menu name (key: :key)', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1483, 1, 'en', 'packages/menu/menu', 'basic_info', 'Basic information', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1484, 1, 'en', 'packages/menu/menu', 'add_to_menu', 'Add to menu', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1485, 1, 'en', 'packages/menu/menu', 'custom_link', 'Custom link', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1486, 1, 'en', 'packages/menu/menu', 'add_link', 'Add link', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1487, 1, 'en', 'packages/menu/menu', 'structure', 'Menu structure', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1488, 1, 'en', 'packages/menu/menu', 'remove', 'Remove', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1489, 1, 'en', 'packages/menu/menu', 'cancel', 'Cancel', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1490, 1, 'en', 'packages/menu/menu', 'title', 'Title', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1491, 1, 'en', 'packages/menu/menu', 'icon', 'Icon', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1492, 1, 'en', 'packages/menu/menu', 'url', 'URL', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1493, 1, 'en', 'packages/menu/menu', 'target', 'Target', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1494, 1, 'en', 'packages/menu/menu', 'css_class', 'CSS class', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1495, 1, 'en', 'packages/menu/menu', 'self_open_link', 'Open link directly', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1496, 1, 'en', 'packages/menu/menu', 'blank_open_link', 'Open link in new tab', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1497, 1, 'en', 'packages/menu/menu', 'create', 'Create menu', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1498, 1, 'en', 'packages/menu/menu', 'edit', 'Edit menu', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1499, 1, 'en', 'packages/menu/menu', 'menu_settings', 'Menu settings', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1500, 1, 'en', 'packages/menu/menu', 'display_location', 'Display location', '2020-11-15 20:58:21', '2020-11-15 20:58:21'),
(1519, 1, 'en', 'packages/optimize/optimize', 'settings.title', 'Optimize page speed', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1520, 1, 'en', 'packages/optimize/optimize', 'settings.description', 'Minify HTML output, inline CSS, remove comments...', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1521, 1, 'en', 'packages/optimize/optimize', 'settings.enable', 'Enable optimize page speed?', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1522, 1, 'en', 'packages/page/pages', 'create', 'Create new page', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1523, 1, 'en', 'packages/page/pages', 'edit', 'Edit page', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1524, 1, 'en', 'packages/page/pages', 'form.name', 'Name', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1525, 1, 'en', 'packages/page/pages', 'form.name_placeholder', 'Page\'s name (Maximum 120 characters)', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1526, 1, 'en', 'packages/page/pages', 'form.content', 'Content', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1527, 1, 'en', 'packages/page/pages', 'form.note', 'Note content', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1528, 1, 'en', 'packages/page/pages', 'notices.no_select', 'Please select at least one record to take this action!', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1529, 1, 'en', 'packages/page/pages', 'notices.update_success_message', 'Update successfully', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1530, 1, 'en', 'packages/page/pages', 'cannot_delete', 'Page could not be deleted', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1531, 1, 'en', 'packages/page/pages', 'deleted', 'Page deleted', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1532, 1, 'en', 'packages/page/pages', 'pages', 'Pages', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1533, 1, 'en', 'packages/page/pages', 'menu', 'Pages', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1534, 1, 'en', 'packages/page/pages', 'menu_name', 'Pages', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1535, 1, 'en', 'packages/page/pages', 'edit_this_page', 'Edit this page', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1536, 1, 'en', 'packages/page/pages', 'total_pages', 'Total pages', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1537, 1, 'en', 'packages/page/pages', 'settings.show_on_front', 'Your homepage displays', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1538, 1, 'en', 'packages/page/pages', 'settings.select', '— Select —', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1539, 1, 'en', 'packages/page/pages', 'front_page', 'Front Page', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1557, 1, 'en', 'packages/plugin-management/plugin', 'enabled', 'Enabled', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1558, 1, 'en', 'packages/plugin-management/plugin', 'deactivated', 'Deactivated', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1559, 1, 'en', 'packages/plugin-management/plugin', 'activated', 'Activated', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1560, 1, 'en', 'packages/plugin-management/plugin', 'activate', 'Activate', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1561, 1, 'en', 'packages/plugin-management/plugin', 'deactivate', 'Deactivate', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1562, 1, 'en', 'packages/plugin-management/plugin', 'author', 'By', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1563, 1, 'en', 'packages/plugin-management/plugin', 'update_plugin_status_success', 'Update plugin successfully', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1564, 1, 'en', 'packages/plugin-management/plugin', 'plugins', 'Plugins', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1565, 1, 'en', 'packages/plugin-management/plugin', 'missing_required_plugins', 'Please activate plugin(s): :plugins before activate this plugin!', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1566, 1, 'en', 'packages/plugin-management/plugin', 'remove', 'Remove', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1567, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_success', 'Remove plugin successfully!', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1568, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin', 'Remove plugin', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1569, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_confirm_message', 'Do you really want to remove this plugin?', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1570, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_confirm_yes', 'Yes, remove it!', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1571, 1, 'en', 'packages/plugin-management/plugin', 'total_plugins', 'Total plugins', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1572, 1, 'en', 'packages/plugin-management/plugin', 'invalid_plugin', 'This plugin is not a valid plugin, please check it again!', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1573, 1, 'en', 'packages/plugin-management/plugin', 'version', 'Version', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1574, 1, 'en', 'packages/plugin-management/plugin', 'invalid_json', 'Invalid plugin.json!', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1575, 1, 'en', 'packages/plugin-management/plugin', 'activate_success', 'Activate plugin successfully!', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1576, 1, 'en', 'packages/plugin-management/plugin', 'activated_already', 'This plugin is activated already!', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1577, 1, 'en', 'packages/plugin-management/plugin', 'plugin_not_exist', 'This plugin is not exists.', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1578, 1, 'en', 'packages/plugin-management/plugin', 'missing_json_file', 'Missing file plugin.json!', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1579, 1, 'en', 'packages/plugin-management/plugin', 'plugin_invalid', 'Plugin is valid!', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1580, 1, 'en', 'packages/plugin-management/plugin', 'published_assets_success', 'Publish assets for plugin :name successfully!', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1581, 1, 'en', 'packages/plugin-management/plugin', 'plugin_removed', 'Plugin is removed!', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1582, 1, 'en', 'packages/plugin-management/plugin', 'deactivated_success', 'Deactivate plugin successfully!', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1583, 1, 'en', 'packages/plugin-management/plugin', 'deactivated_already', 'This plugin is deactivated already!', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1596, 1, 'en', 'packages/seo-helper/seo-helper', 'meta_box_header', 'Search Engine Optimize', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1597, 1, 'en', 'packages/seo-helper/seo-helper', 'edit_seo_meta', 'Edit SEO meta', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1598, 1, 'en', 'packages/seo-helper/seo-helper', 'default_description', 'Setup meta title & description to make your site easy to discovered on search engines such as Google', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1599, 1, 'en', 'packages/seo-helper/seo-helper', 'seo_title', 'SEO Title', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1600, 1, 'en', 'packages/seo-helper/seo-helper', 'seo_description', 'SEO description', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1606, 1, 'en', 'packages/slug/slug', 'permalink_settings', 'Permalink', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1607, 1, 'en', 'packages/slug/slug', 'settings.title', 'Permalink settings', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1608, 1, 'en', 'packages/slug/slug', 'settings.description', 'Manage permalink for all modules.', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1609, 1, 'en', 'packages/slug/slug', 'settings.preview', 'Preview', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1610, 1, 'en', 'packages/slug/slug', 'preview', 'Preview', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1611, 1, 'en', 'packages/theme/theme', 'name', 'Themes', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1612, 1, 'en', 'packages/theme/theme', 'theme', 'Theme', '2020-11-15 20:58:22', '2020-11-15 20:58:22'),
(1613, 1, 'en', 'packages/theme/theme', 'author', 'Author', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1614, 1, 'en', 'packages/theme/theme', 'version', 'Version', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1615, 1, 'en', 'packages/theme/theme', 'description', 'Description', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1616, 1, 'en', 'packages/theme/theme', 'active_success', 'Activate theme :name successfully!', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1617, 1, 'en', 'packages/theme/theme', 'active', 'Active', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1618, 1, 'en', 'packages/theme/theme', 'activated', 'Activated', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1619, 1, 'en', 'packages/theme/theme', 'appearance', 'Appearance', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1620, 1, 'en', 'packages/theme/theme', 'theme_options', 'Theme options', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1621, 1, 'en', 'packages/theme/theme', 'save_changes', 'Save Changes', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1622, 1, 'en', 'packages/theme/theme', 'developer_mode', 'Developer Mode Enabled', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1623, 1, 'en', 'packages/theme/theme', 'custom_css', 'Custom CSS', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1624, 1, 'en', 'packages/theme/theme', 'remove_theme_success', 'Remove theme successfully!', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1625, 1, 'en', 'packages/theme/theme', 'theme_is_not_existed', 'This theme is not existed!', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1626, 1, 'en', 'packages/theme/theme', 'remove', 'Remove', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1627, 1, 'en', 'packages/theme/theme', 'remove_theme', 'Remove theme', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1628, 1, 'en', 'packages/theme/theme', 'remove_theme_confirm_message', 'Do you really want to remove this theme?', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1629, 1, 'en', 'packages/theme/theme', 'remove_theme_confirm_yes', 'Yes, remove it!', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1630, 1, 'en', 'packages/theme/theme', 'total_themes', 'Total themes', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1631, 1, 'en', 'packages/theme/theme', 'show_admin_bar', 'Show admin bar (When admin logged in, still show admin bar in website)?', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1632, 1, 'en', 'packages/theme/theme', 'settings.title', 'Theme', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1633, 1, 'en', 'packages/theme/theme', 'settings.description', 'Setting for theme', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1634, 1, 'en', 'packages/theme/theme', 'add_new', 'Add new', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1635, 1, 'en', 'packages/theme/theme', 'theme_activated_already', 'Theme \":name\" is activated already!', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1636, 1, 'en', 'packages/theme/theme', 'missing_json_file', 'Missing file theme.json!', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1637, 1, 'en', 'packages/theme/theme', 'theme_invalid', 'Theme is valid!', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1638, 1, 'en', 'packages/theme/theme', 'published_assets_success', 'Publish assets for :themes successfully!', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1639, 1, 'en', 'packages/theme/theme', 'cannot_remove_theme', 'Cannot remove activated theme, please activate another theme before removing \":name\"!', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1640, 1, 'en', 'packages/theme/theme', 'theme_deleted', 'Theme \":name\" has been destroyed.', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1641, 1, 'en', 'packages/theme/theme', 'removed_assets', 'Remove assets of a theme :name successfully!', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1642, 1, 'en', 'packages/theme/theme', 'update_custom_css_success', 'Update custom CSS successfully!', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1643, 1, 'en', 'packages/theme/theme', 'go_to_dashboard', 'Go to dashboard', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1644, 1, 'en', 'packages/theme/theme', 'custom_css_placeholder', 'Using Ctrl + Space to autocomplete.', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1645, 1, 'en', 'packages/theme/theme', 'theme_option_general', 'General', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1646, 1, 'en', 'packages/theme/theme', 'theme_option_general_description', 'General settings', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1647, 1, 'en', 'packages/theme/theme', 'theme_option_seo_open_graph_image', 'SEO default Open Graph image', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1648, 1, 'en', 'packages/theme/theme', 'theme_option_logo', 'Logo', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1649, 1, 'en', 'packages/theme/theme', 'theme_option_favicon', 'Favicon', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1661, 1, 'en', 'packages/widget/global', 'name', 'Widgets', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1662, 1, 'en', 'packages/widget/global', 'create', 'New widget', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1663, 1, 'en', 'packages/widget/global', 'edit', 'Edit widget', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1664, 1, 'en', 'packages/widget/global', 'delete', 'Delete', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1665, 1, 'en', 'packages/widget/global', 'available', 'Available Widgets', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1666, 1, 'en', 'packages/widget/global', 'instruction', 'To activate a widget drag it to a sidebar or click on it. To deactivate a widget and delete its settings, drag it back.', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1667, 1, 'en', 'packages/widget/global', 'number_tag_display', 'Number tags will be display', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1668, 1, 'en', 'packages/widget/global', 'number_post_display', 'Number posts will be display', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1669, 1, 'en', 'packages/widget/global', 'select_menu', 'Select Menu', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1670, 1, 'en', 'packages/widget/global', 'widget_text', 'Text', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1671, 1, 'en', 'packages/widget/global', 'widget_text_description', 'Arbitrary text or HTML.', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1672, 1, 'en', 'packages/widget/global', 'widget_recent_post', 'Recent Posts', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1673, 1, 'en', 'packages/widget/global', 'widget_recent_post_description', 'Recent posts widget.', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1674, 1, 'en', 'packages/widget/global', 'widget_custom_menu', 'Custom Menu', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1675, 1, 'en', 'packages/widget/global', 'widget_custom_menu_description', 'Add a custom menu to your widget area.', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1676, 1, 'en', 'packages/widget/global', 'widget_tag', 'Tags', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1677, 1, 'en', 'packages/widget/global', 'widget_tag_description', 'Popular tags', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1678, 1, 'en', 'packages/widget/global', 'save_success', 'Save widget successfully!', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1679, 1, 'en', 'packages/widget/global', 'delete_success', 'Delete widget successfully!', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1680, 1, 'en', 'packages/widget/widget', 'name', 'Widgets', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1681, 1, 'en', 'packages/widget/widget', 'create', 'New widget', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1682, 1, 'en', 'packages/widget/widget', 'edit', 'Edit widget', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1683, 1, 'en', 'packages/widget/widget', 'delete', 'Delete', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1684, 1, 'en', 'packages/widget/widget', 'available', 'Available Widgets', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1685, 1, 'en', 'packages/widget/widget', 'instruction', 'To activate a widget drag it to a sidebar or click on it. To deactivate a widget and delete its settings, drag it back.', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1686, 1, 'en', 'packages/widget/widget', 'number_tag_display', 'Number tags will be display', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1687, 1, 'en', 'packages/widget/widget', 'number_post_display', 'Number posts will be display', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1688, 1, 'en', 'packages/widget/widget', 'select_menu', 'Select Menu', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1689, 1, 'en', 'packages/widget/widget', 'widget_text', 'Text', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1690, 1, 'en', 'packages/widget/widget', 'widget_text_description', 'Arbitrary text or HTML.', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1691, 1, 'en', 'packages/widget/widget', 'widget_recent_post', 'Recent Posts', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1692, 1, 'en', 'packages/widget/widget', 'widget_recent_post_description', 'Recent posts widget.', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1693, 1, 'en', 'packages/widget/widget', 'widget_custom_menu', 'Custom Menu', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1694, 1, 'en', 'packages/widget/widget', 'widget_custom_menu_description', 'Add a custom menu to your widget area.', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1695, 1, 'en', 'packages/widget/widget', 'widget_tag', 'Tags', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1696, 1, 'en', 'packages/widget/widget', 'widget_tag_description', 'Popular tags', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1697, 1, 'en', 'packages/widget/widget', 'save_success', 'Save widget successfully!', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1698, 1, 'en', 'packages/widget/widget', 'delete_success', 'Delete widget successfully!', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1699, 1, 'en', 'packages/widget/widget', 'primary_sidebar_name', 'Primary sidebar', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1700, 1, 'en', 'packages/widget/widget', 'primary_sidebar_description', 'Primary sidebar section', '2020-11-15 20:58:23', '2020-11-15 20:58:23'),
(1720, 1, 'en', 'plugins/analytics/analytics', 'sessions', 'Sessions', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1721, 1, 'en', 'plugins/analytics/analytics', 'visitors', 'Visitors', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1722, 1, 'en', 'plugins/analytics/analytics', 'pageviews', 'Pageviews', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1723, 1, 'en', 'plugins/analytics/analytics', 'bounce_rate', 'Bounce Rate', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1724, 1, 'en', 'plugins/analytics/analytics', 'page_session', 'Pages/Session', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1725, 1, 'en', 'plugins/analytics/analytics', 'avg_duration', 'Avg. Duration', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1726, 1, 'en', 'plugins/analytics/analytics', 'percent_new_session', 'Percent new session', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1727, 1, 'en', 'plugins/analytics/analytics', 'new_users', 'New visitors', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1728, 1, 'en', 'plugins/analytics/analytics', 'visits', 'visits', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1729, 1, 'en', 'plugins/analytics/analytics', 'views', 'views', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1730, 1, 'en', 'plugins/analytics/analytics', 'view_id_not_specified', 'You must provide a valid view id. The document here: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1731, 1, 'en', 'plugins/analytics/analytics', 'credential_is_not_valid', 'Analytics credentials is not valid. The document here: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1732, 1, 'en', 'plugins/analytics/analytics', 'start_date_can_not_before_end_date', 'Start date :start_date cannot be after end date :end_date', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1733, 1, 'en', 'plugins/analytics/analytics', 'wrong_configuration', 'To view analytics you\'ll need to get a google analytics client id and add it to your settings. <br /> You also need JSON credential data. <br /> The document here: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1734, 1, 'en', 'plugins/analytics/analytics', 'settings.title', 'Google Analytics', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1735, 1, 'en', 'plugins/analytics/analytics', 'settings.description', 'Config Credentials for Google Analytics', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1736, 1, 'en', 'plugins/analytics/analytics', 'settings.tracking_code', 'Tracking ID', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1737, 1, 'en', 'plugins/analytics/analytics', 'settings.tracking_code_placeholder', 'Example: GA-12586526-8', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1738, 1, 'en', 'plugins/analytics/analytics', 'settings.view_id', 'View ID', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1739, 1, 'en', 'plugins/analytics/analytics', 'settings.view_id_description', 'Google Analytics View ID', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1740, 1, 'en', 'plugins/analytics/analytics', 'settings.json_credential', 'Service Account Credentials', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1741, 1, 'en', 'plugins/analytics/analytics', 'settings.json_credential_description', 'Service Account Credentials', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1742, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_page', 'Top Most Visit Pages', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1743, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_browser', 'Top Browsers', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1744, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_referrer', 'Top Referrers', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1745, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_general', 'Site Analytics', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1772, 1, 'en', 'plugins/audit-log/history', 'name', 'Activities Logs', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1773, 1, 'en', 'plugins/audit-log/history', 'created', 'created', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1774, 1, 'en', 'plugins/audit-log/history', 'updated', 'updated', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1775, 1, 'en', 'plugins/audit-log/history', 'deleted', 'deleted', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1776, 1, 'en', 'plugins/audit-log/history', 'logged in', 'logged in', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1777, 1, 'en', 'plugins/audit-log/history', 'logged out', 'logged out', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1778, 1, 'en', 'plugins/audit-log/history', 'changed password', 'changed password', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1779, 1, 'en', 'plugins/audit-log/history', 'updated profile', 'updated profile', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1780, 1, 'en', 'plugins/audit-log/history', 'attached', 'attached', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1781, 1, 'en', 'plugins/audit-log/history', 'shared', 'shared', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1782, 1, 'en', 'plugins/audit-log/history', 'to the system', 'to the system', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1783, 1, 'en', 'plugins/audit-log/history', 'of the system', 'of the system', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1784, 1, 'en', 'plugins/audit-log/history', 'menu', 'menu', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1785, 1, 'en', 'plugins/audit-log/history', 'post', 'post', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1786, 1, 'en', 'plugins/audit-log/history', 'page', 'page', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1787, 1, 'en', 'plugins/audit-log/history', 'category', 'category', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1788, 1, 'en', 'plugins/audit-log/history', 'tag', 'tag', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1789, 1, 'en', 'plugins/audit-log/history', 'user', 'user', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1790, 1, 'en', 'plugins/audit-log/history', 'contact', 'contact', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1791, 1, 'en', 'plugins/audit-log/history', 'backup', 'backup', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1792, 1, 'en', 'plugins/audit-log/history', 'custom-field', 'custom field', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1793, 1, 'en', 'plugins/audit-log/history', 'widget_audit_logs', 'Activities Logs', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1794, 1, 'en', 'plugins/audit-log/history', 'action', 'Action', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1795, 1, 'en', 'plugins/audit-log/history', 'user_agent', 'User Agent', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1796, 1, 'en', 'plugins/audit-log/history', 'system', 'System', '2020-11-15 20:58:24', '2020-11-15 20:58:24'),
(1797, 1, 'en', 'plugins/audit-log/history', 'delete_all', 'Delete all records', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1820, 1, 'en', 'plugins/backup/backup', 'name', 'Backup', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1821, 1, 'en', 'plugins/backup/backup', 'backup_description', 'Backup database and uploads folder.', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1822, 1, 'en', 'plugins/backup/backup', 'create_backup_success', 'Created backup successfully!', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1823, 1, 'en', 'plugins/backup/backup', 'delete_backup_success', 'Delete backup successfully!', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1824, 1, 'en', 'plugins/backup/backup', 'restore_backup_success', 'Restore backup successfully!', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1825, 1, 'en', 'plugins/backup/backup', 'generate_btn', 'Generate backup', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1826, 1, 'en', 'plugins/backup/backup', 'create', 'Create a backup', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1827, 1, 'en', 'plugins/backup/backup', 'restore', 'Restore a backup', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1828, 1, 'en', 'plugins/backup/backup', 'create_btn', 'Create', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1829, 1, 'en', 'plugins/backup/backup', 'restore_btn', 'Restore', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1830, 1, 'en', 'plugins/backup/backup', 'restore_confirm_msg', 'Do you really want to restore this revision?', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1831, 1, 'en', 'plugins/backup/backup', 'download_uploads_folder', 'Download backup of uploads folder', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1832, 1, 'en', 'plugins/backup/backup', 'download_database', 'Download backup of database', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1833, 1, 'en', 'plugins/backup/backup', 'restore_tooltip', 'Restore this backup', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1834, 1, 'en', 'plugins/backup/backup', 'demo_alert', 'Hi guest, if you see demo site is destroyed, please help me <a href=\":link\">go here</a> and restore demo site to the latest revision! Thank you so much!', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1835, 1, 'en', 'plugins/backup/backup', 'menu_name', 'Backups', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1836, 1, 'en', 'plugins/backup/backup', 'size', 'Size', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1837, 1, 'en', 'plugins/backup/backup', 'no_backups', 'There is no backup now!', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1854, 1, 'en', 'plugins/blog/base', 'menu_name', 'Blog', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1855, 1, 'en', 'plugins/blog/base', 'blog_page', 'Blog Page', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1856, 1, 'en', 'plugins/blog/base', 'select', '-- Select --', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1857, 1, 'en', 'plugins/blog/base', 'blog_page_id', 'Blog page', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1858, 1, 'en', 'plugins/blog/base', 'number_posts_per_page', 'Number posts per page', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1859, 1, 'en', 'plugins/blog/base', 'write_some_tags', 'Write some tags', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1860, 1, 'en', 'plugins/blog/base', 'short_code_name', 'Blog posts', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1861, 1, 'en', 'plugins/blog/base', 'short_code_description', 'Add blog posts', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1862, 1, 'en', 'plugins/blog/base', 'number_posts_per_page_in_category', 'Number of posts per page in a category', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1863, 1, 'en', 'plugins/blog/base', 'number_posts_per_page_in_tag', 'Number of posts per page in a tag', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1864, 1, 'en', 'plugins/blog/categories', 'create', 'Create new category', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1865, 1, 'en', 'plugins/blog/categories', 'edit', 'Edit category', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1866, 1, 'en', 'plugins/blog/categories', 'menu', 'Categories', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1867, 1, 'en', 'plugins/blog/categories', 'edit_this_category', 'Edit this category', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1868, 1, 'en', 'plugins/blog/categories', 'menu_name', 'Categories', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1869, 1, 'en', 'plugins/blog/categories', 'none', 'None', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1870, 1, 'en', 'plugins/blog/member', 'dob', 'Born :date', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1871, 1, 'en', 'plugins/blog/member', 'draft_posts', 'Draft Posts', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1872, 1, 'en', 'plugins/blog/member', 'pending_posts', 'Pending Posts', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1873, 1, 'en', 'plugins/blog/member', 'published_posts', 'Published Posts', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1874, 1, 'en', 'plugins/blog/member', 'posts', 'Posts', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1875, 1, 'en', 'plugins/blog/member', 'write_post', 'Write a post', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1876, 1, 'en', 'plugins/blog/posts', 'create', 'Create new post', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1877, 1, 'en', 'plugins/blog/posts', 'edit', 'Edit post', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1878, 1, 'en', 'plugins/blog/posts', 'form.name', 'Name', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1879, 1, 'en', 'plugins/blog/posts', 'form.name_placeholder', 'Post\'s name (Maximum :c characters)', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1880, 1, 'en', 'plugins/blog/posts', 'form.description', 'Description', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1881, 1, 'en', 'plugins/blog/posts', 'form.description_placeholder', 'Short description for post (Maximum :c characters)', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1882, 1, 'en', 'plugins/blog/posts', 'form.categories', 'Categories', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1883, 1, 'en', 'plugins/blog/posts', 'form.tags', 'Tags', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1884, 1, 'en', 'plugins/blog/posts', 'form.tags_placeholder', 'Tags', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1885, 1, 'en', 'plugins/blog/posts', 'form.content', 'Content', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1886, 1, 'en', 'plugins/blog/posts', 'form.is_featured', 'Is featured?', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1887, 1, 'en', 'plugins/blog/posts', 'form.note', 'Note content', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1888, 1, 'en', 'plugins/blog/posts', 'form.format_type', 'Format', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1889, 1, 'en', 'plugins/blog/posts', 'cannot_delete', 'Post could not be deleted', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1890, 1, 'en', 'plugins/blog/posts', 'post_deleted', 'Post deleted', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1891, 1, 'en', 'plugins/blog/posts', 'posts', 'Posts', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1892, 1, 'en', 'plugins/blog/posts', 'post', 'Post', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1893, 1, 'en', 'plugins/blog/posts', 'edit_this_post', 'Edit this post', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1894, 1, 'en', 'plugins/blog/posts', 'no_new_post_now', 'There is no new post now!', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1895, 1, 'en', 'plugins/blog/posts', 'menu_name', 'Posts', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1896, 1, 'en', 'plugins/blog/posts', 'widget_posts_recent', 'Recent Posts', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1897, 1, 'en', 'plugins/blog/posts', 'categories', 'Categories', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1898, 1, 'en', 'plugins/blog/posts', 'category', 'Category', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1899, 1, 'en', 'plugins/blog/posts', 'author', 'Author', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1900, 1, 'en', 'plugins/blog/settings', 'select', '-- Select --', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1901, 1, 'en', 'plugins/blog/settings', 'blog_page_id', 'Blog page', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1902, 1, 'en', 'plugins/blog/tags', 'form.name', 'Name', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1903, 1, 'en', 'plugins/blog/tags', 'form.name_placeholder', 'Tag\'s name (Maximum 120 characters)', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1904, 1, 'en', 'plugins/blog/tags', 'form.description', 'Description', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1905, 1, 'en', 'plugins/blog/tags', 'form.description_placeholder', 'Short description for tag (Maximum 400 characters)', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1906, 1, 'en', 'plugins/blog/tags', 'form.categories', 'Categories', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1907, 1, 'en', 'plugins/blog/tags', 'notices.no_select', 'Please select at least one tag to take this action!', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1908, 1, 'en', 'plugins/blog/tags', 'create', 'Create new tag', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1909, 1, 'en', 'plugins/blog/tags', 'edit', 'Edit tag', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1910, 1, 'en', 'plugins/blog/tags', 'cannot_delete', 'Tag could not be deleted', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1911, 1, 'en', 'plugins/blog/tags', 'deleted', 'Tag deleted', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1912, 1, 'en', 'plugins/blog/tags', 'menu', 'Tags', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1913, 1, 'en', 'plugins/blog/tags', 'edit_this_tag', 'Edit this tag', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1914, 1, 'en', 'plugins/blog/tags', 'menu_name', 'Tags', '2020-11-15 20:58:25', '2020-11-15 20:58:25'),
(1964, 1, 'en', 'plugins/captcha/captcha', 'settings.title', 'Captcha', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1965, 1, 'en', 'plugins/captcha/captcha', 'settings.description', 'Settings for Google Captcha', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1966, 1, 'en', 'plugins/captcha/captcha', 'settings.captcha_site_key', 'Captcha Site Key', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1967, 1, 'en', 'plugins/captcha/captcha', 'settings.captcha_secret', 'Captcha Secret', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1968, 1, 'en', 'plugins/captcha/captcha', 'settings.enable_captcha', 'Enable Captcha?', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1969, 1, 'en', 'plugins/captcha/captcha', 'settings.helper', 'Go here to get credentials https://www.google.com/recaptcha/admin#list.', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1970, 1, 'en', 'plugins/captcha/captcha', 'settings.hide_badge', 'Hide recaptcha badge (for v3)', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1971, 1, 'en', 'plugins/captcha/captcha', 'settings.type', 'Type', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1972, 1, 'en', 'plugins/captcha/captcha', 'settings.v2_description', 'V2 (Verify requests with a challenge)', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1973, 1, 'en', 'plugins/captcha/captcha', 'settings.v3_description', 'V3 (Verify requests with a score)', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1974, 1, 'en', 'plugins/captcha/captcha', 'failed_validate', 'Failed to validate the captcha.', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1975, 1, 'en', 'plugins/contact/contact', 'menu', 'Contact', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1976, 1, 'en', 'plugins/contact/contact', 'edit', 'View contact', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1977, 1, 'en', 'plugins/contact/contact', 'tables.phone', 'Phone', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1978, 1, 'en', 'plugins/contact/contact', 'tables.email', 'Email', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1979, 1, 'en', 'plugins/contact/contact', 'tables.full_name', 'Full Name', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1980, 1, 'en', 'plugins/contact/contact', 'tables.time', 'Time', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1981, 1, 'en', 'plugins/contact/contact', 'tables.address', 'Address', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1982, 1, 'en', 'plugins/contact/contact', 'tables.subject', 'Subject', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1983, 1, 'en', 'plugins/contact/contact', 'tables.content', 'Content', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1984, 1, 'en', 'plugins/contact/contact', 'contact_information', 'Contact information', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1985, 1, 'en', 'plugins/contact/contact', 'replies', 'Replies', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1986, 1, 'en', 'plugins/contact/contact', 'email.header', 'Email', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1987, 1, 'en', 'plugins/contact/contact', 'email.title', 'New contact from your site', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1988, 1, 'en', 'plugins/contact/contact', 'email.success', 'Send message successfully!', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1989, 1, 'en', 'plugins/contact/contact', 'email.failed', 'Can\'t send message on this time, please try again later!', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1990, 1, 'en', 'plugins/contact/contact', 'form.name.required', 'Name is required', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1991, 1, 'en', 'plugins/contact/contact', 'form.email.required', 'Email is required', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1992, 1, 'en', 'plugins/contact/contact', 'form.email.email', 'The email address is not valid', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1993, 1, 'en', 'plugins/contact/contact', 'form.content.required', 'Content is required', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1994, 1, 'en', 'plugins/contact/contact', 'contact_sent_from', 'This contact information sent from', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1995, 1, 'en', 'plugins/contact/contact', 'sender', 'Sender', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1996, 1, 'en', 'plugins/contact/contact', 'sender_email', 'Email', '2020-11-15 20:58:26', '2020-11-15 20:58:26');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1997, 1, 'en', 'plugins/contact/contact', 'sender_address', 'Address', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1998, 1, 'en', 'plugins/contact/contact', 'sender_phone', 'Phone', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(1999, 1, 'en', 'plugins/contact/contact', 'message_content', 'Message content', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2000, 1, 'en', 'plugins/contact/contact', 'sent_from', 'Email sent from', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2001, 1, 'en', 'plugins/contact/contact', 'form_name', 'Name', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2002, 1, 'en', 'plugins/contact/contact', 'form_email', 'Email', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2003, 1, 'en', 'plugins/contact/contact', 'form_address', 'Address', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2004, 1, 'en', 'plugins/contact/contact', 'form_subject', 'Subject', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2005, 1, 'en', 'plugins/contact/contact', 'form_phone', 'Phone', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2006, 1, 'en', 'plugins/contact/contact', 'form_message', 'Message', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2007, 1, 'en', 'plugins/contact/contact', 'required_field', 'The field with (<span style=\"color: red\">*</span>) is required.', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2008, 1, 'en', 'plugins/contact/contact', 'send_btn', 'Send message', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2009, 1, 'en', 'plugins/contact/contact', 'new_msg_notice', 'You have <span class=\"bold\">:count</span> New Messages', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2010, 1, 'en', 'plugins/contact/contact', 'view_all', 'View all', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2011, 1, 'en', 'plugins/contact/contact', 'statuses.read', 'Read', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2012, 1, 'en', 'plugins/contact/contact', 'statuses.unread', 'Unread', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2013, 1, 'en', 'plugins/contact/contact', 'phone', 'Phone', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2014, 1, 'en', 'plugins/contact/contact', 'address', 'Address', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2015, 1, 'en', 'plugins/contact/contact', 'message', 'Message', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2016, 1, 'en', 'plugins/contact/contact', 'settings.email.title', 'Contact', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2017, 1, 'en', 'plugins/contact/contact', 'settings.email.description', 'Contact email configuration', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2018, 1, 'en', 'plugins/contact/contact', 'settings.email.templates.notice_title', 'Send notice to administrator', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2019, 1, 'en', 'plugins/contact/contact', 'settings.email.templates.notice_description', 'Email template to send notice to administrator when system get new contact', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2020, 1, 'en', 'plugins/contact/contact', 'no_reply', 'No reply yet!', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2021, 1, 'en', 'plugins/contact/contact', 'reply', 'Reply', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2022, 1, 'en', 'plugins/contact/contact', 'send', 'Send', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2023, 1, 'en', 'plugins/contact/contact', 'shortcode_name', 'Contact form', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2024, 1, 'en', 'plugins/contact/contact', 'shortcode_description', 'Add a contact form', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2025, 1, 'en', 'plugins/contact/contact', 'shortcode_content_description', 'Add shortcode [contact-form][/contact-form] to editor?', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2026, 1, 'en', 'plugins/contact/contact', 'message_sent_success', 'Message sent successfully!', '2020-11-15 20:58:26', '2020-11-15 20:58:26'),
(2084, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.name', 'Cookie Consent', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2085, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.description', 'Cookie consent settings', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2086, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.enable', 'Enable cookie consent?', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2087, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.message', 'Message', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2088, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.button_text', 'Button text', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2089, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.max_width', 'Max width (px)', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2090, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.background_color', 'Background color', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2091, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.text_color', 'Text color', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2092, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'message', 'Your experience on this site will be improved by allowing cookies.', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2093, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'button_text', 'Allow cookies', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2094, 1, 'en', 'plugins/ecommerce/brands', 'name', 'Brands', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2095, 1, 'en', 'plugins/ecommerce/brands', 'create', 'New brand', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2096, 1, 'en', 'plugins/ecommerce/brands', 'edit', 'Edit brand', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2097, 1, 'en', 'plugins/ecommerce/brands', 'form.name', 'Name', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2098, 1, 'en', 'plugins/ecommerce/brands', 'form.name_placeholder', 'Brand\'s name (Maximum 255 characters)', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2099, 1, 'en', 'plugins/ecommerce/brands', 'form.description', 'Description', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2100, 1, 'en', 'plugins/ecommerce/brands', 'form.description_placeholder', 'Short description for brand (Maximum 400 characters)', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2101, 1, 'en', 'plugins/ecommerce/brands', 'form.website', 'Website', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2102, 1, 'en', 'plugins/ecommerce/brands', 'form.logo', 'Logo', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2103, 1, 'en', 'plugins/ecommerce/brands', 'form.is_featured', 'Is featured', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2104, 1, 'en', 'plugins/ecommerce/brands', 'logo', 'Logo', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2105, 1, 'en', 'plugins/ecommerce/brands', 'website', 'Website', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2106, 1, 'en', 'plugins/ecommerce/brands', 'notices.no_select', 'Please select at least one record to take this action!', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2107, 1, 'en', 'plugins/ecommerce/brands', 'notices.update_success_message', 'Update successfully', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2108, 1, 'en', 'plugins/ecommerce/brands', 'cannot_delete', 'Brand could not be deleted', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2109, 1, 'en', 'plugins/ecommerce/brands', 'brand_deleted', 'Brand deleted', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2110, 1, 'en', 'plugins/ecommerce/brands', 'menu', 'Brands', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2111, 1, 'en', 'plugins/ecommerce/brands', 'no_brand', 'No brand', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2112, 1, 'en', 'plugins/ecommerce/brands', 'intro.title', 'Manage brands', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2113, 1, 'en', 'plugins/ecommerce/brands', 'intro.description', 'Manage product brands such as Nike, Adidas, Bitis ...', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2114, 1, 'en', 'plugins/ecommerce/brands', 'intro.button_text', 'Create brand', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2115, 1, 'en', 'plugins/ecommerce/currency', 'currencies', 'Currencies', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2116, 1, 'en', 'plugins/ecommerce/currency', 'setting_description', 'List of currencies using on website', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2117, 1, 'en', 'plugins/ecommerce/currency', 'name', 'Name', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2118, 1, 'en', 'plugins/ecommerce/currency', 'symbol', 'Symbol', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2119, 1, 'en', 'plugins/ecommerce/currency', 'number_of_decimals', 'Number of decimals', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2120, 1, 'en', 'plugins/ecommerce/currency', 'exchange_rate', 'Exchange rate', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2121, 1, 'en', 'plugins/ecommerce/currency', 'is_prefix_symbol', 'Position of symbol', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2122, 1, 'en', 'plugins/ecommerce/currency', 'is_default', 'Is default?', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2123, 1, 'en', 'plugins/ecommerce/currency', 'remove', 'Remove', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2124, 1, 'en', 'plugins/ecommerce/currency', 'new_currency', 'Add a new currency', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2125, 1, 'en', 'plugins/ecommerce/currency', 'save_settings', 'Save settings', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2126, 1, 'en', 'plugins/ecommerce/currency', 'before_number', 'Before number', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2127, 1, 'en', 'plugins/ecommerce/currency', 'after_number', 'After number', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2128, 1, 'en', 'plugins/ecommerce/customer', 'name', 'Customers', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2129, 1, 'en', 'plugins/ecommerce/customer', 'create', 'Create a customer', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2130, 1, 'en', 'plugins/ecommerce/customer', 'edit', 'Edit customer \":name\"', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2131, 1, 'en', 'plugins/ecommerce/customer', 'email', 'Email', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2132, 1, 'en', 'plugins/ecommerce/customer', 'email_placeholder', 'Ex: example@gmail.com', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2133, 1, 'en', 'plugins/ecommerce/customer', 'password', 'Password', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2134, 1, 'en', 'plugins/ecommerce/customer', 'change_password', 'Change password?', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2135, 1, 'en', 'plugins/ecommerce/customer', 'password_confirmation', 'Password confirmation', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2136, 1, 'en', 'plugins/ecommerce/customer', 'intro.title', 'Manage customers', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2137, 1, 'en', 'plugins/ecommerce/customer', 'intro.description', 'When a customer buy your product(s), you will know their order histories.', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2138, 1, 'en', 'plugins/ecommerce/customer', 'intro.button_text', 'Create customer', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2139, 1, 'en', 'plugins/ecommerce/discount', 'name', 'Discounts', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2140, 1, 'en', 'plugins/ecommerce/discount', 'create', 'Create discount', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2141, 1, 'en', 'plugins/ecommerce/discount', 'invalid_coupon', 'This coupon is invalid or expired!', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2142, 1, 'en', 'plugins/ecommerce/discount', 'cannot_use_same_time_with_other_discount_program', 'Cannot use this coupon in the same time with other discount program!', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2143, 1, 'en', 'plugins/ecommerce/discount', 'not_used', 'This coupon is not used yet!', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2144, 1, 'en', 'plugins/ecommerce/discount', 'detail', 'Detail', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2145, 1, 'en', 'plugins/ecommerce/discount', 'used', 'Used', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2146, 1, 'en', 'plugins/ecommerce/discount', 'start_date', 'Start date', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2147, 1, 'en', 'plugins/ecommerce/discount', 'end_date', 'End date', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2148, 1, 'en', 'plugins/ecommerce/discount', 'intro.title', 'Manage discount/coupon code', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2149, 1, 'en', 'plugins/ecommerce/discount', 'intro.description', 'Create coupon code or promotion for your products.', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2150, 1, 'en', 'plugins/ecommerce/discount', 'intro.button_text', 'Create discount', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2151, 1, 'en', 'plugins/ecommerce/ecommerce', 'settings', 'Settings', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2152, 1, 'en', 'plugins/ecommerce/ecommerce', 'name', 'Ecommerce', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2153, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.title', 'E-commerce', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2154, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.description', 'Ecommerce email config', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2155, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_confirm_subject', 'Subject of order confirmation email', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2156, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_confirm_subject_placeholder', 'The subject of email confirmation send to the customer', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2157, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_confirm_content', 'Content of order confirmation email', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2158, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_status_change_subject', 'Subject of email when changing order\'s status', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2159, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_status_change_subject_placeholder', 'Subject of email when changing order\'s status send to customer', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2160, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.order_status_change_content', 'Content of email when changing order\'s status', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2161, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.from_email', 'Email from', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2162, 1, 'en', 'plugins/ecommerce/ecommerce', 'setting.email.from_email_placeholder', 'Email from address to display in mail. Ex: example@gmail.com', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2163, 1, 'en', 'plugins/ecommerce/ecommerce', 'store_address', 'Store address', '2020-11-15 20:58:27', '2020-11-15 20:58:27'),
(2164, 1, 'en', 'plugins/ecommerce/ecommerce', 'store_phone', 'Store phone', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2165, 1, 'en', 'plugins/ecommerce/ecommerce', 'order_id', 'Order ID', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2166, 1, 'en', 'plugins/ecommerce/ecommerce', 'order_token', 'Order token', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2167, 1, 'en', 'plugins/ecommerce/ecommerce', 'customer_name', 'Customer name', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2168, 1, 'en', 'plugins/ecommerce/ecommerce', 'customer_email', 'Customer email', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2169, 1, 'en', 'plugins/ecommerce/ecommerce', 'customer_phone', 'Customer phone', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2170, 1, 'en', 'plugins/ecommerce/ecommerce', 'customer_address', 'Customer address', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2171, 1, 'en', 'plugins/ecommerce/ecommerce', 'product_list', 'List products in order', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2172, 1, 'en', 'plugins/ecommerce/ecommerce', 'payment_detail', 'Payment detail', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2173, 1, 'en', 'plugins/ecommerce/ecommerce', 'shipping_method', 'Shipping method', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2174, 1, 'en', 'plugins/ecommerce/ecommerce', 'payment_method', 'Payment method', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2175, 1, 'en', 'plugins/ecommerce/ecommerce', 'standard_and_format', 'Standard & Format', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2176, 1, 'en', 'plugins/ecommerce/ecommerce', 'standard_and_format_description', 'Standards and formats are used to calculate things like product prices, shipping weights, and order times.', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2177, 1, 'en', 'plugins/ecommerce/ecommerce', 'change_order_format', 'Edit order code format (optional)', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2178, 1, 'en', 'plugins/ecommerce/ecommerce', 'change_order_format_description', 'The default order code starts at: number. You can change the start or end string to create the order code you want, for example \"DH-: number\" or \": number-A\"', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2179, 1, 'en', 'plugins/ecommerce/ecommerce', 'start_with', 'Start with', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2180, 1, 'en', 'plugins/ecommerce/ecommerce', 'end_with', 'End with', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2181, 1, 'en', 'plugins/ecommerce/ecommerce', 'order_will_be_shown', 'Your order code will be shown', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2182, 1, 'en', 'plugins/ecommerce/ecommerce', 'weight_unit', 'Unit of weight', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2183, 1, 'en', 'plugins/ecommerce/ecommerce', 'height_unit', 'Unit length / height', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2184, 1, 'en', 'plugins/ecommerce/email', 'customer_new_order_title', 'Order confirmation', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2185, 1, 'en', 'plugins/ecommerce/email', 'customer_new_order_description', 'Send email confirmation to customer when an order placed', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2186, 1, 'en', 'plugins/ecommerce/email', 'order_cancellation_title', 'Order cancellation', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2187, 1, 'en', 'plugins/ecommerce/email', 'order_cancellation_description', 'Send to custom when they cancelled order', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2188, 1, 'en', 'plugins/ecommerce/email', 'delivery_confirmation_title', 'Delivering confirmation', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2189, 1, 'en', 'plugins/ecommerce/email', 'delivery_confirmation_description', 'Send to customer when order is delivering', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2190, 1, 'en', 'plugins/ecommerce/email', 'admin_new_order_title', 'Notice about new order', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2191, 1, 'en', 'plugins/ecommerce/email', 'admin_new_order_description', 'Send to administrators when an order placed', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2192, 1, 'en', 'plugins/ecommerce/email', 'order_confirmation_title', 'Order confirmation', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2193, 1, 'en', 'plugins/ecommerce/email', 'order_confirmation_description', 'Send to customer when they order was confirmed by admins', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2194, 1, 'en', 'plugins/ecommerce/email', 'payment_confirmation_title', 'Payment confirmation', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2195, 1, 'en', 'plugins/ecommerce/email', 'payment_confirmation_description', 'Send to customer when their payment was confirmed', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2196, 1, 'en', 'plugins/ecommerce/email', 'order_recover_title', 'Incomplete order', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2197, 1, 'en', 'plugins/ecommerce/email', 'order_recover_description', 'Send to custom to remind them about incomplete orders', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2198, 1, 'en', 'plugins/ecommerce/messages', 'cart.add_product_success', 'Add product :product to cart successfully!', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2199, 1, 'en', 'plugins/ecommerce/messages', 'cart.update_cart_success', 'Update cart successfully!', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2200, 1, 'en', 'plugins/ecommerce/messages', 'cart.remove_cart_success', 'Remove item from cart successfully!', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2201, 1, 'en', 'plugins/ecommerce/messages', 'cart.empty_cart_success', 'Empty cart successfully!', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2202, 1, 'en', 'plugins/ecommerce/messages', 'cart.product_not_found', 'This product is out of stock or not exists!', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2203, 1, 'en', 'plugins/ecommerce/messages', 'cart.product_is_out_of_stock', 'Product :product is out of stock!', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2204, 1, 'en', 'plugins/ecommerce/messages', 'order.customer_cancel_error', 'The order is delivering or completed', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2205, 1, 'en', 'plugins/ecommerce/messages', 'order.customer_cancel_success', 'You do cancel the order successful', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2206, 1, 'en', 'plugins/ecommerce/order', 'statuses.pending', 'Pending', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2207, 1, 'en', 'plugins/ecommerce/order', 'statuses.processing', 'Processing', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2208, 1, 'en', 'plugins/ecommerce/order', 'statuses.delivering', 'Delivering', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2209, 1, 'en', 'plugins/ecommerce/order', 'statuses.delivered', 'Delivered', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2210, 1, 'en', 'plugins/ecommerce/order', 'statuses.completed', 'Completed', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2211, 1, 'en', 'plugins/ecommerce/order', 'statuses.canceled', 'Canceled', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2212, 1, 'en', 'plugins/ecommerce/order', 'name', 'Orders', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2213, 1, 'en', 'plugins/ecommerce/order', 'create', 'Create an order', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2214, 1, 'en', 'plugins/ecommerce/order', 'customer.messages.cancel_error', 'The order is delivering or completed', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2215, 1, 'en', 'plugins/ecommerce/order', 'customer.messages.cancel_success', 'You do cancel the order successful', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2216, 1, 'en', 'plugins/ecommerce/order', 'incomplete_order', 'Incomplete orders', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2217, 1, 'en', 'plugins/ecommerce/order', 'order_id', 'Order ID', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2218, 1, 'en', 'plugins/ecommerce/order', 'product_id', 'Product ID', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2219, 1, 'en', 'plugins/ecommerce/order', 'customer_label', 'Customer', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2220, 1, 'en', 'plugins/ecommerce/order', 'amount', 'Amount', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2221, 1, 'en', 'plugins/ecommerce/order', 'tax_amount', 'Tax Amount', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2222, 1, 'en', 'plugins/ecommerce/order', 'shipping_amount', 'Shipping amount', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2223, 1, 'en', 'plugins/ecommerce/order', 'payment_method', 'Payment method', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2224, 1, 'en', 'plugins/ecommerce/order', 'payment_status_label', 'Payment status', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2225, 1, 'en', 'plugins/ecommerce/order', 'manage_orders', 'Manage orders', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2226, 1, 'en', 'plugins/ecommerce/order', 'order_intro_description', 'Once your store has orders, this is where you will process and track those orders.', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2227, 1, 'en', 'plugins/ecommerce/order', 'create_new_order', 'Create a new order', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2228, 1, 'en', 'plugins/ecommerce/order', 'manage_incomplete_orders', 'Manage incomplete orders', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2229, 1, 'en', 'plugins/ecommerce/order', 'incomplete_orders_intro_description', 'Incomplete order is an order created when a customer adds a product to the cart, proceeds to fill out the purchase information but does not complete the checkout process.', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2230, 1, 'en', 'plugins/ecommerce/payment', 'name', 'Payments', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2231, 1, 'en', 'plugins/ecommerce/payment', 'payment_method', 'Payment methods', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2232, 1, 'en', 'plugins/ecommerce/payment', 'view_payment', 'View payment #', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2233, 1, 'en', 'plugins/ecommerce/payment', 'charge_id', 'Charge ID', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2234, 1, 'en', 'plugins/ecommerce/payment', 'amount', 'Amount', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2235, 1, 'en', 'plugins/ecommerce/payment', 'currency', 'Currency', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2236, 1, 'en', 'plugins/ecommerce/payment', 'user', 'User', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2237, 1, 'en', 'plugins/ecommerce/payment', 'paypal_name_required', 'PayPal\'s name is required!', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2238, 1, 'en', 'plugins/ecommerce/payment', 'paypal_name_max', 'PayPal\'s name is too long!', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2239, 1, 'en', 'plugins/ecommerce/payment', 'stripe_name_required', 'Stripe\'s name is required!', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2240, 1, 'en', 'plugins/ecommerce/payment', 'stripe_name_max', 'Stripe\'s name is too long!', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2241, 1, 'en', 'plugins/ecommerce/payment', 'status', 'Status', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2242, 1, 'en', 'plugins/ecommerce/payment', 'enabled', 'Enabled', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2243, 1, 'en', 'plugins/ecommerce/payment', 'disabled', 'Disabled', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2244, 1, 'en', 'plugins/ecommerce/payment', 'client_id', 'Client ID', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2245, 1, 'en', 'plugins/ecommerce/payment', 'client_secret', 'Client Secret', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2246, 1, 'en', 'plugins/ecommerce/payment', 'mode', 'Mode', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2247, 1, 'en', 'plugins/ecommerce/payment', 'sandbox', 'Sandbox', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2248, 1, 'en', 'plugins/ecommerce/payment', 'live', 'Live', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2249, 1, 'en', 'plugins/ecommerce/payment', 'enable_payment_log', 'Enable Payment Log', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2250, 1, 'en', 'plugins/ecommerce/payment', 'yes', 'Yes', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2251, 1, 'en', 'plugins/ecommerce/payment', 'no', 'No', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2252, 1, 'en', 'plugins/ecommerce/payment', 'client_key', 'Client Key', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2253, 1, 'en', 'plugins/ecommerce/payment', 'stripe', 'Stripe', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2254, 1, 'en', 'plugins/ecommerce/payment', 'paypal', 'PayPal', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2255, 1, 'en', 'plugins/ecommerce/payment', 'action', 'Action', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2256, 1, 'en', 'plugins/ecommerce/payment', 'go_back', 'Go back', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2257, 1, 'en', 'plugins/ecommerce/payment', 'view', 'View', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2258, 1, 'en', 'plugins/ecommerce/payment', 'cash_on_delivery', 'Cash on delivery (COD)', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2259, 1, 'en', 'plugins/ecommerce/payment', 'via_bank_transfer', 'Via bank transfer', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2260, 1, 'en', 'plugins/ecommerce/payment', 'payment_via_cart', 'Payment via card', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2261, 1, 'en', 'plugins/ecommerce/payment', 'card_number', 'Card number', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2262, 1, 'en', 'plugins/ecommerce/payment', 'full_name', 'Full name', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2263, 1, 'en', 'plugins/ecommerce/payment', 'payment_via_paypal', 'Payment via PayPal', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2264, 1, 'en', 'plugins/ecommerce/payment', 'mm_yy', 'MM/YY', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2265, 1, 'en', 'plugins/ecommerce/payment', 'cvc', 'CVC', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2266, 1, 'en', 'plugins/ecommerce/payment', 'details', 'Details', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2267, 1, 'en', 'plugins/ecommerce/payment', 'payer_name', 'Payer Name', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2268, 1, 'en', 'plugins/ecommerce/payment', 'email', 'Email', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2269, 1, 'en', 'plugins/ecommerce/payment', 'phone', 'Phone', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2270, 1, 'en', 'plugins/ecommerce/payment', 'country', 'Country', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2271, 1, 'en', 'plugins/ecommerce/payment', 'shipping_address', 'Shipping Address', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2272, 1, 'en', 'plugins/ecommerce/payment', 'payment_details', 'Payment Details', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2273, 1, 'en', 'plugins/ecommerce/payment', 'card', 'Card', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2274, 1, 'en', 'plugins/ecommerce/payment', 'address', 'Address', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2275, 1, 'en', 'plugins/ecommerce/payment', 'could_not_get_stripe_token', 'Could not get Stripe token to make a charge.', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2276, 1, 'en', 'plugins/ecommerce/payment', 'new_payment', 'Payment for order :id', '2020-11-15 20:58:28', '2020-11-15 20:58:28'),
(2277, 1, 'en', 'plugins/ecommerce/payment', 'payment_id', 'Payment ID', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2278, 1, 'en', 'plugins/ecommerce/prices', 'name', 'Price', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2279, 1, 'en', 'plugins/ecommerce/prices', 'create', 'New price', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2280, 1, 'en', 'plugins/ecommerce/prices', 'edit', 'Edit price', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2281, 1, 'en', 'plugins/ecommerce/prices', 'list', 'List price', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2282, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'name', 'Product attribute sets', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2283, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'create', 'New product attribute set', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2284, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'edit', 'Edit product attribute set', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2285, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'visible_in_categories', 'Visible in categories', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2286, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'product_with_more_version', 'Product with more version', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2287, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'create_a_version', 'Create a version', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2288, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'enabled', 'Enabled', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2289, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'attributes', 'Attributes', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2290, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'price', 'Price', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2291, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'edit_btn', 'Edit', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2292, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'remove_btn', 'Remove', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2293, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'product', 'Product', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2294, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'back_to_product', 'Back to product', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2295, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'save', 'Save', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2296, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'other_existing_versions', 'Other existing versions', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2297, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'version_information', 'Version information', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2298, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'add_rule', 'Add rule', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2299, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'rules', 'Rules', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2300, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'pricing', 'Pricing', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2301, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'sale_price', 'Sale price', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2302, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'sale_type', 'Sale type', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2303, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'no_sale_price', 'No sale price', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2304, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'always_on_sale', 'Always on sale', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2305, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'limited_time', 'Limited time', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2306, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'from', 'From', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2307, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'to', 'To', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2308, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'storehouse', 'Storehouse', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2309, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'no_storehouse_management', 'No storehouse management', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2310, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'with_storehouse_management', 'With storehouse management', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2311, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'quantity', 'Quantity', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2312, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'allow_customer_checkout_out_of_stock', 'Allow customer checkout when this product out of stock', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2313, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'shipping', 'Shipping', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2314, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'length', 'Length', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2315, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'wide', 'Wide', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2316, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'height', 'Height', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2317, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'weight', 'Weight', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2318, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'version_images', 'Version images', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2319, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'add_new_image', 'Add new image', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2320, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'attribute_set', 'Attribute set', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2321, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'value', 'Value', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2322, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'dropdown_swatch', 'Dropdown Swatch', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2323, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'visual_swatch', 'Visual Swatch', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2324, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'text_swatch', 'Text Swatch', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2325, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'display_layout', 'Display Layout', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2326, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'searchable', 'Searchable', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2327, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'comparable', 'Comparable', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2328, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'use_in_product_listing', 'Used in product listing', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2329, 1, 'en', 'plugins/ecommerce/product-attribute-sets', 'attributes_list', 'Attributes list', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2330, 1, 'en', 'plugins/ecommerce/product-attributes', 'name', 'Product attributes', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2331, 1, 'en', 'plugins/ecommerce/product-attributes', 'create', 'New product attribute', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2332, 1, 'en', 'plugins/ecommerce/product-attributes', 'edit', 'Edit product attribute', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2333, 1, 'en', 'plugins/ecommerce/product-attributes', 'intro.title', 'Manage product attributes', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2334, 1, 'en', 'plugins/ecommerce/product-attributes', 'intro.description', 'Product attribute such as color, width, height ...', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2335, 1, 'en', 'plugins/ecommerce/product-attributes', 'intro.button_text', 'Create product attribute', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2336, 1, 'en', 'plugins/ecommerce/product-categories', 'name', 'Product categories', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2337, 1, 'en', 'plugins/ecommerce/product-categories', 'create', 'Create new product category', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2338, 1, 'en', 'plugins/ecommerce/product-categories', 'edit', 'Edit product category', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2339, 1, 'en', 'plugins/ecommerce/product-categories', 'list', 'List product categories', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2340, 1, 'en', 'plugins/ecommerce/product-categories', 'none', 'None', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2341, 1, 'en', 'plugins/ecommerce/product-categories', 'menu', 'Product categories', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2342, 1, 'en', 'plugins/ecommerce/product-categories', 'intro.title', 'Manage product categories', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2343, 1, 'en', 'plugins/ecommerce/product-categories', 'intro.description', 'Such as clothes, shoes, bags, jewelry ...', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2344, 1, 'en', 'plugins/ecommerce/product-categories', 'intro.button_text', 'Create product category', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2345, 1, 'en', 'plugins/ecommerce/product-collections', 'name', 'Product collections', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2346, 1, 'en', 'plugins/ecommerce/product-collections', 'create', 'New product collection', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2347, 1, 'en', 'plugins/ecommerce/product-collections', 'edit', 'Edit product collection', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2348, 1, 'en', 'plugins/ecommerce/product-collections', 'slug_help_block', 'Label key: <code>:slug</code>. We will use this key for filter.', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2349, 1, 'en', 'plugins/ecommerce/product-collections', 'intro.title', 'Manage product collections', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2350, 1, 'en', 'plugins/ecommerce/product-collections', 'intro.description', 'Group your products into collections to make it easier for customers to find them by category.', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2351, 1, 'en', 'plugins/ecommerce/product-collections', 'intro.button_text', 'Create product collection', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2352, 1, 'en', 'plugins/ecommerce/product-tag', 'name', 'Product tags', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2353, 1, 'en', 'plugins/ecommerce/product-tag', 'create', 'New product tag', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2354, 1, 'en', 'plugins/ecommerce/product-tag', 'edit', 'Edit product tag', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2355, 1, 'en', 'plugins/ecommerce/products', 'name', 'Products', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2356, 1, 'en', 'plugins/ecommerce/products', 'create', 'New product', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2357, 1, 'en', 'plugins/ecommerce/products', 'edit', 'Edit product - :name', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2358, 1, 'en', 'plugins/ecommerce/products', 'form.name', 'Name', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2359, 1, 'en', 'plugins/ecommerce/products', 'form.name_placeholder', 'Product\'s name (Maximum 120 characters)', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2360, 1, 'en', 'plugins/ecommerce/products', 'form.description', 'Description', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2361, 1, 'en', 'plugins/ecommerce/products', 'form.description_placeholder', 'Short description for product (Maximum 400 characters)', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2362, 1, 'en', 'plugins/ecommerce/products', 'form.categories', 'Categories', '2020-11-15 20:58:29', '2020-11-15 20:58:29'),
(2363, 1, 'en', 'plugins/ecommerce/products', 'form.content', 'Content', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2364, 1, 'en', 'plugins/ecommerce/products', 'form.price', 'Price', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2365, 1, 'en', 'plugins/ecommerce/products', 'form.quantity', 'Quantity', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2366, 1, 'en', 'plugins/ecommerce/products', 'form.brand', 'Brand', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2367, 1, 'en', 'plugins/ecommerce/products', 'form.width', 'Width', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2368, 1, 'en', 'plugins/ecommerce/products', 'form.height', 'Height', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2369, 1, 'en', 'plugins/ecommerce/products', 'form.weight', 'Weight', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2370, 1, 'en', 'plugins/ecommerce/products', 'form.date.end', 'From date', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2371, 1, 'en', 'plugins/ecommerce/products', 'form.date.start', 'To date', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2372, 1, 'en', 'plugins/ecommerce/products', 'form.image', 'Images', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2373, 1, 'en', 'plugins/ecommerce/products', 'form.label', 'Product collections', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2374, 1, 'en', 'plugins/ecommerce/products', 'form.price_sale', 'Price sale', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2375, 1, 'en', 'plugins/ecommerce/products', 'form.product_type.title', 'Product type', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2376, 1, 'en', 'plugins/ecommerce/products', 'form.shipping.height', 'Height', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2377, 1, 'en', 'plugins/ecommerce/products', 'form.shipping.length', 'Length', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2378, 1, 'en', 'plugins/ecommerce/products', 'form.shipping.title', 'Shipping', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2379, 1, 'en', 'plugins/ecommerce/products', 'form.shipping.weight', 'Weight', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2380, 1, 'en', 'plugins/ecommerce/products', 'form.shipping.wide', 'Wide', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2381, 1, 'en', 'plugins/ecommerce/products', 'form.stock.allow_order_when_out', 'Allow customer checkout when this product out of stock', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2382, 1, 'en', 'plugins/ecommerce/products', 'form.stock.in_stock', 'In stock', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2383, 1, 'en', 'plugins/ecommerce/products', 'form.stock.out_stock', 'Out stock', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2384, 1, 'en', 'plugins/ecommerce/products', 'form.stock.title', 'Stock status', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2385, 1, 'en', 'plugins/ecommerce/products', 'form.storehouse.no_storehouse', 'No storehouse management', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2386, 1, 'en', 'plugins/ecommerce/products', 'form.storehouse.storehouse', 'With storehouse management', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2387, 1, 'en', 'plugins/ecommerce/products', 'form.storehouse.title', 'Storehouse', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2388, 1, 'en', 'plugins/ecommerce/products', 'form.storehouse.quantity', 'Quantity', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2389, 1, 'en', 'plugins/ecommerce/products', 'form.tax', 'Tax', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2390, 1, 'en', 'plugins/ecommerce/products', 'price', 'Price', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2391, 1, 'en', 'plugins/ecommerce/products', 'quantity', 'Quantity', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2392, 1, 'en', 'plugins/ecommerce/products', 'type', 'Type', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2393, 1, 'en', 'plugins/ecommerce/products', 'image', 'Thumbnail', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2394, 1, 'en', 'plugins/ecommerce/products', 'sku', 'Sku', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2395, 1, 'en', 'plugins/ecommerce/products', 'brand', 'Brand', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2396, 1, 'en', 'plugins/ecommerce/products', 'cannot_delete', 'Product could not be deleted', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2397, 1, 'en', 'plugins/ecommerce/products', 'product_deleted', 'Product deleted', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2398, 1, 'en', 'plugins/ecommerce/products', 'product_collections', 'Product collections', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2399, 1, 'en', 'plugins/ecommerce/products', 'products', 'Products', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2400, 1, 'en', 'plugins/ecommerce/products', 'menu', 'Products', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2401, 1, 'en', 'plugins/ecommerce/products', 'control.button_add_image', 'Add image', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2402, 1, 'en', 'plugins/ecommerce/products', 'price_sale', 'Sale price', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2403, 1, 'en', 'plugins/ecommerce/products', 'price_group_title', 'Manager product price', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2404, 1, 'en', 'plugins/ecommerce/products', 'store_house_group_title', 'Manager store house', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2405, 1, 'en', 'plugins/ecommerce/products', 'shipping_group_title', 'Manager shipping', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2406, 1, 'en', 'plugins/ecommerce/products', 'overview', 'Overview', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2407, 1, 'en', 'plugins/ecommerce/products', 'attributes', 'Attributes', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2408, 1, 'en', 'plugins/ecommerce/products', 'product_has_variations', 'Product has variations', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2409, 1, 'en', 'plugins/ecommerce/products', 'manage_products', 'Manage products', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2410, 1, 'en', 'plugins/ecommerce/products', 'add_new_product', 'Add a new product', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2411, 1, 'en', 'plugins/ecommerce/products', 'start_by_adding_new_product', 'Start by adding new products.', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2412, 1, 'en', 'plugins/ecommerce/products', 'edit_this_product', 'Edit this product', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2413, 1, 'en', 'plugins/ecommerce/reports', 'name', 'Report', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2414, 1, 'en', 'plugins/ecommerce/reports', 'widget.order.title', 'Orders', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2415, 1, 'en', 'plugins/ecommerce/reports', 'count.revenue', 'Today revenue', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2416, 1, 'en', 'plugins/ecommerce/reports', 'count.orders', 'Today orders', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2417, 1, 'en', 'plugins/ecommerce/reports', 'count.products', 'Total products', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2418, 1, 'en', 'plugins/ecommerce/reports', 'count.customers', 'Total customers', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2419, 1, 'en', 'plugins/ecommerce/reports', 'product_name', 'Product name', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2420, 1, 'en', 'plugins/ecommerce/reports', 'quantity', 'Quantity', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2421, 1, 'en', 'plugins/ecommerce/reports', 'revenue_statistics', 'Revenue statistics', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2422, 1, 'en', 'plugins/ecommerce/reports', 'top_selling_products', 'Top selling products in this month', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2423, 1, 'en', 'plugins/ecommerce/review', 'name', 'Reviews', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2424, 1, 'en', 'plugins/ecommerce/review', 'add_review', 'Add review', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2425, 1, 'en', 'plugins/ecommerce/review', 'delete_review', 'Delete review', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2426, 1, 'en', 'plugins/ecommerce/review', 'create_review', 'Create Review', '2020-11-15 20:58:30', '2020-11-15 20:58:30');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(2427, 1, 'en', 'plugins/ecommerce/review', 'please_select_rating', 'Please select rating', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2428, 1, 'en', 'plugins/ecommerce/review', 'comment', 'Comment', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2429, 1, 'en', 'plugins/ecommerce/review', 'approve', 'Approve', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2430, 1, 'en', 'plugins/ecommerce/review', 'approved', 'Approved', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2431, 1, 'en', 'plugins/ecommerce/review', 'disapprove', 'Disapprove', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2432, 1, 'en', 'plugins/ecommerce/review', 'disapproved', 'Disapproved', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2433, 1, 'en', 'plugins/ecommerce/review', 'product', 'Product', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2434, 1, 'en', 'plugins/ecommerce/review', 'user', 'User', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2435, 1, 'en', 'plugins/ecommerce/review', 'star', 'Star', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2436, 1, 'en', 'plugins/ecommerce/review', 'status', 'Status', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2437, 1, 'en', 'plugins/ecommerce/review', 'list_review', 'Customer reviews', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2438, 1, 'en', 'plugins/ecommerce/review', 'intro.title', 'Manage customer reviews', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2439, 1, 'en', 'plugins/ecommerce/review', 'intro.description', 'Customer reviews will be shown here and you can manage it to show/hide in product detail page.', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2440, 1, 'en', 'plugins/ecommerce/shipping', 'name', 'Shipping Rules', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2441, 1, 'en', 'plugins/ecommerce/shipping', 'shipping', 'Shipping', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2442, 1, 'en', 'plugins/ecommerce/shipping', 'title', 'Title', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2443, 1, 'en', 'plugins/ecommerce/shipping', 'amount', 'Amount', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2444, 1, 'en', 'plugins/ecommerce/shipping', 'currency', 'Currency', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2445, 1, 'en', 'plugins/ecommerce/shipping', 'enable', 'Enable', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2446, 1, 'en', 'plugins/ecommerce/shipping', 'enabled', 'Enabled', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2447, 1, 'en', 'plugins/ecommerce/shipping', 'disable', 'Disable', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2448, 1, 'en', 'plugins/ecommerce/shipping', 'disabled', 'Disabled', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2449, 1, 'en', 'plugins/ecommerce/shipping', 'create_shipping', 'Create a shipping', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2450, 1, 'en', 'plugins/ecommerce/shipping', 'edit_shipping', 'Edit shipping #', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2451, 1, 'en', 'plugins/ecommerce/shipping', 'status', 'Status', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2452, 1, 'en', 'plugins/ecommerce/shipping', 'shipping_methods', 'Shipping methods', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2453, 1, 'en', 'plugins/ecommerce/shipping', 'create_shipping_method', 'Create shipping method', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2454, 1, 'en', 'plugins/ecommerce/shipping', 'edit_shipping_method', 'Edit shipping method', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2455, 1, 'en', 'plugins/ecommerce/shipping', 'add_shipping_region', 'Add shipping region', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2456, 1, 'en', 'plugins/ecommerce/shipping', 'country', 'Country', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2457, 1, 'en', 'plugins/ecommerce/shipping', 'methods.default', 'Default', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2458, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.not_approved', 'Not approved', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2459, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.approved', 'Approved', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2460, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.picking', 'Picking', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2461, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.delay_picking', 'Delay picking', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2462, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.picked', 'Picked', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2463, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.not_picked', 'Not picked', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2464, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.delivering', 'Delivering', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2465, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.delivered', 'Delivered', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2466, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.not_delivered', 'Not delivered', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2467, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.audited', 'Audited', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2468, 1, 'en', 'plugins/ecommerce/shipping', 'statuses.canceled', 'Canceled', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2469, 1, 'en', 'plugins/ecommerce/shipping', 'cod_statuses.pending', 'Pending', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2470, 1, 'en', 'plugins/ecommerce/shipping', 'cod_statuses.completed', 'Completed', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2471, 1, 'en', 'plugins/ecommerce/store-locator', 'name', 'Store locators', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2472, 1, 'en', 'plugins/ecommerce/store-locator', 'description', 'This address will appear on your invoice and will be used to calculate your shipping price.', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2473, 1, 'en', 'plugins/ecommerce/store-locator', 'shop_name', 'Shop name', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2474, 1, 'en', 'plugins/ecommerce/store-locator', 'phone', 'Phone', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2475, 1, 'en', 'plugins/ecommerce/store-locator', 'address', 'Address', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2476, 1, 'en', 'plugins/ecommerce/tax', 'name', 'Taxes', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2477, 1, 'en', 'plugins/ecommerce/tax', 'create', 'Create a tax', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2478, 1, 'en', 'plugins/ecommerce/tax', 'edit', 'Edit tax :title', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2479, 1, 'en', 'plugins/ecommerce/tax', 'title', 'Title', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2480, 1, 'en', 'plugins/ecommerce/tax', 'percentage', 'Percentage %', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2481, 1, 'en', 'plugins/ecommerce/tax', 'priority', 'Priority', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2482, 1, 'en', 'plugins/ecommerce/tax', 'select_tax', '-- select --', '2020-11-15 20:58:30', '2020-11-15 20:58:30'),
(2511, 1, 'en', 'plugins/ecommerce/flash-sale', 'name', 'Flash sales', '2021-02-03 20:19:06', '2021-02-03 20:19:06'),
(2512, 1, 'en', 'plugins/ecommerce/flash-sale', 'create', 'New flash sale', '2021-02-03 20:19:06', '2021-02-03 20:19:06'),
(2513, 1, 'en', 'plugins/ecommerce/flash-sale', 'edit', 'Edit flash sale', '2021-02-03 20:19:06', '2021-02-03 20:19:06'),
(2514, 1, 'en', 'plugins/ecommerce/flash-sale', 'products', 'Products', '2021-02-03 20:19:06', '2021-02-03 20:19:06'),
(2884, 1, 'en', 'plugins/newsletter/newsletter', 'name', 'Newsletters', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2885, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.title', 'Newsletter', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2886, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.description', 'Config newsletter email templates', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2887, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_admin.title', 'Email send to admin', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2888, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_admin.description', 'Template for sending email to admin', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2889, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_user.title', 'Email send to user', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2890, 1, 'en', 'plugins/newsletter/newsletter', 'settings.email.templates.to_user.description', 'Template for sending email to subscriber', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2891, 1, 'en', 'plugins/newsletter/newsletter', 'statuses.subscribed', 'Subscribed', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2892, 1, 'en', 'plugins/newsletter/newsletter', 'statuses.unsubscribed', 'Unsubscribed', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2893, 1, 'en', 'plugins/payment/payment', 'payments', 'Payments', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2894, 1, 'en', 'plugins/payment/payment', 'checkout_success', 'Checkout successfully!', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2895, 1, 'en', 'plugins/payment/payment', 'view_payment', 'View payment #', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2896, 1, 'en', 'plugins/payment/payment', 'charge_id', 'Charge ID', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2897, 1, 'en', 'plugins/payment/payment', 'amount', 'Amount', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2898, 1, 'en', 'plugins/payment/payment', 'currency', 'Currency', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2899, 1, 'en', 'plugins/payment/payment', 'user', 'User', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2900, 1, 'en', 'plugins/payment/payment', 'stripe', 'Stripe', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2901, 1, 'en', 'plugins/payment/payment', 'paypal', 'PayPal', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2902, 1, 'en', 'plugins/payment/payment', 'action', 'Action', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2903, 1, 'en', 'plugins/payment/payment', 'payment_via_card', 'Payment via card', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2904, 1, 'en', 'plugins/payment/payment', 'card_number', 'Card number', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2905, 1, 'en', 'plugins/payment/payment', 'full_name', 'Full name', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2906, 1, 'en', 'plugins/payment/payment', 'payment_via_paypal', 'Payment via PayPal', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2907, 1, 'en', 'plugins/payment/payment', 'mm_yy', 'MM/YY', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2908, 1, 'en', 'plugins/payment/payment', 'cvc', 'CVC', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2909, 1, 'en', 'plugins/payment/payment', 'details', 'Details', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2910, 1, 'en', 'plugins/payment/payment', 'payer_name', 'Payer Name', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2911, 1, 'en', 'plugins/payment/payment', 'email', 'Email', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2912, 1, 'en', 'plugins/payment/payment', 'phone', 'Phone', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2913, 1, 'en', 'plugins/payment/payment', 'country', 'Country', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2914, 1, 'en', 'plugins/payment/payment', 'shipping_address', 'Shipping Address', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2915, 1, 'en', 'plugins/payment/payment', 'payment_details', 'Payment Details', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2916, 1, 'en', 'plugins/payment/payment', 'card', 'Card', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2917, 1, 'en', 'plugins/payment/payment', 'address', 'Address', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2918, 1, 'en', 'plugins/payment/payment', 'could_not_get_stripe_token', 'Could not get Stripe token to make a charge.', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2919, 1, 'en', 'plugins/payment/payment', 'payment_id', 'Payment ID', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2920, 1, 'en', 'plugins/payment/payment', 'payment_methods', 'Payment methods', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2921, 1, 'en', 'plugins/payment/payment', 'transactions', 'Transactions', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2922, 1, 'en', 'plugins/payment/payment', 'payment_methods_description', 'Setup payment methods for website', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2923, 1, 'en', 'plugins/payment/payment', 'paypal_description', 'Customer can buy product and pay directly via PayPal', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2924, 1, 'en', 'plugins/payment/payment', 'use', 'Use', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2925, 1, 'en', 'plugins/payment/payment', 'stripe_description', 'Customer can buy product and pay directly using Visa, Credit card via Stripe', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2926, 1, 'en', 'plugins/payment/payment', 'edit', 'Edit', '2020-11-15 20:58:33', '2020-11-15 20:58:33'),
(2927, 1, 'en', 'plugins/payment/payment', 'settings', 'Settings', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2928, 1, 'en', 'plugins/payment/payment', 'activate', 'Activate', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2929, 1, 'en', 'plugins/payment/payment', 'deactivate', 'Deactivate', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2930, 1, 'en', 'plugins/payment/payment', 'update', 'Update', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2931, 1, 'en', 'plugins/payment/payment', 'configuration_instruction', 'Configuration instruction for :name', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2932, 1, 'en', 'plugins/payment/payment', 'configuration_requirement', 'To use :name, you need', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2933, 1, 'en', 'plugins/payment/payment', 'service_registration', 'Register with :name', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2934, 1, 'en', 'plugins/payment/payment', 'after_service_registration_msg', 'After registration at :name, you will have Client ID, Client Secret', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2935, 1, 'en', 'plugins/payment/payment', 'enter_client_id_and_secret', 'Enter Client ID, Secret into the box in right hand', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2936, 1, 'en', 'plugins/payment/payment', 'method_name', 'Method name', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2937, 1, 'en', 'plugins/payment/payment', 'please_provide_information', 'Please provide information', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2938, 1, 'en', 'plugins/payment/payment', 'client_id', 'Client ID', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2939, 1, 'en', 'plugins/payment/payment', 'client_secret', 'Client Secret', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2940, 1, 'en', 'plugins/payment/payment', 'secret', 'Secret', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2941, 1, 'en', 'plugins/payment/payment', 'stripe_key', 'Stripe Key', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2942, 1, 'en', 'plugins/payment/payment', 'stripe_secret', 'Stripe Secret', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2943, 1, 'en', 'plugins/payment/payment', 'stripe_after_service_registration_msg', 'After registration at :name, you will have Public, Secret keys', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2944, 1, 'en', 'plugins/payment/payment', 'stripe_enter_client_id_and_secret', 'Enter Public, Secret keys into the box in right hand', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2945, 1, 'en', 'plugins/payment/payment', 'pay_online_via', 'Pay online via :name', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2946, 1, 'en', 'plugins/payment/payment', 'sandbox_mode', 'Sandbox mode', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2947, 1, 'en', 'plugins/payment/payment', 'deactivate_payment_method', 'Deactivate payment method', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2948, 1, 'en', 'plugins/payment/payment', 'deactivate_payment_method_description', 'Do you really want to deactivate this payment method?', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2949, 1, 'en', 'plugins/payment/payment', 'agree', 'Agree', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2950, 1, 'en', 'plugins/payment/payment', 'name', 'Payments', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2951, 1, 'en', 'plugins/payment/payment', 'create', 'New payment', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2952, 1, 'en', 'plugins/payment/payment', 'go_back', 'Go back', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2953, 1, 'en', 'plugins/payment/payment', 'information', 'Information', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2954, 1, 'en', 'plugins/payment/payment', 'methods.paypal', 'PayPal', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2955, 1, 'en', 'plugins/payment/payment', 'methods.stripe', 'Stripe', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2956, 1, 'en', 'plugins/payment/payment', 'methods.cod', 'Cash on delivery (COD)', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2957, 1, 'en', 'plugins/payment/payment', 'methods.bank_transfer', 'Bank transfer', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2958, 1, 'en', 'plugins/payment/payment', 'statuses.pending', 'Pending', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2959, 1, 'en', 'plugins/payment/payment', 'statuses.completed', 'Completed', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2960, 1, 'en', 'plugins/payment/payment', 'statuses.refunding', 'Refunding', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2961, 1, 'en', 'plugins/payment/payment', 'statuses.refunded', 'Refunded', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2962, 1, 'en', 'plugins/payment/payment', 'statuses.fraud', 'Fraud', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2963, 1, 'en', 'plugins/payment/payment', 'statuses.failed', 'Failed', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2964, 1, 'en', 'plugins/payment/payment', 'payment_methods_instruction', 'Guide customers to pay directly. You can choose to pay by delivery or bank transfer', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2965, 1, 'en', 'plugins/payment/payment', 'payment_method_description', 'Payment guide - (Displayed on the notice of successful purchase and payment page)', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2966, 1, 'en', 'plugins/payment/payment', 'payment_via_cod', 'Cash on delivery (COD)', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2967, 1, 'en', 'plugins/payment/payment', 'payment_via_bank_transfer', 'Bank transfer', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2968, 1, 'en', 'plugins/payment/payment', 'payment_pending', 'Checkout successfully. Your payment is pending and will be checked by our staff.', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2969, 1, 'en', 'plugins/payment/payment', 'created_at', 'Created At', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2970, 1, 'en', 'plugins/payment/payment', 'payment_channel', 'Payment Channel', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2971, 1, 'en', 'plugins/payment/payment', 'total', 'Total', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2972, 1, 'en', 'plugins/payment/payment', 'status', 'Status', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2973, 1, 'en', 'plugins/payment/payment', 'default_payment_method', 'Default payment method', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2974, 1, 'en', 'plugins/payment/payment', 'turn_off_success', 'Turn off payment method successfully!', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2975, 1, 'en', 'plugins/payment/payment', 'saved_payment_method_success', 'Saved payment method successfully!', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2976, 1, 'en', 'plugins/payment/payment', 'saved_payment_settings_success', 'Saved payment settings successfully!', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2977, 1, 'en', 'plugins/payment/payment', 'payment_name', 'Name', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2978, 1, 'en', 'plugins/payment/payment', 'callback_url', 'Callback URL', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2979, 1, 'en', 'plugins/payment/payment', 'return_url', 'Return URL', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(2980, 1, 'en', 'plugins/payment/payment', 'payment_not_found', 'Payment not found!', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(3062, 1, 'en', 'plugins/simple-slider/simple-slider', 'create', 'New slider', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(3063, 1, 'en', 'plugins/simple-slider/simple-slider', 'edit', 'Edit slider', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(3064, 1, 'en', 'plugins/simple-slider/simple-slider', 'menu', 'Simple sliders', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(3065, 1, 'en', 'plugins/simple-slider/simple-slider', 'settings.title', 'Simple sliders', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(3066, 1, 'en', 'plugins/simple-slider/simple-slider', 'settings.description', 'Settings for Simple sliders', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(3067, 1, 'en', 'plugins/simple-slider/simple-slider', 'settings.using_assets', 'Using default assets?', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(3068, 1, 'en', 'plugins/simple-slider/simple-slider', 'settings.using_assets_description', 'If using assets option is enabled then below scripts will be auto added to front site.', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(3069, 1, 'en', 'plugins/simple-slider/simple-slider', 'add_new', 'Add new', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(3070, 1, 'en', 'plugins/simple-slider/simple-slider', 'save_sorting', 'Save sorting', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(3071, 1, 'en', 'plugins/simple-slider/simple-slider', 'key', 'Key', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(3072, 1, 'en', 'plugins/simple-slider/simple-slider', 'slide_items', 'Slide Items', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(3073, 1, 'en', 'plugins/simple-slider/simple-slider', 'update_slide_position_success', 'Updated slide position successfully!', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(3074, 1, 'en', 'plugins/simple-slider/simple-slider', 'create_new_slide', 'Create a new slide', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(3075, 1, 'en', 'plugins/simple-slider/simple-slider', 'edit_slide', 'Edit slide #:id', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(3076, 1, 'en', 'plugins/simple-slider/simple-slider', 'simple_slider_shortcode_name', 'Simple Slider', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(3077, 1, 'en', 'plugins/simple-slider/simple-slider', 'simple_slider_shortcode_description', 'Add a simple slider', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(3078, 1, 'en', 'plugins/social-login/social-login', 'settings.title', 'Social Login settings', '2020-11-15 20:58:34', '2020-11-15 20:58:34'),
(3079, 1, 'en', 'plugins/social-login/social-login', 'settings.description', 'Configure social login options', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3080, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.title', 'Facebook login settings', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3081, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.description', 'Enable/disable & configure app credentials for Facebook login', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3082, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.app_id', 'App ID', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3083, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.app_secret', 'App Secret', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3084, 1, 'en', 'plugins/social-login/social-login', 'settings.facebook.helper', 'Please go to https://developers.facebook.com to create new app update App ID, App Secret. Callback URL is :callback', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3085, 1, 'en', 'plugins/social-login/social-login', 'settings.google.title', 'Google login settings', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3086, 1, 'en', 'plugins/social-login/social-login', 'settings.google.description', 'Enable/disable & configure app credentials for Google login', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3087, 1, 'en', 'plugins/social-login/social-login', 'settings.google.app_id', 'App ID', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3088, 1, 'en', 'plugins/social-login/social-login', 'settings.google.app_secret', 'App Secret', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3089, 1, 'en', 'plugins/social-login/social-login', 'settings.google.helper', 'Please go to https://console.developers.google.com/apis/dashboard to create new app update App ID, App Secret. Callback URL is :callback', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3090, 1, 'en', 'plugins/social-login/social-login', 'settings.github.title', 'Github login settings', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3091, 1, 'en', 'plugins/social-login/social-login', 'settings.github.description', 'Enable/disable & configure app credentials for Github login', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3092, 1, 'en', 'plugins/social-login/social-login', 'settings.github.app_id', 'App ID', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3093, 1, 'en', 'plugins/social-login/social-login', 'settings.github.app_secret', 'App Secret', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3094, 1, 'en', 'plugins/social-login/social-login', 'settings.github.helper', 'Please go to https://github.com/settings/developers to create new app update App ID, App Secret. Callback URL is :callback', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3095, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.title', 'Linkedin login settings', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3096, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.description', 'Enable/disable & configure app credentials for Linkedin login', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3097, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.app_id', 'App ID', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3098, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.app_secret', 'App Secret', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3099, 1, 'en', 'plugins/social-login/social-login', 'settings.linkedin.helper', 'Please go to https://www.linkedin.com/developers/apps/new to create new app update App ID, App Secret. Callback URL is :callback', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3100, 1, 'en', 'plugins/social-login/social-login', 'settings.enable', 'Enable?', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3101, 1, 'en', 'plugins/social-login/social-login', 'menu', 'Social Login', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3102, 1, 'en', 'plugins/testimonials/forms', 'name', 'Customer name', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3103, 1, 'en', 'plugins/testimonials/forms', 'company', 'Company/Working place', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3104, 1, 'en', 'plugins/testimonials/forms', 'avatar', 'Avatar', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3105, 1, 'en', 'plugins/testimonials/forms', 'title', 'Title', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3106, 1, 'en', 'plugins/testimonials/forms', 'content', 'Content', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3107, 1, 'en', 'plugins/testimonials/forms', 'publish', 'Publish', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3108, 1, 'en', 'plugins/testimonials/forms', 'unpublish', 'Unpublish', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3109, 1, 'en', 'plugins/testimonials/testimonials', 'name', 'Testimonials', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3110, 1, 'en', 'plugins/testimonials/testimonials', 'create', 'New testimonials', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3111, 1, 'en', 'plugins/testimonials/testimonials', 'edit', 'Edit testimonials', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3122, 1, 'en', 'plugins/translation/translation', 'translations', 'Translations', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3123, 1, 'en', 'plugins/translation/translation', 'translations_description', 'Translate all words in system.', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3124, 1, 'en', 'plugins/translation/translation', 'export_warning', 'Warning, translations are not visible until they are exported back to the resources/lang file, using \'php artisan cms:translations:export\' command or publish button.', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3125, 1, 'en', 'plugins/translation/translation', 'import_done', 'Done importing, processed :counter items! Reload this page to refresh the groups!', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3126, 1, 'en', 'plugins/translation/translation', 'translation_manager', 'Translations Manager', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3127, 1, 'en', 'plugins/translation/translation', 'done_publishing', 'Done publishing the translations for group', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3128, 1, 'en', 'plugins/translation/translation', 'append_translation', 'Append new translations', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3129, 1, 'en', 'plugins/translation/translation', 'replace_translation', 'Replace existing translations', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3130, 1, 'en', 'plugins/translation/translation', 'import_group', 'Import group', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3131, 1, 'en', 'plugins/translation/translation', 'confirm_publish_group', 'Are you sure you want to publish the translations group \":group\"? This will overwrite existing language files.', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3132, 1, 'en', 'plugins/translation/translation', 'publish_translations', 'Publish translations', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3133, 1, 'en', 'plugins/translation/translation', 'back', 'Back', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3134, 1, 'en', 'plugins/translation/translation', 'edit_title', 'Enter translation', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3135, 1, 'en', 'plugins/translation/translation', 'choose_group_msg', 'Choose a group to display the group translations. If no groups are visible, make sure you have imported the translations.', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3136, 1, 'en', 'plugins/translation/translation', 'choose_a_group', 'Choose a group', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3137, 1, 'en', 'plugins/translation/translation', 'locales', 'Locales', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3138, 1, 'en', 'plugins/translation/translation', 'theme-translations', 'Theme translations', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3139, 1, 'en', 'plugins/translation/translation', 'admin-translations', 'Admin translations', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3140, 1, 'en', 'plugins/translation/translation', 'translate_from', 'Translate from', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3141, 1, 'en', 'plugins/translation/translation', 'to', 'to', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3142, 1, 'en', 'plugins/translation/translation', 'no_other_languages', 'No other language to translate!', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3143, 1, 'en', 'plugins/translation/translation', 'edit', 'Edit', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3144, 1, 'en', 'plugins/translation/translation', 'delete', 'Delete', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3145, 1, 'en', 'plugins/translation/translation', 'locale', 'Locale', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3146, 1, 'en', 'plugins/translation/translation', 'name', 'Name', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3147, 1, 'en', 'plugins/translation/translation', 'default_locale', 'Default locale?', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3148, 1, 'en', 'plugins/translation/translation', 'actions', 'Actions', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3149, 1, 'en', 'plugins/translation/translation', 'choose_language', 'Choose language', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3150, 1, 'en', 'plugins/translation/translation', 'add_new_language', 'Add new language', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3151, 1, 'en', 'plugins/translation/translation', 'select_language', 'Select language', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3152, 1, 'en', 'plugins/translation/translation', 'flag', 'Flag', '2020-11-15 20:58:35', '2020-11-15 20:58:35'),
(3153, 1, 'en', 'plugins/translation/translation', 'confirm_delete_message', 'Do you really want to delete this locale? It will delete all files/folders for this local in /resources/lang!', '2020-11-15 20:58:35', '2020-11-15 20:58:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` int(10) UNSIGNED DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `permissions`, `last_login`, `first_name`, `last_name`, `username`, `avatar_id`, `super_user`, `manage_supers`) VALUES
(1, 'contact@ashleyhdf.co.uk', NULL, '$2y$10$65K4FRYjs4kQH49c2/q3JetsjVjU7JIvGV5cuFVCGRuUtXMOwExg2', 'nf0onCh4CQfngtj6qWI28HdYzGjaqLb1TmnCPAWGX4lTYUJHeK9flc5Y9NVj', '2020-06-12 18:23:22', '2021-05-02 07:59:48', NULL, '2021-05-02 07:59:48', 'System', 'Admin', 'ashley', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_meta`
--

CREATE TABLE `user_meta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_meta`
--

INSERT INTO `user_meta` (`id`, `key`, `value`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'site-locale', 'en', 1, '2020-06-26 22:05:02', '2020-06-26 22:05:48'),
(2, 'admin-theme', 'darkblue', 1, '2020-11-19 19:28:43', '2021-04-21 00:38:49');

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `widget_id`, `sidebar_id`, `theme`, `position`, `data`, `created_at`, `updated_at`) VALUES
(1, 'CustomMenuWidget', 'footer_sidebar', 'september', 1, '{\"id\":\"CustomMenuWidget\",\"name\":\"Customer services\",\"menu_id\":\"customer-services\"}', '2020-11-07 02:12:50', '2020-11-07 02:12:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activations_user_id_index` (`user_id`);

--
-- Indexes for table `audit_histories`
--
ALTER TABLE `audit_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_histories_user_id_index` (`user_id`),
  ADD KEY `audit_histories_module_index` (`module`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_replies`
--
ALTER TABLE `contact_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  ADD KEY `dashboard_widget_settings_widget_id_index` (`widget_id`);

--
-- Indexes for table `ec_brands`
--
ALTER TABLE `ec_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_cart`
--
ALTER TABLE `ec_cart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Indexes for table `ec_currencies`
--
ALTER TABLE `ec_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_customers`
--
ALTER TABLE `ec_customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ec_customers_email_unique` (`email`);

--
-- Indexes for table `ec_customer_addresses`
--
ALTER TABLE `ec_customer_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_customer_password_resets`
--
ALTER TABLE `ec_customer_password_resets`
  ADD KEY `ec_customer_password_resets_email_index` (`email`),
  ADD KEY `ec_customer_password_resets_token_index` (`token`);

--
-- Indexes for table `ec_discounts`
--
ALTER TABLE `ec_discounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ec_discounts_code_unique` (`code`);

--
-- Indexes for table `ec_discount_customers`
--
ALTER TABLE `ec_discount_customers`
  ADD PRIMARY KEY (`discount_id`,`customer_id`);

--
-- Indexes for table `ec_discount_products`
--
ALTER TABLE `ec_discount_products`
  ADD PRIMARY KEY (`discount_id`,`product_id`);

--
-- Indexes for table `ec_discount_product_collections`
--
ALTER TABLE `ec_discount_product_collections`
  ADD PRIMARY KEY (`discount_id`,`product_collection_id`);

--
-- Indexes for table `ec_flash_sales`
--
ALTER TABLE `ec_flash_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_grouped_products`
--
ALTER TABLE `ec_grouped_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_orders`
--
ALTER TABLE `ec_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_order_addresses`
--
ALTER TABLE `ec_order_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_order_histories`
--
ALTER TABLE `ec_order_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_order_product`
--
ALTER TABLE `ec_order_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_products`
--
ALTER TABLE `ec_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_attributes`
--
ALTER TABLE `ec_product_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_attribute_sets`
--
ALTER TABLE `ec_product_attribute_sets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_categories`
--
ALTER TABLE `ec_product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_category_product`
--
ALTER TABLE `ec_product_category_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_product_category_product_category_id_index` (`category_id`),
  ADD KEY `ec_product_category_product_product_id_index` (`product_id`);

--
-- Indexes for table `ec_product_collections`
--
ALTER TABLE `ec_product_collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_collection_products`
--
ALTER TABLE `ec_product_collection_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_product_collection_products_product_collection_id_index` (`product_collection_id`),
  ADD KEY `ec_product_collection_products_product_id_index` (`product_id`);

--
-- Indexes for table `ec_product_cross_sale_relations`
--
ALTER TABLE `ec_product_cross_sale_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_product_cross_sale_relations_from_product_id_index` (`from_product_id`),
  ADD KEY `ec_product_cross_sale_relations_to_product_id_index` (`to_product_id`);

--
-- Indexes for table `ec_product_related_relations`
--
ALTER TABLE `ec_product_related_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_product_related_relations_from_product_id_index` (`from_product_id`),
  ADD KEY `ec_product_related_relations_to_product_id_index` (`to_product_id`);

--
-- Indexes for table `ec_product_tags`
--
ALTER TABLE `ec_product_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_tag_product`
--
ALTER TABLE `ec_product_tag_product`
  ADD PRIMARY KEY (`product_id`,`tag_id`),
  ADD KEY `ec_product_tag_product_product_id_index` (`product_id`),
  ADD KEY `ec_product_tag_product_tag_id_index` (`tag_id`);

--
-- Indexes for table `ec_product_up_sale_relations`
--
ALTER TABLE `ec_product_up_sale_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ec_product_up_sale_relations_from_product_id_index` (`from_product_id`),
  ADD KEY `ec_product_up_sale_relations_to_product_id_index` (`to_product_id`);

--
-- Indexes for table `ec_product_variations`
--
ALTER TABLE `ec_product_variations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_variation_items`
--
ALTER TABLE `ec_product_variation_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_with_attribute`
--
ALTER TABLE `ec_product_with_attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_product_with_attribute_set`
--
ALTER TABLE `ec_product_with_attribute_set`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_reviews`
--
ALTER TABLE `ec_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_shipments`
--
ALTER TABLE `ec_shipments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_shipment_histories`
--
ALTER TABLE `ec_shipment_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_shipping`
--
ALTER TABLE `ec_shipping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_shipping_rules`
--
ALTER TABLE `ec_shipping_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_shipping_rule_items`
--
ALTER TABLE `ec_shipping_rule_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_store_locators`
--
ALTER TABLE `ec_store_locators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_taxes`
--
ALTER TABLE `ec_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_wish_lists`
--
ALTER TABLE `ec_wish_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galleries_user_id_index` (`user_id`);

--
-- Indexes for table `gallery_meta`
--
ALTER TABLE `gallery_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gallery_meta_reference_id_index` (`reference_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `media_files`
--
ALTER TABLE `media_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_files_user_id_index` (`user_id`);

--
-- Indexes for table `media_folders`
--
ALTER TABLE `media_folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_folders_user_id_index` (`user_id`);

--
-- Indexes for table `media_settings`
--
ALTER TABLE `media_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_slug_unique` (`slug`);

--
-- Indexes for table `menu_locations`
--
ALTER TABLE `menu_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_nodes_menu_id_index` (`menu_id`),
  ADD KEY `menu_nodes_parent_id_index` (`parent_id`),
  ADD KEY `menu_nodes_related_id_index` (`reference_id`);

--
-- Indexes for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meta_boxes_content_id_index` (`reference_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`),
  ADD KEY `roles_created_by_index` (`created_by`),
  ADD KEY `roles_updated_by_index` (`updated_by`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_users_user_id_index` (`user_id`),
  ADD KEY `role_users_role_id_index` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `simple_sliders`
--
ALTER TABLE `simple_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `simple_slider_items`
--
ALTER TABLE `simple_slider_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slugs`
--
ALTER TABLE `slugs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `user_meta`
--
ALTER TABLE `user_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_meta_user_id_index` (`user_id`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `audit_histories`
--
ALTER TABLE `audit_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `contact_replies`
--
ALTER TABLE `contact_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ec_brands`
--
ALTER TABLE `ec_brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ec_currencies`
--
ALTER TABLE `ec_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ec_customers`
--
ALTER TABLE `ec_customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `ec_customer_addresses`
--
ALTER TABLE `ec_customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ec_discounts`
--
ALTER TABLE `ec_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_flash_sales`
--
ALTER TABLE `ec_flash_sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_grouped_products`
--
ALTER TABLE `ec_grouped_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_orders`
--
ALTER TABLE `ec_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ec_order_addresses`
--
ALTER TABLE `ec_order_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `ec_order_histories`
--
ALTER TABLE `ec_order_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `ec_order_product`
--
ALTER TABLE `ec_order_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `ec_products`
--
ALTER TABLE `ec_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=613;

--
-- AUTO_INCREMENT for table `ec_product_attributes`
--
ALTER TABLE `ec_product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `ec_product_attribute_sets`
--
ALTER TABLE `ec_product_attribute_sets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ec_product_categories`
--
ALTER TABLE `ec_product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ec_product_category_product`
--
ALTER TABLE `ec_product_category_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=594;

--
-- AUTO_INCREMENT for table `ec_product_collections`
--
ALTER TABLE `ec_product_collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ec_product_collection_products`
--
ALTER TABLE `ec_product_collection_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=661;

--
-- AUTO_INCREMENT for table `ec_product_cross_sale_relations`
--
ALTER TABLE `ec_product_cross_sale_relations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_product_related_relations`
--
ALTER TABLE `ec_product_related_relations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=955;

--
-- AUTO_INCREMENT for table `ec_product_tags`
--
ALTER TABLE `ec_product_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `ec_product_up_sale_relations`
--
ALTER TABLE `ec_product_up_sale_relations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_product_variations`
--
ALTER TABLE `ec_product_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=434;

--
-- AUTO_INCREMENT for table `ec_product_variation_items`
--
ALTER TABLE `ec_product_variation_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=477;

--
-- AUTO_INCREMENT for table `ec_product_with_attribute`
--
ALTER TABLE `ec_product_with_attribute`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `ec_product_with_attribute_set`
--
ALTER TABLE `ec_product_with_attribute_set`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `ec_reviews`
--
ALTER TABLE `ec_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `ec_shipments`
--
ALTER TABLE `ec_shipments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_shipment_histories`
--
ALTER TABLE `ec_shipment_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_shipping`
--
ALTER TABLE `ec_shipping`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ec_shipping_rules`
--
ALTER TABLE `ec_shipping_rules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ec_shipping_rule_items`
--
ALTER TABLE `ec_shipping_rule_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_store_locators`
--
ALTER TABLE `ec_store_locators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ec_taxes`
--
ALTER TABLE `ec_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ec_wish_lists`
--
ALTER TABLE `ec_wish_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery_meta`
--
ALTER TABLE `gallery_meta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media_files`
--
ALTER TABLE `media_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=757;

--
-- AUTO_INCREMENT for table `media_folders`
--
ALTER TABLE `media_folders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `media_settings`
--
ALTER TABLE `media_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_locations`
--
ALTER TABLE `menu_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=323;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_users`
--
ALTER TABLE `role_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=361;

--
-- AUTO_INCREMENT for table `simple_sliders`
--
ALTER TABLE `simple_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `simple_slider_items`
--
ALTER TABLE `simple_slider_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `slugs`
--
ALTER TABLE `slugs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1540;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3154;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_meta`
--
ALTER TABLE `user_meta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
