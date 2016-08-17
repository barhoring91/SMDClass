 <?php
 
 // db connection
require 'conn.php';
require 'sql_query.php';

$sql = "CREATE TABLE Subjects (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
age INT(3) NOT NULL,
smd INT(1) NOT NULL,
email VARCHAR(50),
nf_history LONGTEXT DEFAULT NULL,
created_at TIMESTAMP
);";

sql_query($conn, $sql);

mysqli_close($conn);

?>