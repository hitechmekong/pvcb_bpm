<?php
session_start();

// Include config file
require_once "../config.php";

$todoID = $_POST["todoID"];
//$todoID = 1;

//Update Process Value
$sql= "UPDATE todo SET todo.isLate = 'accepted' WHERE todo.todoID= ?";

if($stmt = mysqli_prepare($link, $sql)){
    // Bind variables to the prepared statement as parameters
    mysqli_stmt_bind_param($stmt, "i", $param1);
    
    // Set parameters
    $param1 = $todoID;
    // Attempt to execute the prepared statement
    if(mysqli_stmt_execute($stmt)){
       echo true;
    }
}

mysqli_stmt_close($stmt);
 
// Close connection
mysqli_close($link);

//header("location: ../empWorkManage.php");
?>