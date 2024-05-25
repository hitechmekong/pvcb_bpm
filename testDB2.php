<?php

// Include config file
require_once "config.php";

$emp = 3;



//$sql = "SELECT `function`.funcName FROM emp_func INNER JOIN `function` ON emp_func.functionID = `function`.id WHERE emp_func.username = ?";
//$sql = "SELECT brName FROM branch WHERE branchID = ?";
//$sql = "SELECT roleName FROM role WHERE roleID = ?";



$sql = "SELECT
	todo.todoID,
	todo.startTime,
	todo.endTime,
	todo.todoContent,
	statustodo.statusName,
FROM
	todo
	INNER JOIN
	statustodo
	ON
		todo.statusID = statustodo.statusID
	INNER JOIN
	employee
	ON
		todo.empID = employee.id
WHERE
	todo.empID = ? AND
	todo.startTime >= CURDATE() - 3
ORDER BY
	statustodo.statusName DESC,
	todo.startTime DESC";


if($stmt = mysqli_prepare($link, $sql)){
    // Bind variables to the prepared statement as parameters
    mysqli_stmt_bind_param($stmt, "i", $param);
    
    // Set parameters
    $param = $emp;
    // Attempt to execute the prepared statement
    if(mysqli_stmt_execute($stmt)){
        // Store result
        mysqli_stmt_store_result($stmt);
        
        /* bind result variables */
        mysqli_stmt_bind_result($stmt, $bTodoID, $bStartTime, $bEndTime, $bTodoContent, $bStatusName);
        
            
            while (mysqli_stmt_fetch($stmt)) {
                echo $bStartTime;
                echo " | ";
                echo $bTodoContent;
                echo "<br>";
           
        }
       
    }
}


mysqli_stmt_close($stmt);

mysqli_close($link);
?>
