

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
  echo "<h1>Connected successfully</h1>";
  $hashedpassword = password_hash($_POST["password"],PASSWORD_BCRYPT);

  $sql = "INSERT INTO admins (first_name, last_name, email, username, password) VALUES ('".$_POST["firstname"]."','".$_POST["lastname"]."','".$_POST["email"]."','".$_POST["username"]."','".$hashedpassword."')";
  $res2 = mysqli_query($conn,$sql);
  if($res2 === TRUE){
    echo "New record created successfully"; 
     echo "<a href='admin.php'>Back to Admin</a>";


  }else{
    echo "Insert failed"; 
  }
}
?>

