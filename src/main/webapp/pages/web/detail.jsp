<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
    <head>
        <title>Chi tiết vé</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <link rel="icon" href="images/favicon.png" type="image/x-icon">
        	
        <!-- Google Fonts -->	
        <link href="https://fonts.googleapis.com/css?family=Lato:300,300i,400,400i,700,700i,900,900i%7CPlayfair+Display:400,400i,700,700i,900,900i" rel="stylesheet">
        
        <!-- Bootstrap Stylesheet -->	
        <link rel="stylesheet" href="<c:url value='template/css/bootstrap.min.css'/>">
        
        <!-- Font Awesome Stylesheet -->
        <link rel="stylesheet" href="<c:url value='template/css/font-awesome.min.css'/>">   
            
        <!-- Custom Stylesheets -->	
        <link rel="stylesheet" href="<c:url value='template/css/style.css'/>">
        <link rel="stylesheet" href="<c:url value='template/css/orange.css'/>">  
        <link rel="stylesheet" href="<c:url value='template/css/responsive.css'/>"> 
        <link rel="stylesheet" href="<c:url value='template/css/ticket.css'/>"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    </head>
    
    
    <body>
        
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
                       <li><a href="javascript:void(0)" class="search-button"><span><i class="fa fa-search"></i></span></a></li>
                    </ul>
                </div><!-- end navbar collapse -->
            </div><!-- end container -->
        </nav><!-- end navbar -->
               
        
        
        <!--==== INNERPAGE-WRAPPER =====-->
        <section class="innerpage-wrapper">
        	<div id="blog-details" class="innerpage-section-padding">
        		<div class="container">
        			<div class="row">
                    	
                        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 side-bar blog-sidebar left-side-bar">
                                
                            <div class="row">    
                                <div class="col-xs-12 col-sm-6 col-md-12">
                                    <div class="side-bar-block contact">
                                        <h2 class="side-bar-heading">Liên hệ chúng tôi để được hỗ trợ</h2>
                                        <div class="c-list">
                                            <div class="icon"><span><i class="fa fa-envelope"></i></span></div>
                                            <div class="text"><p>datvexekhach@gmail.com</p></div>
                                        </div><!-- end c-list -->
                                        
                                        <div class="c-list">
                                            <div class="icon"><span><i class="fa fa-phone"></i></span></div>
                                            <div class="text"><p>0123493243</p></div>
                                        </div><!-- end c-list -->
                                        
                                        <div class="c-list">
                                            <div class="icon"><span><i class="fa fa-map-marker"></i></span></div>
                                            <div class="text"><p>Việt nam</p></div>
                                        </div><!-- end c-list -->
                                    </div><!-- end side-bar-block -->
                                </div><!-- end columns -->
                            
                            	
							</div><!-- end row -->
                            
                        </div><!-- end columns -->
                        
                    	<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 content-side">
                        	<div class="space-right">
                            
                                <div class="blog-post">
                                    <div class="main-img blog-post-img">
                            <div class="ticket" style="background-color: #bdc9b9;">
                                <div class="left">
                                    <div class="image">
                                        <div class="ticket-number">
                                            <p>
                                                #20030220(booking_id)
                                            </p>
                                        </div>
                                    </div>
                                    <div class="ticket-info">
                                        <p class="date">
                                            <span>${day}</span>
                                            <span class="june-29">${month} <br> ${days}TH</span>
                                            <span>${year}</span>
                                        </p>
                                        <div class="show-name">
                                            <h1>${chuyenxe.tuyenxe.diemdau}</h1>
                                            <h2>${chuyenxe.tuyenxe.diemcuoi}</h2>
                                        </div>
                                        <div class="time">
                                            <p>${chuyenxe.giodi} <span>TO</span> ${chuyenxe.giove}</p>
                                        </div>
                                        <p class="location"><span>Website: datvexekhach</span>
                                            <span class="separator"><i class="far fa-smile"></i></span><span>Website: datvexekhach</span>
                                        </p>
                                    </div>
                                </div>
                                <div class="right">
                                    <p class="admit-one">
                                        <span>datvexekhach</span>
                                        <span>datvexekhach</span>
                                        <span>datvexekhach</span>
                                    </p>
                                    <div class="right-info-container">
                                        
                                        <div class="time">
                                            <p>8:00 PM <span>TO</span> 11:00 PM</p>
                                        </div>
                                        <div class="barcode">
                                            <img src="https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=${chuyenxe.tuyenxe.diemdau}-${chuyenxe.tuyenxe.diemcuoi}-${chuyenxe.ngaydi}-${chuyenxe.price}-${chuyenxe.tuyenxe.bienso}&choe=UTF-8"  />
                                        </div>
                                        <p class="ticket-number">
                                            #20030220(booking_id)
                                        </p>
                                    </div>
                                </div>
                            </div>
                                    </div><!-- end blog-post-img -->
                                    <p>(Lưu ý: khi mua vé, bạn sẽ nhận được vé như bên trên)</p>
                                    <div class="detail">
                                        <h2>Tuyến xe khách ${chuyenxe.tuyenxe.diemdau} - ${chuyenxe.tuyenxe.diemcuoi}</h2>
                                        <h3>Ngày đi: ${chuyenxe.ngaydi}</h3>
                                        <p>Gía vé: ${chuyenxe.price}đ - Giờ khởi hành: <span>${chuyenxe.giodi}</span></p>
                                        <h5>Các chặng đi qua</h5>
                                        <p>${chuyenxe.tuyenxe.cacChangQua}</p>
                                        <form method="post" action="datve">
                                            <label>Số lượng vé: </label>
                                            <input type="number" name="sove">
                                            <input type="hidden" name="id" value="${chuyenxe.id}">
                                            <button class="btn-success">Đặt vé</button>
                                        </form>
                                    </div>
                                </div><!-- end blog-post -->
                            	<hr>
                                <h3>Bình luận</h3>
                                <div id="comments" style="margin-top: -5px;">
                                <c:forEach items="${listComment}" var="list">
                                	<div class="comment-block">
                                		<div class="user-img">
                                        	<img style="width: 100px; height: 100px" src="${list.account.avatar}" class="img-responsive" alt="user-img" />
                                        </div><!-- end user-img -->
                                        
                                        <div class="user-text">
                                        	<ul class="list-inline list-unstyled">
                                            	<li class="user-name">${list.account.fullname}</li>
                                                <li class="date">${list.createdDate}</li>
                                            </ul>
                                            <p>${list.content}</p>
                                            <c:choose>
											    <c:when test="${pageContext.request.userPrincipal.name == list.account.username}">
											        <a href="deleteComment?id=${list.id}"><span><i class="fa fa-trash"></i></span> Xóa</a>
											    </c:when>    
											    <c:otherwise>
											       
											    </c:otherwise>
											</c:choose>
                                            
                                        </div><!-- end user-text -->
                                	</div><!-- end comment-block -->
									</c:forEach>
                                   
                                </div><!-- end comments -->
                                 <c:choose>
								   <c:when test="${pageContext.request.userPrincipal.name==null}">
								      <p>hãy đăng nhập để viết bình luận</p>
								   </c:when>    
								   <c:otherwise>
								       <div id="comment-form">
                                	<div class="innerpage-heading">
                                    	<h1>Thêm phản hồi</h1>
                                    </div><!-- end innerpage-heading -->
                                    
                                    <form method="post" action="addComment">
                                        <h5>Bình luận với: ${pageContext.request.userPrincipal.name}</h5>
                                        <div class="form-group">
                                            <textarea name="content" class="form-control input-lg" rows="5" placeholder="Your Message"></textarea>
                                        </div>
                                        <input type="hidden" name="id" value="${chuyenxe.id}">
                                        <button class="btn btn-orange">Submit</button>
                                    </form>
                                </div><!-- end comment-form -->
								   </c:otherwise>
								</c:choose>  
                                
                                
                            </div><!-- end space-right -->
                        </div><!-- end columns -->

                    </div><!-- end row -->
        		</div><!-- end container -->
        	</div><!-- end blog-details -->
        </section><!-- end innerpage-wrapper -->
        
        
        <!--======================= BEST FEATURES =====================-->
        <section id="best-features" class="banner-padding black-features">
        	<div class="container">
        		<div class="row">
        			<div class="col-sm-6 col-md-3">
                    	<div class="b-feature-block">
                    		<span><i class="fa fa-dollar"></i></span>
                        	<h3>Best Price Guarantee</h3>
                            <p>Lorem ipsum dolor sit amet, ad duo fugit aeque fabulas, in lucilius prodesset pri. Veniam delectus ei vis.</p>
                        </div><!-- end b-feature-block -->
                   </div><!-- end columns -->
                   
                   <div class="col-sm-6 col-md-3">
                    	<div class="b-feature-block">
                    		<span><i class="fa fa-lock"></i></span>
                        	<h3>Safe and Secure</h3>
                            <p>Lorem ipsum dolor sit amet, ad duo fugit aeque fabulas, in lucilius prodesset pri. Veniam delectus ei vis.</p>
                        </div><!-- end b-feature-block -->
                   </div><!-- end columns -->
                   
                   <div class="col-sm-6 col-md-3">
                    	<div class="b-feature-block">
                    		<span><i class="fa fa-thumbs-up"></i></span>
                        	<h3>Best Travel Agents</h3>
                            <p>Lorem ipsum dolor sit amet, ad duo fugit aeque fabulas, in lucilius prodesset pri. Veniam delectus ei vis.</p>
                        </div><!-- end b-feature-block -->
                   </div><!-- end columns -->
                   
                   <div class="col-sm-6 col-md-3">
                    	<div class="b-feature-block">
                    		<span><i class="fa fa-bars"></i></span>
                        	<h3>Travel Guidelines</h3>
                            <p>Lorem ipsum dolor sit amet, ad duo fugit aeque fabulas, in lucilius prodesset pri. Veniam delectus ei vis.</p>
                        </div><!-- end b-feature-block -->
                   </div><!-- end columns -->
                </div><!-- end row -->
        	</div><!-- end container -->
        </section><!-- end best-features -->
        
        
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