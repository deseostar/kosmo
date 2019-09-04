<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="resources/js/jquery/jquery-3.3.1.min.js"></script>
<script src="resources/js/request.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="resources/min/chat.css">
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<html>
<title>Helper - Interaction &amp; Help HTML Template</title>

<head lang="en">
<style>

</style>
<!--세계 채팅 ajax -->
<script>

/* 채팅창 오픈시 글쓰기칸으로 자동 포커싱 */
if (!("autofocus" in document.createElement("input"))) {
    document.getElementById("chattingWriteAll").focus();
  }

/* 글쓰기칸 초기화 */
function emptychattingAllContent(){
	$('#chattingAllContent').val('');
}


/* 채팅창 글뿌리기 */
function chattingAll() {
		//첫번째 매개변수인 URL 부분은 RestController의 주소부분 - BoardRestController 참고
		if(${sessionScope.userVO != null}){
			$.getJSON("chattingAll", function(data){
				var come="";
				var str="";
				$(data).each(
					function () {
						var loginId = "${sessionScope.userVO.memberId}";
						this.chattingAllMemberId
						
						
						if(loginId == this.chattingAllMemberId){
							str += '<div style="float:right; margin-right:10px;">'+
							'<table class="myTable" style="word-break:break-all;">'+
							'<tr>'+
								'<td align="left" bgcolor="white" style="border:1px solid #808080; border-radius:5px;" >'+
								'<a>'+ this.chattingAllContent +'</a>'+ 
								'</td>'+ 
								'<td align="left" bgcolor="#BEF5BE" style="word-break:break-all; border:1px solid #63CC63; border-radius:5px;">'+
								'<a>'+ this.chattingAllMemberId + '(' + this.chattingAllContry+')'+'</a>'+'<br>'+
								'</td>'+
							'</tr>'+
							'<tr>'+
								'<td>'+
								'</td>'+
								'<td rowspan="2" align="right" bgcolor="#BEF5BE" style="border:1px solid #63CC63; border-radius:5px;">'+
									'<span>'+'<a>'+'('+changeDate(this.chattingAllRegdate)+')' +'</a>'+'</span>'+
								'</td>'+
							'</tr>'+
						'</table>'+
						'</div>'+'<br>'+'<br>'+'<br>'+'<br>';
					} else {
						str += '<div style="margin-left:10px; margin-bottom:10px;">'+
						'<table class="yourTable" style="">'+
							'<tr>'+
								'<td align="left" bgcolor="#C6FF70" style="border:1px solid #94EB3E;  border-radius:5px;">'+
								'<a>' +this.chattingAllMemberId+ '(' + this.chattingAllContry+')'+'</a>'+'<br>'+
								'</td>'+
								'<td align="left" bgcolor="white" style="border:1px solid #808080; border-radius:5px; word-break:break-all;">'+'<a>'+ this.chattingAllContent +'</a>'+
								'</td>'+
							'</tr>'+
							'<tr>'+
								'<td align="left" rowspan="2" bgcolor="#C6FF70" style="border:1px solid #94EB3E; border-radius:5px;">'+
								'<span>'+'<a>'+
								'('+changeDate(this.chattingAllRegdate)+')'+'</a>'+'</span>'+
								'</td>'+
								'<td>'+'<br>'+
								'</td>'+
							'</tr>'+
						'</table>'+
						'</div>'+'<br>';
						}
						
					}		
				);
				$('#chattingAllList').html(str); 
				chattingScroll();/* 채팅글 맨아래로... */
			}); }
	}
	

// 채팅 글쓴시간 뿌리기
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
chattingAll();

setInterval("chattingAll();", 6000);//원래 2000, 개발중  60000, 시연때 2000

// 엔터키 입력 활성화
function enterKey(){
    if (window.event.keyCode == 13) {
   	 // 엔터키가 눌렸을 때 실행할 내용
   	 document.getElementById('chattingWriteAll').click();
   }
}


function chattingScroll(){
	$('#chattingAllView')[0].scrollIntoView(false);
}



</script>
<meta charset="UTF-8">
<title>ChattingAll</title>
</head>
<!-- bgcolor="#E0F8E0" -->
<body onload="chattingAll();"  style="margin:0 0 0 0">
	<div id="chattingAllView" class="chattingAllView">
	
		<div id="chattingAllList">strDate</div>
		<br>
	
<div align="center" id="write" style=" positon:fixed; background-color:#E0F8E0; margin-top:10px; border:3px solid silver;"">
<br>
	
	<!-- <form action="chattingWrite" method="POST" onsubmit="chttingWrite();"> -->
	
	<input type="text" id="chattingAllContent" maxlength="300"
		style="width: 65%; height: 7%;"
		name="chattingAllContent" autofocus="autofocus" onkeyup="enterKey();"> <br><br> 
		
	<input type="button"
		id="chattingWriteAll" class="btn alazea-btn mr-30" value="Enter"
		style="padding: 1px;">
		&nbsp;
	<input type="button"
		id="chattingWriteAll" class="btn alazea-btn mr-30" value="Exit"
		style="padding: 1px;" onClick="window.close();">
	
	<!-- Top Header Content -->
	<div class="top-header-meta d-flex" style="margin:5px 5px 5px 5px;">
		<!-- Language Dropdown -->
		
		<div id="google_translate_element"></div>
		<script type="text/javascript">
			
			function googleTranslateElementInit() {
			  new google.translate.TranslateElement({pageLanguage: 'en', 
				  includedLanguages: 'ar,en,es,jv,ko,pa,pt,ru,zh-CN', 
				  layout: google.translate.TranslateElement.InlineLayout.SIMPLE, 
				  autoDisplay: true}, 'google_translate_element');
				}
								</script>
		<script type="text/javascript"
			src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
	
		<!-- </form> -->
	</div>
</div>
	</div>
</body>


<script type="text/javascript">

$("#chattingWriteAll").on("click", function(){
	var chattingAllContent = $('#chattingAllContent').val();
	/* var errorContent="<script>"; */
	$.ajax({
		type:'POST',
		url:'chattingAllContent',
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"POST"
		},
		dataType:"JSON",
		data:JSON.stringify({chattingAllContent:chattingAllContent}), 
		success:function(result){
				chattingAll();	//자료 등록 성공하였으니 새롭게 자료를 요청 부분 실행하여 리스트 갱신
				emptychattingAllContent();//댓글 입력창 초기화
			},
		error:function(result){
			chattingAll();	//자료 등록 성공하였으니 새롭게 자료를 요청 부분 실행하여 리스트 갱신
			alert('error!');	
			emptychattingAllContent();//댓글 입력창 초기화
			}
	});
});
</script>
</html>