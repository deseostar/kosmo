<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="X-Content-Type-Options" content="nosniff" />

<title>Mypage</title>

<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">


<link rel="stylesheet" href="resources/css/SDHcss/sdhStyle.css">
<link rel="stylesheet" href="resources/style.css">

</head>
<body>


	<jsp:include page="../setting/header01.jsp" flush="false" />

	<div class="preloader d-flex align-items-center justify-content-center">
		<div class="preloader-circle"></div>
		<div class="preloader-img">
			<img src="resources/img/core-img/leaf.png" alt="">
		</div>
	</div>



	<!-- ##### Breadcrumb Area Start ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/member/erase.png);">
			<h2>${sessionScope.userVO.memberId}'s MyPage</h2>
		</div>
	</div>

	<!-- jQuery-2.2.4 js -->
	<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			$("#memberCountry option").each(function() {

				if ($(this).val() == "${userVO.memberCountry}") {

					$(this).attr("selected", "selected"); // attr적용안될경우 prop으로 
				}
			});
		});

		function modifyCheck() {

			if (document.memberModifyForm.password.value != document.memberModifyForm.Repeat_password.value) {
				alert("Passwords is incorrenct. Please check it.");
			}
		}

		function memberDeleteForm() {
			window.location.href = "memberDeleteForm";
		}
	</script>
	<!-- ##### Breadcrumb Area End ##### -->

	<br>
	<br>
	<div class="container">
		<div class="row">
			<div id="memberModify" style="width: 50%; min-width: 360px; margin-left: auto; margin-right: auto;">

				<!-- <H2 style="margin-bottom: 50px">User Info</H2> -->

				<form action="memberModifyPro" method="post" name="memberModifyForm"
					onsubmit="return modifyCheck();">
					<div class="card"></div>
					<div class="card">
						<div class="input-container">
							<select class="custom-select d-block w-100" id="memberCountry"
								name="memberCountry">
								<option value="USA">United State America</option>
								<option value="UK">United Kingdom</option>
								<option value="Korea">Korea</option>
								<option value="Japan">Japan</option>
								<option value="China">China</option>
								<option value="Canada">Canada</option>
								<option value="Bangla">Bangladesh</option>
								<option value="Hindi">Hindi</option>
								<option value="Spanish">Spain</option>
							</select>
						</div>

						<div id="modifyTitle" style="padding-left: 60px; font-size: 20px;">
							Email</div>
						<div class="input-container"
							style="text-align: center; font-size: 35px; min-width: 30px;">
							${userVO.memberEmail}</div>

						<div class="input-container">
							<input type="password" id="password" name="password"
								required="required" value="" placeholder="Please enter a password to change."> <label
								for="Repeat Password"></label>
							<div class="bar"></div>
						</div>

						<div class="input-container">
							<input type="password" id="Repeat_Password" required="required"
								value="" placeholder="Please enter a password to change."> <label for="Repeat Password">
								</label>
							<div class="bar"></div>
						</div>


						<div id="modifyTitle" style="padding-left: 60px; font-size: 20px;">
							Registration Dates</div>
						<div class="input-container"
							style="text-align: center; font-size: 35px; min-width: 30px;">
							<fmt:formatDate pattern="yyyy-MM-dd"
								value="${userVO.memberRegdate}" />
						</div>

						<div id="modifyTitle" style="padding-left: 60px; font-size: 20px;">
							Points</div>
						<div class="input-container"
							style="text-align: center; font-size: 35px; min-width: 30px;">
							${userVO.memberPoint}</div>

						<div class="button-container">
							<button type="submit">
								<span> Change your info </span>
							</button>
						</div>

						<div class="button-container" style="margin-top: 30px;">
							<button type="button" onclick="memberDeleteForm();">
								<span> I want to quit </span>
							</button>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
	<br>
	<br>

	<jsp:include page="../setting/footer01.jsp" flush="false" />

</body>
</html>