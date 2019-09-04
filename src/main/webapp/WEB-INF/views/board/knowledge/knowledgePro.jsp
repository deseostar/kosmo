<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<html lang="en">
<body>
<script src="resources/js/jquery/jquery-2.2.4.min.js"></script>

<c:if test="${insertcnt==1}">
<script type="text/javascript">
	window.location="knowledgeBoardList";
</script>
</c:if>
<c:if test="${insertcnt==0}">
<script type="text/javascript">
	alert('Error. Please try again in a few minutes.');
	window.history.back;
</script>
</c:if>

<c:if test="${kCommentCnt==1}">
<script type="text/javascript">
	window.location="knowledgeDetailForm?knowledgeNumber="+${knowledgeNumber};
</script>
</c:if>
<c:if test="${kCommentCnt==0}">
<script type="text/javascript">
	alert('Error. Please try again in a few minutes.');
	window.history.back;
</script>
</c:if>


<c:if test="${knowledgedeletecnt==1}">
<script type="text/javascript">
	alert("You have successfully deleted the question.")
	window.location="knowledgeBoardList?pageNum="+${pageNum}+"&btn_select="+${btn_select};
</script>
</c:if>
<c:if test="${knowledgedeletecnt==0}">
<script type="text/javascript">
	alert('Error. Please try again in a few minutes.');
	window.history.back;
</script>
</c:if>

<c:if test="${kCommentdeletecnt==1}">
<script type="text/javascript">
	alert("You have successfully deleted the comment.")
	window.location="knowledgeDetailForm?knowledgeNumber="+${knowledgeNumber};
</script>
</c:if>
<c:if test="${kCommentdeletecnt==0}">
<script type="text/javascript">
	alert('Error. Please try again in a few minutes.');
	window.history.back;
</script>
</c:if>

<c:if test="${Knowledgeupdatecnt==1}">
<script type="text/javascript">
	alert("Your question has been fixed.")
	window.location="knowledgeBoardList?pageNum="+${pageNum}+"&btn_select="+${btn_select}+"#"+${knowledgeNumber};
</script>
</c:if>
<c:if test="${Knowledgeupdatecnt==0}">
<script type="text/javascript">
	alert('Error. Please try again in a few minutes.');
	window.history.back;
</script>
</c:if>

<c:if test="${kCommentModifycnt==1}">
<script type="text/javascript">
	alert("Your comment has been fixed.")
	window.location="knowledgeDetailForm?knowledgeNumber="+${knowledgeNumber}+"#"+${kCommentNumber};
</script>
</c:if>
<c:if test="${kCommentModifycnt==0}">
<script type="text/javascript">
	alert('Error. Please try again in a few minutes.');
	window.history.back;
</script>
</c:if>

<c:if test="${knowledgeSelectComent==1}">
<script type="text/javascript">
	alert("Has been adopted.")
	window.location="knowledgeBoardList";
</script>
</c:if>
<c:if test="${knowledgeSelectComent==0}">
<script type="text/javascript">
	alert('Error. Please try again in a few minutes.');
	window.history.back;
</script>
</c:if>
</body>
</html>