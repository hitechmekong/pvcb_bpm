<?php
session_start();

// Include config file
require_once "../config.php";

// Define variables and initialize with empty values
$username= "";
$fullname="";

//Read data from session
$fullname = $_SESSION["fullname"];
$username = $_SESSION["username"];
$branchID = $_SESSION["branchID"];
$roleID = $_SESSION["roleID"];
$teamID = $_SESSION["teamID"];
$todoID = $_POST["todoID"];
//$todoID = 1;

//Update Process Value
$sql= "SELECT
	todo.todoID,
    todo.startTime, 
	todo.endTime, 
	todo.todoContent,
    todo.empID
FROM
	todo
WHERE
	todo.todoID = ?";

if($stmt = mysqli_prepare($link, $sql)){
    // Bind variables to the prepared statement as parameters
    mysqli_stmt_bind_param($stmt, "i", $param1);
    
    // Set parameters
    $param1 = $todoID;
    // Attempt to execute the prepared statement
    if(mysqli_stmt_execute($stmt)){
        // Store result
        mysqli_stmt_store_result($stmt);
        
        /* bind result variables */
        mysqli_stmt_bind_result($stmt,$todo_id, $startTime, $endTime, $content,$empID);
        while (mysqli_stmt_fetch($stmt)) {
            $row["todoID"] = $todo_id;
            $row["startTime"] = $startTime;
            $row["endTime"] = $endTime;
            $row["content"] = $content;
            $row["empID"] = $empID;
        }
        echo json_encode($row);
    }
}

mysqli_stmt_close($stmt);
 
// Close connection
mysqli_close($link);

//header("location: ../empWorkManage.php");
?>