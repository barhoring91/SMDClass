<?php
function sql_query($conn, $sql) {
    if (mysqli_query($conn, $sql)) {
    echo "200 OK";
} else {
    echo "Error";
}

} 
?>