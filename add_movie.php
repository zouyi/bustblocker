<?php
$servername = "localhost";
$username = "webuser";
$password = "secret1234";
$dbname = "movies_db2";


// Check connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection 
if (!$conn) {
die("Connection failed: " . mysqli_connect_error()); }
else{
echo "<h1>Connected successfully</h1>";
$sql = "INSERT INTO movies (movie_title, movie_runtime,movie_release_date,movie_description,movie_rating,movie_director, movie_image)
VALUES ('".$_POST["title"]."','".$_POST["runtime"]."','".$_POST["year"]."','".$_POST["desc"]."','".$_POST["rating"]."','".$_POST["director"]."','".$_POST["movie_image"]."');";
    //echo $sql;
    
    
$res2 = mysqli_query($conn,$sql);
    
    //Get the new movie id
    $themovie_id = mysqli_insert_id($conn); 
    echo $themovie_id;

    if($res2 === TRUE){
        echo "New movie record created successfully"; 
        
        //also add the genre for this movie to the movie_genres table
        $sql2 = "INSERT INTO movie_genres (movies_movies_id, genres_genres_id)  VALUES('{$themovie_id}','{$_POST["movie_genre"]}')";
    
        echo $sql2;
        
        //run the query and get the result
        $res3 = mysqli_query($conn,$sql2);
    
    }
    else{
        echo "Insert failed"; 
    }
}
?>