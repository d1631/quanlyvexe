<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link rel="stylesheet" href="<c:url value='/template/admin/css/styles.css'/>">  
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">Admin</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="../logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
               <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="../admin/trang-chu">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <div class="sb-sidenav-menu-heading">Nhân sự</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Nhân viên
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="../admin/employee">Danh sách nhân viên</a>
                                    <a class="nav-link" href="../admin/addEmployee">Thêm nhân viên</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Tài xế
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="../admin/driver">Danh sách tài xế</a>
                                    <a class="nav-link" href="../admin/addDriver">Thêm tài xế</a>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Lịch trình</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#tuyenxe" aria-expanded="false" aria-controls="tuyenxe">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Tuyến xe
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="tuyenxe" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="../employee/tuyenxe">Danh sách tuyến xe</a>
                                    <a class="nav-link" href="../admin/addTuyenxe">Thêm tuyến xe</a>
                                </nav>
                            </div>
                             <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#chuyenxe" aria-expanded="false" aria-controls="chuyenxe">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Chuyến xe
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="chuyenxe" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="../employee/chuyenxe">Danh sách chuyến xe</a>
                                    <a class="nav-link" href="../admin/addChuyenxe">Thêm chuyến xe</a>
                                </nav>
                            </div>
                            <a class="nav-link" href="../employee/datxe">đặt vé</a>
                        </div>
                    </div>
                    
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Thêm chuyến xe</h1>
                       
                        <form:form method="post" action="addCx" modelAttribute="chuyenxe">
                            <div class="row">
                                <div class="col-md-6" id="ips">
                                    <label>chọn tài xế</label>
                                    <select class="form-control" name="taixe">
                                   <c:forEach items="${listTaiXe}" var="txe">
                                         <option value="${txe.id}">${txe.fullname}</option> 
                                    </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-6" id="ips">
                                    <label>tuyến xe</label>
                                    <select name="tx" class="form-control">
                                     <c:forEach items="${listTuyenXe}" var="tx">
                                         <option value="${tx.id}">${tx.bienso}: ${tx.diemdau} - ${tx.diemcuoi}</option> 
                                     </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-6" id="ips">
                                    <label>ngày đi</label>
                                    <form:input type="date" class="form-control" path="ngaydi" />
                                </div>
                                <div class="col-md-3" id="ips">
                                    <label>giờ đi(bỏ trống lấy giờ cũ)</label>
                                    <form:input type="time" class="form-control" path="giodi" />
                                </div>
                                <div class="col-md-3" id="ips">
                                    <label>giờ về(bỏ trống lấy giờ cũ)</label>
                                    <form:input type="time" class="form-control" path="giove" />
                                    <form:input type="hidden" path="id" />  
                                </div>
                                <div class="col-md-3" id="ips">
                                    <label>giá(bỏ trống lấy giá cũ)</label>
                                    <form:input type="number" class="form-control" path="price" />
                                </div>
                                 
                                <div class="col-md-12" id="ips">
                                    <button class="btn-success form-control">Thêm chuyến xe</button>
                                </div>
                            </div>
                        </form:form>
                        
                    </div>
                </main>
               
            </div>
        </div>
        <script src="<c:url value='/template/admin/js/scripts.js'/>"></script>
        <script src="<c:url value='/template/admin/assets/demo/chart-area-demo.js'/>"></script>
        <script src="<c:url value='/template/admin/assets/demo/chart-bar-demo.js'/>"></script>
        <script src="<c:url value='/template/admin/js/datatables-simple-demo.js'/>"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>

    </body>
</html>
