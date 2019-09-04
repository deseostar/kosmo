<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SEARCH LIST</title>
<link rel="stylesheet" href="resources/style.css">
<link rel="stylesheet" href="resources/ehddnr.css">
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
			style="background-image: url(resources/img/member/admin.png);">
			<h2>SEARCH LIST</h2>
		</div>
	</div>
	<!-- ##### Breadcrumb Area End ##### -->
	
	<br>
	<br>

	
	<div class="container">
		<form name=memberSearchForm action="memberSearch" method="post" style="min-width: 350px; display: inline-block;">
			<div class="knowledge_select">
				<input class=knowledge_select2 type="text" maxlength="30"
						name="search" id="search" placeholder="input keyword">
				<input class="knowledge_select3" id="SearchButton" type="submit" value="SEARCH">
			</div>
		</form>
		<hr>
		<div class="row">
			<c:forEach var="uvo" items="${uvos}">
				<div class="col-xs-12 col-sm-12 col-md-6">
	            <div class="well well-sm card" style="border-color: #70c745 !important;margin:5px !important;">
	                <div class="row">
	                    <div class="col-sm-6 col-md-4">
	                        <img src="resources/img/member/noimage.jpg" alt="" class="img-rounded img-responsive" />
	                    </div>
	                    <div class="col-sm-6 col-md-8">
	                        <h4>${uvo.memberId}</h4>
	                        <small><cite title="${uvo.memberCountry}">${uvo.memberCountry}<i class="glyphicon glyphicon-map-marker">
	                        </i></cite></small>
	                        <p>
	                            <i class="glyphicon glyphicon-envelope"></i>Email : ${uvo.memberEmail}
	                            <br/>
	                            <i class="glyphicon glyphicon-globe"></i>Point : ${uvo.memberPoint} 
	                            <br />
	                            <i class="glyphicon glyphicon-gift"></i>Regdate : <fmt:formatDate pattern="yyyy-MM-dd" value="${uvo.memberRegdate}"/></p>
	                        <!-- Split button -->
	                        <div class="btn-group" style="float: right">
	                            <button type="button" class="btn btn-warning btn-sm">Disqualify</button>
	                            <button type="button" class="btn btn-sm" style="background-color: #70c745!important; color:white">Message</button>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
			</c:forEach>
		</div>


		<nav aria-label="Page navigation" style="margin-top: 30px;"align="center">
			<ul class="pagination" align="center" style="margin: auto auto;">
				<c:if test="${cnt>0}">
				
					<c:if test="${startPage > pageBlock }">
						<li class="page-item"><a class="page-link"
							href="hostMemberList"><i
								class="fa fa-angle-left"></i><i class="fa fa-angle-left"></i></a></li>
						<li class="page-item"><a class="page-link"
							href="hostMemberList?pageNum=${startPage-pageBlock}"><i
								class="fa fa-angle-left"></i></a></li>
					</c:if>

					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}">
							<li class="page-item"><a class="page-link"
								style="background-color: #28a745 !important; color: white !important">${i}</a></li>
						</c:if>
						<c:if test="${i!=currentPage}">
							<li class="page-item"><a class="page-link"
								href="hostMemberList?pageNum=${i}">${i}</a></li>
						</c:if>
					</c:forEach>

					<c:if test="${pageCount > endPage }">
						<li class="page-item"><a class="page-link"
							href="hostMemberList?pageNum=${startPage + pageBlock}"><i
								class="fa fa-angle-right"></i></a></li>
						<li class="page-item"><a class="page-link"
							href="hostMemberList?pageNum=${pageCount}"><i
								class="fa fa-angle-right"></i><i class="fa fa-angle-right"></i></a></li>
					</c:if>
				</c:if>
			</ul>
		</nav>
	<hr>
	
	<br>

	<div class="search_by_terms" align="center">
		<button type="button" class="btn alazea-btn" onclick="window.location.href='hostMemberList'">BACK</button>
	</div>

	<br>
	<br>
	<br>
	</div>
	<%@ include file="../setting/footer01.jsp"%>
</body>
</html>