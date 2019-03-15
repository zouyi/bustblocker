<!DOCTYPE html>
<html lang="en">
    <head>  
  
    </head>
    <body>
        <h1>Update Genre Form</h1> 
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
     
    $res2 = mysqli_query($conn,"SELECT * FROM genres WHERE genres_id='".$_GET["id"]."'");
    
    if (mysqli_num_rows($res2) > 0) {
        //echo "we have some results";
        
        while($row = mysqli_fetch_assoc($res2)) {
            
            echo 
            "<form method='post' action='update_genre.php'>";
            
            echo 
            "<input type='hidden' name='genres_id' value='{$row["genres_id"]}'>";
  
            
             echo
            "Genre<br>
            <input type='text' name='genre_type' required value='{$row["genre_type"]}'><br>";
            
        
            echo
            "<button type='submit'>Update Genre</button>
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