<?php
/* Database credentials. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
//define('DB_HOST', 'localhost');
//define('DB_USERNAME', 'root');
//define('DB_PASSWORD', 'abxyvuv2');
//define('DB_NAME', 'mbpm');

//Connect info for hostvn server
define('DB_HOST', 'localhost');
define('DB_USERNAME', 'hitechme_pvcb');
define('DB_PASSWORD', 'Abxyvuv2!@#');
define('DB_NAME', 'hitechme_mbpm');
 
/* Attempt to connect to MySQL database */
$link = mysqli_connect(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);

mysqli_set_charset($link, "utf8");
 
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
?>
