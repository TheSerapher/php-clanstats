<?php

// Make sure we are called from index.php
if (!defined('SECURITY'))
    die('Hacking attempt');

if (isset($_REQUEST['player1']) && isset($_REQUEST['player2'])) {
    $stats = get_stats();

    $smarty->assign("PLAYER1", $stats[$_REQUEST['player1']]);
    $smarty->assign("PLAYER2", $stats[$_REQUEST['player2']]);
}

foreach ($config['players'] as $player => $data) {
    if (is_array($data)) {
        $players[] = $player;
    } else {
        $players[] = $data;
    }
}
$smarty->assign("PLAYERS", $players);
$smarty->assign("PLATFORM", $config['platform']);
$smarty->assign("TIMESTAMP", $config['timestamp']);

// Tempalte specifics
$smarty->assign("CONTENT", "default.tpl");
?>