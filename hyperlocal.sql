-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 31, 2026 at 10:58 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hyperlocal`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address_line1` varchar(191) NOT NULL,
  `address_line2` varchar(191) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `landmark` varchar(100) DEFAULT NULL,
  `state` varchar(100) NOT NULL,
  `zipcode` varchar(20) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `address_type` enum('home','office','other') NOT NULL,
  `country` varchar(100) NOT NULL,
  `country_code` varchar(10) NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_notifications`
--

CREATE TABLE `app_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(191) NOT NULL DEFAULT 'general',
  `sent_to` enum('admin','customer','seller') NOT NULL DEFAULT 'admin',
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('product','category','brand','custom') NOT NULL,
  `scope_type` enum('global','category') NOT NULL DEFAULT 'global',
  `scope_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `custom_url` varchar(255) DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `position` enum('top','carousel') NOT NULL,
  `visibility_status` enum('published','draft') NOT NULL DEFAULT 'draft',
  `display_order` int(11) NOT NULL DEFAULT 0,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `scope_type` enum('global','category') NOT NULL DEFAULT 'global',
  `scope_id` bigint(20) UNSIGNED DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('hyperlocal_cache_currency_symbol', 's:1:\"$\";', 1775024652),
('hyperlocal_cache_license_recheck_ts', 'i:1774936111;', 1774979311),
('hyperlocal_cache_settings:app', 'a:6:{s:20:\"customerAppstoreLink\";s:0:\"\";s:21:\"customerPlaystoreLink\";s:0:\"\";s:17:\"customerAppScheme\";s:0:\"\";s:18:\"sellerAppstoreLink\";s:0:\"\";s:19:\"sellerPlaystoreLink\";s:0:\"\";s:15:\"sellerAppScheme\";s:0:\"\";}', 2090295784),
('hyperlocal_cache_settings:payment', 'a:33:{s:13:\"stripePayment\";b:0;s:17:\"stripePaymentMode\";s:0:\"\";s:20:\"stripePublishableKey\";s:0:\"\";s:15:\"stripeSecretKey\";s:0:\"\";s:24:\"stripePaymentEndpointUrl\";s:0:\"\";s:22:\"stripeWebhookSecretKey\";s:0:\"\";s:18:\"stripeCurrencyCode\";s:0:\"\";s:15:\"razorpayPayment\";b:0;s:19:\"razorpayPaymentMode\";s:0:\"\";s:13:\"razorpayKeyId\";s:0:\"\";s:17:\"razorpaySecretKey\";s:0:\"\";s:21:\"razorpayWebhookSecret\";s:0:\"\";s:15:\"paystackPayment\";b:0;s:19:\"paystackPaymentMode\";s:0:\"\";s:17:\"paystackPublicKey\";s:0:\"\";s:17:\"paystackSecretKey\";s:0:\"\";s:21:\"paystackWebhookSecret\";s:0:\"\";s:20:\"paystackCurrencyCode\";s:0:\"\";s:13:\"walletPayment\";b:0;s:3:\"cod\";b:0;s:18:\"directBankTransfer\";b:0;s:15:\"bankAccountName\";s:0:\"\";s:17:\"bankAccountNumber\";s:0:\"\";s:8:\"bankName\";s:0:\"\";s:8:\"bankCode\";s:0:\"\";s:13:\"bankExtraNote\";s:0:\"\";s:18:\"flutterwavePayment\";b:0;s:22:\"flutterwavePaymentMode\";s:0:\"\";s:20:\"flutterwavePublicKey\";s:0:\"\";s:20:\"flutterwaveSecretKey\";s:0:\"\";s:24:\"flutterwaveEncryptionKey\";s:0:\"\";s:24:\"flutterwaveWebhookSecret\";s:0:\"\";s:23:\"flutterwaveCurrencyCode\";s:0:\"\";}', 2090295784),
('hyperlocal_cache_settings:seller', 'a:2:{s:14:\"termsCondition\";s:0:\"\";s:13:\"privacyPolicy\";s:0:\"\";}', 2090297633),
('hyperlocal_cache_settings:subscription', 'a:3:{s:18:\"enableSubscription\";b:1;s:19:\"subscriptionHeading\";s:0:\"\";s:23:\"subscriptionDescription\";s:0:\"\";}', 2090296214),
('hyperlocal_cache_settings:system', 'a:42:{s:7:\"appName\";s:10:\"Local Mart\";s:19:\"sellerSupportNumber\";s:10:\"7987654345\";s:18:\"sellerSupportEmail\";s:16:\"info@3fitech.com\";s:14:\"systemTimezone\";s:12:\"Asia/Kolkata\";s:16:\"copyrightDetails\";s:7:\"3fitech\";s:4:\"logo\";s:28:\"settings/logo-1774938064.png\";s:7:\"favicon\";s:31:\"settings/favicon-1774938064.png\";s:14:\"companyAddress\";s:5:\"Noida\";s:14:\"adminSignature\";s:0:\"\";s:25:\"enableThirdPartyStoreSync\";b:0;s:7:\"Shopify\";b:0;s:11:\"Woocommerce\";b:0;s:4:\"etsy\";b:0;s:12:\"checkoutType\";s:11:\"multi_store\";s:17:\"minimumCartAmount\";i:100;s:25:\"maximumItemsAllowedInCart\";i:999;s:13:\"lowStockLimit\";s:2:\"99\";s:29:\"maximumDistanceToNearestStore\";s:0:\"\";s:12:\"enableWallet\";b:0;s:26:\"welcomeWalletBalanceAmount\";i:100;s:24:\"sellerAppMaintenanceMode\";b:0;s:27:\"sellerAppMaintenanceMessage\";s:0:\"\";s:18:\"webMaintenanceMode\";b:0;s:21:\"webMaintenanceMessage\";s:0:\"\";s:8:\"demoMode\";b:0;s:20:\"adminDemoModeMessage\";s:0:\"\";s:21:\"sellerDemoModeMessage\";s:0:\"\";s:23:\"customerDemoModeMessage\";s:0:\"\";s:31:\"customerLocationDemoModeMessage\";s:0:\"\";s:26:\"deliveryBoyDemoModeMessage\";s:0:\"\";s:15:\"referEarnStatus\";b:0;s:19:\"referEarnMethodUser\";s:0:\"\";s:18:\"referEarnBonusUser\";s:0:\"\";s:31:\"referEarnMaximumBonusAmountUser\";s:0:\"\";s:23:\"referEarnMethodReferral\";s:0:\"\";s:22:\"referEarnBonusReferral\";s:0:\"\";s:35:\"referEarnMaximumBonusAmountReferral\";s:0:\"\";s:27:\"referEarnMinimumOrderAmount\";s:0:\"\";s:27:\"referEarnNumberOfTimesBonus\";s:0:\"\";s:8:\"currency\";s:3:\"USD\";s:14:\"currencySymbol\";s:1:\"$\";s:16:\"systemVendorType\";s:8:\"multiple\";}', 2090298064),
('hyperlocal_cache_settings:web', 'a:53:{s:8:\"siteName\";s:10:\"Local Mart\";s:13:\"siteCopyright\";s:7:\"3fitech\";s:14:\"customerWebUrl\";s:0:\"\";s:13:\"supportNumber\";s:10:\"8745322345\";s:12:\"supportEmail\";s:16:\"info@3fitech.com\";s:7:\"address\";s:5:\"Noida\";s:16:\"shortDescription\";s:19:\"This is Local Mart.\";s:14:\"siteHeaderLogo\";s:40:\"settings/site-header-logo-1774939219.png\";s:18:\"siteHeaderDarkLogo\";s:45:\"settings/site-header-dark-logo-1774939219.png\";s:14:\"siteFooterLogo\";s:40:\"settings/site-footer-logo-1774939219.png\";s:11:\"siteFavicon\";s:36:\"settings/site-favicon-1774939219.png\";s:12:\"headerScript\";s:0:\"\";s:12:\"footerScript\";s:0:\"\";s:12:\"googleMapKey\";s:0:\"\";s:9:\"mapIframe\";s:0:\"\";s:18:\"appDownloadSection\";b:0;s:15:\"appSectionTitle\";s:0:\"\";s:17:\"appSectionTagline\";s:0:\"\";s:23:\"appSectionPlaystoreLink\";s:0:\"\";s:22:\"appSectionAppstoreLink\";s:0:\"\";s:26:\"appSectionShortDescription\";s:0:\"\";s:12:\"facebookLink\";s:0:\"\";s:13:\"instagramLink\";s:0:\"\";s:5:\"xLink\";s:0:\"\";s:11:\"youtubeLink\";s:0:\"\";s:22:\"shippingFeatureSection\";s:0:\"\";s:27:\"shippingFeatureSectionTitle\";s:0:\"\";s:33:\"shippingFeatureSectionDescription\";s:0:\"\";s:20:\"returnFeatureSection\";s:0:\"\";s:25:\"returnFeatureSectionTitle\";s:0:\"\";s:31:\"returnFeatureSectionDescription\";s:0:\"\";s:28:\"safetySecurityFeatureSection\";s:0:\"\";s:33:\"safetySecurityFeatureSectionTitle\";s:0:\"\";s:39:\"safetySecurityFeatureSectionDescription\";s:0:\"\";s:21:\"supportFeatureSection\";s:0:\"\";s:26:\"supportFeatureSectionTitle\";s:0:\"\";s:32:\"supportFeatureSectionDescription\";s:0:\"\";s:12:\"metaKeywords\";s:0:\"\";s:15:\"metaDescription\";s:0:\"\";s:16:\"allowedCountries\";a:1:{i:0;s:5:\"India\";}s:23:\"enableCountryValidation\";b:1;s:16:\"defaultLongitude\";s:6:\"31.654\";s:15:\"defaultLatitude\";s:6:\"31.899\";s:18:\"returnRefundPolicy\";s:0:\"\";s:14:\"shippingPolicy\";s:0:\"\";s:13:\"privacyPolicy\";s:0:\"\";s:14:\"termsCondition\";s:0:\"\";s:7:\"aboutUs\";s:0:\"\";s:7:\"pwaName\";s:10:\"Local Mart\";s:14:\"pwaDescription\";s:13:\"asdfghgjgfdsa\";s:14:\"pwaLogo192x192\";s:0:\"\";s:14:\"pwaLogo512x512\";s:0:\"\";s:14:\"pwaLogo144x144\";s:0:\"\";}', 2090299219),
('hyperlocal_cache_spatie.permission.cache', 'a:3:{s:5:\"alias\";a:3:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";}s:11:\"permissions\";a:153:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:14:\"dashboard.view\";s:1:\"c\";s:5:\"admin\";}i:1;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:15:\"category.create\";s:1:\"c\";s:5:\"admin\";}i:2;a:3:{s:1:\"a\";i:3;s:1:\"b\";s:13:\"category.edit\";s:1:\"c\";s:5:\"admin\";}i:3;a:3:{s:1:\"a\";i:4;s:1:\"b\";s:15:\"category.delete\";s:1:\"c\";s:5:\"admin\";}i:4;a:3:{s:1:\"a\";i:5;s:1:\"b\";s:13:\"category.view\";s:1:\"c\";s:5:\"admin\";}i:5;a:3:{s:1:\"a\";i:6;s:1:\"b\";s:12:\"brand.create\";s:1:\"c\";s:5:\"admin\";}i:6;a:3:{s:1:\"a\";i:7;s:1:\"b\";s:10:\"brand.edit\";s:1:\"c\";s:5:\"admin\";}i:7;a:3:{s:1:\"a\";i:8;s:1:\"b\";s:12:\"brand.delete\";s:1:\"c\";s:5:\"admin\";}i:8;a:3:{s:1:\"a\";i:9;s:1:\"b\";s:10:\"brand.view\";s:1:\"c\";s:5:\"admin\";}i:9;a:3:{s:1:\"a\";i:10;s:1:\"b\";s:13:\"seller.create\";s:1:\"c\";s:5:\"admin\";}i:10;a:3:{s:1:\"a\";i:11;s:1:\"b\";s:11:\"seller.edit\";s:1:\"c\";s:5:\"admin\";}i:11;a:3:{s:1:\"a\";i:12;s:1:\"b\";s:13:\"seller.delete\";s:1:\"c\";s:5:\"admin\";}i:12;a:3:{s:1:\"a\";i:13;s:1:\"b\";s:11:\"seller.view\";s:1:\"c\";s:5:\"admin\";}i:13;a:3:{s:1:\"a\";i:14;s:1:\"b\";s:16:\"setting.view.all\";s:1:\"c\";s:5:\"admin\";}i:14;a:3:{s:1:\"a\";i:15;s:1:\"b\";s:12:\"setting.view\";s:1:\"c\";s:5:\"admin\";}i:15;a:3:{s:1:\"a\";i:16;s:1:\"b\";s:12:\"setting.edit\";s:1:\"c\";s:5:\"admin\";}i:16;a:3:{s:1:\"a\";i:17;s:1:\"b\";s:19:\"setting.system.view\";s:1:\"c\";s:5:\"admin\";}i:17;a:3:{s:1:\"a\";i:18;s:1:\"b\";s:19:\"setting.system.edit\";s:1:\"c\";s:5:\"admin\";}i:18;a:3:{s:1:\"a\";i:19;s:1:\"b\";s:20:\"setting.storage.view\";s:1:\"c\";s:5:\"admin\";}i:19;a:3:{s:1:\"a\";i:20;s:1:\"b\";s:20:\"setting.storage.edit\";s:1:\"c\";s:5:\"admin\";}i:20;a:3:{s:1:\"a\";i:21;s:1:\"b\";s:18:\"setting.email.view\";s:1:\"c\";s:5:\"admin\";}i:21;a:3:{s:1:\"a\";i:22;s:1:\"b\";s:18:\"setting.email.edit\";s:1:\"c\";s:5:\"admin\";}i:22;a:3:{s:1:\"a\";i:23;s:1:\"b\";s:20:\"setting.payment.view\";s:1:\"c\";s:5:\"admin\";}i:23;a:3:{s:1:\"a\";i:24;s:1:\"b\";s:20:\"setting.payment.edit\";s:1:\"c\";s:5:\"admin\";}i:24;a:3:{s:1:\"a\";i:25;s:1:\"b\";s:27:\"setting.authentication.view\";s:1:\"c\";s:5:\"admin\";}i:25;a:3:{s:1:\"a\";i:26;s:1:\"b\";s:27:\"setting.authentication.edit\";s:1:\"c\";s:5:\"admin\";}i:26;a:3:{s:1:\"a\";i:27;s:1:\"b\";s:25:\"setting.notification.view\";s:1:\"c\";s:5:\"admin\";}i:27;a:3:{s:1:\"a\";i:28;s:1:\"b\";s:25:\"setting.notification.edit\";s:1:\"c\";s:5:\"admin\";}i:28;a:3:{s:1:\"a\";i:29;s:1:\"b\";s:16:\"setting.web.view\";s:1:\"c\";s:5:\"admin\";}i:29;a:3:{s:1:\"a\";i:30;s:1:\"b\";s:16:\"setting.web.edit\";s:1:\"c\";s:5:\"admin\";}i:30;a:3:{s:1:\"a\";i:31;s:1:\"b\";s:16:\"setting.app.view\";s:1:\"c\";s:5:\"admin\";}i:31;a:3:{s:1:\"a\";i:32;s:1:\"b\";s:16:\"setting.app.edit\";s:1:\"c\";s:5:\"admin\";}i:32;a:3:{s:1:\"a\";i:33;s:1:\"b\";s:25:\"setting.delivery_boy.view\";s:1:\"c\";s:5:\"admin\";}i:33;a:3:{s:1:\"a\";i:34;s:1:\"b\";s:25:\"setting.delivery_boy.edit\";s:1:\"c\";s:5:\"admin\";}i:34;a:3:{s:1:\"a\";i:35;s:1:\"b\";s:34:\"setting.home_general_settings.view\";s:1:\"c\";s:5:\"admin\";}i:35;a:3:{s:1:\"a\";i:36;s:1:\"b\";s:34:\"setting.home_general_settings.edit\";s:1:\"c\";s:5:\"admin\";}i:36;a:3:{s:1:\"a\";i:37;s:1:\"b\";s:11:\"role.create\";s:1:\"c\";s:5:\"admin\";}i:37;a:3:{s:1:\"a\";i:38;s:1:\"b\";s:9:\"role.edit\";s:1:\"c\";s:5:\"admin\";}i:38;a:3:{s:1:\"a\";i:39;s:1:\"b\";s:11:\"role.delete\";s:1:\"c\";s:5:\"admin\";}i:39;a:3:{s:1:\"a\";i:40;s:1:\"b\";s:9:\"role.view\";s:1:\"c\";s:5:\"admin\";}i:40;a:3:{s:1:\"a\";i:41;s:1:\"b\";s:20:\"role.permission.view\";s:1:\"c\";s:5:\"admin\";}i:41;a:3:{s:1:\"a\";i:42;s:1:\"b\";s:20:\"role.permission.edit\";s:1:\"c\";s:5:\"admin\";}i:42;a:3:{s:1:\"a\";i:43;s:1:\"b\";s:14:\"tax_class.view\";s:1:\"c\";s:5:\"admin\";}i:43;a:3:{s:1:\"a\";i:44;s:1:\"b\";s:16:\"tax_class.create\";s:1:\"c\";s:5:\"admin\";}i:44;a:3:{s:1:\"a\";i:45;s:1:\"b\";s:14:\"tax_class.edit\";s:1:\"c\";s:5:\"admin\";}i:45;a:3:{s:1:\"a\";i:46;s:1:\"b\";s:16:\"tax_class.delete\";s:1:\"c\";s:5:\"admin\";}i:46;a:3:{s:1:\"a\";i:47;s:1:\"b\";s:18:\"system_user.create\";s:1:\"c\";s:5:\"admin\";}i:47;a:3:{s:1:\"a\";i:48;s:1:\"b\";s:16:\"system_user.edit\";s:1:\"c\";s:5:\"admin\";}i:48;a:3:{s:1:\"a\";i:49;s:1:\"b\";s:18:\"system_user.delete\";s:1:\"c\";s:5:\"admin\";}i:49;a:3:{s:1:\"a\";i:50;s:1:\"b\";s:16:\"system_user.view\";s:1:\"c\";s:5:\"admin\";}i:50;a:3:{s:1:\"a\";i:51;s:1:\"b\";s:10:\"faq.create\";s:1:\"c\";s:5:\"admin\";}i:51;a:3:{s:1:\"a\";i:52;s:1:\"b\";s:8:\"faq.edit\";s:1:\"c\";s:5:\"admin\";}i:52;a:3:{s:1:\"a\";i:53;s:1:\"b\";s:10:\"faq.delete\";s:1:\"c\";s:5:\"admin\";}i:53;a:3:{s:1:\"a\";i:54;s:1:\"b\";s:8:\"faq.view\";s:1:\"c\";s:5:\"admin\";}i:54;a:3:{s:1:\"a\";i:55;s:1:\"b\";s:13:\"banner.create\";s:1:\"c\";s:5:\"admin\";}i:55;a:3:{s:1:\"a\";i:56;s:1:\"b\";s:11:\"banner.edit\";s:1:\"c\";s:5:\"admin\";}i:56;a:3:{s:1:\"a\";i:57;s:1:\"b\";s:13:\"banner.delete\";s:1:\"c\";s:5:\"admin\";}i:57;a:3:{s:1:\"a\";i:58;s:1:\"b\";s:11:\"banner.view\";s:1:\"c\";s:5:\"admin\";}i:58;a:3:{s:1:\"a\";i:59;s:1:\"b\";s:20:\"delivery_zone.create\";s:1:\"c\";s:5:\"admin\";}i:59;a:3:{s:1:\"a\";i:60;s:1:\"b\";s:18:\"delivery_zone.edit\";s:1:\"c\";s:5:\"admin\";}i:60;a:3:{s:1:\"a\";i:61;s:1:\"b\";s:20:\"delivery_zone.delete\";s:1:\"c\";s:5:\"admin\";}i:61;a:3:{s:1:\"a\";i:62;s:1:\"b\";s:18:\"delivery_zone.view\";s:1:\"c\";s:5:\"admin\";}i:62;a:3:{s:1:\"a\";i:63;s:1:\"b\";s:23:\"featured_section.create\";s:1:\"c\";s:5:\"admin\";}i:63;a:3:{s:1:\"a\";i:64;s:1:\"b\";s:21:\"featured_section.edit\";s:1:\"c\";s:5:\"admin\";}i:64;a:3:{s:1:\"a\";i:65;s:1:\"b\";s:23:\"featured_section.delete\";s:1:\"c\";s:5:\"admin\";}i:65;a:3:{s:1:\"a\";i:66;s:1:\"b\";s:31:\"featured_section.sorting_modify\";s:1:\"c\";s:5:\"admin\";}i:66;a:3:{s:1:\"a\";i:67;s:1:\"b\";s:21:\"featured_section.view\";s:1:\"c\";s:5:\"admin\";}i:67;a:3:{s:1:\"a\";i:68;s:1:\"b\";s:29:\"featured_section.sorting_view\";s:1:\"c\";s:5:\"admin\";}i:68;a:3:{s:1:\"a\";i:69;s:1:\"b\";s:17:\"delivery_boy.edit\";s:1:\"c\";s:5:\"admin\";}i:69;a:3:{s:1:\"a\";i:70;s:1:\"b\";s:19:\"delivery_boy.delete\";s:1:\"c\";s:5:\"admin\";}i:70;a:3:{s:1:\"a\";i:71;s:1:\"b\";s:17:\"delivery_boy.view\";s:1:\"c\";s:5:\"admin\";}i:71;a:3:{s:1:\"a\";i:72;s:1:\"b\";s:25:\"delivery_boy_earning.view\";s:1:\"c\";s:5:\"admin\";}i:72;a:3:{s:1:\"a\";i:73;s:1:\"b\";s:36:\"delivery_boy_earning.process_payment\";s:1:\"c\";s:5:\"admin\";}i:73;a:3:{s:1:\"a\";i:74;s:1:\"b\";s:33:\"delivery_boy_cash_collection.view\";s:1:\"c\";s:5:\"admin\";}i:74;a:3:{s:1:\"a\";i:75;s:1:\"b\";s:36:\"delivery_boy_cash_collection.process\";s:1:\"c\";s:5:\"admin\";}i:75;a:3:{s:1:\"a\";i:76;s:1:\"b\";s:28:\"delivery_boy_withdrawal.view\";s:1:\"c\";s:5:\"admin\";}i:76;a:3:{s:1:\"a\";i:77;s:1:\"b\";s:31:\"delivery_boy_withdrawal.process\";s:1:\"c\";s:5:\"admin\";}i:77;a:3:{s:1:\"a\";i:78;s:1:\"b\";s:22:\"seller_withdrawal.view\";s:1:\"c\";s:5:\"admin\";}i:78;a:3:{s:1:\"a\";i:79;s:1:\"b\";s:25:\"seller_withdrawal.process\";s:1:\"c\";s:5:\"admin\";}i:79;a:3:{s:1:\"a\";i:80;s:1:\"b\";s:15:\"commission.view\";s:1:\"c\";s:5:\"admin\";}i:80;a:3:{s:1:\"a\";i:81;s:1:\"b\";s:17:\"commission.settle\";s:1:\"c\";s:5:\"admin\";}i:81;a:3:{s:1:\"a\";i:82;s:1:\"b\";s:11:\"orders.view\";s:1:\"c\";s:5:\"admin\";}i:82;a:3:{s:1:\"a\";i:83;s:1:\"b\";s:11:\"return.view\";s:1:\"c\";s:5:\"admin\";}i:83;a:3:{s:1:\"a\";i:84;s:1:\"b\";s:12:\"product.view\";s:1:\"c\";s:5:\"admin\";}i:84;a:3:{s:1:\"a\";i:85;s:1:\"b\";s:21:\"product.status_update\";s:1:\"c\";s:5:\"admin\";}i:85;a:3:{s:1:\"a\";i:86;s:1:\"b\";s:17:\"product_faqs.view\";s:1:\"c\";s:5:\"admin\";}i:86;a:3:{s:1:\"a\";i:87;s:1:\"b\";s:12:\"promo.create\";s:1:\"c\";s:5:\"admin\";}i:87;a:3:{s:1:\"a\";i:88;s:1:\"b\";s:10:\"promo.edit\";s:1:\"c\";s:5:\"admin\";}i:88;a:3:{s:1:\"a\";i:89;s:1:\"b\";s:12:\"promo.delete\";s:1:\"c\";s:5:\"admin\";}i:89;a:3:{s:1:\"a\";i:90;s:1:\"b\";s:10:\"promo.view\";s:1:\"c\";s:5:\"admin\";}i:90;a:3:{s:1:\"a\";i:91;s:1:\"b\";s:19:\"notification.create\";s:1:\"c\";s:5:\"admin\";}i:91;a:3:{s:1:\"a\";i:92;s:1:\"b\";s:17:\"notification.edit\";s:1:\"c\";s:5:\"admin\";}i:92;a:3:{s:1:\"a\";i:93;s:1:\"b\";s:19:\"notification.delete\";s:1:\"c\";s:5:\"admin\";}i:93;a:3:{s:1:\"a\";i:94;s:1:\"b\";s:17:\"notification.view\";s:1:\"c\";s:5:\"admin\";}i:94;a:3:{s:1:\"a\";i:95;s:1:\"b\";s:22:\"subscription_plan.view\";s:1:\"c\";s:5:\"admin\";}i:95;a:3:{s:1:\"a\";i:96;s:1:\"b\";s:24:\"subscription_plan.create\";s:1:\"c\";s:5:\"admin\";}i:96;a:3:{s:1:\"a\";i:97;s:1:\"b\";s:22:\"subscription_plan.edit\";s:1:\"c\";s:5:\"admin\";}i:97;a:3:{s:1:\"a\";i:98;s:1:\"b\";s:24:\"subscription_plan.delete\";s:1:\"c\";s:5:\"admin\";}i:98;a:3:{s:1:\"a\";i:99;s:1:\"b\";s:28:\"subscription_subscriber.view\";s:1:\"c\";s:5:\"admin\";}i:99;a:3:{s:1:\"a\";i:100;s:1:\"b\";s:10:\"store.view\";s:1:\"c\";s:5:\"admin\";}i:100;a:3:{s:1:\"a\";i:101;s:1:\"b\";s:12:\"store.verify\";s:1:\"c\";s:5:\"admin\";}i:101;a:3:{s:1:\"a\";i:102;s:1:\"b\";s:13:\"customer.view\";s:1:\"c\";s:5:\"admin\";}i:102;a:3:{s:1:\"a\";i:103;s:1:\"b\";s:14:\"dashboard.view\";s:1:\"c\";s:6:\"seller\";}i:103;a:3:{s:1:\"a\";i:104;s:1:\"b\";s:9:\"role.view\";s:1:\"c\";s:6:\"seller\";}i:104;a:3:{s:1:\"a\";i:105;s:1:\"b\";s:11:\"role.create\";s:1:\"c\";s:6:\"seller\";}i:105;a:3:{s:1:\"a\";i:106;s:1:\"b\";s:9:\"role.edit\";s:1:\"c\";s:6:\"seller\";}i:106;a:3:{s:1:\"a\";i:107;s:1:\"b\";s:11:\"role.delete\";s:1:\"c\";s:6:\"seller\";}i:107;a:3:{s:1:\"a\";i:108;s:1:\"b\";s:20:\"role.permission.view\";s:1:\"c\";s:6:\"seller\";}i:108;a:3:{s:1:\"a\";i:109;s:1:\"b\";s:20:\"role.permission.edit\";s:1:\"c\";s:6:\"seller\";}i:109;a:3:{s:1:\"a\";i:110;s:1:\"b\";s:18:\"system_user.create\";s:1:\"c\";s:6:\"seller\";}i:110;a:3:{s:1:\"a\";i:111;s:1:\"b\";s:16:\"system_user.edit\";s:1:\"c\";s:6:\"seller\";}i:111;a:3:{s:1:\"a\";i:112;s:1:\"b\";s:18:\"system_user.delete\";s:1:\"c\";s:6:\"seller\";}i:112;a:3:{s:1:\"a\";i:113;s:1:\"b\";s:16:\"system_user.view\";s:1:\"c\";s:6:\"seller\";}i:113;a:3:{s:1:\"a\";i:114;s:1:\"b\";s:10:\"store.view\";s:1:\"c\";s:6:\"seller\";}i:114;a:3:{s:1:\"a\";i:115;s:1:\"b\";s:12:\"store.create\";s:1:\"c\";s:6:\"seller\";}i:115;a:3:{s:1:\"a\";i:116;s:1:\"b\";s:10:\"store.edit\";s:1:\"c\";s:6:\"seller\";}i:116;a:3:{s:1:\"a\";i:117;s:1:\"b\";s:12:\"store.delete\";s:1:\"c\";s:6:\"seller\";}i:117;a:3:{s:1:\"a\";i:118;s:1:\"b\";s:14:\"attribute.view\";s:1:\"c\";s:6:\"seller\";}i:118;a:3:{s:1:\"a\";i:119;s:1:\"b\";s:16:\"attribute.create\";s:1:\"c\";s:6:\"seller\";}i:119;a:3:{s:1:\"a\";i:120;s:1:\"b\";s:14:\"attribute.edit\";s:1:\"c\";s:6:\"seller\";}i:120;a:3:{s:1:\"a\";i:121;s:1:\"b\";s:16:\"attribute.delete\";s:1:\"c\";s:6:\"seller\";}i:121;a:3:{s:1:\"a\";i:122;s:1:\"b\";s:24:\"product_condition.create\";s:1:\"c\";s:6:\"seller\";}i:122;a:3:{s:1:\"a\";i:123;s:1:\"b\";s:22:\"product_condition.edit\";s:1:\"c\";s:6:\"seller\";}i:123;a:3:{s:1:\"a\";i:124;s:1:\"b\";s:24:\"product_condition.delete\";s:1:\"c\";s:6:\"seller\";}i:124;a:3:{s:1:\"a\";i:125;s:1:\"b\";s:12:\"product.view\";s:1:\"c\";s:6:\"seller\";}i:125;a:3:{s:1:\"a\";i:126;s:1:\"b\";s:14:\"product.create\";s:1:\"c\";s:6:\"seller\";}i:126;a:3:{s:1:\"a\";i:127;s:1:\"b\";s:12:\"product.edit\";s:1:\"c\";s:6:\"seller\";}i:127;a:3:{s:1:\"a\";i:128;s:1:\"b\";s:14:\"product.delete\";s:1:\"c\";s:6:\"seller\";}i:128;a:3:{s:1:\"a\";i:129;s:1:\"b\";s:16:\"product_faq.view\";s:1:\"c\";s:6:\"seller\";}i:129;a:3:{s:1:\"a\";i:130;s:1:\"b\";s:18:\"product_faq.create\";s:1:\"c\";s:6:\"seller\";}i:130;a:3:{s:1:\"a\";i:131;s:1:\"b\";s:16:\"product_faq.edit\";s:1:\"c\";s:6:\"seller\";}i:131;a:3:{s:1:\"a\";i:132;s:1:\"b\";s:18:\"product_faq.delete\";s:1:\"c\";s:6:\"seller\";}i:132;a:3:{s:1:\"a\";i:133;s:1:\"b\";s:10:\"order.view\";s:1:\"c\";s:6:\"seller\";}i:133;a:3:{s:1:\"a\";i:134;s:1:\"b\";s:10:\"order.edit\";s:1:\"c\";s:6:\"seller\";}i:134;a:3:{s:1:\"a\";i:135;s:1:\"b\";s:19:\"order.update_status\";s:1:\"c\";s:6:\"seller\";}i:135;a:3:{s:1:\"a\";i:136;s:1:\"b\";s:12:\"earning.view\";s:1:\"c\";s:6:\"seller\";}i:136;a:3:{s:1:\"a\";i:137;s:1:\"b\";s:19:\"notification.create\";s:1:\"c\";s:6:\"seller\";}i:137;a:3:{s:1:\"a\";i:138;s:1:\"b\";s:17:\"notification.view\";s:1:\"c\";s:6:\"seller\";}i:138;a:3:{s:1:\"a\";i:139;s:1:\"b\";s:17:\"notification.edit\";s:1:\"c\";s:6:\"seller\";}i:139;a:3:{s:1:\"a\";i:140;s:1:\"b\";s:19:\"notification.delete\";s:1:\"c\";s:6:\"seller\";}i:140;a:3:{s:1:\"a\";i:141;s:1:\"b\";s:15:\"tax_rate.create\";s:1:\"c\";s:6:\"seller\";}i:141;a:3:{s:1:\"a\";i:142;s:1:\"b\";s:13:\"tax_rate.edit\";s:1:\"c\";s:6:\"seller\";}i:142;a:3:{s:1:\"a\";i:143;s:1:\"b\";s:15:\"tax_rate.delete\";s:1:\"c\";s:6:\"seller\";}i:143;a:3:{s:1:\"a\";i:144;s:1:\"b\";s:13:\"tax_rate.view\";s:1:\"c\";s:6:\"seller\";}i:144;a:3:{s:1:\"a\";i:145;s:1:\"b\";s:11:\"wallet.view\";s:1:\"c\";s:6:\"seller\";}i:145;a:3:{s:1:\"a\";i:146;s:1:\"b\";s:15:\"withdrawal.view\";s:1:\"c\";s:6:\"seller\";}i:146;a:3:{s:1:\"a\";i:147;s:1:\"b\";s:18:\"withdrawal.request\";s:1:\"c\";s:6:\"seller\";}i:147;a:3:{s:1:\"a\";i:148;s:1:\"b\";s:11:\"return.view\";s:1:\"c\";s:6:\"seller\";}i:148;a:3:{s:1:\"a\";i:149;s:1:\"b\";s:13:\"return.decide\";s:1:\"c\";s:6:\"seller\";}i:149;a:3:{s:1:\"a\";i:150;s:1:\"b\";s:13:\"category.view\";s:1:\"c\";s:6:\"seller\";}i:150;a:3:{s:1:\"a\";i:151;s:1:\"b\";s:10:\"brand.view\";s:1:\"c\";s:6:\"seller\";}i:151;a:3:{s:1:\"a\";i:152;s:1:\"b\";s:17:\"subscription.view\";s:1:\"c\";s:6:\"seller\";}i:152;a:3:{s:1:\"a\";i:153;s:1:\"b\";s:16:\"subscription.buy\";s:1:\"c\";s:6:\"seller\";}}s:5:\"roles\";a:0:{}}', 1775022696);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(191) NOT NULL,
  `owner` varchar(191) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_variant_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `save_for_later` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `requires_approval` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_home_category` tinyint(1) NOT NULL DEFAULT 0,
  `commission` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'Commission percentage for sellers',
  `background_type` enum('image','color') DEFAULT NULL,
  `background_color` varchar(7) DEFAULT NULL,
  `font_color` varchar(191) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_featured_section`
--

CREATE TABLE `category_featured_section` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `featured_section_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE `category_product` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_product_conditions`
--

CREATE TABLE `category_product_conditions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `product_condition_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

CREATE TABLE `collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `type` enum('manual','smart') NOT NULL,
  `visibility` enum('published','draft') NOT NULL,
  `description` text NOT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `iso3` char(3) NOT NULL,
  `iso2` char(2) NOT NULL,
  `numeric_code` char(3) NOT NULL,
  `phonecode` varchar(191) NOT NULL,
  `capital` varchar(191) DEFAULT NULL,
  `currency` varchar(3) NOT NULL,
  `currency_name` varchar(191) DEFAULT NULL,
  `currency_symbol` varchar(191) DEFAULT NULL,
  `tld` varchar(191) DEFAULT NULL,
  `native` varchar(191) DEFAULT NULL,
  `region` varchar(191) DEFAULT NULL,
  `subregion` varchar(191) DEFAULT NULL,
  `timezones` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`timezones`)),
  `translations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`translations`)),
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `emoji` varchar(191) DEFAULT NULL,
  `emojiU` varchar(191) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT NULL,
  `wikiDataId` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `iso3`, `iso2`, `numeric_code`, `phonecode`, `capital`, `currency`, `currency_name`, `currency_symbol`, `tld`, `native`, `region`, `subregion`, `timezones`, `translations`, `latitude`, `longitude`, `emoji`, `emojiU`, `flag`, `wikiDataId`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'AFG', 'AF', '004', '93', 'Kabul', 'AFN', 'Afghan afghani', '؋', '.af', 'افغانستان', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Asia/Kabul\",\"gmtOffset\":16200,\"gmtOffsetName\":\"UTC+04:30\",\"abbreviation\":\"AFT\",\"tzName\":\"Afghanistan Time\"}]', '{\"kr\":\"아프가니스탄\",\"br\":\"Afeganistão\",\"pt\":\"Afeganistão\",\"nl\":\"Afghanistan\",\"hr\":\"Afganistan\",\"fa\":\"افغانستان\",\"de\":\"Afghanistan\",\"es\":\"Afganistán\",\"fr\":\"Afghanistan\",\"ja\":\"アフガニスタン\",\"it\":\"Afghanistan\",\"cn\":\"阿富汗\"}', 33.00000000, 65.00000000, '??', 'U+1F1E6 U+1F1EB', 1, 'Q889', '2018-07-20 20:11:03', '2021-12-11 12:49:42'),
(2, 'Aland Islands', 'ALA', 'AX', '248', '+358-18', 'Mariehamn', 'EUR', 'Euro', '€', '.ax', 'Åland', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Mariehamn\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"올란드 제도\",\"br\":\"Ilhas de Aland\",\"pt\":\"Ilhas de Aland\",\"nl\":\"Ålandeilanden\",\"hr\":\"Ålandski otoci\",\"fa\":\"جزایر الند\",\"de\":\"Åland\",\"es\":\"Alandia\",\"fr\":\"Åland\",\"ja\":\"オーランド諸島\",\"it\":\"Isole Aland\",\"cn\":\"奥兰群岛\"}', 60.11666700, 19.90000000, '??', 'U+1F1E6 U+1F1FD', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 12:56:03'),
(3, 'Albania', 'ALB', 'AL', '008', '355', 'Tirana', 'ALL', 'Albanian lek', 'Lek', '.al', 'Shqipëria', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Tirane\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"알바니아\",\"br\":\"Albânia\",\"pt\":\"Albânia\",\"nl\":\"Albanië\",\"hr\":\"Albanija\",\"fa\":\"آلبانی\",\"de\":\"Albanien\",\"es\":\"Albania\",\"fr\":\"Albanie\",\"ja\":\"アルバニア\",\"it\":\"Albania\",\"cn\":\"阿尔巴尼亚\"}', 41.00000000, 20.00000000, '??', 'U+1F1E6 U+1F1F1', 1, 'Q222', '2018-07-20 20:11:03', '2021-12-11 12:50:01'),
(4, 'Algeria', 'DZA', 'DZ', '012', '213', 'Algiers', 'DZD', 'Algerian dinar', 'دج', '.dz', 'الجزائر', 'Africa', 'Northern Africa', '[{\"zoneName\":\"Africa/Algiers\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"알제리\",\"br\":\"Argélia\",\"pt\":\"Argélia\",\"nl\":\"Algerije\",\"hr\":\"Alžir\",\"fa\":\"الجزایر\",\"de\":\"Algerien\",\"es\":\"Argelia\",\"fr\":\"Algérie\",\"ja\":\"アルジェリア\",\"it\":\"Algeria\",\"cn\":\"阿尔及利亚\"}', 28.00000000, 3.00000000, '??', 'U+1F1E9 U+1F1FF', 1, 'Q262', '2018-07-20 20:11:03', '2021-12-11 12:50:10'),
(5, 'American Samoa', 'ASM', 'AS', '016', '+1-684', 'Pago Pago', 'USD', 'US Dollar', '$', '.as', 'American Samoa', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Pago_Pago\",\"gmtOffset\":-39600,\"gmtOffsetName\":\"UTC-11:00\",\"abbreviation\":\"SST\",\"tzName\":\"Samoa Standard Time\"}]', '{\"kr\":\"아메리칸사모아\",\"br\":\"Samoa Americana\",\"pt\":\"Samoa Americana\",\"nl\":\"Amerikaans Samoa\",\"hr\":\"Američka Samoa\",\"fa\":\"ساموآی آمریکا\",\"de\":\"Amerikanisch-Samoa\",\"es\":\"Samoa Americana\",\"fr\":\"Samoa américaines\",\"ja\":\"アメリカ領サモア\",\"it\":\"Samoa Americane\",\"cn\":\"美属萨摩亚\"}', -14.33333333, -170.00000000, '??', 'U+1F1E6 U+1F1F8', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 12:55:50'),
(6, 'Andorra', 'AND', 'AD', '020', '376', 'Andorra la Vella', 'EUR', 'Euro', '€', '.ad', 'Andorra', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Andorra\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"안도라\",\"br\":\"Andorra\",\"pt\":\"Andorra\",\"nl\":\"Andorra\",\"hr\":\"Andora\",\"fa\":\"آندورا\",\"de\":\"Andorra\",\"es\":\"Andorra\",\"fr\":\"Andorre\",\"ja\":\"アンドラ\",\"it\":\"Andorra\",\"cn\":\"安道尔\"}', 42.50000000, 1.50000000, '??', 'U+1F1E6 U+1F1E9', 1, 'Q228', '2018-07-20 20:11:03', '2021-12-11 12:50:22'),
(7, 'Angola', 'AGO', 'AO', '024', '244', 'Luanda', 'AOA', 'Angolan kwanza', 'Kz', '.ao', 'Angola', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Luanda\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"앙골라\",\"br\":\"Angola\",\"pt\":\"Angola\",\"nl\":\"Angola\",\"hr\":\"Angola\",\"fa\":\"آنگولا\",\"de\":\"Angola\",\"es\":\"Angola\",\"fr\":\"Angola\",\"ja\":\"アンゴラ\",\"it\":\"Angola\",\"cn\":\"安哥拉\"}', -12.50000000, 18.50000000, '??', 'U+1F1E6 U+1F1F4', 1, 'Q916', '2018-07-20 20:11:03', '2021-12-11 12:50:31'),
(8, 'Anguilla', 'AIA', 'AI', '660', '+1-264', 'The Valley', 'XCD', 'East Caribbean dollar', '$', '.ai', 'Anguilla', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Anguilla\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"앵귈라\",\"br\":\"Anguila\",\"pt\":\"Anguila\",\"nl\":\"Anguilla\",\"hr\":\"Angvila\",\"fa\":\"آنگویلا\",\"de\":\"Anguilla\",\"es\":\"Anguilla\",\"fr\":\"Anguilla\",\"ja\":\"アンギラ\",\"it\":\"Anguilla\",\"cn\":\"安圭拉\"}', 18.25000000, -63.16666666, '??', 'U+1F1E6 U+1F1EE', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 12:50:46'),
(9, 'Antarctica', 'ATA', 'AQ', '010', '672', '', 'AAD', 'Antarctican dollar', '$', '.aq', 'Antarctica', 'Polar', '', '[{\"zoneName\":\"Antarctica/Casey\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"AWST\",\"tzName\":\"Australian Western Standard Time\"},{\"zoneName\":\"Antarctica/Davis\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"DAVT\",\"tzName\":\"Davis Time\"},{\"zoneName\":\"Antarctica/DumontDUrville\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"DDUT\",\"tzName\":\"Dumont d\'Urville Time\"},{\"zoneName\":\"Antarctica/Mawson\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"MAWT\",\"tzName\":\"Mawson Station Time\"},{\"zoneName\":\"Antarctica/McMurdo\",\"gmtOffset\":46800,\"gmtOffsetName\":\"UTC+13:00\",\"abbreviation\":\"NZDT\",\"tzName\":\"New Zealand Daylight Time\"},{\"zoneName\":\"Antarctica/Palmer\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"CLST\",\"tzName\":\"Chile Summer Time\"},{\"zoneName\":\"Antarctica/Rothera\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ROTT\",\"tzName\":\"Rothera Research Station Time\"},{\"zoneName\":\"Antarctica/Syowa\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"SYOT\",\"tzName\":\"Showa Station Time\"},{\"zoneName\":\"Antarctica/Troll\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"},{\"zoneName\":\"Antarctica/Vostok\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"VOST\",\"tzName\":\"Vostok Station Time\"}]', '{\"kr\":\"남극\",\"br\":\"Antártida\",\"pt\":\"Antárctida\",\"nl\":\"Antarctica\",\"hr\":\"Antarktika\",\"fa\":\"جنوبگان\",\"de\":\"Antarktika\",\"es\":\"Antártida\",\"fr\":\"Antarctique\",\"ja\":\"南極大陸\",\"it\":\"Antartide\",\"cn\":\"南极洲\"}', -74.65000000, 4.48000000, '??', 'U+1F1E6 U+1F1F6', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:49:17'),
(10, 'Antigua And Barbuda', 'ATG', 'AG', '028', '+1-268', 'St. John\'s', 'XCD', 'Eastern Caribbean dollar', '$', '.ag', 'Antigua and Barbuda', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Antigua\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"앤티가 바부다\",\"br\":\"Antígua e Barbuda\",\"pt\":\"Antígua e Barbuda\",\"nl\":\"Antigua en Barbuda\",\"hr\":\"Antigva i Barbuda\",\"fa\":\"آنتیگوا و باربودا\",\"de\":\"Antigua und Barbuda\",\"es\":\"Antigua y Barbuda\",\"fr\":\"Antigua-et-Barbuda\",\"ja\":\"アンティグア・バーブーダ\",\"it\":\"Antigua e Barbuda\",\"cn\":\"安提瓜和巴布达\"}', 17.05000000, -61.80000000, '??', 'U+1F1E6 U+1F1EC', 1, 'Q781', '2018-07-20 20:11:03', '2021-12-11 12:56:34'),
(11, 'Argentina', 'ARG', 'AR', '032', '54', 'Buenos Aires', 'ARS', 'Argentine peso', '$', '.ar', 'Argentina', 'Americas', 'South America', '[{\"zoneName\":\"America/Argentina/Buenos_Aires\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Catamarca\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Cordoba\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Jujuy\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/La_Rioja\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Mendoza\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Rio_Gallegos\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Salta\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/San_Juan\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/San_Luis\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Tucuman\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"},{\"zoneName\":\"America/Argentina/Ushuaia\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"ART\",\"tzName\":\"Argentina Time\"}]', '{\"kr\":\"아르헨티나\",\"br\":\"Argentina\",\"pt\":\"Argentina\",\"nl\":\"Argentinië\",\"hr\":\"Argentina\",\"fa\":\"آرژانتین\",\"de\":\"Argentinien\",\"es\":\"Argentina\",\"fr\":\"Argentine\",\"ja\":\"アルゼンチン\",\"it\":\"Argentina\",\"cn\":\"阿根廷\"}', -34.00000000, -64.00000000, '??', 'U+1F1E6 U+1F1F7', 1, 'Q414', '2018-07-20 20:11:03', '2021-12-11 12:51:01'),
(12, 'Armenia', 'ARM', 'AM', '051', '374', 'Yerevan', 'AMD', 'Armenian dram', '֏', '.am', 'Հայաստան', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Yerevan\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"AMT\",\"tzName\":\"Armenia Time\"}]', '{\"kr\":\"아르메니아\",\"br\":\"Armênia\",\"pt\":\"Arménia\",\"nl\":\"Armenië\",\"hr\":\"Armenija\",\"fa\":\"ارمنستان\",\"de\":\"Armenien\",\"es\":\"Armenia\",\"fr\":\"Arménie\",\"ja\":\"アルメニア\",\"it\":\"Armenia\",\"cn\":\"亚美尼亚\"}', 40.00000000, 45.00000000, '??', 'U+1F1E6 U+1F1F2', 1, 'Q399', '2018-07-20 20:11:03', '2021-12-11 12:51:06'),
(13, 'Aruba', 'ABW', 'AW', '533', '297', 'Oranjestad', 'AWG', 'Aruban florin', 'ƒ', '.aw', 'Aruba', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Aruba\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"아루바\",\"br\":\"Aruba\",\"pt\":\"Aruba\",\"nl\":\"Aruba\",\"hr\":\"Aruba\",\"fa\":\"آروبا\",\"de\":\"Aruba\",\"es\":\"Aruba\",\"fr\":\"Aruba\",\"ja\":\"アルバ\",\"it\":\"Aruba\",\"cn\":\"阿鲁巴\"}', 12.50000000, -69.96666666, '??', 'U+1F1E6 U+1F1FC', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 12:56:47'),
(14, 'Australia', 'AUS', 'AU', '036', '61', 'Canberra', 'AUD', 'Australian dollar', '$', '.au', 'Australia', 'Oceania', 'Australia and New Zealand', '[{\"zoneName\":\"Antarctica/Macquarie\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"MIST\",\"tzName\":\"Macquarie Island Station Time\"},{\"zoneName\":\"Australia/Adelaide\",\"gmtOffset\":37800,\"gmtOffsetName\":\"UTC+10:30\",\"abbreviation\":\"ACDT\",\"tzName\":\"Australian Central Daylight Saving Time\"},{\"zoneName\":\"Australia/Brisbane\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"AEST\",\"tzName\":\"Australian Eastern Standard Time\"},{\"zoneName\":\"Australia/Broken_Hill\",\"gmtOffset\":37800,\"gmtOffsetName\":\"UTC+10:30\",\"abbreviation\":\"ACDT\",\"tzName\":\"Australian Central Daylight Saving Time\"},{\"zoneName\":\"Australia/Currie\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"AEDT\",\"tzName\":\"Australian Eastern Daylight Saving Time\"},{\"zoneName\":\"Australia/Darwin\",\"gmtOffset\":34200,\"gmtOffsetName\":\"UTC+09:30\",\"abbreviation\":\"ACST\",\"tzName\":\"Australian Central Standard Time\"},{\"zoneName\":\"Australia/Eucla\",\"gmtOffset\":31500,\"gmtOffsetName\":\"UTC+08:45\",\"abbreviation\":\"ACWST\",\"tzName\":\"Australian Central Western Standard Time (Unofficial)\"},{\"zoneName\":\"Australia/Hobart\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"AEDT\",\"tzName\":\"Australian Eastern Daylight Saving Time\"},{\"zoneName\":\"Australia/Lindeman\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"AEST\",\"tzName\":\"Australian Eastern Standard Time\"},{\"zoneName\":\"Australia/Lord_Howe\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"LHST\",\"tzName\":\"Lord Howe Summer Time\"},{\"zoneName\":\"Australia/Melbourne\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"AEDT\",\"tzName\":\"Australian Eastern Daylight Saving Time\"},{\"zoneName\":\"Australia/Perth\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"AWST\",\"tzName\":\"Australian Western Standard Time\"},{\"zoneName\":\"Australia/Sydney\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"AEDT\",\"tzName\":\"Australian Eastern Daylight Saving Time\"}]', '{\"kr\":\"호주\",\"br\":\"Austrália\",\"pt\":\"Austrália\",\"nl\":\"Australië\",\"hr\":\"Australija\",\"fa\":\"استرالیا\",\"de\":\"Australien\",\"es\":\"Australia\",\"fr\":\"Australie\",\"ja\":\"オーストラリア\",\"it\":\"Australia\",\"cn\":\"澳大利亚\"}', -27.00000000, 133.00000000, '??', 'U+1F1E6 U+1F1FA', 1, 'Q408', '2018-07-20 20:11:03', '2021-12-11 12:51:23'),
(15, 'Austria', 'AUT', 'AT', '040', '43', 'Vienna', 'EUR', 'Euro', '€', '.at', 'Österreich', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Vienna\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"오스트리아\",\"br\":\"áustria\",\"pt\":\"áustria\",\"nl\":\"Oostenrijk\",\"hr\":\"Austrija\",\"fa\":\"اتریش\",\"de\":\"Österreich\",\"es\":\"Austria\",\"fr\":\"Autriche\",\"ja\":\"オーストリア\",\"it\":\"Austria\",\"cn\":\"奥地利\"}', 47.33333333, 13.33333333, '??', 'U+1F1E6 U+1F1F9', 1, 'Q40', '2018-07-20 20:11:03', '2021-12-11 12:51:35'),
(16, 'Azerbaijan', 'AZE', 'AZ', '031', '994', 'Baku', 'AZN', 'Azerbaijani manat', 'm', '.az', 'Azərbaycan', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Baku\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"AZT\",\"tzName\":\"Azerbaijan Time\"}]', '{\"kr\":\"아제르바이잔\",\"br\":\"Azerbaijão\",\"pt\":\"Azerbaijão\",\"nl\":\"Azerbeidzjan\",\"hr\":\"Azerbajdžan\",\"fa\":\"آذربایجان\",\"de\":\"Aserbaidschan\",\"es\":\"Azerbaiyán\",\"fr\":\"Azerbaïdjan\",\"ja\":\"アゼルバイジャン\",\"it\":\"Azerbaijan\",\"cn\":\"阿塞拜疆\"}', 40.50000000, 47.50000000, '??', 'U+1F1E6 U+1F1FF', 1, 'Q227', '2018-07-20 20:11:03', '2021-12-11 12:51:43'),
(17, 'The Bahamas', 'BHS', 'BS', '044', '+1-242', 'Nassau', 'BSD', 'Bahamian dollar', 'B$', '.bs', 'Bahamas', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Nassau\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America)\"}]', '{\"kr\":\"바하마\",\"br\":\"Bahamas\",\"pt\":\"Baamas\",\"nl\":\"Bahama’s\",\"hr\":\"Bahami\",\"fa\":\"باهاما\",\"de\":\"Bahamas\",\"es\":\"Bahamas\",\"fr\":\"Bahamas\",\"ja\":\"バハマ\",\"it\":\"Bahamas\",\"cn\":\"巴哈马\"}', 24.25000000, -76.00000000, '??', 'U+1F1E7 U+1F1F8', 1, 'Q778', '2018-07-20 20:11:03', '2022-03-13 10:58:29'),
(18, 'Bahrain', 'BHR', 'BH', '048', '973', 'Manama', 'BHD', 'Bahraini dinar', '.د.ب', '.bh', '‏البحرين', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Bahrain\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"AST\",\"tzName\":\"Arabia Standard Time\"}]', '{\"kr\":\"바레인\",\"br\":\"Bahrein\",\"pt\":\"Barém\",\"nl\":\"Bahrein\",\"hr\":\"Bahrein\",\"fa\":\"بحرین\",\"de\":\"Bahrain\",\"es\":\"Bahrein\",\"fr\":\"Bahreïn\",\"ja\":\"バーレーン\",\"it\":\"Bahrein\",\"cn\":\"巴林\"}', 26.00000000, 50.55000000, '??', 'U+1F1E7 U+1F1ED', 1, 'Q398', '2018-07-20 20:11:03', '2021-12-11 12:51:58'),
(19, 'Bangladesh', 'BGD', 'BD', '050', '880', 'Dhaka', 'BDT', 'Bangladeshi taka', '৳', '.bd', 'Bangladesh', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Asia/Dhaka\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"BDT\",\"tzName\":\"Bangladesh Standard Time\"}]', '{\"kr\":\"방글라데시\",\"br\":\"Bangladesh\",\"pt\":\"Bangladeche\",\"nl\":\"Bangladesh\",\"hr\":\"Bangladeš\",\"fa\":\"بنگلادش\",\"de\":\"Bangladesch\",\"es\":\"Bangladesh\",\"fr\":\"Bangladesh\",\"ja\":\"バングラデシュ\",\"it\":\"Bangladesh\",\"cn\":\"孟加拉\"}', 24.00000000, 90.00000000, '??', 'U+1F1E7 U+1F1E9', 1, 'Q902', '2018-07-20 20:11:03', '2021-12-11 12:52:04'),
(20, 'Barbados', 'BRB', 'BB', '052', '+1-246', 'Bridgetown', 'BBD', 'Barbadian dollar', 'Bds$', '.bb', 'Barbados', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Barbados\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"바베이도스\",\"br\":\"Barbados\",\"pt\":\"Barbados\",\"nl\":\"Barbados\",\"hr\":\"Barbados\",\"fa\":\"باربادوس\",\"de\":\"Barbados\",\"es\":\"Barbados\",\"fr\":\"Barbade\",\"ja\":\"バルバドス\",\"it\":\"Barbados\",\"cn\":\"巴巴多斯\"}', 13.16666666, -59.53333333, '??', 'U+1F1E7 U+1F1E7', 1, 'Q244', '2018-07-20 20:11:03', '2021-12-11 12:57:03'),
(21, 'Belarus', 'BLR', 'BY', '112', '375', 'Minsk', 'BYN', 'Belarusian ruble', 'Br', '.by', 'Белару́сь', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Minsk\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"MSK\",\"tzName\":\"Moscow Time\"}]', '{\"kr\":\"벨라루스\",\"br\":\"Bielorrússia\",\"pt\":\"Bielorrússia\",\"nl\":\"Wit-Rusland\",\"hr\":\"Bjelorusija\",\"fa\":\"بلاروس\",\"de\":\"Weißrussland\",\"es\":\"Bielorrusia\",\"fr\":\"Biélorussie\",\"ja\":\"ベラルーシ\",\"it\":\"Bielorussia\",\"cn\":\"白俄罗斯\"}', 53.00000000, 28.00000000, '??', 'U+1F1E7 U+1F1FE', 1, 'Q184', '2018-07-20 20:11:03', '2021-12-11 12:57:09'),
(22, 'Belgium', 'BEL', 'BE', '056', '32', 'Brussels', 'EUR', 'Euro', '€', '.be', 'België', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Brussels\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"벨기에\",\"br\":\"Bélgica\",\"pt\":\"Bélgica\",\"nl\":\"België\",\"hr\":\"Belgija\",\"fa\":\"بلژیک\",\"de\":\"Belgien\",\"es\":\"Bélgica\",\"fr\":\"Belgique\",\"ja\":\"ベルギー\",\"it\":\"Belgio\",\"cn\":\"比利时\"}', 50.83333333, 4.00000000, '??', 'U+1F1E7 U+1F1EA', 1, 'Q31', '2018-07-20 20:11:03', '2021-12-11 12:57:15'),
(23, 'Belize', 'BLZ', 'BZ', '084', '501', 'Belmopan', 'BZD', 'Belize dollar', '$', '.bz', 'Belize', 'Americas', 'Central America', '[{\"zoneName\":\"America/Belize\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America)\"}]', '{\"kr\":\"벨리즈\",\"br\":\"Belize\",\"pt\":\"Belize\",\"nl\":\"Belize\",\"hr\":\"Belize\",\"fa\":\"بلیز\",\"de\":\"Belize\",\"es\":\"Belice\",\"fr\":\"Belize\",\"ja\":\"ベリーズ\",\"it\":\"Belize\",\"cn\":\"伯利兹\"}', 17.25000000, -88.75000000, '??', 'U+1F1E7 U+1F1FF', 1, 'Q242', '2018-07-20 20:11:03', '2021-12-11 12:57:21'),
(24, 'Benin', 'BEN', 'BJ', '204', '229', 'Porto-Novo', 'XOF', 'West African CFA franc', 'CFA', '.bj', 'Bénin', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Porto-Novo\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"베냉\",\"br\":\"Benin\",\"pt\":\"Benim\",\"nl\":\"Benin\",\"hr\":\"Benin\",\"fa\":\"بنین\",\"de\":\"Benin\",\"es\":\"Benín\",\"fr\":\"Bénin\",\"ja\":\"ベナン\",\"it\":\"Benin\",\"cn\":\"贝宁\"}', 9.50000000, 2.25000000, '??', 'U+1F1E7 U+1F1EF', 1, 'Q962', '2018-07-20 20:11:03', '2021-12-11 12:57:27'),
(25, 'Bermuda', 'BMU', 'BM', '060', '+1-441', 'Hamilton', 'BMD', 'Bermudian dollar', '$', '.bm', 'Bermuda', 'Americas', 'Northern America', '[{\"zoneName\":\"Atlantic/Bermuda\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"버뮤다\",\"br\":\"Bermudas\",\"pt\":\"Bermudas\",\"nl\":\"Bermuda\",\"hr\":\"Bermudi\",\"fa\":\"برمودا\",\"de\":\"Bermuda\",\"es\":\"Bermudas\",\"fr\":\"Bermudes\",\"ja\":\"バミューダ\",\"it\":\"Bermuda\",\"cn\":\"百慕大\"}', 32.33333333, -64.75000000, '??', 'U+1F1E7 U+1F1F2', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 12:57:32'),
(26, 'Bhutan', 'BTN', 'BT', '064', '975', 'Thimphu', 'BTN', 'Bhutanese ngultrum', 'Nu.', '.bt', 'ʼbrug-yul', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Asia/Thimphu\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"BTT\",\"tzName\":\"Bhutan Time\"}]', '{\"kr\":\"부탄\",\"br\":\"Butão\",\"pt\":\"Butão\",\"nl\":\"Bhutan\",\"hr\":\"Butan\",\"fa\":\"بوتان\",\"de\":\"Bhutan\",\"es\":\"Bután\",\"fr\":\"Bhoutan\",\"ja\":\"ブータン\",\"it\":\"Bhutan\",\"cn\":\"不丹\"}', 27.50000000, 90.50000000, '??', 'U+1F1E7 U+1F1F9', 1, 'Q917', '2018-07-20 20:11:03', '2021-12-11 12:57:38'),
(27, 'Bolivia', 'BOL', 'BO', '068', '591', 'Sucre', 'BOB', 'Bolivian boliviano', 'Bs.', '.bo', 'Bolivia', 'Americas', 'South America', '[{\"zoneName\":\"America/La_Paz\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"BOT\",\"tzName\":\"Bolivia Time\"}]', '{\"kr\":\"볼리비아\",\"br\":\"Bolívia\",\"pt\":\"Bolívia\",\"nl\":\"Bolivia\",\"hr\":\"Bolivija\",\"fa\":\"بولیوی\",\"de\":\"Bolivien\",\"es\":\"Bolivia\",\"fr\":\"Bolivie\",\"ja\":\"ボリビア多民族国\",\"it\":\"Bolivia\",\"cn\":\"玻利维亚\"}', -17.00000000, -65.00000000, '??', 'U+1F1E7 U+1F1F4', 1, 'Q750', '2018-07-20 20:11:03', '2021-12-11 12:57:50'),
(28, 'Bosnia and Herzegovina', 'BIH', 'BA', '070', '387', 'Sarajevo', 'BAM', 'Bosnia and Herzegovina convertible mark', 'KM', '.ba', 'Bosna i Hercegovina', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Sarajevo\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"보스니아 헤르체고비나\",\"br\":\"Bósnia e Herzegovina\",\"pt\":\"Bósnia e Herzegovina\",\"nl\":\"Bosnië en Herzegovina\",\"hr\":\"Bosna i Hercegovina\",\"fa\":\"بوسنی و هرزگوین\",\"de\":\"Bosnien und Herzegowina\",\"es\":\"Bosnia y Herzegovina\",\"fr\":\"Bosnie-Herzégovine\",\"ja\":\"ボスニア・ヘルツェゴビナ\",\"it\":\"Bosnia ed Erzegovina\",\"cn\":\"波斯尼亚和黑塞哥维那\"}', 44.00000000, 18.00000000, '??', 'U+1F1E7 U+1F1E6', 1, 'Q225', '2018-07-20 20:11:03', '2021-12-11 12:58:10'),
(29, 'Botswana', 'BWA', 'BW', '072', '267', 'Gaborone', 'BWP', 'Botswana pula', 'P', '.bw', 'Botswana', 'Africa', 'Southern Africa', '[{\"zoneName\":\"Africa/Gaborone\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]', '{\"kr\":\"보츠와나\",\"br\":\"Botsuana\",\"pt\":\"Botsuana\",\"nl\":\"Botswana\",\"hr\":\"Bocvana\",\"fa\":\"بوتسوانا\",\"de\":\"Botswana\",\"es\":\"Botswana\",\"fr\":\"Botswana\",\"ja\":\"ボツワナ\",\"it\":\"Botswana\",\"cn\":\"博茨瓦纳\"}', -22.00000000, 24.00000000, '??', 'U+1F1E7 U+1F1FC', 1, 'Q963', '2018-07-20 20:11:03', '2021-12-11 12:58:22'),
(30, 'Bouvet Island', 'BVT', 'BV', '074', '0055', '', 'NOK', 'Norwegian Krone', 'kr', '.bv', 'Bouvetøya', '', '', '[{\"zoneName\":\"Europe/Oslo\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"부벳 섬\",\"br\":\"Ilha Bouvet\",\"pt\":\"Ilha Bouvet\",\"nl\":\"Bouveteiland\",\"hr\":\"Otok Bouvet\",\"fa\":\"جزیره بووه\",\"de\":\"Bouvetinsel\",\"es\":\"Isla Bouvet\",\"fr\":\"Île Bouvet\",\"ja\":\"ブーベ島\",\"it\":\"Isola Bouvet\",\"cn\":\"布维岛\"}', -54.43333333, 3.40000000, '??', 'U+1F1E7 U+1F1FB', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:47:50'),
(31, 'Brazil', 'BRA', 'BR', '076', '55', 'Brasilia', 'BRL', 'Brazilian real', 'R$', '.br', 'Brasil', 'Americas', 'South America', '[{\"zoneName\":\"America/Araguaina\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Brasília Time\"},{\"zoneName\":\"America/Bahia\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Brasília Time\"},{\"zoneName\":\"America/Belem\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Brasília Time\"},{\"zoneName\":\"America/Boa_Vista\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AMT\",\"tzName\":\"Amazon Time (Brazil)[3\"},{\"zoneName\":\"America/Campo_Grande\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AMT\",\"tzName\":\"Amazon Time (Brazil)[3\"},{\"zoneName\":\"America/Cuiaba\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Brasilia Time\"},{\"zoneName\":\"America/Eirunepe\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"ACT\",\"tzName\":\"Acre Time\"},{\"zoneName\":\"America/Fortaleza\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Brasília Time\"},{\"zoneName\":\"America/Maceio\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Brasília Time\"},{\"zoneName\":\"America/Manaus\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AMT\",\"tzName\":\"Amazon Time (Brazil)\"},{\"zoneName\":\"America/Noronha\",\"gmtOffset\":-7200,\"gmtOffsetName\":\"UTC-02:00\",\"abbreviation\":\"FNT\",\"tzName\":\"Fernando de Noronha Time\"},{\"zoneName\":\"America/Porto_Velho\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AMT\",\"tzName\":\"Amazon Time (Brazil)[3\"},{\"zoneName\":\"America/Recife\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Brasília Time\"},{\"zoneName\":\"America/Rio_Branco\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"ACT\",\"tzName\":\"Acre Time\"},{\"zoneName\":\"America/Santarem\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Brasília Time\"},{\"zoneName\":\"America/Sao_Paulo\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"BRT\",\"tzName\":\"Brasília Time\"}]', '{\"kr\":\"브라질\",\"br\":\"Brasil\",\"pt\":\"Brasil\",\"nl\":\"Brazilië\",\"hr\":\"Brazil\",\"fa\":\"برزیل\",\"de\":\"Brasilien\",\"es\":\"Brasil\",\"fr\":\"Brésil\",\"ja\":\"ブラジル\",\"it\":\"Brasile\",\"cn\":\"巴西\"}', -10.00000000, -55.00000000, '??', 'U+1F1E7 U+1F1F7', 1, 'Q155', '2018-07-20 20:11:03', '2021-12-11 12:58:56'),
(32, 'British Indian Ocean Territory', 'IOT', 'IO', '086', '246', 'Diego Garcia', 'USD', 'United States dollar', '$', '.io', 'British Indian Ocean Territory', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Indian/Chagos\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"IOT\",\"tzName\":\"Indian Ocean Time\"}]', '{\"kr\":\"영국령 인도양 지역\",\"br\":\"Território Britânico do Oceano íÍdico\",\"pt\":\"Território Britânico do Oceano Índico\",\"nl\":\"Britse Gebieden in de Indische Oceaan\",\"hr\":\"Britanski Indijskooceanski teritorij\",\"fa\":\"قلمرو بریتانیا در اقیانوس هند\",\"de\":\"Britisches Territorium im Indischen Ozean\",\"es\":\"Territorio Británico del Océano Índico\",\"fr\":\"Territoire britannique de l\'océan Indien\",\"ja\":\"イギリス領インド洋地域\",\"it\":\"Territorio britannico dell\'oceano indiano\",\"cn\":\"英属印度洋领地\"}', -6.00000000, 71.50000000, '??', 'U+1F1EE U+1F1F4', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 12:59:10'),
(33, 'Brunei', 'BRN', 'BN', '096', '673', 'Bandar Seri Begawan', 'BND', 'Brunei dollar', 'B$', '.bn', 'Negara Brunei Darussalam', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Brunei\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"BNT\",\"tzName\":\"Brunei Darussalam Time\"}]', '{\"kr\":\"브루나이\",\"br\":\"Brunei\",\"pt\":\"Brunei\",\"nl\":\"Brunei\",\"hr\":\"Brunej\",\"fa\":\"برونئی\",\"de\":\"Brunei\",\"es\":\"Brunei\",\"fr\":\"Brunei\",\"ja\":\"ブルネイ・ダルサラーム\",\"it\":\"Brunei\",\"cn\":\"文莱\"}', 4.50000000, 114.66666666, '??', 'U+1F1E7 U+1F1F3', 1, 'Q921', '2018-07-20 20:11:03', '2021-12-11 12:59:19'),
(34, 'Bulgaria', 'BGR', 'BG', '100', '359', 'Sofia', 'BGN', 'Bulgarian lev', 'Лв.', '.bg', 'България', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Sofia\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"불가리아\",\"br\":\"Bulgária\",\"pt\":\"Bulgária\",\"nl\":\"Bulgarije\",\"hr\":\"Bugarska\",\"fa\":\"بلغارستان\",\"de\":\"Bulgarien\",\"es\":\"Bulgaria\",\"fr\":\"Bulgarie\",\"ja\":\"ブルガリア\",\"it\":\"Bulgaria\",\"cn\":\"保加利亚\"}', 43.00000000, 25.00000000, '??', 'U+1F1E7 U+1F1EC', 1, 'Q219', '2018-07-20 20:11:03', '2021-12-11 12:59:26'),
(35, 'Burkina Faso', 'BFA', 'BF', '854', '226', 'Ouagadougou', 'XOF', 'West African CFA franc', 'CFA', '.bf', 'Burkina Faso', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Ouagadougou\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"부르키나 파소\",\"br\":\"Burkina Faso\",\"pt\":\"Burquina Faso\",\"nl\":\"Burkina Faso\",\"hr\":\"Burkina Faso\",\"fa\":\"بورکینافاسو\",\"de\":\"Burkina Faso\",\"es\":\"Burkina Faso\",\"fr\":\"Burkina Faso\",\"ja\":\"ブルキナファソ\",\"it\":\"Burkina Faso\",\"cn\":\"布基纳法索\"}', 13.00000000, -2.00000000, '??', 'U+1F1E7 U+1F1EB', 1, 'Q965', '2018-07-20 20:11:03', '2021-12-11 12:59:35'),
(36, 'Burundi', 'BDI', 'BI', '108', '257', 'Bujumbura', 'BIF', 'Burundian franc', 'FBu', '.bi', 'Burundi', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Bujumbura\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]', '{\"kr\":\"부룬디\",\"br\":\"Burundi\",\"pt\":\"Burúndi\",\"nl\":\"Burundi\",\"hr\":\"Burundi\",\"fa\":\"بوروندی\",\"de\":\"Burundi\",\"es\":\"Burundi\",\"fr\":\"Burundi\",\"ja\":\"ブルンジ\",\"it\":\"Burundi\",\"cn\":\"布隆迪\"}', -3.50000000, 30.00000000, '??', 'U+1F1E7 U+1F1EE', 1, 'Q967', '2018-07-20 20:11:03', '2021-12-11 12:59:42'),
(37, 'Cambodia', 'KHM', 'KH', '116', '855', 'Phnom Penh', 'KHR', 'Cambodian riel', 'KHR', '.kh', 'Kâmpŭchéa', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Phnom_Penh\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"ICT\",\"tzName\":\"Indochina Time\"}]', '{\"kr\":\"캄보디아\",\"br\":\"Camboja\",\"pt\":\"Camboja\",\"nl\":\"Cambodja\",\"hr\":\"Kambodža\",\"fa\":\"کامبوج\",\"de\":\"Kambodscha\",\"es\":\"Camboya\",\"fr\":\"Cambodge\",\"ja\":\"カンボジア\",\"it\":\"Cambogia\",\"cn\":\"柬埔寨\"}', 13.00000000, 105.00000000, '??', 'U+1F1F0 U+1F1ED', 1, 'Q424', '2018-07-20 20:11:03', '2021-12-11 12:59:47'),
(38, 'Cameroon', 'CMR', 'CM', '120', '237', 'Yaounde', 'XAF', 'Central African CFA franc', 'FCFA', '.cm', 'Cameroon', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Douala\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"카메룬\",\"br\":\"Camarões\",\"pt\":\"Camarões\",\"nl\":\"Kameroen\",\"hr\":\"Kamerun\",\"fa\":\"کامرون\",\"de\":\"Kamerun\",\"es\":\"Camerún\",\"fr\":\"Cameroun\",\"ja\":\"カメルーン\",\"it\":\"Camerun\",\"cn\":\"喀麦隆\"}', 6.00000000, 12.00000000, '??', 'U+1F1E8 U+1F1F2', 1, 'Q1009', '2018-07-20 20:11:03', '2021-12-11 12:59:54'),
(39, 'Canada', 'CAN', 'CA', '124', '1', 'Ottawa', 'CAD', 'Canadian dollar', '$', '.ca', 'Canada', 'Americas', 'Northern America', '[{\"zoneName\":\"America/Atikokan\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America)\"},{\"zoneName\":\"America/Blanc-Sablon\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"},{\"zoneName\":\"America/Cambridge_Bay\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America)\"},{\"zoneName\":\"America/Creston\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America)\"},{\"zoneName\":\"America/Dawson\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America)\"},{\"zoneName\":\"America/Dawson_Creek\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America)\"},{\"zoneName\":\"America/Edmonton\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America)\"},{\"zoneName\":\"America/Fort_Nelson\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America)\"},{\"zoneName\":\"America/Glace_Bay\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"},{\"zoneName\":\"America/Goose_Bay\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"},{\"zoneName\":\"America/Halifax\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"},{\"zoneName\":\"America/Inuvik\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Iqaluit\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Moncton\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"},{\"zoneName\":\"America/Nipigon\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Pangnirtung\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Rainy_River\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Rankin_Inlet\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Regina\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Resolute\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/St_Johns\",\"gmtOffset\":-12600,\"gmtOffsetName\":\"UTC-03:30\",\"abbreviation\":\"NST\",\"tzName\":\"Newfoundland Standard Time\"},{\"zoneName\":\"America/Swift_Current\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Thunder_Bay\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Toronto\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Vancouver\",\"gmtOffset\":-28800,\"gmtOffsetName\":\"UTC-08:00\",\"abbreviation\":\"PST\",\"tzName\":\"Pacific Standard Time (North America\"},{\"zoneName\":\"America/Whitehorse\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Winnipeg\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Yellowknife\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"}]', '{\"kr\":\"캐나다\",\"br\":\"Canadá\",\"pt\":\"Canadá\",\"nl\":\"Canada\",\"hr\":\"Kanada\",\"fa\":\"کانادا\",\"de\":\"Kanada\",\"es\":\"Canadá\",\"fr\":\"Canada\",\"ja\":\"カナダ\",\"it\":\"Canada\",\"cn\":\"加拿大\"}', 60.00000000, -95.00000000, '??', 'U+1F1E8 U+1F1E6', 1, 'Q16', '2018-07-20 20:11:03', '2021-12-11 12:59:58'),
(40, 'Cape Verde', 'CPV', 'CV', '132', '238', 'Praia', 'CVE', 'Cape Verdean escudo', '$', '.cv', 'Cabo Verde', 'Africa', 'Western Africa', '[{\"zoneName\":\"Atlantic/Cape_Verde\",\"gmtOffset\":-3600,\"gmtOffsetName\":\"UTC-01:00\",\"abbreviation\":\"CVT\",\"tzName\":\"Cape Verde Time\"}]', '{\"kr\":\"카보베르데\",\"br\":\"Cabo Verde\",\"pt\":\"Cabo Verde\",\"nl\":\"Kaapverdië\",\"hr\":\"Zelenortska Republika\",\"fa\":\"کیپ ورد\",\"de\":\"Kap Verde\",\"es\":\"Cabo Verde\",\"fr\":\"Cap Vert\",\"ja\":\"カーボベルデ\",\"it\":\"Capo Verde\",\"cn\":\"佛得角\"}', 16.00000000, -24.00000000, '??', 'U+1F1E8 U+1F1FB', 1, 'Q1011', '2018-07-20 20:11:03', '2021-12-11 13:00:03'),
(41, 'Cayman Islands', 'CYM', 'KY', '136', '+1-345', 'George Town', 'KYD', 'Cayman Islands dollar', '$', '.ky', 'Cayman Islands', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Cayman\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"}]', '{\"kr\":\"케이먼 제도\",\"br\":\"Ilhas Cayman\",\"pt\":\"Ilhas Caimão\",\"nl\":\"Caymaneilanden\",\"hr\":\"Kajmanski otoci\",\"fa\":\"جزایر کیمن\",\"de\":\"Kaimaninseln\",\"es\":\"Islas Caimán\",\"fr\":\"Îles Caïmans\",\"ja\":\"ケイマン諸島\",\"it\":\"Isole Cayman\",\"cn\":\"开曼群岛\"}', 19.50000000, -80.50000000, '??', 'U+1F1F0 U+1F1FE', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:00:09'),
(42, 'Central African Republic', 'CAF', 'CF', '140', '236', 'Bangui', 'XAF', 'Central African CFA franc', 'FCFA', '.cf', 'Ködörösêse tî Bêafrîka', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Bangui\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"중앙아프리카 공화국\",\"br\":\"República Centro-Africana\",\"pt\":\"República Centro-Africana\",\"nl\":\"Centraal-Afrikaanse Republiek\",\"hr\":\"Srednjoafrička Republika\",\"fa\":\"جمهوری آفریقای مرکزی\",\"de\":\"Zentralafrikanische Republik\",\"es\":\"República Centroafricana\",\"fr\":\"République centrafricaine\",\"ja\":\"中央アフリカ共和国\",\"it\":\"Repubblica Centrafricana\",\"cn\":\"中非\"}', 7.00000000, 21.00000000, '??', 'U+1F1E8 U+1F1EB', 1, 'Q929', '2018-07-20 20:11:03', '2021-12-11 13:00:14'),
(43, 'Chad', 'TCD', 'TD', '148', '235', 'N\'Djamena', 'XAF', 'Central African CFA franc', 'FCFA', '.td', 'Tchad', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Ndjamena\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"차드\",\"br\":\"Chade\",\"pt\":\"Chade\",\"nl\":\"Tsjaad\",\"hr\":\"Čad\",\"fa\":\"چاد\",\"de\":\"Tschad\",\"es\":\"Chad\",\"fr\":\"Tchad\",\"ja\":\"チャド\",\"it\":\"Ciad\",\"cn\":\"乍得\"}', 15.00000000, 19.00000000, '??', 'U+1F1F9 U+1F1E9', 1, 'Q657', '2018-07-20 20:11:03', '2021-12-11 13:00:21'),
(44, 'Chile', 'CHL', 'CL', '152', '56', 'Santiago', 'CLP', 'Chilean peso', '$', '.cl', 'Chile', 'Americas', 'South America', '[{\"zoneName\":\"America/Punta_Arenas\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"CLST\",\"tzName\":\"Chile Summer Time\"},{\"zoneName\":\"America/Santiago\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"CLST\",\"tzName\":\"Chile Summer Time\"},{\"zoneName\":\"Pacific/Easter\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EASST\",\"tzName\":\"Easter Island Summer Time\"}]', '{\"kr\":\"칠리\",\"br\":\"Chile\",\"pt\":\"Chile\",\"nl\":\"Chili\",\"hr\":\"Čile\",\"fa\":\"شیلی\",\"de\":\"Chile\",\"es\":\"Chile\",\"fr\":\"Chili\",\"ja\":\"チリ\",\"it\":\"Cile\",\"cn\":\"智利\"}', -30.00000000, -71.00000000, '??', 'U+1F1E8 U+1F1F1', 1, 'Q298', '2018-07-20 20:11:03', '2021-12-11 13:00:28'),
(45, 'China', 'CHN', 'CN', '156', '86', 'Beijing', 'CNY', 'Chinese yuan', '¥', '.cn', '中国', 'Asia', 'Eastern Asia', '[{\"zoneName\":\"Asia/Shanghai\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"CST\",\"tzName\":\"China Standard Time\"},{\"zoneName\":\"Asia/Urumqi\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"XJT\",\"tzName\":\"China Standard Time\"}]', '{\"kr\":\"중국\",\"br\":\"China\",\"pt\":\"China\",\"nl\":\"China\",\"hr\":\"Kina\",\"fa\":\"چین\",\"de\":\"China\",\"es\":\"China\",\"fr\":\"Chine\",\"ja\":\"中国\",\"it\":\"Cina\",\"cn\":\"中国\"}', 35.00000000, 105.00000000, '??', 'U+1F1E8 U+1F1F3', 1, 'Q148', '2018-07-20 20:11:03', '2021-12-11 13:00:33'),
(46, 'Christmas Island', 'CXR', 'CX', '162', '61', 'Flying Fish Cove', 'AUD', 'Australian dollar', '$', '.cx', 'Christmas Island', 'Oceania', 'Australia and New Zealand', '[{\"zoneName\":\"Indian/Christmas\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"CXT\",\"tzName\":\"Christmas Island Time\"}]', '{\"kr\":\"크리스마스 섬\",\"br\":\"Ilha Christmas\",\"pt\":\"Ilha do Natal\",\"nl\":\"Christmaseiland\",\"hr\":\"Božićni otok\",\"fa\":\"جزیره کریسمس\",\"de\":\"Weihnachtsinsel\",\"es\":\"Isla de Navidad\",\"fr\":\"Île Christmas\",\"ja\":\"クリスマス島\",\"it\":\"Isola di Natale\",\"cn\":\"圣诞岛\"}', -10.50000000, 105.66666666, '??', 'U+1F1E8 U+1F1FD', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:48:01'),
(47, 'Cocos (Keeling) Islands', 'CCK', 'CC', '166', '61', 'West Island', 'AUD', 'Australian dollar', '$', '.cc', 'Cocos (Keeling) Islands', 'Oceania', 'Australia and New Zealand', '[{\"zoneName\":\"Indian/Cocos\",\"gmtOffset\":23400,\"gmtOffsetName\":\"UTC+06:30\",\"abbreviation\":\"CCT\",\"tzName\":\"Cocos Islands Time\"}]', '{\"kr\":\"코코스 제도\",\"br\":\"Ilhas Cocos\",\"pt\":\"Ilhas dos Cocos\",\"nl\":\"Cocoseilanden\",\"hr\":\"Kokosovi Otoci\",\"fa\":\"جزایر کوکوس\",\"de\":\"Kokosinseln\",\"es\":\"Islas Cocos o Islas Keeling\",\"fr\":\"Îles Cocos\",\"ja\":\"ココス（キーリング）諸島\",\"it\":\"Isole Cocos e Keeling\",\"cn\":\"科科斯（基林）群岛\"}', -12.50000000, 96.83333333, '??', 'U+1F1E8 U+1F1E8', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:48:14'),
(48, 'Colombia', 'COL', 'CO', '170', '57', 'Bogotá', 'COP', 'Colombian peso', '$', '.co', 'Colombia', 'Americas', 'South America', '[{\"zoneName\":\"America/Bogota\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"COT\",\"tzName\":\"Colombia Time\"}]', '{\"kr\":\"콜롬비아\",\"br\":\"Colômbia\",\"pt\":\"Colômbia\",\"nl\":\"Colombia\",\"hr\":\"Kolumbija\",\"fa\":\"کلمبیا\",\"de\":\"Kolumbien\",\"es\":\"Colombia\",\"fr\":\"Colombie\",\"ja\":\"コロンビア\",\"it\":\"Colombia\",\"cn\":\"哥伦比亚\"}', 4.00000000, -72.00000000, '??', 'U+1F1E8 U+1F1F4', 1, 'Q739', '2018-07-20 20:11:03', '2022-01-22 07:26:05'),
(49, 'Comoros', 'COM', 'KM', '174', '269', 'Moroni', 'KMF', 'Comorian franc', 'CF', '.km', 'Komori', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Indian/Comoro\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"코모로\",\"br\":\"Comores\",\"pt\":\"Comores\",\"nl\":\"Comoren\",\"hr\":\"Komori\",\"fa\":\"کومور\",\"de\":\"Union der Komoren\",\"es\":\"Comoras\",\"fr\":\"Comores\",\"ja\":\"コモロ\",\"it\":\"Comore\",\"cn\":\"科摩罗\"}', -12.16666666, 44.25000000, '??', 'U+1F1F0 U+1F1F2', 1, 'Q970', '2018-07-20 20:11:03', '2021-12-11 13:00:50'),
(50, 'Congo', 'COG', 'CG', '178', '242', 'Brazzaville', 'XAF', 'Central African CFA franc', 'FC', '.cg', 'République du Congo', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Brazzaville\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"콩고\",\"br\":\"Congo\",\"pt\":\"Congo\",\"nl\":\"Congo [Republiek]\",\"hr\":\"Kongo\",\"fa\":\"کنگو\",\"de\":\"Kongo\",\"es\":\"Congo\",\"fr\":\"Congo\",\"ja\":\"コンゴ共和国\",\"it\":\"Congo\",\"cn\":\"刚果\"}', -1.00000000, 15.00000000, '??', 'U+1F1E8 U+1F1EC', 1, 'Q971', '2018-07-20 20:11:03', '2021-12-11 13:01:09'),
(51, 'Democratic Republic of the Congo', 'COD', 'CD', '180', '243', 'Kinshasa', 'CDF', 'Congolese Franc', 'FC', '.cd', 'République démocratique du Congo', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Kinshasa\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"},{\"zoneName\":\"Africa/Lubumbashi\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]', '{\"kr\":\"콩고 민주 공화국\",\"br\":\"RD Congo\",\"pt\":\"RD Congo\",\"nl\":\"Congo [DRC]\",\"hr\":\"Kongo, Demokratska Republika\",\"fa\":\"جمهوری کنگو\",\"de\":\"Kongo (Dem. Rep.)\",\"es\":\"Congo (Rep. Dem.)\",\"fr\":\"Congo (Rép. dém.)\",\"ja\":\"コンゴ民主共和国\",\"it\":\"Congo (Rep. Dem.)\",\"cn\":\"刚果（金）\"}', 0.00000000, 25.00000000, '??', 'U+1F1E8 U+1F1E9', 1, 'Q974', '2018-07-20 20:11:03', '2021-12-11 13:48:42'),
(52, 'Cook Islands', 'COK', 'CK', '184', '682', 'Avarua', 'NZD', 'Cook Islands dollar', '$', '.ck', 'Cook Islands', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Rarotonga\",\"gmtOffset\":-36000,\"gmtOffsetName\":\"UTC-10:00\",\"abbreviation\":\"CKT\",\"tzName\":\"Cook Island Time\"}]', '{\"kr\":\"쿡 제도\",\"br\":\"Ilhas Cook\",\"pt\":\"Ilhas Cook\",\"nl\":\"Cookeilanden\",\"hr\":\"Cookovo Otočje\",\"fa\":\"جزایر کوک\",\"de\":\"Cookinseln\",\"es\":\"Islas Cook\",\"fr\":\"Îles Cook\",\"ja\":\"クック諸島\",\"it\":\"Isole Cook\",\"cn\":\"库克群岛\"}', -21.23333333, -159.76666666, '??', 'U+1F1E8 U+1F1F0', 1, 'Q26988', '2018-07-20 20:11:03', '2021-12-11 13:01:15'),
(53, 'Costa Rica', 'CRI', 'CR', '188', '506', 'San Jose', 'CRC', 'Costa Rican colón', '₡', '.cr', 'Costa Rica', 'Americas', 'Central America', '[{\"zoneName\":\"America/Costa_Rica\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"}]', '{\"kr\":\"코스타리카\",\"br\":\"Costa Rica\",\"pt\":\"Costa Rica\",\"nl\":\"Costa Rica\",\"hr\":\"Kostarika\",\"fa\":\"کاستاریکا\",\"de\":\"Costa Rica\",\"es\":\"Costa Rica\",\"fr\":\"Costa Rica\",\"ja\":\"コスタリカ\",\"it\":\"Costa Rica\",\"cn\":\"哥斯达黎加\"}', 10.00000000, -84.00000000, '??', 'U+1F1E8 U+1F1F7', 1, 'Q800', '2018-07-20 20:11:03', '2021-12-11 13:01:20'),
(54, 'Cote D\'Ivoire (Ivory Coast)', 'CIV', 'CI', '384', '225', 'Yamoussoukro', 'XOF', 'West African CFA franc', 'CFA', '.ci', NULL, 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Abidjan\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"코트디부아르\",\"br\":\"Costa do Marfim\",\"pt\":\"Costa do Marfim\",\"nl\":\"Ivoorkust\",\"hr\":\"Obala Bjelokosti\",\"fa\":\"ساحل عاج\",\"de\":\"Elfenbeinküste\",\"es\":\"Costa de Marfil\",\"fr\":\"Côte d\'Ivoire\",\"ja\":\"コートジボワール\",\"it\":\"Costa D\'Avorio\",\"cn\":\"科特迪瓦\"}', 8.00000000, -5.00000000, '??', 'U+1F1E8 U+1F1EE', 1, 'Q1008', '2018-07-20 20:11:03', '2021-12-11 13:01:26'),
(55, 'Croatia', 'HRV', 'HR', '191', '385', 'Zagreb', 'HRK', 'Croatian kuna', 'kn', '.hr', 'Hrvatska', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Zagreb\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"크로아티아\",\"br\":\"Croácia\",\"pt\":\"Croácia\",\"nl\":\"Kroatië\",\"hr\":\"Hrvatska\",\"fa\":\"کرواسی\",\"de\":\"Kroatien\",\"es\":\"Croacia\",\"fr\":\"Croatie\",\"ja\":\"クロアチア\",\"it\":\"Croazia\",\"cn\":\"克罗地亚\"}', 45.16666666, 15.50000000, '??', 'U+1F1ED U+1F1F7', 1, 'Q224', '2018-07-20 20:11:03', '2021-12-11 13:01:33'),
(56, 'Cuba', 'CUB', 'CU', '192', '53', 'Havana', 'CUP', 'Cuban peso', '$', '.cu', 'Cuba', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Havana\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"CST\",\"tzName\":\"Cuba Standard Time\"}]', '{\"kr\":\"쿠바\",\"br\":\"Cuba\",\"pt\":\"Cuba\",\"nl\":\"Cuba\",\"hr\":\"Kuba\",\"fa\":\"کوبا\",\"de\":\"Kuba\",\"es\":\"Cuba\",\"fr\":\"Cuba\",\"ja\":\"キューバ\",\"it\":\"Cuba\",\"cn\":\"古巴\"}', 21.50000000, -80.00000000, '??', 'U+1F1E8 U+1F1FA', 1, 'Q241', '2018-07-20 20:11:03', '2021-12-11 13:01:39'),
(57, 'Cyprus', 'CYP', 'CY', '196', '357', 'Nicosia', 'EUR', 'Euro', '€', '.cy', 'Κύπρος', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Asia/Famagusta\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"},{\"zoneName\":\"Asia/Nicosia\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"키프로스\",\"br\":\"Chipre\",\"pt\":\"Chipre\",\"nl\":\"Cyprus\",\"hr\":\"Cipar\",\"fa\":\"قبرس\",\"de\":\"Zypern\",\"es\":\"Chipre\",\"fr\":\"Chypre\",\"ja\":\"キプロス\",\"it\":\"Cipro\",\"cn\":\"塞浦路斯\"}', 35.00000000, 33.00000000, '??', 'U+1F1E8 U+1F1FE', 1, 'Q229', '2018-07-20 20:11:03', '2021-12-11 13:01:50');
INSERT INTO `countries` (`id`, `name`, `iso3`, `iso2`, `numeric_code`, `phonecode`, `capital`, `currency`, `currency_name`, `currency_symbol`, `tld`, `native`, `region`, `subregion`, `timezones`, `translations`, `latitude`, `longitude`, `emoji`, `emojiU`, `flag`, `wikiDataId`, `created_at`, `updated_at`) VALUES
(58, 'Czech Republic', 'CZE', 'CZ', '203', '420', 'Prague', 'CZK', 'Czech koruna', 'Kč', '.cz', 'Česká republika', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Prague\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"체코\",\"br\":\"República Tcheca\",\"pt\":\"República Checa\",\"nl\":\"Tsjechië\",\"hr\":\"Češka\",\"fa\":\"جمهوری چک\",\"de\":\"Tschechische Republik\",\"es\":\"República Checa\",\"fr\":\"République tchèque\",\"ja\":\"チェコ\",\"it\":\"Repubblica Ceca\",\"cn\":\"捷克\"}', 49.75000000, 15.50000000, '??', 'U+1F1E8 U+1F1FF', 1, 'Q213', '2018-07-20 20:11:03', '2021-12-11 13:01:57'),
(59, 'Denmark', 'DNK', 'DK', '208', '45', 'Copenhagen', 'DKK', 'Danish krone', 'Kr.', '.dk', 'Danmark', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Copenhagen\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"덴마크\",\"br\":\"Dinamarca\",\"pt\":\"Dinamarca\",\"nl\":\"Denemarken\",\"hr\":\"Danska\",\"fa\":\"دانمارک\",\"de\":\"Dänemark\",\"es\":\"Dinamarca\",\"fr\":\"Danemark\",\"ja\":\"デンマーク\",\"it\":\"Danimarca\",\"cn\":\"丹麦\"}', 56.00000000, 10.00000000, '??', 'U+1F1E9 U+1F1F0', 1, 'Q35', '2018-07-20 20:11:03', '2021-12-11 13:02:05'),
(60, 'Djibouti', 'DJI', 'DJ', '262', '253', 'Djibouti', 'DJF', 'Djiboutian franc', 'Fdj', '.dj', 'Djibouti', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Djibouti\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"지부티\",\"br\":\"Djibuti\",\"pt\":\"Djibuti\",\"nl\":\"Djibouti\",\"hr\":\"Džibuti\",\"fa\":\"جیبوتی\",\"de\":\"Dschibuti\",\"es\":\"Yibuti\",\"fr\":\"Djibouti\",\"ja\":\"ジブチ\",\"it\":\"Gibuti\",\"cn\":\"吉布提\"}', 11.50000000, 43.00000000, '??', 'U+1F1E9 U+1F1EF', 1, 'Q977', '2018-07-20 20:11:03', '2021-12-11 13:02:11'),
(61, 'Dominica', 'DMA', 'DM', '212', '+1-767', 'Roseau', 'XCD', 'Eastern Caribbean dollar', '$', '.dm', 'Dominica', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Dominica\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"도미니카 연방\",\"br\":\"Dominica\",\"pt\":\"Dominica\",\"nl\":\"Dominica\",\"hr\":\"Dominika\",\"fa\":\"دومینیکا\",\"de\":\"Dominica\",\"es\":\"Dominica\",\"fr\":\"Dominique\",\"ja\":\"ドミニカ国\",\"it\":\"Dominica\",\"cn\":\"多米尼加\"}', 15.41666666, -61.33333333, '??', 'U+1F1E9 U+1F1F2', 1, 'Q784', '2018-07-20 20:11:03', '2021-12-11 13:02:16'),
(62, 'Dominican Republic', 'DOM', 'DO', '214', '+1-809 and 1-829', 'Santo Domingo', 'DOP', 'Dominican peso', '$', '.do', 'República Dominicana', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Santo_Domingo\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"도미니카 공화국\",\"br\":\"República Dominicana\",\"pt\":\"República Dominicana\",\"nl\":\"Dominicaanse Republiek\",\"hr\":\"Dominikanska Republika\",\"fa\":\"جمهوری دومینیکن\",\"de\":\"Dominikanische Republik\",\"es\":\"República Dominicana\",\"fr\":\"République dominicaine\",\"ja\":\"ドミニカ共和国\",\"it\":\"Repubblica Dominicana\",\"cn\":\"多明尼加共和国\"}', 19.00000000, -70.66666666, '??', 'U+1F1E9 U+1F1F4', 1, 'Q786', '2018-07-20 20:11:03', '2021-12-11 13:02:22'),
(63, 'East Timor', 'TLS', 'TL', '626', '670', 'Dili', 'USD', 'United States dollar', '$', '.tl', 'Timor-Leste', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Dili\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"TLT\",\"tzName\":\"Timor Leste Time\"}]', '{\"kr\":\"동티모르\",\"br\":\"Timor Leste\",\"pt\":\"Timor Leste\",\"nl\":\"Oost-Timor\",\"hr\":\"Istočni Timor\",\"fa\":\"تیمور شرقی\",\"de\":\"Timor-Leste\",\"es\":\"Timor Oriental\",\"fr\":\"Timor oriental\",\"ja\":\"東ティモール\",\"it\":\"Timor Est\",\"cn\":\"东帝汶\"}', -8.83333333, 125.91666666, '??', 'U+1F1F9 U+1F1F1', 1, 'Q574', '2018-07-20 20:11:03', '2021-12-11 13:02:27'),
(64, 'Ecuador', 'ECU', 'EC', '218', '593', 'Quito', 'USD', 'United States dollar', '$', '.ec', 'Ecuador', 'Americas', 'South America', '[{\"zoneName\":\"America/Guayaquil\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"ECT\",\"tzName\":\"Ecuador Time\"},{\"zoneName\":\"Pacific/Galapagos\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"GALT\",\"tzName\":\"Galápagos Time\"}]', '{\"kr\":\"에콰도르\",\"br\":\"Equador\",\"pt\":\"Equador\",\"nl\":\"Ecuador\",\"hr\":\"Ekvador\",\"fa\":\"اکوادور\",\"de\":\"Ecuador\",\"es\":\"Ecuador\",\"fr\":\"Équateur\",\"ja\":\"エクアドル\",\"it\":\"Ecuador\",\"cn\":\"厄瓜多尔\"}', -2.00000000, -77.50000000, '??', 'U+1F1EA U+1F1E8', 1, 'Q736', '2018-07-20 20:11:03', '2021-12-11 13:02:33'),
(65, 'Egypt', 'EGY', 'EG', '818', '20', 'Cairo', 'EGP', 'Egyptian pound', 'ج.م', '.eg', 'مصر‎', 'Africa', 'Northern Africa', '[{\"zoneName\":\"Africa/Cairo\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"이집트\",\"br\":\"Egito\",\"pt\":\"Egipto\",\"nl\":\"Egypte\",\"hr\":\"Egipat\",\"fa\":\"مصر\",\"de\":\"Ägypten\",\"es\":\"Egipto\",\"fr\":\"Égypte\",\"ja\":\"エジプト\",\"it\":\"Egitto\",\"cn\":\"埃及\"}', 27.00000000, 30.00000000, '??', 'U+1F1EA U+1F1EC', 1, 'Q79', '2018-07-20 20:11:03', '2021-12-11 13:02:38'),
(66, 'El Salvador', 'SLV', 'SV', '222', '503', 'San Salvador', 'USD', 'United States dollar', '$', '.sv', 'El Salvador', 'Americas', 'Central America', '[{\"zoneName\":\"America/El_Salvador\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"}]', '{\"kr\":\"엘살바도르\",\"br\":\"El Salvador\",\"pt\":\"El Salvador\",\"nl\":\"El Salvador\",\"hr\":\"Salvador\",\"fa\":\"السالوادور\",\"de\":\"El Salvador\",\"es\":\"El Salvador\",\"fr\":\"Salvador\",\"ja\":\"エルサルバドル\",\"it\":\"El Salvador\",\"cn\":\"萨尔瓦多\"}', 13.83333333, -88.91666666, '??', 'U+1F1F8 U+1F1FB', 1, 'Q792', '2018-07-20 20:11:03', '2021-12-11 13:02:45'),
(67, 'Equatorial Guinea', 'GNQ', 'GQ', '226', '240', 'Malabo', 'XAF', 'Central African CFA franc', 'FCFA', '.gq', 'Guinea Ecuatorial', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Malabo\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"적도 기니\",\"br\":\"Guiné Equatorial\",\"pt\":\"Guiné Equatorial\",\"nl\":\"Equatoriaal-Guinea\",\"hr\":\"Ekvatorijalna Gvineja\",\"fa\":\"گینه استوایی\",\"de\":\"Äquatorial-Guinea\",\"es\":\"Guinea Ecuatorial\",\"fr\":\"Guinée-Équatoriale\",\"ja\":\"赤道ギニア\",\"it\":\"Guinea Equatoriale\",\"cn\":\"赤道几内亚\"}', 2.00000000, 10.00000000, '??', 'U+1F1EC U+1F1F6', 1, 'Q983', '2018-07-20 20:11:03', '2021-12-11 13:02:52'),
(68, 'Eritrea', 'ERI', 'ER', '232', '291', 'Asmara', 'ERN', 'Eritrean nakfa', 'Nfk', '.er', 'ኤርትራ', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Asmara\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"에리트레아\",\"br\":\"Eritreia\",\"pt\":\"Eritreia\",\"nl\":\"Eritrea\",\"hr\":\"Eritreja\",\"fa\":\"اریتره\",\"de\":\"Eritrea\",\"es\":\"Eritrea\",\"fr\":\"Érythrée\",\"ja\":\"エリトリア\",\"it\":\"Eritrea\",\"cn\":\"厄立特里亚\"}', 15.00000000, 39.00000000, '??', 'U+1F1EA U+1F1F7', 1, 'Q986', '2018-07-20 20:11:03', '2021-12-11 13:02:58'),
(69, 'Estonia', 'EST', 'EE', '233', '372', 'Tallinn', 'EUR', 'Euro', '€', '.ee', 'Eesti', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Tallinn\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"에스토니아\",\"br\":\"Estônia\",\"pt\":\"Estónia\",\"nl\":\"Estland\",\"hr\":\"Estonija\",\"fa\":\"استونی\",\"de\":\"Estland\",\"es\":\"Estonia\",\"fr\":\"Estonie\",\"ja\":\"エストニア\",\"it\":\"Estonia\",\"cn\":\"爱沙尼亚\"}', 59.00000000, 26.00000000, '??', 'U+1F1EA U+1F1EA', 1, 'Q191', '2018-07-20 20:11:03', '2021-12-11 13:03:03'),
(70, 'Ethiopia', 'ETH', 'ET', '231', '251', 'Addis Ababa', 'ETB', 'Ethiopian birr', 'Nkf', '.et', 'ኢትዮጵያ', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Addis_Ababa\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"에티오피아\",\"br\":\"Etiópia\",\"pt\":\"Etiópia\",\"nl\":\"Ethiopië\",\"hr\":\"Etiopija\",\"fa\":\"اتیوپی\",\"de\":\"Äthiopien\",\"es\":\"Etiopía\",\"fr\":\"Éthiopie\",\"ja\":\"エチオピア\",\"it\":\"Etiopia\",\"cn\":\"埃塞俄比亚\"}', 8.00000000, 38.00000000, '??', 'U+1F1EA U+1F1F9', 1, 'Q115', '2018-07-20 20:11:03', '2021-12-11 13:16:58'),
(71, 'Falkland Islands', 'FLK', 'FK', '238', '500', 'Stanley', 'FKP', 'Falkland Islands pound', '£', '.fk', 'Falkland Islands', 'Americas', 'South America', '[{\"zoneName\":\"Atlantic/Stanley\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"FKST\",\"tzName\":\"Falkland Islands Summer Time\"}]', '{\"kr\":\"포클랜드 제도\",\"br\":\"Ilhas Malvinas\",\"pt\":\"Ilhas Falkland\",\"nl\":\"Falklandeilanden [Islas Malvinas]\",\"hr\":\"Falklandski Otoci\",\"fa\":\"جزایر فالکلند\",\"de\":\"Falklandinseln\",\"es\":\"Islas Malvinas\",\"fr\":\"Îles Malouines\",\"ja\":\"フォークランド（マルビナス）諸島\",\"it\":\"Isole Falkland o Isole Malvine\",\"cn\":\"福克兰群岛\"}', -51.75000000, -59.00000000, '??', 'U+1F1EB U+1F1F0', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:17:05'),
(72, 'Faroe Islands', 'FRO', 'FO', '234', '298', 'Torshavn', 'DKK', 'Danish krone', 'Kr.', '.fo', 'Føroyar', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Atlantic/Faroe\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"WET\",\"tzName\":\"Western European Time\"}]', '{\"kr\":\"페로 제도\",\"br\":\"Ilhas Faroé\",\"pt\":\"Ilhas Faroé\",\"nl\":\"Faeröer\",\"hr\":\"Farski Otoci\",\"fa\":\"جزایر فارو\",\"de\":\"Färöer-Inseln\",\"es\":\"Islas Faroe\",\"fr\":\"Îles Féroé\",\"ja\":\"フェロー諸島\",\"it\":\"Isole Far Oer\",\"cn\":\"法罗群岛\"}', 62.00000000, -7.00000000, '??', 'U+1F1EB U+1F1F4', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:17:11'),
(73, 'Fiji Islands', 'FJI', 'FJ', '242', '679', 'Suva', 'FJD', 'Fijian dollar', 'FJ$', '.fj', 'Fiji', 'Oceania', 'Melanesia', '[{\"zoneName\":\"Pacific/Fiji\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"FJT\",\"tzName\":\"Fiji Time\"}]', '{\"kr\":\"피지\",\"br\":\"Fiji\",\"pt\":\"Fiji\",\"nl\":\"Fiji\",\"hr\":\"Fiđi\",\"fa\":\"فیجی\",\"de\":\"Fidschi\",\"es\":\"Fiyi\",\"fr\":\"Fidji\",\"ja\":\"フィジー\",\"it\":\"Figi\",\"cn\":\"斐济\"}', -18.00000000, 175.00000000, '??', 'U+1F1EB U+1F1EF', 1, 'Q712', '2018-07-20 20:11:03', '2021-12-11 13:17:17'),
(74, 'Finland', 'FIN', 'FI', '246', '358', 'Helsinki', 'EUR', 'Euro', '€', '.fi', 'Suomi', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Helsinki\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"핀란드\",\"br\":\"Finlândia\",\"pt\":\"Finlândia\",\"nl\":\"Finland\",\"hr\":\"Finska\",\"fa\":\"فنلاند\",\"de\":\"Finnland\",\"es\":\"Finlandia\",\"fr\":\"Finlande\",\"ja\":\"フィンランド\",\"it\":\"Finlandia\",\"cn\":\"芬兰\"}', 64.00000000, 26.00000000, '??', 'U+1F1EB U+1F1EE', 1, 'Q33', '2018-07-20 20:11:03', '2021-12-11 13:17:24'),
(75, 'France', 'FRA', 'FR', '250', '33', 'Paris', 'EUR', 'Euro', '€', '.fr', 'France', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Paris\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"프랑스\",\"br\":\"França\",\"pt\":\"França\",\"nl\":\"Frankrijk\",\"hr\":\"Francuska\",\"fa\":\"فرانسه\",\"de\":\"Frankreich\",\"es\":\"Francia\",\"fr\":\"France\",\"ja\":\"フランス\",\"it\":\"Francia\",\"cn\":\"法国\"}', 46.00000000, 2.00000000, '??', 'U+1F1EB U+1F1F7', 1, 'Q142', '2018-07-20 20:11:03', '2021-12-11 13:17:33'),
(76, 'French Guiana', 'GUF', 'GF', '254', '594', 'Cayenne', 'EUR', 'Euro', '€', '.gf', 'Guyane française', 'Americas', 'South America', '[{\"zoneName\":\"America/Cayenne\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"GFT\",\"tzName\":\"French Guiana Time\"}]', '{\"kr\":\"프랑스령 기아나\",\"br\":\"Guiana Francesa\",\"pt\":\"Guiana Francesa\",\"nl\":\"Frans-Guyana\",\"hr\":\"Francuska Gvajana\",\"fa\":\"گویان فرانسه\",\"de\":\"Französisch Guyana\",\"es\":\"Guayana Francesa\",\"fr\":\"Guayane\",\"ja\":\"フランス領ギアナ\",\"it\":\"Guyana francese\",\"cn\":\"法属圭亚那\"}', 4.00000000, -53.00000000, '??', 'U+1F1EC U+1F1EB', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:18:11'),
(77, 'French Polynesia', 'PYF', 'PF', '258', '689', 'Papeete', 'XPF', 'CFP franc', '₣', '.pf', 'Polynésie française', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Gambier\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"GAMT\",\"tzName\":\"Gambier Islands Time\"},{\"zoneName\":\"Pacific/Marquesas\",\"gmtOffset\":-34200,\"gmtOffsetName\":\"UTC-09:30\",\"abbreviation\":\"MART\",\"tzName\":\"Marquesas Islands Time\"},{\"zoneName\":\"Pacific/Tahiti\",\"gmtOffset\":-36000,\"gmtOffsetName\":\"UTC-10:00\",\"abbreviation\":\"TAHT\",\"tzName\":\"Tahiti Time\"}]', '{\"kr\":\"프랑스령 폴리네시아\",\"br\":\"Polinésia Francesa\",\"pt\":\"Polinésia Francesa\",\"nl\":\"Frans-Polynesië\",\"hr\":\"Francuska Polinezija\",\"fa\":\"پلی‌نزی فرانسه\",\"de\":\"Französisch-Polynesien\",\"es\":\"Polinesia Francesa\",\"fr\":\"Polynésie française\",\"ja\":\"フランス領ポリネシア\",\"it\":\"Polinesia Francese\",\"cn\":\"法属波利尼西亚\"}', -15.00000000, -140.00000000, '??', 'U+1F1F5 U+1F1EB', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:17:54'),
(78, 'French Southern Territories', 'ATF', 'TF', '260', '262', 'Port-aux-Francais', 'EUR', 'Euro', '€', '.tf', 'Territoire des Terres australes et antarctiques fr', 'Africa', 'Southern Africa', '[{\"zoneName\":\"Indian/Kerguelen\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"TFT\",\"tzName\":\"French Southern and Antarctic Time\"}]', '{\"kr\":\"프랑스령 남방 및 남극\",\"br\":\"Terras Austrais e Antárticas Francesas\",\"pt\":\"Terras Austrais e Antárticas Francesas\",\"nl\":\"Franse Gebieden in de zuidelijke Indische Oceaan\",\"hr\":\"Francuski južni i antarktički teritoriji\",\"fa\":\"سرزمین‌های جنوبی و جنوبگانی فرانسه\",\"de\":\"Französische Süd- und Antarktisgebiete\",\"es\":\"Tierras Australes y Antárticas Francesas\",\"fr\":\"Terres australes et antarctiques françaises\",\"ja\":\"フランス領南方・南極地域\",\"it\":\"Territori Francesi del Sud\",\"cn\":\"法属南部领地\"}', -49.25000000, 69.16700000, '??', 'U+1F1F9 U+1F1EB', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:18:34'),
(79, 'Gabon', 'GAB', 'GA', '266', '241', 'Libreville', 'XAF', 'Central African CFA franc', 'FCFA', '.ga', 'Gabon', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Libreville\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"가봉\",\"br\":\"Gabão\",\"pt\":\"Gabão\",\"nl\":\"Gabon\",\"hr\":\"Gabon\",\"fa\":\"گابن\",\"de\":\"Gabun\",\"es\":\"Gabón\",\"fr\":\"Gabon\",\"ja\":\"ガボン\",\"it\":\"Gabon\",\"cn\":\"加蓬\"}', -1.00000000, 11.75000000, '??', 'U+1F1EC U+1F1E6', 1, 'Q1000', '2018-07-20 20:11:03', '2021-12-11 13:18:46'),
(80, 'Gambia The', 'GMB', 'GM', '270', '220', 'Banjul', 'GMD', 'Gambian dalasi', 'D', '.gm', 'Gambia', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Banjul\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"감비아\",\"br\":\"Gâmbia\",\"pt\":\"Gâmbia\",\"nl\":\"Gambia\",\"hr\":\"Gambija\",\"fa\":\"گامبیا\",\"de\":\"Gambia\",\"es\":\"Gambia\",\"fr\":\"Gambie\",\"ja\":\"ガンビア\",\"it\":\"Gambia\",\"cn\":\"冈比亚\"}', 13.46666666, -16.56666666, '??', 'U+1F1EC U+1F1F2', 1, 'Q1005', '2018-07-20 20:11:03', '2021-12-11 13:18:53'),
(81, 'Georgia', 'GEO', 'GE', '268', '995', 'Tbilisi', 'GEL', 'Georgian lari', 'ლ', '.ge', 'საქართველო', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Tbilisi\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"GET\",\"tzName\":\"Georgia Standard Time\"}]', '{\"kr\":\"조지아\",\"br\":\"Geórgia\",\"pt\":\"Geórgia\",\"nl\":\"Georgië\",\"hr\":\"Gruzija\",\"fa\":\"گرجستان\",\"de\":\"Georgien\",\"es\":\"Georgia\",\"fr\":\"Géorgie\",\"ja\":\"グルジア\",\"it\":\"Georgia\",\"cn\":\"格鲁吉亚\"}', 42.00000000, 43.50000000, '??', 'U+1F1EC U+1F1EA', 1, 'Q230', '2018-07-20 20:11:03', '2021-12-11 13:18:59'),
(82, 'Germany', 'DEU', 'DE', '276', '49', 'Berlin', 'EUR', 'Euro', '€', '.de', 'Deutschland', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Berlin\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"},{\"zoneName\":\"Europe/Busingen\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"독일\",\"br\":\"Alemanha\",\"pt\":\"Alemanha\",\"nl\":\"Duitsland\",\"hr\":\"Njemačka\",\"fa\":\"آلمان\",\"de\":\"Deutschland\",\"es\":\"Alemania\",\"fr\":\"Allemagne\",\"ja\":\"ドイツ\",\"it\":\"Germania\",\"cn\":\"德国\"}', 51.00000000, 9.00000000, '??', 'U+1F1E9 U+1F1EA', 1, 'Q183', '2018-07-20 20:11:03', '2021-12-11 13:19:06'),
(83, 'Ghana', 'GHA', 'GH', '288', '233', 'Accra', 'GHS', 'Ghanaian cedi', 'GH₵', '.gh', 'Ghana', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Accra\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"가나\",\"br\":\"Gana\",\"pt\":\"Gana\",\"nl\":\"Ghana\",\"hr\":\"Gana\",\"fa\":\"غنا\",\"de\":\"Ghana\",\"es\":\"Ghana\",\"fr\":\"Ghana\",\"ja\":\"ガーナ\",\"it\":\"Ghana\",\"cn\":\"加纳\"}', 8.00000000, -2.00000000, '??', 'U+1F1EC U+1F1ED', 1, 'Q117', '2018-07-20 20:11:03', '2021-12-11 13:19:14'),
(84, 'Gibraltar', 'GIB', 'GI', '292', '350', 'Gibraltar', 'GIP', 'Gibraltar pound', '£', '.gi', 'Gibraltar', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Gibraltar\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"지브롤터\",\"br\":\"Gibraltar\",\"pt\":\"Gibraltar\",\"nl\":\"Gibraltar\",\"hr\":\"Gibraltar\",\"fa\":\"جبل‌طارق\",\"de\":\"Gibraltar\",\"es\":\"Gibraltar\",\"fr\":\"Gibraltar\",\"ja\":\"ジブラルタル\",\"it\":\"Gibilterra\",\"cn\":\"直布罗陀\"}', 36.13333333, -5.35000000, '??', 'U+1F1EC U+1F1EE', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:19:19'),
(85, 'Greece', 'GRC', 'GR', '300', '30', 'Athens', 'EUR', 'Euro', '€', '.gr', 'Ελλάδα', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Athens\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"그리스\",\"br\":\"Grécia\",\"pt\":\"Grécia\",\"nl\":\"Griekenland\",\"hr\":\"Grčka\",\"fa\":\"یونان\",\"de\":\"Griechenland\",\"es\":\"Grecia\",\"fr\":\"Grèce\",\"ja\":\"ギリシャ\",\"it\":\"Grecia\",\"cn\":\"希腊\"}', 39.00000000, 22.00000000, '??', 'U+1F1EC U+1F1F7', 1, 'Q41', '2018-07-20 20:11:03', '2021-12-11 13:19:24'),
(86, 'Greenland', 'GRL', 'GL', '304', '299', 'Nuuk', 'DKK', 'Danish krone', 'Kr.', '.gl', 'Kalaallit Nunaat', 'Americas', 'Northern America', '[{\"zoneName\":\"America/Danmarkshavn\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"},{\"zoneName\":\"America/Nuuk\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"WGT\",\"tzName\":\"West Greenland Time\"},{\"zoneName\":\"America/Scoresbysund\",\"gmtOffset\":-3600,\"gmtOffsetName\":\"UTC-01:00\",\"abbreviation\":\"EGT\",\"tzName\":\"Eastern Greenland Time\"},{\"zoneName\":\"America/Thule\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"그린란드\",\"br\":\"Groelândia\",\"pt\":\"Gronelândia\",\"nl\":\"Groenland\",\"hr\":\"Grenland\",\"fa\":\"گرینلند\",\"de\":\"Grönland\",\"es\":\"Groenlandia\",\"fr\":\"Groenland\",\"ja\":\"グリーンランド\",\"it\":\"Groenlandia\",\"cn\":\"格陵兰岛\"}', 72.00000000, -40.00000000, '??', 'U+1F1EC U+1F1F1', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:19:31'),
(87, 'Grenada', 'GRD', 'GD', '308', '+1-473', 'St. George\'s', 'XCD', 'Eastern Caribbean dollar', '$', '.gd', 'Grenada', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Grenada\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"그레나다\",\"br\":\"Granada\",\"pt\":\"Granada\",\"nl\":\"Grenada\",\"hr\":\"Grenada\",\"fa\":\"گرنادا\",\"de\":\"Grenada\",\"es\":\"Grenada\",\"fr\":\"Grenade\",\"ja\":\"グレナダ\",\"it\":\"Grenada\",\"cn\":\"格林纳达\"}', 12.11666666, -61.66666666, '??', 'U+1F1EC U+1F1E9', 1, 'Q769', '2018-07-20 20:11:03', '2021-12-11 13:19:40'),
(88, 'Guadeloupe', 'GLP', 'GP', '312', '590', 'Basse-Terre', 'EUR', 'Euro', '€', '.gp', 'Guadeloupe', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Guadeloupe\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"과들루프\",\"br\":\"Guadalupe\",\"pt\":\"Guadalupe\",\"nl\":\"Guadeloupe\",\"hr\":\"Gvadalupa\",\"fa\":\"جزیره گوادلوپ\",\"de\":\"Guadeloupe\",\"es\":\"Guadalupe\",\"fr\":\"Guadeloupe\",\"ja\":\"グアドループ\",\"it\":\"Guadeloupa\",\"cn\":\"瓜德罗普岛\"}', 16.25000000, -61.58333300, '??', 'U+1F1EC U+1F1F5', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:21:29'),
(89, 'Guam', 'GUM', 'GU', '316', '+1-671', 'Hagatna', 'USD', 'US Dollar', '$', '.gu', 'Guam', 'Oceania', 'Micronesia', '[{\"zoneName\":\"Pacific/Guam\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"CHST\",\"tzName\":\"Chamorro Standard Time\"}]', '{\"kr\":\"괌\",\"br\":\"Guam\",\"pt\":\"Guame\",\"nl\":\"Guam\",\"hr\":\"Guam\",\"fa\":\"گوام\",\"de\":\"Guam\",\"es\":\"Guam\",\"fr\":\"Guam\",\"ja\":\"グアム\",\"it\":\"Guam\",\"cn\":\"关岛\"}', 13.46666666, 144.78333333, '??', 'U+1F1EC U+1F1FA', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:20:50'),
(90, 'Guatemala', 'GTM', 'GT', '320', '502', 'Guatemala City', 'GTQ', 'Guatemalan quetzal', 'Q', '.gt', 'Guatemala', 'Americas', 'Central America', '[{\"zoneName\":\"America/Guatemala\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"}]', '{\"kr\":\"과테말라\",\"br\":\"Guatemala\",\"pt\":\"Guatemala\",\"nl\":\"Guatemala\",\"hr\":\"Gvatemala\",\"fa\":\"گواتمالا\",\"de\":\"Guatemala\",\"es\":\"Guatemala\",\"fr\":\"Guatemala\",\"ja\":\"グアテマラ\",\"it\":\"Guatemala\",\"cn\":\"危地马拉\"}', 15.50000000, -90.25000000, '??', 'U+1F1EC U+1F1F9', 1, 'Q774', '2018-07-20 20:11:03', '2021-12-11 13:21:50'),
(91, 'Guernsey and Alderney', 'GGY', 'GG', '831', '+44-1481', 'St Peter Port', 'GBP', 'British pound', '£', '.gg', 'Guernsey', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Guernsey\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"건지, 올더니\",\"br\":\"Guernsey\",\"pt\":\"Guernsey\",\"nl\":\"Guernsey\",\"hr\":\"Guernsey\",\"fa\":\"گرنزی\",\"de\":\"Guernsey\",\"es\":\"Guernsey\",\"fr\":\"Guernesey\",\"ja\":\"ガーンジー\",\"it\":\"Guernsey\",\"cn\":\"根西岛\"}', 49.46666666, -2.58333333, '??', 'U+1F1EC U+1F1EC', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:23:37'),
(92, 'Guinea', 'GIN', 'GN', '324', '224', 'Conakry', 'GNF', 'Guinean franc', 'FG', '.gn', 'Guinée', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Conakry\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"기니\",\"br\":\"Guiné\",\"pt\":\"Guiné\",\"nl\":\"Guinee\",\"hr\":\"Gvineja\",\"fa\":\"گینه\",\"de\":\"Guinea\",\"es\":\"Guinea\",\"fr\":\"Guinée\",\"ja\":\"ギニア\",\"it\":\"Guinea\",\"cn\":\"几内亚\"}', 11.00000000, -10.00000000, '??', 'U+1F1EC U+1F1F3', 1, 'Q1006', '2018-07-20 20:11:03', '2021-12-11 13:23:45'),
(93, 'Guinea-Bissau', 'GNB', 'GW', '624', '245', 'Bissau', 'XOF', 'West African CFA franc', 'CFA', '.gw', 'Guiné-Bissau', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Bissau\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"기니비사우\",\"br\":\"Guiné-Bissau\",\"pt\":\"Guiné-Bissau\",\"nl\":\"Guinee-Bissau\",\"hr\":\"Gvineja Bisau\",\"fa\":\"گینه بیسائو\",\"de\":\"Guinea-Bissau\",\"es\":\"Guinea-Bisáu\",\"fr\":\"Guinée-Bissau\",\"ja\":\"ギニアビサウ\",\"it\":\"Guinea-Bissau\",\"cn\":\"几内亚比绍\"}', 12.00000000, -15.00000000, '??', 'U+1F1EC U+1F1FC', 1, 'Q1007', '2018-07-20 20:11:03', '2021-12-11 13:23:54'),
(94, 'Guyana', 'GUY', 'GY', '328', '592', 'Georgetown', 'GYD', 'Guyanese dollar', '$', '.gy', 'Guyana', 'Americas', 'South America', '[{\"zoneName\":\"America/Guyana\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"GYT\",\"tzName\":\"Guyana Time\"}]', '{\"kr\":\"가이아나\",\"br\":\"Guiana\",\"pt\":\"Guiana\",\"nl\":\"Guyana\",\"hr\":\"Gvajana\",\"fa\":\"گویان\",\"de\":\"Guyana\",\"es\":\"Guyana\",\"fr\":\"Guyane\",\"ja\":\"ガイアナ\",\"it\":\"Guyana\",\"cn\":\"圭亚那\"}', 5.00000000, -59.00000000, '??', 'U+1F1EC U+1F1FE', 1, 'Q734', '2018-07-20 20:11:03', '2021-12-11 13:24:01'),
(95, 'Haiti', 'HTI', 'HT', '332', '509', 'Port-au-Prince', 'HTG', 'Haitian gourde', 'G', '.ht', 'Haïti', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Port-au-Prince\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"}]', '{\"kr\":\"아이티\",\"br\":\"Haiti\",\"pt\":\"Haiti\",\"nl\":\"Haïti\",\"hr\":\"Haiti\",\"fa\":\"هائیتی\",\"de\":\"Haiti\",\"es\":\"Haiti\",\"fr\":\"Haïti\",\"ja\":\"ハイチ\",\"it\":\"Haiti\",\"cn\":\"海地\"}', 19.00000000, -72.41666666, '??', 'U+1F1ED U+1F1F9', 1, 'Q790', '2018-07-20 20:11:03', '2021-12-11 13:24:06'),
(96, 'Heard Island and McDonald Islands', 'HMD', 'HM', '334', '672', '', 'AUD', 'Australian dollar', '$', '.hm', 'Heard Island and McDonald Islands', '', '', '[{\"zoneName\":\"Indian/Kerguelen\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"TFT\",\"tzName\":\"French Southern and Antarctic Time\"}]', '{\"kr\":\"허드 맥도날드 제도\",\"br\":\"Ilha Heard e Ilhas McDonald\",\"pt\":\"Ilha Heard e Ilhas McDonald\",\"nl\":\"Heard- en McDonaldeilanden\",\"hr\":\"Otok Heard i otočje McDonald\",\"fa\":\"جزیره هرد و جزایر مک‌دونالد\",\"de\":\"Heard und die McDonaldinseln\",\"es\":\"Islas Heard y McDonald\",\"fr\":\"Îles Heard-et-MacDonald\",\"ja\":\"ハード島とマクドナルド諸島\",\"it\":\"Isole Heard e McDonald\",\"cn\":\"赫德·唐纳岛及麦唐纳岛\"}', -53.10000000, 72.51666666, '??', 'U+1F1ED U+1F1F2', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:48:51'),
(97, 'Honduras', 'HND', 'HN', '340', '504', 'Tegucigalpa', 'HNL', 'Honduran lempira', 'L', '.hn', 'Honduras', 'Americas', 'Central America', '[{\"zoneName\":\"America/Tegucigalpa\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"}]', '{\"kr\":\"온두라스\",\"br\":\"Honduras\",\"pt\":\"Honduras\",\"nl\":\"Honduras\",\"hr\":\"Honduras\",\"fa\":\"هندوراس\",\"de\":\"Honduras\",\"es\":\"Honduras\",\"fr\":\"Honduras\",\"ja\":\"ホンジュラス\",\"it\":\"Honduras\",\"cn\":\"洪都拉斯\"}', 15.00000000, -86.50000000, '??', 'U+1F1ED U+1F1F3', 1, 'Q783', '2018-07-20 20:11:03', '2021-12-11 13:24:16'),
(98, 'Hong Kong S.A.R.', 'HKG', 'HK', '344', '852', 'Hong Kong', 'HKD', 'Hong Kong dollar', '$', '.hk', '香港', 'Asia', 'Eastern Asia', '[{\"zoneName\":\"Asia/Hong_Kong\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"HKT\",\"tzName\":\"Hong Kong Time\"}]', '{\"kr\":\"홍콩\",\"br\":\"Hong Kong\",\"pt\":\"Hong Kong\",\"nl\":\"Hongkong\",\"hr\":\"Hong Kong\",\"fa\":\"هنگ‌کنگ\",\"de\":\"Hong Kong\",\"es\":\"Hong Kong\",\"fr\":\"Hong Kong\",\"ja\":\"香港\",\"it\":\"Hong Kong\",\"cn\":\"中国香港\"}', 22.25000000, 114.16666666, '??', 'U+1F1ED U+1F1F0', 1, 'Q8646', '2018-07-20 20:11:03', '2021-12-11 13:24:22'),
(99, 'Hungary', 'HUN', 'HU', '348', '36', 'Budapest', 'HUF', 'Hungarian forint', 'Ft', '.hu', 'Magyarország', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Budapest\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"헝가리\",\"br\":\"Hungria\",\"pt\":\"Hungria\",\"nl\":\"Hongarije\",\"hr\":\"Mađarska\",\"fa\":\"مجارستان\",\"de\":\"Ungarn\",\"es\":\"Hungría\",\"fr\":\"Hongrie\",\"ja\":\"ハンガリー\",\"it\":\"Ungheria\",\"cn\":\"匈牙利\"}', 47.00000000, 20.00000000, '??', 'U+1F1ED U+1F1FA', 1, 'Q28', '2018-07-20 20:11:03', '2021-12-11 13:24:30'),
(100, 'Iceland', 'ISL', 'IS', '352', '354', 'Reykjavik', 'ISK', 'Icelandic króna', 'kr', '.is', 'Ísland', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Atlantic/Reykjavik\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"아이슬란드\",\"br\":\"Islândia\",\"pt\":\"Islândia\",\"nl\":\"IJsland\",\"hr\":\"Island\",\"fa\":\"ایسلند\",\"de\":\"Island\",\"es\":\"Islandia\",\"fr\":\"Islande\",\"ja\":\"アイスランド\",\"it\":\"Islanda\",\"cn\":\"冰岛\"}', 65.00000000, -18.00000000, '??', 'U+1F1EE U+1F1F8', 1, 'Q189', '2018-07-20 20:11:03', '2021-12-11 13:24:35'),
(101, 'India', 'IND', 'IN', '356', '91', 'New Delhi', 'INR', 'Indian rupee', '₹', '.in', 'भारत', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Asia/Kolkata\",\"gmtOffset\":19800,\"gmtOffsetName\":\"UTC+05:30\",\"abbreviation\":\"IST\",\"tzName\":\"Indian Standard Time\"}]', '{\"kr\":\"인도\",\"br\":\"Índia\",\"pt\":\"Índia\",\"nl\":\"India\",\"hr\":\"Indija\",\"fa\":\"هند\",\"de\":\"Indien\",\"es\":\"India\",\"fr\":\"Inde\",\"ja\":\"インド\",\"it\":\"India\",\"cn\":\"印度\"}', 20.00000000, 77.00000000, '??', 'U+1F1EE U+1F1F3', 1, 'Q668', '2018-07-20 20:11:03', '2021-12-11 13:24:41'),
(102, 'Indonesia', 'IDN', 'ID', '360', '62', 'Jakarta', 'IDR', 'Indonesian rupiah', 'Rp', '.id', 'Indonesia', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Jakarta\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"WIB\",\"tzName\":\"Western Indonesian Time\"},{\"zoneName\":\"Asia/Jayapura\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"WIT\",\"tzName\":\"Eastern Indonesian Time\"},{\"zoneName\":\"Asia/Makassar\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"WITA\",\"tzName\":\"Central Indonesia Time\"},{\"zoneName\":\"Asia/Pontianak\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"WIB\",\"tzName\":\"Western Indonesian Time\"}]', '{\"kr\":\"인도네시아\",\"br\":\"Indonésia\",\"pt\":\"Indonésia\",\"nl\":\"Indonesië\",\"hr\":\"Indonezija\",\"fa\":\"اندونزی\",\"de\":\"Indonesien\",\"es\":\"Indonesia\",\"fr\":\"Indonésie\",\"ja\":\"インドネシア\",\"it\":\"Indonesia\",\"cn\":\"印度尼西亚\"}', -5.00000000, 120.00000000, '??', 'U+1F1EE U+1F1E9', 1, 'Q252', '2018-07-20 20:11:03', '2021-12-11 13:24:49'),
(103, 'Iran', 'IRN', 'IR', '364', '98', 'Tehran', 'IRR', 'Iranian rial', '﷼', '.ir', 'ایران', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Asia/Tehran\",\"gmtOffset\":12600,\"gmtOffsetName\":\"UTC+03:30\",\"abbreviation\":\"IRDT\",\"tzName\":\"Iran Daylight Time\"}]', '{\"kr\":\"이란\",\"br\":\"Irã\",\"pt\":\"Irão\",\"nl\":\"Iran\",\"hr\":\"Iran\",\"fa\":\"ایران\",\"de\":\"Iran\",\"es\":\"Iran\",\"fr\":\"Iran\",\"ja\":\"イラン・イスラム共和国\",\"cn\":\"伊朗\"}', 32.00000000, 53.00000000, '??', 'U+1F1EE U+1F1F7', 1, 'Q794', '2018-07-20 20:11:03', '2021-12-11 13:24:54'),
(104, 'Iraq', 'IRQ', 'IQ', '368', '964', 'Baghdad', 'IQD', 'Iraqi dinar', 'د.ع', '.iq', 'العراق', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Baghdad\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"AST\",\"tzName\":\"Arabia Standard Time\"}]', '{\"kr\":\"이라크\",\"br\":\"Iraque\",\"pt\":\"Iraque\",\"nl\":\"Irak\",\"hr\":\"Irak\",\"fa\":\"عراق\",\"de\":\"Irak\",\"es\":\"Irak\",\"fr\":\"Irak\",\"ja\":\"イラク\",\"it\":\"Iraq\",\"cn\":\"伊拉克\"}', 33.00000000, 44.00000000, '??', 'U+1F1EE U+1F1F6', 1, 'Q796', '2018-07-20 20:11:03', '2021-12-11 13:25:01'),
(105, 'Ireland', 'IRL', 'IE', '372', '353', 'Dublin', 'EUR', 'Euro', '€', '.ie', 'Éire', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Dublin\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"아일랜드\",\"br\":\"Irlanda\",\"pt\":\"Irlanda\",\"nl\":\"Ierland\",\"hr\":\"Irska\",\"fa\":\"ایرلند\",\"de\":\"Irland\",\"es\":\"Irlanda\",\"fr\":\"Irlande\",\"ja\":\"アイルランド\",\"it\":\"Irlanda\",\"cn\":\"爱尔兰\"}', 53.00000000, -8.00000000, '??', 'U+1F1EE U+1F1EA', 1, 'Q27', '2018-07-20 20:11:03', '2021-12-11 13:25:07'),
(106, 'Israel', 'ISR', 'IL', '376', '972', 'Jerusalem', 'ILS', 'Israeli new shekel', '₪', '.il', 'יִשְׂרָאֵל', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Jerusalem\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"IST\",\"tzName\":\"Israel Standard Time\"}]', '{\"kr\":\"이스라엘\",\"br\":\"Israel\",\"pt\":\"Israel\",\"nl\":\"Israël\",\"hr\":\"Izrael\",\"fa\":\"اسرائیل\",\"de\":\"Israel\",\"es\":\"Israel\",\"fr\":\"Israël\",\"ja\":\"イスラエル\",\"it\":\"Israele\",\"cn\":\"以色列\"}', 31.50000000, 34.75000000, '??', 'U+1F1EE U+1F1F1', 1, 'Q801', '2018-07-20 20:11:03', '2021-12-11 13:25:27'),
(107, 'Italy', 'ITA', 'IT', '380', '39', 'Rome', 'EUR', 'Euro', '€', '.it', 'Italia', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Rome\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"이탈리아\",\"br\":\"Itália\",\"pt\":\"Itália\",\"nl\":\"Italië\",\"hr\":\"Italija\",\"fa\":\"ایتالیا\",\"de\":\"Italien\",\"es\":\"Italia\",\"fr\":\"Italie\",\"ja\":\"イタリア\",\"it\":\"Italia\",\"cn\":\"意大利\"}', 42.83333333, 12.83333333, '??', 'U+1F1EE U+1F1F9', 1, 'Q38', '2018-07-20 20:11:03', '2021-12-11 13:25:33'),
(108, 'Jamaica', 'JAM', 'JM', '388', '+1-876', 'Kingston', 'JMD', 'Jamaican dollar', 'J$', '.jm', 'Jamaica', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Jamaica\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"}]', '{\"kr\":\"자메이카\",\"br\":\"Jamaica\",\"pt\":\"Jamaica\",\"nl\":\"Jamaica\",\"hr\":\"Jamajka\",\"fa\":\"جامائیکا\",\"de\":\"Jamaika\",\"es\":\"Jamaica\",\"fr\":\"Jamaïque\",\"ja\":\"ジャマイカ\",\"it\":\"Giamaica\",\"cn\":\"牙买加\"}', 18.25000000, -77.50000000, '??', 'U+1F1EF U+1F1F2', 1, 'Q766', '2018-07-20 20:11:03', '2021-12-11 13:25:41'),
(109, 'Japan', 'JPN', 'JP', '392', '81', 'Tokyo', 'JPY', 'Japanese yen', '¥', '.jp', '日本', 'Asia', 'Eastern Asia', '[{\"zoneName\":\"Asia/Tokyo\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"JST\",\"tzName\":\"Japan Standard Time\"}]', '{\"kr\":\"일본\",\"br\":\"Japão\",\"pt\":\"Japão\",\"nl\":\"Japan\",\"hr\":\"Japan\",\"fa\":\"ژاپن\",\"de\":\"Japan\",\"es\":\"Japón\",\"fr\":\"Japon\",\"ja\":\"日本\",\"it\":\"Giappone\",\"cn\":\"日本\"}', 36.00000000, 138.00000000, '??', 'U+1F1EF U+1F1F5', 1, 'Q17', '2018-07-20 20:11:03', '2021-12-11 13:25:46'),
(110, 'Jersey', 'JEY', 'JE', '832', '+44-1534', 'Saint Helier', 'GBP', 'British pound', '£', '.je', 'Jersey', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Jersey\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"저지 섬\",\"br\":\"Jersey\",\"pt\":\"Jersey\",\"nl\":\"Jersey\",\"hr\":\"Jersey\",\"fa\":\"جرزی\",\"de\":\"Jersey\",\"es\":\"Jersey\",\"fr\":\"Jersey\",\"ja\":\"ジャージー\",\"it\":\"Isola di Jersey\",\"cn\":\"泽西岛\"}', 49.25000000, -2.16666666, '??', 'U+1F1EF U+1F1EA', 1, 'Q785', '2018-07-20 20:11:03', '2021-12-11 13:25:59'),
(111, 'Jordan', 'JOR', 'JO', '400', '962', 'Amman', 'JOD', 'Jordanian dinar', 'ا.د', '.jo', 'الأردن', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Amman\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"요르단\",\"br\":\"Jordânia\",\"pt\":\"Jordânia\",\"nl\":\"Jordanië\",\"hr\":\"Jordan\",\"fa\":\"اردن\",\"de\":\"Jordanien\",\"es\":\"Jordania\",\"fr\":\"Jordanie\",\"ja\":\"ヨルダン\",\"it\":\"Giordania\",\"cn\":\"约旦\"}', 31.00000000, 36.00000000, '??', 'U+1F1EF U+1F1F4', 1, 'Q810', '2018-07-20 20:11:03', '2021-12-11 13:26:07'),
(112, 'Kazakhstan', 'KAZ', 'KZ', '398', '7', 'Astana', 'KZT', 'Kazakhstani tenge', 'лв', '.kz', 'Қазақстан', 'Asia', 'Central Asia', '[{\"zoneName\":\"Asia/Almaty\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"ALMT\",\"tzName\":\"Alma-Ata Time[1\"},{\"zoneName\":\"Asia/Aqtau\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"AQTT\",\"tzName\":\"Aqtobe Time\"},{\"zoneName\":\"Asia/Aqtobe\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"AQTT\",\"tzName\":\"Aqtobe Time\"},{\"zoneName\":\"Asia/Atyrau\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"MSD+1\",\"tzName\":\"Moscow Daylight Time+1\"},{\"zoneName\":\"Asia/Oral\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"ORAT\",\"tzName\":\"Oral Time\"},{\"zoneName\":\"Asia/Qostanay\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"QYZST\",\"tzName\":\"Qyzylorda Summer Time\"},{\"zoneName\":\"Asia/Qyzylorda\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"QYZT\",\"tzName\":\"Qyzylorda Summer Time\"}]', '{\"kr\":\"카자흐스탄\",\"br\":\"Cazaquistão\",\"pt\":\"Cazaquistão\",\"nl\":\"Kazachstan\",\"hr\":\"Kazahstan\",\"fa\":\"قزاقستان\",\"de\":\"Kasachstan\",\"es\":\"Kazajistán\",\"fr\":\"Kazakhstan\",\"ja\":\"カザフスタン\",\"it\":\"Kazakistan\",\"cn\":\"哈萨克斯坦\"}', 48.00000000, 68.00000000, '??', 'U+1F1F0 U+1F1FF', 1, 'Q232', '2018-07-20 20:11:03', '2021-12-11 13:26:18'),
(113, 'Kenya', 'KEN', 'KE', '404', '254', 'Nairobi', 'KES', 'Kenyan shilling', 'KSh', '.ke', 'Kenya', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Nairobi\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"케냐\",\"br\":\"Quênia\",\"pt\":\"Quénia\",\"nl\":\"Kenia\",\"hr\":\"Kenija\",\"fa\":\"کنیا\",\"de\":\"Kenia\",\"es\":\"Kenia\",\"fr\":\"Kenya\",\"ja\":\"ケニア\",\"it\":\"Kenya\",\"cn\":\"肯尼亚\"}', 1.00000000, 38.00000000, '??', 'U+1F1F0 U+1F1EA', 1, 'Q114', '2018-07-20 20:11:03', '2021-12-11 13:26:23'),
(114, 'Kiribati', 'KIR', 'KI', '296', '686', 'Tarawa', 'AUD', 'Australian dollar', '$', '.ki', 'Kiribati', 'Oceania', 'Micronesia', '[{\"zoneName\":\"Pacific/Enderbury\",\"gmtOffset\":46800,\"gmtOffsetName\":\"UTC+13:00\",\"abbreviation\":\"PHOT\",\"tzName\":\"Phoenix Island Time\"},{\"zoneName\":\"Pacific/Kiritimati\",\"gmtOffset\":50400,\"gmtOffsetName\":\"UTC+14:00\",\"abbreviation\":\"LINT\",\"tzName\":\"Line Islands Time\"},{\"zoneName\":\"Pacific/Tarawa\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"GILT\",\"tzName\":\"Gilbert Island Time\"}]', '{\"kr\":\"키리바시\",\"br\":\"Kiribati\",\"pt\":\"Quiribáti\",\"nl\":\"Kiribati\",\"hr\":\"Kiribati\",\"fa\":\"کیریباتی\",\"de\":\"Kiribati\",\"es\":\"Kiribati\",\"fr\":\"Kiribati\",\"ja\":\"キリバス\",\"it\":\"Kiribati\",\"cn\":\"基里巴斯\"}', 1.41666666, 173.00000000, '??', 'U+1F1F0 U+1F1EE', 1, 'Q710', '2018-07-20 20:11:03', '2021-12-11 13:26:30'),
(115, 'North Korea', 'PRK', 'KP', '408', '850', 'Pyongyang', 'KPW', 'North Korean Won', '₩', '.kp', '북한', 'Asia', 'Eastern Asia', '[{\"zoneName\":\"Asia/Pyongyang\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"KST\",\"tzName\":\"Korea Standard Time\"}]', '{\"kr\":\"조선민주주의인민공화국\",\"br\":\"Coreia do Norte\",\"pt\":\"Coreia do Norte\",\"nl\":\"Noord-Korea\",\"hr\":\"Sjeverna Koreja\",\"fa\":\"کره جنوبی\",\"de\":\"Nordkorea\",\"es\":\"Corea del Norte\",\"fr\":\"Corée du Nord\",\"ja\":\"朝鮮民主主義人民共和国\",\"it\":\"Corea del Nord\",\"cn\":\"朝鲜\"}', 40.00000000, 127.00000000, '??', 'U+1F1F0 U+1F1F5', 1, 'Q423', '2018-07-20 20:11:03', '2021-12-11 13:35:28'),
(116, 'South Korea', 'KOR', 'KR', '410', '82', 'Seoul', 'KRW', 'Won', '₩', '.kr', '대한민국', 'Asia', 'Eastern Asia', '[{\"zoneName\":\"Asia/Seoul\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"KST\",\"tzName\":\"Korea Standard Time\"}]', '{\"kr\":\"대한민국\",\"br\":\"Coreia do Sul\",\"pt\":\"Coreia do Sul\",\"nl\":\"Zuid-Korea\",\"hr\":\"Južna Koreja\",\"fa\":\"کره شمالی\",\"de\":\"Südkorea\",\"es\":\"Corea del Sur\",\"fr\":\"Corée du Sud\",\"ja\":\"大韓民国\",\"it\":\"Corea del Sud\",\"cn\":\"韩国\"}', 37.00000000, 127.50000000, '??', 'U+1F1F0 U+1F1F7', 1, 'Q884', '2018-07-20 20:11:03', '2021-12-11 13:42:11'),
(117, 'Kuwait', 'KWT', 'KW', '414', '965', 'Kuwait City', 'KWD', 'Kuwaiti dinar', 'ك.د', '.kw', 'الكويت', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Kuwait\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"AST\",\"tzName\":\"Arabia Standard Time\"}]', '{\"kr\":\"쿠웨이트\",\"br\":\"Kuwait\",\"pt\":\"Kuwait\",\"nl\":\"Koeweit\",\"hr\":\"Kuvajt\",\"fa\":\"کویت\",\"de\":\"Kuwait\",\"es\":\"Kuwait\",\"fr\":\"Koweït\",\"ja\":\"クウェート\",\"it\":\"Kuwait\",\"cn\":\"科威特\"}', 29.50000000, 45.75000000, '??', 'U+1F1F0 U+1F1FC', 1, 'Q817', '2018-07-20 20:11:03', '2021-12-11 13:26:44'),
(118, 'Kyrgyzstan', 'KGZ', 'KG', '417', '996', 'Bishkek', 'KGS', 'Kyrgyzstani som', 'лв', '.kg', 'Кыргызстан', 'Asia', 'Central Asia', '[{\"zoneName\":\"Asia/Bishkek\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"KGT\",\"tzName\":\"Kyrgyzstan Time\"}]', '{\"kr\":\"키르기스스탄\",\"br\":\"Quirguistão\",\"pt\":\"Quirguizistão\",\"nl\":\"Kirgizië\",\"hr\":\"Kirgistan\",\"fa\":\"قرقیزستان\",\"de\":\"Kirgisistan\",\"es\":\"Kirguizistán\",\"fr\":\"Kirghizistan\",\"ja\":\"キルギス\",\"it\":\"Kirghizistan\",\"cn\":\"吉尔吉斯斯坦\"}', 41.00000000, 75.00000000, '??', 'U+1F1F0 U+1F1EC', 1, 'Q813', '2018-07-20 20:11:03', '2021-12-11 13:26:49'),
(119, 'Laos', 'LAO', 'LA', '418', '856', 'Vientiane', 'LAK', 'Lao kip', '₭', '.la', 'ສປປລາວ', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Vientiane\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"ICT\",\"tzName\":\"Indochina Time\"}]', '{\"kr\":\"라오스\",\"br\":\"Laos\",\"pt\":\"Laos\",\"nl\":\"Laos\",\"hr\":\"Laos\",\"fa\":\"لائوس\",\"de\":\"Laos\",\"es\":\"Laos\",\"fr\":\"Laos\",\"ja\":\"ラオス人民民主共和国\",\"it\":\"Laos\",\"cn\":\"寮人民民主共和国\"}', 18.00000000, 105.00000000, '??', 'U+1F1F1 U+1F1E6', 1, 'Q819', '2018-07-20 20:11:03', '2021-12-11 13:26:58'),
(120, 'Latvia', 'LVA', 'LV', '428', '371', 'Riga', 'EUR', 'Euro', '€', '.lv', 'Latvija', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Riga\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"라트비아\",\"br\":\"Letônia\",\"pt\":\"Letónia\",\"nl\":\"Letland\",\"hr\":\"Latvija\",\"fa\":\"لتونی\",\"de\":\"Lettland\",\"es\":\"Letonia\",\"fr\":\"Lettonie\",\"ja\":\"ラトビア\",\"it\":\"Lettonia\",\"cn\":\"拉脱维亚\"}', 57.00000000, 25.00000000, '??', 'U+1F1F1 U+1F1FB', 1, 'Q211', '2018-07-20 20:11:03', '2021-12-11 13:27:04'),
(121, 'Lebanon', 'LBN', 'LB', '422', '961', 'Beirut', 'LBP', 'Lebanese pound', '£', '.lb', 'لبنان', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Beirut\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"레바논\",\"br\":\"Líbano\",\"pt\":\"Líbano\",\"nl\":\"Libanon\",\"hr\":\"Libanon\",\"fa\":\"لبنان\",\"de\":\"Libanon\",\"es\":\"Líbano\",\"fr\":\"Liban\",\"ja\":\"レバノン\",\"it\":\"Libano\",\"cn\":\"黎巴嫩\"}', 33.83333333, 35.83333333, '??', 'U+1F1F1 U+1F1E7', 1, 'Q822', '2018-07-20 20:11:03', '2021-12-11 13:27:10'),
(122, 'Lesotho', 'LSO', 'LS', '426', '266', 'Maseru', 'LSL', 'Lesotho loti', 'L', '.ls', 'Lesotho', 'Africa', 'Southern Africa', '[{\"zoneName\":\"Africa/Maseru\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"SAST\",\"tzName\":\"South African Standard Time\"}]', '{\"kr\":\"레소토\",\"br\":\"Lesoto\",\"pt\":\"Lesoto\",\"nl\":\"Lesotho\",\"hr\":\"Lesoto\",\"fa\":\"لسوتو\",\"de\":\"Lesotho\",\"es\":\"Lesotho\",\"fr\":\"Lesotho\",\"ja\":\"レソト\",\"it\":\"Lesotho\",\"cn\":\"莱索托\"}', -29.50000000, 28.50000000, '??', 'U+1F1F1 U+1F1F8', 1, 'Q1013', '2018-07-20 20:11:03', '2021-12-11 13:27:27'),
(123, 'Liberia', 'LBR', 'LR', '430', '231', 'Monrovia', 'LRD', 'Liberian dollar', '$', '.lr', 'Liberia', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Monrovia\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"라이베리아\",\"br\":\"Libéria\",\"pt\":\"Libéria\",\"nl\":\"Liberia\",\"hr\":\"Liberija\",\"fa\":\"لیبریا\",\"de\":\"Liberia\",\"es\":\"Liberia\",\"fr\":\"Liberia\",\"ja\":\"リベリア\",\"it\":\"Liberia\",\"cn\":\"利比里亚\"}', 6.50000000, -9.50000000, '??', 'U+1F1F1 U+1F1F7', 1, 'Q1014', '2018-07-20 20:11:03', '2021-12-11 13:27:33'),
(124, 'Libya', 'LBY', 'LY', '434', '218', 'Tripolis', 'LYD', 'Libyan dinar', 'د.ل', '.ly', '‏ليبيا', 'Africa', 'Northern Africa', '[{\"zoneName\":\"Africa/Tripoli\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"리비아\",\"br\":\"Líbia\",\"pt\":\"Líbia\",\"nl\":\"Libië\",\"hr\":\"Libija\",\"fa\":\"لیبی\",\"de\":\"Libyen\",\"es\":\"Libia\",\"fr\":\"Libye\",\"ja\":\"リビア\",\"it\":\"Libia\",\"cn\":\"利比亚\"}', 25.00000000, 17.00000000, '??', 'U+1F1F1 U+1F1FE', 1, 'Q1016', '2018-07-20 20:11:03', '2021-12-11 13:27:38'),
(125, 'Liechtenstein', 'LIE', 'LI', '438', '423', 'Vaduz', 'CHF', 'Swiss franc', 'CHf', '.li', 'Liechtenstein', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Vaduz\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"리히텐슈타인\",\"br\":\"Liechtenstein\",\"pt\":\"Listenstaine\",\"nl\":\"Liechtenstein\",\"hr\":\"Lihtenštajn\",\"fa\":\"لیختن‌اشتاین\",\"de\":\"Liechtenstein\",\"es\":\"Liechtenstein\",\"fr\":\"Liechtenstein\",\"ja\":\"リヒテンシュタイン\",\"it\":\"Liechtenstein\",\"cn\":\"列支敦士登\"}', 47.26666666, 9.53333333, '??', 'U+1F1F1 U+1F1EE', 1, 'Q347', '2018-07-20 20:11:03', '2021-12-11 13:27:47'),
(126, 'Lithuania', 'LTU', 'LT', '440', '370', 'Vilnius', 'EUR', 'Euro', '€', '.lt', 'Lietuva', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Vilnius\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"리투아니아\",\"br\":\"Lituânia\",\"pt\":\"Lituânia\",\"nl\":\"Litouwen\",\"hr\":\"Litva\",\"fa\":\"لیتوانی\",\"de\":\"Litauen\",\"es\":\"Lituania\",\"fr\":\"Lituanie\",\"ja\":\"リトアニア\",\"it\":\"Lituania\",\"cn\":\"立陶宛\"}', 56.00000000, 24.00000000, '??', 'U+1F1F1 U+1F1F9', 1, 'Q37', '2018-07-20 20:11:03', '2021-12-11 13:28:00'),
(127, 'Luxembourg', 'LUX', 'LU', '442', '352', 'Luxembourg', 'EUR', 'Euro', '€', '.lu', 'Luxembourg', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Luxembourg\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"룩셈부르크\",\"br\":\"Luxemburgo\",\"pt\":\"Luxemburgo\",\"nl\":\"Luxemburg\",\"hr\":\"Luksemburg\",\"fa\":\"لوکزامبورگ\",\"de\":\"Luxemburg\",\"es\":\"Luxemburgo\",\"fr\":\"Luxembourg\",\"ja\":\"ルクセンブルク\",\"it\":\"Lussemburgo\",\"cn\":\"卢森堡\"}', 49.75000000, 6.16666666, '??', 'U+1F1F1 U+1F1FA', 1, 'Q32', '2018-07-20 20:11:03', '2021-12-11 13:28:06'),
(128, 'Macau S.A.R.', 'MAC', 'MO', '446', '853', 'Macao', 'MOP', 'Macanese pataca', '$', '.mo', '澳門', 'Asia', 'Eastern Asia', '[{\"zoneName\":\"Asia/Macau\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"CST\",\"tzName\":\"China Standard Time\"}]', '{\"kr\":\"마카오\",\"br\":\"Macau\",\"pt\":\"Macau\",\"nl\":\"Macao\",\"hr\":\"Makao\",\"fa\":\"مکائو\",\"de\":\"Macao\",\"es\":\"Macao\",\"fr\":\"Macao\",\"ja\":\"マカオ\",\"it\":\"Macao\",\"cn\":\"中国澳门\"}', 22.16666666, 113.55000000, '??', 'U+1F1F2 U+1F1F4', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:28:15'),
(129, 'Macedonia', 'MKD', 'MK', '807', '389', 'Skopje', 'MKD', 'Denar', 'ден', '.mk', 'Северна Македонија', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Skopje\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"마케도니아\",\"br\":\"Macedônia\",\"pt\":\"Macedónia\",\"nl\":\"Macedonië\",\"hr\":\"Makedonija\",\"fa\":\"\",\"de\":\"Mazedonien\",\"es\":\"Macedonia\",\"fr\":\"Macédoine\",\"ja\":\"マケドニア旧ユーゴスラビア共和国\",\"it\":\"Macedonia\",\"cn\":\"马其顿\"}', 41.83333333, 22.00000000, '??', 'U+1F1F2 U+1F1F0', 1, 'Q221', '2018-07-20 20:11:03', '2021-12-11 13:28:42'),
(130, 'Madagascar', 'MDG', 'MG', '450', '261', 'Antananarivo', 'MGA', 'Malagasy ariary', 'Ar', '.mg', 'Madagasikara', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Indian/Antananarivo\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"마다가스카르\",\"br\":\"Madagascar\",\"pt\":\"Madagáscar\",\"nl\":\"Madagaskar\",\"hr\":\"Madagaskar\",\"fa\":\"ماداگاسکار\",\"de\":\"Madagaskar\",\"es\":\"Madagascar\",\"fr\":\"Madagascar\",\"ja\":\"マダガスカル\",\"it\":\"Madagascar\",\"cn\":\"马达加斯加\"}', -20.00000000, 47.00000000, '??', 'U+1F1F2 U+1F1EC', 1, 'Q1019', '2018-07-20 20:11:03', '2021-12-11 13:28:52'),
(131, 'Malawi', 'MWI', 'MW', '454', '265', 'Lilongwe', 'MWK', 'Malawian kwacha', 'MK', '.mw', 'Malawi', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Blantyre\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]', '{\"kr\":\"말라위\",\"br\":\"Malawi\",\"pt\":\"Malávi\",\"nl\":\"Malawi\",\"hr\":\"Malavi\",\"fa\":\"مالاوی\",\"de\":\"Malawi\",\"es\":\"Malawi\",\"fr\":\"Malawi\",\"ja\":\"マラウイ\",\"it\":\"Malawi\",\"cn\":\"马拉维\"}', -13.50000000, 34.00000000, '??', 'U+1F1F2 U+1F1FC', 1, 'Q1020', '2018-07-20 20:11:03', '2021-12-11 13:29:01');
INSERT INTO `countries` (`id`, `name`, `iso3`, `iso2`, `numeric_code`, `phonecode`, `capital`, `currency`, `currency_name`, `currency_symbol`, `tld`, `native`, `region`, `subregion`, `timezones`, `translations`, `latitude`, `longitude`, `emoji`, `emojiU`, `flag`, `wikiDataId`, `created_at`, `updated_at`) VALUES
(132, 'Malaysia', 'MYS', 'MY', '458', '60', 'Kuala Lumpur', 'MYR', 'Malaysian ringgit', 'RM', '.my', 'Malaysia', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Kuala_Lumpur\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"MYT\",\"tzName\":\"Malaysia Time\"},{\"zoneName\":\"Asia/Kuching\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"MYT\",\"tzName\":\"Malaysia Time\"}]', '{\"kr\":\"말레이시아\",\"br\":\"Malásia\",\"pt\":\"Malásia\",\"nl\":\"Maleisië\",\"hr\":\"Malezija\",\"fa\":\"مالزی\",\"de\":\"Malaysia\",\"es\":\"Malasia\",\"fr\":\"Malaisie\",\"ja\":\"マレーシア\",\"it\":\"Malesia\",\"cn\":\"马来西亚\"}', 2.50000000, 112.50000000, '??', 'U+1F1F2 U+1F1FE', 1, 'Q833', '2018-07-20 20:11:03', '2021-12-11 13:29:08'),
(133, 'Maldives', 'MDV', 'MV', '462', '960', 'Male', 'MVR', 'Maldivian rufiyaa', 'Rf', '.mv', 'Maldives', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Indian/Maldives\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"MVT\",\"tzName\":\"Maldives Time\"}]', '{\"kr\":\"몰디브\",\"br\":\"Maldivas\",\"pt\":\"Maldivas\",\"nl\":\"Maldiven\",\"hr\":\"Maldivi\",\"fa\":\"مالدیو\",\"de\":\"Malediven\",\"es\":\"Maldivas\",\"fr\":\"Maldives\",\"ja\":\"モルディブ\",\"it\":\"Maldive\",\"cn\":\"马尔代夫\"}', 3.25000000, 73.00000000, '??', 'U+1F1F2 U+1F1FB', 1, 'Q826', '2018-07-20 20:11:03', '2021-12-11 13:29:15'),
(134, 'Mali', 'MLI', 'ML', '466', '223', 'Bamako', 'XOF', 'West African CFA franc', 'CFA', '.ml', 'Mali', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Bamako\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"말리\",\"br\":\"Mali\",\"pt\":\"Mali\",\"nl\":\"Mali\",\"hr\":\"Mali\",\"fa\":\"مالی\",\"de\":\"Mali\",\"es\":\"Mali\",\"fr\":\"Mali\",\"ja\":\"マリ\",\"it\":\"Mali\",\"cn\":\"马里\"}', 17.00000000, -4.00000000, '??', 'U+1F1F2 U+1F1F1', 1, 'Q912', '2018-07-20 20:11:03', '2021-12-11 13:29:20'),
(135, 'Malta', 'MLT', 'MT', '470', '356', 'Valletta', 'EUR', 'Euro', '€', '.mt', 'Malta', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Malta\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"몰타\",\"br\":\"Malta\",\"pt\":\"Malta\",\"nl\":\"Malta\",\"hr\":\"Malta\",\"fa\":\"مالت\",\"de\":\"Malta\",\"es\":\"Malta\",\"fr\":\"Malte\",\"ja\":\"マルタ\",\"it\":\"Malta\",\"cn\":\"马耳他\"}', 35.83333333, 14.58333333, '??', 'U+1F1F2 U+1F1F9', 1, 'Q233', '2018-07-20 20:11:03', '2021-12-11 13:29:26'),
(136, 'Man (Isle of)', 'IMN', 'IM', '833', '+44-1624', 'Douglas, Isle of Man', 'GBP', 'British pound', '£', '.im', 'Isle of Man', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Isle_of_Man\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"맨 섬\",\"br\":\"Ilha de Man\",\"pt\":\"Ilha de Man\",\"nl\":\"Isle of Man\",\"hr\":\"Otok Man\",\"fa\":\"جزیره من\",\"de\":\"Insel Man\",\"es\":\"Isla de Man\",\"fr\":\"Île de Man\",\"ja\":\"マン島\",\"it\":\"Isola di Man\",\"cn\":\"马恩岛\"}', 54.25000000, -4.50000000, '??', 'U+1F1EE U+1F1F2', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:29:43'),
(137, 'Marshall Islands', 'MHL', 'MH', '584', '692', 'Majuro', 'USD', 'United States dollar', '$', '.mh', 'M̧ajeļ', 'Oceania', 'Micronesia', '[{\"zoneName\":\"Pacific/Kwajalein\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"MHT\",\"tzName\":\"Marshall Islands Time\"},{\"zoneName\":\"Pacific/Majuro\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"MHT\",\"tzName\":\"Marshall Islands Time\"}]', '{\"kr\":\"마셜 제도\",\"br\":\"Ilhas Marshall\",\"pt\":\"Ilhas Marshall\",\"nl\":\"Marshalleilanden\",\"hr\":\"Maršalovi Otoci\",\"fa\":\"جزایر مارشال\",\"de\":\"Marshallinseln\",\"es\":\"Islas Marshall\",\"fr\":\"Îles Marshall\",\"ja\":\"マーシャル諸島\",\"it\":\"Isole Marshall\",\"cn\":\"马绍尔群岛\"}', 9.00000000, 168.00000000, '??', 'U+1F1F2 U+1F1ED', 1, 'Q709', '2018-07-20 20:11:03', '2021-12-11 13:30:32'),
(138, 'Martinique', 'MTQ', 'MQ', '474', '596', 'Fort-de-France', 'EUR', 'Euro', '€', '.mq', 'Martinique', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Martinique\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"마르티니크\",\"br\":\"Martinica\",\"pt\":\"Martinica\",\"nl\":\"Martinique\",\"hr\":\"Martinique\",\"fa\":\"مونتسرات\",\"de\":\"Martinique\",\"es\":\"Martinica\",\"fr\":\"Martinique\",\"ja\":\"マルティニーク\",\"it\":\"Martinica\",\"cn\":\"马提尼克岛\"}', 14.66666700, -61.00000000, '??', 'U+1F1F2 U+1F1F6', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:30:44'),
(139, 'Mauritania', 'MRT', 'MR', '478', '222', 'Nouakchott', 'MRO', 'Mauritanian ouguiya', 'MRU', '.mr', 'موريتانيا', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Nouakchott\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"모리타니\",\"br\":\"Mauritânia\",\"pt\":\"Mauritânia\",\"nl\":\"Mauritanië\",\"hr\":\"Mauritanija\",\"fa\":\"موریتانی\",\"de\":\"Mauretanien\",\"es\":\"Mauritania\",\"fr\":\"Mauritanie\",\"ja\":\"モーリタニア\",\"it\":\"Mauritania\",\"cn\":\"毛里塔尼亚\"}', 20.00000000, -12.00000000, '??', 'U+1F1F2 U+1F1F7', 1, 'Q1025', '2018-07-20 20:11:03', '2021-12-11 13:31:03'),
(140, 'Mauritius', 'MUS', 'MU', '480', '230', 'Port Louis', 'MUR', 'Mauritian rupee', '₨', '.mu', 'Maurice', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Indian/Mauritius\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"MUT\",\"tzName\":\"Mauritius Time\"}]', '{\"kr\":\"모리셔스\",\"br\":\"Maurício\",\"pt\":\"Maurícia\",\"nl\":\"Mauritius\",\"hr\":\"Mauricijus\",\"fa\":\"موریس\",\"de\":\"Mauritius\",\"es\":\"Mauricio\",\"fr\":\"Île Maurice\",\"ja\":\"モーリシャス\",\"it\":\"Mauritius\",\"cn\":\"毛里求斯\"}', -20.28333333, 57.55000000, '??', 'U+1F1F2 U+1F1FA', 1, 'Q1027', '2018-07-20 20:11:03', '2021-12-11 13:31:10'),
(141, 'Mayotte', 'MYT', 'YT', '175', '262', 'Mamoudzou', 'EUR', 'Euro', '€', '.yt', 'Mayotte', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Indian/Mayotte\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"마요트\",\"br\":\"Mayotte\",\"pt\":\"Mayotte\",\"nl\":\"Mayotte\",\"hr\":\"Mayotte\",\"fa\":\"مایوت\",\"de\":\"Mayotte\",\"es\":\"Mayotte\",\"fr\":\"Mayotte\",\"ja\":\"マヨット\",\"it\":\"Mayotte\",\"cn\":\"马约特\"}', -12.83333333, 45.16666666, '??', 'U+1F1FE U+1F1F9', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:31:15'),
(142, 'Mexico', 'MEX', 'MX', '484', '52', 'Ciudad de México', 'MXN', 'Mexican peso', '$', '.mx', 'México', 'Americas', 'Central America', '[{\"zoneName\":\"America/Bahia_Banderas\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Cancun\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Chihuahua\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Hermosillo\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Matamoros\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Mazatlan\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Merida\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Mexico_City\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Monterrey\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Ojinaga\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Tijuana\",\"gmtOffset\":-28800,\"gmtOffsetName\":\"UTC-08:00\",\"abbreviation\":\"PST\",\"tzName\":\"Pacific Standard Time (North America\"}]', '{\"kr\":\"멕시코\",\"br\":\"México\",\"pt\":\"México\",\"nl\":\"Mexico\",\"hr\":\"Meksiko\",\"fa\":\"مکزیک\",\"de\":\"Mexiko\",\"es\":\"México\",\"fr\":\"Mexique\",\"ja\":\"メキシコ\",\"it\":\"Messico\",\"cn\":\"墨西哥\"}', 23.00000000, -102.00000000, '??', 'U+1F1F2 U+1F1FD', 1, 'Q96', '2018-07-20 20:11:03', '2021-12-11 13:31:23'),
(143, 'Micronesia', 'FSM', 'FM', '583', '691', 'Palikir', 'USD', 'United States dollar', '$', '.fm', 'Micronesia', 'Oceania', 'Micronesia', '[{\"zoneName\":\"Pacific/Chuuk\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"CHUT\",\"tzName\":\"Chuuk Time\"},{\"zoneName\":\"Pacific/Kosrae\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"KOST\",\"tzName\":\"Kosrae Time\"},{\"zoneName\":\"Pacific/Pohnpei\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"PONT\",\"tzName\":\"Pohnpei Standard Time\"}]', '{\"kr\":\"미크로네시아 연방\",\"br\":\"Micronésia\",\"pt\":\"Micronésia\",\"nl\":\"Micronesië\",\"hr\":\"Mikronezija\",\"fa\":\"ایالات فدرال میکرونزی\",\"de\":\"Mikronesien\",\"es\":\"Micronesia\",\"fr\":\"Micronésie\",\"ja\":\"ミクロネシア連邦\",\"it\":\"Micronesia\",\"cn\":\"密克罗尼西亚\"}', 6.91666666, 158.25000000, '??', 'U+1F1EB U+1F1F2', 1, 'Q702', '2018-07-20 20:11:03', '2021-12-11 13:31:30'),
(144, 'Moldova', 'MDA', 'MD', '498', '373', 'Chisinau', 'MDL', 'Moldovan leu', 'L', '.md', 'Moldova', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Chisinau\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"몰도바\",\"br\":\"Moldávia\",\"pt\":\"Moldávia\",\"nl\":\"Moldavië\",\"hr\":\"Moldova\",\"fa\":\"مولداوی\",\"de\":\"Moldawie\",\"es\":\"Moldavia\",\"fr\":\"Moldavie\",\"ja\":\"モルドバ共和国\",\"it\":\"Moldavia\",\"cn\":\"摩尔多瓦\"}', 47.00000000, 29.00000000, '??', 'U+1F1F2 U+1F1E9', 1, 'Q217', '2018-07-20 20:11:03', '2021-12-11 13:31:39'),
(145, 'Monaco', 'MCO', 'MC', '492', '377', 'Monaco', 'EUR', 'Euro', '€', '.mc', 'Monaco', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Monaco\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"모나코\",\"br\":\"Mônaco\",\"pt\":\"Mónaco\",\"nl\":\"Monaco\",\"hr\":\"Monako\",\"fa\":\"موناکو\",\"de\":\"Monaco\",\"es\":\"Mónaco\",\"fr\":\"Monaco\",\"ja\":\"モナコ\",\"it\":\"Principato di Monaco\",\"cn\":\"摩纳哥\"}', 43.73333333, 7.40000000, '??', 'U+1F1F2 U+1F1E8', 1, 'Q235', '2018-07-20 20:11:03', '2021-12-11 13:31:44'),
(146, 'Mongolia', 'MNG', 'MN', '496', '976', 'Ulan Bator', 'MNT', 'Mongolian tögrög', '₮', '.mn', 'Монгол улс', 'Asia', 'Eastern Asia', '[{\"zoneName\":\"Asia/Choibalsan\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"CHOT\",\"tzName\":\"Choibalsan Standard Time\"},{\"zoneName\":\"Asia/Hovd\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"HOVT\",\"tzName\":\"Hovd Time\"},{\"zoneName\":\"Asia/Ulaanbaatar\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"ULAT\",\"tzName\":\"Ulaanbaatar Standard Time\"}]', '{\"kr\":\"몽골\",\"br\":\"Mongólia\",\"pt\":\"Mongólia\",\"nl\":\"Mongolië\",\"hr\":\"Mongolija\",\"fa\":\"مغولستان\",\"de\":\"Mongolei\",\"es\":\"Mongolia\",\"fr\":\"Mongolie\",\"ja\":\"モンゴル\",\"it\":\"Mongolia\",\"cn\":\"蒙古\"}', 46.00000000, 105.00000000, '??', 'U+1F1F2 U+1F1F3', 1, 'Q711', '2018-07-20 20:11:03', '2021-12-11 13:32:45'),
(147, 'Montenegro', 'MNE', 'ME', '499', '382', 'Podgorica', 'EUR', 'Euro', '€', '.me', 'Црна Гора', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Podgorica\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"몬테네그로\",\"br\":\"Montenegro\",\"pt\":\"Montenegro\",\"nl\":\"Montenegro\",\"hr\":\"Crna Gora\",\"fa\":\"مونته‌نگرو\",\"de\":\"Montenegro\",\"es\":\"Montenegro\",\"fr\":\"Monténégro\",\"ja\":\"モンテネグロ\",\"it\":\"Montenegro\",\"cn\":\"黑山\"}', 42.50000000, 19.30000000, '??', 'U+1F1F2 U+1F1EA', 1, 'Q236', '2018-07-20 20:11:03', '2021-12-11 13:31:46'),
(148, 'Montserrat', 'MSR', 'MS', '500', '+1-664', 'Plymouth', 'XCD', 'Eastern Caribbean dollar', '$', '.ms', 'Montserrat', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Montserrat\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"몬트세랫\",\"br\":\"Montserrat\",\"pt\":\"Monserrate\",\"nl\":\"Montserrat\",\"hr\":\"Montserrat\",\"fa\":\"مایوت\",\"de\":\"Montserrat\",\"es\":\"Montserrat\",\"fr\":\"Montserrat\",\"ja\":\"モントセラト\",\"it\":\"Montserrat\",\"cn\":\"蒙特塞拉特\"}', 16.75000000, -62.20000000, '??', 'U+1F1F2 U+1F1F8', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:32:56'),
(149, 'Morocco', 'MAR', 'MA', '504', '212', 'Rabat', 'MAD', 'Moroccan dirham', 'DH', '.ma', 'المغرب', 'Africa', 'Northern Africa', '[{\"zoneName\":\"Africa/Casablanca\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WEST\",\"tzName\":\"Western European Summer Time\"}]', '{\"kr\":\"모로코\",\"br\":\"Marrocos\",\"pt\":\"Marrocos\",\"nl\":\"Marokko\",\"hr\":\"Maroko\",\"fa\":\"مراکش\",\"de\":\"Marokko\",\"es\":\"Marruecos\",\"fr\":\"Maroc\",\"ja\":\"モロッコ\",\"it\":\"Marocco\",\"cn\":\"摩洛哥\"}', 32.00000000, -5.00000000, '??', 'U+1F1F2 U+1F1E6', 1, 'Q1028', '2018-07-20 20:11:03', '2021-12-11 13:33:08'),
(150, 'Mozambique', 'MOZ', 'MZ', '508', '258', 'Maputo', 'MZN', 'Mozambican metical', 'MT', '.mz', 'Moçambique', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Maputo\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]', '{\"kr\":\"모잠비크\",\"br\":\"Moçambique\",\"pt\":\"Moçambique\",\"nl\":\"Mozambique\",\"hr\":\"Mozambik\",\"fa\":\"موزامبیک\",\"de\":\"Mosambik\",\"es\":\"Mozambique\",\"fr\":\"Mozambique\",\"ja\":\"モザンビーク\",\"it\":\"Mozambico\",\"cn\":\"莫桑比克\"}', -18.25000000, 35.00000000, '??', 'U+1F1F2 U+1F1FF', 1, 'Q1029', '2018-07-20 20:11:03', '2021-12-11 13:33:19'),
(151, 'Myanmar', 'MMR', 'MM', '104', '95', 'Nay Pyi Taw', 'MMK', 'Burmese kyat', 'K', '.mm', 'မြန်မာ', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Yangon\",\"gmtOffset\":23400,\"gmtOffsetName\":\"UTC+06:30\",\"abbreviation\":\"MMT\",\"tzName\":\"Myanmar Standard Time\"}]', '{\"kr\":\"미얀마\",\"br\":\"Myanmar\",\"pt\":\"Myanmar\",\"nl\":\"Myanmar\",\"hr\":\"Mijanmar\",\"fa\":\"میانمار\",\"de\":\"Myanmar\",\"es\":\"Myanmar\",\"fr\":\"Myanmar\",\"ja\":\"ミャンマー\",\"it\":\"Birmania\",\"cn\":\"缅甸\"}', 22.00000000, 98.00000000, '??', 'U+1F1F2 U+1F1F2', 1, 'Q836', '2018-07-20 20:11:03', '2021-12-11 13:33:25'),
(152, 'Namibia', 'NAM', 'NA', '516', '264', 'Windhoek', 'NAD', 'Namibian dollar', '$', '.na', 'Namibia', 'Africa', 'Southern Africa', '[{\"zoneName\":\"Africa/Windhoek\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"WAST\",\"tzName\":\"West Africa Summer Time\"}]', '{\"kr\":\"나미비아\",\"br\":\"Namíbia\",\"pt\":\"Namíbia\",\"nl\":\"Namibië\",\"hr\":\"Namibija\",\"fa\":\"نامیبیا\",\"de\":\"Namibia\",\"es\":\"Namibia\",\"fr\":\"Namibie\",\"ja\":\"ナミビア\",\"it\":\"Namibia\",\"cn\":\"纳米比亚\"}', -22.00000000, 17.00000000, '??', 'U+1F1F3 U+1F1E6', 1, 'Q1030', '2018-07-20 20:11:03', '2021-12-11 13:33:32'),
(153, 'Nauru', 'NRU', 'NR', '520', '674', 'Yaren', 'AUD', 'Australian dollar', '$', '.nr', 'Nauru', 'Oceania', 'Micronesia', '[{\"zoneName\":\"Pacific/Nauru\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"NRT\",\"tzName\":\"Nauru Time\"}]', '{\"kr\":\"나우루\",\"br\":\"Nauru\",\"pt\":\"Nauru\",\"nl\":\"Nauru\",\"hr\":\"Nauru\",\"fa\":\"نائورو\",\"de\":\"Nauru\",\"es\":\"Nauru\",\"fr\":\"Nauru\",\"ja\":\"ナウル\",\"it\":\"Nauru\",\"cn\":\"瑙鲁\"}', -0.53333333, 166.91666666, '??', 'U+1F1F3 U+1F1F7', 1, 'Q697', '2018-07-20 20:11:03', '2021-12-11 13:33:37'),
(154, 'Nepal', 'NPL', 'NP', '524', '977', 'Kathmandu', 'NPR', 'Nepalese rupee', '₨', '.np', 'नपल', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Asia/Kathmandu\",\"gmtOffset\":20700,\"gmtOffsetName\":\"UTC+05:45\",\"abbreviation\":\"NPT\",\"tzName\":\"Nepal Time\"}]', '{\"kr\":\"네팔\",\"br\":\"Nepal\",\"pt\":\"Nepal\",\"nl\":\"Nepal\",\"hr\":\"Nepal\",\"fa\":\"نپال\",\"de\":\"Népal\",\"es\":\"Nepal\",\"fr\":\"Népal\",\"ja\":\"ネパール\",\"it\":\"Nepal\",\"cn\":\"尼泊尔\"}', 28.00000000, 84.00000000, '??', 'U+1F1F3 U+1F1F5', 1, 'Q837', '2018-07-20 20:11:03', '2021-12-11 13:33:41'),
(155, 'Bonaire, Sint Eustatius and Saba', 'BES', 'BQ', '535', '599', 'Kralendijk', 'USD', 'United States dollar', '$', '.an', 'Caribisch Nederland', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Anguilla\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"보네르 섬\",\"br\":\"Bonaire\",\"pt\":\"Bonaire\",\"fa\":\"بونیر\",\"de\":\"Bonaire, Sint Eustatius und Saba\",\"fr\":\"Bonaire, Saint-Eustache et Saba\",\"it\":\"Bonaire, Saint-Eustache e Saba\",\"cn\":\"博内尔岛、圣尤斯特歇斯和萨巴岛\"}', 12.15000000, -68.26666700, '??', 'U+1F1E7 U+1F1F6', 1, 'Q27561', '2018-07-20 20:11:03', '2021-12-11 12:58:02'),
(156, 'Netherlands', 'NLD', 'NL', '528', '31', 'Amsterdam', 'EUR', 'Euro', '€', '.nl', 'Nederland', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Amsterdam\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"네덜란드 \",\"br\":\"Holanda\",\"pt\":\"Países Baixos\",\"nl\":\"Nederland\",\"hr\":\"Nizozemska\",\"fa\":\"پادشاهی هلند\",\"de\":\"Niederlande\",\"es\":\"Países Bajos\",\"fr\":\"Pays-Bas\",\"ja\":\"オランダ\",\"it\":\"Paesi Bassi\",\"cn\":\"荷兰\"}', 52.50000000, 5.75000000, '??', 'U+1F1F3 U+1F1F1', 1, 'Q55', '2018-07-20 20:11:03', '2021-12-11 13:31:52'),
(157, 'New Caledonia', 'NCL', 'NC', '540', '687', 'Noumea', 'XPF', 'CFP franc', '₣', '.nc', 'Nouvelle-Calédonie', 'Oceania', 'Melanesia', '[{\"zoneName\":\"Pacific/Noumea\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"NCT\",\"tzName\":\"New Caledonia Time\"}]', '{\"kr\":\"누벨칼레도니\",\"br\":\"Nova Caledônia\",\"pt\":\"Nova Caledónia\",\"nl\":\"Nieuw-Caledonië\",\"hr\":\"Nova Kaledonija\",\"fa\":\"کالدونیای جدید\",\"de\":\"Neukaledonien\",\"es\":\"Nueva Caledonia\",\"fr\":\"Nouvelle-Calédonie\",\"ja\":\"ニューカレドニア\",\"it\":\"Nuova Caledonia\",\"cn\":\"新喀里多尼亚\"}', -21.50000000, 165.50000000, '??', 'U+1F1F3 U+1F1E8', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:34:11'),
(158, 'New Zealand', 'NZL', 'NZ', '554', '64', 'Wellington', 'NZD', 'New Zealand dollar', '$', '.nz', 'New Zealand', 'Oceania', 'Australia and New Zealand', '[{\"zoneName\":\"Pacific/Auckland\",\"gmtOffset\":46800,\"gmtOffsetName\":\"UTC+13:00\",\"abbreviation\":\"NZDT\",\"tzName\":\"New Zealand Daylight Time\"},{\"zoneName\":\"Pacific/Chatham\",\"gmtOffset\":49500,\"gmtOffsetName\":\"UTC+13:45\",\"abbreviation\":\"CHAST\",\"tzName\":\"Chatham Standard Time\"}]', '{\"kr\":\"뉴질랜드\",\"br\":\"Nova Zelândia\",\"pt\":\"Nova Zelândia\",\"nl\":\"Nieuw-Zeeland\",\"hr\":\"Novi Zeland\",\"fa\":\"نیوزیلند\",\"de\":\"Neuseeland\",\"es\":\"Nueva Zelanda\",\"fr\":\"Nouvelle-Zélande\",\"ja\":\"ニュージーランド\",\"it\":\"Nuova Zelanda\",\"cn\":\"新西兰\"}', -41.00000000, 174.00000000, '??', 'U+1F1F3 U+1F1FF', 1, 'Q664', '2018-07-20 20:11:03', '2021-12-11 13:34:18'),
(159, 'Nicaragua', 'NIC', 'NI', '558', '505', 'Managua', 'NIO', 'Nicaraguan córdoba', 'C$', '.ni', 'Nicaragua', 'Americas', 'Central America', '[{\"zoneName\":\"America/Managua\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"}]', '{\"kr\":\"니카라과\",\"br\":\"Nicarágua\",\"pt\":\"Nicarágua\",\"nl\":\"Nicaragua\",\"hr\":\"Nikaragva\",\"fa\":\"نیکاراگوئه\",\"de\":\"Nicaragua\",\"es\":\"Nicaragua\",\"fr\":\"Nicaragua\",\"ja\":\"ニカラグア\",\"it\":\"Nicaragua\",\"cn\":\"尼加拉瓜\"}', 13.00000000, -85.00000000, '??', 'U+1F1F3 U+1F1EE', 1, 'Q811', '2018-07-20 20:11:03', '2021-12-11 13:34:25'),
(160, 'Niger', 'NER', 'NE', '562', '227', 'Niamey', 'XOF', 'West African CFA franc', 'CFA', '.ne', 'Niger', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Niamey\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"니제르\",\"br\":\"Níger\",\"pt\":\"Níger\",\"nl\":\"Niger\",\"hr\":\"Niger\",\"fa\":\"نیجر\",\"de\":\"Niger\",\"es\":\"Níger\",\"fr\":\"Niger\",\"ja\":\"ニジェール\",\"it\":\"Niger\",\"cn\":\"尼日尔\"}', 16.00000000, 8.00000000, '??', 'U+1F1F3 U+1F1EA', 1, 'Q1032', '2018-07-20 20:11:03', '2021-12-11 13:34:32'),
(161, 'Nigeria', 'NGA', 'NG', '566', '234', 'Abuja', 'NGN', 'Nigerian naira', '₦', '.ng', 'Nigeria', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Lagos\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WAT\",\"tzName\":\"West Africa Time\"}]', '{\"kr\":\"나이지리아\",\"br\":\"Nigéria\",\"pt\":\"Nigéria\",\"nl\":\"Nigeria\",\"hr\":\"Nigerija\",\"fa\":\"نیجریه\",\"de\":\"Nigeria\",\"es\":\"Nigeria\",\"fr\":\"Nigéria\",\"ja\":\"ナイジェリア\",\"it\":\"Nigeria\",\"cn\":\"尼日利亚\"}', 10.00000000, 8.00000000, '??', 'U+1F1F3 U+1F1EC', 1, 'Q1033', '2018-07-20 20:11:03', '2021-12-11 13:34:37'),
(162, 'Niue', 'NIU', 'NU', '570', '683', 'Alofi', 'NZD', 'New Zealand dollar', '$', '.nu', 'Niuē', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Niue\",\"gmtOffset\":-39600,\"gmtOffsetName\":\"UTC-11:00\",\"abbreviation\":\"NUT\",\"tzName\":\"Niue Time\"}]', '{\"kr\":\"니우에\",\"br\":\"Niue\",\"pt\":\"Niue\",\"nl\":\"Niue\",\"hr\":\"Niue\",\"fa\":\"نیووی\",\"de\":\"Niue\",\"es\":\"Niue\",\"fr\":\"Niue\",\"ja\":\"ニウエ\",\"it\":\"Niue\",\"cn\":\"纽埃\"}', -19.03333333, -169.86666666, '??', 'U+1F1F3 U+1F1FA', 1, 'Q34020', '2018-07-20 20:11:03', '2021-12-11 13:34:42'),
(163, 'Norfolk Island', 'NFK', 'NF', '574', '672', 'Kingston', 'AUD', 'Australian dollar', '$', '.nf', 'Norfolk Island', 'Oceania', 'Australia and New Zealand', '[{\"zoneName\":\"Pacific/Norfolk\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"NFT\",\"tzName\":\"Norfolk Time\"}]', '{\"kr\":\"노퍽 섬\",\"br\":\"Ilha Norfolk\",\"pt\":\"Ilha Norfolk\",\"nl\":\"Norfolkeiland\",\"hr\":\"Otok Norfolk\",\"fa\":\"جزیره نورفک\",\"de\":\"Norfolkinsel\",\"es\":\"Isla de Norfolk\",\"fr\":\"Île de Norfolk\",\"ja\":\"ノーフォーク島\",\"it\":\"Isola Norfolk\",\"cn\":\"诺福克岛\"}', -29.03333333, 167.95000000, '??', 'U+1F1F3 U+1F1EB', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:35:39'),
(164, 'Northern Mariana Islands', 'MNP', 'MP', '580', '+1-670', 'Saipan', 'USD', 'United States dollar', '$', '.mp', 'Northern Mariana Islands', 'Oceania', 'Micronesia', '[{\"zoneName\":\"Pacific/Saipan\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"ChST\",\"tzName\":\"Chamorro Standard Time\"}]', '{\"kr\":\"북마리아나 제도\",\"br\":\"Ilhas Marianas\",\"pt\":\"Ilhas Marianas\",\"nl\":\"Noordelijke Marianeneilanden\",\"hr\":\"Sjevernomarijanski otoci\",\"fa\":\"جزایر ماریانای شمالی\",\"de\":\"Nördliche Marianen\",\"es\":\"Islas Marianas del Norte\",\"fr\":\"Îles Mariannes du Nord\",\"ja\":\"北マリアナ諸島\",\"it\":\"Isole Marianne Settentrionali\",\"cn\":\"北马里亚纳群岛\"}', 15.20000000, 145.75000000, '??', 'U+1F1F2 U+1F1F5', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:35:55'),
(165, 'Norway', 'NOR', 'NO', '578', '47', 'Oslo', 'NOK', 'Norwegian krone', 'kr', '.no', 'Norge', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Oslo\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"노르웨이\",\"br\":\"Noruega\",\"pt\":\"Noruega\",\"nl\":\"Noorwegen\",\"hr\":\"Norveška\",\"fa\":\"نروژ\",\"de\":\"Norwegen\",\"es\":\"Noruega\",\"fr\":\"Norvège\",\"ja\":\"ノルウェー\",\"it\":\"Norvegia\",\"cn\":\"挪威\"}', 62.00000000, 10.00000000, '??', 'U+1F1F3 U+1F1F4', 1, 'Q20', '2018-07-20 20:11:03', '2021-12-11 13:37:57'),
(166, 'Oman', 'OMN', 'OM', '512', '968', 'Muscat', 'OMR', 'Omani rial', '.ع.ر', '.om', 'عمان', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Muscat\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"GST\",\"tzName\":\"Gulf Standard Time\"}]', '{\"kr\":\"오만\",\"br\":\"Omã\",\"pt\":\"Omã\",\"nl\":\"Oman\",\"hr\":\"Oman\",\"fa\":\"عمان\",\"de\":\"Oman\",\"es\":\"Omán\",\"fr\":\"Oman\",\"ja\":\"オマーン\",\"it\":\"oman\",\"cn\":\"阿曼\"}', 21.00000000, 57.00000000, '??', 'U+1F1F4 U+1F1F2', 1, 'Q842', '2018-07-20 20:11:03', '2021-12-11 13:38:03'),
(167, 'Pakistan', 'PAK', 'PK', '586', '92', 'Islamabad', 'PKR', 'Pakistani rupee', '₨', '.pk', 'Pakistan', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Asia/Karachi\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"PKT\",\"tzName\":\"Pakistan Standard Time\"}]', '{\"kr\":\"파키스탄\",\"br\":\"Paquistão\",\"pt\":\"Paquistão\",\"nl\":\"Pakistan\",\"hr\":\"Pakistan\",\"fa\":\"پاکستان\",\"de\":\"Pakistan\",\"es\":\"Pakistán\",\"fr\":\"Pakistan\",\"ja\":\"パキスタン\",\"it\":\"Pakistan\",\"cn\":\"巴基斯坦\"}', 30.00000000, 70.00000000, '??', 'U+1F1F5 U+1F1F0', 1, 'Q843', '2018-07-20 20:11:03', '2021-12-11 13:38:09'),
(168, 'Palau', 'PLW', 'PW', '585', '680', 'Melekeok', 'USD', 'United States dollar', '$', '.pw', 'Palau', 'Oceania', 'Micronesia', '[{\"zoneName\":\"Pacific/Palau\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"PWT\",\"tzName\":\"Palau Time\"}]', '{\"kr\":\"팔라우\",\"br\":\"Palau\",\"pt\":\"Palau\",\"nl\":\"Palau\",\"hr\":\"Palau\",\"fa\":\"پالائو\",\"de\":\"Palau\",\"es\":\"Palau\",\"fr\":\"Palaos\",\"ja\":\"パラオ\",\"it\":\"Palau\",\"cn\":\"帕劳\"}', 7.50000000, 134.50000000, '??', 'U+1F1F5 U+1F1FC', 1, 'Q695', '2018-07-20 20:11:03', '2021-12-11 13:35:58'),
(169, 'Palestinian Territory Occupied', 'PSE', 'PS', '275', '970', 'East Jerusalem', 'ILS', 'Israeli new shekel', '₪', '.ps', 'فلسطين', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Gaza\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"},{\"zoneName\":\"Asia/Hebron\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"팔레스타인 영토\",\"br\":\"Palestina\",\"pt\":\"Palestina\",\"nl\":\"Palestijnse gebieden\",\"hr\":\"Palestina\",\"fa\":\"فلسطین\",\"de\":\"Palästina\",\"es\":\"Palestina\",\"fr\":\"Palestine\",\"ja\":\"パレスチナ\",\"it\":\"Palestina\",\"cn\":\"巴勒斯坦\"}', 31.90000000, 35.20000000, '??', 'U+1F1F5 U+1F1F8', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:38:16'),
(170, 'Panama', 'PAN', 'PA', '591', '507', 'Panama City', 'PAB', 'Panamanian balboa', 'B/.', '.pa', 'Panamá', 'Americas', 'Central America', '[{\"zoneName\":\"America/Panama\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"}]', '{\"kr\":\"파나마\",\"br\":\"Panamá\",\"pt\":\"Panamá\",\"nl\":\"Panama\",\"hr\":\"Panama\",\"fa\":\"پاناما\",\"de\":\"Panama\",\"es\":\"Panamá\",\"fr\":\"Panama\",\"ja\":\"パナマ\",\"it\":\"Panama\",\"cn\":\"巴拿马\"}', 9.00000000, -80.00000000, '??', 'U+1F1F5 U+1F1E6', 1, 'Q804', '2018-07-20 20:11:03', '2021-12-11 13:38:22'),
(171, 'Papua new Guinea', 'PNG', 'PG', '598', '675', 'Port Moresby', 'PGK', 'Papua New Guinean kina', 'K', '.pg', 'Papua Niugini', 'Oceania', 'Melanesia', '[{\"zoneName\":\"Pacific/Bougainville\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"BST\",\"tzName\":\"Bougainville Standard Time[6\"},{\"zoneName\":\"Pacific/Port_Moresby\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"PGT\",\"tzName\":\"Papua New Guinea Time\"}]', '{\"kr\":\"파푸아뉴기니\",\"br\":\"Papua Nova Guiné\",\"pt\":\"Papua Nova Guiné\",\"nl\":\"Papoea-Nieuw-Guinea\",\"hr\":\"Papua Nova Gvineja\",\"fa\":\"پاپوآ گینه نو\",\"de\":\"Papua-Neuguinea\",\"es\":\"Papúa Nueva Guinea\",\"fr\":\"Papouasie-Nouvelle-Guinée\",\"ja\":\"パプアニューギニア\",\"it\":\"Papua Nuova Guinea\",\"cn\":\"巴布亚新几内亚\"}', -6.00000000, 147.00000000, '??', 'U+1F1F5 U+1F1EC', 1, 'Q691', '2018-07-20 20:11:03', '2021-12-11 13:38:31'),
(172, 'Paraguay', 'PRY', 'PY', '600', '595', 'Asuncion', 'PYG', 'Paraguayan guarani', '₲', '.py', 'Paraguay', 'Americas', 'South America', '[{\"zoneName\":\"America/Asuncion\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"PYST\",\"tzName\":\"Paraguay Summer Time\"}]', '{\"kr\":\"파라과이\",\"br\":\"Paraguai\",\"pt\":\"Paraguai\",\"nl\":\"Paraguay\",\"hr\":\"Paragvaj\",\"fa\":\"پاراگوئه\",\"de\":\"Paraguay\",\"es\":\"Paraguay\",\"fr\":\"Paraguay\",\"ja\":\"パラグアイ\",\"it\":\"Paraguay\",\"cn\":\"巴拉圭\"}', -23.00000000, -58.00000000, '??', 'U+1F1F5 U+1F1FE', 1, 'Q733', '2018-07-20 20:11:03', '2021-12-11 13:38:49'),
(173, 'Peru', 'PER', 'PE', '604', '51', 'Lima', 'PEN', 'Peruvian sol', 'S/.', '.pe', 'Perú', 'Americas', 'South America', '[{\"zoneName\":\"America/Lima\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"PET\",\"tzName\":\"Peru Time\"}]', '{\"kr\":\"페루\",\"br\":\"Peru\",\"pt\":\"Peru\",\"nl\":\"Peru\",\"hr\":\"Peru\",\"fa\":\"پرو\",\"de\":\"Peru\",\"es\":\"Perú\",\"fr\":\"Pérou\",\"ja\":\"ペルー\",\"it\":\"Perù\",\"cn\":\"秘鲁\"}', -10.00000000, -76.00000000, '??', 'U+1F1F5 U+1F1EA', 1, 'Q419', '2018-07-20 20:11:03', '2021-12-11 13:38:59'),
(174, 'Philippines', 'PHL', 'PH', '608', '63', 'Manila', 'PHP', 'Philippine peso', '₱', '.ph', 'Pilipinas', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Manila\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"PHT\",\"tzName\":\"Philippine Time\"}]', '{\"kr\":\"필리핀\",\"br\":\"Filipinas\",\"pt\":\"Filipinas\",\"nl\":\"Filipijnen\",\"hr\":\"Filipini\",\"fa\":\"جزایر الندفیلیپین\",\"de\":\"Philippinen\",\"es\":\"Filipinas\",\"fr\":\"Philippines\",\"ja\":\"フィリピン\",\"it\":\"Filippine\",\"cn\":\"菲律宾\"}', 13.00000000, 122.00000000, '??', 'U+1F1F5 U+1F1ED', 1, 'Q928', '2018-07-20 20:11:03', '2021-12-11 13:39:03'),
(175, 'Pitcairn Island', 'PCN', 'PN', '612', '870', 'Adamstown', 'NZD', 'New Zealand dollar', '$', '.pn', 'Pitcairn Islands', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Pitcairn\",\"gmtOffset\":-28800,\"gmtOffsetName\":\"UTC-08:00\",\"abbreviation\":\"PST\",\"tzName\":\"Pacific Standard Time (North America\"}]', '{\"kr\":\"핏케언 제도\",\"br\":\"Ilhas Pitcairn\",\"pt\":\"Ilhas Picárnia\",\"nl\":\"Pitcairneilanden\",\"hr\":\"Pitcairnovo otočje\",\"fa\":\"پیتکرن\",\"de\":\"Pitcairn\",\"es\":\"Islas Pitcairn\",\"fr\":\"Îles Pitcairn\",\"ja\":\"ピトケアン\",\"it\":\"Isole Pitcairn\",\"cn\":\"皮特凯恩群岛\"}', -25.06666666, -130.10000000, '??', 'U+1F1F5 U+1F1F3', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:39:08'),
(176, 'Poland', 'POL', 'PL', '616', '48', 'Warsaw', 'PLN', 'Polish złoty', 'zł', '.pl', 'Polska', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Warsaw\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"폴란드\",\"br\":\"Polônia\",\"pt\":\"Polónia\",\"nl\":\"Polen\",\"hr\":\"Poljska\",\"fa\":\"لهستان\",\"de\":\"Polen\",\"es\":\"Polonia\",\"fr\":\"Pologne\",\"ja\":\"ポーランド\",\"it\":\"Polonia\",\"cn\":\"波兰\"}', 52.00000000, 20.00000000, '??', 'U+1F1F5 U+1F1F1', 1, 'Q36', '2018-07-20 20:11:03', '2021-12-11 13:39:19'),
(177, 'Portugal', 'PRT', 'PT', '620', '351', 'Lisbon', 'EUR', 'Euro', '€', '.pt', 'Portugal', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Atlantic/Azores\",\"gmtOffset\":-3600,\"gmtOffsetName\":\"UTC-01:00\",\"abbreviation\":\"AZOT\",\"tzName\":\"Azores Standard Time\"},{\"zoneName\":\"Atlantic/Madeira\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"WET\",\"tzName\":\"Western European Time\"},{\"zoneName\":\"Europe/Lisbon\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"WET\",\"tzName\":\"Western European Time\"}]', '{\"kr\":\"포르투갈\",\"br\":\"Portugal\",\"pt\":\"Portugal\",\"nl\":\"Portugal\",\"hr\":\"Portugal\",\"fa\":\"پرتغال\",\"de\":\"Portugal\",\"es\":\"Portugal\",\"fr\":\"Portugal\",\"ja\":\"ポルトガル\",\"it\":\"Portogallo\",\"cn\":\"葡萄牙\"}', 39.50000000, -8.00000000, '??', 'U+1F1F5 U+1F1F9', 1, 'Q45', '2018-07-20 20:11:03', '2021-12-11 13:32:09'),
(178, 'Puerto Rico', 'PRI', 'PR', '630', '+1-787 and 1-939', 'San Juan', 'USD', 'United States dollar', '$', '.pr', 'Puerto Rico', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Puerto_Rico\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"푸에르토리코\",\"br\":\"Porto Rico\",\"pt\":\"Porto Rico\",\"nl\":\"Puerto Rico\",\"hr\":\"Portoriko\",\"fa\":\"پورتو ریکو\",\"de\":\"Puerto Rico\",\"es\":\"Puerto Rico\",\"fr\":\"Porto Rico\",\"ja\":\"プエルトリコ\",\"it\":\"Porto Rico\",\"cn\":\"波多黎各\"}', 18.25000000, -66.50000000, '??', 'U+1F1F5 U+1F1F7', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:36:02'),
(179, 'Qatar', 'QAT', 'QA', '634', '974', 'Doha', 'QAR', 'Qatari riyal', 'ق.ر', '.qa', 'قطر', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Qatar\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"AST\",\"tzName\":\"Arabia Standard Time\"}]', '{\"kr\":\"카타르\",\"br\":\"Catar\",\"pt\":\"Catar\",\"nl\":\"Qatar\",\"hr\":\"Katar\",\"fa\":\"قطر\",\"de\":\"Katar\",\"es\":\"Catar\",\"fr\":\"Qatar\",\"ja\":\"カタール\",\"it\":\"Qatar\",\"cn\":\"卡塔尔\"}', 25.50000000, 51.25000000, '??', 'U+1F1F6 U+1F1E6', 1, 'Q846', '2018-07-20 20:11:03', '2021-12-11 13:39:24'),
(180, 'Reunion', 'REU', 'RE', '638', '262', 'Saint-Denis', 'EUR', 'Euro', '€', '.re', 'La Réunion', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Indian/Reunion\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"RET\",\"tzName\":\"Réunion Time\"}]', '{\"kr\":\"레위니옹\",\"br\":\"Reunião\",\"pt\":\"Reunião\",\"nl\":\"Réunion\",\"hr\":\"Réunion\",\"fa\":\"رئونیون\",\"de\":\"Réunion\",\"es\":\"Reunión\",\"fr\":\"Réunion\",\"ja\":\"レユニオン\",\"it\":\"Riunione\",\"cn\":\"留尼汪岛\"}', -21.15000000, 55.50000000, '??', 'U+1F1F7 U+1F1EA', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:31:59'),
(181, 'Romania', 'ROU', 'RO', '642', '40', 'Bucharest', 'RON', 'Romanian leu', 'lei', '.ro', 'România', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Bucharest\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"루마니아\",\"br\":\"Romênia\",\"pt\":\"Roménia\",\"nl\":\"Roemenië\",\"hr\":\"Rumunjska\",\"fa\":\"رومانی\",\"de\":\"Rumänien\",\"es\":\"Rumania\",\"fr\":\"Roumanie\",\"ja\":\"ルーマニア\",\"it\":\"Romania\",\"cn\":\"罗马尼亚\"}', 46.00000000, 25.00000000, '??', 'U+1F1F7 U+1F1F4', 1, 'Q218', '2018-07-20 20:11:03', '2021-12-11 13:39:31'),
(182, 'Russia', 'RUS', 'RU', '643', '7', 'Moscow', 'RUB', 'Russian ruble', '₽', '.ru', 'Россия', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Asia/Anadyr\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"ANAT\",\"tzName\":\"Anadyr Time[4\"},{\"zoneName\":\"Asia/Barnaul\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"KRAT\",\"tzName\":\"Krasnoyarsk Time\"},{\"zoneName\":\"Asia/Chita\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"YAKT\",\"tzName\":\"Yakutsk Time\"},{\"zoneName\":\"Asia/Irkutsk\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"IRKT\",\"tzName\":\"Irkutsk Time\"},{\"zoneName\":\"Asia/Kamchatka\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"PETT\",\"tzName\":\"Kamchatka Time\"},{\"zoneName\":\"Asia/Khandyga\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"YAKT\",\"tzName\":\"Yakutsk Time\"},{\"zoneName\":\"Asia/Krasnoyarsk\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"KRAT\",\"tzName\":\"Krasnoyarsk Time\"},{\"zoneName\":\"Asia/Magadan\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"MAGT\",\"tzName\":\"Magadan Time\"},{\"zoneName\":\"Asia/Novokuznetsk\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"KRAT\",\"tzName\":\"Krasnoyarsk Time\"},{\"zoneName\":\"Asia/Novosibirsk\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"NOVT\",\"tzName\":\"Novosibirsk Time\"},{\"zoneName\":\"Asia/Omsk\",\"gmtOffset\":21600,\"gmtOffsetName\":\"UTC+06:00\",\"abbreviation\":\"OMST\",\"tzName\":\"Omsk Time\"},{\"zoneName\":\"Asia/Sakhalin\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"SAKT\",\"tzName\":\"Sakhalin Island Time\"},{\"zoneName\":\"Asia/Srednekolymsk\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"SRET\",\"tzName\":\"Srednekolymsk Time\"},{\"zoneName\":\"Asia/Tomsk\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"MSD+3\",\"tzName\":\"Moscow Daylight Time+3\"},{\"zoneName\":\"Asia/Ust-Nera\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"VLAT\",\"tzName\":\"Vladivostok Time\"},{\"zoneName\":\"Asia/Vladivostok\",\"gmtOffset\":36000,\"gmtOffsetName\":\"UTC+10:00\",\"abbreviation\":\"VLAT\",\"tzName\":\"Vladivostok Time\"},{\"zoneName\":\"Asia/Yakutsk\",\"gmtOffset\":32400,\"gmtOffsetName\":\"UTC+09:00\",\"abbreviation\":\"YAKT\",\"tzName\":\"Yakutsk Time\"},{\"zoneName\":\"Asia/Yekaterinburg\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"YEKT\",\"tzName\":\"Yekaterinburg Time\"},{\"zoneName\":\"Europe/Astrakhan\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"SAMT\",\"tzName\":\"Samara Time\"},{\"zoneName\":\"Europe/Kaliningrad\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"},{\"zoneName\":\"Europe/Kirov\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"MSK\",\"tzName\":\"Moscow Time\"},{\"zoneName\":\"Europe/Moscow\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"MSK\",\"tzName\":\"Moscow Time\"},{\"zoneName\":\"Europe/Samara\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"SAMT\",\"tzName\":\"Samara Time\"},{\"zoneName\":\"Europe/Saratov\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"MSD\",\"tzName\":\"Moscow Daylight Time+4\"},{\"zoneName\":\"Europe/Ulyanovsk\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"SAMT\",\"tzName\":\"Samara Time\"},{\"zoneName\":\"Europe/Volgograd\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"MSK\",\"tzName\":\"Moscow Standard Time\"}]', '{\"kr\":\"러시아\",\"br\":\"Rússia\",\"pt\":\"Rússia\",\"nl\":\"Rusland\",\"hr\":\"Rusija\",\"fa\":\"روسیه\",\"de\":\"Russland\",\"es\":\"Rusia\",\"fr\":\"Russie\",\"ja\":\"ロシア連邦\",\"it\":\"Russia\",\"cn\":\"俄罗斯联邦\"}', 60.00000000, 100.00000000, '??', 'U+1F1F7 U+1F1FA', 1, 'Q159', '2018-07-20 20:11:03', '2021-12-11 13:39:37'),
(183, 'Rwanda', 'RWA', 'RW', '646', '250', 'Kigali', 'RWF', 'Rwandan franc', 'FRw', '.rw', 'Rwanda', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Kigali\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]', '{\"kr\":\"르완다\",\"br\":\"Ruanda\",\"pt\":\"Ruanda\",\"nl\":\"Rwanda\",\"hr\":\"Ruanda\",\"fa\":\"رواندا\",\"de\":\"Ruanda\",\"es\":\"Ruanda\",\"fr\":\"Rwanda\",\"ja\":\"ルワンダ\",\"it\":\"Ruanda\",\"cn\":\"卢旺达\"}', -2.00000000, 30.00000000, '??', 'U+1F1F7 U+1F1FC', 1, 'Q1037', '2018-07-20 20:11:03', '2021-12-11 13:39:42'),
(184, 'Saint Helena', 'SHN', 'SH', '654', '290', 'Jamestown', 'SHP', 'Saint Helena pound', '£', '.sh', 'Saint Helena', 'Africa', 'Western Africa', '[{\"zoneName\":\"Atlantic/St_Helena\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"세인트헬레나\",\"br\":\"Santa Helena\",\"pt\":\"Santa Helena\",\"nl\":\"Sint-Helena\",\"hr\":\"Sveta Helena\",\"fa\":\"سنت هلنا، اسنشن و تریستان دا کونا\",\"de\":\"Sankt Helena\",\"es\":\"Santa Helena\",\"fr\":\"Sainte-Hélène\",\"ja\":\"セントヘレナ・アセンションおよびトリスタンダクーニャ\",\"it\":\"Sant\'Elena\",\"cn\":\"圣赫勒拿\"}', -15.95000000, -5.70000000, '??', 'U+1F1F8 U+1F1ED', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:39:50'),
(185, 'Saint Kitts And Nevis', 'KNA', 'KN', '659', '+1-869', 'Basseterre', 'XCD', 'Eastern Caribbean dollar', '$', '.kn', 'Saint Kitts and Nevis', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/St_Kitts\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"세인트키츠 네비스\",\"br\":\"São Cristóvão e Neves\",\"pt\":\"São Cristóvão e Neves\",\"nl\":\"Saint Kitts en Nevis\",\"hr\":\"Sveti Kristof i Nevis\",\"fa\":\"سنت کیتس و نویس\",\"de\":\"St. Kitts und Nevis\",\"es\":\"San Cristóbal y Nieves\",\"fr\":\"Saint-Christophe-et-Niévès\",\"ja\":\"セントクリストファー・ネイビス\",\"it\":\"Saint Kitts e Nevis\",\"cn\":\"圣基茨和尼维斯\"}', 17.33333333, -62.75000000, '??', 'U+1F1F0 U+1F1F3', 1, 'Q763', '2018-07-20 20:11:03', '2021-12-11 13:39:56'),
(186, 'Saint Lucia', 'LCA', 'LC', '662', '+1-758', 'Castries', 'XCD', 'Eastern Caribbean dollar', '$', '.lc', 'Saint Lucia', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/St_Lucia\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"세인트루시아\",\"br\":\"Santa Lúcia\",\"pt\":\"Santa Lúcia\",\"nl\":\"Saint Lucia\",\"hr\":\"Sveta Lucija\",\"fa\":\"سنت لوسیا\",\"de\":\"Saint Lucia\",\"es\":\"Santa Lucía\",\"fr\":\"Saint-Lucie\",\"ja\":\"セントルシア\",\"it\":\"Santa Lucia\",\"cn\":\"圣卢西亚\"}', 13.88333333, -60.96666666, '??', 'U+1F1F1 U+1F1E8', 1, 'Q760', '2018-07-20 20:11:03', '2021-12-11 13:39:58'),
(187, 'Saint Pierre and Miquelon', 'SPM', 'PM', '666', '508', 'Saint-Pierre', 'EUR', 'Euro', '€', '.pm', 'Saint-Pierre-et-Miquelon', 'Americas', 'Northern America', '[{\"zoneName\":\"America/Miquelon\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"PMDT\",\"tzName\":\"Pierre & Miquelon Daylight Time\"}]', '{\"kr\":\"생피에르 미클롱\",\"br\":\"Saint-Pierre e Miquelon\",\"pt\":\"São Pedro e Miquelon\",\"nl\":\"Saint Pierre en Miquelon\",\"hr\":\"Sveti Petar i Mikelon\",\"fa\":\"سن پیر و میکلن\",\"de\":\"Saint-Pierre und Miquelon\",\"es\":\"San Pedro y Miquelón\",\"fr\":\"Saint-Pierre-et-Miquelon\",\"ja\":\"サンピエール島・ミクロン島\",\"it\":\"Saint-Pierre e Miquelon\",\"cn\":\"圣皮埃尔和密克隆\"}', 46.83333333, -56.33333333, '??', 'U+1F1F5 U+1F1F2', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:32:00'),
(188, 'Saint Vincent And The Grenadines', 'VCT', 'VC', '670', '+1-784', 'Kingstown', 'XCD', 'Eastern Caribbean dollar', '$', '.vc', 'Saint Vincent and the Grenadines', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/St_Vincent\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"세인트빈센트 그레나딘\",\"br\":\"São Vicente e Granadinas\",\"pt\":\"São Vicente e Granadinas\",\"nl\":\"Saint Vincent en de Grenadines\",\"hr\":\"Sveti Vincent i Grenadini\",\"fa\":\"سنت وینسنت و گرنادین‌ها\",\"de\":\"Saint Vincent und die Grenadinen\",\"es\":\"San Vicente y Granadinas\",\"fr\":\"Saint-Vincent-et-les-Grenadines\",\"ja\":\"セントビンセントおよびグレナディーン諸島\",\"it\":\"Saint Vincent e Grenadine\",\"cn\":\"圣文森特和格林纳丁斯\"}', 13.25000000, -61.20000000, '??', 'U+1F1FB U+1F1E8', 1, 'Q757', '2018-07-20 20:11:03', '2021-12-11 13:39:59'),
(189, 'Saint-Barthelemy', 'BLM', 'BL', '652', '590', 'Gustavia', 'EUR', 'Euro', '€', '.bl', 'Saint-Barthélemy', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/St_Barthelemy\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"생바르텔레미\",\"br\":\"São Bartolomeu\",\"pt\":\"São Bartolomeu\",\"nl\":\"Saint Barthélemy\",\"hr\":\"Saint Barthélemy\",\"fa\":\"سن-بارتلمی\",\"de\":\"Saint-Barthélemy\",\"es\":\"San Bartolomé\",\"fr\":\"Saint-Barthélemy\",\"ja\":\"サン・バルテルミー\",\"it\":\"Antille Francesi\",\"cn\":\"圣巴泰勒米\"}', 18.50000000, -63.41666666, '??', 'U+1F1E7 U+1F1F1', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:36:08'),
(190, 'Saint-Martin (French part)', 'MAF', 'MF', '663', '590', 'Marigot', 'EUR', 'Euro', '€', '.mf', 'Saint-Martin', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Marigot\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"세인트마틴 섬\",\"br\":\"Saint Martin\",\"pt\":\"Ilha São Martinho\",\"nl\":\"Saint-Martin\",\"hr\":\"Sveti Martin\",\"fa\":\"سینت مارتن\",\"de\":\"Saint Martin\",\"es\":\"Saint Martin\",\"fr\":\"Saint-Martin\",\"ja\":\"サン・マルタン（フランス領）\",\"it\":\"Saint Martin\",\"cn\":\"密克罗尼西亚\"}', 18.08333333, -63.95000000, '??', 'U+1F1F2 U+1F1EB', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:36:10'),
(191, 'Samoa', 'WSM', 'WS', '882', '685', 'Apia', 'WST', 'Samoan tālā', 'SAT', '.ws', 'Samoa', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Apia\",\"gmtOffset\":50400,\"gmtOffsetName\":\"UTC+14:00\",\"abbreviation\":\"WST\",\"tzName\":\"West Samoa Time\"}]', '{\"kr\":\"사모아\",\"br\":\"Samoa\",\"pt\":\"Samoa\",\"nl\":\"Samoa\",\"hr\":\"Samoa\",\"fa\":\"ساموآ\",\"de\":\"Samoa\",\"es\":\"Samoa\",\"fr\":\"Samoa\",\"ja\":\"サモア\",\"it\":\"Samoa\",\"cn\":\"萨摩亚\"}', -13.58333333, -172.33333333, '??', 'U+1F1FC U+1F1F8', 1, 'Q683', '2018-07-20 20:11:03', '2021-12-11 13:40:07'),
(192, 'San Marino', 'SMR', 'SM', '674', '378', 'San Marino', 'EUR', 'Euro', '€', '.sm', 'San Marino', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/San_Marino\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"산마리노\",\"br\":\"San Marino\",\"pt\":\"São Marinho\",\"nl\":\"San Marino\",\"hr\":\"San Marino\",\"fa\":\"سان مارینو\",\"de\":\"San Marino\",\"es\":\"San Marino\",\"fr\":\"Saint-Marin\",\"ja\":\"サンマリノ\",\"it\":\"San Marino\",\"cn\":\"圣马力诺\"}', 43.76666666, 12.41666666, '??', 'U+1F1F8 U+1F1F2', 1, 'Q238', '2018-07-20 20:11:03', '2021-12-11 13:32:15'),
(193, 'Sao Tome and Principe', 'STP', 'ST', '678', '239', 'Sao Tome', 'STD', 'Dobra', 'Db', '.st', 'São Tomé e Príncipe', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Sao_Tome\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"상투메 프린시페\",\"br\":\"São Tomé e Príncipe\",\"pt\":\"São Tomé e Príncipe\",\"nl\":\"Sao Tomé en Principe\",\"hr\":\"Sveti Toma i Princip\",\"fa\":\"کواترو دو فرویرو\",\"de\":\"São Tomé und Príncipe\",\"es\":\"Santo Tomé y Príncipe\",\"fr\":\"Sao Tomé-et-Principe\",\"ja\":\"サントメ・プリンシペ\",\"it\":\"São Tomé e Príncipe\",\"cn\":\"圣多美和普林西比\"}', 1.00000000, 7.00000000, '??', 'U+1F1F8 U+1F1F9', 1, 'Q1039', '2018-07-20 20:11:03', '2021-12-11 13:40:28'),
(194, 'Saudi Arabia', 'SAU', 'SA', '682', '966', 'Riyadh', 'SAR', 'Saudi riyal', '﷼', '.sa', 'المملكة العربية السعودية', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Riyadh\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"AST\",\"tzName\":\"Arabia Standard Time\"}]', '{\"kr\":\"사우디아라비아\",\"br\":\"Arábia Saudita\",\"pt\":\"Arábia Saudita\",\"nl\":\"Saoedi-Arabië\",\"hr\":\"Saudijska Arabija\",\"fa\":\"عربستان سعودی\",\"de\":\"Saudi-Arabien\",\"es\":\"Arabia Saudí\",\"fr\":\"Arabie Saoudite\",\"ja\":\"サウジアラビア\",\"it\":\"Arabia Saudita\",\"cn\":\"沙特阿拉伯\"}', 25.00000000, 45.00000000, '??', 'U+1F1F8 U+1F1E6', 1, 'Q851', '2018-07-20 20:11:03', '2021-12-11 13:40:44'),
(195, 'Senegal', 'SEN', 'SN', '686', '221', 'Dakar', 'XOF', 'West African CFA franc', 'CFA', '.sn', 'Sénégal', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Dakar\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"세네갈\",\"br\":\"Senegal\",\"pt\":\"Senegal\",\"nl\":\"Senegal\",\"hr\":\"Senegal\",\"fa\":\"سنگال\",\"de\":\"Senegal\",\"es\":\"Senegal\",\"fr\":\"Sénégal\",\"ja\":\"セネガル\",\"it\":\"Senegal\",\"cn\":\"塞内加尔\"}', 14.00000000, -14.00000000, '??', 'U+1F1F8 U+1F1F3', 1, 'Q1041', '2018-07-20 20:11:03', '2021-12-11 13:40:50'),
(196, 'Serbia', 'SRB', 'RS', '688', '381', 'Belgrade', 'RSD', 'Serbian dinar', 'din', '.rs', 'Србија', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Belgrade\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"세르비아\",\"br\":\"Sérvia\",\"pt\":\"Sérvia\",\"nl\":\"Servië\",\"hr\":\"Srbija\",\"fa\":\"صربستان\",\"de\":\"Serbien\",\"es\":\"Serbia\",\"fr\":\"Serbie\",\"ja\":\"セルビア\",\"it\":\"Serbia\",\"cn\":\"塞尔维亚\"}', 44.00000000, 21.00000000, '??', 'U+1F1F7 U+1F1F8', 1, 'Q403', '2018-07-20 20:11:03', '2021-12-11 13:40:55'),
(197, 'Seychelles', 'SYC', 'SC', '690', '248', 'Victoria', 'SCR', 'Seychellois rupee', 'SRe', '.sc', 'Seychelles', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Indian/Mahe\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"SCT\",\"tzName\":\"Seychelles Time\"}]', '{\"kr\":\"세이셸\",\"br\":\"Seicheles\",\"pt\":\"Seicheles\",\"nl\":\"Seychellen\",\"hr\":\"Sejšeli\",\"fa\":\"سیشل\",\"de\":\"Seychellen\",\"es\":\"Seychelles\",\"fr\":\"Seychelles\",\"ja\":\"セーシェル\",\"it\":\"Seychelles\",\"cn\":\"塞舌尔\"}', -4.58333333, 55.66666666, '??', 'U+1F1F8 U+1F1E8', 1, 'Q1042', '2018-07-20 20:11:03', '2021-12-11 13:41:01');
INSERT INTO `countries` (`id`, `name`, `iso3`, `iso2`, `numeric_code`, `phonecode`, `capital`, `currency`, `currency_name`, `currency_symbol`, `tld`, `native`, `region`, `subregion`, `timezones`, `translations`, `latitude`, `longitude`, `emoji`, `emojiU`, `flag`, `wikiDataId`, `created_at`, `updated_at`) VALUES
(198, 'Sierra Leone', 'SLE', 'SL', '694', '232', 'Freetown', 'SLL', 'Sierra Leonean leone', 'Le', '.sl', 'Sierra Leone', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Freetown\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"시에라리온\",\"br\":\"Serra Leoa\",\"pt\":\"Serra Leoa\",\"nl\":\"Sierra Leone\",\"hr\":\"Sijera Leone\",\"fa\":\"سیرالئون\",\"de\":\"Sierra Leone\",\"es\":\"Sierra Leone\",\"fr\":\"Sierra Leone\",\"ja\":\"シエラレオネ\",\"it\":\"Sierra Leone\",\"cn\":\"塞拉利昂\"}', 8.50000000, -11.50000000, '??', 'U+1F1F8 U+1F1F1', 1, 'Q1044', '2018-07-20 20:11:03', '2021-12-11 13:41:06'),
(199, 'Singapore', 'SGP', 'SG', '702', '65', 'Singapur', 'SGD', 'Singapore dollar', '$', '.sg', 'Singapore', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Singapore\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"SGT\",\"tzName\":\"Singapore Time\"}]', '{\"kr\":\"싱가포르\",\"br\":\"Singapura\",\"pt\":\"Singapura\",\"nl\":\"Singapore\",\"hr\":\"Singapur\",\"fa\":\"سنگاپور\",\"de\":\"Singapur\",\"es\":\"Singapur\",\"fr\":\"Singapour\",\"ja\":\"シンガポール\",\"it\":\"Singapore\",\"cn\":\"新加坡\"}', 1.36666666, 103.80000000, '??', 'U+1F1F8 U+1F1EC', 1, 'Q334', '2018-07-20 20:11:03', '2021-12-11 13:41:12'),
(200, 'Slovakia', 'SVK', 'SK', '703', '421', 'Bratislava', 'EUR', 'Euro', '€', '.sk', 'Slovensko', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Bratislava\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"슬로바키아\",\"br\":\"Eslováquia\",\"pt\":\"Eslováquia\",\"nl\":\"Slowakije\",\"hr\":\"Slovačka\",\"fa\":\"اسلواکی\",\"de\":\"Slowakei\",\"es\":\"República Eslovaca\",\"fr\":\"Slovaquie\",\"ja\":\"スロバキア\",\"it\":\"Slovacchia\",\"cn\":\"斯洛伐克\"}', 48.66666666, 19.50000000, '??', 'U+1F1F8 U+1F1F0', 1, 'Q214', '2018-07-20 20:11:03', '2021-12-11 13:37:01'),
(201, 'Slovenia', 'SVN', 'SI', '705', '386', 'Ljubljana', 'EUR', 'Euro', '€', '.si', 'Slovenija', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Ljubljana\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"슬로베니아\",\"br\":\"Eslovênia\",\"pt\":\"Eslovénia\",\"nl\":\"Slovenië\",\"hr\":\"Slovenija\",\"fa\":\"اسلوونی\",\"de\":\"Slowenien\",\"es\":\"Eslovenia\",\"fr\":\"Slovénie\",\"ja\":\"スロベニア\",\"it\":\"Slovenia\",\"cn\":\"斯洛文尼亚\"}', 46.11666666, 14.81666666, '??', 'U+1F1F8 U+1F1EE', 1, 'Q215', '2018-07-20 20:11:03', '2021-12-11 13:37:05'),
(202, 'Solomon Islands', 'SLB', 'SB', '090', '677', 'Honiara', 'SBD', 'Solomon Islands dollar', 'Si$', '.sb', 'Solomon Islands', 'Oceania', 'Melanesia', '[{\"zoneName\":\"Pacific/Guadalcanal\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"SBT\",\"tzName\":\"Solomon Islands Time\"}]', '{\"kr\":\"솔로몬 제도\",\"br\":\"Ilhas Salomão\",\"pt\":\"Ilhas Salomão\",\"nl\":\"Salomonseilanden\",\"hr\":\"Solomonski Otoci\",\"fa\":\"جزایر سلیمان\",\"de\":\"Salomonen\",\"es\":\"Islas Salomón\",\"fr\":\"Îles Salomon\",\"ja\":\"ソロモン諸島\",\"it\":\"Isole Salomone\",\"cn\":\"所罗门群岛\"}', -8.00000000, 159.00000000, '??', 'U+1F1F8 U+1F1E7', 1, 'Q685', '2018-07-20 20:11:03', '2021-12-11 13:41:36'),
(203, 'Somalia', 'SOM', 'SO', '706', '252', 'Mogadishu', 'SOS', 'Somali shilling', 'Sh.so.', '.so', 'Soomaaliya', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Mogadishu\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"소말리아\",\"br\":\"Somália\",\"pt\":\"Somália\",\"nl\":\"Somalië\",\"hr\":\"Somalija\",\"fa\":\"سومالی\",\"de\":\"Somalia\",\"es\":\"Somalia\",\"fr\":\"Somalie\",\"ja\":\"ソマリア\",\"it\":\"Somalia\",\"cn\":\"索马里\"}', 10.00000000, 49.00000000, '??', 'U+1F1F8 U+1F1F4', 1, 'Q1045', '2018-07-20 20:11:03', '2021-12-11 13:41:41'),
(204, 'South Africa', 'ZAF', 'ZA', '710', '27', 'Pretoria', 'ZAR', 'South African rand', 'R', '.za', 'South Africa', 'Africa', 'Southern Africa', '[{\"zoneName\":\"Africa/Johannesburg\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"SAST\",\"tzName\":\"South African Standard Time\"}]', '{\"kr\":\"남아프리카 공화국\",\"br\":\"República Sul-Africana\",\"pt\":\"República Sul-Africana\",\"nl\":\"Zuid-Afrika\",\"hr\":\"Južnoafrička Republika\",\"fa\":\"آفریقای جنوبی\",\"de\":\"Republik Südafrika\",\"es\":\"República de Sudáfrica\",\"fr\":\"Afrique du Sud\",\"ja\":\"南アフリカ\",\"it\":\"Sud Africa\",\"cn\":\"南非\"}', -29.00000000, 24.00000000, '??', 'U+1F1FF U+1F1E6', 1, 'Q258', '2018-07-20 20:11:03', '2021-12-11 13:41:49'),
(205, 'South Georgia', 'SGS', 'GS', '239', '500', 'Grytviken', 'GBP', 'British pound', '£', '.gs', 'South Georgia', 'Americas', 'South America', '[{\"zoneName\":\"Atlantic/South_Georgia\",\"gmtOffset\":-7200,\"gmtOffsetName\":\"UTC-02:00\",\"abbreviation\":\"GST\",\"tzName\":\"South Georgia and the South Sandwich Islands Time\"}]', '{\"kr\":\"사우스조지아\",\"br\":\"Ilhas Geórgias do Sul e Sandwich do Sul\",\"pt\":\"Ilhas Geórgia do Sul e Sanduíche do Sul\",\"nl\":\"Zuid-Georgia en Zuidelijke Sandwicheilanden\",\"hr\":\"Južna Georgija i otočje Južni Sandwich\",\"fa\":\"جزایر جورجیای جنوبی و ساندویچ جنوبی\",\"de\":\"Südgeorgien und die Südlichen Sandwichinseln\",\"es\":\"Islas Georgias del Sur y Sandwich del Sur\",\"fr\":\"Géorgie du Sud-et-les Îles Sandwich du Sud\",\"ja\":\"サウスジョージア・サウスサンドウィッチ諸島\",\"it\":\"Georgia del Sud e Isole Sandwich Meridionali\",\"cn\":\"南乔治亚\"}', -54.50000000, -37.00000000, '??', 'U+1F1EC U+1F1F8', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:36:45'),
(206, 'South Sudan', 'SSD', 'SS', '728', '211', 'Juba', 'SSP', 'South Sudanese pound', '£', '.ss', 'South Sudan', 'Africa', 'Middle Africa', '[{\"zoneName\":\"Africa/Juba\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"남수단\",\"br\":\"Sudão do Sul\",\"pt\":\"Sudão do Sul\",\"nl\":\"Zuid-Soedan\",\"hr\":\"Južni Sudan\",\"fa\":\"سودان جنوبی\",\"de\":\"Südsudan\",\"es\":\"Sudán del Sur\",\"fr\":\"Soudan du Sud\",\"ja\":\"南スーダン\",\"it\":\"Sudan del sud\",\"cn\":\"南苏丹\"}', 7.00000000, 30.00000000, '??', 'U+1F1F8 U+1F1F8', 1, 'Q958', '2018-07-20 20:11:03', '2021-12-11 13:42:25'),
(207, 'Spain', 'ESP', 'ES', '724', '34', 'Madrid', 'EUR', 'Euro', '€', '.es', 'España', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Africa/Ceuta\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"},{\"zoneName\":\"Atlantic/Canary\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"WET\",\"tzName\":\"Western European Time\"},{\"zoneName\":\"Europe/Madrid\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"스페인\",\"br\":\"Espanha\",\"pt\":\"Espanha\",\"nl\":\"Spanje\",\"hr\":\"Španjolska\",\"fa\":\"اسپانیا\",\"de\":\"Spanien\",\"es\":\"España\",\"fr\":\"Espagne\",\"ja\":\"スペイン\",\"it\":\"Spagna\",\"cn\":\"西班牙\"}', 40.00000000, -4.00000000, '??', 'U+1F1EA U+1F1F8', 1, 'Q29', '2018-07-20 20:11:03', '2021-12-11 13:32:30'),
(208, 'Sri Lanka', 'LKA', 'LK', '144', '94', 'Colombo', 'LKR', 'Sri Lankan rupee', 'Rs', '.lk', 'śrī laṃkāva', 'Asia', 'Southern Asia', '[{\"zoneName\":\"Asia/Colombo\",\"gmtOffset\":19800,\"gmtOffsetName\":\"UTC+05:30\",\"abbreviation\":\"IST\",\"tzName\":\"Indian Standard Time\"}]', '{\"kr\":\"스리랑카\",\"br\":\"Sri Lanka\",\"pt\":\"Sri Lanka\",\"nl\":\"Sri Lanka\",\"hr\":\"Šri Lanka\",\"fa\":\"سری‌لانکا\",\"de\":\"Sri Lanka\",\"es\":\"Sri Lanka\",\"fr\":\"Sri Lanka\",\"ja\":\"スリランカ\",\"it\":\"Sri Lanka\",\"cn\":\"斯里兰卡\"}', 7.00000000, 81.00000000, '??', 'U+1F1F1 U+1F1F0', 1, 'Q854', '2018-07-20 20:11:03', '2021-12-11 13:42:30'),
(209, 'Sudan', 'SDN', 'SD', '729', '249', 'Khartoum', 'SDG', 'Sudanese pound', '.س.ج', '.sd', 'السودان', 'Africa', 'Northern Africa', '[{\"zoneName\":\"Africa/Khartoum\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EAT\",\"tzName\":\"Eastern African Time\"}]', '{\"kr\":\"수단\",\"br\":\"Sudão\",\"pt\":\"Sudão\",\"nl\":\"Soedan\",\"hr\":\"Sudan\",\"fa\":\"سودان\",\"de\":\"Sudan\",\"es\":\"Sudán\",\"fr\":\"Soudan\",\"ja\":\"スーダン\",\"it\":\"Sudan\",\"cn\":\"苏丹\"}', 15.00000000, 30.00000000, '??', 'U+1F1F8 U+1F1E9', 1, 'Q1049', '2018-07-20 20:11:03', '2021-12-11 13:42:35'),
(210, 'Suriname', 'SUR', 'SR', '740', '597', 'Paramaribo', 'SRD', 'Surinamese dollar', '$', '.sr', 'Suriname', 'Americas', 'South America', '[{\"zoneName\":\"America/Paramaribo\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"SRT\",\"tzName\":\"Suriname Time\"}]', '{\"kr\":\"수리남\",\"br\":\"Suriname\",\"pt\":\"Suriname\",\"nl\":\"Suriname\",\"hr\":\"Surinam\",\"fa\":\"سورینام\",\"de\":\"Suriname\",\"es\":\"Surinam\",\"fr\":\"Surinam\",\"ja\":\"スリナム\",\"it\":\"Suriname\",\"cn\":\"苏里南\"}', 4.00000000, -56.00000000, '??', 'U+1F1F8 U+1F1F7', 1, 'Q730', '2018-07-20 20:11:03', '2021-12-11 13:42:40'),
(211, 'Svalbard And Jan Mayen Islands', 'SJM', 'SJ', '744', '47', 'Longyearbyen', 'NOK', 'Norwegian Krone', 'kr', '.sj', 'Svalbard og Jan Mayen', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Arctic/Longyearbyen\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"스발바르 얀마옌 제도\",\"br\":\"Svalbard\",\"pt\":\"Svalbard\",\"nl\":\"Svalbard en Jan Mayen\",\"hr\":\"Svalbard i Jan Mayen\",\"fa\":\"سوالبارد و یان ماین\",\"de\":\"Svalbard und Jan Mayen\",\"es\":\"Islas Svalbard y Jan Mayen\",\"fr\":\"Svalbard et Jan Mayen\",\"ja\":\"スヴァールバル諸島およびヤンマイエン島\",\"it\":\"Svalbard e Jan Mayen\",\"cn\":\"斯瓦尔巴和扬马延群岛\"}', 78.00000000, 20.00000000, '??', 'U+1F1F8 U+1F1EF', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:42:54'),
(212, 'Swaziland', 'SWZ', 'SZ', '748', '268', 'Mbabane', 'SZL', 'Lilangeni', 'E', '.sz', 'Swaziland', 'Africa', 'Southern Africa', '[{\"zoneName\":\"Africa/Mbabane\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"SAST\",\"tzName\":\"South African Standard Time\"}]', '{\"kr\":\"에스와티니\",\"br\":\"Suazilândia\",\"pt\":\"Suazilândia\",\"nl\":\"Swaziland\",\"hr\":\"Svazi\",\"fa\":\"سوازیلند\",\"de\":\"Swasiland\",\"es\":\"Suazilandia\",\"fr\":\"Swaziland\",\"ja\":\"スワジランド\",\"it\":\"Swaziland\",\"cn\":\"斯威士兰\"}', -26.50000000, 31.50000000, '??', 'U+1F1F8 U+1F1FF', 1, 'Q1050', '2018-07-20 20:11:03', '2021-12-11 13:43:12'),
(213, 'Sweden', 'SWE', 'SE', '752', '46', 'Stockholm', 'SEK', 'Swedish krona', 'kr', '.se', 'Sverige', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/Stockholm\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"스웨덴\",\"br\":\"Suécia\",\"pt\":\"Suécia\",\"nl\":\"Zweden\",\"hr\":\"Švedska\",\"fa\":\"سوئد\",\"de\":\"Schweden\",\"es\":\"Suecia\",\"fr\":\"Suède\",\"ja\":\"スウェーデン\",\"it\":\"Svezia\",\"cn\":\"瑞典\"}', 62.00000000, 15.00000000, '??', 'U+1F1F8 U+1F1EA', 1, 'Q34', '2018-07-20 20:11:03', '2021-12-11 13:43:24'),
(214, 'Switzerland', 'CHE', 'CH', '756', '41', 'Bern', 'CHF', 'Swiss franc', 'CHf', '.ch', 'Schweiz', 'Europe', 'Western Europe', '[{\"zoneName\":\"Europe/Zurich\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"스위스\",\"br\":\"Suíça\",\"pt\":\"Suíça\",\"nl\":\"Zwitserland\",\"hr\":\"Švicarska\",\"fa\":\"سوئیس\",\"de\":\"Schweiz\",\"es\":\"Suiza\",\"fr\":\"Suisse\",\"ja\":\"スイス\",\"it\":\"Svizzera\",\"cn\":\"瑞士\"}', 47.00000000, 8.00000000, '??', 'U+1F1E8 U+1F1ED', 1, 'Q39', '2018-07-20 20:11:03', '2021-12-11 13:43:31'),
(215, 'Syria', 'SYR', 'SY', '760', '963', 'Damascus', 'SYP', 'Syrian pound', 'LS', '.sy', 'سوريا', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Damascus\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"시리아\",\"br\":\"Síria\",\"pt\":\"Síria\",\"nl\":\"Syrië\",\"hr\":\"Sirija\",\"fa\":\"سوریه\",\"de\":\"Syrien\",\"es\":\"Siria\",\"fr\":\"Syrie\",\"ja\":\"シリア・アラブ共和国\",\"it\":\"Siria\",\"cn\":\"叙利亚\"}', 35.00000000, 38.00000000, '??', 'U+1F1F8 U+1F1FE', 1, 'Q858', '2018-07-20 20:11:03', '2021-12-11 13:43:36'),
(216, 'Taiwan', 'TWN', 'TW', '158', '886', 'Taipei', 'TWD', 'New Taiwan dollar', '$', '.tw', '臺灣', 'Asia', 'Eastern Asia', '[{\"zoneName\":\"Asia/Taipei\",\"gmtOffset\":28800,\"gmtOffsetName\":\"UTC+08:00\",\"abbreviation\":\"CST\",\"tzName\":\"China Standard Time\"}]', '{\"kr\":\"대만\",\"br\":\"Taiwan\",\"pt\":\"Taiwan\",\"nl\":\"Taiwan\",\"hr\":\"Tajvan\",\"fa\":\"تایوان\",\"de\":\"Taiwan\",\"es\":\"Taiwán\",\"fr\":\"Taïwan\",\"ja\":\"台湾（中華民国）\",\"it\":\"Taiwan\",\"cn\":\"中国台湾\"}', 23.50000000, 121.00000000, '??', 'U+1F1F9 U+1F1FC', 1, 'Q865', '2018-07-20 20:11:03', '2021-12-11 13:43:41'),
(217, 'Tajikistan', 'TJK', 'TJ', '762', '992', 'Dushanbe', 'TJS', 'Tajikistani somoni', 'SM', '.tj', 'Тоҷикистон', 'Asia', 'Central Asia', '[{\"zoneName\":\"Asia/Dushanbe\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"TJT\",\"tzName\":\"Tajikistan Time\"}]', '{\"kr\":\"타지키스탄\",\"br\":\"Tajiquistão\",\"pt\":\"Tajiquistão\",\"nl\":\"Tadzjikistan\",\"hr\":\"Tađikistan\",\"fa\":\"تاجیکستان\",\"de\":\"Tadschikistan\",\"es\":\"Tayikistán\",\"fr\":\"Tadjikistan\",\"ja\":\"タジキスタン\",\"it\":\"Tagikistan\",\"cn\":\"塔吉克斯坦\"}', 39.00000000, 71.00000000, '??', 'U+1F1F9 U+1F1EF', 1, 'Q863', '2018-07-20 20:11:03', '2021-12-11 13:43:46'),
(218, 'Tanzania', 'TZA', 'TZ', '834', '255', 'Dodoma', 'TZS', 'Tanzanian shilling', 'TSh', '.tz', 'Tanzania', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Dar_es_Salaam\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"탄자니아\",\"br\":\"Tanzânia\",\"pt\":\"Tanzânia\",\"nl\":\"Tanzania\",\"hr\":\"Tanzanija\",\"fa\":\"تانزانیا\",\"de\":\"Tansania\",\"es\":\"Tanzania\",\"fr\":\"Tanzanie\",\"ja\":\"タンザニア\",\"it\":\"Tanzania\",\"cn\":\"坦桑尼亚\"}', -6.00000000, 35.00000000, '??', 'U+1F1F9 U+1F1FF', 1, 'Q924', '2018-07-20 20:11:03', '2021-12-11 13:43:57'),
(219, 'Thailand', 'THA', 'TH', '764', '66', 'Bangkok', 'THB', 'Thai baht', '฿', '.th', 'ประเทศไทย', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Bangkok\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"ICT\",\"tzName\":\"Indochina Time\"}]', '{\"kr\":\"태국\",\"br\":\"Tailândia\",\"pt\":\"Tailândia\",\"nl\":\"Thailand\",\"hr\":\"Tajland\",\"fa\":\"تایلند\",\"de\":\"Thailand\",\"es\":\"Tailandia\",\"fr\":\"Thaïlande\",\"ja\":\"タイ\",\"it\":\"Tailandia\",\"cn\":\"泰国\"}', 15.00000000, 100.00000000, '??', 'U+1F1F9 U+1F1ED', 1, 'Q869', '2018-07-20 20:11:03', '2021-12-11 13:44:06'),
(220, 'Togo', 'TGO', 'TG', '768', '228', 'Lome', 'XOF', 'West African CFA franc', 'CFA', '.tg', 'Togo', 'Africa', 'Western Africa', '[{\"zoneName\":\"Africa/Lome\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"토고\",\"br\":\"Togo\",\"pt\":\"Togo\",\"nl\":\"Togo\",\"hr\":\"Togo\",\"fa\":\"توگو\",\"de\":\"Togo\",\"es\":\"Togo\",\"fr\":\"Togo\",\"ja\":\"トーゴ\",\"it\":\"Togo\",\"cn\":\"多哥\"}', 8.00000000, 1.16666666, '??', 'U+1F1F9 U+1F1EC', 1, 'Q945', '2018-07-20 20:11:03', '2021-12-11 13:44:14'),
(221, 'Tokelau', 'TKL', 'TK', '772', '690', '', 'NZD', 'New Zealand dollar', '$', '.tk', 'Tokelau', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Fakaofo\",\"gmtOffset\":46800,\"gmtOffsetName\":\"UTC+13:00\",\"abbreviation\":\"TKT\",\"tzName\":\"Tokelau Time\"}]', '{\"kr\":\"토켈라우\",\"br\":\"Tokelau\",\"pt\":\"Toquelau\",\"nl\":\"Tokelau\",\"hr\":\"Tokelau\",\"fa\":\"توکلائو\",\"de\":\"Tokelau\",\"es\":\"Islas Tokelau\",\"fr\":\"Tokelau\",\"ja\":\"トケラウ\",\"it\":\"Isole Tokelau\",\"cn\":\"托克劳\"}', -9.00000000, -172.00000000, '??', 'U+1F1F9 U+1F1F0', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:44:33'),
(222, 'Tonga', 'TON', 'TO', '776', '676', 'Nuku\'alofa', 'TOP', 'Tongan paʻanga', '$', '.to', 'Tonga', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Tongatapu\",\"gmtOffset\":46800,\"gmtOffsetName\":\"UTC+13:00\",\"abbreviation\":\"TOT\",\"tzName\":\"Tonga Time\"}]', '{\"kr\":\"통가\",\"br\":\"Tonga\",\"pt\":\"Tonga\",\"nl\":\"Tonga\",\"hr\":\"Tonga\",\"fa\":\"تونگا\",\"de\":\"Tonga\",\"es\":\"Tonga\",\"fr\":\"Tonga\",\"ja\":\"トンガ\",\"it\":\"Tonga\",\"cn\":\"汤加\"}', -20.00000000, -175.00000000, '??', 'U+1F1F9 U+1F1F4', 1, 'Q678', '2018-07-20 20:11:03', '2021-12-11 13:44:44'),
(223, 'Trinidad And Tobago', 'TTO', 'TT', '780', '+1-868', 'Port of Spain', 'TTD', 'Trinidad and Tobago dollar', '$', '.tt', 'Trinidad and Tobago', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Port_of_Spain\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"트리니다드 토바고\",\"br\":\"Trinidad e Tobago\",\"pt\":\"Trindade e Tobago\",\"nl\":\"Trinidad en Tobago\",\"hr\":\"Trinidad i Tobago\",\"fa\":\"ترینیداد و توباگو\",\"de\":\"Trinidad und Tobago\",\"es\":\"Trinidad y Tobago\",\"fr\":\"Trinité et Tobago\",\"ja\":\"トリニダード・トバゴ\",\"it\":\"Trinidad e Tobago\",\"cn\":\"特立尼达和多巴哥\"}', 11.00000000, -61.00000000, '??', 'U+1F1F9 U+1F1F9', 1, 'Q754', '2018-07-20 20:11:03', '2021-12-11 13:44:51'),
(224, 'Tunisia', 'TUN', 'TN', '788', '216', 'Tunis', 'TND', 'Tunisian dinar', 'ت.د', '.tn', 'تونس', 'Africa', 'Northern Africa', '[{\"zoneName\":\"Africa/Tunis\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"튀니지\",\"br\":\"Tunísia\",\"pt\":\"Tunísia\",\"nl\":\"Tunesië\",\"hr\":\"Tunis\",\"fa\":\"تونس\",\"de\":\"Tunesien\",\"es\":\"Túnez\",\"fr\":\"Tunisie\",\"ja\":\"チュニジア\",\"it\":\"Tunisia\",\"cn\":\"突尼斯\"}', 34.00000000, 9.00000000, '??', 'U+1F1F9 U+1F1F3', 1, 'Q948', '2018-07-20 20:11:03', '2021-12-11 13:45:00'),
(225, 'Turkey', 'TUR', 'TR', '792', '90', 'Ankara', 'TRY', 'Turkish lira', '₺', '.tr', 'Türkiye', 'Asia', 'Western Asia', '[{\"zoneName\":\"Europe/Istanbul\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"터키\",\"br\":\"Turquia\",\"pt\":\"Turquia\",\"nl\":\"Turkije\",\"hr\":\"Turska\",\"fa\":\"ترکیه\",\"de\":\"Türkei\",\"es\":\"Turquía\",\"fr\":\"Turquie\",\"ja\":\"トルコ\",\"it\":\"Turchia\",\"cn\":\"土耳其\"}', 39.00000000, 35.00000000, '??', 'U+1F1F9 U+1F1F7', 1, 'Q43', '2018-07-20 20:11:03', '2021-12-11 13:45:05'),
(226, 'Turkmenistan', 'TKM', 'TM', '795', '993', 'Ashgabat', 'TMT', 'Turkmenistan manat', 'T', '.tm', 'Türkmenistan', 'Asia', 'Central Asia', '[{\"zoneName\":\"Asia/Ashgabat\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"TMT\",\"tzName\":\"Turkmenistan Time\"}]', '{\"kr\":\"투르크메니스탄\",\"br\":\"Turcomenistão\",\"pt\":\"Turquemenistão\",\"nl\":\"Turkmenistan\",\"hr\":\"Turkmenistan\",\"fa\":\"ترکمنستان\",\"de\":\"Turkmenistan\",\"es\":\"Turkmenistán\",\"fr\":\"Turkménistan\",\"ja\":\"トルクメニスタン\",\"it\":\"Turkmenistan\",\"cn\":\"土库曼斯坦\"}', 40.00000000, 60.00000000, '??', 'U+1F1F9 U+1F1F2', 1, 'Q874', '2018-07-20 20:11:03', '2021-12-11 13:45:10'),
(227, 'Turks And Caicos Islands', 'TCA', 'TC', '796', '+1-649', 'Cockburn Town', 'USD', 'United States dollar', '$', '.tc', 'Turks and Caicos Islands', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Grand_Turk\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"}]', '{\"kr\":\"터크스 케이커스 제도\",\"br\":\"Ilhas Turcas e Caicos\",\"pt\":\"Ilhas Turcas e Caicos\",\"nl\":\"Turks- en Caicoseilanden\",\"hr\":\"Otoci Turks i Caicos\",\"fa\":\"جزایر تورکس و کایکوس\",\"de\":\"Turks- und Caicosinseln\",\"es\":\"Islas Turks y Caicos\",\"fr\":\"Îles Turques-et-Caïques\",\"ja\":\"タークス・カイコス諸島\",\"it\":\"Isole Turks e Caicos\",\"cn\":\"特克斯和凯科斯群岛\"}', 21.75000000, -71.58333333, '??', 'U+1F1F9 U+1F1E8', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:36:26'),
(228, 'Tuvalu', 'TUV', 'TV', '798', '688', 'Funafuti', 'AUD', 'Australian dollar', '$', '.tv', 'Tuvalu', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Funafuti\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"TVT\",\"tzName\":\"Tuvalu Time\"}]', '{\"kr\":\"투발루\",\"br\":\"Tuvalu\",\"pt\":\"Tuvalu\",\"nl\":\"Tuvalu\",\"hr\":\"Tuvalu\",\"fa\":\"تووالو\",\"de\":\"Tuvalu\",\"es\":\"Tuvalu\",\"fr\":\"Tuvalu\",\"ja\":\"ツバル\",\"it\":\"Tuvalu\",\"cn\":\"图瓦卢\"}', -8.00000000, 178.00000000, '??', 'U+1F1F9 U+1F1FB', 1, 'Q672', '2018-07-20 20:11:03', '2021-12-11 13:37:37'),
(229, 'Uganda', 'UGA', 'UG', '800', '256', 'Kampala', 'UGX', 'Ugandan shilling', 'USh', '.ug', 'Uganda', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Kampala\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"EAT\",\"tzName\":\"East Africa Time\"}]', '{\"kr\":\"우간다\",\"br\":\"Uganda\",\"pt\":\"Uganda\",\"nl\":\"Oeganda\",\"hr\":\"Uganda\",\"fa\":\"اوگاندا\",\"de\":\"Uganda\",\"es\":\"Uganda\",\"fr\":\"Uganda\",\"ja\":\"ウガンダ\",\"it\":\"Uganda\",\"cn\":\"乌干达\"}', 1.00000000, 32.00000000, '??', 'U+1F1FA U+1F1EC', 1, 'Q1036', '2018-07-20 20:11:03', '2021-12-11 13:45:17'),
(230, 'Ukraine', 'UKR', 'UA', '804', '380', 'Kiev', 'UAH', 'Ukrainian hryvnia', '₴', '.ua', 'Україна', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Kiev\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"},{\"zoneName\":\"Europe/Simferopol\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"MSK\",\"tzName\":\"Moscow Time\"},{\"zoneName\":\"Europe/Uzhgorod\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"},{\"zoneName\":\"Europe/Zaporozhye\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"EET\",\"tzName\":\"Eastern European Time\"}]', '{\"kr\":\"우크라이나\",\"br\":\"Ucrânia\",\"pt\":\"Ucrânia\",\"nl\":\"Oekraïne\",\"hr\":\"Ukrajina\",\"fa\":\"وکراین\",\"de\":\"Ukraine\",\"es\":\"Ucrania\",\"fr\":\"Ukraine\",\"ja\":\"ウクライナ\",\"it\":\"Ucraina\",\"cn\":\"乌克兰\"}', 49.00000000, 32.00000000, '??', 'U+1F1FA U+1F1E6', 1, 'Q212', '2018-07-20 20:11:03', '2021-12-11 13:45:22'),
(231, 'United Arab Emirates', 'ARE', 'AE', '784', '971', 'Abu Dhabi', 'AED', 'United Arab Emirates dirham', 'إ.د', '.ae', 'دولة الإمارات العربية المتحدة', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Dubai\",\"gmtOffset\":14400,\"gmtOffsetName\":\"UTC+04:00\",\"abbreviation\":\"GST\",\"tzName\":\"Gulf Standard Time\"}]', '{\"kr\":\"아랍에미리트\",\"br\":\"Emirados árabes Unidos\",\"pt\":\"Emirados árabes Unidos\",\"nl\":\"Verenigde Arabische Emiraten\",\"hr\":\"Ujedinjeni Arapski Emirati\",\"fa\":\"امارات متحده عربی\",\"de\":\"Vereinigte Arabische Emirate\",\"es\":\"Emiratos Árabes Unidos\",\"fr\":\"Émirats arabes unis\",\"ja\":\"アラブ首長国連邦\",\"it\":\"Emirati Arabi Uniti\",\"cn\":\"阿拉伯联合酋长国\"}', 24.00000000, 54.00000000, '??', 'U+1F1E6 U+1F1EA', 1, 'Q878', '2018-07-20 20:11:03', '2021-12-11 13:45:29'),
(232, 'United Kingdom', 'GBR', 'GB', '826', '44', 'London', 'GBP', 'British pound', '£', '.uk', 'United Kingdom', 'Europe', 'Northern Europe', '[{\"zoneName\":\"Europe/London\",\"gmtOffset\":0,\"gmtOffsetName\":\"UTC±00\",\"abbreviation\":\"GMT\",\"tzName\":\"Greenwich Mean Time\"}]', '{\"kr\":\"영국\",\"br\":\"Reino Unido\",\"pt\":\"Reino Unido\",\"nl\":\"Verenigd Koninkrijk\",\"hr\":\"Ujedinjeno Kraljevstvo\",\"fa\":\"بریتانیای کبیر و ایرلند شمالی\",\"de\":\"Vereinigtes Königreich\",\"es\":\"Reino Unido\",\"fr\":\"Royaume-Uni\",\"ja\":\"イギリス\",\"it\":\"Regno Unito\",\"cn\":\"英国\"}', 54.00000000, -2.00000000, '??', 'U+1F1EC U+1F1E7', 1, 'Q145', '2018-07-20 20:11:03', '2021-12-11 13:37:13'),
(233, 'United States', 'USA', 'US', '840', '1', 'Washington', 'USD', 'United States dollar', '$', '.us', 'United States', 'Americas', 'Northern America', '[{\"zoneName\":\"America/Adak\",\"gmtOffset\":-36000,\"gmtOffsetName\":\"UTC-10:00\",\"abbreviation\":\"HST\",\"tzName\":\"Hawaii–Aleutian Standard Time\"},{\"zoneName\":\"America/Anchorage\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"AKST\",\"tzName\":\"Alaska Standard Time\"},{\"zoneName\":\"America/Boise\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Chicago\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Denver\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Detroit\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Indianapolis\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Knox\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Marengo\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Petersburg\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Tell_City\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Vevay\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Vincennes\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Indiana/Winamac\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Juneau\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"AKST\",\"tzName\":\"Alaska Standard Time\"},{\"zoneName\":\"America/Kentucky/Louisville\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Kentucky/Monticello\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Los_Angeles\",\"gmtOffset\":-28800,\"gmtOffsetName\":\"UTC-08:00\",\"abbreviation\":\"PST\",\"tzName\":\"Pacific Standard Time (North America\"},{\"zoneName\":\"America/Menominee\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Metlakatla\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"AKST\",\"tzName\":\"Alaska Standard Time\"},{\"zoneName\":\"America/New_York\",\"gmtOffset\":-18000,\"gmtOffsetName\":\"UTC-05:00\",\"abbreviation\":\"EST\",\"tzName\":\"Eastern Standard Time (North America\"},{\"zoneName\":\"America/Nome\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"AKST\",\"tzName\":\"Alaska Standard Time\"},{\"zoneName\":\"America/North_Dakota/Beulah\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/North_Dakota/Center\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/North_Dakota/New_Salem\",\"gmtOffset\":-21600,\"gmtOffsetName\":\"UTC-06:00\",\"abbreviation\":\"CST\",\"tzName\":\"Central Standard Time (North America\"},{\"zoneName\":\"America/Phoenix\",\"gmtOffset\":-25200,\"gmtOffsetName\":\"UTC-07:00\",\"abbreviation\":\"MST\",\"tzName\":\"Mountain Standard Time (North America\"},{\"zoneName\":\"America/Sitka\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"AKST\",\"tzName\":\"Alaska Standard Time\"},{\"zoneName\":\"America/Yakutat\",\"gmtOffset\":-32400,\"gmtOffsetName\":\"UTC-09:00\",\"abbreviation\":\"AKST\",\"tzName\":\"Alaska Standard Time\"},{\"zoneName\":\"Pacific/Honolulu\",\"gmtOffset\":-36000,\"gmtOffsetName\":\"UTC-10:00\",\"abbreviation\":\"HST\",\"tzName\":\"Hawaii–Aleutian Standard Time\"}]', '{\"kr\":\"미국\",\"br\":\"Estados Unidos\",\"pt\":\"Estados Unidos\",\"nl\":\"Verenigde Staten\",\"hr\":\"Sjedinjene Američke Države\",\"fa\":\"ایالات متحده آمریکا\",\"de\":\"Vereinigte Staaten von Amerika\",\"es\":\"Estados Unidos\",\"fr\":\"États-Unis\",\"ja\":\"アメリカ合衆国\",\"it\":\"Stati Uniti D\'America\",\"cn\":\"美国\"}', 38.00000000, -97.00000000, '??', 'U+1F1FA U+1F1F8', 1, 'Q30', '2018-07-20 20:11:03', '2021-12-11 13:36:28'),
(234, 'United States Minor Outlying Islands', 'UMI', 'UM', '581', '1', '', 'USD', 'United States dollar', '$', '.us', 'United States Minor Outlying Islands', 'Americas', 'Northern America', '[{\"zoneName\":\"Pacific/Midway\",\"gmtOffset\":-39600,\"gmtOffsetName\":\"UTC-11:00\",\"abbreviation\":\"SST\",\"tzName\":\"Samoa Standard Time\"},{\"zoneName\":\"Pacific/Wake\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"WAKT\",\"tzName\":\"Wake Island Time\"}]', '{\"kr\":\"미국령 군소 제도\",\"br\":\"Ilhas Menores Distantes dos Estados Unidos\",\"pt\":\"Ilhas Menores Distantes dos Estados Unidos\",\"nl\":\"Kleine afgelegen eilanden van de Verenigde Staten\",\"hr\":\"Mali udaljeni otoci SAD-a\",\"fa\":\"جزایر کوچک حاشیه‌ای ایالات متحده آمریکا\",\"de\":\"Kleinere Inselbesitzungen der Vereinigten Staaten\",\"es\":\"Islas Ultramarinas Menores de Estados Unidos\",\"fr\":\"Îles mineures éloignées des États-Unis\",\"ja\":\"合衆国領有小離島\",\"it\":\"Isole minori esterne degli Stati Uniti d\'America\",\"cn\":\"美国本土外小岛屿\"}', 0.00000000, 0.00000000, '??', 'U+1F1FA U+1F1F2', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:36:30'),
(235, 'Uruguay', 'URY', 'UY', '858', '598', 'Montevideo', 'UYU', 'Uruguayan peso', '$', '.uy', 'Uruguay', 'Americas', 'South America', '[{\"zoneName\":\"America/Montevideo\",\"gmtOffset\":-10800,\"gmtOffsetName\":\"UTC-03:00\",\"abbreviation\":\"UYT\",\"tzName\":\"Uruguay Standard Time\"}]', '{\"kr\":\"우루과이\",\"br\":\"Uruguai\",\"pt\":\"Uruguai\",\"nl\":\"Uruguay\",\"hr\":\"Urugvaj\",\"fa\":\"اروگوئه\",\"de\":\"Uruguay\",\"es\":\"Uruguay\",\"fr\":\"Uruguay\",\"ja\":\"ウルグアイ\",\"it\":\"Uruguay\",\"cn\":\"乌拉圭\"}', -33.00000000, -56.00000000, '??', 'U+1F1FA U+1F1FE', 1, 'Q77', '2018-07-20 20:11:03', '2021-12-11 13:45:36'),
(236, 'Uzbekistan', 'UZB', 'UZ', '860', '998', 'Tashkent', 'UZS', 'Uzbekistani soʻm', 'лв', '.uz', 'O‘zbekiston', 'Asia', 'Central Asia', '[{\"zoneName\":\"Asia/Samarkand\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"UZT\",\"tzName\":\"Uzbekistan Time\"},{\"zoneName\":\"Asia/Tashkent\",\"gmtOffset\":18000,\"gmtOffsetName\":\"UTC+05:00\",\"abbreviation\":\"UZT\",\"tzName\":\"Uzbekistan Time\"}]', '{\"kr\":\"우즈베키스탄\",\"br\":\"Uzbequistão\",\"pt\":\"Usbequistão\",\"nl\":\"Oezbekistan\",\"hr\":\"Uzbekistan\",\"fa\":\"ازبکستان\",\"de\":\"Usbekistan\",\"es\":\"Uzbekistán\",\"fr\":\"Ouzbékistan\",\"ja\":\"ウズベキスタン\",\"it\":\"Uzbekistan\",\"cn\":\"乌兹别克斯坦\"}', 41.00000000, 64.00000000, '??', 'U+1F1FA U+1F1FF', 1, 'Q265', '2018-07-20 20:11:03', '2021-12-11 13:45:40'),
(237, 'Vanuatu', 'VUT', 'VU', '548', '678', 'Port Vila', 'VUV', 'Vanuatu vatu', 'VT', '.vu', 'Vanuatu', 'Oceania', 'Melanesia', '[{\"zoneName\":\"Pacific/Efate\",\"gmtOffset\":39600,\"gmtOffsetName\":\"UTC+11:00\",\"abbreviation\":\"VUT\",\"tzName\":\"Vanuatu Time\"}]', '{\"kr\":\"바누아투\",\"br\":\"Vanuatu\",\"pt\":\"Vanuatu\",\"nl\":\"Vanuatu\",\"hr\":\"Vanuatu\",\"fa\":\"وانواتو\",\"de\":\"Vanuatu\",\"es\":\"Vanuatu\",\"fr\":\"Vanuatu\",\"ja\":\"バヌアツ\",\"it\":\"Vanuatu\",\"cn\":\"瓦努阿图\"}', -16.00000000, 167.00000000, '??', 'U+1F1FB U+1F1FA', 1, 'Q686', '2018-07-20 20:11:03', '2021-12-11 13:45:47'),
(238, 'Vatican City State (Holy See)', 'VAT', 'VA', '336', '379', 'Vatican City', 'EUR', 'Euro', '€', '.va', 'Vaticano', 'Europe', 'Southern Europe', '[{\"zoneName\":\"Europe/Vatican\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"바티칸 시국\",\"br\":\"Vaticano\",\"pt\":\"Vaticano\",\"nl\":\"Heilige Stoel\",\"hr\":\"Sveta Stolica\",\"fa\":\"سریر مقدس\",\"de\":\"Heiliger Stuhl\",\"es\":\"Santa Sede\",\"fr\":\"voir Saint\",\"ja\":\"聖座\",\"it\":\"Santa Sede\",\"cn\":\"梵蒂冈\"}', 41.90000000, 12.45000000, '??', 'U+1F1FB U+1F1E6', 1, 'Q237', '2018-07-20 20:11:03', '2021-12-11 13:32:24'),
(239, 'Venezuela', 'VEN', 'VE', '862', '58', 'Caracas', 'VEF', 'Bolívar', 'Bs', '.ve', 'Venezuela', 'Americas', 'South America', '[{\"zoneName\":\"America/Caracas\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"VET\",\"tzName\":\"Venezuelan Standard Time\"}]', '{\"kr\":\"베네수엘라\",\"br\":\"Venezuela\",\"pt\":\"Venezuela\",\"nl\":\"Venezuela\",\"hr\":\"Venezuela\",\"fa\":\"ونزوئلا\",\"de\":\"Venezuela\",\"es\":\"Venezuela\",\"fr\":\"Venezuela\",\"ja\":\"ベネズエラ・ボリバル共和国\",\"it\":\"Venezuela\",\"cn\":\"委内瑞拉\"}', 8.00000000, -66.00000000, '??', 'U+1F1FB U+1F1EA', 1, 'Q717', '2018-07-20 20:11:03', '2021-12-11 13:46:04'),
(240, 'Vietnam', 'VNM', 'VN', '704', '84', 'Hanoi', 'VND', 'Vietnamese đồng', '₫', '.vn', 'Việt Nam', 'Asia', 'South-Eastern Asia', '[{\"zoneName\":\"Asia/Ho_Chi_Minh\",\"gmtOffset\":25200,\"gmtOffsetName\":\"UTC+07:00\",\"abbreviation\":\"ICT\",\"tzName\":\"Indochina Time\"}]', '{\"kr\":\"베트남\",\"br\":\"Vietnã\",\"pt\":\"Vietname\",\"nl\":\"Vietnam\",\"hr\":\"Vijetnam\",\"fa\":\"ویتنام\",\"de\":\"Vietnam\",\"es\":\"Vietnam\",\"fr\":\"Viêt Nam\",\"ja\":\"ベトナム\",\"it\":\"Vietnam\",\"cn\":\"越南\"}', 16.16666666, 107.83333333, '??', 'U+1F1FB U+1F1F3', 1, 'Q881', '2018-07-20 20:11:03', '2021-12-11 13:46:14'),
(241, 'Virgin Islands (British)', 'VGB', 'VG', '092', '+1-284', 'Road Town', 'USD', 'United States dollar', '$', '.vg', 'British Virgin Islands', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Tortola\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"영국령 버진아일랜드\",\"br\":\"Ilhas Virgens Britânicas\",\"pt\":\"Ilhas Virgens Britânicas\",\"nl\":\"Britse Maagdeneilanden\",\"hr\":\"Britanski Djevičanski Otoci\",\"fa\":\"جزایر ویرجین بریتانیا\",\"de\":\"Britische Jungferninseln\",\"es\":\"Islas Vírgenes del Reino Unido\",\"fr\":\"Îles Vierges britanniques\",\"ja\":\"イギリス領ヴァージン諸島\",\"it\":\"Isole Vergini Britanniche\",\"cn\":\"圣文森特和格林纳丁斯\"}', 18.43138300, -64.62305000, '??', 'U+1F1FB U+1F1EC', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:36:33'),
(242, 'Virgin Islands (US)', 'VIR', 'VI', '850', '+1-340', 'Charlotte Amalie', 'USD', 'United States dollar', '$', '.vi', 'United States Virgin Islands', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/St_Thomas\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"미국령 버진아일랜드\",\"br\":\"Ilhas Virgens Americanas\",\"pt\":\"Ilhas Virgens Americanas\",\"nl\":\"Verenigde Staten Maagdeneilanden\",\"fa\":\"جزایر ویرجین آمریکا\",\"de\":\"Amerikanische Jungferninseln\",\"es\":\"Islas Vírgenes de los Estados Unidos\",\"fr\":\"Îles Vierges des États-Unis\",\"ja\":\"アメリカ領ヴァージン諸島\",\"it\":\"Isole Vergini americane\",\"cn\":\"维尔京群岛（美国）\"}', 18.34000000, -64.93000000, '??', 'U+1F1FB U+1F1EE', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:46:20'),
(243, 'Wallis And Futuna Islands', 'WLF', 'WF', '876', '681', 'Mata Utu', 'XPF', 'CFP franc', '₣', '.wf', 'Wallis et Futuna', 'Oceania', 'Polynesia', '[{\"zoneName\":\"Pacific/Wallis\",\"gmtOffset\":43200,\"gmtOffsetName\":\"UTC+12:00\",\"abbreviation\":\"WFT\",\"tzName\":\"Wallis & Futuna Time\"}]', '{\"kr\":\"왈리스 푸투나\",\"br\":\"Wallis e Futuna\",\"pt\":\"Wallis e Futuna\",\"nl\":\"Wallis en Futuna\",\"hr\":\"Wallis i Fortuna\",\"fa\":\"والیس و فوتونا\",\"de\":\"Wallis und Futuna\",\"es\":\"Wallis y Futuna\",\"fr\":\"Wallis-et-Futuna\",\"ja\":\"ウォリス・フツナ\",\"it\":\"Wallis e Futuna\",\"cn\":\"瓦利斯群岛和富图纳群岛\"}', -13.30000000, -176.20000000, '??', 'U+1F1FC U+1F1EB', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:46:25'),
(244, 'Western Sahara', 'ESH', 'EH', '732', '212', 'El-Aaiun', 'MAD', 'Moroccan Dirham', 'MAD', '.eh', 'الصحراء الغربية', 'Africa', 'Northern Africa', '[{\"zoneName\":\"Africa/El_Aaiun\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"WEST\",\"tzName\":\"Western European Summer Time\"}]', '{\"kr\":\"서사하라\",\"br\":\"Saara Ocidental\",\"pt\":\"Saara Ocidental\",\"nl\":\"Westelijke Sahara\",\"hr\":\"Zapadna Sahara\",\"fa\":\"جمهوری دموکراتیک عربی صحرا\",\"de\":\"Westsahara\",\"es\":\"Sahara Occidental\",\"fr\":\"Sahara Occidental\",\"ja\":\"西サハラ\",\"it\":\"Sahara Occidentale\",\"cn\":\"西撒哈拉\"}', 24.50000000, -13.00000000, '??', 'U+1F1EA U+1F1ED', 1, NULL, '2018-07-20 20:11:03', '2021-12-11 13:46:40'),
(245, 'Yemen', 'YEM', 'YE', '887', '967', 'Sanaa', 'YER', 'Yemeni rial', '﷼', '.ye', 'اليَمَن', 'Asia', 'Western Asia', '[{\"zoneName\":\"Asia/Aden\",\"gmtOffset\":10800,\"gmtOffsetName\":\"UTC+03:00\",\"abbreviation\":\"AST\",\"tzName\":\"Arabia Standard Time\"}]', '{\"kr\":\"예멘\",\"br\":\"Iêmen\",\"pt\":\"Iémen\",\"nl\":\"Jemen\",\"hr\":\"Jemen\",\"fa\":\"یمن\",\"de\":\"Jemen\",\"es\":\"Yemen\",\"fr\":\"Yémen\",\"ja\":\"イエメン\",\"it\":\"Yemen\",\"cn\":\"也门\"}', 15.00000000, 48.00000000, '??', 'U+1F1FE U+1F1EA', 1, 'Q805', '2018-07-20 20:11:03', '2021-12-11 13:46:48'),
(246, 'Zambia', 'ZMB', 'ZM', '894', '260', 'Lusaka', 'ZMW', 'Zambian kwacha', 'ZK', '.zm', 'Zambia', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Lusaka\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]', '{\"kr\":\"잠비아\",\"br\":\"Zâmbia\",\"pt\":\"Zâmbia\",\"nl\":\"Zambia\",\"hr\":\"Zambija\",\"fa\":\"زامبیا\",\"de\":\"Sambia\",\"es\":\"Zambia\",\"fr\":\"Zambie\",\"ja\":\"ザンビア\",\"it\":\"Zambia\",\"cn\":\"赞比亚\"}', -15.00000000, 30.00000000, '??', 'U+1F1FF U+1F1F2', 1, 'Q953', '2018-07-20 20:11:03', '2021-12-11 13:46:53'),
(247, 'Zimbabwe', 'ZWE', 'ZW', '716', '263', 'Harare', 'ZWL', 'Zimbabwe Dollar', '$', '.zw', 'Zimbabwe', 'Africa', 'Eastern Africa', '[{\"zoneName\":\"Africa/Harare\",\"gmtOffset\":7200,\"gmtOffsetName\":\"UTC+02:00\",\"abbreviation\":\"CAT\",\"tzName\":\"Central Africa Time\"}]', '{\"kr\":\"짐바브웨\",\"br\":\"Zimbabwe\",\"pt\":\"Zimbabué\",\"nl\":\"Zimbabwe\",\"hr\":\"Zimbabve\",\"fa\":\"زیمباوه\",\"de\":\"Simbabwe\",\"es\":\"Zimbabue\",\"fr\":\"Zimbabwe\",\"ja\":\"ジンバブエ\",\"it\":\"Zimbabwe\",\"cn\":\"津巴布韦\"}', -20.00000000, 30.00000000, '??', 'U+1F1FF U+1F1FC', 1, 'Q954', '2018-07-20 20:11:03', '2021-12-11 13:47:10'),
(248, 'Kosovo', 'XKX', 'XK', '926', '383', 'Pristina', 'EUR', 'Euro', '€', '.xk', 'Republika e Kosovës', 'Europe', 'Eastern Europe', '[{\"zoneName\":\"Europe/Belgrade\",\"gmtOffset\":3600,\"gmtOffsetName\":\"UTC+01:00\",\"abbreviation\":\"CET\",\"tzName\":\"Central European Time\"}]', '{\"kr\":\"코소보\",\"cn\":\"科索沃\"}', 42.56129090, 20.34030350, '??', 'U+1F1FD U+1F1F0', 1, 'Q1246', '2020-08-15 15:33:50', '2021-12-11 13:26:38'),
(249, 'Curaçao', 'CUW', 'CW', '531', '599', 'Willemstad', 'ANG', 'Netherlands Antillean guilder', 'ƒ', '.cw', 'Curaçao', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Curacao\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"퀴라소\",\"br\":\"Curaçao\",\"pt\":\"Curaçao\",\"nl\":\"Curaçao\",\"fa\":\"کوراسائو\",\"de\":\"Curaçao\",\"fr\":\"Curaçao\",\"it\":\"Curaçao\",\"cn\":\"库拉索\"}', 12.11666700, -68.93333300, '??', 'U+1F1E8 U+1F1FC', 1, 'Q25279', '2020-10-25 14:54:20', '2021-12-11 13:01:45'),
(250, 'Sint Maarten (Dutch part)', 'SXM', 'SX', '534', '1721', 'Philipsburg', 'ANG', 'Netherlands Antillean guilder', 'ƒ', '.sx', 'Sint Maarten', 'Americas', 'Caribbean', '[{\"zoneName\":\"America/Anguilla\",\"gmtOffset\":-14400,\"gmtOffsetName\":\"UTC-04:00\",\"abbreviation\":\"AST\",\"tzName\":\"Atlantic Standard Time\"}]', '{\"kr\":\"신트마르턴\",\"br\":\"Sint Maarten\",\"pt\":\"São Martinho\",\"nl\":\"Sint Maarten\",\"fa\":\"سینت مارتن\",\"de\":\"Sint Maarten (niederl. Teil)\",\"fr\":\"Saint Martin (partie néerlandaise)\",\"it\":\"Saint Martin (parte olandese)\",\"cn\":\"圣马丁岛（荷兰部分）\"}', 18.03333300, -63.05000000, '??', 'U+1F1F8 U+1F1FD', 1, 'Q26273', '2020-12-05 13:03:39', '2021-12-11 13:41:24');

-- --------------------------------------------------------

--
-- Table structure for table `custom_product_fields`
--

CREATE TABLE `custom_product_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_product_sections`
--

CREATE TABLE `custom_product_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_product_section_field`
--

CREATE TABLE `custom_product_section_field` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `custom_product_section_id` bigint(20) UNSIGNED NOT NULL,
  `custom_product_field_id` bigint(20) UNSIGNED NOT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boys`
--

CREATE TABLE `delivery_boys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `full_name` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `driver_license` varchar(191) DEFAULT NULL,
  `driver_license_number` varchar(191) DEFAULT NULL,
  `vehicle_type` varchar(191) DEFAULT NULL,
  `vehicle_registration` varchar(191) DEFAULT NULL,
  `verification_status` enum('pending','rejected','verified') NOT NULL DEFAULT 'pending',
  `verification_remark` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy_assignments`
--

CREATE TABLE `delivery_boy_assignments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_boy_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `return_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assignment_type` enum('delivery','return_pickup') NOT NULL DEFAULT 'delivery' COMMENT 'delivery, pickup',
  `assigned_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('assigned','in_progress','completed','canceled') NOT NULL DEFAULT 'assigned',
  `base_fee` decimal(10,2) DEFAULT NULL,
  `per_store_pickup_fee` decimal(10,2) DEFAULT NULL,
  `distance_based_fee` decimal(10,2) DEFAULT NULL,
  `per_order_incentive` decimal(10,2) DEFAULT NULL,
  `total_earnings` decimal(10,2) DEFAULT NULL,
  `payment_status` enum('pending','paid') NOT NULL DEFAULT 'pending',
  `cod_cash_collected` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'Cash collected by delivery boy for COD orders',
  `cod_cash_submitted` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT 'Cash submitted by delivery boy to admin',
  `cod_submission_status` enum('pending','submitted','partially_submitted') NOT NULL DEFAULT 'pending' COMMENT 'Status of cash submission to admin',
  `paid_at` timestamp NULL DEFAULT NULL,
  `transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy_cash_transactions`
--

CREATE TABLE `delivery_boy_cash_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_boy_assignment_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_boy_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_type` enum('collected','submitted') NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy_locations`
--

CREATE TABLE `delivery_boy_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_boy_id` bigint(20) UNSIGNED NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `recorded_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy_withdrawal_requests`
--

CREATE TABLE `delivery_boy_withdrawal_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_boy_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL COMMENT 'Amount requested for withdrawal',
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `request_note` text DEFAULT NULL COMMENT 'Note from delivery boy',
  `admin_remark` text DEFAULT NULL COMMENT 'Remark from admin',
  `processed_at` timestamp NULL DEFAULT NULL COMMENT 'When the request was processed',
  `processed_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Admin who processed the request',
  `transaction_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Related wallet transaction ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_feedback`
--

CREATE TABLE `delivery_feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_boy_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_time_slots`
--

CREATE TABLE `delivery_time_slots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `max_orders` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_zones`
--

CREATE TABLE `delivery_zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `center_latitude` decimal(10,8) NOT NULL,
  `center_longitude` decimal(11,8) NOT NULL,
  `radius_km` double NOT NULL,
  `rush_delivery_time_per_km` int(11) DEFAULT NULL,
  `rush_delivery_charges` int(11) DEFAULT NULL,
  `delivery_time_per_km` int(11) NOT NULL,
  `regular_delivery_charges` int(11) NOT NULL,
  `free_delivery_amount` int(11) DEFAULT NULL,
  `distance_based_delivery_charges` int(11) DEFAULT NULL,
  `per_store_drop_off_fee` int(11) DEFAULT NULL,
  `handling_charges` int(11) DEFAULT NULL,
  `delivery_boy_base_fee` decimal(10,2) DEFAULT NULL,
  `delivery_boy_per_store_pickup_fee` decimal(10,2) DEFAULT NULL,
  `delivery_boy_distance_based_fee` decimal(10,2) DEFAULT NULL,
  `delivery_boy_per_order_incentive` decimal(10,2) DEFAULT NULL,
  `buffer_time` int(11) NOT NULL,
  `boundary_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`boundary_json`)),
  `rush_delivery_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(191) NOT NULL,
  `answer` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `featured_sections`
--

CREATE TABLE `featured_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `scope_type` enum('global','category') NOT NULL DEFAULT 'global',
  `scope_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `short_description` text DEFAULT NULL,
  `style` varchar(191) NOT NULL,
  `background_type` enum('image','color') DEFAULT NULL,
  `background_color` varchar(191) DEFAULT NULL,
  `text_color` varchar(191) NOT NULL DEFAULT '#000000',
  `section_type` varchar(191) NOT NULL,
  `sort_order` int(11) DEFAULT 0,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `following_sellers`
--

CREATE TABLE `following_sellers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(191) NOT NULL,
  `seller_id` varchar(191) NOT NULL,
  `user_seller_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gift_cards`
--

CREATE TABLE `gift_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(250) NOT NULL,
  `barcode` varchar(250) NOT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `minimum_order_amount` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `used` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `global_product_attributes`
--

CREATE TABLE `global_product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(350) NOT NULL,
  `label` varchar(191) NOT NULL,
  `swatche_type` enum('text','color','image') NOT NULL DEFAULT 'text',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `global_product_attribute_values`
--

CREATE TABLE `global_product_attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `global_attribute_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `swatche_value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `file_name` varchar(191) NOT NULL,
  `mime_type` varchar(191) DEFAULT NULL,
  `disk` varchar(191) NOT NULL,
  `conversions_disk` varchar(191) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_05_05_112622_update_users_table', 1),
(5, '2025_05_05_121106_create_wallets_table', 1),
(6, '2025_05_05_122900_create_delivery_zones_table', 1),
(7, '2025_05_05_122901_create_sellers_table', 1),
(8, '2025_05_05_122902_create_stores_table', 1),
(9, '2025_05_05_122903_create_following_sellers_table', 1),
(10, '2025_05_05_122904_create_delivery_boys_table', 1),
(11, '2025_05_05_122905_add_fields_to_delivery_boys_table', 1),
(12, '2025_05_05_122905_create_delivery_boy_locations_table', 1),
(13, '2025_05_06_043058_create_categories_table', 1),
(14, '2025_05_06_043059_create_brands_table', 1),
(15, '2025_05_06_043505_create_product_conditions_table', 1),
(16, '2025_05_06_043506_create_products_table', 1),
(17, '2025_05_06_043507_create_product_variants_table', 1),
(18, '2025_05_06_053735_create_store_product_variants_table', 1),
(19, '2025_05_06_053745_create_store_inventory_logs_table', 1),
(20, '2025_05_06_055246_create_category_products_table', 1),
(21, '2025_05_06_055324_create_category_product_conditions_table', 1),
(22, '2025_05_06_055404_create_collections_table', 1),
(23, '2025_05_06_055445_create_carts_table', 1),
(24, '2025_05_06_055533_create_cart_items_table', 1),
(25, '2025_05_06_055819_create_wishlists_table', 1),
(26, '2025_05_06_055846_create_wishlist_items_table', 1),
(27, '2025_05_06_055900_create_delivery_time_slots_table', 1),
(28, '2025_05_06_055951_create_orders_table', 1),
(29, '2025_05_06_060344_create_order_items_table', 1),
(30, '2025_05_06_060450_create_seller_orders_table', 1),
(31, '2025_05_06_060519_create_seller_order_items_table', 1),
(32, '2025_05_06_061307_create_delivery_boy_assignments_table', 1),
(33, '2025_05_06_061340_create_shipping_parcels_table', 1),
(34, '2025_05_06_061449_create_shipping_parcel_items_table', 1),
(35, '2025_05_06_061530_create_addresses_table', 1),
(36, '2025_05_06_061651_create_reviews_table', 1),
(37, '2025_05_06_061718_create_seller_feedback_table', 1),
(38, '2025_05_06_061748_create_gift_cards_table', 1),
(39, '2025_05_06_061904_create_support_ticket_types_table', 1),
(40, '2025_05_06_062000_create_support_tickets_table', 1),
(41, '2025_05_06_062030_create_support_ticket_messages_table', 1),
(42, '2025_05_06_062302_create_settings_table', 1),
(43, '2025_05_06_062338_create_countries_table', 1),
(44, '2025_05_06_062411_create_faqs_table', 1),
(45, '2025_05_06_062437_create_product_faqs_table', 1),
(46, '2025_05_07_043060_add_commission_to_categories_table', 1),
(47, '2025_05_15_000000_add_otp_fields_to_products_and_order_items_tables', 1),
(48, '2025_05_15_000000_create_delivery_boy_cash_transactions_table', 1),
(49, '2025_05_15_100405_create_media_table', 1),
(50, '2025_05_16_000000_create_delivery_boy_withdrawal_requests_table', 1),
(51, '2025_05_16_114622_modify_categories_table', 1),
(52, '2025_05_17_000000_create_seller_withdrawal_requests_table', 1),
(53, '2025_05_17_062421_remove_image_colunms_from_tables', 1),
(54, '2025_05_19_091414_modify_brands_table', 1),
(55, '2025_05_20_091322_update_seller_table', 1),
(56, '2025_05_21_062058_create_tax_classes_table', 1),
(57, '2025_05_21_062132_create_tax_rates_table', 1),
(58, '2025_05_21_101700_create_table_tax_class_tax_rate', 1),
(59, '2025_05_27_113402_modify_users_table', 1),
(60, '2025_05_27_122053_create_permission_tables', 1),
(61, '2025_05_30_121905_create_seller_user', 1),
(62, '2025_05_31_124117_add_column_team_id_in_roles_table', 1),
(63, '2025_06_03_063244_update_stores_table', 1),
(64, '2025_06_11_123229_create_global_product_attributes_table', 1),
(65, '2025_06_11_123306_create_global_product_attribute_values_table', 1),
(66, '2025_06_11_123323_create_product_variant_attributes_table', 1),
(67, '2025_06_13_090459_update_product_table', 1),
(68, '2025_06_17_050536_create_personal_access_tokens_table', 1),
(69, '2025_06_18_083334_update_product_table', 1),
(70, '2025_06_18_085314_update_product_variant_table', 1),
(71, '2025_06_19_044813_add_soft_delete_in_tables', 1),
(72, '2025_06_21_060509_update_product_table', 1),
(73, '2025_06_21_083854_create_table_product_taxes', 1),
(74, '2025_06_25_075558_create_wallet_transactions_table', 1),
(75, '2025_06_25_112436_create_banners_table', 1),
(76, '2025_06_26_093708_update_users_table', 1),
(77, '2025_06_30_042142_add_field_in_users_table', 1),
(78, '2025_07_03_115318_update_stores_table', 1),
(79, '2025_07_03_115411_create_store_zone_table', 1),
(80, '2025_07_07_053035_update_delivery_zones_table', 1),
(81, '2025_07_07_053256_update_product_table', 1),
(82, '2025_07_08_054216_update_wishlist_items_table', 1),
(83, '2025_07_08_075253_create_table_featured_sections', 1),
(84, '2025_07_08_075511_create_category_featured_section_table', 1),
(85, '2025_07_12_062506_update_table_delivery_zones', 1),
(86, '2025_07_16_061649_add_product_id_to_product_variant_attributes_table', 1),
(87, '2025_07_17_063223_update_seller_orders_table', 1),
(88, '2025_07_17_102140_update_order_table', 1),
(89, '2025_07_17_103322_update_order_items_table', 1),
(90, '2025_07_17_161135_update_seller_order_items_table', 1),
(91, '2025_07_18_095508_update_orders_table', 1),
(92, '2025_07_22_120022_update_delivery_boy_location_table', 1),
(93, '2025_07_22_124047_update_orders_table', 1),
(94, '2025_07_24_053056_add_delivery_boy_earnings_fields_to_delivery_zones_table', 1),
(95, '2025_07_24_054345_update_delivery_boy_earnings_fields_to_decimal', 1),
(96, '2025_07_24_072733_add_earnings_fields_to_delivery_boy_assignments_table', 1),
(97, '2025_07_24_074553_add_payment_status_to_delivery_boy_assignments_table', 1),
(98, '2025_07_24_124902_update_delivery_boy_assignments_table', 1),
(99, '2025_07_26_050411_update_wallet_table', 1),
(100, '2025_07_31_112317_create_delivery_feedback_table', 1),
(101, '2025_08_04_044211_update_order_table', 1),
(102, '2025_08_12_063618_update_wishlists_table', 1),
(103, '2025_08_14_101202_create_promo_table', 1),
(104, '2025_08_14_101225_create_order_promo_line_table', 1),
(105, '2025_08_14_101245_add_promo_discount_to_order_items_table', 1),
(106, '2025_08_19_054507_update_banners_table', 1),
(107, '2025_08_19_085237_update_featured_sections', 1),
(108, '2025_08_20_120000_add_background_fields_to_categories_table', 1),
(109, '2025_08_20_124931_create_notifications_table', 1),
(110, '2025_08_23_101900_update_brands_table', 1),
(111, '2025_08_23_120000_add_font_color_to_categories_table', 1),
(112, '2025_08_25_084408_user_fcm_tokens', 1),
(113, '2025_09_08_091650_create_order_payment_transactions_table', 1),
(114, '2025_09_11_054945_add_column_in_products_table', 1),
(115, '2025_10_15_055036_remove_time_slot_config_add_status_to_stores_table', 1),
(116, '2025_10_28_053033_update_wallet_transactions_table', 1),
(117, '2025_11_12_160339_update_featured_sections_table', 1),
(118, '2025_11_13_104908_create_order_item_returns_table', 1),
(119, '2025_11_13_111623_update_order_items_table', 1),
(120, '2025_11_13_174710_update_delivery_boy_assignments_table', 1),
(121, '2025_11_14_115800_create_seller_statements_table', 1),
(122, '2025_11_14_123500_update_seller_statements_add_settlement_fields', 1),
(123, '2025_11_15_101749_update_featured_sections_table', 1),
(124, '2025_11_15_103927_update_reviews_table', 1),
(125, '2025_11_15_130945_update_seller_feedback_table', 1),
(126, '2025_11_21_113500_update_orders_add_handling_and_drop_fee', 1),
(127, '2025_11_25_152515_update_roles_table', 1),
(128, '2025_12_05_104800_add_image_fit_to_products_table', 1),
(129, '2025_12_19_000000_create_system_updates_table', 1),
(130, '2026_01_15_115753_update_reviews_table', 1),
(131, '2026_01_16_000001_add_custom_fields_to_products_table', 1),
(132, '2026_01_23_193900_add_sort_order_to_categories_table', 1),
(133, '2026_02_10_095734_add_home_category_to_categories_table', 1),
(134, '2026_02_11_130500_create_custom_product_sections_table', 1),
(135, '2026_02_11_130510_create_custom_product_fields_table', 1),
(136, '2026_02_11_130520_create_custom_product_section_field_table', 1),
(137, '2026_02_17_101111_create_user_otps_table', 1),
(138, '2026_02_20_144800_fix_notifications_tables', 1),
(139, '2026_03_06_104219_create_subscription_plans_table', 1),
(140, '2026_03_06_104224_create_subscription_plan_limits_table', 1),
(141, '2026_03_06_104229_create_seller_subscriptions_table', 1),
(142, '2026_03_06_104233_create_seller_subscription_snapshots_table', 1),
(143, '2026_03_06_104238_create_seller_subscription_usages_table', 1),
(144, '2026_03_06_104242_create_subscription_transactions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(100) NOT NULL,
  `email` varchar(191) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `currency_code` varchar(3) NOT NULL DEFAULT 'USD',
  `currency_rate` decimal(10,6) NOT NULL,
  `payment_method` varchar(191) NOT NULL,
  `payment_status` varchar(191) NOT NULL,
  `fulfillment_type` enum('hyperlocal','regular') NOT NULL DEFAULT 'hyperlocal',
  `is_rush_order` tinyint(1) NOT NULL DEFAULT 0,
  `estimated_delivery_time` int(11) DEFAULT NULL,
  `delivery_time_slot_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_boy_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_zone_id` bigint(20) UNSIGNED NOT NULL,
  `wallet_balance` decimal(12,2) NOT NULL,
  `promo_code` varchar(50) DEFAULT NULL,
  `promo_discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `gift_card` varchar(50) DEFAULT NULL,
  `gift_card_discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `delivery_charge` decimal(10,2) NOT NULL DEFAULT 0.00,
  `handling_charges` decimal(10,2) NOT NULL DEFAULT 0.00,
  `per_store_drop_off_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `subtotal` decimal(12,2) NOT NULL,
  `total_payable` decimal(12,2) NOT NULL,
  `final_total` decimal(12,2) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `billing_name` varchar(191) NOT NULL,
  `billing_address_1` text NOT NULL,
  `billing_address_2` text DEFAULT NULL,
  `billing_landmark` varchar(191) NOT NULL,
  `billing_zip` varchar(20) NOT NULL,
  `billing_phone` varchar(20) NOT NULL,
  `billing_address_type` enum('home','office','other') NOT NULL,
  `billing_latitude` decimal(10,8) NOT NULL,
  `billing_longitude` decimal(11,8) NOT NULL,
  `billing_city` varchar(191) NOT NULL,
  `billing_state` varchar(191) NOT NULL,
  `billing_country` varchar(191) NOT NULL,
  `billing_country_code` varchar(3) NOT NULL,
  `shipping_name` varchar(191) NOT NULL,
  `shipping_address_1` text NOT NULL,
  `shipping_address_2` text DEFAULT NULL,
  `shipping_landmark` varchar(191) NOT NULL,
  `shipping_zip` varchar(20) NOT NULL,
  `shipping_phone` varchar(20) NOT NULL,
  `shipping_address_type` enum('home','office','other') NOT NULL,
  `shipping_latitude` decimal(10,8) NOT NULL,
  `shipping_longitude` decimal(11,8) NOT NULL,
  `shipping_city` varchar(191) NOT NULL,
  `shipping_state` varchar(191) NOT NULL,
  `shipping_country` varchar(191) NOT NULL,
  `shipping_country_code` varchar(3) NOT NULL,
  `order_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_variant_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `variant_title` varchar(191) NOT NULL,
  `gift_card_discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `admin_commission_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `seller_commission_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `commission_settled` enum('0','1') NOT NULL DEFAULT '0',
  `return_eligible` tinyint(1) NOT NULL DEFAULT 0,
  `return_deadline` date DEFAULT NULL,
  `returnable_days` tinyint(4) NOT NULL DEFAULT 0,
  `discounted_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `promo_discount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `tax_percent` decimal(5,2) DEFAULT NULL,
  `sku` varchar(191) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `status` varchar(191) NOT NULL,
  `otp` varchar(191) DEFAULT NULL,
  `otp_verified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_item_returns`
--

CREATE TABLE `order_item_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_boy_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `refund_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `seller_comment` text DEFAULT NULL,
  `pickup_status` enum('pending','assigned','picked_up','delivered_to_seller','cancelled') NOT NULL DEFAULT 'pending',
  `return_status` enum('cancelled','requested','seller_approved','seller_rejected','pickup_assigned','picked_up','received_by_seller','refund_processed','completed') NOT NULL DEFAULT 'requested',
  `seller_approved_at` timestamp NULL DEFAULT NULL,
  `picked_up_at` timestamp NULL DEFAULT NULL,
  `received_at` timestamp NULL DEFAULT NULL,
  `refund_processed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Tracks each return request for individual order items';

-- --------------------------------------------------------

--
-- Table structure for table `order_payment_transactions`
--

CREATE TABLE `order_payment_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `payment_method` varchar(191) NOT NULL,
  `payment_status` enum('pending','completed','failed','refunded','partially_refunded') NOT NULL DEFAULT 'pending',
  `message` text DEFAULT NULL,
  `payment_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payment_details`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_promo_line`
--

CREATE TABLE `order_promo_line` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `promo_id` bigint(20) UNSIGNED NOT NULL,
  `promo_code` varchar(25) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL,
  `cashback_flag` tinyint(1) NOT NULL DEFAULT 0,
  `is_awarded` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(2, 'category.create', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(3, 'category.edit', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(4, 'category.delete', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(5, 'category.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(6, 'brand.create', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(7, 'brand.edit', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(8, 'brand.delete', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(9, 'brand.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(10, 'seller.create', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(11, 'seller.edit', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(12, 'seller.delete', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(13, 'seller.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(14, 'setting.view.all', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(15, 'setting.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(16, 'setting.edit', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(17, 'setting.system.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(18, 'setting.system.edit', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(19, 'setting.storage.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(20, 'setting.storage.edit', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(21, 'setting.email.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(22, 'setting.email.edit', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(23, 'setting.payment.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(24, 'setting.payment.edit', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(25, 'setting.authentication.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(26, 'setting.authentication.edit', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(27, 'setting.notification.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(28, 'setting.notification.edit', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(29, 'setting.web.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(30, 'setting.web.edit', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(31, 'setting.app.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(32, 'setting.app.edit', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(33, 'setting.delivery_boy.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(34, 'setting.delivery_boy.edit', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(35, 'setting.home_general_settings.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(36, 'setting.home_general_settings.edit', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(37, 'role.create', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(38, 'role.edit', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(39, 'role.delete', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(40, 'role.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(41, 'role.permission.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(42, 'role.permission.edit', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(43, 'tax_class.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(44, 'tax_class.create', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(45, 'tax_class.edit', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(46, 'tax_class.delete', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(47, 'system_user.create', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(48, 'system_user.edit', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(49, 'system_user.delete', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(50, 'system_user.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(51, 'faq.create', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(52, 'faq.edit', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(53, 'faq.delete', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(54, 'faq.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(55, 'banner.create', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(56, 'banner.edit', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(57, 'banner.delete', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(58, 'banner.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(59, 'delivery_zone.create', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(60, 'delivery_zone.edit', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(61, 'delivery_zone.delete', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(62, 'delivery_zone.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(63, 'featured_section.create', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(64, 'featured_section.edit', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(65, 'featured_section.delete', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(66, 'featured_section.sorting_modify', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(67, 'featured_section.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(68, 'featured_section.sorting_view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(69, 'delivery_boy.edit', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(70, 'delivery_boy.delete', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(71, 'delivery_boy.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(72, 'delivery_boy_earning.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(73, 'delivery_boy_earning.process_payment', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(74, 'delivery_boy_cash_collection.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(75, 'delivery_boy_cash_collection.process', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(76, 'delivery_boy_withdrawal.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(77, 'delivery_boy_withdrawal.process', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(78, 'seller_withdrawal.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(79, 'seller_withdrawal.process', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(80, 'commission.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(81, 'commission.settle', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(82, 'orders.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(83, 'return.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(84, 'product.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(85, 'product.status_update', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(86, 'product_faqs.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(87, 'promo.create', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(88, 'promo.edit', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(89, 'promo.delete', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(90, 'promo.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(91, 'notification.create', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(92, 'notification.edit', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(93, 'notification.delete', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(94, 'notification.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(95, 'subscription_plan.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(96, 'subscription_plan.create', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(97, 'subscription_plan.edit', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(98, 'subscription_plan.delete', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(99, 'subscription_subscriber.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(100, 'store.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(101, 'store.verify', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(102, 'customer.view', 'admin', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(103, 'dashboard.view', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(104, 'role.view', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(105, 'role.create', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(106, 'role.edit', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(107, 'role.delete', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(108, 'role.permission.view', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(109, 'role.permission.edit', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(110, 'system_user.create', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(111, 'system_user.edit', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(112, 'system_user.delete', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(113, 'system_user.view', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(114, 'store.view', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(115, 'store.create', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(116, 'store.edit', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(117, 'store.delete', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(118, 'attribute.view', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(119, 'attribute.create', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(120, 'attribute.edit', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(121, 'attribute.delete', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(122, 'product_condition.create', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(123, 'product_condition.edit', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(124, 'product_condition.delete', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(125, 'product.view', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(126, 'product.create', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(127, 'product.edit', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(128, 'product.delete', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(129, 'product_faq.view', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(130, 'product_faq.create', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(131, 'product_faq.edit', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(132, 'product_faq.delete', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(133, 'order.view', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(134, 'order.edit', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(135, 'order.update_status', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(136, 'earning.view', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(137, 'notification.create', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(138, 'notification.view', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(139, 'notification.edit', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(140, 'notification.delete', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(141, 'tax_rate.create', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(142, 'tax_rate.edit', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(143, 'tax_rate.delete', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(144, 'tax_rate.view', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(145, 'wallet.view', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(146, 'withdrawal.view', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(147, 'withdrawal.request', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(148, 'return.view', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(149, 'return.decide', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(150, 'category.view', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(151, 'brand.view', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(152, 'subscription.view', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04'),
(153, 'subscription.buy', 'seller', '2026-03-31 05:43:04', '2026-03-31 05:43:04');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'admin@gmail.com', '38cbf2cb3a8e520935a5d0d216df4fe8a24338f069981697405ca5547590f26c', '[\"*\"]', NULL, NULL, '2026-03-31 05:48:49', '2026-03-31 05:48:49'),
(2, 'App\\Models\\User', 1, 'admin@gmail.com', '1da06c3a1c616ab6de39d59224a720ea81e8cc9bf29b2562fc2a8e0e8d6af5cf', '[\"*\"]', NULL, NULL, '2026-03-31 06:24:09', '2026-03-31 06:24:09'),
(3, 'App\\Models\\User', 1, 'admin@gmail.com', 'aee2066bf82bfbd6d65e140f329fd6e5283e0bfd09965ed4235dde45fd3745b2', '[\"*\"]', NULL, NULL, '2026-03-31 06:33:27', '2026-03-31 06:33:27');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_condition_id` bigint(20) UNSIGNED DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `provider_product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `slug` varchar(500) NOT NULL,
  `title` varchar(191) NOT NULL,
  `product_identity` int(11) DEFAULT NULL,
  `type` enum('simple','variant','digital') NOT NULL,
  `short_description` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `indicator` enum('veg','non_veg') DEFAULT NULL,
  `download_allowed` enum('0','1') NOT NULL DEFAULT '0',
  `download_link` varchar(191) DEFAULT NULL,
  `minimum_order_quantity` int(11) NOT NULL DEFAULT 1,
  `quantity_step_size` int(11) NOT NULL DEFAULT 1,
  `total_allowed_quantity` int(11) NOT NULL DEFAULT 1,
  `is_inclusive_tax` enum('0','1') NOT NULL DEFAULT '0',
  `is_returnable` enum('0','1') NOT NULL DEFAULT '0',
  `returnable_days` int(11) DEFAULT NULL,
  `is_cancelable` enum('0','1') NOT NULL DEFAULT '0',
  `cancelable_till` enum('pending','awaiting_store_response','accepted','preparing') DEFAULT NULL,
  `is_attachment_required` enum('0','1') NOT NULL DEFAULT '0',
  `base_prep_time` int(11) NOT NULL,
  `status` enum('active','draft') NOT NULL DEFAULT 'active',
  `verification_status` enum('pending_verification','rejected','approved') NOT NULL DEFAULT 'approved',
  `rejection_reason` varchar(191) DEFAULT NULL,
  `requires_otp` tinyint(1) NOT NULL DEFAULT 0,
  `featured` enum('0','1') NOT NULL DEFAULT '0',
  `video_type` enum('self_hosted','youtube','vimeo') DEFAULT NULL,
  `video_link` varchar(191) DEFAULT NULL,
  `cloned_from_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tags` text NOT NULL,
  `custom_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`custom_fields`)),
  `warranty_period` varchar(191) DEFAULT NULL,
  `guarantee_period` varchar(191) DEFAULT NULL,
  `made_in` varchar(191) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `image_fit` enum('cover','contain') NOT NULL DEFAULT 'contain',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hsn_code` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_conditions`
--

CREATE TABLE `product_conditions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `alignment` enum('strip') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_faqs`
--

CREATE TABLE `product_faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(191) NOT NULL,
  `answer` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_taxes`
--

CREATE TABLE `product_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `tax_class_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(500) NOT NULL,
  `weight` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `breadth` double DEFAULT NULL,
  `length` double DEFAULT NULL,
  `availability` tinyint(1) NOT NULL,
  `provider` varchar(191) NOT NULL DEFAULT 'self',
  `provider_product_id` varchar(191) DEFAULT NULL,
  `provider_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`provider_json`)),
  `barcode` varchar(191) NOT NULL,
  `visibility` enum('published','draft') NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variant_attributes`
--

CREATE TABLE `product_variant_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_variant_id` bigint(20) UNSIGNED NOT NULL,
  `global_attribute_id` bigint(20) UNSIGNED NOT NULL,
  `global_attribute_value_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promo`
--

CREATE TABLE `promo` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(25) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `discount_type` enum('free_shipping','flat','percent') NOT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `promo_mode` enum('instant','cashback') NOT NULL DEFAULT 'instant',
  `usage_count` int(11) NOT NULL DEFAULT 0,
  `individual_use` int(11) NOT NULL DEFAULT 0,
  `max_total_usage` int(11) DEFAULT NULL,
  `max_usage_per_user` int(11) DEFAULT NULL,
  `min_order_total` decimal(10,2) DEFAULT NULL,
  `max_discount_value` decimal(10,2) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `title` varchar(191) NOT NULL COMMENT 'Review title',
  `slug` varchar(191) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `team_id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Super Admin', 'admin', '2026-03-31 05:43:01', '2026-03-31 05:43:01'),
(2, NULL, 'seller', 'seller', '2026-03-31 05:43:01', '2026-03-31 05:43:01'),
(3, NULL, 'customer', 'web', '2026-03-31 05:43:01', '2026-03-31 05:43:01');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `landmark` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zipcode` varchar(20) NOT NULL,
  `country` varchar(100) NOT NULL,
  `country_code` varchar(10) NOT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `verification_status` enum('approved','not_approved') NOT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `visibility_status` enum('visible','draft') NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_feedback`
--

CREATE TABLE `seller_feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_orders`
--

CREATE TABLE `seller_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_order_items`
--

CREATE TABLE `seller_order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_variant_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_statements`
--

CREATE TABLE `seller_statements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `return_id` bigint(20) UNSIGNED DEFAULT NULL,
  `entry_type` enum('credit','debit') NOT NULL COMMENT 'credit adds to seller balance, debit subtracts',
  `amount` decimal(12,2) NOT NULL,
  `currency_code` varchar(10) DEFAULT NULL,
  `reference_type` varchar(191) DEFAULT NULL COMMENT 'e.g., order, return, adjustment',
  `reference_id` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta`)),
  `posted_at` timestamp NULL DEFAULT NULL,
  `settlement_status` enum('pending','settled') NOT NULL DEFAULT 'pending',
  `settled_at` timestamp NULL DEFAULT NULL,
  `settlement_reference` varchar(191) DEFAULT NULL COMMENT 'payment reference / batch ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_subscriptions`
--

CREATE TABLE `seller_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('active','expired','cancelled','pending') NOT NULL DEFAULT 'active',
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `price_paid` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_subscription_snapshots`
--

CREATE TABLE `seller_subscription_snapshots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_subscription_id` bigint(20) UNSIGNED NOT NULL,
  `plan_name` varchar(191) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `duration_days` int(11) DEFAULT NULL,
  `limits_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`limits_json`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_subscription_usages`
--

CREATE TABLE `seller_subscription_usages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `key` enum('store_limit','product_limit','role_limit','system_user_limit','variation_product_limit') NOT NULL,
  `used` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_user`
--

CREATE TABLE `seller_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_withdrawal_requests`
--

CREATE TABLE `seller_withdrawal_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL COMMENT 'Amount requested for withdrawal',
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `request_note` text DEFAULT NULL COMMENT 'Note from seller',
  `admin_remark` text DEFAULT NULL COMMENT 'Remark from admin',
  `processed_at` timestamp NULL DEFAULT NULL COMMENT 'When the request was processed',
  `processed_by` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Admin who processed the request',
  `transaction_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Related wallet transaction ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('JolBxvDom61XKnyg9OJvxvHpmmqVWn2R9HHcmRoI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOU9VS3dOOU5Vb2psM21wa0hKcXF4a0c3OWkyYkFOSW9HTmxsWWIzUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTU3OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvbGljZW5zZS9yZXZhbGlkYXRlP2ludGVuZGVkPWh0dHAlM0ElMkYlMkZsb2NhbGhvc3QlM0E4MDAwJTJGYXBpJTJGc2V0dGluZ3MlMkZmaXJlYmFzZS1jb25maWcmbWVzc2FnZT1BcHBsaWNhdGlvbiUyMGlzJTIwbm90JTIwbGljZW5zZWQuIjtzOjU6InJvdXRlIjtzOjE4OiJsaWNlbnNlLnJldmFsaWRhdGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1774935978),
('LbWt88xcmEojFrhLcB4uOPwpaSEWvopZl1FQ4ToE', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTo0OntzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL2Rhc2hib2FyZCI7czo1OiJyb3V0ZSI7czoxNToiYWRtaW4uZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo2OiJfdG9rZW4iO3M6NDA6IjY0cFpyV0FxVlBQWlNOQjNlMWE4N25aNUU2NDBqVVh0Q2N0andFNkMiO3M6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1774947536),
('OEDl6N3HiOkO9MvGO8WMZq7MRuCdVAndNJTI7xgG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmdhdHN2VGRRZ3Y4d1Y0cG04UGtqSFA0MGFMYkZMaFJ6bVR6NUdkaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTE5OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvbGljZW5zZS9yZXZhbGlkYXRlP2ludGVuZGVkPWh0dHAlM0ElMkYlMkZsb2NhbGhvc3QlM0E4MDAwJm1lc3NhZ2U9TGljZW5zZSUyMHNpZ25hdHVyZSUyMG1pc21hdGNoLiI7czo1OiJyb3V0ZSI7czoxODoibGljZW5zZS5yZXZhbGlkYXRlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774947525),
('Q6NgxVgI9vxYuemZktWvfF1I6Lr0ns0xxa6HY3yl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidlh3UE5QRGI1N1Z0Qlo5eWNwNmdsVWhoMG1SZEhYMVg4anBIMXFmeSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTE5OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvbGljZW5zZS9yZXZhbGlkYXRlP2ludGVuZGVkPWh0dHAlM0ElMkYlMkZsb2NhbGhvc3QlM0E4MDAwJm1lc3NhZ2U9TGljZW5zZSUyMHNpZ25hdHVyZSUyMG1pc21hdGNoLiI7czo1OiJyb3V0ZSI7czoxODoibGljZW5zZS5yZXZhbGlkYXRlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774939070);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `variable` varchar(191) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`variable`, `value`, `created_at`, `updated_at`) VALUES
('subscription', '{\"enableSubscription\":true,\"subscriptionHeading\":\"\",\"subscriptionDescription\":\"\"}', '2026-03-31 05:50:14', '2026-03-31 05:50:14'),
('system', '{\"appName\":\"Local Mart\",\"sellerSupportNumber\":\"7987654345\",\"sellerSupportEmail\":\"info@3fitech.com\",\"systemTimezone\":\"Asia\\/Kolkata\",\"copyrightDetails\":\"3fitech\",\"logo\":\"settings\\/logo-1774938064.png\",\"favicon\":\"settings\\/favicon-1774938064.png\",\"companyAddress\":\"Noida\",\"adminSignature\":\"\",\"enableThirdPartyStoreSync\":false,\"Shopify\":false,\"Woocommerce\":false,\"etsy\":false,\"checkoutType\":\"multi_store\",\"minimumCartAmount\":100,\"maximumItemsAllowedInCart\":999,\"lowStockLimit\":\"99\",\"maximumDistanceToNearestStore\":\"\",\"enableWallet\":false,\"welcomeWalletBalanceAmount\":100,\"sellerAppMaintenanceMode\":false,\"sellerAppMaintenanceMessage\":\"\",\"webMaintenanceMode\":false,\"webMaintenanceMessage\":\"\",\"demoMode\":false,\"adminDemoModeMessage\":\"\",\"sellerDemoModeMessage\":\"\",\"customerDemoModeMessage\":\"\",\"customerLocationDemoModeMessage\":\"\",\"deliveryBoyDemoModeMessage\":\"\",\"referEarnStatus\":false,\"referEarnMethodUser\":\"\",\"referEarnBonusUser\":\"\",\"referEarnMaximumBonusAmountUser\":\"\",\"referEarnMethodReferral\":\"\",\"referEarnBonusReferral\":\"\",\"referEarnMaximumBonusAmountReferral\":\"\",\"referEarnMinimumOrderAmount\":\"\",\"referEarnNumberOfTimesBonus\":\"\",\"currency\":\"USD\",\"currencySymbol\":\"$\",\"systemVendorType\":\"multiple\"}', '2026-03-31 05:49:12', '2026-03-31 06:21:04'),
('web', '{\"siteName\":\"Local Mart\",\"siteCopyright\":\"3fitech\",\"customerWebUrl\":\"\",\"supportNumber\":\"8745322345\",\"supportEmail\":\"info@3fitech.com\",\"address\":\"Noida\",\"shortDescription\":\"This is Local Mart.\",\"siteHeaderLogo\":\"settings\\/site-header-logo-1774939219.png\",\"siteHeaderDarkLogo\":\"settings\\/site-header-dark-logo-1774939219.png\",\"siteFooterLogo\":\"settings\\/site-footer-logo-1774939219.png\",\"siteFavicon\":\"settings\\/site-favicon-1774939219.png\",\"headerScript\":\"\",\"footerScript\":\"\",\"googleMapKey\":\"\",\"mapIframe\":\"\",\"appDownloadSection\":false,\"appSectionTitle\":\"\",\"appSectionTagline\":\"\",\"appSectionPlaystoreLink\":\"\",\"appSectionAppstoreLink\":\"\",\"appSectionShortDescription\":\"\",\"facebookLink\":\"\",\"instagramLink\":\"\",\"xLink\":\"\",\"youtubeLink\":\"\",\"shippingFeatureSection\":\"\",\"shippingFeatureSectionTitle\":\"\",\"shippingFeatureSectionDescription\":\"\",\"returnFeatureSection\":\"\",\"returnFeatureSectionTitle\":\"\",\"returnFeatureSectionDescription\":\"\",\"safetySecurityFeatureSection\":\"\",\"safetySecurityFeatureSectionTitle\":\"\",\"safetySecurityFeatureSectionDescription\":\"\",\"supportFeatureSection\":\"\",\"supportFeatureSectionTitle\":\"\",\"supportFeatureSectionDescription\":\"\",\"metaKeywords\":\"\",\"metaDescription\":\"\",\"allowedCountries\":[\"India\"],\"enableCountryValidation\":true,\"defaultLongitude\":\"31.654\",\"defaultLatitude\":\"31.899\",\"returnRefundPolicy\":\"\",\"shippingPolicy\":\"\",\"privacyPolicy\":\"\",\"termsCondition\":\"\",\"aboutUs\":\"\",\"pwaName\":\"Local Mart\",\"pwaDescription\":\"asdfghgjgfdsa\",\"pwaLogo192x192\":\"\",\"pwaLogo512x512\":\"\",\"pwaLogo144x144\":\"\"}', '2026-03-31 06:40:19', '2026-03-31 06:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_parcels`
--

CREATE TABLE `shipping_parcels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_boy_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shipment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `external_shipment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `carrier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `manifest_id` bigint(20) UNSIGNED DEFAULT NULL,
  `manifest_url` varchar(191) DEFAULT NULL,
  `service_code` varchar(191) DEFAULT NULL,
  `label_id` bigint(20) UNSIGNED DEFAULT NULL,
  `label_url` varchar(191) DEFAULT NULL,
  `invoice_url` varchar(191) DEFAULT NULL,
  `tracking_id` bigint(20) UNSIGNED NOT NULL,
  `tracking_url` varchar(191) DEFAULT NULL,
  `shipment_cost_currency` varchar(10) NOT NULL,
  `shipment_cost` decimal(10,2) NOT NULL,
  `weight` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `breadth` double DEFAULT NULL,
  `length` double DEFAULT NULL,
  `status` enum('pending','shipped','out_for_delivery','delivered') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_parcel_items`
--

CREATE TABLE `shipping_parcel_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parcel_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `quantity_shipped` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(300) NOT NULL,
  `address` varchar(191) NOT NULL,
  `city` varchar(100) NOT NULL,
  `landmark` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zipcode` varchar(20) NOT NULL,
  `country` varchar(100) NOT NULL,
  `country_code` varchar(191) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `contact_email` varchar(50) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  `timing` varchar(500) DEFAULT NULL,
  `tax_name` varchar(250) NOT NULL,
  `tax_number` varchar(250) NOT NULL,
  `bank_name` varchar(250) NOT NULL,
  `bank_branch_code` varchar(250) NOT NULL,
  `account_holder_name` varchar(250) NOT NULL,
  `account_number` varchar(250) NOT NULL,
  `routing_number` varchar(250) NOT NULL,
  `bank_account_type` enum('checking','savings') NOT NULL,
  `currency_code` varchar(191) DEFAULT NULL,
  `max_delivery_distance` double NOT NULL DEFAULT 10,
  `order_preparation_time` int(11) NOT NULL DEFAULT 15,
  `promotional_text` varchar(1024) DEFAULT NULL,
  `about_us` text DEFAULT NULL,
  `return_replacement_policy` text DEFAULT NULL,
  `refund_policy` text DEFAULT NULL,
  `terms_and_conditions` text DEFAULT NULL,
  `delivery_policy` text DEFAULT NULL,
  `domestic_shipping_charges` decimal(10,2) DEFAULT NULL,
  `international_shipping_charges` decimal(10,2) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `verification_status` enum('approved','not_approved') NOT NULL,
  `visibility_status` enum('visible','draft') NOT NULL DEFAULT 'draft',
  `fulfillment_type` enum('hyperlocal','regular','both') NOT NULL DEFAULT 'hyperlocal',
  `status` enum('online','offline') NOT NULL DEFAULT 'online',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store_inventory_logs`
--

CREATE TABLE `store_inventory_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `product_variant_id` bigint(20) UNSIGNED NOT NULL,
  `change_type` enum('add','remove','adjust') NOT NULL,
  `quantity` int(11) NOT NULL,
  `reason` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store_product_variants`
--

CREATE TABLE `store_product_variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_variant_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `sku` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `special_price` decimal(10,2) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store_zone`
--

CREATE TABLE `store_zone` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_plans`
--

CREATE TABLE `subscription_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `duration_type` enum('unlimited','days') NOT NULL DEFAULT 'unlimited',
  `duration_days` int(11) DEFAULT NULL,
  `is_free` tinyint(1) NOT NULL DEFAULT 0,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_recommended` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_plan_limits`
--

CREATE TABLE `subscription_plan_limits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `key` enum('store_limit','product_limit','role_limit','system_user_limit','variation_product_limit') NOT NULL,
  `value` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_transactions`
--

CREATE TABLE `subscription_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `seller_subscription_id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `payment_gateway` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('pending','completed','failed','cancelled') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_type_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `status` enum('open','in_progress','reopen','pending_review','resolved','closed') NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_messages`
--

CREATE TABLE `support_ticket_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `send_by` enum('admin','user') NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_types`
--

CREATE TABLE `support_ticket_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_updates`
--

CREATE TABLE `system_updates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(191) NOT NULL,
  `package_name` varchar(191) NOT NULL,
  `checksum` varchar(191) DEFAULT NULL,
  `status` enum('pending','applied','failed') NOT NULL DEFAULT 'pending',
  `applied_by` bigint(20) UNSIGNED DEFAULT NULL,
  `applied_at` timestamp NULL DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `log` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_updates`
--

INSERT INTO `system_updates` (`id`, `version`, `package_name`, `checksum`, `status`, `applied_by`, `applied_at`, `notes`, `log`, `created_at`, `updated_at`) VALUES
(1, 'unknown', 'update-v1.2.0_a2e9ff5c85fd.zip', NULL, 'failed', 1, '2026-03-31 06:25:34', NULL, '[2026-03-31 11:55:22] Extracting update package...\n[2026-03-31 11:55:34] ❌ FAILED: Update version 1.2.0 must be greater than current version 1.2.0.\n[2026-03-31 11:55:34] Restoring backup...', '2026-03-31 06:25:22', '2026-03-31 06:25:34');

-- --------------------------------------------------------

--
-- Table structure for table `tax_classes`
--

CREATE TABLE `tax_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_class_tax_rate`
--

CREATE TABLE `tax_class_tax_rate` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tax_class_id` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `rate` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `referral_code` varchar(32) DEFAULT NULL,
  `friends_code` varchar(32) DEFAULT NULL,
  `reward_points` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `country` varchar(191) DEFAULT NULL,
  `iso_2` varchar(2) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `access_panel` enum('web','admin','seller') NOT NULL DEFAULT 'web' COMMENT 'Defines the access panel for the user: web, admin, or seller',
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `mobile`, `referral_code`, `friends_code`, `reward_points`, `status`, `name`, `email`, `country`, `iso_2`, `email_verified_at`, `access_panel`, `password`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '7985078073', NULL, NULL, 0.00, 'active', 'Local Mart', 'superadmin@gmail.com', NULL, NULL, NULL, 'admin', '$2y$12$1B3Cj33/RKwVHiujaL6RKuA2mhScdrq4KS58WM14X5.fqQIZjG20K', NULL, NULL, '2026-03-31 05:43:02', '2026-03-31 06:35:17');

-- --------------------------------------------------------

--
-- Table structure for table `user_fcm_tokens`
--

CREATE TABLE `user_fcm_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `fcm_token` varchar(191) NOT NULL,
  `device_type` enum('android','ios','web') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_otps`
--

CREATE TABLE `user_otps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mobile` varchar(191) NOT NULL,
  `otp` varchar(191) NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `verified_at` timestamp NULL DEFAULT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `blocked_balance` decimal(15,2) NOT NULL DEFAULT 0.00,
  `currency_code` varchar(3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `wallet_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_type` enum('deposit','payment','refund','adjustment') NOT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency_code` varchar(3) NOT NULL DEFAULT 'USD',
  `status` enum('pending','completed','failed','cancelled','refunded','partially_refunded') NOT NULL DEFAULT 'pending',
  `transaction_reference` varchar(100) DEFAULT NULL COMMENT 'Transaction ID from payment gateway',
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_items`
--

CREATE TABLE `wishlist_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `wishlist_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `app_notifications`
--
ALTER TABLE `app_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`),
  ADD KEY `notifications_store_id_foreign` (`store_id`),
  ADD KEY `notifications_order_id_foreign` (`order_id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`),
  ADD KEY `banners_product_id_foreign` (`product_id`),
  ADD KEY `banners_category_id_foreign` (`category_id`),
  ADD KEY `banners_brand_id_foreign` (`brand_id`),
  ADD KEY `banners_scope_id_foreign` (`scope_id`),
  ADD KEY `banners_scope_type_scope_id_index` (`scope_type`,`scope_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`),
  ADD KEY `brands_scope_id_foreign` (`scope_id`),
  ADD KEY `brands_scope_type_scope_id_index` (`scope_type`,`scope_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `carts_uuid_unique` (`uuid`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_items_product_id_foreign` (`product_id`),
  ADD KEY `cart_items_product_variant_id_foreign` (`product_variant_id`),
  ADD KEY `cart_items_store_id_foreign` (`store_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_sort_order_index` (`sort_order`);

--
-- Indexes for table `category_featured_section`
--
ALTER TABLE `category_featured_section`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_featured_section_category_id_featured_section_id_unique` (`category_id`,`featured_section_id`),
  ADD KEY `category_featured_section_category_id_index` (`category_id`),
  ADD KEY `category_featured_section_featured_section_id_index` (`featured_section_id`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`category_id`,`product_id`),
  ADD KEY `category_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `category_product_conditions`
--
ALTER TABLE `category_product_conditions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_product_conditions_category_id_foreign` (`category_id`),
  ADD KEY `category_product_conditions_product_condition_id_foreign` (`product_condition_id`);

--
-- Indexes for table `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `collections_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `collections_slug_unique` (`slug`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_product_fields`
--
ALTER TABLE `custom_product_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `custom_product_fields_uuid_unique` (`uuid`);

--
-- Indexes for table `custom_product_sections`
--
ALTER TABLE `custom_product_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `custom_product_sections_uuid_unique` (`uuid`),
  ADD KEY `custom_product_sections_product_id_sort_order_index` (`product_id`,`sort_order`);

--
-- Indexes for table `custom_product_section_field`
--
ALTER TABLE `custom_product_section_field`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `custom_section_field_unique` (`custom_product_section_id`,`custom_product_field_id`),
  ADD KEY `custom_product_section_field_custom_product_field_id_foreign` (`custom_product_field_id`),
  ADD KEY `cpsf_section_sort_idx` (`custom_product_section_id`,`sort_order`);

--
-- Indexes for table `delivery_boys`
--
ALTER TABLE `delivery_boys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_boys_delivery_zone_id_foreign` (`delivery_zone_id`);

--
-- Indexes for table `delivery_boy_assignments`
--
ALTER TABLE `delivery_boy_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_boy_assignments_order_id_foreign` (`order_id`),
  ADD KEY `delivery_boy_assignments_delivery_boy_id_foreign` (`delivery_boy_id`),
  ADD KEY `delivery_boy_assignments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `delivery_boy_assignments_order_item_id_foreign` (`order_item_id`),
  ADD KEY `delivery_boy_assignments_return_id_foreign` (`return_id`);

--
-- Indexes for table `delivery_boy_cash_transactions`
--
ALTER TABLE `delivery_boy_cash_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dbc_assignment` (`delivery_boy_assignment_id`),
  ADD KEY `fk_dbc_order` (`order_id`),
  ADD KEY `fk_dbc_boy` (`delivery_boy_id`);

--
-- Indexes for table `delivery_boy_locations`
--
ALTER TABLE `delivery_boy_locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_boy_locations_delivery_boy_id_unique` (`delivery_boy_id`);

--
-- Indexes for table `delivery_boy_withdrawal_requests`
--
ALTER TABLE `delivery_boy_withdrawal_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_boy_withdrawal_requests_processed_by_foreign` (`processed_by`),
  ADD KEY `delivery_boy_withdrawal_requests_user_id_index` (`user_id`),
  ADD KEY `delivery_boy_withdrawal_requests_delivery_boy_id_index` (`delivery_boy_id`),
  ADD KEY `delivery_boy_withdrawal_requests_status_index` (`status`);

--
-- Indexes for table `delivery_feedback`
--
ALTER TABLE `delivery_feedback`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_feedback_slug_unique` (`slug`),
  ADD KEY `delivery_feedback_user_id_foreign` (`user_id`),
  ADD KEY `delivery_feedback_order_id_foreign` (`order_id`),
  ADD KEY `delivery_feedback_delivery_boy_id_foreign` (`delivery_boy_id`);

--
-- Indexes for table `delivery_time_slots`
--
ALTER TABLE `delivery_time_slots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_time_slots_store_id_foreign` (`store_id`);

--
-- Indexes for table `delivery_zones`
--
ALTER TABLE `delivery_zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_zones_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `featured_sections`
--
ALTER TABLE `featured_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `featured_sections_slug_unique` (`slug`),
  ADD KEY `featured_sections_sort_order_index` (`sort_order`),
  ADD KEY `featured_sections_slug_index` (`slug`),
  ADD KEY `featured_sections_section_type_index` (`section_type`),
  ADD KEY `featured_sections_scope_id_foreign` (`scope_id`);

--
-- Indexes for table `following_sellers`
--
ALTER TABLE `following_sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gift_cards`
--
ALTER TABLE `gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gift_cards_seller_id_foreign` (`seller_id`);

--
-- Indexes for table `global_product_attributes`
--
ALTER TABLE `global_product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `global_product_attributes_slug_unique` (`slug`),
  ADD KEY `global_product_attributes_seller_id_foreign` (`seller_id`);

--
-- Indexes for table `global_product_attribute_values`
--
ALTER TABLE `global_product_attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `global_product_attribute_values_global_attribute_id_foreign` (`global_attribute_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `orders_slug_unique` (`slug`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_delivery_time_slot_id_foreign` (`delivery_time_slot_id`),
  ADD KEY `orders_delivery_boy_id_foreign` (`delivery_boy_id`),
  ADD KEY `orders_delivery_zone_id_foreign` (`delivery_zone_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_product_variant_id_foreign` (`product_variant_id`),
  ADD KEY `order_items_store_id_foreign` (`store_id`);

--
-- Indexes for table `order_item_returns`
--
ALTER TABLE `order_item_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_item_returns_order_item_id_foreign` (`order_item_id`),
  ADD KEY `order_item_returns_order_id_foreign` (`order_id`),
  ADD KEY `order_item_returns_user_id_foreign` (`user_id`),
  ADD KEY `order_item_returns_seller_id_foreign` (`seller_id`),
  ADD KEY `order_item_returns_store_id_foreign` (`store_id`),
  ADD KEY `order_item_returns_delivery_boy_id_foreign` (`delivery_boy_id`);

--
-- Indexes for table `order_payment_transactions`
--
ALTER TABLE `order_payment_transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_payment_transactions_uuid_unique` (`uuid`),
  ADD KEY `order_payment_transactions_order_id_foreign` (`order_id`),
  ADD KEY `order_payment_transactions_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_promo_line`
--
ALTER TABLE `order_promo_line`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_promo_line_order_id_foreign` (`order_id`),
  ADD KEY `order_promo_line_promo_id_foreign` (`promo_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD UNIQUE KEY `products_product_identity_unique` (`product_identity`),
  ADD KEY `products_seller_id_foreign` (`seller_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_product_condition_id_foreign` (`product_condition_id`);

--
-- Indexes for table `product_conditions`
--
ALTER TABLE `product_conditions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_conditions_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `product_conditions_slug_unique` (`slug`),
  ADD KEY `product_conditions_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_faqs`
--
ALTER TABLE `product_faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_faqs_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_taxes`
--
ALTER TABLE `product_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_taxes_product_id_foreign` (`product_id`),
  ADD KEY `product_taxes_tax_class_id_foreign` (`tax_class_id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_variants_slug_unique` (`slug`),
  ADD KEY `product_variants_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_variant_attributes`
--
ALTER TABLE `product_variant_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variant_attributes_product_variant_id_foreign` (`product_variant_id`),
  ADD KEY `product_variant_attributes_global_attribute_id_foreign` (`global_attribute_id`),
  ADD KEY `product_variant_attributes_global_attribute_value_id_foreign` (`global_attribute_value_id`),
  ADD KEY `product_variant_attributes_product_id_foreign` (`product_id`);

--
-- Indexes for table `promo`
--
ALTER TABLE `promo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `promo_code_unique` (`code`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reviews_slug_unique` (`slug`),
  ADD UNIQUE KEY `reviews_order_item_id_unique` (`order_item_id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_team_id_guard_name_name_unique` (`team_id`,`guard_name`,`name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_feedback`
--
ALTER TABLE `seller_feedback`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `seller_feedback_slug_unique` (`slug`),
  ADD UNIQUE KEY `seller_feedback_order_item_id_unique` (`order_item_id`),
  ADD KEY `seller_feedback_user_id_foreign` (`user_id`),
  ADD KEY `seller_feedback_seller_id_foreign` (`seller_id`),
  ADD KEY `seller_feedback_order_id_foreign` (`order_id`),
  ADD KEY `seller_feedback_store_id_foreign` (`store_id`);

--
-- Indexes for table `seller_orders`
--
ALTER TABLE `seller_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_orders_order_id_foreign` (`order_id`),
  ADD KEY `seller_orders_seller_id_foreign` (`seller_id`);

--
-- Indexes for table `seller_order_items`
--
ALTER TABLE `seller_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_order_items_seller_order_id_foreign` (`seller_order_id`),
  ADD KEY `seller_order_items_product_id_foreign` (`product_id`),
  ADD KEY `seller_order_items_product_variant_id_foreign` (`product_variant_id`),
  ADD KEY `seller_order_items_order_item_id_foreign` (`order_item_id`);

--
-- Indexes for table `seller_statements`
--
ALTER TABLE `seller_statements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_statements_seller_id_posted_at_index` (`seller_id`,`posted_at`),
  ADD KEY `seller_statements_order_id_index` (`order_id`),
  ADD KEY `seller_statements_order_item_id_index` (`order_item_id`),
  ADD KEY `seller_statements_return_id_index` (`return_id`),
  ADD KEY `seller_statements_entry_type_index` (`entry_type`),
  ADD KEY `seller_statements_seller_id_settlement_status_index` (`seller_id`,`settlement_status`),
  ADD KEY `seller_statements_settlement_status_posted_at_index` (`settlement_status`,`posted_at`);

--
-- Indexes for table `seller_subscriptions`
--
ALTER TABLE `seller_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_subscriptions_seller_id_foreign` (`seller_id`),
  ADD KEY `seller_subscriptions_plan_id_foreign` (`plan_id`);

--
-- Indexes for table `seller_subscription_snapshots`
--
ALTER TABLE `seller_subscription_snapshots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_subscription_snapshots_seller_subscription_id_foreign` (`seller_subscription_id`);

--
-- Indexes for table `seller_subscription_usages`
--
ALTER TABLE `seller_subscription_usages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_subscription_usages_seller_id_foreign` (`seller_id`);

--
-- Indexes for table `seller_user`
--
ALTER TABLE `seller_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_seller_user` (`user_id`,`seller_id`),
  ADD KEY `seller_user_seller_id_foreign` (`seller_id`);

--
-- Indexes for table `seller_withdrawal_requests`
--
ALTER TABLE `seller_withdrawal_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_withdrawal_requests_processed_by_foreign` (`processed_by`),
  ADD KEY `seller_withdrawal_requests_user_id_index` (`user_id`),
  ADD KEY `seller_withdrawal_requests_seller_id_index` (`seller_id`),
  ADD KEY `seller_withdrawal_requests_status_index` (`status`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`variable`);

--
-- Indexes for table `shipping_parcels`
--
ALTER TABLE `shipping_parcels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipping_parcels_order_id_foreign` (`order_id`),
  ADD KEY `shipping_parcels_store_id_foreign` (`store_id`),
  ADD KEY `shipping_parcels_delivery_boy_id_foreign` (`delivery_boy_id`);

--
-- Indexes for table `shipping_parcel_items`
--
ALTER TABLE `shipping_parcel_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipping_parcel_items_parcel_id_foreign` (`parcel_id`),
  ADD KEY `shipping_parcel_items_order_item_id_foreign` (`order_item_id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stores_slug_unique` (`slug`),
  ADD KEY `stores_seller_id_foreign` (`seller_id`);

--
-- Indexes for table `store_inventory_logs`
--
ALTER TABLE `store_inventory_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_inventory_logs_store_id_foreign` (`store_id`),
  ADD KEY `store_inventory_logs_product_variant_id_foreign` (`product_variant_id`);

--
-- Indexes for table `store_product_variants`
--
ALTER TABLE `store_product_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_product_variants_product_variant_id_foreign` (`product_variant_id`),
  ADD KEY `store_product_variants_store_id_foreign` (`store_id`);

--
-- Indexes for table `store_zone`
--
ALTER TABLE `store_zone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_zone_store_id_foreign` (`store_id`),
  ADD KEY `store_zone_zone_id_foreign` (`zone_id`);

--
-- Indexes for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_plan_limits`
--
ALTER TABLE `subscription_plan_limits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscription_plan_limits_plan_id_foreign` (`plan_id`);

--
-- Indexes for table `subscription_transactions`
--
ALTER TABLE `subscription_transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_transactions_uuid_unique` (`uuid`),
  ADD KEY `subscription_transactions_seller_id_foreign` (`seller_id`),
  ADD KEY `subscription_transactions_seller_subscription_id_foreign` (`seller_subscription_id`),
  ADD KEY `subscription_transactions_plan_id_foreign` (`plan_id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `support_tickets_slug_unique` (`slug`),
  ADD KEY `support_tickets_ticket_type_id_foreign` (`ticket_type_id`),
  ADD KEY `support_tickets_user_id_foreign` (`user_id`);

--
-- Indexes for table `support_ticket_messages`
--
ALTER TABLE `support_ticket_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_ticket_messages_user_id_foreign` (`user_id`),
  ADD KEY `support_ticket_messages_ticket_id_foreign` (`ticket_id`);

--
-- Indexes for table `support_ticket_types`
--
ALTER TABLE `support_ticket_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_updates`
--
ALTER TABLE `system_updates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_updates_version_index` (`version`);

--
-- Indexes for table `tax_classes`
--
ALTER TABLE `tax_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_class_tax_rate`
--
ALTER TABLE `tax_class_tax_rate`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tax_class_tax_rate_tax_class_id_tax_rate_id_unique` (`tax_class_id`,`tax_rate_id`),
  ADD KEY `tax_class_tax_rate_tax_rate_id_foreign` (`tax_rate_id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_mobile_unique` (`mobile`);

--
-- Indexes for table `user_fcm_tokens`
--
ALTER TABLE `user_fcm_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_fcm_tokens_fcm_token_unique` (`fcm_token`),
  ADD KEY `user_fcm_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_otps`
--
ALTER TABLE `user_otps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_otps_mobile_expires_at_index` (`mobile`,`expires_at`),
  ADD KEY `user_otps_mobile_index` (`mobile`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallets_user_id_foreign` (`user_id`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wallet_transactions_transaction_reference_unique` (`transaction_reference`),
  ADD KEY `wallet_transactions_wallet_id_foreign` (`wallet_id`),
  ADD KEY `wallet_transactions_user_id_foreign` (`user_id`),
  ADD KEY `wallet_transactions_order_id_foreign` (`order_id`),
  ADD KEY `wallet_transactions_store_id_foreign` (`store_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wishlists_user_id_slug_unique` (`user_id`,`slug`);

--
-- Indexes for table `wishlist_items`
--
ALTER TABLE `wishlist_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_items_wishlist_id_foreign` (`wishlist_id`),
  ADD KEY `wishlist_items_product_id_foreign` (`product_id`),
  ADD KEY `wishlist_items_product_variant_id_foreign` (`product_variant_id`),
  ADD KEY `wishlist_items_store_id_foreign` (`store_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_notifications`
--
ALTER TABLE `app_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_featured_section`
--
ALTER TABLE `category_featured_section`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_product_conditions`
--
ALTER TABLE `category_product_conditions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `collections`
--
ALTER TABLE `collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `custom_product_fields`
--
ALTER TABLE `custom_product_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_product_sections`
--
ALTER TABLE `custom_product_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_product_section_field`
--
ALTER TABLE `custom_product_section_field`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_boys`
--
ALTER TABLE `delivery_boys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_boy_assignments`
--
ALTER TABLE `delivery_boy_assignments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_boy_cash_transactions`
--
ALTER TABLE `delivery_boy_cash_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_boy_locations`
--
ALTER TABLE `delivery_boy_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_boy_withdrawal_requests`
--
ALTER TABLE `delivery_boy_withdrawal_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_feedback`
--
ALTER TABLE `delivery_feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_time_slots`
--
ALTER TABLE `delivery_time_slots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_zones`
--
ALTER TABLE `delivery_zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `featured_sections`
--
ALTER TABLE `featured_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `following_sellers`
--
ALTER TABLE `following_sellers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gift_cards`
--
ALTER TABLE `gift_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `global_product_attributes`
--
ALTER TABLE `global_product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `global_product_attribute_values`
--
ALTER TABLE `global_product_attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_item_returns`
--
ALTER TABLE `order_item_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_payment_transactions`
--
ALTER TABLE `order_payment_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_promo_line`
--
ALTER TABLE `order_promo_line`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_conditions`
--
ALTER TABLE `product_conditions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_faqs`
--
ALTER TABLE `product_faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_taxes`
--
ALTER TABLE `product_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variant_attributes`
--
ALTER TABLE `product_variant_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promo`
--
ALTER TABLE `promo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_feedback`
--
ALTER TABLE `seller_feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_orders`
--
ALTER TABLE `seller_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_order_items`
--
ALTER TABLE `seller_order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_statements`
--
ALTER TABLE `seller_statements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_subscriptions`
--
ALTER TABLE `seller_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_subscription_snapshots`
--
ALTER TABLE `seller_subscription_snapshots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_subscription_usages`
--
ALTER TABLE `seller_subscription_usages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_user`
--
ALTER TABLE `seller_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_withdrawal_requests`
--
ALTER TABLE `seller_withdrawal_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_parcels`
--
ALTER TABLE `shipping_parcels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_parcel_items`
--
ALTER TABLE `shipping_parcel_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_inventory_logs`
--
ALTER TABLE `store_inventory_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_product_variants`
--
ALTER TABLE `store_product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_zone`
--
ALTER TABLE `store_zone`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_plans`
--
ALTER TABLE `subscription_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_plan_limits`
--
ALTER TABLE `subscription_plan_limits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_transactions`
--
ALTER TABLE `subscription_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_messages`
--
ALTER TABLE `support_ticket_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_types`
--
ALTER TABLE `support_ticket_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_updates`
--
ALTER TABLE `system_updates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tax_classes`
--
ALTER TABLE `tax_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_class_tax_rate`
--
ALTER TABLE `tax_class_tax_rate`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_fcm_tokens`
--
ALTER TABLE `user_fcm_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_otps`
--
ALTER TABLE `user_otps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlist_items`
--
ALTER TABLE `wishlist_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `app_notifications`
--
ALTER TABLE `app_notifications`
  ADD CONSTRAINT `notifications_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `notifications_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `banners`
--
ALTER TABLE `banners`
  ADD CONSTRAINT `banners_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `banners_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `banners_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `banners_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `category_featured_section`
--
ALTER TABLE `category_featured_section`
  ADD CONSTRAINT `category_featured_section_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_featured_section_featured_section_id_foreign` FOREIGN KEY (`featured_section_id`) REFERENCES `featured_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_product_conditions`
--
ALTER TABLE `category_product_conditions`
  ADD CONSTRAINT `category_product_conditions_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_product_conditions_product_condition_id_foreign` FOREIGN KEY (`product_condition_id`) REFERENCES `product_conditions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `custom_product_sections`
--
ALTER TABLE `custom_product_sections`
  ADD CONSTRAINT `custom_product_sections_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `custom_product_section_field`
--
ALTER TABLE `custom_product_section_field`
  ADD CONSTRAINT `custom_product_section_field_custom_product_field_id_foreign` FOREIGN KEY (`custom_product_field_id`) REFERENCES `custom_product_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `custom_product_section_field_custom_product_section_id_foreign` FOREIGN KEY (`custom_product_section_id`) REFERENCES `custom_product_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `delivery_boys`
--
ALTER TABLE `delivery_boys`
  ADD CONSTRAINT `delivery_boys_delivery_zone_id_foreign` FOREIGN KEY (`delivery_zone_id`) REFERENCES `delivery_zones` (`id`);

--
-- Constraints for table `delivery_boy_assignments`
--
ALTER TABLE `delivery_boy_assignments`
  ADD CONSTRAINT `delivery_boy_assignments_delivery_boy_id_foreign` FOREIGN KEY (`delivery_boy_id`) REFERENCES `delivery_boys` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_boy_assignments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_boy_assignments_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_boy_assignments_return_id_foreign` FOREIGN KEY (`return_id`) REFERENCES `order_item_returns` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_boy_assignments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `wallet_transactions` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `delivery_boy_cash_transactions`
--
ALTER TABLE `delivery_boy_cash_transactions`
  ADD CONSTRAINT `fk_dbc_assignment` FOREIGN KEY (`delivery_boy_assignment_id`) REFERENCES `delivery_boy_assignments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_dbc_boy` FOREIGN KEY (`delivery_boy_id`) REFERENCES `delivery_boys` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_dbc_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `delivery_boy_withdrawal_requests`
--
ALTER TABLE `delivery_boy_withdrawal_requests`
  ADD CONSTRAINT `delivery_boy_withdrawal_requests_delivery_boy_id_foreign` FOREIGN KEY (`delivery_boy_id`) REFERENCES `delivery_boys` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_boy_withdrawal_requests_processed_by_foreign` FOREIGN KEY (`processed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `delivery_boy_withdrawal_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `delivery_feedback`
--
ALTER TABLE `delivery_feedback`
  ADD CONSTRAINT `delivery_feedback_delivery_boy_id_foreign` FOREIGN KEY (`delivery_boy_id`) REFERENCES `delivery_boys` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_feedback_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_feedback_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `delivery_time_slots`
--
ALTER TABLE `delivery_time_slots`
  ADD CONSTRAINT `delivery_time_slots_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `featured_sections`
--
ALTER TABLE `featured_sections`
  ADD CONSTRAINT `featured_sections_scope_id_foreign` FOREIGN KEY (`scope_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `gift_cards`
--
ALTER TABLE `gift_cards`
  ADD CONSTRAINT `gift_cards_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `global_product_attributes`
--
ALTER TABLE `global_product_attributes`
  ADD CONSTRAINT `global_product_attributes_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`);

--
-- Constraints for table `global_product_attribute_values`
--
ALTER TABLE `global_product_attribute_values`
  ADD CONSTRAINT `global_product_attribute_values_global_attribute_id_foreign` FOREIGN KEY (`global_attribute_id`) REFERENCES `global_product_attributes` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_delivery_boy_id_foreign` FOREIGN KEY (`delivery_boy_id`) REFERENCES `delivery_boys` (`id`),
  ADD CONSTRAINT `orders_delivery_time_slot_id_foreign` FOREIGN KEY (`delivery_time_slot_id`) REFERENCES `delivery_time_slots` (`id`),
  ADD CONSTRAINT `orders_delivery_zone_id_foreign` FOREIGN KEY (`delivery_zone_id`) REFERENCES `delivery_zones` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_item_returns`
--
ALTER TABLE `order_item_returns`
  ADD CONSTRAINT `order_item_returns_delivery_boy_id_foreign` FOREIGN KEY (`delivery_boy_id`) REFERENCES `delivery_boys` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_item_returns_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_item_returns_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_item_returns_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_item_returns_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_item_returns_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_payment_transactions`
--
ALTER TABLE `order_payment_transactions`
  ADD CONSTRAINT `order_payment_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_payment_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_promo_line`
--
ALTER TABLE `order_promo_line`
  ADD CONSTRAINT `order_promo_line_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_promo_line_promo_id_foreign` FOREIGN KEY (`promo_id`) REFERENCES `promo` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_product_condition_id_foreign` FOREIGN KEY (`product_condition_id`) REFERENCES `product_conditions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_conditions`
--
ALTER TABLE `product_conditions`
  ADD CONSTRAINT `product_conditions_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_faqs`
--
ALTER TABLE `product_faqs`
  ADD CONSTRAINT `product_faqs_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_taxes`
--
ALTER TABLE `product_taxes`
  ADD CONSTRAINT `product_taxes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_taxes_tax_class_id_foreign` FOREIGN KEY (`tax_class_id`) REFERENCES `tax_classes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variant_attributes`
--
ALTER TABLE `product_variant_attributes`
  ADD CONSTRAINT `product_variant_attributes_global_attribute_id_foreign` FOREIGN KEY (`global_attribute_id`) REFERENCES `global_product_attributes` (`id`),
  ADD CONSTRAINT `product_variant_attributes_global_attribute_value_id_foreign` FOREIGN KEY (`global_attribute_value_id`) REFERENCES `global_product_attribute_values` (`id`),
  ADD CONSTRAINT `product_variant_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_variant_attributes_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `seller_feedback`
--
ALTER TABLE `seller_feedback`
  ADD CONSTRAINT `seller_feedback_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `seller_feedback_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `seller_feedback_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `seller_feedback_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `seller_feedback_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `seller_orders`
--
ALTER TABLE `seller_orders`
  ADD CONSTRAINT `seller_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `seller_orders_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `seller_order_items`
--
ALTER TABLE `seller_order_items`
  ADD CONSTRAINT `seller_order_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `seller_order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `seller_order_items_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `seller_order_items_seller_order_id_foreign` FOREIGN KEY (`seller_order_id`) REFERENCES `seller_orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `seller_statements`
--
ALTER TABLE `seller_statements`
  ADD CONSTRAINT `seller_statements_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `seller_statements_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `seller_statements_return_id_foreign` FOREIGN KEY (`return_id`) REFERENCES `order_item_returns` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `seller_statements_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `seller_subscriptions`
--
ALTER TABLE `seller_subscriptions`
  ADD CONSTRAINT `seller_subscriptions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `subscription_plans` (`id`),
  ADD CONSTRAINT `seller_subscriptions_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `seller_subscription_snapshots`
--
ALTER TABLE `seller_subscription_snapshots`
  ADD CONSTRAINT `seller_subscription_snapshots_seller_subscription_id_foreign` FOREIGN KEY (`seller_subscription_id`) REFERENCES `seller_subscriptions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `seller_subscription_usages`
--
ALTER TABLE `seller_subscription_usages`
  ADD CONSTRAINT `seller_subscription_usages_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `seller_user`
--
ALTER TABLE `seller_user`
  ADD CONSTRAINT `seller_user_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `seller_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `seller_withdrawal_requests`
--
ALTER TABLE `seller_withdrawal_requests`
  ADD CONSTRAINT `seller_withdrawal_requests_processed_by_foreign` FOREIGN KEY (`processed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `seller_withdrawal_requests_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `seller_withdrawal_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipping_parcels`
--
ALTER TABLE `shipping_parcels`
  ADD CONSTRAINT `shipping_parcels_delivery_boy_id_foreign` FOREIGN KEY (`delivery_boy_id`) REFERENCES `delivery_boys` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `shipping_parcels_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shipping_parcels_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipping_parcel_items`
--
ALTER TABLE `shipping_parcel_items`
  ADD CONSTRAINT `shipping_parcel_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shipping_parcel_items_parcel_id_foreign` FOREIGN KEY (`parcel_id`) REFERENCES `shipping_parcels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `stores_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `store_inventory_logs`
--
ALTER TABLE `store_inventory_logs`
  ADD CONSTRAINT `store_inventory_logs_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `store_inventory_logs_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `store_product_variants`
--
ALTER TABLE `store_product_variants`
  ADD CONSTRAINT `store_product_variants_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `store_product_variants_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `store_zone`
--
ALTER TABLE `store_zone`
  ADD CONSTRAINT `store_zone_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `store_zone_zone_id_foreign` FOREIGN KEY (`zone_id`) REFERENCES `delivery_zones` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscription_plan_limits`
--
ALTER TABLE `subscription_plan_limits`
  ADD CONSTRAINT `subscription_plan_limits_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `subscription_plans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscription_transactions`
--
ALTER TABLE `subscription_transactions`
  ADD CONSTRAINT `subscription_transactions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `subscription_plans` (`id`),
  ADD CONSTRAINT `subscription_transactions_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subscription_transactions_seller_subscription_id_foreign` FOREIGN KEY (`seller_subscription_id`) REFERENCES `seller_subscriptions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD CONSTRAINT `support_tickets_ticket_type_id_foreign` FOREIGN KEY (`ticket_type_id`) REFERENCES `support_ticket_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `support_tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `support_ticket_messages`
--
ALTER TABLE `support_ticket_messages`
  ADD CONSTRAINT `support_ticket_messages_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `support_ticket_messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tax_class_tax_rate`
--
ALTER TABLE `tax_class_tax_rate`
  ADD CONSTRAINT `tax_class_tax_rate_tax_class_id_foreign` FOREIGN KEY (`tax_class_id`) REFERENCES `tax_classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tax_class_tax_rate_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_fcm_tokens`
--
ALTER TABLE `user_fcm_tokens`
  ADD CONSTRAINT `user_fcm_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD CONSTRAINT `wallet_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `wallet_transactions_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`),
  ADD CONSTRAINT `wallet_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `wallet_transactions_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`);

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist_items`
--
ALTER TABLE `wishlist_items`
  ADD CONSTRAINT `wishlist_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_items_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_items_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_items_wishlist_id_foreign` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlists` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
