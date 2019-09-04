<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>Helper - Foriener &amp; Help HTML Template</title>

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

<jsp:include page="../../setting/header01.jsp" flush="false" />

<style>
.center {
	text-align: center;
}

.single-benefits-area {
	text-align: center;
}

.alazea-Mine {
  -webkit-transition-duration: 400ms;
  transition-duration: 400ms;
  position: relative;
  z-index: 1;
  display: inline-block;
  min-width: 75px;
  height: 40px;
  color: #ffffff;
  background-color: #70c745;
  border: 2px solid #70c745;
  border-radius: 2px;
  padding: 0 20px;
  font-size: 16px;
  line-height: 42px;
  text-transform: uppercase;
  font-weight: 600; }

.alazea-Mine.active, .alazea-Mine:hover, .alazea-Mine:focus {
    font-size: 16px;
    color: #70c745;
    font-weight: 600;
    background-color: transparent;
    box-shadow: none; } 
      
</style>


<!-- ##### Breadcrumb Area Start ##### -->
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div
		class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
		style="background-image: url(resources/img/board/onedayclass/onedayclassBack.png);">
		<h2>ONEDAYCLASS</h2>
	</div>
</div>
			<br>
			<br>
<!-- ##### Testimonial Area Start ##### -->
<section class="testimonial-area style="width:100%;">
	<div class="container">
		<div class="row">
			<div class="col-12 col-md-6">
				<div class="testimonials-slides owl-carousel">
					<!-- Single Testimonial Slide -->
					<div class="single-testimonial-slide">
						<div class="row align-items-center">

							<div class="testimonial-thumb">
								<img style="height: 300px"
									src="resources/img/board/onedayclass/${dto.onedayclassImg1}"
									alt="">
							</div>
						</div>
					</div>
					<!-- Single Testimonial Slide -->
					<div class="single-testimonial-slide">
						<div class="row align-items-center">
							<div class="testimonial-thumb">
								<img style="height: 100%; width: 100%;"
									src="resources/img/board/onedayclass/logo1.png" alt="">
							</div>
						</div>
					</div>
					<!-- Single Testimonial Slide -->
					<div class="single-testimonial-slide">
						<div class="row align-items-center">
							<div class="testimonial-thumb">
								<img style="height: 300px"
									src="resources/img/board/onedayclass/${dto.onedayclassImg3}"
									alt="">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 col-md-6">
				<div class="testimonial-content">
					<!-- Section Heading -->
					<div class="section-heading">
						<h2>${dto.onedayclassSubject}</h2>
						<%-- <p>Category:${dto.onedayclassCategory}</p> --%>
					</div>
					<p>${dto.onedayclassContent}</p>
					<div class="testimonial-author-info">
						<p>Founder: ${dto.memberId}</p>
					</div>
				</div>
			</div>
		</div>

		<%-- 		<div class="row">
			<div class="col-12">
				<!-- <div class="testimonials-slides owl-carousel"> -->
				<div
					class="testimonials-slides owl-carousel owl-loaded owl-drag owl-grab">

					<!-- Single Testimonial Slide -->
					<div class="single-testimonial-slide">
						<div class="row align-items-center">
							<div class="col-12 col-md-6">
								<div class="testimonial-thumb">
									<img style="height: 300px"
										src="resources/img/board/onedayclass/${dto.onedayclassImg1}"
										alt="">
								</div>
							</div>
							<div class="col-12 col-md-6">
								<div class="testimonial-content">
									<!-- Section Heading -->
									<div class="section-heading">
										<h2>${dto.onedayclassSubject}</h2>
										<p>Category:${dto.onedayclassCategory}</p>
									</div>
									<p>${dto.onedayclassContent}</p>
									<div class="testimonial-author-info">
										<p>Founder: ${dto.memberId}</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Single Testimonial Slide -->
					<div class="single-testimonial-slide">
						<div class="row align-items-center">
							<div class="col-12 col-md-6">
								<div class="testimonial-thumb">
									<img style="height: 100%; width: 100%;"
										src="resources/img/board/onedayclass/logo1.png" alt="">
								</div>
							</div>
							<div class="col-12 col-md-6">
								<div class="testimonial-content">
									<!-- Section Heading -->
									<div class="section-heading">
										<h2>${dto.onedayclassSubject}</h2>
										<p>Category:${dto.onedayclassCategory}</p>
									</div>
									<p>${dto.onedayclassContent}</p>
									<div class="testimonial-author-info">
										<p>Founder: ${dto.memberId}</p>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Single Testimonial Slide -->
					<div class="single-testimonial-slide">
						<div class="row align-items-center">
							<div class="col-12 col-md-6">
								<div class="testimonial-thumb">
									<img style="height: 300px"
										src="resources/img/board/onedayclass/${dto.onedayclassImg3}"
										alt="">
								</div>
							</div>
							<div class="col-12 col-md-6">
								<div class="testimonial-content">
									<!-- Section Heading -->
									<div class="section-heading">
										<h2>${dto.onedayclassSubject}</h2>
										<p>Category:${dto.onedayclassCategory}</p>
									</div>
									<p>${dto.onedayclassContent}</p>
									<div class="testimonial-author-info">
										<p>Founder: ${dto.memberId}</p>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div> --%>

		<div class="alazea-benefits-area">
			<div class="row">

				<!-- Single Benefits Area -->
				<div class="col-lg-2 col-md-2 col-sm-4 col-6">
					<div class="single-benefits-area">
						<img src="resources/img/board/onedayclass/iconCategory.jpeg"
							style="width: 70%;">
						<h5 class="center">Category</h5>
						<p class="center">${dto.onedayclassCategory}</p>
					</div>
				</div>

				<!-- Single Benefits Area -->
				<div class="col-lg-2 col-md-2 col-sm-4 col-6">
					<div class="single-benefits-area">
						<img src="resources/img/board/onedayclass/iconRecruitment.jpeg"
							style="width: 70%">
						<h5 class="center">Recruit People</h5>
						<p id="recruitment" class="center">${dto.onedayclassRecruitment}</p>
					</div>
				</div>

				<!-- Single Benefits Area -->
				<div class="col-lg-2 col-md-2 col-sm-4 col-6">
					<div class="single-benefits-area">
						<img src="resources/img/board/onedayclass/iconLocation.jpeg"
							style="width: 70%">
						<h5 class="center">Location</h5>
						<p class="center">${dto.onedayclassLocation}</p>
					</div>
				</div>

				<!-- Single Benefits Area -->
				<div class="col-lg-2 col-md-2 col-sm-4 col-6">
					<div class="single-benefits-area">
						<img src="resources/img/board/onedayclass/iconMoney.jpeg"
							style="width: 70%">
						<h5 class="center">Price</h5>
						<p class="center">${dto.onedayclassPrice}</p>
					</div>
				</div>

				<!-- Single Benefits Area -->
				<div class="col-lg-2 col-md-2 col-sm-4 col-6">
					<div class="single-benefits-area">
						<img src="resources/img/board/onedayclass/iconRecruitment.jpeg"
							style="width: 70%">
						<h5 class="center">Participants</h5>
						<p id="totalpeople" class="center">${dto.onedayclassTotalpeople}</p>
					</div>
				</div>

				<!-- Single Benefits Area -->
				<div class="col-lg-2 col-md-2 col-sm-4 col-6">
					<div class="single-benefits-area">
						<img src="resources/img/board/onedayclass/iconWatch.jpeg"
							style="width: 70%">
						<h5 class="center">Opendate</h5>
						<p class="center">
							<fmt:formatDate value="${dto.onedayclassOpendate}"
								pattern="yyyy-MM-dd HH:mm" />
						</p>
					</div>
				</div>

				<!-- Single Benefits Area -->
				<div class="col-lg-2 col-md-2 col-sm-4 col-6">
					<div class="single-benefits-area">
						<img src="resources/img/board/onedayclass/iconLookup.jpeg"
							style="width: 70%">
						<h5 class="center">Lookup</h5>
						<p class="center">${dto.onedayclassLookup}</p>
					</div>
				</div>

				<!-- Single Benefits Area -->
				<div class="col-lg-2 col-md-2 col-sm-4 col-6">
					<div class="single-benefits-area">
						<img src="resources/img/board/onedayclass/iconWatch.jpeg"
							style="width: 70%">
						<h5 class="center">Date Created</h5>
						<p class="center">
							<fmt:formatDate value="${dto.onedayclassRegdate}"
								pattern="yyyy-MM-dd HH:mm" />
						</p>
					</div>
				</div>

				<!-- Single Benefits Area -->
				<div class="col-lg-2 col-md-2 col-sm-4 col-6">
					<div class="single-benefits-area">
						<img src="resources/img/board/onedayclass/iconTheEnd.jpeg"
							style="width: 70%">
						<h5 class="center">Exit</h5>
						<c:choose>
							<c:when test="${endDate.DAYS gt 0}">
									  		Time remaining: <br> ${endDate.DAYS} Day
									  		<c:choose>
									<c:when test="${endDate.HOURS gt 0}">
									  				${endDate.HOURS} Hour
									  					<c:choose>
											<c:when test="${endDate.MINUTES gt 0}">
									  							${endDate.MINUTES} minute
									  						</c:when>
										</c:choose>
									</c:when>
									<c:when test="${endDate.HOURS eq 0}">
										<c:choose>
											<c:when test="${endDate.MINUTES gt 0}">
									  							${endDate.MINUTES} minute
									  						</c:when>
										</c:choose>
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${endDate.DAYS eq 0}">
								<c:choose>
									<c:when test="${endDate.HOURS gt 0}">
									  				${endDate.HOURS} Hour
									  					<c:choose>
											<c:when test="${endDate.MINUTES gt 0}">
									  							${endDate.MINUTES} minute
									  						</c:when>
										</c:choose>
									</c:when>
								</c:choose>
							</c:when>
							<c:otherwise>
									     	Exit
									  </c:otherwise>
						</c:choose>
					</div>
				</div>

				<!-- Single Benefits Area -->
				<div class="col-lg-2 col-md-2 col-sm-4 col-6">
					<div class="single-benefits-area">
						<img src="resources/img/board/onedayclass/iconTheEnd.jpeg"
							style="width: 70%">
						<h5 class="center">DeadlineCheck</h5>
						<p class="center">${dto.onedayclassDeadlineCheck}</p>
					</div>
				</div>

				<!-- Single Benefits Area -->
				<div class="col-lg-2 col-md-2 col-sm-4 col-6">
					<div class="single-benefits-area">
						<img src="resources/img/board/onedayclass/iconPenguin.jpeg"
							style="width: 70%">
						<h5 class="center">Reservation</h5>
						<fmt:parseNumber value="${dto.onedayclassRecruitment}"
							var="Recruitment" />
						<c:if test="${Recruitment - dto.onedayclassTotalpeople ge 0}">
							<c:if test="${dto.onedayclassDeadlineCheck ne 'close'}">
								<c:if
									test="${endDate.DAYS ge 0 && endDate.HOURS ge 0 && endDate.MINUTES ge 0}">
									<button type="button" class="btn alazea-btn mt-15"
										id="reservationFunction"
										onclick="reservationInsertFunction(); reservationFunction();">Reservation</button>
								</c:if>
							</c:if>
						</c:if>
					</div>
				</div>

				<!-- Single Benefits Area -->
				<div class="col-lg-2 col-md-2 col-sm-4 col-6">
					<div class="single-benefits-area">
						<img src="resources/img/board/onedayclass/${dto.onedayclassImg2}"
							style="width: 70%">
						<h5 class="center">Payment</h5>
						<a href="${dto.onedayclassPay}"><button type="button"
								class="btn btn-warning mt-15">Payment</button></a>
						<c:if test="${dto.onedayclassPay eq 'ERROR'}">
							<a onclick="window.alert('NO QR code Found')"><button type="button"
								class="btn alazea-btn mt-15">Payment</button></a>
						</c:if>
						<c:if test="${dto.onedayclassPay ne 'ERROR'}">
							<a href="${dto.onedayclassPay}"><button type="button"
								class="btn alazea-btn mt-15">Payment</button></a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<c:if test="${userVO.memberId eq dto.memberId}">
	<table style="margin-left: auto; margin-right: auto;">
		<th colspan="2"><input class="btn alazea-btn mt-15" type="button"
			value="Edit article"
			onclick="window.location='onedayclassModifyForm?onedayclassNumber=${dto.onedayclassNumber}'">
			<input class="btn alazea-btn mt-15" type="button" value="Delete article"
			onclick="window.location='onedayclassDeletePro?onedayclassNumber=${dto.onedayclassNumber}'">
		</th>
	</table>
