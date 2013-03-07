<?php

// Make sure we are called from index.php
if (!defined('SECURITY'))
    die('Hacking attempt');

$stats = get_stats();

if ($_REQUEST['sort']) {
    $debug->append("Custom sort row: " . $_REQUEST['sort'], 2);
    uasort($stats, array(new compare($_REQUEST['sort'], $_REQUEST['order']), "cmp__"));
} else {
    uasort($stats, array(new compare('score', 'desc'), "cmp__"));
}

// var_dump($stats);

$smarty->assign("PLATFORM", $config['platform']);
$smarty->assign("TIMESTAMP", $config['timestamp']);
$smarty->assign("STATS", $stats);
$smarty->assign("KITS", $config['kits']);

// Tempalte specifics
$smarty->assign("CONTENT", "default.tpl");
?>