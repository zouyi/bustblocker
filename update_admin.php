<!DOCTYPE html>
<html lang="en">
    <head>  
  
    </head>
    <body>
        <h1>Admin Updated</h1>
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
  $hashedpassword = password_hash($_POST["password"],PASSWORD_BCRYPT);

  
    $res2 = mysqli_query($conn,"UPDATE admins SET first_name='{$_POST["firstname"]}', last_name='{$_POST["lastname"]}',  username='{$_POST["username"]}' , hashed_password='{$hashedpassword}'WHERE uid={$_POST['admin_id']};");  
}
        
mysqli_close($conn);
        
?> 
<br>
        <a href="admin.php">Back to Admin</a>  
</body>
</html>