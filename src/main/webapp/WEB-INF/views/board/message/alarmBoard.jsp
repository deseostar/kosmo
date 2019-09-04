<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="resources/js/jquery/jquery-3.3.1.min.js"></script>
<script src="resources/js/request.js"></script>
<script src="resources/js/request2.js"></script>
<style>
	.login{
		margin-top:8px;
	}
		button:hover{
	cursor: pointer !important;
	}
</style>
<html>
<title>Helper - Interaction &amp; Help HTML Template</title>

<head lang="en">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />


<link rel="stylesheet" type="text/css" href="resources/css/demo.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/component.css" />
<meta charset="UTF-8">
<meta name="description" content="" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="stylesheet" href="resources/style.css">
<!--[if IE]>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]--!>


<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->

<style type="text/css">


</style>
</head>
<body>

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
			style="background-image: url(resources/img/min/JumBomessage.jpeg);">
			<h2>Interaction</h2>
		</div>
	</div>
	<div class="container" id="container">
		<!-- id="container" -->
		<div class="row">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
					</ol>
				</nav>
			</div>
		</div>

		<div id="tabs" class="tabs">
			<nav>
				<ul class="tab">
					<li><a href="#section-1"><span>Comment</span></a></li>
					<li><a href="#section-2"><span>RcvMsg</span></a></li>
					<li><a href="#section-3"><span>Message</span></a></li>
					<li><a href="#section-4"><span>SendMsg</span></a></li>
					<li><a href="#section-5"><span>Chatting</span></a></li>
				</ul>
			</nav>
			<div class="content">
				<!-- id="content" -->
				<section id="section-1" style="width: 100%;">
					<div class="mediabox1" style="width: 100%;">
						<table class="table table-hover"> <!-- style="width: 335%;" -->
							<!-- style="width: 100%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;" -->
							<tr>
								<th>Sender</th>
								<th>Contents</th>
								<th>Sending time</th>
								<th>Delete</th>
							</tr>
							<c:forEach var="cos" items="${cos}">
								<c:if
									test="${sessionScope.userVO.memberEmail.equals(cos.memberemail)}">
									<tr>
										<td>${cos.memberid}</td>
										<!-- align="center" -->

										<c:set var="code" value="${cos.boardcode}" />
										<c:choose>
											<c:when test="${code==10}">
												<%-- <c:set var="url" value="${}"/> --%>
												<td><a
													href="knowledgeDetailForm?knowledgeNumber=${cos.commentoriginalnumber}#${cos.commentcommentnumber}"><nobr>${cos.memberid}wrote a comment.</nobr> </a></td>
											</c:when>
										</c:choose>

										<c:choose>
											<c:when test="${code==20}">
												<td><a
													href="realestateDetailForm?realestateNumber=${cos.commentoriginalnumber}#${cos.commentcommentnumber}">${cos.commentsubject}</a></td>
											</c:when>
										</c:choose>

										<c:choose>
											<c:when test="${code==31}">
												<td><a
													href="onedayclassDetailForm?onedayclassNumber=${cos.commentoriginalnumber}#${cos.commentcommentnumber}">${cos.commentsubject}</a></td>
											</c:when>
										</c:choose>

										<c:choose>
											<c:when test="${code==69}">
												<td><a href="weather?type=earthquake">${cos.commentsubject}</a></td>
											</c:when>
										</c:choose>

										<td>${cos.commentregdate}</td>
										<td><input type="button" class="btn btn-sm btn-success mr-10"
											width="100" height="50" value="delete"
											onclick="window.location='commentAlarmDelete?commentnumber=${cos.commentnumber}&pageNum=${pageNum}';"></td>
									</tr>
								</c:if>
							</c:forEach>
						</table>

					</div>
				</section>
				<section id="section-2"  style="width: 100%;">
					<div class="mediabox2" style="width: 100%;">

						<table class="table table-hover" style="width: 100%; table-layout:fixed;"><!-- style="width: 100%;" -->
							<!-- style="width: 100%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;" -->
							<tr>
								<th>Sender</th>
								<th>Contents</th>
								<th>Sending time</th>
								<th>Reply message</th> 
								<th>Delete</th>
							</tr>
							<c:forEach var="mos" items="${mos}">
								<c:if
									test="${sessionScope.userVO.memberId.equals(mos.messageSendId)}">
									<tr>
										<td id="messageFromIdR">${mos.messageFromId}</td>
										<!-- align="center" -->

										<td style="text-overflow:ellipsis; overflow:hidden;">
										<a id="messageContentR"
											onclick="recieveMessage('${mos.messageFromId}','${mos.messageContent}','${mos.messageRegdate}');">
												<nobr>${mos.messageContent}</nobr></a></td>

										<td id="messageRegdateR" >${mos.messageRegdate}</td><!-- style="text-overflow:ellipsis; overflow:hidden;" -->

										<td><input type="button" id="reply"
											class="btn btn-sm btn-success mr-30" value="reply"
											onclick="reply('${mos.messageFromId}');"> <!-- <a href="#section-3" class="btn btn-success mr-30"><span>reply</span></a> -->
										</td>
										<td><input type="button" class="btn btn-sm btn-success mr-30"
											value="delete"
											onclick="window.location='messageDelete?messageNumber=${mos.messageNumber}&pageNum=${pageNum}';"></td>
									</tr>
								</c:if>
		
								<div id="id02" class="w3-modal" >
									<div class="w3-modal-content">
										<div class="w3-container">
											<form action="messageSend" method="post">
												<input type="hidden" id="hiddenId" name="hiddenId" >
												
													Message receiving ID :&nbsp;
													<p id="messageSendId">
												 <!-- style="width:10%" -->

												<hr>
												<b>CONTENT</b> <br> <br>
												<textarea class="content" name="messageContent2"
													id="messageContent2" maxlength="600"
													></textarea><!-- style="width:100%; height:10%; padding: 5px 5px;" -->
												<hr>
												<p>
													<span
														onclick="document.getElementById('id02').style.display='none'"
														class="btn btn-sm btn-success mr-30" value="close">close</span>
													&nbsp; &nbsp; <input type="submit"
														class="btn btn-sm btn-success mr-30" value="reply"
														name="sendMessage">
												</p>
											</form>
										</div>
									</div>
								</div>

							</c:forEach>
						</table>
					</div>
				</section>
				<section id="section-3" align="center">
					<b>Message receiving ID</b> &nbsp; <input type="text"
						name="messageSendIdF" id="messageSendIdF"
						style="padding: 1px; border: 1px solid #333;"> <br> <br>
					<b>CONTENT</b> <br> <br>
					
					<textarea class="content" name="messageContent1"
						id="messageContent1" maxlength="600"
						style="width: 80%; height: 20%; padding: 5px 5px;"></textarea>
					<br> <br> <input type="button"
						class="btn alazea-btn mr-30" value="send message"
						style="padding: 1px;" onclick="sendMessage();">

				</section>
				<section id="section-4" style="width: 100%;">
					<div class="mediabox4" style="width: 100%;  table-layout:fixed;">
						<table class="table table-hover" style="width: 100%;  table-layout:fixed;"><!-- style="width: 335%;" -->
							<!-- style="width: 100%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;" -->
							<tr>
								<th>Receiver</th>
								<th>Contents</th>
								<th>Sending time</th>
								<th>Delete</th>
							</tr>
							<c:forEach var="sml" items="${sml}">

								<c:if
									test="${sessionScope.userVO.memberId eq sml.fMessageFromid}">
									<tr>
										<td>${sml.fMessageSendid}</td>

										<td style="text-overflow:ellipsis; overflow:hidden;"><a onclick="sendingMessage('${sml.fMessageSendid}','${sml.fMessageContent}','${sml.fMessageRegdate}');" ><nobr>${sml.fMessageContent}</nobr>
										</a></td>
												
										<td>${sml.fMessageRegdate}</td>
										<td><input type="button" class="btn btn-sm btn-success mr-30"
											value="delete"
											onclick="window.location='fMessageDelete?fMessageNumber=${sml.fMessageNumber}&pageNum=${pageNum}';"></td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</div>
				</section>
				<section id="section-5" align="center">
					In this chat room, there are people of the same nationality as you.<br>
					If you are lonely or have difficulty with perfume, <br> try to
					strengthen friendship and comfort here.<br>
					<br> <input type="button" class="btn alazea-btn mr-30"
						value="My Contry" style="padding: 1px;" onclick="chatting();">
					<br>
					<br>
					<hr>
					<br> In this chat room, there are all foreigners who use this
					site.<br> It's a pleasant room that's spoken in each other's
					language. <br>
					<br> <input type="button" class="btn alazea-btn mr-30"
						value="World" style="padding: 1px;" onclick="chattingAll();">
				</section>
			</div>
			<!-- /content -->
		</div>
		<!-- /tabs -->

	</div>
	<!-- /container -->

	<div id="id01" class="w3-modal">
		<div class="w3-modal-content">
			<div class="w3-container">
			

				sender :
				<p id="msgfromId"></p>
				<hr>
				content :
				<p id="msgContent"></p>
				<hr>
				sent date :
				<p id="msgRegdate"></p>
				<p>
					<span
						onclick="document.getElementById('id01').style.display='none'"
						class="btn btn-success mr-30" value="close">close</span> &nbsp;
					<!-- &nbsp; <input type="button" id="reply"
						class="btn btn-success mr-30" value="reply" onclick="reply('');"> -->
				</p>
			</div>
		</div>
	</div>

	
	<div id="id03" class="w3-modal">
		<div class="w3-modal-content">
			<div class="w3-container">
			

				reciever :
				<p id="msgSendId"></p>
				<hr>
				content :
				<p id="msgSendContent"></p>
				<hr>
				sent date :
				<p id="msgSendRegdate"></p>
				<p>
					<span
						onclick="document.getElementById('id03').style.display='none'"
						class="btn btn-success mr-30" value="close">close</span> &nbsp;
					<!-- &nbsp; <input type="button" id="reply"
						class="btn btn-success mr-30" value="reply" onclick="reply('');"> -->
				</p>
			</div>
		</div>
	</div>


