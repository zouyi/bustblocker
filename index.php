<!DOCTYPE html>
<html lang="en">
    <head>  
    <title>Bustblocker</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
<link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    
  <body>
    <nav class="navbar navbar-inverse">
  <div class="container-fluid">
      <div class="navbar-header">
      <a class="navbar-brand" href="index.php">BustBlocker</a>
    </div>
      <ul class="nav navbar-nav">


  <li><a href="index.php">Movies</a></li>
  <li><a href="search.php">Search</a></li>
  <li><a href="contact.php">Contact</a></li>
  <li><a href="about.php">About</a></li>
  <li><a href="login_form.html">Log in</a></li>

  </ul>
      </div>
      </nav>   
      <div class='container'>
      <div class='row'>
          
   
          
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
    echo "<h1>Movies</h1>";
 
    $res2 = mysqli_query($conn,"SELECT * FROM movies");
    
    if (mysqli_num_rows($res2) > 0) {
        //echo "we have some results";
       
        //we will generate some dymaic sql
        $counter = 1;
        while($row = mysqli_fetch_assoc($res2)) {
        
            if($counter == 1){
                echo "<div class='row'>";
                movieEcho($row);
                $counter++;
            } else if($counter==2){
                movieEcho($row);
                $counter++;
                echo "</div>";
                //reset counter to 1
                $counter=1;
            } 


        }
            
         
    }
}       


          function movieEcho($row){
                echo "<div class='col-md-3'>";
                echo "<img class='movieImage' src='img/{$row['movie_image']}' alt='{$row['movie_image']}'>";
                echo "</div>";

                echo "<div class='col-md-3'>";

                
                echo "<h4>Title</h4>";
                echo "{$row['movie_title']} ";
                
                echo "<h4>Release Date</h4>";
                echo "{$row['movie_release_date']} ";
                
                echo "<h4>Runtime</h4>";
                echo "{$row['movie_runtime']} ";
                
                echo "<h4>Description</h4>";
                echo "{$row['movie_description']}";
                
                echo "<h4>Rating</h4>";

                echo "{$row['movie_rating']}";
            

                echo "</div>";
                echo "<br>";
              
          }
          
          
    
mysqli_close($conn);
?>
<br>
          </div>
</div>
<a href="admin.php">Back to Admin</a>
</body>
</html>


