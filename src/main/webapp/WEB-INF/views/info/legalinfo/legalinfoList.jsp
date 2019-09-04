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
<style>
.table th{
	vertical-align:middle !important;
	height:60px;
	font-size:18px;
}
.table td{
	vertical-align:middle !important;
}
@media only screen and (max-width: 800px) {
	
	#legalintitle{
		float:none !important
	}
}
#mounsover{
	cursor: pointer;
}
</style>
<!-- Title -->
<title>PoKor - Foriener &amp; Help HTML Template</title>

<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">
<link rel="stylesheet" href="resources/ehddnr.css">
</head>
<div class="preloader d-flex align-items-center bg-img justify-content-center">
	<div class="preloader-circle"></div>
	<div class="preloader-img">
		<img src="resources/img/core-img/leaf.png" alt="">
	</div>
</div>

<jsp:include page="../../setting/header01.jsp" flush="false" />

<!-- ##### Breadcrumb Area Start ##### -->
<div class="breadcrumb-area">
	<!-- Top Breadcrumb Area -->
	<div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(resources/img/law.png);">
		<h2>Legal Information</h2>
	</div>
</div>
<!-- ##### Breadcrumb Area End ##### -->
<!-- ##### Header Area End ##### -->
<div class="container" align="center" style="margin-bottom: 50px;">

	
	<div class="row">
		<div class="col-12">
			<div class="shop-sorting-data d-flex flex-wrap align-items-center justify-content-between" 
			style="margin:20px 0 0 0;padding-bottom:10px;">
					<button style="margin:3px 0;"type="button" class='btn alazea-btn' onclick="legalin('ALL');">ALL</button>
					<button type="button" class='btn alazea-btn' onclick="legalin('Foreigner');">Foreigner</button>
					<button type="button" class='btn alazea-btn' onclick="legalin('Employment');">Employment</button>
					<button type="button" class='btn alazea-btn' onclick="legalin('life');">life</button>
			</div>
		</div>
	</div>

	<div class="row" style="margin-top: 20px;">
		<!-- 사이드바 -->
		<div class="col-12 col-md-12 col-lg-12">
			<div class="shop-products-area">
				<div class="row">
					<div name="legalindiv"style="width: 100%; margin: 0 0 15px 0; padding: 0 5px;">
						<div id="knowledge_div3" align="center">
							<h4 style="float: left;padding-top:10px;"id="legalintitle" class="knowledgeup">ALL</h4>
							<div class="knowledge_select">
								<input class="knowledge_select2" type="text" maxlength="30" name="search" id="search" placeholder=""> 
								<input class="knowledge_select3" id="SearchButton" type="button" onclick="getlegalinfoJsonData2();" value="SEARCH">
							</div>
						</div>
					</div>
					
					<br>
					<br>
						<br>
					<div class="col-12" style="margin: 0; padding: 0;" id="KnowledgeAjaxStart2">
					
					</div>
				</div>
			</div>

			<!-- 페이지 -->
			
			<nav aria-label="Page navigation" style="margin-top: 30px;" align="center" id="pagestr">
				
			</nav>
		</div>
	</div>	
	
</div>

<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->

</body>
<script src="resources/js/legalinfostate.js"></script>
<script>
function legalin(title){
		var ti = title;
		$('#legalintitle').text(ti);
			getlegalinfoJsonData2();
}
$(function(){
	getlegalinfoJsonData2();
});
</script>
</html>