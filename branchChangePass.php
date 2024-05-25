<?php


// Starting session
session_start();

//Check if not logged in, redirect to login page
if(!(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true)) {
  // Unset all of the session variables
  $_SESSION = array();
  // Destroy the session.
  session_destroy();
  // Redirect to login page
  header("location: login.php");

  exit;
}

//Check if not logged in, redirect to login page
if(!($_SESSION["roleID"]==4 || $_SESSION["roleID"]==8 || $_SESSION["roleID"]==9 || $_SESSION["roleID"]==10)) {
    // Unset all of the session variables
    $_SESSION = array();
    // Destroy the session.
    session_destroy();
    // Redirect to login page
    header("location: login.php");
    
    exit;
}

// Include config file
require_once "config.php";

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

$password = $_SESSION["password"];

$isChangePassError = false;
$isChangePassSuccess = false;

$changePassResponse = "";

if (isset($_SESSION["UpdateString"]) && ($_SESSION["changePassStatus"] == "Error")) {
    $isChangePassError = true;
    $changePassResponse = $_SESSION["UpdateString"];
} else if (isset($_SESSION["UpdateString"]) && ($_SESSION["changePassStatus"] == "Success")) {
    $isChangePassSuccess = true;
    $changePassResponse = $_SESSION["UpdateString"];
}


$NoOfFunction = 0;

$sql = "SELECT
	`function`.funcName
FROM
	emp_func
	INNER JOIN
	`function`
	ON 
		emp_func.functionID = `function`.id
WHERE
	emp_func.username = ? AND
	`function`.`status` = 'enable'";


if($stmt = mysqli_prepare($link, $sql)){
    // Bind variables to the prepared statement as parameters
    mysqli_stmt_bind_param($stmt, "s", $param_username);
    
    // Set parameters
    $param_username = $username;
    // Attempt to execute the prepared statement
    if(mysqli_stmt_execute($stmt)){
        // Store result
        mysqli_stmt_store_result($stmt);
        
        /* bind result variables */
        mysqli_stmt_bind_result($stmt, $empFunction);
        $NoOfFunction = 0;
        while (mysqli_stmt_fetch($stmt)) {
            $function[$NoOfFunction] = $empFunction;
            $NoOfFunction++;
        }
        
    }
}

//declare variable
$branchName = "";
$roleName = "";

//Get Branch Name from Database base on BranchID stored in Session
$sql = "SELECT brName FROM branch WHERE branchID = ?";


if($stmt = mysqli_prepare($link, $sql)){
    // Bind variables to the prepared statement as parameters
    mysqli_stmt_bind_param($stmt, "s", $param_branchID);
    
    // Set parameters
    $param_branchID = $branchID;
    // Attempt to execute the prepared statement
    if(mysqli_stmt_execute($stmt)){
        // Store result
        mysqli_stmt_store_result($stmt);
        
        /* bind result variables */
        mysqli_stmt_bind_result($stmt, $brName);
        while (mysqli_stmt_fetch($stmt)) {
            $branchName = $brName;
            
        }
    }
}


//Get User Role from Database base on RoleID stored in Session
$sql = "SELECT roleName FROM role WHERE roleID = ?";


if($stmt = mysqli_prepare($link, $sql)){
    // Bind variables to the prepared statement as parameters
    mysqli_stmt_bind_param($stmt, "s", $param_roleID);
    
    // Set parameters
    $param_roleID = $roleID;
    // Attempt to execute the prepared statement
    if(mysqli_stmt_execute($stmt)){
        // Store result
        mysqli_stmt_store_result($stmt);
        
        /* bind result variables */
        mysqli_stmt_bind_result($stmt, $rName);
        while (mysqli_stmt_fetch($stmt)) {
            $roleName = $rName;
            
        }
    }
}

//Set value to Session
$_SESSION["branchName"] = $branchName;
$_SESSION["roleName"] = $roleName;

//Count number of Case are processing
$sql = "SELECT
	`case`.caseID
FROM
	`case`
	INNER JOIN
	`status`
	ON 
		`case`.statusID = `status`.statusID
	INNER JOIN
	employee
	ON 
		`case`.empID = employee.id
	INNER JOIN
	product
	ON 
		`case`.productID = product.productID
	INNER JOIN
	producttype
	ON 
		product.typeID = producttype.typeID
WHERE
	employee.username = ? AND
	`status`.statusName = 'Đang xử lý' OR
	(
		`status`.statusName = 'Đang thu thập hồ sơ' OR
		`status`.statusName = 'Đang giới thiệu'
	) AND
	producttype.typeName = 'Tín dụng'";

