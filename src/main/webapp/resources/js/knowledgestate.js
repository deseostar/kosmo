
//지식인게시판 리스트 가져오기
	var num = 1;
	function pageknowledgeBoardList(pageNum){
		if(pageNum != null){
			num=pageNum;
			$('#pageNum').val(num);
		}
		getknowledgelistJsonData();
		
		$('#btn_select').focus();
		num=1;
	}
	function knowledgeWriteForm(knowledgeNumber){
		var pageNum = $('#pageNum').val();
		window.location='knowledgeWriteForm?pageNum='+pageNum;
	}	
	function knowledgeDetailForm(knowledgeNumber){
		var pageNum = $('#pageNum').val();
		window.location='knowledgeDetailForm?knowledgeNumber='+knowledgeNumber+'&pageNum='+pageNum;
	}
function getknowledgelistJsonData(){
	var selectchk = $("#selectchk").attr("value");
	//자료 요청에 필요한 데이터 획득(글번호,ID 등)
	var loginId = $('#loginId').val();
	var knowledgeCategory = $('#titlecatagory').text();
	var btn_select = $("#btn_select").val();
	var search = $("#search").val();
	//첫번째 매개변수인 URL 부분은 RestController의 주소부분 - BoardRestController 참고
	$.getJSON("KnowledgeListJson?knowledgeCategory="+knowledgeCategory+"&btn_select="+btn_select+"&search="+search+"&pageNum="+num+"&selectchk="+selectchk, function(data){
		var str = "";	//인위적으로 만들어낼 HTMl 태그를 담기위해 선언
		
		var cnt = data.length;
		var arr = data.dtos2; 
		var i = 0;
		
		//ex 테이블의 경우 테이블 태그와 같이 1개만 존재해야 되는 부분 each 전에 작성
		$(data.dtos).each(
				//반복 작업될 부분 작성 ex) <tr><td> 등asdasdasdsddads
				function(){			
					str +='<div class="card flex-md-row shadow-sm h-md-250" style="margin-top: 20px; padding: 0;">';
					str +='<div class="card-body d-flex flex-column align-items-start"style="margin: 0;padding:0;" >';
					str +='<table class="cursorCustom" onclick="knowledgeDetailForm('+this.knowledgeNumber+');"style="width: 100%; border: 0.5px solid #70c745 !important;padding:3px;"><tr id="'+this.knowledgeNumber+'"><td class="card " style="padding:0 5px 5px 5px;max-width: 100%; word-break: break-all;">';
					str +='<p class="knowledp1" style="margin-bottom:5px;"onclick="knowledgeDetailForm('+this.knowledgeNumber+'");>';
					if(this.knowledgeReward > 0){
						str +='<strong id="ehddnrdk2" style="border:none;padding:5px;letter-spacing:1.5px;border: 0.5px solid #70c745 !important;background-color:#70c745;color:#fff;text-align:center;">'+this.knowledgeReward+'P</strong> &nbsp; &nbsp; ';
					}
					str +='<span class="knowledp1" id="ehddnrdk" style="font-size: 25px;color:black;">'+this.knowledgeSubject+'</span>';
					if(loginId==this.memberId){
						str +='<span id="knowledp2"style="float: right; margin-right: 3px;"><a href="knowledgeDeleteForm?knowledgeNumber='+this.knowledgeNumber+'&pageNum='+this.pageNum+'&btn_select='+this.btn_select+'">Delete</a></span>';
						str +='<span style="float: right; margin-right: 20px;"><a href="knowledgeModifyForm?knowledgeNumber='+this.knowledgeNumber+'&pageNum='+this.pageNum+'&btn_select='+this.btn_select+'">Modified</a></span>';
					}
					str +='</p><p id="knowledgeContentWidth" style="overflow:hidden;text-overflow:ellipsis;max-width:800px;margin: 0 0 8px 0; line-height: 18px;">';
					str +='<span style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">'+this.knowledgeContent+' </span></p><p style="margin: 2px 0 0 0"><span>Comment  &nbsp;&nbsp;</span> <span>  '+arr[i]+'  </span>';
					str +='<span style="margin-left: 20px;"class="knowledgeup">'+this.knowledgeCategory+'</span>&nbsp;&nbsp;<span style="margin-left: 20px;">'+this.knowledgeRegdate+'</span>';
					str +='<span style="float: right; margin-right: 3px;">Hits&nbsp;'+this.knowledgeLookup+'</span></p></td></tr></table></div></div>';
					i = i+1;
				});
		var pagestr = "";
		var cnt = data.cnt;
		var startPage = data.startPage; // 시작 페이지
		var endPage = data.endPage; // 마지막 페이지
		var pageBlock = data.pageBlock; // 출력할 페이지 갯수
		var pageCount = data.pageCount; // 페이지 갯수
		var currentPage = data.currentPage; // 현재페이지
		var pageNum = data.pageNum;
		
			if(cnt==0){
				pagestr+='<p align="center">Please Register Your Question.</p>';
			} else {
				pagestr+='<ul class="pagination" align="center" style="margin: auto auto;">';
				if(startPage > pageBlock){
					pagestr += '<li class="page-item"><a class="page-link" onclick="pageknowledgeBoardList('+1+');"><i class="fa fa-angle-left"></i><i class="fa fa-angle-left"></i></a></li>';
					pagestr += '<li class="page-item"><a class="page-link" onclick="pageknowledgeBoardList('+(startPage-pageBlock)+');"><i class="fa fa-angle-left"></i></a></li>';
				}
				for(var j=startPage; j<endPage+1;j++){
					if(j==currentPage){
						pagestr += '<li class="page-item"><a class="page-link"style="background-color: #28a745 !important; color: white !important">'+j+'</a></li>';
					} else {
						pagestr += '<li class="page-item"><a class="page-link" onclick="pageknowledgeBoardList('+j+');">'+j+'</a></li>';
					}
				}
				
				if(pageCount > endPage){
					pagestr += '<li class="page-item"><a class="page-link" onclick="pageknowledgeBoardList('+(startPage+pageBlock)+');"><i class="fa fa-angle-right"></i></a></li>';
					pagestr += '<li class="page-item"><a class="page-link" onclick="pageknowledgeBoardList('+pageCount+');"><i class="fa fa-angle-right"></i><i class="fa fa-angle-right"></i></a></li>';
				}
				pagestr += '</ul>';
			}
		$('#pagestr').html(pagestr);	
		$('#KnowledgeAjaxStart').html(str); // str 에 완성 된 태그가 들어가게 될 위치 지정(15번 행)
		$(knowledgeCategory).css("font-weight", "bold");
	})
}

/*// 지식인게시판 페이징 처리 
function getknowledgepageJsonData(){

	//첫번째 매개변수인 URL 부분은 RestController의 주소부분 - BoardRestController 참고
	$.getJSON("KnowledgeListJson", function(data){
		
		
		//$('#KnowledgeAjaxStart').html(str); // str 에 완성 된 태그가 들어가게 될 위치 지정(15번 행)
	});
}*/
