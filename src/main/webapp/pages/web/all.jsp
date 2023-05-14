<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
    <head>
        <title>Bookings</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <link rel="icon" href="images/favicon.png" type="image/x-icon">
        
        <!-- Bootstrap Stylesheet -->	
        <link rel="stylesheet" href="<c:url value='template/css/bootstrap.min.css'/>">
        
        <!-- Font Awesome Stylesheet -->
        <link rel="stylesheet" href="<c:url value='template/css/font-awesome.min.css'/>">   
            
        <!-- Custom Stylesheets -->	
        <link rel="stylesheet" href="<c:url value='template/css/style.css'/>">
        <link rel="stylesheet" href="<c:url value='template/css/orange.css'/>">  
        <link rel="stylesheet" href="<c:url value='template/css/responsive.css'/>">  
    </head> 
    <body id="booking">
    
        <!--====== LOADER =====-->
        <div class="loader"></div>
    
    
    	<!--======== SEARCH-OVERLAY =========-->       
        <div class="overlay">
            <a href="javascript:void(0)" id="close-button" class="closebtn">&times;</a>
            <div class="overlay-content">
                <div class="form-center">
                    <form>
                    	<div class="form-group">
                        	<div class="input-group">
                        		<input type="text" class="form-control" placeholder="Search..." required />
                            	<span class="input-group-btn"><button type="submit" class="btn"><span><i class="fa fa-search"></i></span></button></span>
                            </div><!-- end input-group -->
                        </div><!-- end form-group -->
                    </form>
                </div><!-- end form-center -->
            </div><!-- end overlay-content -->
        </div><!-- end overlay -->
 

        <nav class="navbar navbar-default main-navbar navbar-custom navbar-white" id="mynavbar-1">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" id="menu-button">
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>                        
                    </button>
                    <div class="header-search hidden-lg">
                    	<a href="javascript:void(0)" class="search-button"><span><i class="fa fa-search"></i></span></a>
                    </div>
                     <a href="#" class="navbar-brand"><span><i class="fa fa-car"></i>Đặt</span> Vé xe</a>
                </div><!-- end navbar-header -->
                
                <div class="collapse navbar-collapse" id="myNavbar1">
                    <ul class="nav navbar-nav navbar-right navbar-search-link">
                       <li><a href="trang-chu" >Trang chủ<span></span></a></li>
                       <li class="active"><a href="all" >Tất cả vé<span></span></a></li>
                       <li><a href="wishlist" >Vé đã đặt<span></span></a></li>
                       
                       <c:choose>
						   <c:when test="${pageContext.request.userPrincipal.name==null}">
						       <li><a href="loginRegis">Đăng nhập<span></span></a></li>
						   </c:when>    
						   <c:otherwise>
						       <li><a href="logout" >Đăng xuất<span></span></a></li>
						   </c:otherwise>
						</c:choose>    
                        <li><a href="javascript:void(0)" class="search-button"><span><i class="fa fa-search"></i></span></a></li>
                    </ul>
                </div><!-- end navbar collapse -->
            </div><!-- end container -->
        </nav><!-- end navbar -->
        
        
        <!--========= PAGE-COVER ==========-->
        <section class="page-cover dashboard">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                    	<h1 class="page-title">Tất cả vé xe</h1>
                        <ul class="breadcrumb">
                            <li><a href="#">Đặt vé</a></li>
                            <li class="active">all</li>
                        </ul>
                    </div><!-- end columns -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section><!-- end page-cover -->
        
        
        <!--===== INNERPAGE-WRAPPER ====-->
        <section class="innerpage-wrapper">
        	<div id="dashboard" class="innerpage-section-padding">
                <div class="container">
                    <div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        	<div class="dashboard-heading">
                                <h2>Vé <span>Xe</span></h2>
                            </div><!-- end dashboard-heading -->
                            
                            <div class="dashboard-wrapper">
                            	<div class="row">
                                
                                    <div class="col-xs-12 col-sm-10 col-md-10 dashboard-content booking-trips">
                                		<h2 class="dash-content-title">Tất cả vé xe!</h2>
                                    <div class="dashboard-listing booking-listing">
                                        <div class="dash-listing-heading">
                                            <div class="custom-radio">
                                                <input type="radio" id="radio01" name="radio" checked/>
                                                <label for="radio01"><span></span>Tất cả</label>
                                            </div><!-- end custom-radio -->
                                                
                                            <div class="custom-radio">
                                                <input type="radio" id="radio02" name="radio" />
                                                <label for="radio02"><span></span>giường nằm</label>
                                            </div><!-- end custom-radio -->
                                            
                                            <div class="custom-radio">
                                                <input type="radio" id="radio03" name="radio" />
                                                <label for="radio03"><span></span>Ngồi</label>
                                            </div><!-- end custom-radio -->
                                            
                                        </div>
                    
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <tbody>
                                        <c:forEach items="${listChuyenXe}" var="list">
                                            <tr>
                                                <td class="dash-list-icon booking-list-date"><div class="b-date"><h3>${list.giodi}</h3><p>các ngày</p></div></td>
                                                <td class="dash-list-text booking-list-detail">
                                                    <h3>${list.tuyenxe.diemdau} - ${list.tuyenxe.diemcuoi}</h3>
                                                    <ul class="list-unstyled booking-info">
                                                    	<li><span>Ngày đi: </span> <span id="giodi">${list.ngaydi}</span></li>
                                                        <li><span>Giờ khởi hành: </span> <span id="giodi">${list.giodi}</span></li>
                                                        <li><span>Giờ xuất bên: </span> <span id="giove">${list.giove}</span></li>
                                                        <li><span>Thời gian đi(Dự kiến):</span> không thể tính toán<span class="line">|</span><span class="line">sđt tài xế|</span>${list.account.phone}</li>
                                                    </ul>
                                                </td>
                                                <td class="dash-list-btn"><button class="btn btn-orange"><a href="detail?id=${list.id}">Chi tiết</a> </button><button class="btn">Đặt ngay</button></td>
                                            </tr>
                                           </c:forEach>
                                        </tbody>
                                    </table>
                                </div><!-- end table-responsive -->
                            </div><!-- end booking-listings -->
                                        
                                    </div><!-- end columns -->
                                    
                                </div><!-- end row -->
                            </div><!-- end dashboard-wrapper -->
                        </div><!-- end columns -->
                    </div><!-- end row -->
                </div><!-- end container -->          
            </div><!-- end dashboard -->
        </section><!-- end innerpage-wrapper -->

        
        <!--========================= NEWSLETTER-1 ==========================-->
        <section id="newsletter-1" class="section-padding back-size newsletter"> 
            <div class="container">
                <div class="row">
                	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
                        <h2>Subscribe Our Newsletter</h2>
                        <p>Subscibe to receive our interesting updates</p>	
                        <form>
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="email" class="form-control input-lg" placeholder="Enter your email address" required/>
                                    <span class="input-group-btn"><button class="btn btn-lg"><i class="fa fa-envelope"></i></button></span>
                                </div>
                            </div>
                        </form>
                    </div><!-- end columns -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section><!-- end newsletter-1 -->
        
        
        <!--======================= FOOTER =======================-->
        <section id="footer" class="ftr-heading-o ftr-heading-mgn-1">
        
            <div id="footer-top" class="banner-padding ftr-top-black ftr-text-white">
                <div class="container">
                    <div class="row">
						
                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 footer-widget ftr-contact">
                            <h3 class="footer-heading">CONTACT US</h3>
                            <ul class="list-unstyled">
                            	<li><span><i class="fa fa-map-marker"></i></span>29 Land St, Lorem City, CA</li>
                            	<li><span><i class="fa fa-phone"></i></span>+00 123 4567</li>
                                <li><span><i class="fa fa-envelope"></i></span>info@starhotel.com</li>
                            </ul>
                        </div><!-- end columns -->
                        
                        <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2 footer-widget ftr-links">
                            <h3 class="footer-heading">COMPANY</h3>
                            <ul class="list-unstyled">
                            	<li><a href="#">Home</a></li>
                            	<li><a href="#">Flight</a></li>
                                <li><a href="#">Hotel</a></li>
                                <li><a href="#">Tours</a></li>
                                <li><a href="#">Cruise</a></li>
                                <li><a href="#">Cars</a></li>
                            </ul>
                        </div><!-- end columns -->
                        
                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 footer-widget ftr-links ftr-pad-left">
                        	<h3 class="footer-heading">RESOURCES</h3>
                            <ul class="list-unstyled">
                            	<li><a href="#">Blogs</a></li>
                            	<li><a href="#">Contact Us</a></li>
                                <li><a href="#">Login</a></li>
                                <li><a href="#">Register</a></li>
                                <li><a href="#">Site Map</a></li>
                            </ul>
                        </div><!-- end columns -->

                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 footer-widget ftr-about">
                            <h3 class="footer-heading">ABOUT US</h3>
                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit.</p>
                            <ul class="social-links list-inline list-unstyled">
                            	<li><a href="#"><span><i class="fa fa-facebook"></i></span></a></li>
                            	<li><a href="#"><span><i class="fa fa-twitter"></i></span></a></li>
                                <li><a href="#"><span><i class="fa fa-google-plus"></i></span></a></li>
                                <li><a href="#"><span><i class="fa fa-pinterest-p"></i></span></a></li>
                                <li><a href="#"><span><i class="fa fa-instagram"></i></span></a></li>
                                <li><a href="#"><span><i class="fa fa-linkedin"></i></span></a></li>
                                <li><a href="#"><span><i class="fa fa-youtube-play"></i></span></a></li>
                            </ul>
                        </div><!-- end columns -->
                        
                    </div><!-- end row -->
                </div><!-- end container -->
            </div><!-- end footer-top -->

            <div id="footer-bottom" class="ftr-bot-black">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" id="copyright">
                            <p>© 2017 <a href="#">StarTravel</a>. All rights reserved.</p>
                        </div><!-- end columns -->
                        
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" id="terms">
                            <ul class="list-unstyled list-inline">
                            	<li><a href="#">Terms & Condition</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                            </ul>
                        </div><!-- end columns -->
                    </div><!-- end row -->
                </div><!-- end container -->
            </div><!-- end footer-bottom -->
            
        </section><!-- end footer -->
        
        
        <div id="edit-profile" class="modal card-modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h3 class="modal-title">Edit Profile</h3>
                    </div><!-- end modal-header -->
                    
                    <div class="modal-body">
                        <form>
                        	<div class="form-group">
                        		<label>Your Name</label>
                            	<input type="text" class="form-control" placeholder="Name" readonly/>
                            </div><!-- end form-group -->
                            
                        	<div class="form-group">
                        		<label>Date of Birth</label>
                            	<input type="text" class="form-control" placeholder="mm-dd-yy" />
                            </div><!-- end form-group -->
                            
                            <div class="form-group">
                        		<label>Your Email</label>
                            	<input type="email" class="form-control" placeholder="Email" />
                            </div><!-- end form-group -->
                            
                            <div class="form-group">
                        		<label>Your Phone</label>
                            	<input type="text" class="form-control" placeholder="Phone Number" />
                            </div><!-- end form-group -->
							
                            <div class="form-group">
                        		<label>Your Country</label>
                            	<input type="text" class="form-control" placeholder="Country" />
                            </div><!-- end form-group -->
                            
                            <div class="form-group">
                        		<label>Your Address</label>
                            	<input type="text" class="form-control" placeholder="Address" />
                            </div><!-- end form-group -->
                            
                            <button class="btn btn-orange">Save Changes</button>
                        </form>
                    </div><!-- end modal-bpdy -->
                </div><!-- end modal-content -->
            </div><!-- end modal-dialog -->
        </div><!-- end edit-profile -->
        
        
        <!-- Page Scripts Starts -->
       <script src="<c:url value='template/js/jquery.min.js'/>"></script>
        <script src="<c:url value='template/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='template/js/jquery.flexslider.js'/>"></script>
        <script src="<c:url value='template/js/bootstrap-datepicker.js'/>"></script>
        <script src="<c:url value='template/js/owl.carousel.min.js'/>"></script>
        <script src="<c:url value='template/js/custom-navigation.js'/>"></script>
        <script src="<c:url value='template/js/custom-flex.js'/>"></script>
        <script src="<c:url value='template/js/custom-owl.js'/>"></script>
        <script src="<c:url value='template/js/custom-date-picker.js'/>"></script>
        <!-- Page Scripts Ends -->
    </body>
</html>
