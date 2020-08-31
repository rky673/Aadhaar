-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2019 at 01:00 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aadhar`
--
CREATE DATABASE IF NOT EXISTS `aadhar` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `aadhar`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `aadhar_no` int(8) NOT NULL,
  `password` varchar(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`aadhar_no`, `password`, `date`) VALUES
(10000000, 'INDIA', '2019-11-07 17:41:16'),
(10000030, '43829458', '2019-11-13 19:45:05'),
(10000031, '86089243', '2019-11-14 08:20:17');

-- --------------------------------------------------------

--
-- Table structure for table `citizen`
--

CREATE TABLE `citizen` (
  `aadhar_no` int(8) NOT NULL,
  `name` varchar(25) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone_no` bigint(10) NOT NULL,
  `address` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `citizen`
--

INSERT INTO `citizen` (`aadhar_no`, `name`, `email`, `phone_no`, `address`, `date`) VALUES
(10000000, 'INDIA', 'aadhar@gov.in', 9999999999, 'INDIA', '2019-11-07 17:38:45'),
(10000030, 'bhaskar', 'yadavbhaskar1603@gmail.com', 6265698492, 'iit indore', '2019-11-13 19:45:05'),
(10000031, 'accidentalcoder', 'cse180001012@gmail.com', 7886874563, 'iit indore', '2019-11-14 08:20:17');

