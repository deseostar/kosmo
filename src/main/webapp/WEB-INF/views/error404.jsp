<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	response.setStatus(HttpServletResponse.SC_OK);
%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>PoKor - 404 Error</title>

<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">
</head>

<div class="preloader d-flex align-items-center justify-content-center">
	<div class="preloader-circle"></div>
	<div class="preloader-img">
		<img src="resources/img/core-img/leaf.png" alt="">
	</div>
</div>

<body style="background-color: #F5F5F5">
	<div class="container" align="center">
	<img src="resources/img/bg-img/sorry.jpg"><br>
	<img src="resources/img/core-img/logo.png" style="max-width:300px">
		<h2>The requested page could not be found.</h2>
		
		<div class="welcome-btn-group">
           <a href="#" class="btn alazea-btn mr-30" onclick="window.history.back()">Back</a> 
           <a href="#" class="btn alazea-btn active" onclick="window.location.href='index'">Main</a> 
        </div>
	</div>
	<!-- jQuery-2.2.4 js -->
	<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="resources/js/bootstrap/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="resources/js/bootstrap/bootstrap.min.js"></script>
	<!-- All Plugins js -->
	<script src="resources/js/plugins/plugins.js"></script>
	<!-- Active js -->
	<script src="resources/js/active.js"></script>
</body>
</html>