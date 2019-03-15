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
}else{
echo "<div class='col-md-4 col-md-offset-4'>";
echo "<h1>Search</h1>";
    
echo "<form method='POST' action='search.php'>";

echo "<div class='form-group'>";
echo "Title<br>";
echo "<input class='form-control' type='text' id='title' name='title' size='45'><br>";
echo "</div>";
    
echo "<div class='form-group'>";
echo "Rating:<br>";
echo "<select class='form-control' name='movie_rating'>";
echo "<option value='G'>G</option>";
echo "<option value='PG'>PG</option>";
echo "<option value='PG-13'>PG-13</option>";
echo "<option value='R'>R</option>";
echo "<select><br>";
echo "</div>";
 
echo "<div class='form-group'>";
echo "Release Date:<br>";    
echo "<input class='form-control' type='text' id='movie_release_date' name='movie_release_date' size='45'><br>";   
echo "</div>";
    
echo "<button type='submit'  class='btn btn-default'>Submit</button>";
    
echo "</form>";
echo "</div>";
echo "</div>";

echo "<br>";


if($_SERVER['REQUEST_METHOD'] == 'POST'){
    
    $sql= "SELECT * FROM movies ";
    
    $sql.=" WHERE 1=1 ";
    
    if(isset($_POST['title']) && strlen( $_POST['title'])){
       $sql.="AND movie_title='".$_POST['title']."';";
    }
    
    if(isset($_POST['movie_rating']) && strlen( $_POST['movie_rating'])){
       $sql.="AND movie_rating='".$_POST['movie_rating']."'";
    }
    
    if(isset($_POST['movie_release_date']) && strlen( $_POST['movie_release_date'])){
       $sql.="AND movie_release_date LIKE '%".$_POST['movie_release_date']."%';";
    }
     
    //echo $sql;
    
    $res2 = mysqli_query($conn,$sql);
    
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
}
          mysqli_close($conn);

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

    ?>
<br>
          </div> 
</div>
      <div class="row">
          <div class='col-md-4 col-md-offset-4'><a href="admin.php">Back to Admin</a></div></div>
</body>
</html>


