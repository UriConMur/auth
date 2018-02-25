# Database documentation

| <center>Schema name</center> | <center>Table name</center> | <center>Columns</center> | <center>Description</center>                                        |
| ---------------------------- | --------------------------- | ------------------------ | ------------------------------------------------------------------- |
| bbox_login                   | bbox_users                  | <center>8</center>       | Contains information of the users that are registered in this table |

## Database diagram

<center> <img src= img/bd_diagram.jpg/> </center>
<font size=2><center><strong>Fig. 1 bbox_users Diagram</strong></center></font>

## Stored procedures

Each Stored Procedures contains the next parameters:

| Name            | Type                  | Description                                                                                                            |
| --------------- | --------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| **case_type**   | <center>INT</center>  | Each stored procedures contains 'cases', to identify each action this parameter is used that contains the case number. |
| **data_value**  | <center>TEXT</center> | Contains all data to process in the SP.                                                                                |
| **id_modifier** | <center>INT</center>  | contains the id of the employee who has modified the information.                                                     |

Stored Procedures used:

#### sp_login_user_get
| <center>Case</center> | Id  | <center>Description</center>                              | <center>What's need</center> | <center>Return</center>                                            |
| --------------------- | --- | --------------------------------------------------------- | ---------------------------- | ------------------------------------------------------------------ |
| GET_USER              | 1   | Search a selected user, if it exists, it return user data | user and password            | id_user, id_employee, id_position and shortName of the select user |

Search for a selected user, if it exists, return user data

#### sp_login_user_set
| <center>Case</center> | Id  | <center>Description</center>                                                                                                                                                              | <center>What's need</center>                                                       |
| --------------------- | --- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| SET_NEW_USER          | 1   | Creates a new user with its short name and random number, looks for that it does not exist to insert it in the table, if it exists it continues generating a new user until it is unique. | Not null: Name and Last name. They may not exist: middle name and second last name |

## Functions

| <center>Name</center> | <center>Parameters</center>              | <center>Description</center>                                                                                                                                        |
| --------------------- | ---------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| SPLIT_STR_PARAM       | x TEXT<br/>delim VARCHAR(12)<br/>pos INT | Gets a text delimited by special characters (this is in delim) and returns the word (s) according to the position (obtained when cutting the text by the delimiter) |
