<?php

// Starting session
session_start();

// Include config file
require_once "config.php";

// Define variables and initialize with empty values
$username= "nhannv";
$fullname="";
$fullname = $status = $branchID = $roleID = $teamID = "";

//Read data from session


//Get data from database
$empDetailSQL = "SELECT id, username, password, fullname FROM employee WHERE username = ?";
$functionSQL = "SELECT `function`.funcName FROM emp_func INNER JOIN `function` ON emp_func.functionID = `function`.id WHERE emp_func.username = 'nhannv'";
$empFullSQL ="SELECT id, username, password, fullname FROM employee";

echo 'Start Connect Database ';
/* prepare statement */
if ($stmt_empFunction = mysqli_prepare($link, $functionSQL)) {
  mysqli_stmt_bind_param($stmt_empFunction, "s", $param_username);
  
  // Set parameters
  $param_username = $username;

  echo 'Start Execute query <br>';
  mysqli_stmt_execute($stmt_empFunction);
  mysqli_stmt_store_result($stmt_empFunction);

  /* bind variables to prepared statement */
  if(mysqli_stmt_num_rows($stmt_empFunction) > 0) {
  //mysqli_stmt_bind_result($stmt_empFunction, $id, $username, $password, $fullname);
  echo 'finish binding result <br>';
  
  /* fetch values */
  while (mysqli_stmt_fetch($stmt_empFunction)) {
    //printf("%s | %s | %s | %s \r\n", $id, $username, $password, $fullname);
  }


}
else {
  echo "No result";
}
}

/* close statement */
//mysqli_stmt_close($stmt_empFunction);
/* close connection */
mysqli_close($link);

?>
