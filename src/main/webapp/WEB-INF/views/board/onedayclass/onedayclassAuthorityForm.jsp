<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
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

<script type="text/javascript">

	function onlyNumber(event){
		
		event = event || window.event;
		
		var keyID = (event.which) ? event.which : event.keyCode;
		
		if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			return false;
	}
	
	function removeChar(event) {
		
		event = event || window.event;
		
		var keyID = (event.which) ? event.which : event.keyCode;
		
		if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}

	function writeChk() {
		
		if (!document.authForm.i.value) {
			alert("Must be write your account number");
			document.authForm.i.focus();
			return false;
		}
	}
</script>


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


<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg .tg-h6ay{background-color:#f9f9f9;border-color:inherit;text-align:left}
.tg .tg-xldj{border-color:inherit;text-align:left}
</style>

<form action="onedayclassAuthorityPro" method="post" name="authForm" onsubmit="return writeChk();">
<table class="tg" style="margin-left: auto; margin-right: auto;">
  <tr>
    <th class="tg-xldj" colspan="5" text-align="center">
    	<h2>Applying for a Onedayclass</h2>
    </th>
  </tr>
  <tr>
    <td class="tg-xldj" colspan="5">
    	You can open a class freely by applying for the privilege of opening one class and entering the account number.
    </td>
  </tr>
  <tr>
    <td class="tg-xldj">
		Authorization application terms
    </td>
    <td class="tg-h6ay" colspan="4">
    
    	<div style="font-size: 12px; display: block; padding:10px; border: solid 1px rgba(218,222,225,0.7); 
    	height: 400px; overflow: auto; font-family: nanum gothic !important; margin-bottom: 5px; width: 100;">
    	
			Chapter 1: General Provisions<br>
			Article 1 [Purpose)<br>
			These Terms and Conditions are for the purpose of defining <br>
			the conditions of use of the services provided by Pocket Korea, Day of Class, <br>
			and other necessary matters such as the reason for the procedure.<br>
			Article 2 (Effect and Change of Terms)<br>
			1. The terms of this Agreement shall be effective upon posting <br>
			on the Service screen or otherwise notifying the Member.<br>
			2. The Company may change these Terms if there are reasonable grounds to be changed. <br>
			If the Terms are changed, the Company shall announce at least seven days in advance<br> 
			in the same manner as Paragraph 1 above.<br>
			3. If new services are opened on this site, <br>
			they will be provided according to these terms unless otherwise stated.<br>
			Article 3 (Outside Terms and Conditions)<br>
			1. There is no liability of the company for any kind of money accidents that occur in this class.<br>
			2. Other lawsuits and various incidents that occur in class one day.<br>
			Article 4 (Other Matters)<br>
			If you do not agree with the terms of service above, please cancel your authorization immediately.<br>
		</div>
    
    </td>
  </tr>
	<tr>
		<td class="tg-xldj">How to write QR code when opening a class<br> : Example sequence </td>
		<td class="tg-h6ay">
			<h4>Open the KakaoTalk</h4>
		</td>
		<td class="tg-h6ay">
			<img src="resources/img/board/onedayclass/ex1.png" style="width: 250px">
		</td>
		<td class="tg-h6ay">
			<img src="resources/img/board/onedayclass/ex2.png" style="width: 250px">
		</td>
		<td class="tg-h6ay">
			<h4>Save and </h4> <br>
			<h4>Attached when opening</h4>
		</td>
	</tr>

     	<!-- <input class="text"  style="width : 500px" type="text" name="i" maxlength="100" placeholder="숫자만 입력해주세요"
    		onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'> -->
    		
   <br>		
   <br>
  <tr>
    <td class="tg-xldj"></td>
    <td class="tg-xldj"></td>
    <td class="tg-h6ay">
    	<input class="btn alazea-btn mt-15" type="submit" value="submit">
    </td>
    <td class="tg-xldj">
    	<input class="btn alazea-btn mt-15" type="reset" value="cancle" onclick="window.history.back();">
	</td>
    <td class="tg-h6ay"></td>
  </tr>
  <br>
  <br>
</table>
</form>


<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->

</body>
</html>