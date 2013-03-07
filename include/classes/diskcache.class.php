<?php

// Make sure we are called from index.php
if (!defined('SECURITY'))
    die('Hacking attempt');

class diskcache {

    function __construct($debug, $config) {
        $this->debug = $debug;
        $this->config = $config;
        $this->debug->append("Loaded ", 1);
    }

    function set($name, $data, $dummy, $expire) {
        $expire = time() + $expire;
        $this->debug->append("Saving in cache file $name.cache.php with $expire lifetime. It is now " . time(), 2);
        if (!file_put_contents('templates/cache/' . $name . '.cache.php', "<?php\n\$expire=" . $expire . ";\n\$cachedata=" . var_export($data, true) . ";\n?>")) {
            $this->debug->append("Unable to save file", 2);
        }
    }

    function get($name) {
        $this->debug->append("Trying to fetch cache for key : $name", 2);
        $this->debug->append("Loading file", 2);
        
        if (include('templates/cache/' . $name . '.cache.php')) {
            $this->debug->append("File included", 2);
            if (time() >= $expire) {
                $this->debug->append("Cache expired: " . time() . " >= $expire", 2);
                return false;
            }
            return $cachedata;
        } else {
            $this->debug->append("Failed to load cache file for $name.", 2);
        }
        return false;
    }

    function delete($name) {
        $this->debug->append("Trying to delete cache for key : $name", 2);
        if (unlink('templates/cache/' . $name . '.cache.php')) {
            return true;
        }
        return false;
    }

}

$cache = new diskcache($debug, $config);
?>