</c:if>

<c:if test="${userVO.memberId != null}">
	<!-- <div class="row">
	<div class="col-md-6 col-md-offset-3">
		<div class="box box-success"> -->
	<div class="box-header">
		<h3 class="box-title" style="text-align: center">Add a comment</h3>
	</div>
	<div class="box-body" style="text-align: center">
		<p>${userVO.memberId} Leave a Comment</p>
		<!-- <label for="oCommentContent">댓글을 남겨주세요</label> -->
		<input class="form-control" type="text" placeholder="REPLY TEXT"
			id="oCommentContent"
			style="width: 50%; margin-left: auto; margin-right: auto">
	</div>
	<!-- /.box-body -->
	<div class="box-footer" style="text-align: center">
		<button type="button" class="btn alazea-btn mt-15" id="submitFunction"
			onClick="submitFunction()">ADD REPLY</button>
	</div>
	<!-- 		</div>
	</div>
</div> -->
</c:if>

<div class="container"
	style="width: 100%; margin-left: auto; margin-right: auto;">
	<div id="getoCommentList"></div>
</div>

<%-- <div id ="getoCommentList">
<table>
<c:forEach var="row" items="${getoCommentList}">
	<tr>
		<td>${row.oCommentNumber}</td>
		<td>${row.memberId}</td>
		<td>${row.oCommentRegdate}</td>
		<td>${row.oCommentContent}</td>
		<td>
			<c:if test="${userVO.memberId == row.memberId}">
				<input type="button" value="Modify">
			</c:if>
		</td>
	</tr>	
