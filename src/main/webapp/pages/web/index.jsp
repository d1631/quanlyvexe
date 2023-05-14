<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
    <head>
        <title>Trang chủ</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        
        <!-- Bootstrap Stylesheet -->	
        <link rel="stylesheet" href="<c:url value='template/css/bootstrap.min.css'/>">
        <!-- Font Awesome Stylesheet -->
        <link rel="stylesheet" href="<c:url value='template/css/font-awesome.min.css'/>">   
        <!-- Custom Stylesheets -->	
        <link rel="stylesheet" href="<c:url value='template/css/style.css'/>">  
        <link rel="stylesheet" href="<c:url value='template/css/orange.css'/>">  
        <link rel="stylesheet" href="<c:url value='template/css/responsive.css'/>">  
        <link rel="stylesheet" href="<c:url value='template/css/owl.carousel.css'/>">  
        <link rel="stylesheet" href="<c:url value='template/css/owl.theme.css'/>">  
        <link rel="stylesheet" href="<c:url value='template/css/flexslider.css'/>">  
        <link rel="stylesheet" href="<c:url value='template/css/datepicker.css'/>">  
    </head>
    
    
    <body id="car-homepage">
    
        <!--====== LOADER =====-->
        <div class="loader"></div>
        


		<!--========================= FLEX SLIDER =====================-->
        <section class="flexslider-container" id="flexslider-container-3">
        	
            <div class="header-absolute">
                <nav class="navbar navbar-default main-navbar navbar-custom navbar-black" id="mynavbar">
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
                            <ul class="nav navbar-nav navbar-right">
                                <li class="active"><a href="trang-chu" >Trang chủ<span></span></a></li>
                                <li><a href="all" >Tất cả vé<span></span></a></li>
                                <li><a href="wishlist" >Vé đã đặt<span></span></a></li>
                                
                                <c:choose>
								    <c:when test="${pageContext.request.userPrincipal.name==null}">
								        <li><a href="loginRegis">Đăng nhập<span></span></a></li>
								    </c:when>    
								    <c:otherwise>
								        <li><a href="logout" >Đăng xuất<span></span></a></li>
								    </c:otherwise>
								</c:choose>
                            </ul>
                        </div>
                    </div>
                 </nav>
        	</div>
            
        
        
            <div class="flexslider slider" id="slider-3">
                <ul class="slides">  
                    <li class="item-1 back-size" style="background:	linear-gradient(rgba(0,0,0,0.3),rgba(0,0,0,0.3)),url(<c:url value='template/images/banner.jpg'/>) 50% 65%;
                	background-size:cover;
                	height:100%;">
                    </li><!-- end item-1 --> 
                </ul>
            </div><!-- end slider -->
            
            <div class="search-tabs" id="search-tabs-3">
            	<div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 no-pd-r">
                        
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#cars" data-toggle="tab"><span><i class="fa fa-car"></i></span><span class="st-text">Tìm kiếm</span></a></li>
                        </ul>

                            <div class="tab-content">
                                <div id="cars" class="tab-pane in active">
                                    <form method="get" action="all">					
                                        <div class="row">
                                        
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                <div class="row">
                                                
                                                    <div class="col-sm-6 col-md-6">
                                                        <div class="form-group left-icon">
                                                            <label>Điểm đi</label>
                                                            <input type="text" name="diemdi" class="form-control" placeholder="điểm đi" />
                                                            <i class="fa fa-map-marker"></i>
                                                        </div>
                                                    </div><!-- end columns -->
                                                    
                                                    <div class="col-sm-6 col-md-6">
                                                        <div class="form-group left-icon">
                                                            <label>Điểm đến</label>
                                                            <input type="text" name="diemden" class="form-control" placeholder="điểm đến" />
                                                            <i class="fa fa-map-marker"></i>
                                                        </div>
                                                    </div><!-- end columns -->
                                                    
                                                    
                                                </div><!-- end row -->
                                            </div><!-- end columns -->
                                            
                                          
    
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-2 search-btn">
                                                <button class="btn btn-orange">Tìm kiếm</button>
                                            </div><!-- end columns -->
                                            
                                        </div><!-- end row -->					
                                    </form>
                                </div><!-- end cars -->
                                
                                
                            </div><!-- end tab-content -->

                        </div><!-- end columns -->
       
                    </div><!-- end row -->
                </div><!-- end container -->
            </div><!-- end search-tabs -->
            
        </section><!-- end flexslider-container -->
		
        
        <!--================= CAR OFFERS =============-->
        <section id="car-offers" class="section-padding" style="margin-top: -100px;"> 
            <div class="container">
              <div class="col-xs-12 col-sm-12 col-md-12 dashboard-content booking-trips">
                <h2 class="dash-content-title">Chuyến đi phổ biến!</h2>
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
                                <tr>
                                    <td class="dash-list-icon booking-list-date"><div class="b-date"><h3>18h30</h3><p>các ngày</p></div></td>
                                    <td class="dash-list-text booking-list-detail">
                                        <h3>Hà nội - Bắc ninh</h3>
                                        <ul class="list-unstyled booking-info">
                                            <li><span>Giờ khởi hành:</span>18h:35</li>
                                            <li><span>Giờ xuất bên:</span> 15:45</li>
                                            <li><span>Thời gian đi(Dự kiến):</span> 2 tiếng<span class="line">|</span><span class="line">sđt tài xế|</span>125 254 2578</li>
                                        </ul>
                                    </td>
                                    <td class="dash-list-btn"><button class="btn btn-orange">Cancel</button><button class="btn">Approve</button></td>
                                </tr>
                               
                            </tbody>
                        </table>
                    </div><!-- end table-responsive -->
                </div><!-- end booking-listings -->
                
            </div><!-- end columns -->
            </div>
            <div class="view-all text-center">
                <a href="car-grid-right-sidebar.html" class="btn btn-orange">View All</a>
            </div>
        </section>
        
         
        
        
        
        
        <!--======================= FOOTER =======================-->
        <section id="footer" class="ftr-heading-w ftr-heading-mgn-2">
        
            <div id="footer-top" class="banner-padding ftr-top-grey ftr-text-grey">
                <div class="container">
                    <div class="row">

                        <div class="col-xs-12 col-sm-12 col-md-5 col-lg-5 footer-widget ftr-about ftr-our-company">
                            <h3 class="footer-heading">Công ty chúng tôi</h3>
                            <p></p>
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
                        
                        <div class="col-xs-12 col-sm-12 col-md-7 col-lg-7 footer-widget ftr-map">
                            <div class="map">
                                <iframe src=		"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6509729.487836256!2d-123.77686152799836!3d37.1864783963941!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x808fb9fe5f285e3d%3A0x8b5109a227086f55!2sCalifornia!5e0!3m2!1sen!2s!4v1490695907554" allowfullscreen></iframe>
                            </div>
                        </div><!-- end columns -->
                        
                    </div><!-- end row -->
                </div><!-- end container -->
            </div><!-- end footer-top -->

           
            
        </section><!-- end footer -->
        
        
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