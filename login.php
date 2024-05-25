<?php
// Initialize the session
session_start();

// Check if the user is already logged in, if yes then redirect him to welcome page
if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true){
  header("location: index.php");
  exit;
}

// Include config file
require_once "config.php";

// Define variables and initialize with empty values
$username = $password = "";
$username_err = $password_err = $status_err = "";
$fullname = $status = $branchID = $roleID = $teamID = "";

// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){

  // Check if username is empty
  if(empty(trim($_POST["username"]))){
    $username_err = "Vui lòng nhập thông tin đăng nhập.";
  } else{
    $username = trim($_POST["username"]);
  }

  // Check if password is empty
  if(empty(trim($_POST["password"]))){
    $password_err = "Vui lòng nhập mật khẩu.";
  } else{
    $password = trim($_POST["password"]);
  }

  // Validate credentials
  if(empty($username_err) && empty($password_err)){
    // Prepare a select statement
    $sql = "SELECT id, username, password, fullname, status, branchID, roleID, teamID FROM employee WHERE username = ?";

    if($stmt = mysqli_prepare($link, $sql)){
      // Bind variables to the prepared statement as parameters
      mysqli_stmt_bind_param($stmt, "s", $param_username);

      // Set parameters
      $param_username = $username;

      // Attempt to execute the prepared statement
      if(mysqli_stmt_execute($stmt)){
        // Store result
        mysqli_stmt_store_result($stmt);

        // Check if username exists, if yes then verify password
        if(mysqli_stmt_num_rows($stmt) == 1){
          // Bind result variables
          mysqli_stmt_bind_result($stmt, $id, $username, $hashed_password, $fullname, $status, $branchID, $roleID, $teamID);
          if(mysqli_stmt_fetch($stmt)){
             if($status == "enable") {
               if(password_verify($password, $hashed_password)){
                 // Password is correct, so start a new session
                 session_start();

                 // Store data in session variables
                 $_SESSION["loggedin"] = true;
                 $_SESSION["id"] = $id;
                 $_SESSION["username"] = $username;
                 $_SESSION["fullname"] = $fullname;
                 $_SESSION["branchID"] = $branchID;
                 $_SESSION["roleID"] = $roleID;
                 $_SESSION["teamID"] = $teamID;
                 $_SESSION["password"] = $password;

                 // Redirect user to welcome page
                 if ($roleID == 1) {
                     header("location: admin.php");
                 }
                 else if ($roleID == 2) {
                     header("location: region.php");
                 } 
                 else if ($roleID ==3) {
                     header("location: region.php");
                 }
                 else if ($roleID==4 || $roleID==8 || $roleID==9 || $roleID==10) {
                     header("location: branch.php");
                 }
                 else if ($roleID==5) {
                     header("location: employee.php");
                 }
                 else if ($roleID==6) {
                     header("location: employee.php");
                 }
                 else if ($roleID==7) {
                     header("location: teamleader.php");
                 }
                 else if ($roleID==8) {
                     header("location: teamleader.php");
                 };
                                
               } else{
                 // Display an error message if password is not valid
                 $password_err = "Mật khẩu không chính xác.";
               }
             } else {
               $status_err = "Tài khoản hiện tại ngưng sử dụng. Vui lòng liên hệ quản trị viên.";
             }

          }
        } else{
          // Display an error message if username doesn't exist
          $username_err = "Tên đăng nhập không chính xác.";
        }
      } else{
        echo "Oops! Hệ thống lỗi chưa xác định, quý khách vui lòng truy cập sau.";
      }
    }

    // Close statement
    mysqli_stmt_close($stmt);
  }

  // Close connection
  mysqli_close($link);
}
?>


<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Hệ thống quản trị KPI - PVcomBank</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <img src="dist/img/logo_PvcomBank_300px.png" height="71" width="150"/><br>
    <a><b>Hệ thống quản trị KPI</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">Vui lòng điền thông tin đăng nhập</p>

      <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <div class="input-group mb-3 <?php echo (!empty($username_err)) ? 'has-error' : ''; ?>">
          <input type="username" name="username" class="form-control" placeholder="Tên đăng nhập" value="<?php echo $username; ?>">
          <span class="help-block"></span>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3" <?php echo (!empty($password_err)) ? 'has-error' : ''; ?>>
          <input type="password" name="password" class="form-control" placeholder="Mật khẩu" value="<?php echo $password; ?>">
          <span class="help-block"></span>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="remember">
              <label for="remember">
                Lưu mật khẩu
              </label>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-4">
            <button type="submit" class="btn btn-primary btn-block">Sign in</button>
          </div>
          <!-- /.col -->
        </div>
      </form>



      <p class="mb-1">
        <a href="forgot-password.html">Quên mật khẩu</a>
      </p>
	<?php
	if ($username_err<>"") {
	    print ("<span class='help-block' style='color: red'>$username_err </span><br>");
	}
	if ($password_err<>"") {
	    print "<span class='help-block' style='color: red'>$password_err</span><br>";
	}
	if ($status_err <> "") {
	    print "<span class='help-block' style='color: red'>$status_err</span><br>";
	}
	?>


    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>

</body>
</html>
