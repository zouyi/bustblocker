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
     
  $mysql = "UPDATE movies SET movie_title='{$_POST["title"]}', movie_runtime='{$_POST["runtime"]}', movie_release_date='{$_POST["year"]}',
    movie_description='{$_POST["desc"]}', movie_rating='{$_POST["rating"]}' WHERE movies_id={$_POST['movies_id']};";
  //echo $mysql;
     //this is a dynamic update sql query
    $res2 = mysqli_query($conn, $mysql);  
    
  
}
           


mysqli_close($conn);
        
?>
<br>
        <a href="admin.php">Back to Admin</a>
        <a href="show_movies.php">Show Movies</a>
</body>
</html>