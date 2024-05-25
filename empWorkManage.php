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
if(!($_SESSION["roleID"]==5 || $_SESSION["roleID"] == 6)) {
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
$todoStatus[] = "";

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
    CAST(todo.startTime as Time) as StartTime,
	CAST(todo.endTime as Time) as EndTime,
	todo.todoContent, 
	statustodo.statusName,
    todo.isLate
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
	todo.startTime >= CURDATE() - 2
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
        mysqli_stmt_bind_result($stmt, $bTodoID,$bTodoStartDate, $bTodoEndDate, $bTodoStartTime, $bTodoEndTime, $bTodoContent, $bTodoStatus, $bLate);
        $NoOfTodo = 0;
       
        while (mysqli_stmt_fetch($stmt)) {
            $todoID[$NoOfTodo] = $bTodoID;
            $todoStartDate [$NoOfTodo] = $bTodoStartDate;
            $todoEndDate[$NoOfTodo] = $bTodoEndDate;
            $todoStartTime [$NoOfTodo] = $bTodoStartTime;
            $todoEndTime[$NoOfTodo] = $bTodoEndTime;
            $todoContent[$NoOfTodo] = $bTodoContent;
            $todoStatus[$NoOfTodo] = $bTodoStatus;
            $todoLate[$NoOfTodo] = $bLate;
            $NoOfTodo++;
            if ($bTodoStatus == "Processing") {
                $NoOfPendingTodo++;
            }
        }
        
    }
}

//store todoList to SESSION
if ($NoOfTodo > 0) {
    $_SESSION["todoID"] = $todoID;
    $_SESSION["todoStatus"] = $todoStatus;
}


mysqli_stmt_close($stmt);

mysqli_close($link);

