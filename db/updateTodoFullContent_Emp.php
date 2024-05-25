<?php
session_start();

// Include config file
require_once "../config.php";

// Define variables and initialize with empty values
$username= "";
$fullname="";


//Read data from $_POST
$todoID = $_POST["todo_id"];
$startTime=date('Y-m-d H:i:s',strtotime($_POST["todo_startTime_popup"]));
$endTime=date('Y-m-d H:i:s',strtotime($_POST["todo_endTime_popup"]));
$todoContent = $_POST["todo_content_popup"];

echo "Todo ID: " . $todoID. "<br>" ;
echo "Todo Start Time: " . $startTime. "<br>" ;
echo "Todo End Time: " . $endTime. "<br>" ;
echo "Todo Content: " . $todoContent. "<br>" ;


$sql= "UPDATE todo SET todo.startTime=?, todo.endTime=?, todo.todoContent=? WHERE todo.todoID= ?";

if($stmt = mysqli_prepare($link, $sql)){
    // Bind variables to the prepared statement as parameters
    mysqli_stmt_bind_param($stmt, "sssi", $param1,$param2,$param3,$param4);
    
    // Set parameters
    
    $param1 = $startTime;
    $param2 = $endTime;
    $param3 = $todoContent;
    $param4 = $todoID;
    // Attempt to execute the prepared statement
    if(mysqli_stmt_execute($stmt)){
        // Store result
        //mysqli_stmt_store_result($stmt);
        //echo $stmt;
        echo "Update Success";
        
    }
}


mysqli_stmt_close($stmt);

// Close connection
mysqli_close($link);

header("location: ../empWorkManage.php");
?>