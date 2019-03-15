<!DOCTYPE html>
<html lang="en">
    <head>  
    <title>Genres</title>
    </head>
    <body>
        
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
    echo "<h1>Genres</h1>";
        
    $res2 = mysqli_query($conn,"SELECT * FROM genres");
    
    if (mysqli_num_rows($res2) > 0) {
        //echo "we have some results";
        
        //we will generate some dymaic sql
        while($row = mysqli_fetch_assoc($res2)) {
            
            echo "<a href='update_genre_form.php?id={$row['genres_id']}'>Update</a> ";
            
            echo "{$row['genre_type']} ";
            
            echo "<a href='delete_genre.php?id={$row['genres_id']}'> Delete</a><br> "; 
        }
    }       
}
    
mysqli_close($conn);
?>
<br>
<a href="admin.php">Back to Admin</a>
</body>
</html>


