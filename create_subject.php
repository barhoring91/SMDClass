 <?php
 
 // db connection
require 'conn.php';
require 'sql_query.php';

// store post arguments
$firstname = $_POST["firstname"];
$lastname = $_POST["lastname"];
$age = $_POST["age"];
$smd = $_POST["smd"];
$email = $_POST["email"];

// sql add new guest
$sql = "INSERT INTO Subjects (first_name, last_name, age, smd, email)
VALUES ('".$firstname."', '".$lastname."', '".$age."', '".$smd."', '".$email."');";

// execute sql command: create user
sql_query($conn, $sql);

// close connection
mysqli_close($conn);

?> 