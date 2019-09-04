<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="resources/js/jquery/jquery-3.3.1.min.js"></script>
<script src="resources/js/request.js"></script>
<script src="resources/js/request2.js"></script>

<!-- <link rel="stylesheet" type="text/css" href="resources/css/demo.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/component.css" /> -->
<link rel="stylesheet" href="resources/min/chat.css">
<html>
<title>Helper - Interaction &amp; Help HTML Template</title>

<head lang="en">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- 채팅 ajax -->
<script>

/* 채팅창 오픈시 글쓰기칸으로 자동 포커싱 */
if (!("autofocus" in document.createElement("input"))) {
    document.getElementById("chattingContent").focus();
  }

/* 글쓰기칸 빈칸으로 만들기 */
function emptychattingContent(){
	$('#chattingContent').val('');
}

/* 채팅창 글뿌리기 */
function chatting() {
		//첫번째 매개변수인 URL 부분은 RestController의 주소부분 - BoardRestController 참고
		if(${sessionScope.userVO != null}){
			$.getJSON("chatting", function(data){
				var come="";
				var str="";
				$(data).each(
					function () {
						var loginId = "${sessionScope.userVO.memberId}";
						this.chattingMemberId
						this.chattingRegdate
							
							if(loginId == this.chattingMemberId){
								str += '<div style="float:right; margin-right:10px;">'+
								'<table class="myTable" style="">'+
									'<tr>'+
										'<td align="left" bgcolor="white" style="border:1px solid #808080; border-radius:5px; word-break:break-all;" >'+'<a>'+ this.chattingContent +'</a>'+
										'</td>'+ 
										'<td align="left" bgcolor="#BEF5BE" style="border:1px solid #63CC63; border-radius:5px;">'+
										'<a >'+ this.chattingMemberId + '(' + this.chattingContry+')'+'</a>'+'<br>'+
										'</td>'+
									'</tr>'+
									'<tr>'+
										'<td>'+
										'</td>'+
										'<td rowspan="2" align="right" bgcolor="#BEF5BE" style="border:1px solid #63CC63; border-radius:5px;">'+
											'<span>'+'<a>'+'('+changeDate(this.chattingRegdate)+')' +'</a>'+'</span>'+
										'</td>'+
									'</tr>'+
								'</table>'+
								'</div>'+'<br>'+'<br>'+'<br>'+'<br>';
							} else {
								str += '<div style="margin-left:10px; margin-bottom:10px;">'+
								'<table class="yourTable" style="">'+
									'<tr>'+
										'<td align="left" bgcolor="#C6FF70" style="border:1px solid #94EB3E;  border-radius:5px;">'+'<a>' +this.chattingMemberId+ '(' + this.chattingContry+')'+'</a>'+'<br>'+
										'</td>'+
										'<td align="left" bgcolor="white" style="border:1px solid #808080; border-radius:5px; word-break:break-all;">'+'<a>'+ this.chattingContent +'</a>'+
										'</td>'+
									'</tr>'+
									'<tr>'+
										'<td align="left" rowspan="2" bgcolor="#C6FF70" style="border:1px solid #94EB3E; border-radius:5px;">'+
										'<span>'+'<a>'+
										'('+changeDate(this.chattingRegdate)+')'+'</a>'+'</span>'+
										'</td>'+
										'<td>'+'<br>'+
										'</td>'+
									'</tr>'+
								'</table>'+
								'</div>'+'<br>';
							}
							
						}
				);
				$('#chattingList').html(str);
				chattingScroll();/* 스크롤 맨 아래로 */
			}); }
	}
	
/* 엔터키로 글 입력 */
function enterKey(){
    if (window.event.keyCode == 13) {
   	 // 엔터키가 눌렸을 때 실행할 내용
   	 chattingScroll();
   	 document.getElementById('chattingWrite').click();
   }
}

/* 글쓴 시간 형식 바꾸기 */
function changeDate(date){
    date = new Date(parseInt(date));
    year = date.getFullYear();
    month = date.getMonth();
    day = date.getDate(); 
    hour = date.getHours();
    minute = date.getMinutes();
    second = date.getSeconds();
    strDate =year+"-"+month+"-"+day+"&nbsp;&nbsp;&nbsp;"+hour+":"+minute+":"+second;
    return strDate;
}

chatting();
/* 정해진 시간마다 자동 새로고침 */
setInterval("chatting();", 6000);//원래 2000, 개발중  60000, 시연때 2000

/* 채팅창 오픈시 스크롤 맨밑으로 이동 */
function chattingScroll(){
	$('#chattingView')[0].scrollIntoView(false);
	
}
/* 채팅창 오픈시 스크롤 맨밑으로 이동 */
$("#chattingView").load(function(){ chattingScroll(); });

</script>

<meta charset="UTF-8">
<title>Chatting</title>
</head>

<body onload="chatting();" style="">
<div id="chattingView" class="chattingView">
		
		<div id="chattingList" class="chattingList">
			strDate
		<br>
		</div>
	



	<div id="content" align="left"style="position: relative; background-color:#E0F8E0; margin-top:10px; border:3px solid silver;">
		<br>
		<div align="center"  id="realWrite">
		<input type="text" id="chattingContent" maxlength="300"
			style="width: 65%; height: 7%; padding: 5px 5px; margin-bottom:20px;" onkeyup="enterKey();"
			name="chattingContent" autofocus="autofocus"> &nbsp;&nbsp;
			
		<input type="button" id="chattingWrite" class="btn alazea-btn mr-30"
			value="Enter" style="padding: 1px;">
	</div>
	</div>
	</div>
</body>

<script>

/* 글 입력시 */
$("#chattingWrite").on("click", function(){
	var chattingContent = $('#chattingContent').val();
	$.ajax({
		type:'POST',
		url:'chattingContent',
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"POST"
		},
		dataType:"JSON",
		data:JSON.stringify({chattingContent:chattingContent}), 
		success:function(result){
				chatting();	//자료 등록 성공하였으니 새롭게 자료를 요청 부분 실행하여 리스트 갱신
				emptychattingContent();//댓글 입력창 초기화
			},
		error:function(result){
			chatting();	//자료 등록 성공하였으니 새롭게 자료를 요청 부분 실행하여 리스트 갱신
			alert('error!');	
			emptychattingContent();//댓글 입력창 초기화
		}
		
	});
});


</script>
</html>