<?php
/**
 * PHP Version 5
 *
 * Controller Doc Comment
 *
 * @category File
 * @package  Controller
 * @author   Salvador Gonzalez <salvador.gonzalez@beliveo.com>
 * @license  hhtp://www.localhost.com/LICENSE.html GNU General Public License
 * @link     hhtp://www.localhost.com/bbox-login
 */

/**
 * Function getDBData
 * 
 * @param type $sql    Consulta
 * @param type $case   Caso en SP
 * @param type $data   Valores
 * @param type $editor Usuario
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
 * @param type $sql    Consulta
 * @param type $case   Caso en SP
 * @param type $data   Valores
 * @param type $editor Usuario
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
