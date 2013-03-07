<?php

// Make sure we are called from index.php
if (!defined('SECURITY'))
    die('Hacking attempt');

// What is our overall theme
define('THEME', 'bf3stats');

// Our include directory for additional features
define('INCLUDE_DIR', 'include');

// Our class directory
define('CLASS_DIR', INCLUDE_DIR . '/classes');

// Our pages directory which takes care of
define('PAGES_DIR', INCLUDE_DIR . '/pages');

// Set debugging level for our debug class
define('DEBUG', 6);

// Our players to parse

$config = array(
    'platform' => 'pc',             // default platform
    'timestamp' => '%d.%m.%Y',      // Date display format
    'cache' => array(
        'memcache' => false,         // set to true to enable memcache instead of diskcache
        'host' => 'localhost',      // Memcache host
        'port' => 11211,            // Memcache port, 11211 is default
        'expire' => 600,            // Expire time, default 10 minutes (600s)
        'key' => 'bf3stats',        // Cache key to retrieve and store API stats
        'smarty' => false,          // Use the smarty file cache as well?
    ),
    'players' => array(
        'TheSerapher' => array(
            'bought' => "2011-12-12",
        ),
        'aussieburger',
    ),
    'stats_options' => array(       // Set to everything required with default template
        'clear' => true,
        'all' => false,
        'scores' => true,
        'global' => true,
        'weapons' => true,
        'equipment' => true,
        'equipmentOnlyUsed' => true,
        'teams' => true,
        'kits' => true,
        'vehicles' => true,
        'vehiclesInfo' => true,
        'awards' => true,
        'rank' => true,
        'awardsInfo' => true,
        'imgInfo' => true,
        'weaponsStars' => true,
        'weaponsInfo' => true,
        'weaponsOnlyUsed' => true,
        'kitsStars' => true,
        'gamemodes' => true,
    ),
    'servicestars' => array(        // Score required to gain a Servicestar
        'assault' => 220000,
        'engineer' => 145000,
        'support' => 170000,
        'recon' => 195000,
    ),
    'kits' => array(                // Kits available in Battlefield 3
        'assault',
        'engineer',
        'support',
        'recon',
    ),
    'BF3APIIdent' => '',            // Used for updates
    'BF3APIKey' => '',              // Used for updates
);
?>
