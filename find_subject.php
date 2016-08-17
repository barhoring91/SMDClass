 <?php
 
 // db connection
require 'conn.php';

// store post arguments
$id = $_POST["id"];

// sql select user by id
$sql = "SELECT * FROM Subjects WHERE id='".$id."';";

// execute sql command: get nf_history field
$result = $conn->query($sql);

$emparray = array();
    while($row = mysqli_fetch_assoc($result))
    {
        $emparray = $row;
    }
    
header('Content-type: application/json');	
echo json_encode($emparray);

// close connection
$conn->close();

?> 
