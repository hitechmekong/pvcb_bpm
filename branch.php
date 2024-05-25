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
          
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-cog"></i>
              <p>
                Cài đặt
                <i class="right fas fa-angle-right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="branchChangePass.php" class="nav-link">
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
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Dashboard (Bảng thống kê)</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
              <li class="breadcrumb-item active">Dashboard</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3>05<sup style="font-size: 20px"> Hồ sơ</sup> </h3>
                <p>Hồ sơ đang xử lý</p>
              </div>
              <div class="icon">
                <i class="fas fa-folder-open"></i>
              </div>
              <a href="#" class="small-box-footer">Thông tin chi tiết <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
              <div class="inner">
                <h3>54<sup style="font-size: 20px"> Tr đ</sup></h3>

                <p>Doanh số bảo hiểm</p>
              </div>
              <div class="icon">
                <i class="fas fa-handshake"></i>
              </div>
              <a href="#" class="small-box-footer">Thông tin chi tiết <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
              <div class="inner">
                <h3>08<sup style="font-size: 20px"> Tỉ đ</sup> </h3>

                <p>Doanh số giải ngân</p>
              </div>
              <div class="icon">
                <i class="fas fa-donate"></i>
              </div>
              <a href="#" class="small-box-footer">Thông tin chi tiết <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-danger">
              <div class="inner">
                <h3>65<sup style="font-size: 20px;"> %</sup> </h3>

                <p>Tỉ lệ hoàn thành KPI</p>
              </div>
              <div class="icon">
                <i class="ion ion-pie-graph"></i>
              </div>
              <a href="#" class="small-box-footer">Thông tin chi tiết <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
        </div>
        <!-- /.row -->
        <!-- Main row -->
        <div class="row">
          <!-- Left col -->
          <section class="col-lg-7 connectedSortable">
            <!-- Custom tabs (Charts with tabs)-->
            


            <!-- TO DO List -->
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
                  <i class="ion ion-clipboard mr-1"></i>
                  Công việc cần làm
                </h3>

                <div class="card-tools">
                  <ul class="pagination pagination-sm">
                    <li class="page-item"><a href="#" class="page-link">&laquo;</a></li>
                    <li class="page-item"><a href="#" class="page-link">1</a></li>
                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                    <li class="page-item"><a href="#" class="page-link">3</a></li>
                    <li class="page-item"><a href="#" class="page-link">&raquo;</a></li>
                  </ul>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <ul class="todo-list" data-widget="todo-list">
                  <?php 
                  for ($i=0; $i<$NoOfTodo; $i++) {
                      echo "
                <li>
                    <!-- drag handle -->
                    <span class='handle'>
                      <i class='fas fa-ellipsis-v'></i>
                      <i class='fas fa-ellipsis-v'></i>
                    </span>
                    <!-- checkbox -->
                    <div  class='icheck-primary d-inline ml-2'>
                      <input type='checkbox' value='' name='todo";
                    echo $i;
                    echo "' id='todoCheck";
                    echo $i;
                    echo "'";
                    if ($todoStatus[$i] == "Finished") {
                          echo "checked";
                      }
                      echo ">
                      <label for='todoCheck";
                      echo $i;
                      echo "'></label>
                    </div>
                    <!-- todo text -->
                    <span class='text'>";
                    echo $todoContent[$i];
                    echo " (";
                    echo $todoStartDate[$i];
                    echo ")";
                    echo "</span>
                    <!-- Emphasis label -->
                    <small class='badge badge-danger'><i class='fas fa-user-tie'></i>";
                    echo " ";
                    echo $fullname;
                    echo "</small>
                    <!-- General tools such as edit or delete-->
                    <div class='tools'>
                      <i class='fas fa-edit'></i>
                      <i class='fas fa-trash-o'></i>
                    </div>
                  </li>
    
                    ";
                  }
                  
                  
                  ?>
                  
                  
                  
                </ul>
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                <button type="button" class="btn btn-info float-right"><i class="fas fa-plus"></i> Add item</button>
              </div>
            </div>
            <!-- /.card -->
            
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
                  <i class="fas fa-chart-pie mr-1"></i>
                  Kết quả kinh doanh Tháng
                </h3>
                <div class="card-tools">
                  <ul class="nav nav-pills ml-auto">
                    <li class="nav-item">
                      <a class="nav-link active" href="#revenue-chart" data-toggle="tab">Kế hoạch</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#sales-chart" data-toggle="tab">Thực hiện</a>
                    </li>
                  </ul>
                </div>
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content p-0">
                  <!-- Morris chart - Sales -->
                  <div class="chart tab-pane active" id="revenue-chart"
                       style="position: relative; height: 300px;">
                      <canvas id="revenue-chart-canvas" height="300" style="height: 300px;"></canvas>                         
                   </div>
                  <div class="chart tab-pane" id="sales-chart" style="position: relative; height: 300px;">
                    <canvas id="sales-chart-canvas" height="300" style="height: 300px;"></canvas>                         
                  </div>  
                </div>
              </div><!-- /.card-body -->
            </div>
            <!-- /.card -->
            
            
          </section>
          <!-- /.Left col -->
          <!-- right col (We are only adding the ID to make the widgets sortable)-->
          <section class="col-lg-5 connectedSortable">

            <!-- solid sales graph -->
            

            <!-- Calendar -->
            <div class="card bg-gradient-success">
              <div class="card-header border-0">

                <h3 class="card-title">
                  <i class="far fa-calendar-alt"></i>
                  Calendar
                </h3>
                <!-- tools card -->
                <div class="card-tools">
                  <!-- button with a dropdown -->
                  <div class="btn-group">
                    <button type="button" class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown">
                      <i class="fas fa-bars"></i></button>
                    <div class="dropdown-menu float-right" role="menu">
                      <a href="#" class="dropdown-item">Add new event</a>
                      <a href="#" class="dropdown-item">Clear events</a>
                      <div class="dropdown-divider"></div>
                      <a href="#" class="dropdown-item">View calendar</a>
                    </div>
                  </div>
                  <button type="button" class="btn btn-success btn-sm" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-success btn-sm" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
                <!-- /. tools -->
              </div>
              <!-- /.card-header -->
              <div class="card-body pt-0">
                <!--The calendar -->
                <div id="calendar" style="width: 100%"></div>
              </div>
              <!-- /.card-body -->
            </div>

            <!-- Map card -->
            <div class="card bg-gradient-primary">


              <div class="card-footer bg-transparent">
                <div class="row">
                  <div class="col-4 text-center">
                    <div id="sparkline-1"></div>
                    <div class="text-white">Visitors</div>
                  </div>
                  <!-- ./col -->
                  <div class="col-4 text-center">
                    <div id="sparkline-2"></div>
                    <div class="text-white">Online</div>
                  </div>
                  <!-- ./col -->
                  <div class="col-4 text-center">
                    <div id="sparkline-3"></div>
                    <div class="text-white">Sales</div>
                  </div>
                  <!-- ./col -->
                </div>
                <!-- /.row -->
              </div>
            </div>
            <!-- /.card -->
            
            <div class="card bg-gradient-info">
              <div class="card-header border-0">
                <h3 class="card-title">
                  <i class="fas fa-th mr-1"></i>
                  Kết quả kinh doanh theo Quý
                </h3>

                <div class="card-tools">
                  <button type="button" class="btn bg-info btn-sm" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn bg-info btn-sm" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <canvas class="chart" id="line-chart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
              </div>
              <!-- /.card-body -->
              <div class="card-footer bg-transparent">
                <div class="row">
                  <div class="col-4 text-center">
                    <input type="text" class="knob" data-readonly="true" value="20" data-width="60" data-height="60"
                           data-fgColor="#39CCCC">

                    <div class="text-white">Mail-Orders</div>
                  </div>
                  <!-- ./col -->
                  <div class="col-4 text-center">
                    <input type="text" class="knob" data-readonly="true" value="50" data-width="60" data-height="60"
                           data-fgColor="#39CCCC">

                    <div class="text-white">Online</div>
                  </div>
                  <!-- ./col -->
                  <div class="col-4 text-center">
                    <input type="text" class="knob" data-readonly="true" value="30" data-width="60" data-height="60"
                           data-fgColor="#39CCCC">

                    <div class="text-white">In-Store</div>
                  </div>
                  <!-- ./col -->
                </div>
                <!-- /.row -->
              </div>
              <!-- /.card-footer -->
            </div>
            <!-- /.card -->


            <!-- /.card -->
          </section>
          <!-- right col -->
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
</body>
</html>