--
-- Triggers `citizen`
--
DELIMITER $$
CREATE TRIGGER `admin` AFTER DELETE ON `citizen` FOR EACH ROW DELETE from admin where(aadhar_no=OLD.aadhar_no)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `b` AFTER INSERT ON `citizen` FOR EACH ROW INSERT INTO status VALUES(NEW.aadhar_no,null)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `death_record` AFTER DELETE ON `citizen` FOR EACH ROW INSERT INTO death_record VALUES(OLD.aadhar_no,OLD.name,OLD.email,OLD.phone_no,OLD.address,OLD.date,NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `p` AFTER DELETE ON `citizen` FOR EACH ROW DELETE from status WHERE(aadhar_no=OLD.aadhar_no)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `passport` AFTER INSERT ON `citizen` FOR EACH ROW INSERT INTO passport VALUES(NEW.aadhar_no,null,null,null,null)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `visa` AFTER DELETE ON `citizen` FOR EACH ROW DELETE FROM visa WHERE(aadhar_no=OLD.aadhar_no)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `death_record`
--

CREATE TABLE `death_record` (
  `aadhar_no` int(8) NOT NULL,
  `name` varchar(25) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone_no` bigint(10) NOT NULL,
  `address` text NOT NULL,
  `dateofreg` datetime NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `death_record`
--

INSERT INTO `death_record` (`aadhar_no`, `name`, `email`, `phone_no`, `address`, `dateofreg`, `date`) VALUES
(10000028, 'bhaskar', 'yadavbhaskar1603@gmail.com', 6265698492, 'iiti,indore\r\n', '2019-11-13 22:25:34', '2019-11-13 19:09:07'),
(10000029, 'ashutosh patel', 'cse180001012@gmail.com', 9999999990, 'mahakal,ujjain', '2019-11-13 23:22:06', '2019-11-13 19:12:12');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `sno` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`sno`, `title`, `description`, `content`, `date`) VALUES
(166, 'India vs Bangladesh Live Score, 1st Test, Day 2: Mayank takes India forward after Kohli duck - Times of India', 'Cricket News: Check live score, ball-by-ball commentary, cricket scorecard of 1st Test match between India and Bangladesh on Times of India', NULL, '2019-11-15 07:31:23'),
(167, 'Amitabh Bachchan shares an old letter written to him by young Abhishek, wins the internet - Hindustan Times', 'Amitabh Bachchan has shared an old letter, written by his son Abhishek when the latter was a child. Abhishek not only expresses love for his father but also assures him of taking care of his mother and sister in the letter.', 'Actor Amitabh Bachchan often shares throwback pictures and videos of his family. Thursday was no different as he shared an old letter, written by son Abhishek, when the latter was just a boy. Needless to say, Amitabh’s fans loved it for its warmth.\r\nSharing i… [+2163 chars]', '2019-11-15 07:31:23'),
(168, 'How to improve your hearing - Deccan Chronicle', 'Expert recommendation on how to improve hearing.', 'Washington: Researchers discovered a method that could possibly be used to improve auditory perception in situations where sounds are difficult to distinguish. Despite the importance of hearing in human communication, we still understand very little of how ac… [+2365 chars]', '2019-11-15 07:31:23'),
(169, 'Supreme Court holds Singh brothers, Fortis Healthcare guilty of contempt - CNBCTV18', 'Get latest Healthcare online at cnbctv18.com', 'Supreme Court (SC), in its ruling on Friday, held Singh brothers, Fortis Healthcare guilty of contempt. The court said Malvinder and Shivinder Singh can \'purge\' contempt by depositing Rs 1,175 crore each.\r\nThe SC also refused to lift stay on IHH Healthcare\'s … [+1125 chars]', '2019-11-15 07:31:23'),
(170, 'Control HIV infection with antiretroviral therapies and reduce sudden heart attack - The Asian Age', 'Studies reveal that HIV infection likely to increase risk for sudden cardiac death.', 'Studies reveal that HIV infection likely to increase risk for sudden cardiac death.Washington: In a recent comparative study between men with and without HIV, it has been found that there is more variability of QT interval in men living with the virus, which … [+3984 chars]', '2019-11-15 07:31:23'),
(171, 'China completes Mars landing experiment, to launch mission in 2020 - WION', 'The mission intends to conduct a global and comprehensive exploration of Mars and make detailed surveys of key areas of the Martian surface', 'After announcing on Thursday that it would launch its first Mars exploration mission in 2020, China completed the first experiment in a series of many to come. The experiment included simulating a probe hovering, avoiding obstacles, and descending to Mars in … [+2969 chars]', '2019-11-15 07:31:23'),
(172, 'Statins improve long term outcomes for patients with heart disease - The Asian Age', 'Study shows nudging heart patients to take statins leads to better outcomes.', 'Study shows nudging heart patients to take statins leads to better outcomes.Washington: In a recent study it has been found that statins that are an effective medication for treating patients with heart disease is consumed by only six per cent. The study was … [+2652 chars]', '2019-11-15 07:31:23'),
(173, '\"There Is No India Without Kashmir\": Indian Columnist At US Congress - NDTV News', 'India has successfully defeated insurgencies in Punjab and the Northeast and it is now time to strengthen New Delhi\'s fight against insurgencies in Kashmir, columnist Sunanda Vashisht told a US Congressional hearing on Human Rights in Washington on Thursday. …', 'Sunanda Vashisht also called for international cooperation in India\'s fight against terrorism in Kashmir.New Delhi/Washington: India has successfully defeated insurgencies in Punjab and the Northeast and it is now time to strengthen New Delhi\'s fight against … [+4778 chars]', '2019-11-15 07:31:23'),
(174, 'Will Arvind Kejriwal Govt Extend Odd-Even? Delhi Air Quality Plummets to 700-Mark on Last Day of Scheme - News18', 'At 7 am on Friday morning, the air quality in several areas of the Delhi and NCR, including Pusa Road (777), Dwarka Sector 8 (930), Pragati Vihar (733), Noida Sector 125 (665), Noida Sector 62 (538) and Chanakyapuri, crossed the ‘severe-plus’ category.', 'New Delhi: Delhiites woke up to thick blanket of smog for the fifth consecutive day on Friday with air quality in several areas dipping to severe-plus pollution levels even as the Delhi government kept up suspense on extending the odd-even car rationing schem… [+2158 chars]', '2019-11-15 07:31:23'),
(175, 'Bharti Airtel share price gains despite dismal Q2 numbers; UBS retains buy - Moneycontrol.com', 'Global research firms have a mixed view on the stock price after its dismal Q2 numbers.', 'Telecom major Bharti Airtel share prices were up over a percent in the morning trade on November 15. The company posted a massive loss of Rs 23,044.9 crore in Q2FY20, dented by exceptional loss for license fee and spectrum usage charge (SUC) especially after … [+3899 chars]', '2019-11-15 07:31:23'),
(176, 'Why Supreme Court ruling today on Essar Steel will test the IBC - Livemint', 'Essar Steel, promoted by the Ruias, was admitted to the National Company Law Tribunal, Ahmedabad, in August 2017.The apex court will decide how the resolution proceeds are to be split between different classes of creditors', 'Mumbai: The Supreme Courts final decision on the resolution of bankrupt Essar Steel on Friday will have far-reaching ramifications for Indias insolvency code. The apex court will decide how the resolution proceeds are to be split between different classes of … [+3372 chars]', '2019-11-15 07:31:23'),
(177, 'NASA warned to keep astronaut\'s safety as top priority during their crewed spaceflights - Firstpost', 'A seat on Boeing’s Starliner capsule will cost $90 million, almost double the price of SpaceX’s crew Dragon.', 'The Associated PressNov 15, 2019 09:24:37 IST\r\nNASA auditors warned Thursday the space agency faces significant safety and technical challenges that need to be solved before astronauts fly in private capsules.\r\nIn its report, NASAs inspector general office no… [+2737 chars]', '2019-11-15 07:31:23'),
(178, 'Walmart takes a $290 million impairment on Jabong - Economic Times', 'Flipkart has been struggling to figure out a definitive long-term strategy for the fashion portal.', 'BENGALURU: US retail behemoth Walmart incurred a non-cash impairment charge of $290 million on account of it writing off its investment in fashion portal Jabong, Chief Financial Officer Brett Biggs disclosed in an earnings call.\r\nWhen it bought Flipkart last … [+2437 chars]', '2019-11-15 07:31:23'),
(179, 'Graeme Smith turns down Cricket South Africa director role - Hindustan Times', 'Smith confirmed that he had been interviewed by CSA for a position which would effectively have put him in charge of the national team, who have endured a miserable set of results since losing a home Test series against Sri Lanka in February.', 'Former South African captain Graeme Smith has withdrawn his interest in becoming Cricket South Africa’s (CSA) director of cricket. In a statement issued on his Twitter feed on Thursday, Smith said he was not confident that he would have been given the freedom… [+2130 chars]', '2019-11-15 07:31:23'),
(180, 'CONFIRMED: Manushi Chhillar to debut in Prithviraj as Sanyogita - Bollywood Hungama', 'CONFIRMED: Manushi Chhillar to debut in Prithviraj as Sanyogita. Latest Bollywood News, Bollywood Celebrity News, Breaking News, Celeb News, Celebrities News at Bollywood Hungama.com', 'Mis World 2017 Manushi Chhillar can be best described as an ethereal beauty. This gorgeous 22-year-old girl has been one of the most coveted new faces sought after by top Bollywood film-makers. It has been long rumoured that she is set to be making her big de… [+3182 chars]', '2019-11-15 07:31:23'),
(181, 'Vivo S5 launched with punch-hole display, quad rear cameras: Specs and price - India Today', 'Considering the Vivo S1 made it to India there are high chances that the Vivo S5 may also hit the market. However, Vivo is yet to reveal official India launch details of the new Vivo S5.', 'Vivo S5 -- the successor to Vivo S1 - finally goes official. The company launches the mid-range smartphone -- Vivo S5 -- at an event in Beijing, China. Similar to the previous Vivo phones, the new Vivo S5 also looks innovative in terms of design. The phone co… [+2403 chars]', '2019-11-15 07:31:23'),
(182, 'Like cricket, anything possible in politics: Gadkari on Maharashtra govt formation - Times of India', 'India News: Nitin Gadkari said on Thursday that no matter who forms the government in Maharashtra, the developmental projects rolled out by the previous regime wo', 'Copyright © 2019 Bennett, Coleman &amp; Co. Ltd. All rights reserved. For reprint rights: Times Syndication Service', '2019-11-15 07:31:23'),
(183, 'IndiGo run by board; if there’s anyone I talk to, it’s Chairman: Ronojoy Dutta - Economic Times', 'Ronojoy Dutta said the management is insulated from the promoters & is professionally run by the board.', 'Ronojoy Dutta, CEO, Interglobe Aviation, said there’s no overcapacity in the market and squarely blamed the low fares on new airlines which have pushed the entire sector to losses. In an interview with ET’s Mihir Mishra, Dutta said the management is insulated… [+4089 chars]', '2019-11-15 07:31:23'),
(184, 'DeepVeer first Anniversary: After Tirupati, Ranveer Singh and Deepika Padukone seek blessings at the Gold - Times of India', 'After offering prayers at Tirupati Balaji, the power couple Ranveer Singh and Deepika Padukone jetted off to Punjab', NULL, '2019-11-15 07:31:23'),
(185, 'Republic Day 2020: Who is Jair Bolsonaro, the man who will be Chief Guest? - The Indian Express', 'For many years, Bolsonaro had been on the fringes of Brazilian politics, but was suddenly propelled to prominence after a major corruption scandal-tainted the image of the country’s mainstream political class.', 'Brazil’s President Jair Bolsonaro (AP Photo/Eraldo Peres)\r\nOn Wednesday, Brazilian President Jair Bolsonaro agreed to be the Chief Guest at Indias 71st Republic Day celebrations. Prime Minister Narendra Modi, who is currently in Brazil for the 11th BRICS Summ… [+2996 chars]', '2019-11-15 07:31:23'),
(186, 'On Camera, GoAir Plane Strays, Takes Off From Grass. Engine Stalled Twice - NDTV', 'Three days after 180 passengers on board GoAir flight G8-811D experienced a close shave with disaster fresh details about the incident have emerged', 'Bengaluru: Three days after 180 passengers on board GoAir flight G8-811D from Nagpur to Bengaluru experienced a close shave with disaster, fresh details about the incident have emerged. According to a Director General of Civil Aviation (DGCA) note accessed by… [+2391 chars]', '2019-11-15 09:47:31'),
(187, 'Infinix S5 Lite With Hole-Punch Display, Triple Rear Cameras Launched: Price in India, Specifications - NDTV', 'Infinix S5 Lite will go on sale in India starting November 22 via Flipkart.', 'Infinix S5 Lite was launched in India on Friday, the latest smartphone from the Transsion Holdings-owned brand. As the name clearly suggests, the Infinix S5 Lite is a watered-down version of the Infinix S5 that went official last month, but retains its hole-p… [+2215 chars]', '2019-11-15 09:47:31'),
(188, 'Process has begun for government formation, no question of mid-term elections: Sharad Pawar - Times of India', 'India News:  Amid talks between Shiv Sena, Congress and NCP to form a non-BJP government in Maharashtra, Nationalist Congress Party chief Sharad Pawar on Friday r', 'Copyright © 2019 Bennett, Coleman &amp; Co. Ltd. All rights reserved. For reprint rights: Times Syndication Service', '2019-11-15 09:47:31'),
(189, '\"Tell Your Government To Read\" Sabarimala Dissent Order: Justice Nariman To Solicitor General Tushar Mehta - NDTV News', 'Sabarimala case: Justice RF Nariman of the Supreme Court said the government must read the \"extremely important dissent\" order.', 'Justice Nariman was part of the five-judge Constitution bench in the Sabarimala case.New Delhi: Justice RF Nariman of the Supreme Court on Friday said the government must read the \"extremely important dissent\" order in the Sabarimala case. Justice Nariman had… [+1118 chars]', '2019-11-15 09:47:31'),
(190, 'Study shows nudging heart patients to take statins leads to better outcomes - ETHealthworld.com', 'The study which was aimed for heart specialists from around the world found that simple nudges in the form of texts, emails, and phone calls, not only help patients fill that first statin prescription but also continue to help them take their medications over…', 'Washington D.C: In a recent study it has been found that statins that is an effective medication for treating patients with heart disease is consumed by only six per cent. The study was discussed in the meeting, \'2019 American Heart Association Scientific Ses… [+2562 chars]', '2019-11-15 09:47:31'),
(191, '4-min hearing, 10 notices and note on silence on CJI Ranjan Gogoi’s last day at work - Hindustan Times', 'Chief Justice of India Ranjan Gogoi retires on November 17. He will be succeeded by Justice SA Bobde.', 'On his last day at work, Chief Justice of India Ranjan Gogoi sat in court no. 1 for 4 minutes with his successor SA Bobde by his side, issued notices in all ten cases presented before him and penned a note where he spoke of the judiciary’s need to ‘maintain s… [+1442 chars]', '2019-11-15 09:47:31'),
(192, 'Voda’s pain, Bharti’s gain! Why is Airtel rallying despite big Q2 loss? - Economic Times', 'Airtel will be in a position to take up nearly 40 per cent of the ground ceded by Vodafone Idea.', 'NEW DELHI: Vodafone Idea and Bharti Airtel reported a combined loss of Rs 74,000 crore on Thursday, the biggest ever for both telecom firms, as they made provisions following the recent Supreme Court ruling on adjusted gross revenue (AGR).\r\nBut shares of Bhar… [+2874 chars]', '2019-11-15 09:47:31'),
(193, '\'This is no way to treat citizens\': SC dismisses ED’s plea against DK Shivakumar’s bail - The News Minute', 'In relief to former Karnataka Minister and Congress strongman DK Shivakumar, the Supreme Court on Friday dismissed a plea filed by the Enforcement Directorate challenging his bail granted by the Delhi High Court. According to reports, the top court had noted …', 'In relief to former Karnataka Minister and Congress strongman DK Shivakumar, the Supreme Court on Friday dismissed a plea filed by the Enforcement Directorate challenging his bail granted by the Delhi High Court.\r\nAccording to reports, the top court had noted… [+2082 chars]', '2019-11-15 09:47:31'),
(194, 'Essar Steel insolvency: Supreme Court sets aside NCLAT judgement, gives upper hand to banks - Moneycontrol.com', 'As per the Supreme Court, the ultimate discretion on distribution of funds is with the Committee of creditors.', 'Ruling on the long fought Essar Steel insolvency case, the Supreme Court on November 15 set aside NCLAT judgement and said that the ultimate discretion on distribution of funds was with the Committee of creditors.\r\nThe Committee of Creditors (COC) consists of… [+3131 chars]', '2019-11-15 09:47:31'),
(195, 'Daiichi case: Supreme Court holds Singh brothers guilty of contempt - Times of India', 'India Business News: The SC on Friday pronounced former Ranbaxy promoters Malvinder Singh & Shivinder Singh guilty in a case filed by Japanese firm Daiichi Sankyo. Daiichi', NULL, '2019-11-15 09:47:31'),
(196, '\"Better Than Rishabh Pant\": Ravichandran Ashwin Wows Fans By Batting Left-Handed. Watch - NDTV Sports', 'Fans poked fun at Rishabh Pant after watching Ravichandran Ashwin batting \"left-handed\".', 'Ravichandran Ashwin has been India\'s go-to bowler in the Test format, especially at home. Even with bat, Ravichandran Ashwin has time and again played some crucial knocks. Ashwin, who has four Test hundreds to his name, was seen batting left-handed on the ope… [+1337 chars]', '2019-11-15 09:47:31'),
(197, 'Deepika Padukone and Ranveer Singh visit the Golden Temple on their first wedding anniversary - Vogue India', 'Celebrating their first wedding anniversary on an auspicious note, the couple attended the morning aarti at the Golden Temple in Amritsar post their visit to Tirupati. Here\'s everything you missed', 'Time passes quick when you\'re happy. Bollywood stars Deepika Padukone and Ranveer Singh celebrated their very first wedding anniversary this week. The two tied the knot last year in a private ceremony at the scenic Lake Como, Italy. Following an outdoor mehan… [+2396 chars]', '2019-11-15 09:47:31'),
(198, 'Epigenetic biomarkers can now detect male infertility - The Asian Age', 'Study finds new way to diagnose male infertility.', 'Study finds new way to diagnose male infertility.Washington: Detecting infertility in men won\'t take a year or longer of trial, as a study found a reliable method of screening and figuring out which treatment options will work best for patients. Michael Skinn… [+2575 chars]', '2019-11-15 09:47:31'),
(199, '\'Kashmir Saw ISIS-Level Horror Much Before West Was Introduced to it\': Indian Writer Tells US Congress - News18', 'As Sunanda Vashisht, a Kashmiri pundit, sought more attention the issue of terrorism in the Valley, she said, \'India is not just a 70-year-old identity, but a 5,000-year-old civilisation. There is no India without Kashmir, and no Kashmir without India.\'', 'Kashmir witnessed horror and brutality similar to the kind inflicted by the Islamic State in Syria, a long time before the West and other international communities were introduced to the brutalities of radical Islamic terror, political commentator and writer … [+2985 chars]', '2019-11-15 09:47:31'),
(200, 'Sensex rises 300 points, Bharti Airtel shares surge 7% - Livemint', 'Most Asian markets are higher today.SBI, Tata Motors, ICICI Bank, M&M, HUL and RIL', 'Indian markets were firm today, tracking higher Asian markets. The Sensex rose as much as 364 points while Nifty was back above 11,950. Bharti Airtel surged 7% to be the top gainer in the Sense pack. Among other gainers, SBI, Tata Motors, ICICI Bank, M&amp;M,… [+1622 chars]', '2019-11-15 09:47:31'),
(201, 'Patent designs for the Xiaomi’s clamshell foldable phone appear - GSMArena.com news - GSMArena.com', 'Brings the October security patch along with other changes.', 'A set of patent images have surfaced from the CNIPA (China National Intellectual Property Administration), revealing Xiaomis possible plans for a foldable clamshell smartphone. Although the patents are only now available, they were initially submitted back i… [+1083 chars]', '2019-11-15 09:47:31'),
(202, 'Troubles mount for Indian IT firms as clients look for more bang for buck - Economic Times', 'Analysts said several clients have asked Indian IT majors to cut rates and commit to costs savings upfront.', 'Friction between the finance and business teams at IT services provider Infosys — which is facing two separate complaints by whistleblowers — regarding the way contracts are structured, may have triggered the most recent blowup, people in the know of developm… [+2623 chars]', '2019-11-15 09:47:31'),
(203, 'Jaganmohan Reddy Needs a JNU for His Radical English Language Plans to Work - The Wire', 'The chief minister\'s attempt to use English to overturn caste equations is a risky strategy that would need the help of a robust intelligentsia.', 'Away from Delhi, Andhra Pradesh chief minister Y.S. Jaganmohan Reddy is waging a cultural battle which is of momentous significance to his state and indeed the rest of India. His government has decided to make English the medium of instruction in government s… [+9269 chars]', '2019-11-15 09:47:31');

-- --------------------------------------------------------

--
-- Table structure for table `passport`
--

CREATE TABLE `passport` (
  `aadhar_no` int(8) NOT NULL,
  `tripto` text DEFAULT NULL,
  `dod` date DEFAULT NULL,
  `doa` date DEFAULT NULL,
  `approval` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passport`
--

INSERT INTO `passport` (`aadhar_no`, `tripto`, `dod`, `doa`, `approval`) VALUES
(10000028, 'moscow', '2019-11-13', '2019-11-20', 'under view'),
(10000029, 'moscow', '2019-11-14', '2019-11-30', 'under view'),
(10000030, NULL, NULL, NULL, NULL),
(10000031, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `aadhar_no` int(8) NOT NULL,
  `stat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`aadhar_no`, `stat`) VALUES
(10000030, 'approved'),
(10000031, 'under view');

-- --------------------------------------------------------

--
-- Table structure for table `visa`
--

CREATE TABLE `visa` (
  `aadhar_no` int(8) NOT NULL,
  `tripto` text NOT NULL,
  `dod` date NOT NULL,
  `doa` date NOT NULL,
  `approval` text NOT NULL DEFAULT 'under view'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `visa`
--

INSERT INTO `visa` (`aadhar_no`, `tripto`, `dod`, `doa`, `approval`) VALUES
(10000030, 'moscow', '2019-11-21', '2019-11-30', 'approved'),
(10000031, 'canada', '2019-11-30', '2020-12-24', 'under view');

--
-- Triggers `visa`
--
DELIMITER $$
CREATE TRIGGER `ass` AFTER DELETE ON `visa` FOR EACH ROW INSERT INTO passport VALUES(OLD.aadhar_no,OLD.tripto,OLD.dod,OLD.doa,OLD.approval)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `pass` AFTER INSERT ON `visa` FOR EACH ROW UPDATE status SET stat=NEW.approval WHERE (aadhar_no=NEW.aadhar_no)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `pp` AFTER DELETE ON `visa` FOR EACH ROW UPDATE status SET status=null WHERE (aadhar_no=OLD.aadhar_no)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `uppass` AFTER UPDATE ON `visa` FOR EACH ROW UPDATE status SET stat=NEW.approval WHERE (aadhar_no=NEW.aadhar_no)
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`aadhar_no`);

--
-- Indexes for table `citizen`
--
ALTER TABLE `citizen`
  ADD PRIMARY KEY (`aadhar_no`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `death_record`
--
ALTER TABLE `death_record`
  ADD PRIMARY KEY (`aadhar_no`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`aadhar_no`);

--
-- Indexes for table `visa`
--
ALTER TABLE `visa`
  ADD PRIMARY KEY (`aadhar_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `citizen`
--
ALTER TABLE `citizen`
  MODIFY `aadhar_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000032;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;
--
-- Database: `coding_thunder`
--
CREATE DATABASE IF NOT EXISTS `coding_thunder` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `coding_thunder`;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone_no` bigint(10) NOT NULL,
  `message` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`sno`, `name`, `email`, `phone_no`, `message`, `date`) VALUES
(1, 'bhaskar', 'a@gmail.com', 6265695656, 'hello', '2019-11-01 12:37:45'),
(7, 'accidentalcode', 'cse180001012@gmail.com', 6265698492, 'i am a programmer', '2019-11-02 09:17:29'),
(8, 'ashutosh patel', 'cse180001010@iiti.ac.in', 9511745678, 'this is a very good website', '2019-11-04 09:24:25'),
(9, 'rohit nikam', 'hwafkusf@gmail.com', 2345678912, 'hi', '2019-11-04 10:02:25'),
(10, 'pardeep', 'p@yahoo.com', 7890654321, 'heloooooooooo', '2019-11-04 10:05:31'),
(11, 'baba', 'baba@gmail.com', 909848289, 'yup', '2019-11-07 07:56:42');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `given_by` varchar(20) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `slug`, `content`, `given_by`, `date`) VALUES
(1, '1', 'first-post', '1', '1', '2019-11-07 08:07:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`sno`),
  ADD UNIQUE KEY `phone` (`phone_no`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'server', 'dbms', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"aadhar\",\"coding_thunder\",\"phpmyadmin\",\"test\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"aadhar\",\"table\":\"citizen\"},{\"db\":\"aadhar\",\"table\":\"admin\"},{\"db\":\"aadhar\",\"table\":\"status\"},{\"db\":\"aadhar\",\"table\":\"visa\"},{\"db\":\"aadhar\",\"table\":\"passport\"},{\"db\":\"aadhar\",\"table\":\"news\"},{\"db\":\"aadhar\",\"table\":\"death_record\"},{\"db\":\"coding_thunder\",\"table\":\"posts\"},{\"db\":\"coding_thunder\",\"table\":\"contact\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2019-11-15 11:57:32', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
