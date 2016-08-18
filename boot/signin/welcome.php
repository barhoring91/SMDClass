<?php

	// include files to communicate with server
	require("../../conn.php");
	require '../../sql_query.php';
	// generate mysql query
	$n = count($_POST);
	$columns_num = ($n -2) / 2;
	$token = $_POST["token"];
	//check for valid token
	$table = $_POST["table_name"];
	$mysql_query = "INSERT INTO ". $table. " (";
	$columns = "";
	$values = "VALUES (";
	for ($i = 1; $i <= $columns_num; $i++){
		$columns .= $_POST[("column".$i)]. ", ";
		$values .= "'".$_POST[("value".$i)]."', ";

		
	}
	$columns = substr($columns, 0, -2);
	$columns .= ") ";
	$values = substr($values, 0, -2);
	$values .= ");";
	$mysql_query .= $columns. $values;

	// execute sql command
	sql_query($conn, $mysql_query);

	// close connection
	mysqli_close($conn);
	/*
	foreach($_POST as $key => $value){
  		echo $key . " : " . $value . "<br />\r\n";
	}*/

?>