?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Quản lý công việc | Hệ thống quản trị KPI - PVcomBank</title>
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
        <a href="employee.php" class="nav-link">Trang chủ</a>
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
            <a href='employee.php' class='nav-link'>
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
              
              else if ($function[$i] == "EmpMange") {
                 echo "
                    <li class='nav-item has-treeview'>
            <a href='#' class='nav-link'>
              <i class='nav-icon fas fa-user-tie'></i>
              <p>
                Quản lý Nhân viên
                <i class='right fas fa-angle-left'></i>
              </p>
            </a>
            <ul class='nav nav-treeview'>
              <li class='nav-item'>
                <a href='pages/charts/chartjs.html' class='nav-link'>
                  <i class='far fa-circle nav-icon'></i>
                  <p>Thêm mới Nhân viên</p>
                </a>
              </li>
              <li class='nav-item'>
                <a href='pages/charts/flot.html' class='nav-link'>
                  <i class='far fa-circle nav-icon'></i>
                  <p>Cập nhật thông tin</p>
                </a>
              </li>

            </ul>
          </li>
                "; 
              }
              else if ($function[$i] == "WorkManage") {
                  echo "
           <li class='nav-item'>
            <a href='empWorkManage.php' class='nav-link active'>
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
                <a href="empChangePass.php" class="nav-link">
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
            <h1 class="m-0 text-dark">Quản lý công việc</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Quản lý công việc</a></li>
              <li class="breadcrumb-item active">Todo List</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
       
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
                    <?php 
                    if ($NoOfTodo >= 10) {
                        $pageTodo = $NoOfTodo/10 + 1;
                    } else $pageTodo = 1;
                    
                    for ($i = 1 ; $i <= $pageTodo; $i ++) {
                        echo "<li class='page-item'><a href='#' class='page-link'>";
                        echo $i;
                        echo "</a></li>";
                    }
                    
                    ?>
                    
                    <li class="page-item"><a href="#" class="page-link">&raquo;</a></li>
                  </ul>
                </div>
              </div>
              <!-- /.card-header -->
              <form id="form_todoList" action="db/updateTodoStatus_Emp.php" method="post">
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
                      <input type='checkbox' value='" . $todoID[$i]. "' name='todoCheckBox[]'  id='todoCheck" . $i ."'";
                    if ($todoStatus[$i] == "Finished") {
                          echo "checked";
                      }
                      echo ">
                      <label for='todoCheck" . $i . "'></label></div>
                    <!-- todo text -->
                    <span class='text'>" . $todoContent[$i] . "</span>
                    
                    <!-- Emphasis label -->
                    <small class='badge badge-success'><i class='fas fa-clock'></i> " ."  " . date('H:i',strtotime($todoStartTime[$i])) . " | " . $todoStartDate[$i] . "</small>
                    <small class='badge badge-danger'><i class='fas fa-user-tie'></i>" ." " . $fullname . "</small>";;
                     
                      $openDoorTime = date("h:i a",(mktime(8,00,00)));
                      
                      if (($todoStartTime[$i] <= $openDoorTime) && ($openDoorTime <= $todoEndTime[$i])) {
                          echo "<small class='badge badge-warning'><i class='fas fa-bell'></i>  Trễ giờ làm</small>";
                      }
                      if ($todoLate[$i] == "request") {
                          echo "<small class='badge badge-warning'><i class='fas fa-hand-point-right'></i>  Chờ duyệt đi trễ</small>";
                      }
                      if ($todoLate[$i] == "accepted") {
                          echo "<small class='badge badge-success'><i class='fas fa-user-check'></i>  Đã duyệt đi trễ</small>";
                      }
                      if ($todoLate[$i] == "denied") {
                          echo "<small class='badge badge-danger'><i class='fas fa-user-times'></i>  Không duyệt đi trễ</small>";
                      }
                    echo 
                    "<!-- General tools such as edit or delete-->
                    <div class='tools'>
                      
                      <i id='" . $todoID[$i] ."' class='edit_data fas fa-edit'></i>
                      <i id='" .$todoID[$i] .  "' class='delete_data fas fa-trash-alt'></i>
                    </div>
                  </li>
    
                    ";
                  }
                  
                  
                  ?>
           
                </ul>
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                <button type="submit" class="btn btn-info float-right"><i class="fas fa-sync-alt"></i> Cập nhật trạng thái</button>
              </div>
              </form>
            </div>
            <!-- /.card -->
            
           
            
            
          </section>
          <!-- /.Left col -->
          <!-- right col (We are only adding the ID to make the widgets sortable)-->
          <section class="col-lg-5">
		  
          <div class = "row">
                    <div class="col-lg-6">
                        <!-- small box -->
                        <div class="small-box bg-success">
                          <div class="inner">
                            <h3><?php 
                            $NoOfFinishTodo = 0;
                            foreach ($todoStatus as $value) {
                                if ($value == "Finished") {
                                $NoOfFinishTodo++;
                            }
                        }
                        echo $NoOfFinishTodo;
                        
                        ?><sup style="font-size: 20px"> Công việc</sup> </h3>
                        <p>Hoàn thành hôm nay</p>
                      </div>
                      <div class="icon">
                        <i class="fas fa-calendar-check"></i>
                      </div>
                      
                    </div>
                  </div>
                  <!-- ./col -->
                  <div class="col-lg-6">
                    <!-- small box -->
                    <div class="small-box bg-danger">
                      <div class="inner">
                        <h3><?php 
                        $NoOfProcessingTodo = 0;
                        foreach ($todoStatus as $value) {
                            if ($value != "Finished" && $value != "") {
                                $NoOfProcessingTodo++;
                            }
                        }
                        echo $NoOfProcessingTodo;
                        
                        ?><sup style="font-size: 20px"> Công việc</sup></h3>
        
                        <p>Chưa hoàn thành hôm nay</p>
                      </div>
                      <div class="icon">
                        <i class="fas fa-calendar-times"></i>
                      </div>
                      
                    </div>
                  </div>
                  <!-- ./col -->
            	</div>
          <div class="row">
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Thêm mới công việc</h3>
              </div>
              <form id="addTodo" action="db/addTodoEmp.php" method="post">
              <div class="card-body">
                
                 <!-- Start Row -->
              
                <div class = "row">
                	<div class = "col-lg-6">
                		<div class="bootstrap-timepicker">
                          <div class="form-group">
                            <label>Thời gian bắt đầu:</label>
        
                            <div class="input-group date" id="start_timepicker" data-target-input="nearest">
                              <div class="input-group-append" data-target="#start_timepicker" data-toggle="datetimepicker">
                                  <div class="input-group-text"><i class="far fa-clock"></i></div>
                              </div>
                              <input type="text" name="todo_startTime" id="todo_startTime" class="form-control datetimepicker-input" data-target="#timepicker" required/>
                              
                              </div>
                            <!-- /.input group -->
                          </div>
                          <!-- /.form group -->
                        </div>
                	</div>
                	<div class="col-lg-6">
                		<div class="bootstrap-timepicker">
                          <div class="form-group">
                            <label>Thời gian kết thúc:</label>
        
                            <div class="input-group date" id="end_timepicker" data-target-input="nearest">
                              <div class="input-group-append" data-target="#end_timepicker" data-toggle="datetimepicker">
                                  <div class="input-group-text"><i class="far fa-clock"></i></div>
                              </div>
                              <input type="text" name="todo_endTime" id="todo_endTime" class="form-control datetimepicker-input" data-target="#timepicker" required/>
                              
                              </div>
                            <!-- /.input group -->
                          </div>
                          <!-- /.form group -->
                        </div>
                	</div>
                </div>               
                <!-- end of row -->
				<div class="row">
					<div class="col-lg-12">
                      <!-- textarea -->
                      <div class="form-group">
                        <label>Nội dung công việc</label>
                        <textarea class="form-control" name="todo_content" id="todo_content" rows="2" placeholder="Nhập nội dung ..." required></textarea>
                      </div>
                    </div>
				</div>
				
				<div class="row"> 
				<div class="col-lg-12"> 
					<div class="custom-control custom-checkbox">
                      <input class="custom-control-input" type="checkbox" id="isLate" name="isLate" value="request">
                      <label for="isLate" class="custom-control-label">Đăng ký đi trễ</label>
             		</div>
             	</div>
				</div>
				
              </div>
              
              <!-- end check box Request Late-->
              
              
              
              <!-- end Checkbox Request late -->
              
              
              <!-- end Card Body -->
              <div class="card-footer">
                  <button id="addTodo" name="addTodo" type="submit" class="btn btn-primary"><i class="fas fa-plus"></i> Thêm mới</button>
              </div>
              </form>
              
            </div>
			</div>
            <!-- /.card -->
          </section>
          <!-- right col -->
        </div>
        <!-- /.row (main row) -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  
  <!-- Popup to Edit Todo Content -->
  
  <div id="edit_todo_modal" class="modal fade">
  	<div class="modal-dialog">  
           <div class="modal-content">  
                <div class="modal-header">  
                     <h4 class="modal-title">Cập nhật nội dung công việc</h4>
                     <button type="button" class="close" data-dismiss="modal">&times;</button>  
                       
                </div>  
                <div class="modal-body">  
                     <form name="edit_form" action="db/updateTodoFullContent_Emp.php" method="post">  
                          <div class = "row">
                        	<div class = "col-lg-6">
                        		<div class="bootstrap-timepicker">
                                  <div class="form-group">
                                    <label>Thời gian bắt đầu:</label>
                
                                    <div class="input-group date" id="start_timepicker_popup" data-target-input="nearest">
                                      <div class="input-group-append" data-target="#start_timepicker_popup" data-toggle="datetimepicker">
                                          <div class="input-group-text"><i class="far fa-clock"></i></div>
                                      </div>
                                      <input type="text" id="todo_startTime_popup" name="todo_startTime_popup" class="form-control datetimepicker-input" data-target="#timepicker" required/>
                                      
                                      </div>
                                    <!-- /.input group -->
                                  </div>
                                  <!-- /.form group -->
                                </div>
                        	</div>
                        	<div class="col-lg-6">
                        		<div class="bootstrap-timepicker">
                                  <div class="form-group">
                                    <label>Thời gian kết thúc:</label>
                
                                    <div class="input-group date" id="end_timepicker_popup" data-target-input="nearest">
                                      <div class="input-group-append" data-target="#end_timepicker_popup" data-toggle="datetimepicker">
                                          <div class="input-group-text"><i class="far fa-clock"></i></div>
                                      </div>
                                      <input type="text" id="todo_endTime_popup" name="todo_endTime_popup" class="form-control datetimepicker-input" data-target="#timepicker" required/>
                                      
                                      </div>
                                    <!-- /.input group -->
                                  </div>
                                  <!-- /.form group -->
                                </div>
                        	</div>
                        </div>               
                          <div class="row">
        					<div class="col-lg-12">
                              <!-- textarea -->
                              <div class="form-group">
                                <label>Nội dung công việc</label>
                                <textarea class="form-control" id="todo_content_popup" name="todo_content_popup" rows="2" placeholder="Nhập nội dung ..." required></textarea>
                              </div>
                            </div>
        				</div>
                         <br>
                          <input type="hidden" name="todo_id" id="todo_id" />  
                          <button id="edit_todo" type="submit" name="update_todo" class="btn btn-primary"><i class="fas fa-redo-alt"></i> Cập nhật thông tin</button>
                         
                     </form>  
                </div>  
           </div>  
      </div>  
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
<!-- AJAX Bootbox for Bootstrap -->
<script src="plugins/bootbox/bootbox.min.js"></script>
<!-- JQuery Validation -->
<script src="plugins/jquery-validation/jquery.validate.min.js"></script>


