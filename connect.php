 <?php
 
 // db connection
 
header("Status: 400");
require 'conn.php';
require 'sql_query.php';

// store post arguments
$firstname = $_POST["firstname"];
$lastname = $_POST["lastname"];
$email = $_POST["email"];

// sql add new guest
$sql = "INSERT INTO MyGuests (firstname, lastname, email)
VALUES ('".$firstname."', '".$lastname."', '".$email."');";

// execute sql command
sql_query($conn, $sql);

// close connection
mysqli_close($conn);



?> 