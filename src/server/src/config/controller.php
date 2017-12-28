<?php
/**
 * PHP Version 5
 *
 * Controller Doc Comment
 *
 * @category File
 * @package  Controller
 * @author   Salvador Gonzalez <salvador.gonzalez@beliveo.com>
 * @license  https://github.com/SDBLV/bbox-login/blob/develop/LICENSE.md MIT
 * @link     http://www.beliveo.net/bbox-login
 */

/**
 * Function getDBData
 *
 * @param type $sql    Query
 * @param type $case   SP Case
 * @param type $data   Values
 * @param type $editor User
 *
 * @return type
 */
function getDBData($sql, $case = 0, $data = 0, $editor = 0)
{
    try {
        //GET DB Object and Connect
        $db = new DataBase();
        $connection = $db->connect();
        $stmt = $connection->prepare($sql);
        $stmt->bindParam(":case", $case);
        $stmt->bindParam(":data", $data);
        $stmt->bindParam(":editor", $editor);
        $stmt->execute();
        $results = $stmt->fetchAll(PDO::FETCH_OBJ);
        $stmt = null;
        $connection = null;
        $db = null;
        return $results;
    } catch (PDOException $ex) {
        echo '{"error": {"text": ' . $ex->getMessage() . '} }';
    }
}

/**
 * Function setDBData
 *
 * @param type $sql    Query
 * @param type $case   SP Case
 * @param type $data   Values
 * @param type $editor User
 *
 * @return type
 */
function setDBData($sql, $case = 0, $data = 0, $editor = 0)
{
    try {
        //GET DB Object and Connect
        $db = new DataBase();
        $connection = $db->connect();
        $stmt = $connection->prepare($sql);
        $stmt->bindParam(":case", $case);
        $stmt->bindParam(":data", $data);
        $stmt->bindParam(":editor", $editor);
        $stmt->execute();
        $results = $stmt->fetchAll(PDO::FETCH_OBJ);
        $stmt = null;
        $connection = null;
        $db = null;
        return $results;
    } catch (PDOException $ex) {
        echo '{"error": {"text": ' . $ex->getMessage() . '} }';
    }
}
