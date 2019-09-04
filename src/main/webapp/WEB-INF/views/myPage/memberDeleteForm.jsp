<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>
<link rel="stylesheet" href="resources/style.css">
<link rel="stylesheet" href="resources/css/SDHcss/sdhStyle.css">
</head>
<body>
	<div class="preloader d-flex align-items-center justify-content-center">
		<div class="preloader-circle"></div>
		<div class="preloader-img">
			<img src="resources/img/core-img/leaf.png" alt="">
		</div>
	</div>

	<%@ include file="../setting/header01.jsp"%>

	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/member/erase.png);">
			<h2>${sessionScope.userVO.memberId}'s MyPage</h2>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->

	<br>
	<br>
	<div class="container">
		<div class="row">
			<div id="memberModify" style="width: 50%; min-width: 360px; margin-left: auto; margin-right: auto;">
				<form action="memberDeletePro" method="post" name="memberModifyForm" onsubmit="return modifyCheck();">
					<div class="card"></div>
					<div class="card">

						<div class="input-container" style="text-align: center; font-size: auto; min-width: 360px; margin-left:auto; margin-right:auto;'">
							Do you really want quit this site?<br>
							Input your password and press enter key to quit.<br></div>

						<div class="input-container">
							<input type="password" id="Password" name="password" required="required" /> <label for="Password"></label>
							<div class="bar"></div>
						</div>

						<div class="button-container">
							<button type="button" onclick="window.location.href='myPage'">
								<span> BACK to info </span>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>

	<%@ include file="../setting/footer01.jsp"%>

</body>
</html>