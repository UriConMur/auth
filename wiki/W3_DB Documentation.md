# Database documentation

| <center>Schema name</center> | <center>Table name</center> | <center>Columns</center> | <center>Description</center>                                        |
| ---------------------------- | --------------------------- | ------------------------ | ------------------------------------------------------------------- |
| bbox_login                   | bbox_users                  | <center>8</center>       | Contains information of the users that are registered in this table |

## Database diagram

<center> <img src= img/bd_diagram.jpg/> </center>
<font size=2><center><strong>Fig. 1 bbox_users Diagram</strong></center></font>

## Stored procedures

| <center>Name</center> | <center>Parameters</center>                             | <center>Description</center>                                                                         |
| --------------------- | ------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| sp_login_user_get     | case_type INT <br/>data_value TEXT </br>id_modifier INT | Obtain data information from the bbox login app tables; has cases to identify the action to be taken |

## Functions

| <center>Name</center> | <center>Parameters</center>              | <center>Description</center>                                                                                                                                        |
| --------------------- | ---------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| SPLIT_STR_PARAM       | x TEXT<br/>delim VARCHAR(12)<br/>pos INT | Gets a text delimited by special characters (this is in delim) and returns the word (s) according to the position (obtained when cutting the text by the delimiter) |
