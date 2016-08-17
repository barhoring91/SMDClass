 <?php
$servername = "mysqlsrv.cs.tau.ac.il";
$username = "barhoring";
$password = "barhori82628";
$dbname = "barhoring";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

?>