<!DOCTYPE html>
<html lang="en">
    <head>  
    <title>Directors</title>
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
    echo "<h1>Directors</h1>";
        
    $res2 = mysqli_query($conn,"SELECT * FROM directors");
    
    if (mysqli_num_rows($res2) > 0) {
        //echo "we have some results";
        
        //we will generate some dymaic sql
        while($row = mysqli_fetch_assoc($res2)) {
            
            echo "<a href='update_director_form.php?id={$row['directors_id']}'>Update</a> ";
            
            echo "{$row['director_firstname']} ";
            
            echo "{$row['director_lastname']} ";
            
            echo "<a href='delete_director.php?id={$row['directors_id']}'> Delete</a><br> "; 
        }
    }       
}
    
mysqli_close($conn);
?>
<br>
<a href="admin.php">Back to Admin</a>
</body>
</html>