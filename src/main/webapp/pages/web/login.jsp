<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Signin</title>
	<link rel="stylesheet" type="text/css"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">	
	<link rel="stylesheet" href="<c:url value='template/assets/css/as-alert-message.min.css'/>"> 
	<link rel="stylesheet" href="<c:url value='template/assets/css/sign-in.css'/>"> 
</head>

<body>
	<header id="site-header" class="w3l-header fixed-top">
		<!--/nav-->
		<nav class="navbar navbar-expand-lg navbar-light fill px-lg-0 py-0 px-3">
			<div class="container">
				
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
				</div>
				<div class="Login_SignUp" id="login_s">
					<!-- style="font-size: 2rem ; display: inline-block; position: relative;" -->
					<!-- <li class="nav-item"> -->
					<a class="nav-link" href="sign_in.html"><i class="fa fa-user-circle-o"></i></a>
					<!-- </li> -->
				</div>
				<!-- toggle switch for light and dark theme -->
				
			</div>
		</nav>
	</header>

	<div class="container_signup_signin" id="container_signup_signin">
		<div class="form-container sign-up-container">
			<form:form name="sign-up-form" action="regis" onsubmit="return signUpValidateForm()" enctype="multipart/form-data" modelAttribute="account">
				<h1>Đăng ký</h1>
				<form:input  type="text" placeholder="họ tên" path="fullname" />
				<form:input  type="text" placeholder="username" path="username" />
				<form:input  type="text" placeholder="sđt" path="phone"  />
				<form:input  type="password" id="pass" placeholder="mật khẩu" path="password" />
				<input name="repass" id="repass" type="password" placeholder="nhập lại mật khẩu" />
				<label for="files">Chọn ảnh đại diện</label>
				<input id="files" name="file" type="file" />
				
				<button onclick="checkPass()">Đăng ký</button>
			</form:form>
		</div>
		<div class="form-container sign-in-container">
			<form name="sign-in-form" style="color: var(--theme-title);" action="${pageContext.request.contextPath}/j_spring_security_check" method='POST'
				onsubmit="return signInValidateForm()">
				<h1>Đăng nhập</h1>
				<div class="social-container">
					<a href="#" class="social" style="color: var(--theme-title);"><i class="fab fa-facebook-f"></i></a>
					<a href="#" class="social" style="color: var(--theme-title);"><i
							class="fab fa-google-plus-g"></i></a>
					<a href="#" class="social" style="color: var(--theme-title);"><i class="fab fa-linkedin-in"></i></a>
				</div>
				<span>or use your account</span>
				<input name="username" type="text" placeholder="username" />
				<input name="password" type="password" placeholder="Password" />
				<a href="#">Forgot your password?</a>
				<button>Đăng nhập</button>
			</form>
		</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>Welcome Back!</h1>
					<p>To keep connected with us please login with your login details</p>
					<button class="ghost" id="signIn">Sign In</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>Hello, Friend!</h1>
					<p>Register and book your tickets now!!!</p>
					<button class="ghost" id="signUp">Sign Up</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="assets/js/as-alert-message.min.js"></script>
	<script src="assets/js/jquery-3.3.1.min.js"></script>
	<!--/theme-change-->
	<script src="assets/js/theme-change.js"></script>
	<!-- disable body scroll which navbar is in active -->
	<script>
		$(function () {
			$('.navbar-toggler').click(function () {
				$('body').toggleClass('noscroll');
			})
		});
	</script>
	<!-- disable body scroll which navbar is in active -->
	<!--/MENU-JS-->
	<script>
		$(window).on("scroll", function () {
			var scroll = $(window).scrollTop();

			if (scroll >= 80) {
				$("#site-header").addClass("nav-fixed");
			} else {
				$("#site-header").removeClass("nav-fixed");
			}
		});

		//Main navigation Active Class Add Remove
		$(".navbar-toggler").on("click", function () {
			$("header").toggleClass("active");
		});
		$(document).on("ready", function () {
			if ($(window).width() > 991) {
				$("header").removeClass("active");
			}
			$(window).on("resize", function () {
				if ($(window).width() > 991) {
					$("header").removeClass("active");
				}
			});
		});
	</script>
	<script type="text/javascript">
		function checkPass(){
			
			var pass = document.getElementById("pass").value;
			var repass = document.getElementById("repass").value;
			var files = document.getElementById("files").value;
			if(pass != repass){
				alert("mật khẩu không trùng khớp");
			}
			if(files === ''){
				alert("ảnh không được để trống");
			}
		}
	</script>

	<script src="<c:url value='template/assets/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='template/assets/js/sign-in.js'/>"></script>
</body>

</html>