</body>
<jsp:include page="../../setting/footer01.jsp" flush="false" />
<script src="resources/js/cbpFWTabs.js"></script>
<script>
	new CBPFWTabs(document.getElementById('tabs'));

	// 메세지 보내기 값
	function sendMessage() {
		var messageSendIdF = $("#messageSendIdF").val();
		var messageContent1 = $("#messageContent1").val();
		var messageContent2 = $("#messageContent2").val();

		window.location = 'messageSend?messageSendIdF=' + messageSendIdF
				+ '&messageContent1=' + messageContent1 + '&messageContent2='
				+ messageContent2;
	}

	//받은 메세지 상세보기 팝업창
	function recieveMessage(id, content, regdate) {
		
		$('#msgfromId').html(id)
		document.getElementById('id01').style.display = 'block';

		$('#msgContent').html(content)
		document.getElementById('id01').style.display = 'block';

		$('#msgRegdate').html(regdate)
		document.getElementById('id01').style.display = 'block';

	}

	//메세지 답장하기
	function reply(id) {
		$('#hiddenId').val(id);
		
		$('#messageSendId').html(id)
		document.getElementById('id02').style.display = 'block';

		$('#messageContent').html()
		document.getElementById('id02').style.display = 'block';

		$('#msgfromId').html(id)
		document.getElementById('id01').style.display = 'none';

		$('#msgContent').html(content)
		document.getElementById('id01').style.display = 'none';

		$('#msgRegdate').html(regdate)
		document.getElementById('id01').style.display = 'none';
	}
	
	//수신 메세지 상세보기 팝업창
	function sendingMessage(sid, scontent, sregdate) {
		
		$('#msgSendId').html(sid)
		document.getElementById('id03').style.display = 'block';

		$('#msgSendContent').html(scontent)
		document.getElementById('id03').style.display = 'block';

		$('#msgSendRegdate').html(sregdate)
		document.getElementById('id03').style.display = 'block';

	}

	//국가 채팅 창 open
	function chatting() {
		var url = "chattingstart";
		window.open(url, "chatting", "menubar=yes, width=600%, height=600%");/*  */
	}

	// 세계 채팅 창 open
	function chattingAll() {
		var url = "chattingWorld";
		window.open(url, "chattingAll", "menubar=yes, width=600%, height=600%");
	}
</script>

</html>