<?php
session_start();

header("Content-Type: application/json", true);

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


$sel_roleID = $_POST["sel_roleID"];

//Update Process Value
$sql= "SELECT
	employee.id,
    employee.fullname
FROM
	employee
WHERE
	employee.roleID = ?";

$fullData="";

if($stmt = mysqli_prepare($link, $sql)){
    // Bind variables to the prepared statement as parameters
    mysqli_stmt_bind_param($stmt, "i", $param1);
    
    // Set parameters
    $param1 = $sel_roleID;
    // Attempt to execute the prepared statement
    if(mysqli_stmt_execute($stmt)){
        // Store result
        mysqli_stmt_store_result($stmt);
        
        /* bind result variables */
        mysqli_stmt_bind_result($stmt,$empID, $empName);
        while (mysqli_stmt_fetch($stmt)) {
            $row["empID"] = $empID;
            $row["empName"] = $empName;
            $fullData = $fullData . json_encode($row);

        }
        echo $fullData;
    }
}

mysqli_stmt_close($stmt);
 
// Close connection
mysqli_close($link);

//header("location: ../empWorkManage.php");
?>