
function getlegalinfoJsonData2(){
	var search = $("#search").val();
	var catitle= $('#legalintitle').text();
	//첫번째 매개변수인 URL 부분은 RestController의 주소부분 - BoardRestController 참고
	$.getJSON("legalinfoListJson?search="+search+"&catitle="+catitle, function(data){
		var str2 = "";	//인위적으로 만들어낼 HTMl 태그를 담기위해 선언
		//ex 테이블의 경우 테이블 태그와 같이 1개만 존재해야 되는 부분 each 전에 작성
				//반복 작업될 부분 작성 ex) <tr><td> 등
					str2 += '<br><table align="left" class="table-striped table" style="border:1px solid #70c745;">';
					str2 += ' <thead  style="background-color:#70c745"><tr align="center">';
						str2 += '<th style="color:#fff;width:50%;">Legal Name</th>';  //법령명
						str2 += '<th style="color:#fff;width:13%;">Modified Department</th>'; //소관부처
						str2 += '<th style="color:#fff;width:13%;">Classification</th>'; //제개정구분
						str2 += '<th style="color:#fff;width:12%;">Type of Act</th>'; //법령종류
						str2 += '<th style="color:#fff;width:12%;">Fear number</th>'; //공포번호
						str2 += '</tr> </thead><tbody>';
					$(data).each(
							function(){
								str2 +='<tr id="mounsover" onclick="getlegalinfoJsonData3('+this.lawlistlink+');">';
								str2 += '<td ><a href="#" onclick="getlegalinfoJsonData3('+this.lawlistlink+');">'+this.lawListEnglish+'<br>'+this.lawListHangul+'</a></td>';
								str2 += '<td align="center">'+this.department+'</td>';
								str2 += '<td align="center">'+this.classification+'</td>';
								str2 += '<td align="center">'+this.typeofAct+'</td>';
								str2 += '<td align="center">제 '+this.fearnumber+'호</td>';
								str2 +='</tr>';
							}
						);
					str2 += '</tbody></table>';
					$("#search").val(null);
		$('#KnowledgeAjaxStart2').html(str2); // str 에 완성 된 태그가 들어가게 될 위치 지정(15번 행)
	});
}

function getlegalinfoJsonData3(address){
	var preloader = '<div class="preloader trans-preloader d-flex align-items-center justify-content-center"><div class="preloader-circle"></div><div class="preloader-img"><img src="resources/img/core-img/leaf.png" alt=""></div></div>';
	$('#KnowledgeAjaxStart2').html(preloader); 
	//첫번째 매개변수인 URL 부분은 RestController의 주소부분 - BoardRestController 참고
	$.getJSON("legalinfoDetailJson?address="+address, function(data){
		var str2 = "";	//인위적으로 만들어낼 HTMl 태그를 담기위해 선언
		//ex 테이블의 경우 테이블 태그와 같이 1개만 존재해야 되는 부분 each 전에 작성
				//반복 작업될 부분 작성 ex) <tr><td> 등
					str2 += '<br><br><ul align="left">';
					var i=0;
					$(data).each(
							function(){	
								var str3=this.joCts;
								if(i<1){
									str2 += '<li align="center" style="font-weight:bold;font-size:25px;margin:0 0 20px 0;">'+this.lsNmEng+'</li>';
									i=i+1;
								}
								if(str3.indexOf("CHAPTER")){
									str2 += '<li style="padding-left:10px;margin-bottom:15px;">'+this.joCts+'</li>';
								}else{
									str2 += '<li style="font-weight:bold;font-size:18px;margin:7px 0;">'+this.joCts+'</li>';
								}
							}
							
						);
					str2 += '</ul>';
		$('#KnowledgeAjaxStart2').html(str2); // str 에 완성 된 태그가 들어가게 될 위치 지정(15번 행)
	});
}