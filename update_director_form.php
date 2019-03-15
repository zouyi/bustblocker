<!DOCTYPE html>
<html lang="en">
    <head>  
  
    </head>
    <body>
        <h1>Update Director Form</h1> 
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
     
  
    $mysql = "SELECT * FROM directors WHERE directors_id='".$_GET["id"]."'";
  //echo $mysql;
    $res2 = mysqli_query($conn,$mysql);
    
    if (mysqli_num_rows($res2) > 0) {
        //echo "we have some results";
        
        while($row = mysqli_fetch_assoc($res2)) {
            
            echo 
            "<form method='post' action='update_director.php'>";
            
            echo 
            "<input type='hidden' name='directors_id' value='{$row["directors_id"]}'>";
            
            echo
            "First Name<br>
            <input type='text' name='firstname' required value='{$row["director_firstname"]}'><br>";
            
            echo
            "Last Name<br>
            <input type='text' name='lastname' required value='{$row["director_lastname"]}'><br>";
            
            
            echo
            "<button type='submit'>Update Director</button>
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