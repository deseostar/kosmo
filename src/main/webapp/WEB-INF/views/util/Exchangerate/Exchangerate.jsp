<%@ page language="java" contentType="text/html"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
<head>
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<!-- Title -->
<title>PoKor - Exchange Calculator</title>
<style>
.table th{
	background-color:#70c745;
	height:75px;
	vertical-align: middle !important;
	color:#fff;
	font-size:18px;
}

@media only screen and (max-width: 800px) {
	#baseInput{
		width:80.3% !important;
	}
}
</style>
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
		class="top-breadcrumb-area bg-img bg-overlay  d-flex align-items-center justify-content-center"
		style="background-image: url(resources/img/money.png);">
		<h2>Exchange Calculator</h2>
	</div>
</div>
<!-- ##### Breadcrumb Area End ##### -->
<!-- ##### Header Area End ##### -->
<div class="container" style="margin-bottom: 50px;">
	<div class="shop-products-area">
		<div class="row" style="padding:0px;">
			<div class="col-12 col-md-12 col-lg-12" style="padding:0px;">
				<div id="ghkswjs" >
					
				</div>
				<!-- 페이지 -->
				<div  class="col-12" style="padding:0px;margin-top: 30px;" align="center" id="pagestr">
					
				</div>
			</div>
		</div>
	</div>
</div>
	<!-- 동욱 끝 -->
<!-- ##### Contact Area End ##### -->

<jsp:include page="../../setting/footer01.jsp" flush="false" />
<!-- ##### Footer Area End ##### -->
</body>
<script type="text/javascript" >
var Tmoney = new Array();
var country = ['UnitedArabEmirates','Australian','Bahraini','Canadian ','Swiss','','Denmaahkeu','','British','TheHongKong','Indonesian','Japanese','','Kuwaiti','Malaysian','Norway','NewZealand','Saudi','Swedish','Singapore','Thai','US'];
var Currency = ['Dirham','dollar','Dinar','Dollar','Franc','','Krone','','Pound','dollar','Rupiah ','yen','','Dinar','ringgit','Krone','dollar','riyal','krona','dollar','Baht','Dollar'];
var Currencyimg = ['<img src="https://ssl.pstatic.net/static/nfinance/img_money_AED.gif">',
	'<img src="https://ssl.pstatic.net/static/nfinance/img_money_AUD.gif">',
	'<img src="https://ssl.pstatic.net/static/nfinance/img_money_BHD.gif">',
	'<img src="https://ssl.pstatic.net/static/nfinance/img_money_AUD.gif">',
	'CHF',
	'',
	'<img src="https://ssl.pstatic.net/static/nfinance/img_money_NOK.gif">',
	'',
	'<img src="https://ssl.pstatic.net/static/nfinance/img_money_GBP.gif">',
	'<img src="https://ssl.pstatic.net/static/nfinance/img_money_AUD.gif">',
	'<img src="https://ssl.pstatic.net/static/nfinance/img_money_IDR.gif">',
	'<img src="https://ssl.pstatic.net/static/nfinance/img_money_JPY.gif">',
	'',
	'<img src="https://ssl.pstatic.net/static/nfinance/img_money_KWD.gif">',
	'<img src="https://ssl.pstatic.net/static/nfinance/img_money_MYR.gif">',
	'<img src="https://ssl.pstatic.net/static/nfinance/img_money_NOK.gif">',
	'<img src="https://ssl.pstatic.net/static/nfinance/img_money_AUD.gif">',
	'<img src="https://ssl.pstatic.net/static/nfinance/img_money_SAR.gif">',
	'<img src="https://ssl.pstatic.net/static/nfinance/img_money_SEK.gif">',
	'<img src="https://ssl.pstatic.net/static/nfinance/img_money_AUD.gif">',
	'<img src="https://ssl.pstatic.net/static/nfinance/img_money_THB.gif">',
	'<img src="https://ssl.pstatic.net/static/nfinance/img_money_AUD.gif">',];
