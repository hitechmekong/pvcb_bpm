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

$empID = $_POST["empID"];

$startTime=date('Y-m-d H:i:s',strtotime($_POST["todo_startTime"]));
$endTime=date('Y-m-d H:i:s',strtotime($_POST["todo_endTime"]));


echo $startTime . "<br>";
echo $endTime . "<br>";
print_r ($empID);

$NoOfSelected = count($empID);

echo "Array Count " . $NoOfSelected;

$sql = "INSERT INTO todo (todo.empID, todo.startTime, todo.endTime, todo.statusID, todo.todoContent) VALUES (?,?,?,?,?)";


if($stmt = mysqli_prepare($link, $sql)){
    // Bind variables to the prepared statement as parameters
    mysqli_stmt_bind_param($stmt, "issis", $param_empID, $param_startTime, $param_endTime,$param_statusID, $param_content);
    
    // Set parameters
    
    $param_startTime = $startTime;
    $param_endTime = $endTime;
    $param_statusID = 1;
    $param_content = $_POST["todo_content"];
    
    
    
    for ($i=0; $i<$NoOfSelected; $i++) {
        $param_empID = $empID[$i];
        
        // Attempt to execute the prepared statement
        if(mysqli_stmt_execute($stmt)){
            echo "Insert data success";
        } else echo "Error insert to database";
    }
    
    
}

// Clost Statement
mysqli_stmt_close($stmt);

// Close connection
mysqli_close($link);


header("location: ../branchWorkManage.php");
?>