<?php
session_start();

// Include config file
require_once "../config.php";

// Define variables and initialize with empty values
$username= "";
$fullname="";

//Read data from session
$empID = $_SESSION["id"];
$fullname = $_SESSION["fullname"];
$username = $_SESSION["username"];
$branchID = $_SESSION["branchID"];
$roleID = $_SESSION["roleID"];
$teamID = $_SESSION["teamID"];


$startTime=date('Y-m-d H:i:s',strtotime($_POST["todo_startTime"]));
$endTime=date('Y-m-d H:i:s',strtotime($_POST["todo_endTime"]));

echo $startTime . "<br>";
echo $endTime;

$sql = "INSERT INTO todo (todo.empID, todo.startTime, todo.endTime, todo.statusID, todo.todoContent, todo.isLate) VALUES (?,?,?,?,?,?)";


if($stmt = mysqli_prepare($link, $sql)){
    // Bind variables to the prepared statement as parameters
    mysqli_stmt_bind_param($stmt, "ississ", $param_empID, $param_startTime, $param_endTime,$param_statusID, $param_content, $param_late);
    
    // Set parameters
    $param_empID = $empID;
    $param_startTime = $startTime;
    $param_endTime = $endTime;
    $param_statusID = 1;
    $param_content = $_POST["todo_content"];
    $param_late=$_POST["isLate"];
    
    // Attempt to execute the prepared statement
    if(mysqli_stmt_execute($stmt)){
        echo "Insert data success";
    } else echo "Error insert to database";
}

// Clost Statement
mysqli_stmt_close($stmt);

// Close connection
mysqli_close($link);
header("location: ../empWorkManage.php");
?>