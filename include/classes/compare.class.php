<?php

// Make sure we are called from index.php
if (!defined('SECURITY'))
    die('Hacking attempt');

// Helper class for custom key sorting
class compare {
    var $key;
    function __construct($key, $order) {
        $this->key = $key;
        $this->order = $order;
    }
    
    function cmp__($a, $b) {
        $key = $this->key;
        $order = $this->order;
        if ($a[$key] == $b[$key]) return 0;
        if ($order == "asc") {
            return (($a[$key] > $b[$key]) ? 1 : -1);
        } else {
            return (($a[$key] < $b[$key]) ? 1 : -1);
        }
    }
}
?>