<?php
/*
 * Smarty plugin
 * -------------------------------------------------------------
 * File:     function.eightball.php
 * Type:     function
 * Name:     eightball
 * Purpose:  outputs a random magic answer
 * -------------------------------------------------------------
 */
function smarty_function_arrows($params, &$smarty)
{
    if ($params['a'] > $params['b']) {
        return "up";
    } else if ($params['a'] < $params['b']) {
        return "down";
    }
}
?>