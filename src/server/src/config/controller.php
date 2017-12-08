<?php

function getDBData($sql, $case=0, $data=0, $editor=0){
    try{
        //GET DB Object and Connect
        $db = new DataBase();
        $connection = $db->connect();
        $stmt = $connection->prepare($sql);
        $stmt->bindParam(":case", $case);
        $stmt->bindParam(":data", $data);
        $stmt->bindParam(":editor", $editor);
        $stmt->execute();
        $results = $stmt->fetchAll(PDO::FETCH_OBJ);
        $stmt=null;
        $connection=null;
        $db=null;
        return $results;
        
    } catch (PDOException $ex) {
        echo '{"error": {"text": '.$ex->getMessage().'} }';
    }
}

function setDBData($sql, $case=0, $data=0, $editor=0){
    try{
        //GET DB Object and Connect
        $db = new DataBase();
        $connection = $db->connect();
        $stmt = $connection->prepare($sql);
        $stmt->bindParam(":case", $case);
        $stmt->bindParam(":data", $data);
        $stmt->bindParam(":editor", $editor);
        $stmt->execute();
        $results = $stmt->fetchAll(PDO::FETCH_OBJ);
        $stmt=null;
        $connection=null;
        $db=null;
        return $results;
    } catch (PDOException $ex) {
        echo '{"error": {"text": '.$ex->getMessage().'} }';
    }
}
