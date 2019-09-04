<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.spring.helper.vo.BoardVO.KnowledgeVO"%>
<%@ page import="java.util.Map" %>
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

<title>PoKor - Knowledge</title>

<link rel="stylesheet" href="resources/ehddnr.css">
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
		style="background-image: url(resources/img/know.png);">
		<h2>KNOWLEDGE</h2>
	</div>
</div>
<!-- ##### Breadcrumb Area End ##### -->
<!-- ##### Header Area End ##### -->
<div class="container" align="center" style="margin-bottom: 50px;">

	
	<c:if test="${userVO.memberId != null}">
	<input type="hidden" id="loginId" value="${userVO.memberId}">
	</c:if>
	<c:if test="${userVO.memberId == null}">
	<input type="hidden" id="loginId" value="1">
	</c:if>
	<%
		String btn_select = (String) request.getAttribute("btn_select");
		if(btn_select == null){
			btn_select="10";
		}
		String knowledgeCategory = (String) request.getAttribute("knowledgeCategory");
	%>
	<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
	<script type="text/javascript">


</script>
	<input type="hidden" name="selectchk" value="left" id="selectchk">
	<input type="hidden" name="pageNum" value="1" id="pageNum">

	<div class="row">
		<div class="col-12">
			<div class="shop-sorting-data d-flex flex-wrap align-items-center justify-content-between" 
			style="border-bottom: 0.5px solid #70c745 !important;margin:20px 0 0 0;padding-bottom:10px;">
					<!-- 이부분 바꿔야함  -->
					<div align="center"style="margin-top:20px;font-size:30px;font-weight:bold;color:black;"id="ehddnr_1" class="cursorCustom knowledge_div2" onclick="ehddnr_select1()">
					QUESTIONS THAT NEED ANSWERS
					</div>
					<div style="margin-top:20px;font-size:30px;color:black;"id="ehddnr_2"class="cursorCustom knowledge_div2" align="center" onclick="ehddnr_select2()">
					ANSWER COMPLETED QUESTION
					</div>
			</div>
		</div>
	</div>
	
	<div class="row" style="margin-top: 30px;">
		<!-- 사이드바 -->
		
		<div class="col-12 col-md-3 col-lg-2" >
			<div class="shop-sidebar-area">
				<div class="ehddnrcatagory shop-widget catagory mb-50" align="left">
					<h4 class="widget-title" style="font-size:30px;font-weight:bold;padding:5px;">Categories</h4>
					<h6 class="widget-title" >
						<a id="All" class="knowledgeCategoryAteg cursorCustom"
							onclick="getknowledgelist('All');">All</a>
					</h6>
					<h6 class="widget-title">
						<a id="Education" class="knowledgeCategoryAteg cursorCustom"
							onclick="getknowledgelist('Education');">Education</a>
					</h6>
					<h6 class="widget-title">
						<a id="Computer"class="knowledgeCategoryAteg cursorCustom"
							onclick="getknowledgelist('Computer');">Computer</a>
					</h6>
					<h6 class="widget-title">
						<a id="Game" class="knowledgeCategoryAteg cursorCustom"
						onclick="getknowledgelist('Game');">Game</a>
					</h6>
					<h6 class="widget-title">
						<a id="entertainment"class="knowledgeCategoryAteg cursorCustom"
							onclick="getknowledgelist('Entertainment');">Entertainment</a>
					</h6>
					<h6 class="widget-title">
						<a id="life" class="knowledgeCategoryAteg cursorCustom"
						onclick="getknowledgelist('life');">Life</a>
					</h6>
					<h6 class="widget-title">
						<a id="Health" class="knowledgeCategoryAteg cursorCustom"
						onclick="getknowledgelist('Health');">Health</a>
					</h6>
					<h6 class="widget-title">
						<a id="society"class="knowledgeCategoryAteg cursorCustom"
							onclick="getknowledgelist('Society');">Society</a>
					</h6>
					<h6 class="widget-title">
						<a id="travel" class="knowledgeCategoryAteg cursorCustom"
						onclick="getknowledgelist('Travel');">Travel</a>
					</h6>
					<h6 class="widget-title">
						<a id="sports" class="knowledgeCategoryAteg cursorCustom"
						onclick="getknowledgelist('Sports');">Sports</a>
					</h6>
					<h6 class="widget-title">
						<a id="Shopping"class="knowledgeCategoryAteg cursorCustom"
							onclick="getknowledgelist('Shopping');">Shopping</a>
					</h6>
					<h6 class="widget-title">
						<a id="Question"class="knowledgeCategoryAteg cursorCustom"
							onclick="getknowledgelist('Worry');">Worry</a>
					</h6>
				</div>
			</div>
		</div>
		
		<div class="col-12 col-md-9 col-lg-10" >
			
			<div class="shop-products-area" >
				<div id="paddingdiv" class="row" style="border-left:1px solid #70c745 !important;padding-left:20px;">
					<div name="ehddnrform"
						style="width: 100%; margin: 0 0 15px 0; padding: 0 5px;">
						<div id="knowledge_div3">
							<h4 style="padding:5px;float:left;font-size:30px;font-weight:bold;" id="titlecatagory" class="ehddnrcatagory knowledgeup" >All</h4>
							<div class="knowledge_select ">
								<input class=knowledge_select2 type="text" maxlength="30" name="search" id="search" style="font-weight:bold;"> 
								<input class="knowledge_select3 cursorCustom" id="SearchButton" type="button" style="font-weight:bold;"onclick="knowledgeBoardListsearch();" value="SEARCH">
							</div>
						</div>
						<div style="margin: 15px 0;"class="search_by_terms">
							<span style="float: left"><select class="btn_select custom-select d-block w-100"
								name="btn_select" id="btn_select">
									<option value="10" selected>10 Views</option>
									<option value="20">20 Views</option>
									<option value="30">30 Views</option>
									<option value="40">40 Views</option>
									<option value="50">50 Views</option>
							</select></span>
								<div class='search_by_terms' style="float:right;">
								<button style="padding:0 15px 0 5px !important;"type="button" class='btn alazea-btn' onclick="knowledgeWriteForm();"><img src="resources/img/연필.png" style="width:35px;height:35px;">QUESTION WRITE</button>
								</div>
						</div>
					</div>
					
					<div class="col-12" style="margin: 0; padding: 0;" id="KnowledgeAjaxStart">
						
					</div>
				</div>
			</div>

			<!-- 페이지 -->
			<div class="shop-products-area">
			<nav aria-label="Page navigation" style="margin-top: 30px;" align="center" style="margin:auto;" id="pagestr">
				
			</nav>
			</div>
		</div>
		
	</div>
	
</div>

<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->
<script src="resources/js/knowledgestate.js"></script>
<script>
$(function(){
	getknowledgelistJsonData();
});
function getknowledgelist(catagory){
	var text1 = catagory;
	$('#titlecatagory').text(text1);
	$(function(){
		getknowledgelistJsonData();
	});
}
$(function (){ 
	$('#btn_select').change(function(){
		$(function(){
			getknowledgelistJsonData();
		});
	});
	
});
function knowledgeBoardListsearch(){
	getknowledgelistJsonData();
	$('#search').val(null);
}
function ehddnr_select1(){
	$('#ehddnr_1').css('font-weight','bold');
	var test1 = document.getElementById("ehddnr_2");
	test1.style.removeProperty("font-weight");
	
	$('#selectchk').val('left');
	getknowledgelistJsonData();
}
function ehddnr_select2(){
	$('#ehddnr_2').css('font-weight','bold');
	var test1 = document.getElementById("ehddnr_1");
	test1.style.removeProperty("font-weight");
	 
	$('#selectchk').val('right');
	getknowledgelistJsonData();
	
}	
</script>
</body>

</html>