<?php

// Make sure we are called from index.php
if (!defined('SECURITY'))
    die('Hacking attempt');

function get_stats() {
    // Simple function to update our cached statistics data
    global $cache, $debug, $bf3stats, $config;
    
    $stats_cache = $cache->get($config['cache']['key']);

    if (!$stats_cache) {
        $debug->append("No cached data found, refreshing and storing in cache", 1);
        if ($bf3stats->load_data()) {
            $stats = $bf3stats->get_stats();
            $cache->set($config['cache']['key'], $stats, false, $config['cache']['expire']);
        } else {
            $smarty->assign("ERROR", "Unable to fetch data through bf3stats API, please try again later. Error: " . $bf3stats->get_last_error());
        }
    } else {
        $debug->append("Using cached data", 1);
        $stats = $stats_cache;
    }
    return $stats;
}
?>
