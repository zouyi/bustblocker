<!DOCTYPE html>
<html lang="en">
    <head>  
  
    </head>
    <body>
        <h1>Actor Deleted</h1>
<?php
$servername = "localhost";
$username = "webuser";
$password = "secret1234";
$dbname = "movies_db2";


// Check connection
$conn = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
else{ 
    $res2 = mysqli_query($conn,"DELETE FROM directors WHERE  directors_id={$_GET['id']}");       
}
        
mysqli_close($conn);
        
?> 
<br>
        <a href="admin.php">Back to Admin</a>
</body>
</html>