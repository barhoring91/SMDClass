<?php
$data1 = array( 'a', 'b', 'c' );
$data2 = array( 'name' => 'God', 'age' => -1 );
$option = 2; 
header('Content-type: application/json');
// store post arguments
$id = $_POST["id"];


// sql select user by id
$sql = "SELECT * FROM Subjects WHERE id='".$id."';";

// execute sql command: get nf_history field
//$result = $conn->query($sql);

if ( $option == 1 )
  echo json_encode( $data1 );
  // prints json array ["a","b","c"]
else
  echo json_encode( $data2 );
  // prints json object {"name":"God","age":-1} 


?>  