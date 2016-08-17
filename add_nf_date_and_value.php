 <?php
 
 // db connection
require 'conn.php';
require 'sql_query.php';

// store post arguments
$id = $_POST["id"];
$h_value = $_POST["h_value"];

// sql select user by id
$sql = "SELECT nf_history FROM Subjects WHERE id='".$id."';";

// execute sql command: get nf_history field
$result = $conn->query($sql);
$result = $result->fetch_assoc();

// decode nf_history
$nf_history = unserialize($result['nf_history']);
// add new value
$nf_history[date('Y-m-d')] = $h_value;
// encode nf_history
$serialize = serialize($nf_history);

// sql update nf_history field
$sql = "UPDATE Subjects
SET nf_history='".$serialize."'
WHERE id='".$id."';";

// execute sql command: udate nf_history field
$conn->query($sql);

// close connection
$conn->close();

?> 