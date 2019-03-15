<?php
/*
session_start();
if (!isset($_SESSION['id'])) {
    header( 'Location: login_form.php' ) ;
}*/
?>
<!DOCTYPE html>
<html lang="en">
    <head>  
        <meta chartset="utf-8">
        <title>Add Movie Form</title>
         <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class='container text-center'>
        <h1>Add Movie Form</h1> 

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
     
    //get all the current genres from genres table
    $res2 = mysqli_query($conn,"SELECT * FROM genres");
 
    //if the query found records they we will carry on
    if (mysqli_num_rows($res2) > 0) {
       
            
            echo 
            "<form method='post' action='add_movie.php'>";
            
            echo 
            "<input type='hidden' name='movies_id'>";
            
            echo
            "Movie Title<br>
            <input type='text' name='title' required><br>";
            
            echo
            "Movie Run Time<br>
            <input type='text' name='runtime' required><br>";
            
            echo
            "Movie Release Date<br>
            <input type='text' name='year' required><br>";
            
            echo
            "Movie Description<br>
            <textarea rows='20' cols='60' name='desc'></textarea><br>";
        
            echo
            "Movie Rating<br>
            <select name='rating'>";
            echo "<option>G</option>";
            echo "<option>PG</option>";
            echo "<option>PG-13</option>";
            echo "<option>R</option>";
            echo "<select><br>";
                
            echo
            "Director<br>
            <input type='text' name='director' required><br>";
            
        
            //loop through to display all the genres
            echo
            "Movie Genre<br>
            <select name='movie_genre'>";
            //This is where we dynamic generate options
            while($row = mysqli_fetch_assoc($res2)) {
                echo "<option value='{$row['genres_id']}'>{$row['genre_type']}</option>";
            }       
            echo "<select><br>";
         
            echo
            "Movie Image<br>
            <input type='text' name='movie_image' required><br><br>";
            
            echo
            "<button type='submit'>Add Movie</button>
            </form>";
        
            
    }       
}

mysqli_close($conn);
        
?>
<br>
        <a href="admin.php">Back to Admin</a>
            
        </div>
</body>
</html>