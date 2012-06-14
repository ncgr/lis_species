<?php

require 'database.php';

/**
 * Connect to and select database.
 *
 * @return
 */
function dbConnect() {
    global $db;
    $result = mysql_connect($db['host'], $db['user'], $db['pass']);
    if (!$result) {
        return false;
    }
    if (!mysql_select_db($db['database'], $result)) {
        return false;
    }
    return $result;
}

/**
 * Execute SQL query.
 *
 * @return
 */
function execQuery($sql, $resultFunc = "") {
    $conn = dbConnect();
    $result = mysql_query($sql);
    if (!$result) {
        return false;
    }
    if (!empty($resultFunc)) {
        return call_user_func($resultFunc, $result);
    }
    return $result;
}

/**
 * Convert SQL query results to an array.
 *
 * @return
 */
function dbResultToArray($result) {
    $resArray = array();
    while ($row = mysql_fetch_assoc($result)) {
        $resArray[] = $row;
    }
    return $resArray;
}

?>
