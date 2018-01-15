<?php

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
function getDbData( $sql, $case = 0, $data = 0, $editor = 0 )
{
    try {
        //GET DB Object and Connect
        $db         = new DataBase();
        $connection = $db->connect();
        $stmt       = $connection->prepare($sql);
        $stmt->bindParam(':case', $case);
        $stmt->bindParam(':data', $data);
        $stmt->bindParam(':editor', $editor);
        $stmt->execute();
        $results    = $stmt->fetchAll(PDO::FETCH_OBJ);
        $stmt       = null;
        $connection = null;
        $db         = null;
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
function setDbData( $sql, $case = 0, $data = 0, $editor = 0 )
{
    try {
        //GET DB Object and Connect
        $db         = new DataBase();
        $connection = $db->connect();
        $stmt       = $connection->prepare($sql);
        $stmt->bindParam(':case', $case);
        $stmt->bindParam(':data', $data);
        $stmt->bindParam(':editor', $editor);
        $stmt->execute();
        $results    = $stmt->fetchAll(PDO::FETCH_OBJ);
        $stmt       = null;
        $connection = null;
        $db         = null;
        return $results;
    } catch (PDOException $ex) {
        echo '{"error": {"text": ' . $ex->getMessage() . '} }';
    }
}
