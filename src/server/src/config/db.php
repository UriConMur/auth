<?php
/**
 * PHP Version 5
 *
 * DB Doc Comment
 *
 * @category File
 * @package  DB
 * @author   Salvador Gonzalez <salvador.gonzalez@beliveo.com>
 * @license  https://github.com/SDBLV/bbox-login/blob/develop/LICENSE.md MIT
 * @link     http://www.beliveo.net/bbox-login
 */

/**
 * DataBase
 * 
 * @category   Class
 * @package    DataBase
 * @subpackage Controller
 * @author     Salvador Gonzalez <salvador.gonzalez@beliveo.com>
 * @license    https://github.com/SDBLV/bbox-login/blob/develop/LICENSE.md MIT
 * @link       http://www.beliveo.net/bbox-login
 */
class DataBase
{
    private $_db_host = "";
    private $_db_user = "";
    private $_db_pass = "";
    private $_db_name = "";

    /**
     * Funciton __construct
     */
    function __construct() 
    {
        $this->$db_host = $_ENV['db_hostname'];
        $this->$db_user = $_ENV['db_username'];
        $this->$db_pass = $_ENV['db_userpass'];
        $this->$db_name = $_ENV['db_schema'];
    }
    /**
     * Function connect
     * 
     * @return $dbConnection
     */
    public function connect()
    {
        $mysql_connect_str = "mysql:host=$this->db_host; dbname=$this->db_name; ";
        $dbConnection = new PDO($mysql_connect_str, $this->db_user, $this->db_pass);
        $dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $dbConnection;
    }
}
