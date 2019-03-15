<?php
session_start();
if (!isset($_SESSION['id'])) {
    header( 'Location: login_form.php' ) ;
}
?>
<!DOCTYPE html>
<html>
    <head>
        <title>Session Test</title>
        <meta charset="utf-8">
    </head>
<body>

<?php
    //Let us print the value of the session id
    echo "<h1>Session id exists!</h1>";
    echo $_SESSION["id"];
?>

</body>
</html>