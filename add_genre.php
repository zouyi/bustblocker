

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
$sql = "INSERT INTO genres (genre_type)
VALUES ('".$_POST["genre"]."')";
$res2 = mysqli_query($conn,$sql);
if($res2 === TRUE){
echo "New record created successfully"; 
     echo "<a href='admin.php'>Back to Admin</a>";


}else{
echo "Insert failed"; }
} ?>