</c:forEach>
</table>
</div> --%>

<!-- The time line -->
<ul class="text-center">
	<!-- timeline time label -->
	<c:if test="${userVO.memberId ne null}">
		<li class="time-label" id="repliesDiv">
<!-- 			<span class="bg-green">Replies List</span> -->
		</li>
	</c:if>
</ul>
<div class='text-center'>
	<ul id="pagination" class="pagination pagination-sm no-margin"></ul>
</div>


<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->


<script type="text/javascript">

/* 예약 목록을 출력할 영역 */
function reservationListFunction() {
	 $.ajax({
		type: "get",
		contentType: "application/json",
		url:"reservationList?memberId=${userVO.memberId}",
		success:function(result){
			console.log(result);
			
			var output="<table class='table'>";
			for(var i in result){
				output += "<tr>";
				output += "<td>"+result[i].oCommentNumber + "</td>";
				output += "<td>"+result[i].memberId + "</td>";
				output += "<td>"+changeDate(result[i].oCommentRegdate) + "</td>";
				output += "<td>"+result[i].oCommentContent + "</td>";
				if("${userVO.memberId}" == result[i].memberId){
					var oComm = result[i].oCommentNumber;
					output += "<td><input type='button' value='Modify' onclick='updateOpen("+oComm+")'></td>";
				}
				if("${userVO.memberId}" == result[i].memberId){
					var oComm = result[i].oCommentNumber;
					output += "<td><input type='button' value='Delete' onclick='deleteOpen("+oComm+")'></td>";
				}	
				output += "</tr>";
			}
			output += "</table>";
			console.log(output);
			$("#getoCommentList").html(output); 
			/* $(output).appendTo("#getoCommentList"); */
			/* $('table').append("#getoCommentList"); */
		}
	})
}

