<?php

// Make sure we are called from index.php
if (!defined('SECURITY'))
    die('Hacking attempt');

$smarty->caching = $config['cache']['smarty'];

if ($config['cache']['memcache']) {
    $cache = new Memcache();
    $cache->connect($config['cache']['host'], $config['cache']['port']) or die("Unable to conenct to memcache. Either disable memcache in the configuration or start the service.");
    $debug->append("Memcache enabled", 1);
} else {
    $debug->append("Memcache disabled by configuration, Using disk cache", 1);
    include('classes/diskcache.class.php');
}
?>