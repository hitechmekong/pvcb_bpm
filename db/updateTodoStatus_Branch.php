<?php
session_start();

// Include config file
require_once "../config.php";

// Define variables and initialize with empty values
$username= "";
$fullname="";

//Read data from session
$todoCheckBox = 0;
$empID = $_SESSION["id"];
$fullname = $_SESSION["fullname"];
$username = $_SESSION["username"];
$branchID = $_SESSION["branchID"];
$roleID = $_SESSION["roleID"];
$teamID = $_SESSION["teamID"];
$todoID = $_SESSION["todoID"];
$todoStatus = $_SESSION["todoStatus"];
if (isset($_POST["todoCheckBox"])) {
    $todoCheckBox = $_POST["todoCheckBox"];
    $NoOfCheck = count($todoCheckBox);
} else $NoOfCheck = 0;

$NoOfTodo = count($todoID);

//$checkbox=$_POST["todoCheckBox"];
echo "Có " . $NoOfTodo. " Việc cần làm <br>";
echo "Có " . $NoOfCheck. " Việc đã hoàn thành <br>";


foreach ($todoID as $value) {
     echo "TodoID List " . $value . "<br>";
}
foreach ($todoStatus as $value) {
    echo "TodoID Status " . $value . "<br>";
}
if ($NoOfCheck > 0) {
    foreach ($todoCheckBox as $value) {
        echo "TodoID CheckBox " . $value . "<br>";
    }
    
    //Check Match Status
    $NoOfMatch = 0;
    echo "<br> Danh sách trùng <br>";
    for ($i = 0 ; $i<$NoOfCheck; $i++) {
        for ($n=0; $n<$NoOfTodo; $n++) {
            if ($todoCheckBox[$i] == $todoID[$n]) {
                $matchToDo[$NoOfMatch] = $todoID[$n];
                $NoOfMatch++;
                
            }
        }
    }
    
    foreach ($matchToDo as $value) {
        echo "Todo ID : " . $value . "<br>";
    }
    
    echo "<br> 2 mảng khác nhau như sau ";
    $diff = array_diff ($todoID, $todoCheckBox) ;
    foreach ($diff as $value2) {
        echo " ". $value2 . " ";
    }
};


//Update Process Value
$sql_process = "UPDATE todo SET todo.statusID = 1 WHERE todo.todoID= ?";

//Update Finish value
$sql_finish = "UPDATE todo SET todo.statusID = 2 WHERE todo.todoID= ?";

if ($NoOfCheck == 0) {
    echo "Không check việc nào <br>";
    for ($i = 0 ; $i < $NoOfTodo ; $i ++) {
        if ($todoStatus[$i] == "Finished") {
            echo "Trạng thái có thay đổi => cập nhật thành process". "<br>";
            if($stmt = mysqli_prepare($link, $sql_process)){
                echo "Bắt đầu chạy Update Process <br>";
                // Bind variables to the prepared statement as parameters
                mysqli_stmt_bind_param($stmt, "i", $param_todoID);
                
                // Set parameters
                $param_todoID = $todoID[$i];
                
                // Attempt to execute the prepared statement
                if(mysqli_stmt_execute($stmt)){
                    echo "Updated TodoID " . $todoID[$i] . "<br>";
                } else echo "Error insert to database";
                mysqli_stmt_close($stmt);
            }
        }
    }
}

//Update to finish
foreach ($matchToDo as $value) {
    $index = array_search($value, $todoID);
    if ($todoStatus[$index] == "Processing") {
        echo "Trạng thái có thay đổi => cập nhật thành finish". "<br>";
        if($stmt = mysqli_prepare($link, $sql_finish)){
            echo "Bắt đầu chạy Update Finish <br>";
            
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "i", $param_todoID);
            
            // Set parameters
            $param_todoID = $value;
            
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                echo "Updated TodoID " . $value."<br>";
            } else echo "Error insert to database";
            mysqli_stmt_close($stmt);
            //break;
        }
    }
}

//Update to Process
foreach ($diff as $value) {
    $index = array_search($value, $todoID);
    if ($todoStatus[$index] == "Finished") {
        echo "Trạng thái có thay đổi => cập nhật thành process". "<br>";
        if($stmt = mysqli_prepare($link, $sql_process)){
            echo "Bắt đầu chạy Update Process <br>";
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "i", $param_todoID);
            
            // Set parameters
            $param_todoID = $value;
            
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                echo "Updated TodoID " . $value . "<br>";
            } else echo "Error insert to database";
            mysqli_stmt_close($stmt);
            //break;
        }
    }
}

    


// Close connection
mysqli_close($link);

header("location: ../branchWorkManage.php");
?>