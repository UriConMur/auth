<?php
    class DataBase{
        private $db_host = "";
        private $db_user = "";
        private $db_pass = "";
        private $db_name = "";

        function __construct() {
            $this->$db_host = $_ENV['db_hostname'];
            $this->$db_user = $_ENV['db_username'];
            $this->$db_pass = $_ENV['db_userpass'];
            $this->$db_name = $_ENV['db_schema'];
        }

        public function connect(){
            $mysql_connect_str = "mysql:host=$this->db_host; dbname=$this->db_name; ";
            $dbConnection = new PDO($mysql_connect_str, $this->db_user, $this->db_pass);
            $dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $dbConnection;
        }
    }