/* 예약테이블에 인서트 */
function reservationInsertFunction() {
	var reservatedPersonNumber = "${dto.memberNumber}";
	var reservationEmail = "${dto.memberEmail}";
	var reservationId = "${userVO.memberId}";
	var memberId = "${dto.memberId}";
	var onedayclassNumber = "${dto.onedayclassNumber}";
	$.ajax({
		type : "PUT",
		url : "reservationInsert",
		data: JSON.stringify({
			reservatedPersonNumber : reservatedPersonNumber,
			reservationEmail : reservationEmail,
			reservationId : reservationId,
			memberId : memberId,
			onedayclassNumber : onedayclassNumber
		}),
		headers: {
			'Accept': 'application/json',
			'Content-Type': 'application/json'
		},
	});
}



/* 예약 */
function reservationFunction() {
	var onedayclassTotalpeople = "${dto.onedayclassTotalpeople}";
	var onedayclassRecruitment = "${dto.onedayclassRecruitment}";
	var onedayclassNumber = "${dto.onedayclassNumber}";
	
	$.ajax({
		type : "PUT",
		url : "peopleUpdate",
		data: JSON.stringify({
			onedayclassTotalpeople : onedayclassTotalpeople,
			onedayclassRecruitment : onedayclassRecruitment,
			onedayclassNumber : onedayclassNumber
		}),
		headers: {
			'Accept': 'application/json',
			'Content-Type': 'application/json'
		},
		success: function(map) {
				var onedayclassTotalpeople = map.ONEDAYCLASSTOTALPEOPLE;
				var onedayclassRecruitment = map.ONEDAYCLASSRECRUITMENT;
				$("#totalpeople").html(onedayclassTotalpeople);
				$("#recruitment").html(onedayclassRecruitment);
		}		
	});
	alert("Your reservation is completed immediately.");
}

