<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="images" value="/kosmo/resources/img/board/onedayclass/" />

<style>
.input {
border:solid 2px #70c745;
} 
</style>
	
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


<form action="onedayclassModifyPro" method="post" enctype="multipart/form-data" name="onedayclassModifyPro" onsubmit="return modifyCheck()">
<input type="hidden" name="onedayclassNumber" value="${dto.onedayclassNumber}">

<!-- ##### Testimonial Area Start ##### -->
<section class="testimonial-area section-padding-100">
	<div class="container">
		<div class="row">
			<div class="col-12">

					<!-- Single Testimonial Slide -->
					<div class="single-testimonial-slide">
						<div class="row align-items-center">
							<div class="col-12 col-md-6">
								<!-- <div class="testimonial-thumb"> -->
				                    <label for="onedayclassImg1">Main Image</label><br>
				                    <input class="input" type="file" name="onedayclassImg1" id="onedayclassImg1">
				                    <br>
				                    <label for="onedayclassImg3">Sub Image</label><br>
				                    <input class="input" type="file" name="onedayclassImg3" id="onedayclassImg3">
								<!-- </div> -->
							</div>
							<div class="col-12 col-md-6">
								<div class="testimonial-content">
									<!-- Section Heading -->
									<div class="section-heading">
				                        <h2>Subject<pre><input class="input" type="text" name="onedayclassSubject" maxlength="50" value="${dto.onedayclassSubject}" style="width:100%"></pre></h2>
                        				<p>Founder: ${dto.memberId}
                        				<br> <%-- Category:<input class="input" type="text" name="onedayclassCategory" maxlength="50" value="${dto.onedayclassCategory}" style="width:100%"></p> --%>
									</div>
									<div class="testimonial-author-info">
										<h6>Content <pre><textarea class="input" cols="50" rows="7" style="overflow-x:hidden;" name="onedayclassContent" word-break:break-all>${dto.onedayclassContent}</textarea></pre></h6>
									</div>
								</div>
							</div>
						</div>
					</div>

			</div>
		</div>


             <div class="col-12 col-lg-12">
                 <div class="alazea-benefits-area">
                     <div class="row">
                         
                         <!-- Single Benefits Area -->
                          <div class="col-lg-2 col-md-2 col-sm-4 col-6">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconCategory.jpeg" style="width:100px">
                                 <h5>Category</h5>
                                 <p><input class="input" type="text" name="onedayclassCategory" maxlength="50" value="${dto.onedayclassCategory}"><p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-lg-2 col-md-2 col-sm-4 col-6">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconRecruitment.jpeg" style="width:100px">
                                 <h5>Recruit People</h5>
                                 <p><input class="input" type="text" name="onedayclassRecruitment" maxlength="50" value="${dto.onedayclassRecruitment}"></p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-lg-2 col-md-2 col-sm-4 col-6">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconLocation.jpeg" style="width:100px">
                                 <h5>Location</h5>
                                 <p><input class="input" type="text" name="onedayclassLocation" maxlength="50" value="${dto.onedayclassLocation}"></p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-lg-2 col-md-2 col-sm-4 col-6">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconMoney.jpeg" style="width:100px">
                                 <h5>Price</h5>
                                 <p>${dto.onedayclassPrice}</p>
                                 <%-- <p><input class="input" type="text" name="onedayclassPrice" maxlength="50" value="${dto.onedayclassPrice}"></p> --%>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-lg-2 col-md-2 col-sm-4 col-6">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconRecruitment.jpeg" style="width:100px">
                                 <h5>Participants</h5>
                                 <p>${dto.onedayclassTotalpeople}</p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-lg-2 col-md-2 col-sm-4 col-6">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconWatch.jpeg" style="width:100px">
                                 <h5>Opendate</h5>
                                 <p><input class="input" type="datetime-local" name="onedayclassOpendate" 
									placeholder="YYYY-MM-DD hh:mm" value="${dto.onedayclassOpendate}" min="2019-03-14T00:00" style="width:220px" required></p>
                             </div>
                         </div>
                         
                         <!-- Single Benefits Area -->
                         <div class="col-lg-2 col-md-2 col-sm-4 col-6">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconLookup.jpeg" style="width:100px">
                                 <h5>Lookup</h5>
                                 <p>${dto.onedayclassLookup}</p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-lg-2 col-md-2 col-sm-4 col-6">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconWatch.jpeg" style="width:100px">
                                 <h5>Date Created</h5>
                                 <p>${dto.onedayclassRegdate}</p>
                             </div>
                         </div>
                                                     
                         <!-- Single Benefits Area -->
                         <div class="col-lg-2 col-md-2 col-sm-4 col-6">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconTheEnd.jpeg" style="width:100px">
                                 <h5>Exit</h5>
                                 <p>${dto.onedayclassEndCheck}</p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-lg-2 col-md-2 col-sm-4 col-6">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconTheEnd.jpeg" style="width:100px">
                                 <h5>DeadlineCheck</h5>
                                 <p><input class="input" type="radio" name="onedayclassDeadlineCheck" value="close">close</p>
                                 <p><input class="input" type="radio" name="onedayclassDeadlineCheck" checked="checked" value="open">open</p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-lg-2 col-md-2 col-sm-4 col-6">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconPenguin.jpeg" style="width:100px">
                                 <h5>Reservation</h5>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-lg-2 col-md-2 col-sm-4 col-6">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconCalculator.jpeg" style="width:100px">
                                 <h5>Payment</h5>
                             </div>
                         </div> 
                     </div>
                 </div>
             </div>
         </div>
    </section>
    
    
<c:if test="${userVO.memberId eq dto.memberId}">
	<table style="margin-left: auto; margin-right: auto;">
		<th colspan="2">
			<input class="btn alazea-btn mt-15" type="submit" value="Modifications completed">
			<input class="btn alazea-btn mt-15" type="reset" value="Cancel edit" onclick="window.history.back()">
		</th>
	</table>
</c:if>
<br>
<br>
<!-- <script type="text/javascript">
document.getElementById('time').value="${dto.onedayclassOpendate}".toISOString().slice(0,16);
</script> -->


<!-- <script type="text/javascript">
var dateControl = document.querySelector('input[type="datetime-local"]');
dateControl.value="${dto.onedayclassOpendate}".toISOString().slice(0,16);
</script> -->

<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->

</body>
</html>