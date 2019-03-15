<!DOCTYPE html>
<html lang="en">
    <head>  
  
    </head>
    <body>
        <h1>Update Admin Form</h1> 
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
     
    $res2 = mysqli_query($conn,"SELECT * FROM admins WHERE uid='".$_GET["id"]."'");
    
    if (mysqli_num_rows($res2) > 0) {
        //echo "we have some results";
        
        while($row = mysqli_fetch_assoc($res2)) {
            
            echo 
            "<form method='post' action='update_admin.php'>";
            
            echo 
            "<input type='hidden' name='admin_id' value='{$row["uid"]}'>";
            
            echo
            "First Name<br>
            <input type='text' name='firstname' required value='{$row["first_name"]}'><br>";
            
            echo
            "Last Name<br>
            <input type='text' name='lastname' required value='{$row["last_name"]}'><br>";
            
            echo
            "Email<br>
            <input type='text' name='email' required value='{$row["email"]}'><br>";
            
            echo
            "Password<br>
            <input type='text' name='password' required value='{$row["hashed_password"]}'><br>";
          
            echo
            "<button type='submit'>Update Admin</button>
            </form>";
        }
    }       
}

mysqli_close($conn);
        
?>
<br>
        <a href="admin.php">Back to Admin</a>
</body>
</html>