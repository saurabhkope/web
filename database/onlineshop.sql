-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2019 at 07:53 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerece`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)  SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--


INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Trek'),
(2, 'Giant'),
(3, 'Specialized'),
(4, 'Cannondale'),
(5, 'Scott'),
(6, 'Merida');


-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(46, 2, '::1', 3, 0),
(48, 72, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(51, 1, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Mountain Bikes'),
(2, 'Road Bikes'),
(3, 'City Bikes'),
(4, 'Electric Bikes'),
(5, 'Hybrid Bikes'),
(6, 'Accessories'),
(7, 'Apparel');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'abc@gmail.com'),
(5, 'pqr@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'abc', 'abc@gmail.com', 'pune, Kumbalagodu, Karnataka', 'Bangalore', 'Karnataka', 560074, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 3, 77000, 1234);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--




INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 1, 'Peak Performer Mountain Bike', 5000, 'High-performance mountain bike for all terrain', 'product_1.png', 'mountain bike high-performance terrain'),
(2, 1, 1, 'Trailblazer Mountain Bike', 6000, 'Explore the trails with this rugged mountain bike', 'new1.png', 'mountain bike trail explore rugged'),
(3, 1, 1, 'Summit Seeker Mountain Bike', 7000, 'Conquer the summits with this reliable mountain bike', 'new2.png', 'mountain bike summit conquer reliable'),
(4, 1, 1, 'Alpine Adventurer Mountain Bike', 5500, 'Embark on your alpine adventures with this versatile mountain bike', 'new3.png', 'mountain bike alpine adventure versatile'),
(5, 1, 1, 'Rocky Ridge Mountain Bike', 6500, 'Tackle the rocky terrains with confidence using this sturdy mountain bike', 'new4.png', 'mountain bike rocky terrain sturdy'),
(6, 1, 2, 'Eco Explorer Mountain Bike', 7500, 'Experience eco-friendly exploration with this sustainable mountain bike', 'new5.png', 'mountain bike eco-friendly exploration sustainable'),
(7, 1, 2, 'Wilderness Wanderer Mountain Bike', 8000, 'Navigate the wilderness with ease using this agile mountain bike', 'new6.png', 'mountain bike wilderness navigate agile'),
(8, 1, 2, 'Cascade Cruiser Mountain Bike', 7000, 'Cruise through cascading trails with this smooth mountain bike', 'new7.png', 'mountain bike cruise cascading smooth'),
(9, 1, 2, 'Forest Fury Mountain Bike', 6000, 'Unleash your fury on forest trails with this powerful mountain bike', 'new8.png', 'mountain bike forest unleash powerful'),
(10, 1, 2, 'Ridge Racer Mountain Bike', 5500, 'Race along ridges with this lightning-fast mountain bike', 'product_1.png', 'mountain bike race ridge lightning'),
(11, 2, 3, 'Speedster Road Bike', 9000, 'Experience unparalleled speed with this sleek road bike', 'product1.png', 'road bike speed sleek'),
(12, 2, 3, 'Rapid Runner Road Bike', 10000, 'Run like the wind on the roads with this agile road bike', 'product2.png', 'road bike run wind agile'),
(13, 2, 3, 'Street Surfer Road Bike', 11000, 'Surf the streets with style on this smooth road bike', 'product3.png', 'road bike surf street style smooth'),
(14, 2, 3, 'Urban Voyager Road Bike', 9500, 'Embark on urban adventures with this versatile road bike', 'product4.png', 'road bike urban adventure versatile'),
(15, 2, 3, 'City Slicker Road Bike', 10500, 'Navigate city streets effortlessly with this sophisticated road bike', 'product5.png', 'road bike city navigate sophisticated'),
(16, 2, 3, 'Metro Maverick Road Bike', 12000, 'Conquer metropolitan roads with confidence on this robust road bike', 'product6.png', 'road bike metro conquer robust'),
(17, 2, 3, 'Expressway Explorer Road Bike', 11500, 'Explore the expressways with ease on this reliable road bike', 'product7.png', 'road bike explore expressway reliable'),
(18, 2, 3, 'Highway Hero Road Bike', 13000, 'Become a hero on the highways with this high-performance road bike', 'product8.png', 'road bike hero highway high-performance'),
(19, 2, 3, 'Velocity Viper Road Bike', 9500, 'Strike with lightning speed on the roads with this agile road bike', 'product9.png', 'road bike velocity strike lightning agile'),
(20, 2, 3, 'Skyline Sprinter Road Bike', 10000, 'Sprint along the skyline with this swift road bike', 'product10.png', 'road bike sprint skyline swift'),
(21, 3, 4, 'City Cruiser Bike', 8000, 'Cruise through the city streets in comfort and style with this classic city bike', 'product11.png', 'city bike cruise comfort style classic'),
(22, 3, 4, 'Urban Commuter Bike', 9000, 'Commute through urban jungles effortlessly on this reliable city bike', 'product15.png', 'city bike commute urban reliable'),
(23, 3, 4, 'Metropolitan Explorer Bike', 10000, 'Explore metropolitan landscapes with ease on this versatile city bike', 'product14.png', 'city bike explore metropolitan versatile'),
(24, 3, 4, 'Downtown Dynamo Bike', 8500, 'Be a dynamo in downtown areas with this agile and efficient city bike', 'product13.png', 'city bike downtown agile efficient'),
(25, 3, 1, 'Street Stroller Bike', 9500, 'Stroll along city streets leisurely with this comfortable and stylish city bike', 'product12.png', 'city bike stroll leisurely comfortable stylish'),
(26, 3, 1, 'Uptown Cruiser Bike', 8509, 'Cruise through uptown neighborhoods in elegance with this sophisticated city bike', 'product_1.png', 'city bike cruise uptown elegance sophisticated'),
(27, 3, 1, 'Cityscape Navigator Bike', 11000, 'Navigate through cityscapes effortlessly on this reliable and versatile city bike', 'product1.png', 'city bike navigate cityscapes reliable versatile'),
(28, 3, 1, 'Downtown Drifter Bike', 8000, 'Drift through downtown areas with ease on this agile and maneuverable city bike', 'product16.png', 'city bike drift downtown agile maneuverable'),
(29, 3, 4, 'Metropolis Mover Bike', 9500, 'Move through the metropolis smoothly on this sturdy and dependable city bike', 'new8.png', 'city bike move metropolis smooth sturdy dependable'),
(30, 3, 4, 'City Sleekster Bike', 9000, 'Sleek and stylish, this city bike is perfect for navigating busy streets with ease', 'new7.png', 'city bike sleek stylish navigate busy ease'),
(31, 4, 5, 'Electric Cruiser Bike', 12000, 'Enjoy effortless cruising with this electric-powered city bike', 'new6.png', 'electric bike cruiser effortless city'),
(32, 4, 5, 'Urban Explorer Electric Bike', 15000, 'Explore urban landscapes with ease using this versatile electric bike', 'new5.png', 'electric bike explore urban versatile'),
(33, 4, 5, 'City Slicker Electric Bike', 13000, 'Zip through city streets in style with this sleek electric-powered bike', 'new4.png', 'electric bike zip city sleek style'),
(34, 4, 5, 'Eco Commuter Electric Bike', 14000, 'Commute in an eco-friendly way with this efficient electric bike', 'new3.png', 'electric bike commute eco-friendly efficient'),
(35, 4, 5, 'Electric Mountain Explorer Bike', 18000, 'Conquer mountain trails effortlessly with this powerful electric bike', 'new2.png', 'electric bike conquer mountain powerful'),
(36, 4, 5, 'Cityscape Navigator Electric Bike', 16000, 'Navigate through cityscapes effortlessly with this reliable electric bike', 'new1.png', 'electric bike navigate cityscapes reliable'),
(37, 4, 5, 'Downtown Dynamo Electric Bike', 17000, 'Be a dynamo in downtown areas with this agile and efficient electric bike', 'product11.png', 'electric bike downtown agile efficient'),
(38, 4, 5, 'Urban Thriller Electric Bike', 19000, 'Experience the thrill of urban commuting with this high-performance electric bike', 'product10.png', 'electric bike thrill urban high-performance'),
(39, 4, 5, 'Electric Avenue Cruiser Bike', 14000, 'Cruise down Electric Avenue in style with this sleek and powerful electric bike', 'product9.png', 'electric bike cruise electric avenue sleek powerful'),
(40, 4, 5, 'Metro Marvel Electric Bike', 17000, 'Marvel at the convenience of urban commuting with this reliable electric bike', 'product8.png', 'electric bike marvel urban commuting reliable'),
(41, 5, 6, 'Urban Commuter Hybrid Bike', 9000, 'Perfect for city streets and light trails, this hybrid bike offers versatility and comfort', 'product7.png', 'hybrid bike urban commuter city trails versatility comfort'),
(42, 5, 6, 'Trailblazer Hybrid Bike', 10000, 'Blaze new trails with this hybrid bike that combines the best of road and mountain biking', 'product6.png', 'hybrid bike trailblazer road mountain biking adventure'),
(43, 5, 6, 'City Explorer Hybrid Bike', 9500, 'Explore the cityscape or countryside with ease using this reliable and agile hybrid bike', 'product5.png', 'hybrid bike city explorer countryside reliable agile'),
(44, 5, 6, 'Adventure Seeker Hybrid Bike', 11000, 'Seek new adventures on any terrain with this versatile and durable hybrid bike', 'product18.png', 'hybrid bike adventure seeker terrain versatile durable'),
(45, 5, 6, 'Urban Trailblazer Hybrid Bike', 10500, 'Navigate urban streets and off-road trails seamlessly with this hybrid bike designed for versatility', 'product17.png', 'hybrid bike urban trailblazer streets off-road versatility'),
(46, 5, 6, 'City Cruiser Hybrid Bike', 9500, 'Cruise through the city in comfort and style with this sleek and efficient hybrid bike', 'product16.png', 'hybrid bike city cruiser comfort style sleek efficient'),
(47, 5, 6, 'Mountain Explorer Hybrid Bike', 12000, 'Conquer mountain trails and city streets alike with this rugged and adaptable hybrid bike', 'product15.png', 'hybrid bike mountain explorer trails streets rugged adaptable'),
(48, 5, 6, 'Urban Adventurer Hybrid Bike', 10000, 'Embark on urban adventures or countryside escapades with confidence using this hybrid bike', 'product14.png', 'hybrid bike urban adventurer countryside confidence'),
(49, 5, 6, 'Cityscape Navigator Hybrid Bike', 9500, 'Navigate through cityscapes and beyond with this reliable and versatile hybrid bike', 'product13.png', 'hybrid bike cityscape navigator beyond reliable versatile'),
(50, 5, 6, 'Hybrid Commuter Bike', 9000, 'Commute in comfort and style with this efficient and practical hybrid bike designed for city living', 'product12.png', 'hybrid bike commuter comfort style efficient practical'),
(51, 6, 7, 'Bike Lock with Cable', 300, 'Secure your bike with this durable lock and cable combination, providing peace of mind wherever you go', 'bikelock.jpg', 'bike lock cable security durable peace of mind'),
(52, 6, 7, 'LED Bike Lights Set', 200, 'Stay visible and safe on the road with this set of bright LED lights for your bike, perfect for night rides', 'bikelight.png', 'LED bike lights set visibility safety night rides'),
(53, 6, 7, 'Bike Helmet', 400, 'Protect your head during rides with this sturdy and comfortable bike helmet, designed for maximum safety and comfort', 'helmet.png', 'bike helmet protection safety comfortable'),
(54, 6, 7, 'Bike Repair Tool Kit', 350, 'Stay prepared for any repairs on the go with this comprehensive bike repair tool kit, compact and easy to carry', 'toolkit.png', 'bike repair tool kit repairs compact portable'),
(55, 6, 7, 'Bike Pump', 250, 'Keep your tires properly inflated with this efficient and easy-to-use bike pump, essential for every cyclist', 'pump.png', 'bike pump tire inflation efficient essential'),
(56, 6, 7, 'Water Bottle Holder', 150, 'Stay hydrated on your rides with this convenient water bottle holder, compatible with most bikes', 'bottle.png', 'water bottle holder hydration convenient'),
(57, 6, 7, 'Bike Phone Mount', 200, 'Keep your phone secure and accessible while cycling with this adjustable bike phone mount, compatible with various devices', 'phonemount.jpg', 'bike phone mount secure adjustable accessibility'),
(58, 6, 7, 'Bike Rear Rack', 45, 'Carry your belongings with ease using this sturdy rear rack for your bike, perfect for commuting or touring', 'rackcycle.png', 'bike rear rack carry belongings sturdy commuting touring'),
(59, 6, 7, 'Bike Multi-Tool', 300, 'Be ready for any adjustments or repairs on the road with this versatile and compact bike multi-tool', 'biketool2.jpg', 'bike multi-tool adjustments repairs versatile compact'),
(60, 6, 7, 'Bike Mirror', 150, 'Increase your awareness of your surroundings while cycling with this adjustable bike mirror, enhancing safety on the road', 'cyclemirar.jpg', 'bike mirror awareness surroundings adjustable safety'),
(61, 7, 2, 'Cycling Jersey', 400, 'Stay comfortable and stylish on your rides with this breathable cycling jersey, designed for optimal performance', 'jercy3.jpg', 'cycling jersey comfortable stylish breathable performance'),
(62, 7, 2, 'Cycling Shorts', 350, 'Experience maximum comfort during long rides with these padded cycling shorts, featuring moisture-wicking fabric', 'shorts.jpg', 'cycling shorts comfortable padded moisture-wicking'),
(63, 7, 3, 'Cycling Jacket', 600, 'Stay protected from the elements with this lightweight and waterproof cycling jacket, designed for all-weather riding', 'jacket2.jpg', 'cycling jacket protected elements lightweight waterproof all-weather'),
(64, 7, 3, 'Cycling Gloves', 250, 'Protect your hands and improve grip with these padded cycling gloves, featuring touchscreen compatibility', 'gloves2.png', 'cycling gloves padded protection grip touchscreen'),
(65, 7, 3, 'Cycling Socks', 150, 'Keep your feet dry and comfortable with these moisture-wicking cycling socks, designed for long hours on the bike', 'socks.png', 'cycling socks dry comfortable moisture-wicking long hours'),
(66, 7, 7, 'Cycling Shoes', 900, 'Enhance your performance with these lightweight and stiff cycling shoes, featuring a secure closure system', 'cycleshoe2.png', 'cycling shoes performance lightweight stiff secure closure'),
(67, 7, 5, 'Cycling Arm Warmers', 200, 'Stay warm during chilly rides with these flexible and breathable cycling arm warmers, easy to roll up and store', 'armwarmer.png', 'cycling arm warmers warm flexible breathable chilly rides'),
(68, 7, 5, 'Cycling Leg Warmers', 250, 'Keep your legs warm and protected with these versatile cycling leg warmers, perfect for changing weather conditions', 'legwarmer.jpg', 'cycling leg warmers warm protected versatile changing weather'),
(69, 7, 4, 'Cycling Cap', 150, 'Stay cool and protected from the sun with this lightweight and moisture-wicking cycling cap, featuring a visor for added shade', 'cyclecap.jpg', 'cycling cap cool protected sun lightweight moisture-wicking visor shade'),
(70, 7, 1, 'Cycling Gilet', 450, 'Add an extra layer of warmth and wind protection with this packable cycling gilet, featuring reflective elements for visibility', 'gilet.jpg', 'cycling gilet layer warmth wind protection packable reflective visibility'),
(71, 7, 2, 'Cycling Rain Pants', 550, 'Stay dry and comfortable in rainy conditions with these waterproof and breathable cycling rain pants, featuring adjustable cuffs', 'cyclerainpant.png', 'cycling rain pants dry comfortable waterproof breathable adjustable cuffs'),
(72, 7, 2, 'Cycling Base Layer', 300, 'Regulate your body temperature with this moisture-wicking cycling base layer, designed to keep you dry and comfortable', 'bestlayer.jpg', 'cycling base layer regulate temperature moisture-wicking dry comfortable'),
(73, 7, 1, 'Cycling Vest', 350, 'Stay visible and protected during low-light rides with this high-visibility cycling vest, featuring reflective accents for safety', 'vest.jpg', 'cycling vest visible protected low-light rides high-visibility reflective safety'),
(74, 7, 6, 'Cycling Balaclava', 200, 'Stay warm and protected in cold weather with this versatile cycling balaclava, featuring breathable and stretchy fabric', 'balacleva.jpg', 'cycling balaclava warm protected cold weather versatile breathable stretchy'),
(75, 7, 2, 'Cycling Sunglasses', 400, 'Protect your eyes from UV rays and debris with these stylish and durable cycling sunglasses, featuring interchangeable lenses', 'sunglass.png', 'cycling sunglasses protect UV rays debris stylish durable interchangeable lenses'),
(76, 7, 6, 'Cycling Arm Sleeves', 180, 'Stay protected from the sun and elements with these lightweight and compressive cycling arm sleeves, featuring UPF 50+ sun protection', 'armsleve.jpg', 'cycling arm sleeves protected sun elements lightweight compressive UPF 50+ sun protection'),
(77, 7, 4, 'Cycling Knee Warmers', 220, 'Keep your knees warm and flexible with these breathable and stretchy cycling knee warmers, perfect for cooler weather', 'kneewarmers.jpg', 'cycling knee warmers warm flexible breathable stretchy cooler weather'),
(78, 7, 4, 'Cycling Overshoes', 300, 'Keep your feet dry and protected from the elements with these waterproof and windproof cycling overshoes, featuring a snug fit', 'cycleshoe.jpg', 'cycling overshoes dry protected elements waterproof windproof snug fit'),
(79, 7, 3, 'Cycling Thermal Jersey', 550, 'Stay warm and comfortable in cold conditions with this insulated cycling thermal jersey, featuring a brushed fleece interior', 'jercy2.jpg', 'cycling thermal jersey warm comfortable cold conditions insulated brushed fleece interior'),
(80, 7, 5, 'Cycling Rain Jacket', 650, 'Stay dry and visible in wet weather with this waterproof and reflective cycling rain jacket, featuring adjustable cuffs and hood', 'cyclejacket1.jpg', 'cycling rain jacket dry visible wet weather waterproof reflective adjustable cuffs hood');

-- --------------------------------------------------------
-- Inserting data for products table
--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', 'puneeth', '9448121558', '123456789', 'sdcjns,djc'),
(15, 'hemu', 'ajhgdg', 'puneethreddy951@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', '123456789', '9448121558', '123456789', 'sdcjns,djc'),
(14, 'hemanthu', 'reddy', 'hemanthreddy951@gmail.com', '123456788', '6526436723', 's,dc wfjvnvn', 'b efhfhvvbr'),
(15, 'hemu', 'ajhgdg', 'keeru@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(20, 'pramod', 'vh', 'pramod@gmail.com', '124335353', '9767645653', 'ksbdfcdf', 'sjrgrevgsib'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
