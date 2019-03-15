<!DOCTYPE html>
<html lang="en">
    <head>  
  
    </head>
    <body>
        <h1>Update Movie Form</h1> 
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
     
    $res2 = mysqli_query($conn,"SELECT * FROM movies WHERE movies_id='".$_GET["id"]."'");
    
    if (mysqli_num_rows($res2) > 0) {
        //echo "we have some results";
        
        while($row = mysqli_fetch_assoc($res2)) {
            
            echo 
            "<form method='post' action='update_movie.php'>";
            
            echo 
            "<input type='hidden' name='movies_id' value='{$row["movies_id"]}'>";
            
            echo
            "Title<br>
            <input type='text' name='title' required value='{$row["movie_title"]}'><br>";
            
            echo
            "Year Released<br>
            <input type='number' name='year' min='1900' max='2020'  required value='{$row["movie_release_date"]}'><br>";
            
             echo
            "Runtime<br>
            <input type='text' name='runtime' required value='{$row["movie_runtime"]}'><br>";
            
            
             echo
            "Description<br>
            <input type='text' name='desc' required value='{$row["movie_description"]}'><br>";
            
            
             echo
            "Rating<br>
            <input type='text' name='rating' required value='{$row["movie_rating"]}'><br>";
        
            echo
            "<button type='submit'>Update Movie</button>
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