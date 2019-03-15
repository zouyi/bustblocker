<!DOCTYPE html>
<html lang="en">
    <head>  
    <title>Actors</title>
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
    <div class='col-md-4 col-md-offset-4'>
        
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
    echo "<h1>Actors</h1>";
        
    $res2 = mysqli_query($conn,"SELECT * FROM actors");
    
    if (mysqli_num_rows($res2) > 0) {
        //echo "we have some results";
        
        //we will generate some dymaic sql
        while($row = mysqli_fetch_assoc($res2)) {
            
            echo "<a href='update_actor_form.php?id={$row['actors_id']}'>Update</a> ";
            
            echo "{$row['actor_firstname']} ";
            
            echo "{$row['actor_lastname']} ";
            
            echo "{$row['actor_gender']} ";
            
            echo "{$row['actor_birthyear']}";
            
            echo "<a href='delete_actor.php?id={$row['actors_id']}'> Delete</a><br> "; 
        }
    }       
}
    
mysqli_close($conn);
?>
<br>
<a href="admin.php">Back to Admin</a>
                  </div>
          </div>
    </div>
</body>
</html>