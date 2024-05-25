<?php
session_start();

// Include config file
require_once "../config.php";

$roleID = $_SESSION["roleID"];
$empUsers = $_POST["empUsers"];
$funcIDs = $_POST["funcIDs"];

$grandPermissionStatus = "";
$grandPermissionString = "";

echo "Danh sách User cần phân quyền :<br>";
foreach ($empUsers as $empUser) {
    echo $empUser . "<br>";
}

echo "Danh sách Quyền đã chọn :<br>";
foreach ($funcIDs as $funcID) {
    echo $funcID . "<br>";
}

$NoOfFuncGranded = 0;

//Count All Granded permission for selected user
foreach ($empUsers as $empUser) {
    $sql = "SELECT functionID FROM emp_func WHERE username = ?";

    if($stmt = mysqli_prepare($link, $sql)){
        echo "Bắt đầu chạy đếm các quyền đã cấp cho User : " . $empUser . "<br>" ;
        // Bind variables to the prepared statement as parameters
        mysqli_stmt_bind_param($stmt, "s", $param_username);
        
        // Set parameters
        $param_username = $empUser;
        
        // Attempt to execute the prepared statement
        if(mysqli_stmt_execute($stmt)){
            // Store result
            mysqli_stmt_store_result($stmt);
            
            /* bind result variables */
            mysqli_stmt_bind_result($stmt,$bFuncID);
            while (mysqli_stmt_fetch($stmt)) {
                $NoOfFuncGranded++;
            }
            echo "Số lượng chức năng đã cấp : " . $NoOfFuncGranded . "<br>";
            
        } else {
            echo "Error Execute DB Query";
            $grandPermissionStatus = "Error";
            $grandPermissionString = "Lỗi khi cập nhật phân quyền";
        }
        
        mysqli_stmt_close($stmt);
    }

    //If NoOfFunc > 0 => Granded Function => Delete all and Insert again with new function

    if ($NoOfFuncGranded > 0) {
        $sql = "DELETE FROM emp_func WHERE username = ?";

        if($stmt = mysqli_prepare($link, $sql)){
            echo "Bắt đầu chạy đếm các quyền đã cấp cho User : " . $empUser . "<br>" ;
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "s", $param_username);
            
            // Set parameters
            $param_username = $empUser;
            
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                
                
            } else { 
                echo "Error Execute DB Query";
                $grandPermissionStatus = "Error";
                $grandPermissionString = "Lỗi khi cập nhật phân quyền";
            }
            mysqli_stmt_close($stmt);
        }
    } 

    //Insert new function for user
    $NoOfFuncNeedGrand = sizeof($funcIDs);
    echo "Có " . $NoOfFuncNeedGrand . " quyền cần phân giao";
    
    foreach ($funcIDs as $funcID) {
        $sql = "INSERT INTO emp_func (emp_func.username, emp_func.functionID) VALUES (?,?)";

        if($stmt = mysqli_prepare($link, $sql)){
            echo "Bắt đầu chạy thêm các quyền " . $funcID .  " cho User : " . $empUser . "<br>" ;
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "si", $param_empUser, $param_functionID);
            
            // Set parameters
            $param_empUser = $empUser;
            $param_functionID = $funcID;
            
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                $grandPermissionStatus = "Success";
                $grandPermissionString = "Cấp phân quyền thành công !";
                
            } else {
                echo "Error Execute DB Query";
                $grandPermissionStatus = "Error";
                $grandPermissionString = "Lỗi khi cập nhật phân quyền";
            }
            mysqli_stmt_close($stmt);
        }
     } 
    
}

// Close connection
mysqli_close($link);

// Redirect user to changepass page
if ($roleID == 1) {
    header("location: ../adminGrandPermission.php");
}
else if ($roleID == 2) {
    header("location: ../regionGrandPermission.php");
}
else if ($roleID ==3) {
    header("location: ../regionGrandPermission.php");
}
else if ($roleID==4 || $roleID==8 || $roleID==9 || $roleID==10) {
    $_SESSION["grandPermissionStatus"] = $grandPermissionStatus;
    $_SESSION["ResponseString"] = $grandPermissionString;
    header("location: ../empPermissionGrand.php");
}


?>