if($stmt = mysqli_prepare($link, $sql)){
    // Bind variables to the prepared statement as parameters
    mysqli_stmt_bind_param($stmt, "s", $param_username);
    
    // Set parameters
    $param_username = $username;
    // Attempt to execute the prepared statement
    if(mysqli_stmt_execute($stmt)){
        // Store result
        mysqli_stmt_store_result($stmt);
        
        /* bind result variables */
        mysqli_stmt_bind_result($stmt, $empFunction);
        $NoOfCase = 0;
        while (mysqli_stmt_fetch($stmt)) {
            $NoOfCase++;
        }
        
    }
}


//get Message
$sql = "SELECT
	message.content, 
	message.`from`,
    message.startTime
FROM
	message
	INNER JOIN
	mess_role
	ON 
		message.id = mess_role.messageID
WHERE
	mess_role.roleID = ? AND
	(
		message.startTime <= CURDATE() AND
		message.endTime >= CURDATE()
	)
ORDER BY
	message.id DESC";

if($stmt = mysqli_prepare($link, $sql)){
    // Bind variables to the prepared statement as parameters
    mysqli_stmt_bind_param($stmt, "s", $param);
    
    // Set parameters
    $param = $roleID;
    
    // Attempt to execute the prepared statement
    if(mysqli_stmt_execute($stmt)){
        // Store result
        mysqli_stmt_store_result($stmt);
        
        /* bind result variables */
        mysqli_stmt_bind_result($stmt, $content, $from, $startTime);
        $NoOfMessage = 0;
        while (mysqli_stmt_fetch($stmt)) {
            $message[$NoOfMessage] = $content;
            $sender[$NoOfMessage] = $from;
            $sendTime[$NoOfMessage] = $startTime;
            $NoOfMessage++;
        }
        
    }
}

//Count TodoList
$sql = "SELECT
	todo.todoID, 
	CAST(todo.startTime as Date) as StartDate,
	CAST(todo.endTime as Date) as EndDate,
	todo.todoContent, 
	statustodo.statusName
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

$NoOfPendingTodo = 0;

if($stmt = mysqli_prepare($link, $sql)){
    // Bind variables to the prepared statement as parameters
    mysqli_stmt_bind_param($stmt, "i", $param);
    
    // Set parameters
    $param = $empID;
    // Attempt to execute the prepared statement
    if(mysqli_stmt_execute($stmt)){
        // Store result
        mysqli_stmt_store_result($stmt);
        
        /* bind result variables */
        mysqli_stmt_bind_result($stmt, $bTodoID, $bTodoStartTime, $bTodoEndTime, $bTodoContent, $bTodoStatus);
        $NoOfTodo = 0;
       
        while (mysqli_stmt_fetch($stmt)) {
            $todoID[$NoOfTodo] = $bTodoID;
            $todoStartDate [$NoOfTodo] = $bTodoStartTime;
            $todoEndDate[$NoOfTodo] = $bTodoEndTime;
            $todoContent[$NoOfTodo] = $bTodoContent;
            $todoStatus[$NoOfTodo] = $bTodoStatus;
            $NoOfTodo++;
            if ($bTodoStatus == "Processing") {
                $NoOfPendingTodo++;
            }
        }
        
    }
}


mysqli_stmt_close($stmt);

mysqli_close($link);

