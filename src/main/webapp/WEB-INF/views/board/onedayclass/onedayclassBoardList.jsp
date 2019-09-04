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
<br>

<!-- ##### Breadcrumb Area End ##### -->
<!-- ##### Header Area End ##### -->

<section class="testimonial-area style="width:100%;">
<!-- <div class="container" style="margin-bottom: 50px;"> -->

      <!-- ##### Shop Area Start ##### -->
        <div class="container">
            <div class="row">
                <!-- Sidebar Area -->
                <div class="col-12 col-md-4 col-lg-3">
                    <div class="shop-sidebar-area">

                        <!-- Shop Widget -->

<!-- 						<form>
                        <div class="shop-widget catagory mb-50">
                            <h4 class="widget-title">Categories</h4>
                            <div class="widget-desc">
                                Single Checkbox
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="checkbox" class="custom-control-input" value="All" id="All" name="onedayclassCheck">
                                    <label class="custom-control-label" for="All">All classes</label>
                                </div>
                                Single Checkbox
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="checkbox" class="custom-control-input" value="Music" id="Music" name="onedayclassCheck">
                                    <label class="custom-control-label" for="Music">Music classes</label>
                                </div>
                                Single Checkbox
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="checkbox" class="custom-control-input" value="Crafts" id="Crafts" name="onedayclassCheck">
                                    <label class="custom-control-label" for="Crafts">Crafts classes</label>
                                </div>
                                Single Checkbox
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="checkbox" class="custom-control-input" value="Food" id="Food" name="onedayclassCheck">
                                    <label class="custom-control-label" for="Food">Food classes</label>
                                </div>
                                Single Checkbox
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="checkbox" class="custom-control-input" value="Coffee" id="Coffee" name="onedayclassCheck">
                                    <label class="custom-control-label" for="Coffee">Coffee classes</label>
                                </div>
                                Single Checkbox
                                <div class="custom-control custom-checkbox d-flex align-items-center mb-2">
                                    <input type="checkbox" class="custom-control-input" value="Other" id="Other" name="onedayclassCheck">
                                    <label class="custom-control-label" for="Other">Others</label>
                                </div>
                            </div>
                        </div>
                        </form> -->
                        
						<div class="shop-widget sort-by mb-50">
							<c:if test="${userVO.memberId ne null}">
								<c:if test="${userVO.memberTemp1 eq '0' or userVO.memberTemp1 eq null}">
									<h4 class="widget-title"><button type="button" class='btn alazea-btn' onclick="window.location='onedayclassAuthorityForm?memberId=${userVO.memberId}&onedayclassNumber=${dtos.get(0).onedayclassNumber}'">Applying for Class Creation</button></h4>
								</c:if>
							</c:if>
							<c:if test="${userVO.memberTemp1 eq '2'}">						
								<h4 class="widget-title"><button type="button" class='btn alazea-btn' onclick="window.location='onedayclassWriteForm?pageNum=${pageNum}'">OPEN ONEDAYCLASS &nbsp; </button></h4>
								<h4 class="widget-title"><button type="button" class='btn alazea-btn' onclick="window.location='reservationList?pageNum=${pageNum}'">RESERVATION CHECK</button></h4>					
							</c:if>
						</div>
                    </div>
                </div>

                <!-- All Products Area -->
                <div class="col-12 col-md-8 col-lg-9">
                    <div class="shop-products-area">
                        <div class="row">
                       	
                       	<c:if test="${cnt > 0}">
                        <c:forEach var="dto" items="${dtos}">

                            <!-- Single Product Area -->
                            <div class="col-12 col-sm-6 col-lg-4">
                                <div class="single-product-area mb-50">
                                    <!-- Product Image -->
                                    <!-- <div class="product-img"> -->
                                        <a href="onedayclassDetailForm?onedayclassNumber=${dto.onedayclassNumber}&pageNum=${pageNum}&number=${number+1}">
                                        	
                                        	<img src="resources/img/board/onedayclass/${dto.onedayclassImg1}" alt="">
	                                	</a>
	                                <div class="product-info mt-15 text-center">
	                                    <a href="onedayclassDetailForm?onedayclassNumber=${dto.onedayclassNumber}&pageNum=${pageNum}&number=${number+1}">
	                                        <p class='text-success'>${dto.onedayclassSubject}</p>
	                                    </a>
	                                    <h6 class='text-warning'>${dto.onedayclassPrice}Won &nbsp;&nbsp;&nbsp; Location: ${dto.onedayclassLocation}</h6>
	                                </div>
	                            </div>
							</div>

						</c:forEach>
						</c:if>
						
						</div>

                        <!-- Pagination -->
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                            	<!-- 게시글이 있으면 -->
								<c:if test="${cnt > 0}">
									<!-- 이전블록[◀] -->
									<c:if test="${startPage > pageBlock}">									
		                            	<li class="page-item"><a class="page-link" href="onedayclassBoardList?pageNum=${startPage - pageBlock}"><i class="fa fa-angle-left"></i></a></li>
		                            </c:if>	
		                            
		                        	<!--  블록내의 페이지 번호 -->
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i == currentPage}">
											<li class="page-item"><a class="page-link" href="onedayclassBoardList?pageNum=${i}">${i}</a></li>
										</c:if>
										<c:if test="${i != currentPage}">
			                                <li class="page-item"><a class="page-link" href="onedayclassBoardList?pageNum=${i}">${i}</a></li>
		                                </c:if>
		                            </c:forEach>
		                            
		                            <!-- 다음블록[▶] -->
		                            <c:if test="${pageCount > endPage}">   
		                                <li class="page-item"><a class="page-link" href="onedayclassBoardList?pageNum=${startPage + pageBlock}"><i class="fa fa-angle-right"></i></a></li>
		                            </c:if>   
	                            </c:if>    
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>



<!-- </div> -->
</section>
<!-- ##### Contact Area End ##### -->

<script>
/* var lists = [];
$("input[name='onedayclassCheck']:checked").each(function(i){   //jQuery로 for문 돌면서 check 된값 배열에 담는다
 lists.push($(this).val());
 alert(lists);
});

jQuery.ajax({type:"POST", 
 data:{'onedayclassCheck':lists},
 url:"~~~~~~~~~~~~~~~~~~~~~~", 
 contentType:"application/x-www-form-urlencoded;charset=utf-8", //한글 깨짐 방지
 cache: false, 
 success:function(data) { 
  
   }
}); */

/* $("input").on("click", function() {
	alert($("input:checked").val());
}); */

/* $("input[name='onedayclassCheck']:checked").each(function(i)) {   //jQuery로 for문 돌면서 check 된값 배열에 담는다
	 lists.push($(this).val());
	 alert(lists);
	}); */
	
/* $("input").on("click", function() {
	$.each(input, function(index, item) {
		alert(index+"번째 요소 : "+item.val());
	});
}); */

/* function checkboxArr() {
	var checkArr = []; //배열 초기화
	$("input[name='onedayclassCheck']:checked").each(function(i)) {
		checkArr.push($(this).val());	// 체크된 것만 val를 뽑아서 배열에 push
	}
	
	$.ajax({
		url:'onedayclassCheck', 
		type:'POST', 
		data: JSON.stringify ({
			checkArr: checkArr
		}),
		headers: {
			'Accept': 'application/json',
			'Content-Type': 'application/json'
		}
	});
} */


</script>




<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->

</body>
</html>