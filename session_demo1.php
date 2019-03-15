<?php
session_start();
?>
<!DOCTYPE html>
<html>
    <head>
        <title>Session Test</title>
        <meta charset="utf-8">
    </head>
<body>

<?php
    //Let us set a session variable
    echo "Creating a session with id variable!";
    $_SESSION["id"] = 1234;
?>

</body>
</html>