?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Dashboard | Hệ thống quản trị KPI - PVcomBank</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bbootstrap 4 -->
  <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-warning navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="branch.php" class="nav-link">Trang chủ</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="dist/contact.html" class="nav-link">Liên hệ hỗ trợ</a>
      </li>
    </ul>

    <!-- SEARCH FORM -->
    <form class="form-inline ml-3">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" placeholder="Tìm kiếm" aria-label="Tìm kiếm">
        <div class="input-group-append">
          <button class="btn btn-navbar" type="submit">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>
    
    
    

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      
      
      <li class="nav-item d-none d-sm-inline-block">
        <a class="nav-link"><?php 
        echo $username;
        echo " / ";
        echo $roleName;
        echo " / ";
        echo $branchName;
        ?></a>
      </li>
        
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-comments"></i>
          <span class="badge badge-danger navbar-badge"><?php echo $NoOfMessage?></span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <?php 
          if ($NoOfMessage >5) {
              $n = 5;
              
          } else $n = $NoOfMessage;
          for ($i=0; $i <$n; $i++) {
            echo "
                <a href='#' class='dropdown-item'>
            <!-- Message Start -->
            <div class='media'>
              <img src='dist/img/avatar5.png' alt='Người gửi' class='img-size-50 mr-3 img-circle'>
              <div class='media-body'>
                <h3 class='dropdown-item-title'>";

                  echo $sender[$i];
                  echo "
                  <span class='float-right text-sm text-danger'><i class='fas fa-star'></i></span>
                </h3>
                <p class='text-sm'>
            ";
            echo $message[$i];
            echo "
            </p>
                <p class='text-sm text-muted'><i class='far fa-clock mr-1'></i>";
                echo $sendTime[$i];
                echo "</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class='dropdown-divider'></div>
            ";
          }
          
          ?>
          
          
          
          <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
        </div>
      </li>
      
      <?php 
      if ($roleID == 1) {
          echo "
            <li class='nav-item'>
                <a class='nav-link' data-widget='control-sidebar' data-slide='true' href='#'>
                    <i class='fas fa-th-large'></i>
                </a>
            </li>
      
            ";
      }
      
      
      ?>
      
      <li class="nav-item">
        <a class="nav-link" href="logout.php">
          <i class="fas fa-door-open"></i>
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-warning elevation-4">
    <!-- Brand Logo -->
    <a href="#" class="brand-link">
      <img src="dist/img/logo_PvcomBank_white.png" alt="PVcomBank Logo" height="71" width="150" class="brand-image"/>
      <span class="brand-text font-weight-bold">mBPM</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar nav-flat">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="dist/img/avatar5.png" class="img-circle elevation-2" alt="Ảnh người dùng">
        </div>
        <div class="info">
          <a href="#" class="d-block"><?php echo $fullname ?></a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          
          <?php 
          
          for ($i=0; $i<$NoOfFunction; $i++) {
              if ($function[$i] == "DashboardEmp") {
                  echo " 
                <li class='nav-item'>
            <a href='employee.php' class='nav-link active'>
              <i class='nav-icon fas fa-tachometer-alt'></i>
              <p>Dashboard</p>
            </a>
          </li>

                ";           
  
              }
              
              else if ($function[$i] == "KPIempManage") {
                  echo "
            <li class='nav-item'>
            <a href='employeekpi.php' class='nav-link'>
              <i class='nav-icon fas fa-chart-line'></i>
              <p>Quản lý KPIs</p>
            </a>
          </li>
                ";
              }
            
              else if ($function[$i] == "CustomerManage") {
                  echo "
                    <li class='nav-item has-treeview'>
            <a href='#' class='nav-link'>
              <i class='nav-icon fas fa-address-book'></i>
              <p>
                Khách hàng
                <i class='fas fa-angle-left right'></i>
              </p>
            </a>
            <ul class='nav nav-treeview'>
              <li class='nav-item'>
                <a href='addcustomer.php' class='nav-link'>
                  <i class='far fa-circle nav-icon'></i>
                  <p>Thêm mới KH</p>
                </a>
              </li>
              <li class='nav-item'>
                <a href='pages/layout/top-nav-sidebar.html' class='nav-link'>
                  <i class='far fa-circle nav-icon'></i>
                  <p>Cập nhật Khách hàng</p>
                </a>
              </li>

            </ul>
          </li>      
                ";
              }
              else if ($function[$i] == "CaseManage") {
                 echo "
                     <li class='nav-item has-treeview'>
            <a href='#' class='nav-link'>
              <i class='nav-icon fas fa-folder-open'></i>
              <p>
                Quản lý Hồ sơ
                <i class='fas fa-angle-left right'></i>
              </p>
            </a>
            <ul class='nav nav-treeview'>
              <li class='nav-item'>
                <a href='caseprocess.php' class='nav-link'>
                  <i class='far fa-circle nav-icon'></i>
                  <p>Tiến độ Hồ sơ</p>
                </a>
              </li>
              <li class='nav-item'>
                <a href='pages/tables/data.html' class='nav-link'>
                  <i class='far fa-circle nav-icon'></i>
                  <p>Thêm mới hồ sơ</p>
                </a>
              </li>
              <li class='nav-item'>
                <a href='pages/tables/jsgrid.html' class='nav-link'>
                  <i class='far fa-circle nav-icon'></i>
                  <p>Cập nhật hồ sơ</p>
                </a>
              </li>
            </ul>
          </li>
                "; 
              }
              
              else if ($function[$i] == "EmpManage") {
                 echo "
                    <li class='nav-item has-treeview'>
            <a href='#' class='nav-link'>
              <i class='nav-icon fas fa-user-tie'></i>
              <p>
                Quản lý Nhân viên
                <i class='right fas fa-angle-right'></i>
              </p>
            </a>
            <ul class='nav nav-treeview'>
              <li class='nav-item'>
                <a href='empPermissionGrand.php' class='nav-link'>
                  <i class='far fa-circle nav-icon'></i>
                  <p>Phân quyền nhân viên</p>
                </a>
              </li>
              
            </ul>
          </li>
                "; 
              }
              else if ($function[$i] == "WorkManage") {
                  echo "
           <li class='nav-item'>
            <a href='branchWorkManage.php' class='nav-link'>
              <i class='nav-icon fas fa-edit'></i>
              <p>
                Quản lý công việc
                <span class='badge badge-info right'>";
                echo $NoOfPendingTodo;
                echo "</span>
              </p>
            </a>
          </li>
                    
                ";  
              }
             
              else if ($function[$i] == "BadDebtManage") {
                  echo "
            <li class='nav-item'>
            <a href='pages/calendar.html' class='nav-link'>
              <i class='nav-icon fas fa-crosshairs'></i>
              <p>
                Quản lý nợ xấu
                <span class='badge badge-info right'>5</span>
              </p>
            </a>
          </li>

                ";
                  
                  
              }
              else if ($function[$i] == "Elearning") {
                  echo "
                <li class='nav-item'>
            <a href='pages/calendar.html' class='nav-link'>
              <i class='nav-icon fas fa-marker'></i>
              <p>
                Trung tâm đào tạo
                <span class='badge badge-info right'>3</span>
              </p>
            </a>
          </li>

            ";
                  
              }
              
          }
  
          ?>
 
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-calendar-alt"></i>
              <p>
                Lịch làm việc
                <span class="badge badge-info right">0</span>
              </p>
            </a>
          </li>
          
          <li class="nav-item has-treeview menu-open">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-cog"></i>
              <p>
                Cài đặt
                <i class="right fas fa-angle-right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="branchChangePass.php" class="nav-link active">
                  <i class="fas fa-key nav-icon"></i>
                  <p>Đổi mật khẩu</p>
                </a>
              </li>
              
            </ul>
          </li>

          
          
          <li class="nav-item">
            <a href="logout.php" class="nav-link">
              <i class="nav-icon fas fa-door-open"></i>
              <p>
                Đăng xuất

              </p>
            </a>
          </li>

      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" >
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Thay đổi mật khẩu</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Cài đặt</a></li>
              <li class="breadcrumb-item active">Thay đổi mật khẩu</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content" >
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        
        <!-- Main row -->
        <div class="row d-flex justify-content-center">
          <!-- Left col -->
          <section class="col-lg-5">
        <!-- Change pass Form -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Vui lòng nhập thông tin</h3>
              </div>
              <form id="changePass" action="db/changePass.php" method="post">
              <div class="card-body">
                
                 <!-- Start Row -->
             
				<div class="row">
					<div class="col-lg-12">
                      <!-- textarea -->
                      <div class="form-group">
                        <label>Nhập mật khẩu hiện tại</label>
                        <div class="input-group" id="old_password">
                              
                              <input type="password" name="old_password" id="old_password" class="form-control" data-toggle="password" required/>
                              
                        </div>
                      </div>
                    </div>
				</div>
				
				<div class="row">
					<div class="col-lg-12">
                      <!-- textarea -->
                      <div class="form-group">
                        <label>Nhập mật khẩu mới</label>
                        <div class="input-group" id="new_password">
                             
                              <input type="password" name="new_password" id="new_password" class="form-control" data-toggle="password" required/>
                              
                        </div>
                      </div>
                    </div>
				</div>
				
				<div class="row">
					<div class="col-lg-12">
                      <!-- textarea -->
                      <div class="form-group">
                        <label>Nhập lại mật khẩu mới</label>
                        <div class="input-group" id="repeat_password">
                             
                              <input type="password" id="repeat_password" name="repeat_password" class="form-control" data-toggle="password" required>
                              
                        </div>
                      </div>
                    </div>
				</div>
				
				
				
				<?php 
				
				if ($isChangePassError) {
				    echo "
    
    				<div class='row'>
    					<div class='col-lg-12'>
                          <span class='help-block' style='color: red'> " . $changePassResponse . "</span>
          
                        </div>
    				</div>
          
                    ";
				    $_SESSION["UpdateString"] = "";
				    $_SESSION["changePassStatus"] = "";
				}
				
				if ($isChangePassSuccess) {
				    echo "
    
    				<div class='row'>
    					<div class='col-lg-12'>
                          <span class='help-block' style='color: blue'> " . $changePassResponse . "</span>
        
                        </div>
    				</div>
        
                    ";
				    $_SESSION["UpdateString"] = "";
				    $_SESSION["changePassStatus"] = "";
				}
				
				
				?>
				
				
			  </div>
				<div class="card-footer">
                  <button id="change_pass" name="change_pass" type="submit" class="btn btn-primary"><i class="fas fa-sync-alt"></i> Cập nhật</button>
              </div>
              
              
              
			</form>
				
            </div>
            <!-- /.card -->
            
            
            
          </section>
          <!-- /.Left col -->
          <!-- right col (We are only adding the ID to make the widgets sortable)-->
          
        </div>
        <!-- /.row (main row) -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <strong>Copyright &copy; 2020 <a href="#">Ứng dụng quản lý KPI - PVcomBank (mBPM)</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 1.0-alpha
    </div>
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<script src="plugins/bootstrap-show-password.min.js"></script>
</body>
</html>
