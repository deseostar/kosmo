<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="images" value="/kosmo/resources/img/board/onedayclass/" />




	
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
<style>
.input {
border:solid 2px #70c745;
} 

@media only screen and (max-width: 800px) {
   
   #onedayclassOpendate{
   	    width: 294px !important;
   }
   #onedayclassContent{
   	    width: 327px !important;
   }
  
   #onedayclassSubject{
   	width:327px !important;
   	height:34px !important;
   }
   .alazea-btn{
    width: 250px !important;
    margin-left: 50px !important;
    }
    .padding0{
    	padding:0px !important;
    	
    }
}
</style>
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

<form action="onedayclassWritePro" method="post" enctype="multipart/form-data" name="onedayclassWritePro" onsubmit="return writeCheck()">
<input class="input" type="hidden" name="memberNumber" value="${userVO.memberNumber}">
<input class="input" type="hidden" name="memberEmail" value="${userVO.memberEmail}">

<!-- ##### Testimonial Area Start ##### -->
<section class="testimonial-area section-padding-100">
	<div class="container">
		<div class="row">
			<div class="col-12">
					<!-- Single Testimonial Slide -->
					<div class="single-testimonial-slide">
						<div class="row align-items-center">
							<div class="col-12 col-md-12">
								<div class="testimonial-content">
									<!-- Section Heading -->
									<div class="section-heading">
				                        <h2 style="text-align:center;font-size:20px;color:black;font-weight:bold;">Subject<pre><input style="width:100%;" class="input" type="text" id="onedayclassSubject" name="onedayclassSubject" maxlength="50" placeholder="Please enter a class title"></h2>
				                        <p>Founder: ${userVO.memberId}<input  class="input" type="hidden" name="memberId" value="${userVO.memberId}">
				                        <br> <!-- Category:<input class="input" type="text" name="onedayclassCategory" maxlength="50" placeholder="Please enter a category"></p> -->
									</div>
									<div class="testimonial-author-info" style="overflow-x:hidden;">
										<h6 style="text-align:center;font-size:20px;color:black;font-weight:bold;">Content<pre><textarea class="input" cols="50" rows="7" style="overflow-x:hidden; width:100%;" name="onedayclassContent" id="onedayclassContent"placeholder="Enter your Article" word-break:break-all></textarea></pre></h6>
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
                          <div class="col-lg-4 col-md-4 col-sm-4 col-6 padding0">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconCategory.jpeg" style="width:100px">
                                 <h5>Category</h5>
                                 <p><input class="input" type="text" name="onedayclassCategory" maxlength="50" placeholder="Please enter a category"></p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-lg-4 col-md-4 col-sm-4 col-6">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconRecruitment.jpeg" style="width:100px">
                                 <h5>Recruit People</h5>
                                 <p><input class="input" type="text" name="onedayclassRecruitment" maxlength="50" placeholder="Please enter the recruitment mumber"></p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-lg-4 col-md-4 col-sm-4 col-6 padding0">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconLocation.jpeg" style="width:100px">
                                 <h5>Location</h5>
                                 <p><input class="input" type="text" name="onedayclassLocation" maxlength="50" placeholder="Please enter the location"></p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-lg-6 col-md-6 col-sm-6 col-6">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconMoney.jpeg" style="width:100px">
                                 <h5>Price</h5>
                                 <p><input class="input" type="number" name="onedayclassPrice" maxlength="50" placeholder="Please enter a price"></p>
                             </div>
                         </div>

                         <!-- Single Benefits Area -->
                         <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                             <div class="single-benefits-area">
                                 <img src="resources/img/board/onedayclass/iconWatch.jpeg" style="width:100px">
                                 <h5>Opendate</h5>
                                 <p><input id="onedayclassOpendate" class="input" type="datetime-local" name="onedayclassOpendate" min="2019-03-14T00:00" placeholder="YYYY-MM-DD hh:mm" style="width:220px"></p>
                                 <!-- <p><input class="input" type="datetime-local" name="onedayclassOpendate" placeholder="yyyy-MM-dd" style="width:190px"></p> -->
                             </div>
                         </div>

                         
                         
                          <div class="col-lg-4 col-md-4 col-sm-4 col-12">
                             <div class="single-benefits-area">
                             	 <br>	
                         		 <label style="font-weight:500;font-size:20px;"for="onedayclassImg1">Main Image</label><br>
				                 <input class="input" type="file" name="onedayclassImg1" id="onedayclassImg1">
				             </div>
                         </div> 
                          <div class="col-lg-4 col-md-4 col-sm-4 col-12">
                             <div class="single-benefits-area">
                             	 <br>	
			                     <label style="font-weight:500;font-size:20px;"for="onedayclassImg3">Sub Image</label><br>
			                     <input class="input" type="file" name="onedayclassImg3" id="onedayclassImg3">
				             </div>
                         </div> 
                         <!-- Single Benefits Area -->
                         <div class="col-lg-4 col-md-4 col-sm-4 col-12">
                             <div class="single-benefits-area">
                                 <!-- <img src="resources/img/board/onedayclass/iconCalculator.jpeg" style="width:100px"> -->
                                 <br>
                                 <h5 style="margin-bottom:12px;">Kakao QR code Image</h5>
                                 <input class="input" type="file" name="onedayclassImg2" id="onedayclassImg2">
                                 <p>${dto.onedayclassPay}</p>
                             </div>
                         </div> 
                     </div>
                 </div>
             </div>
         </div>
    </section>





<c:if test="${userVO.memberTemp1 eq 2}">
	<table style="margin-left: auto; margin-right: auto;">
		<th colspan="2">
			<input class="btn alazea-btn mt-15" type="submit" value="write">
			<input class="btn alazea-btn mt-15" type="reset" value="cancle">
			<input class="btn alazea-btn mt-15" type="button" value="list"
					onclick="window.location='onedayclassBoardList'">
		</th>
	</table>
</c:if>
<br>
<br>
</form>

<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->

</body>
</html>