/* 댓글 추가 */
function submitFunction() {
	var oCommentNumber = "${oCommentNumber}";
	var onedayclassNumber = "${dto.onedayclassNumber}";
	var memberEmail = "${userVO.memberEmail}";
	/* alert(memberEmail) */
	var memberId = "${userVO.memberId}";
	var oCommentContent = $('#oCommentContent').val();

	$.ajax({
		type : "POST",
		url: "oCommentInsert",
		data: JSON.stringify({
			oCommentNumber: oCommentNumber,
			onedayclassNumber: onedayclassNumber,
			memberEmail: memberEmail,
			memberId: memberId,
			oCommentContent: oCommentContent

		}),
		headers: {
			'Accept': 'application/json',
			'Content-Type': 'application/json'
		},
		success: function(result) {
			getoCommentList();
		}
	});
	$('#oCommentContent').val('');
/* 	setTimeout(function(){
		getoCommentList();
    }, 3000); */
}

/* 댓글 목록을 출력할 영역 */
function getoCommentList() {
	/* alert("댓글떳2222음!!!!!!!") */
	 $.ajax({
		type: "get",
		contentType: "application/json",
		url:"list_json?onedayclassNumber=${dto.onedayclassNumber}",
		success:function(result){
			console.log(result);
			
			var output="<table class='table'>";
			for(var i in result){
				output += "<tr>";
				output += "<td>"+result[i].oCommentNumber + "</td>";
				output += "<td>"+result[i].memberId + "</td>";
				output += "<td>"+changeDate(result[i].oCommentRegdate) + "</td>";
				output += "<td>"+result[i].oCommentContent + "</td>";
				if("${userVO.memberId}" == result[i].memberId){
					var oComm = result[i].oCommentNumber;
					output += "<td><input type='button' class='btn alazea-Mine' value='Modify' onclick='updateOpen("+oComm+")'></td>";
				}
				if("${userVO.memberId}" == result[i].memberId){
					var oComm = result[i].oCommentNumber;
					output += "<td><input type='button' class='btn alazea-Mine' value='Delete' onclick='deleteOpen("+oComm+")'></td>";
				}	
				output += "</tr>";
			}
			output += "</table>";
			console.log(output);
			$("#getoCommentList").html(output); 
			/* $(output).appendTo("#getoCommentList"); */
			/* $('table').append("#getoCommentList"); */
		}
	})
}

/* 날짜 포맷 바꾸는 함수 */
function changeDate(date) {
	date = new Date(parseInt(date));
	year = date.getFullYear();
	month = date.getMonth();
	day = date.getDate();
	strDate = year+ "-" +month+ "-" +day;
	return strDate;
	}

/* 댓글 수정창 */
function updateOpen(data2){
	/* alert("진짜넘어온다.." + oComm); */
	window.name = "parentForm";  // 부모창 이름
	window.open("readOneComment?oCommentNumber=" + data2,
				"childForm", "width=570, height=350, resizable = no, scrollbars = no");// 자식창 이름
	
}

/* 댓글 삭제 확인창 */
function deleteOpen(data2) {
	var msg = confirm("댓글을 삭제합니다.");
	if(msg == true) {//확인을 누를경우
		deleteComment(data2);	
	}
	else {
		return false; //삭제취소
	}
}



/* 댓글 삭제 */
function deleteComment(data2){
	var oCommentNumber = data2;
	/* alert("삭제값 넘어오나?" + data2); */
	$.ajax({
		type : "DELETE",
		url: "deleteComment",
		data: JSON.stringify({
			"oCommentNumber": oCommentNumber,
		}),
		headers: {
			'Accept': 'application/json',
			'Content-Type': 'application/json'
		},
		success: function(result) {
			getoCommentList();
		}
	});
/* 	setTimeout(function(){
		getoCommentList();
    }, 4000); */
}



$(function(){
	/* alert("댓글떳음!!!!!!!") */
	getoCommentList();
})
	</script>
</body>
</html>