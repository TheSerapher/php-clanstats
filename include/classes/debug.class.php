<?php

// Make sure we are called from index.php
if (!defined('SECURITY'))
    die('Hacking attempt');

/**
 * This file defines the debug class used in this site to enable
 * verbose deugging outout.
 * @package debug
 * @author Sebastian 'Seraph' Grewe
 * @copyright Sebastian Grewe
 * @version 1.0
 * */
class Debug {

    /**
     * @var integer $DEBUG enable (1) or disable (0) debugging
     */
    private static $DEBUG;

    /**
     * @var array $debugInfo Data array with debugging information
     */
    private $arrDebugInfo;

    /**
     * @var float $startTime Start time of our debugger
     */
    private static $floatStartTime;

    /**
     * Construct our class
     * @param integer $DEBUG [optional] Enable (>=1) or disable (0) debugging
     * @return none
     */
    function __construct($DEBUG = 0) {
        $this->DEBUG = $DEBUG;
        if ($DEBUG >= 1) {
            $this->floatStartTime = microtime(true);
            $this->append("Debugging enabled", 1);
        }
    }

    /**
     * If we want to set our debugging level in a child class this allows us to do so
     * @param integer $DEBUG our debugging level
     */
    function setDebug($DEBUG) {
        $this->DEBUG = $DEBUG;
    }

    /**
     * We fill our data array here
     * @param string $msg Debug Message
     * @param string $file [optional] File name
     * @param integer $line [optional] Line inside the $file
     * @param integer $debug [optional] Debugging level, default 1
     * @param string $class [optional] Class this is called from
     * @param string $method [optional] Method this is called from
     * @return none
     */
    function append($msg, $file = "Unknown", $line = "0", $debug = 1, $class = "", $method = "") {
        if ($this->DEBUG >= $debug) {
            $this->arrDebugInfo[] = array(
                'level' => $debug,
                'time' => round((microtime(true) - $this->floatStartTime) * 1000, 2),
                'file' => basename($file),
                'backtrace' => $this->getBacktrace(),
                'message' => $msg,
            );
        }
    }

    /**
     * Return a backtrace strin
     *  
     */
    public function getBacktrace() {
        $bth = debug_backtrace();
        while (strpos($bth[0]['file'], "classes/debug") != false) array_shift($bth);
        foreach ($bth as $x) {
            $backtrace[] = array(
                    'file' => substr($x['file'], strrpos($x['file'], '/') + 1),
                    'line' => $x['line'],
                    'function' => $x['function'],
                );
        }
        return $backtrace;
    }

    /**
     * Return the created strDebugInfo array
     * @return none
     */
    public function getDebugInfo() {
        return $this->arrDebugInfo;
    }
}

// Instantiate this class
$debug = new Debug(DEBUG);
?>