<!-- Script for Date Time Picker -->
<script>
  $(function () {
    //Initialize Select2 Elements
    $('.select2').select2()

    //Initialize Select2 Elements
    $('.select2bs4').select2({
      theme: 'bootstrap4'
    })

    //Datemask dd/mm/yyyy
    $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
    //Datemask2 mm/dd/yyyy
    $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
    //Money Euro
    $('[data-mask]').inputmask()

    //Date range picker
    $('#reservation').daterangepicker()
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({
      timePicker: true,
      timePickerIncrement: 30,
      locale: {
        format: 'MM/DD/YYYY hh:mm A'
      }
    })
    //Date range as a button
    $('#daterange-btn').daterangepicker(
      {
        ranges   : {
          'Today'       : [moment(), moment()],
          'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month'  : [moment().startOf('month'), moment().endOf('month')],
          'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },
        startDate: moment().subtract(29, 'days'),
        endDate  : moment()
      },
      function (start, end) {
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
      }
    )

    //StartTimepicker
    $('#start_timepicker').datetimepicker({
      format: 'LT'
    })
    
    //EndTimePicker
    $('#end_timepicker').datetimepicker({
      format: 'LT'
    })
    
    //StartTimepicker Popup
    $('#start_timepicker_popup').datetimepicker({
      format: 'LT'
    })
    
    //EndTimePicker Popup
    $('#end_timepicker_popup').datetimepicker({
      format: 'LT'
    })
    
    //Bootstrap Duallistbox
    $('.duallistbox').bootstrapDualListbox()

    //Colorpicker
    $('.my-colorpicker1').colorpicker()
    //color picker with addon
    $('.my-colorpicker2').colorpicker()

    $('.my-colorpicker2').on('colorpickerChange', function(event) {
      $('.my-colorpicker2 .fa-square').css('color', event.color.toString());
    });

    $("input[data-bootstrap-switch]").each(function(){
      $(this).bootstrapSwitch('state', $(this).prop('checked'));
    });

  })
</script>


<!-- Script to control Edit Todo Content pop-up -->
<script>  
 $(document).ready(function(){  
      
      $('.edit_data').click(function(){  
           var todoID = $(this).attr("id");  
           $.ajax({  
                url:"db/selectTodoFullContent.php",  
                method:"POST",  
                data:{todoID: todoID},  
                dataType:"json",  
                success:function(data){  
                	 $('#todo_id').val(data.todoID);
                     $('#todo_startTime_popup').val(data.startTime);  
                     $('#todo_endTime_popup').val(data.endTime);  
                     $('#todo_content_popup').val(data.content);  
                     $('#edit_todo_modal').modal('show');
                }  
           });  
      });  
      
   // Delete 
	  $('.delete_data').click(function(){
	    
	    // Delete id
	    var todoID = $(this).attr('id');
	 
	    // Confirm box
	    bootbox.confirm("Bạn có muốn xóa công việc này không ?", function(result) {
	 
	       if(result){
	         // AJAX Request
	         $.ajax({
	           url: 'db/deleteTodo.php',
	           type: 'POST',
	           data: {todoID: todoID},
	           success: function(response){
				//bootbox.alert(response);
	             // Refresh page
	             if(response){
	            	 location.reload();
				 } else{
					bootbox.alert('Không xóa dữ liệu được, vui lòng liên hệ IT !');
		     	 }

	           }
	         });
	       }
	 
	    });
	 
	  });
      
});  
 </script>
 
 
</body>
</html>