$(function(){
	var obj = new Object();
	var str = '';
	var str2 = '';
	
	
	$.ajax({
		url : 'exchangeratejson', 
		type : 'GET',
		dataType : 'json',
		success : function(obj) {
			str += '<table class="table table-striped" style="border:1px solid #70c745;">';
			str += '<thead ><tr align="center" >';
			str += '<th >Country / Currency</th>';
			str += '<th >Trading standard rate</th>';
			str += '<th >(Remittance) Receive</th>';
			str += '<th >(Remittance) Send</th>';
			str += '</tr> </thead><tbody>';
			for(var i=0;i<obj.length;i++){
				if(i != 5 && i != 7 && i != 12){
					var ss = obj[i].cur_nm;
					var ss2 = ss.split(" ");
					str += '<tr align="center" style="vertical-align:middle;"><td style="vertical-align:middle;">'+country[i];
					if(ss2[1] != null){
						str += '<br>'+Currency[i]+'    '+obj[i].cur_unit+'</td>';
					}
					str += '<td style="vertical-align:middle;">'+obj[i].deal_bas_r+'</td>';
					str += '<td style="vertical-align:middle;">'+obj[i].ttb+'</td>';
					str += '<td style="vertical-align:middle;">'+obj[i].tts+'</td>';
				}
				ss = obj[i].deal_bas_r;
				ss2 = ss.replace(',',"");
				Tmoney[i] = parseFloat(ss2);
			}
			str += '</tbody></table>';
			
			str2 += '<form action="#" method="post" style="margin-top:40px;margin-left: auto; margin-right: auto; border:1px solid #70c745; padding: 30px; backgrond-color: green; border-radius: 10px;" name="convertForm">'; 
			str2 += '<div class="col-md-7 mb-7" style="margin-left: auto; margin-right: auto;">';
			str2 += '<div class="col-md-12 mb-12">';
			str2 += '<label for="baseInput"> <font size="5"><b>F R O M</b></font></label>';
			str2 += '<select class="custom-select d-block w-100"style="margin:0 0 5px 0;" name="baseType" id="baseType" onchange="ExchangeMoney();">';
			for(var y=0; y<country.length;y++){
				if(y != 5 && y != 7 && y != 12){
					str2 += '<option value="'+country[y]+'" >'+country[y]+'</option>';
				}
			}
			str2 += '</select>';
			
			str2 += '<div style="width:100%;padding:6px;display:inline;border:1px solid #ced4da;border-radius:.25rem;">';
			str2 += '<input onkeyup="onkey2(1);" type="text" style="text-align:right;letter-spacing:2px;border:none;padding-right:10px;width:92.6%;margin:0;"name="baseInput" id="baseInput" placeholder="0" maxlength="30" numberOnly><span id="Currencyimg" >'+Currencyimg[0]+'</span></div></div>';
			str2 += '<div align="center"><br> <img src="resources/img/util/equal.png"><br> <br></div>';
			str2 += '<div class="col-md-12 mb-12" align="right">';
			str2 += '<label for="resultInput"> <font size="5"><b>T O (₩ KRW)</b></font>';
			str2 += '</label> <input onkeyup="onkey(1);" style="text-align:right;letter-spacing:2px;"type="text" id="resultInput" name="resultInput" placeholder="0" maxlength="30" class="form-control">';
			str2 += '</div></div></form>';
									
			$('#ghkswjs').html(str2);						
			$('#pagestr').html(str);
			
		},
		error : function(){
			alert('오류');
		}
	});
	
});



function ExchangeMoney(){
	var baseType = $('#baseType').val();
	var Currencyimg2 = $('#Currencyimg').html();
	for(var i=0;i<country.length;i++){
		if(country[i]==baseType){
			$('#Currencyimg').html(Currencyimg[i]);
		}
	}
	
	$('#resultInput').val(null);
	$('#baseInput').val(null);
}

var Tregexp = /^\d*(\.\d{0,2})?$/; 
var regexp = /^[0-9]*$/;
function onkey(num){
	$('#baseInput').val(null);
	var kn = $('#resultInput').val();
	var baseType = $('#baseType').val();
	if(num==1){
		if(!regexp.test(kn) ) {
			alert("Please enter only numbers.");
			$('#resultInput').val(null);
			return;
		}
	}
	for(var i=0;i<country.length;i++){
		if(country[i]==baseType){
			var mo = Tmoney[i];
			mo = kn/mo;
			mo = mo.toFixed(2);
			mo = thousandSeparatorCommas(mo);
			$('#baseInput').val(mo);
		}
	}
}
function onkey2(num){
	$('#resultInput').val(null);
	var kn = $('#baseInput').val();
	var baseType = $('#baseType').val();
	if(num==1){
		if(!regexp.test(kn) ) {
			alert("Please enter only numbers.");
			$('#baseInput').val(null);
			return;
		}
	}
	
	for(var i=0;i<country.length;i++){
		if(country[i]==baseType){
			var mo = Tmoney[i];
			if(i==11 || i == 10){
				mo = mo /100;
			}
			mo = kn*mo;
			mo = mo.toFixed(2);
			mo = thousandSeparatorCommas(mo);
			$('#resultInput').val(mo);
		}
	}
}

function thousandSeparatorCommas ( number ){ 
	 var string = "" + number;  // 문자로 바꾸기. 
	 string = string.replace( /[^-+\.\d]/g, "" )  // ±기호와 소수점, 숫자들만 남기고 전부 지우기. 
	 var regExp2 = /^([-+]?\d+)(\d{3})(\.\d+)?/;  // 필요한 정규식. 
	 while ( regExp2.test( string ) ) string = string.replace( regExp2, "$1" + "," + "$2" + "$3" );  // 쉼표 삽입. 
	 return string; 
} 



</script>
</html>