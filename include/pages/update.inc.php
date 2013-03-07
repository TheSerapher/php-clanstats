<?php

// Make sure we are called from index.php
if (!defined('SECURITY'))
    die('Hacking attempt');


if ($bf3stats->load_data()) {
    $stats = $bf3stats->get_stats();
    $cache->set($config['cache']['key'], $stats, false, $config['cache']['expire']);
} else {
    $smarty->assign("ERROR", "Unable to fetch data through bf3stats API, please try again later. Error: " . $bf3stats->get_last_error());
}

// Tempalte specifics
$smarty->assign("CONTENT", "update.tpl");
?>
