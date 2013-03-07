<?php

define('SECURITY', 1); // so we can load our files

if (php_sapi_name() != 'cli' && !empty($_SERVER['REMOTE_ADDR'])) {
    die("Hack attempt");
}

// Disabled PHP error reporting to console
error_reporting(0);

// Include our configuration (holding defines for the requires)
require_once('include/config/global.inc.php');
require_once('include/config/rankpoints.inc.php');

// Load Classes, they name defines the $ variable used
// We include all needed files here, even though our templates could load them themself
// Following includes need the debugger
require_once(CLASS_DIR . '/debug.class.php');
require_once(CLASS_DIR . '/bf3stats.class.php');
require_once(CLASS_DIR . '/compare.class.php');
require_once(INCLUDE_DIR . '/cache.inc.php'); // handles loading of $cache object
require_once(INCLUDE_DIR . '/smarty.inc.php'); // handles loading of $cache object

$stats_cache = $cache->get($config['cache']['key']);

if (!$stats_cache) {
    if ($bf3stats->load_data()) {
        $stats = $bf3stats->get_stats();
        $cache->set($config['cache']['key'], $stats, false, $config['cache']['expire']);
    }
} else {
    $stats = $stats_cache;
}

$cachereset = false;
$update_done = 0;
$update_left = "NA";
$updated_players = $cache->get('updated_players');

foreach ($stats as $name => $data) {
    if (in_array($name, $updated_players)) {
        // Only run the update if not found in cache
        echo "Skipped : $name - already updated in the past hour." . PHP_EOL;
        continue;
    }
    if ($data['date_update'] <= time() - (2 * 60 * 60)) {
        if ($data['checkstate'] != "nochange") {
            echo "Not updated : $name - nochange according to API." . PHP_EOL;
            continue;
        }
        $cachereset = true;
        $data = $bf3stats->update_player($name);
        // Add player to cache, stored later
        $updated_players[] = $name;

        $update_left = $data['update_left'];
        if ($data['task']['state'] != "finished") {
            $update_done++;
        }
        if ($data['update_left'] == 0) {
            echo "No more update slots left." . PHP_EOL;
            break;
        }
    }
}

// Store new updated players list
$cache->set('updated_players', $updated_players, false, 3600);

echo "$update_left API updates left." . PHP_EOL;
echo "$update_done players updated." . PHP_EOL;

if ($cachereset) {
    $cache->delete($config['cache']['key']);
}
?>