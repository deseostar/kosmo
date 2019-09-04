<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="images" value="/kosmo/resources/img/board/onedayclass/" />
	<!-- jQuery-2.2.4 js -->
	<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<style>
.oComment {
border:solid 2px #70c745;
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


<table class="oComment">
	<tr>
		<td>${vo.oCommentNumber}</td>
		<td>${vo.memberId}</td>
		<td>${vo.oCommentRegdate}</td>
		<td><input class="input" class='btn alazea-Mine' type="text" id="oCommentContent" maxlength="50" value="${vo.oCommentContent}"></td>
		<td>
			<c:if test="${userVO.memberId == vo.memberId}">
				<input type="button" class='btn alazea-Mine' value="confirm" onclick="oCommentFunction()">
			</c:if>
		</td>
	</tr>	
</table>

<script type="text/javascript">
function oCommentFunction() {
	var oCommentNumber = "${vo.oCommentNumber}";
	var oCommentContent = $('#oCommentContent').val();

	$.ajax({
		type : "PUT",
		url: "updateComment",
		data: JSON.stringify({
			oCommentNumber: oCommentNumber,
			oCommentContent: oCommentContent
		}),
		headers: {
			'Accept': 'application/json',
			'Content-Type': 'application/json'
		},
		success: function(result) {
			if(result == 1) {
				alert('The transfer was successful.');
				window.opener.getoCommentList();
				window.self.close();
			} else if(result == 0) {
				alert('Please enter the exact content.');
			} else {
				alert('A database error has occurred.');
			}
		}
	});
}
</script>
<%-- <input type="hidden" name="onedayclassNumber" value="${dto.onedayclassNumber}"> --%>
</body>
</html>