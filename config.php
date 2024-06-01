<?php
/* Database credentials. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
define('DB_HOST', 'localhost:3306');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_NAME', 'pvcb_mbpm');

//Connect info for hostvn server
// define('DB_HOST', 'localhost');
// define('DB_USERNAME', 'hitechme_banca');
// define('DB_PASSWORD', 'Abxyvuv2!@#');
// define('DB_NAME', 'hitechme_banca');

/* Attempt to connect to MySQL database */
$link = mysqli_connect(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);

mysqli_set_charset($link, "utf8");

// Check connection
if($link === false){
  die("ERROR: Could not connect. " . mysqli_connect_error());
}

//$url="https://oauth.zaloapp.com/v3/access_token?app_id=1693075726573169444&app_secret=Xc271XMAyM2nXT2XR5K1&code=hRCf6Mb0zpdWbau7TLt67ThF3tWW0SzebyXxS1e9ynpiopyFKXoECC-c5GDT2THbfCCIVXKmitQqp0GGG0FA0VJJUJnk7TW9o8OkUWHtxcUgk5b5AKJlACE3AJa-GBaftjL2UXKYsmRlyneFHrhoSuxu15LgGAvMq8qTOLrNaqJC-50tUp6LDzkEP5KQ9h9bl9ibCXzDbmcSX20J4rIG5CFcBH5ZTCLegva3M0m4abAWf7iiOZEVEVoRILeTK8r4ggSYO3HAy5IMtNmUkWlz4pU5VHcIFe58SF1qGVLE-rDGetq5fC-sHmWgDqkCbORSAmv-ZyMWp_5c6sgnxeArlGmXOTUeZScBL3SVahQ8jUGjAHth4VDnI0Hog4m";
//$result = file_get_contents($url);
//
//$receiveJSON = json_decode($result, true);

//$_SESSION['access_token'] = $receiveJSON['access_token'];

define('DEBUG', false);
error_reporting(E_ALL);

if (DEBUG) {
  ini_set('display_errors', 'On');
} else {
  ini_set('display_errors', 'Off');
}

/* Attempt to connect to MySQL database */
$link = mysqli_connect(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);

mysqli_set_charset($link, "utf8");

// Check connection
if ($link === false) {
  die("ERROR: Could not connect. " . mysqli_connect_error());
}

function executeResult($sql)
{
  $conn = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);
  mysqli_set_charset($conn, 'utf8');

  $data = [];
  $result = mysqli_query($conn, $sql);
  if ($result) {
    while ($row = mysqli_fetch_array($result,MYSQLI_ASSOC)) {
      $data[] = $row;
    }
  } else {
  }

  mysqli_close($conn);
  return $data;
}

function execute($sql)
{
  $conn = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);
  mysqli_set_charset($conn, 'utf8');
  $result = mysqli_query($conn, $sql);
  mysqli_close($conn);
  return $result;
}

?>
