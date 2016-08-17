 <?php
 
 // db connection
require 'conn.php';
require 'sql_query.php';

// store post arguments
$id = $_DELETE["id"];

echo $id; 

// sql delete uesr
$sql = "DELETE FROM Subjects WHERE id='".$id."';";

// execute sql command: delete user
sql_query($conn, $sql);

// close connection
mysqli_close($conn);

?> 