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


$old_passwold = $_SESSION["password"];
$input_old_password = $_POST["old_password"];
$input_new_password = $_POST["new_password"];
$input_repeat_password = $_POST["repeat_password"];

echo "Bắt đầu cập nhật mật khẩu <br>";
echo "Mật khẩu cũ : " . $old_passwold . "<br>";
echo "Mật khẩu mới : " . $input_new_password . "<br>";
echo "Mật khẩu mới L2 : " . $input_repeat_password . "<br>";

//Update Password Value
$sql = "UPDATE employee SET employee.password = ? WHERE employee.id = ?";

if ($input_old_password != $old_passwold) {
    $_SESSION["UpdateString"] = "Nhập sai mật khẩu hiện tại";
    $_SESSION["changePassStatus"] = "Error";
} else if ($input_new_password != $input_repeat_password) {
    $_SESSION["UpdateString"] = "Nhập mật khẩu mới không khớp";
    $_SESSION["changePassStatus"] = "Error";
} else {
    
    $_SESSION["password"] = $input_new_password;
    $_SESSION["changePassStatus"] = "Success";
    
    if($stmt = mysqli_prepare($link, $sql)){
        echo "Bắt đầu chạy cập nhật mật khẩu <br>";
        // Bind variables to the prepared statement as parameters
        mysqli_stmt_bind_param($stmt, "si", $param_new_password, $param_empID);
        
        // Set parameters
        $param_new_password = password_hash($input_new_password, PASSWORD_DEFAULT);
        $param_empID = $empID;
        
        // Attempt to execute the prepared statement
        if(mysqli_stmt_execute($stmt)){
            echo "Cập nhật thành công";
            $_SESSION["UpdateString"] = "Cập nhật mật khẩu thành công !";
            $_SESSION["changePassStatus"] = "Success";
            
        } else echo "Error insert to database";
        mysqli_stmt_close($stmt);
    }
    
}



// Close connection
mysqli_close($link);

// Redirect user to changepass page
if ($roleID == 1) {
    header("location: ../adminChangePass.php");
}
else if ($roleID == 2) {
    header("location: ../regionChangePass.php");
}
else if ($roleID ==3) {
    header("location: ../regionChangePass.php");
}
else if ($roleID==4 || $roleID==8 || $roleID==9 || $roleID==10) {
    header("location: ../branchChangePass.php");
}
else if ($roleID==5) {
    header("location: ../empChangePass.php");
}
else if ($roleID==6) {
    header("location: ../empChangePass.php");
}
else if ($roleID==7) {
    header("location: ../teamLeaderChangePass.php");
}
else if ($roleID==8) {
    header("location: ../teamLeaderChangePass.php");
};

?>