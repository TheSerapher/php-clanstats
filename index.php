<?php

// Our security check
define("SECURITY", 1);

// Start a session
session_start();
$session_id = session_id();

// Include our configuration (holding defines for the requires)
require_once('include/config/global.inc.php');
require_once(INCLUDE_DIR . '/config/rankpoints.inc.php');
require_once(INCLUDE_DIR . '/functions.inc.php');

// Load Classes, they name defines the $ variable used
// We include all needed files here, even though our templates could load them themself
require_once(CLASS_DIR . '/debug.class.php');
// Following includes need the debugger
require_once(CLASS_DIR . '/bf3stats.class.php');
require_once(CLASS_DIR . '/compare.class.php');
require_once(INCLUDE_DIR . '/smarty.inc.php');
require_once(INCLUDE_DIR . '/cache.inc.php');       // handles loading of $cache object

// Create our pages array from existing files
if (is_dir(INCLUDE_DIR . '/pages/')) {
    foreach (glob(INCLUDE_DIR . '/pages/*.inc.php') as $filepath) {
        $filename = basename($filepath);
        $pagename = substr($filename, 0, strlen($filename) - 8);
        $arrPages[$pagename] = $filename;
        $debug->append("Adding $pagename as " . $filename . " to accessible pages", 2);
    }
}

// Set a default action here if no page has been requested
$page = isset($_REQUEST['page']) && isset($arrPages[$_REQUEST['page']]) ? $_REQUEST['page'] : 'home';

// Create our pages array from existing files
if (is_dir(INCLUDE_DIR . '/pages/' . $page)) {
    foreach (glob(INCLUDE_DIR . '/pages/' . $page . '/*.inc.php') as $filepath) {
        $filename = basename($filepath);
        $pagename = substr($filename, 0, strlen($filename) - 8);
        $arrActions[$pagename] = $filename;
        $debug->append("Adding $pagename as " . $filename . ".inc.php to accessible actions", 2);
    }    
}
// Default to empty (nothing) if nothing set or not known
$action = isset($_REQUEST['action']) && isset($arrActions[$_REQUEST['action']]) ? $_REQUEST['action'] : "";

// TODO: Add more ways to handle infinite amounts of subactions for pages
 
// Load the page code setting the content for the page OR the page action instead if set

if (!empty($action)) {
    $debug->append('Loading Action: ' . $action . ' -> ' . $arrActions[$action], 2);
    require_once(PAGES_DIR . '/' . $page . '/' . $arrActions[$action]);
} else {
    $debug->append('Loading Page: ' . $page . ' -> ' . $arrPages[$page], 2);
    require_once(PAGES_DIR . '/' . $arrPages[$page]);
}


// Debguger 
$debug->append("Loading debug information into template and loading master template", 4);
$smarty->assign('DebuggerInfo', $debug->getDebugInfo());

// For page content
$smarty->assign('PAGE', $page);
$smarty->assign('ACTION', $action);

$smarty->display("master.tpl", md5(serialize($_REQUEST)));
?>