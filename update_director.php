<!DOCTYPE html>
<html lang="en">
    <head>  
  
    </head>
    <body>
        <h1>Actor Updated</h1>
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
    //this is a dynamic update sql query
    $res2 = mysqli_query($conn,"UPDATE directors SET director_firstname='{$_POST["firstname"]}' , director_lastname='{$_POST["lastname"]}' WHERE directors_id={$_POST['directors_id']};");  
}
        
mysqli_close($conn);
        
?> 
<br>
        <a href="admin.php">Back to Admin</a>  
</body>
</html>