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
        $this->_db_host = $_ENV['DB_HOSTNAME'];
        $this->_db_user = $_ENV['DB_USERNAME'];
        $this->_db_pass = $_ENV['DB_USERPASS'];
        $this->_db_name = $_ENV['DB_SCHEMA'];
    }
    /**
     * Function connect
     *
     * @return $dbConnection
     */
    public function connect()
    {
        $mysql_connect_str = "mysql:host=$this->_db_host; dbname=$this->_db_name;";
        $dbConnection = new PDO($mysql_connect_str, $this->_db_user, $this->_db_pass);
        $dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $dbConnection;
    }
}
