// 전철시간표/버스시간표 모달
function getDirectionModal(stationID,BnT){
	$('#modal-content').empty();
	if(BnT == 1){
		subwayTimeTable(stationID);
	} else {
		var str = "";
		var url = 'https://api.odsay.com/v1/api/busStationInfo?apiKey=hnsqv%2Bnl81sOEEMyauqSk2DiKsoH%2BY2VTPN4c2%2FhmB0&lang=0&stationID='+stationID;
		console.log(url);
		$.getJSON(url, function(data) {
			var result = data.result;
			var localStationID = result.localStationID;
			var dosi = data.result.do;
			var arsID = data.result.arsID;
			arsID = arsID.replace("-","");
			if(dosi=="경기도"){
				Gyeonggi(localStationID);
			} else if(dosi=="서울특별시"){
				Seoul(arsID);
			}
			
		});
	}
	$('#getDirectionslModal').show();
	
}


// 서울
function Seoul(arsID){
	var str="";
	var busArray = new Array();
	var routeArray = new Array();
	var stIdArray = new Array();
	var staOrdArray = new Array();
	$.getJSON('getSeoulRealTimeStation?arsID='+arsID, function(data) {
		var res = data.ServiceResult;
		var busRealTime = data.ServiceResult.msgBody.itemList;
		str += '<div>';
		str += '<table class="table table-striped" id="modalTable">';
		str += '<tr>';
		str += '<th>BusNo</th>';  
		str += '<th>License plate</th>'; 
		str += '<th>Location</th>';  
		str += '<th>PredictTime</th>'; 
		str += '</tr>';
		if(busRealTime.length == undefined){
			var predict = busRealTime.arrmsg1; 
			if(predict != "곧 도착" && predict != "운행종료" && predict != "출발대기" && predict != "회차대기"){
				var arrmsg1 = predict.split("분");
				var location = arrmsg1[1].split("[");
				var locationA = location[1].split("번");
				var busNum = busRealTime.rtNm;
				var route = busRealTime.busRouteId;  
				var stId = busRealTime.stId;
				var staOrd = busRealTime.staOrd;
					str += '<tr>';
					str += '<td class="busCss1">'+busNum+'</td>';
					str += '<td class="busCss2"><div id="busN0"></div></td>';
					str += '<td class="busCss3">' +locationA[0]+'&nbsp;Stops</td>';
					str += '<td class="busCss4">' +arrmsg1[0]+'&nbsp;Minutes</td>';
					str += '</tr>';
					routeArray.push(route);
					stIdArray.push(stId);
					staOrdArray.push(staOrd);
			} else if(predict == "출발대기"){
				str += '<tr>';
				str += '<td class="busCss1">'+busNum+'</td>';
				str += '<td class="busCss2">Departure Standby</td>';
				str += '<td class="busCss3">Waiting&nbsp;Stops</td>';
				str += '<td class="busCss4">Waiting&nbsp;Minutes</td>';
				str += '</tr>';
				var busend = "운행종료";
				routeArray.push(busend);
				stIdArray.push(busend);
				staOrdArray.push(busend);
			} else if(predict == "운행종료" || predict != "출발대기" || predict =="회차대기"){
				alert("No bus arrival information available.");
				return false;
			} else {
				var route = busRealTime.busRouteId;  
				var stId = busRealTime.stId;
				var staOrd = busRealTime.staOrd;
				str += '<tr>';
				str += '<td class="busCss1">'+busNum+'</td>';
				str += '<td class="busCss2"><div id="busN0"></div></td>';
				str += '<td class="busCss3">Arriving soon</td>';
				str += '<td class="busCss4">Arriving soon</td>';
				str += '</tr>';
				routeArray.push(route);
				stIdArray.push(stId);
				staOrdArray.push(staOrd);
			}
		} else {
			for(var bu=0;bu<busRealTime.length;bu++){
				var predict = busRealTime[bu].arrmsg1; 
				var busNum = busRealTime[bu].rtNm;
				if(predict != "곧 도착" && predict != "운행종료" && predict != "출발대기" && predict != "회차대기"){
					var arrmsg1 = predict.split("분");
					var location = arrmsg1[1].split("[");
					var locationA = location[1].split("번");
					
					var stId = busRealTime[bu].stId;
					var staOrd = busRealTime[bu].staOrd;
					var route = busRealTime[bu].busRouteId;  
						str += '<tr>';
						str += '<td class="busCss1">'+busNum+'</td>';
						str += '<td class="busCss2"><div id="busN'+bu+'"></div></td>';
						str += '<td class="busCss3">' +locationA[0]+'&nbsp;Stops</td>';
						str += '<td class="busCss4">' +arrmsg1[0]+'&nbsp;Minutes</td>';
						str += '</tr>';
						routeArray.push(route);
						stIdArray.push(stId);
						staOrdArray.push(staOrd);
				}  else if(predict == "출발대기"){
					str += '<tr>';
					str += '<td class="busCss1">'+busNum+'</td>';
					str += '<td class="busCss2">Departure Standby</td>';
					str += '<td class="busCss3">Waiting&nbsp;Stops</td>';
					str += '<td class="busCss4">Waiting&nbsp;Minutes</td>';
					str += '</tr>';
					var busend = "운행종료";
					routeArray.push(busend);
					stIdArray.push(busend);
					staOrdArray.push(busend);
				} else if(predict == "운행종료" || predict != "출발대기" || predict == "회차대기"){
					var busend = "운행종료";
					routeArray.push(busend);
					stIdArray.push(busend);
					staOrdArray.push(busend);
				} else {
					var route = busRealTime[bu].busRouteId;  
					var stId = busRealTime[bu].stId;
					var staOrd = busRealTime[bu].staOrd;
					str += '<tr>';
					str += '<td class="busCss1">'+busNum+'</td>';
					str += '<td class="busCss2"><div id="busN'+bu+'"></div></td>';
					str += '<td class="busCss3">Arriving soon</td>';
					str += '<td class="busCss4">Arriving soon</td>';
					str += '</tr>';
					routeArray.push(route);
					stIdArray.push(stId);
					staOrdArray.push(staOrd);
				}
			}
		}
		str += '</table></div>';
		$('#modal-content').html(str);
		for(var bu=0;bu<routeArray.length;bu++){
			if(routeArray[bu] != "운행종료"){
				SeoulbusgetJson(routeArray,stIdArray,staOrdArray,bu);
			}
		}
		
	});
	
}

function SeoulbusgetJson(routeArray,stIdArray,staOrdArray,bu){
	$.getJSON('SeoulbusgetJson?route='+routeArray[bu]+'&stId='+stIdArray[bu]+'&staOrd='+staOrdArray[bu], function(data) {
		var busRealTime = data.ServiceResult.msgBody.itemList;
			for(var i =0; i<busRealTime.length;i++){
				var stId = busRealTime[i].stId;
				if(stId == stIdArray[bu]){
					var busNo = busRealTime[i].plainNo1;
					$('#busN'+bu).html(busNo);
				}
			}
		
	});
}




//경기 버스 모달 시작===========================================================
function Gyeonggi(localStationID){
	var str="";
	var busArray = new Array();
	var routeArray = new Array();
	$.getJSON('getRealTimeStation?localStationID='+localStationID, function(data) {
		var res = data.response;
		var msgHeader = data.response.msgHeader;
		var busRealTime = data.response.msgBody.busArrivalList;
		str += '<div>';
		str += '<table class="table table-striped" id="modalTable">';
		str += '<tr>';
		str += '<th>BusNo</th>';  
		str += '<th>License plate</th>'; 
		str += '<th>Location</th>';  
		str += '<th>PredictTime</th>'; 
		str += '</tr>';
		if(busRealTime.length == undefined){
			var plate = busRealTime.plateNo1;   
			var location = busRealTime.locationNo1; 
			var predict = busRealTime.predictTime1; 
			var route = busRealTime.routeId;  
				str += '<tr>';
				str += '<td class="busCss1"><div id="busN0"></div></td>';
				str += '<td class="busCss2">' +plate+'</td>';
				str += '<td class="busCss3">' +location+'&nbsp;Stops</td>';
				str += '<td class="busCss4">' +predict+'&nbsp;Minutes</td>';
				str += '</tr>';
				routeArray.push(route);
		} else {
			for(var bu=0;bu<busRealTime.length;bu++){
				var plate = busRealTime[bu].plateNo1;   
				var location = busRealTime[bu].locationNo1; 
				var predict = busRealTime[bu].predictTime1; 
				var route = busRealTime[bu].routeId;  
					str += '<tr>';
					str += '<td class="busCss1"><div id="busN'+bu+'"></div></td>';
					str += '<td class="busCss2">' +plate+'</td>';
					str += '<td class="busCss3">' +location+'&nbsp;Stops</td>';
					str += '<td class="busCss4">' +predict+'&nbsp;Minutes</td>';
					str += '</tr>';
					routeArray.push(route);
			}
		}
		str += '</table></div>';
		$('#modal-content').html(str);
		
		for(var bu=0;bu<routeArray.length;bu++){
			busgetJson(routeArray,bu);
		}
	});
	
}

//경기 버스번호 가져오기
function busgetJson(routeArray,bu){
	$.getJSON('getBusRealTimeNo?route='+routeArray[bu], function(data2) {
		var busNo = data2.response.msgBody.busRouteInfoItem.routeName;
		$('#busN'+bu).html(busNo);
	});
}
// 지하철 모달 시작===================================================================================
function subwayTimeTable(stationID){
	var str = "";
	// 정류장 번호찾기
	var url = 'https://api.odsay.com/v1/api/subwayTimeTable?apiKey=hnsqv%2Bnl81sOEEMyauqSk2DiKsoH%2BY2VTPN4c2%2FhmB0&lang=0&showExpressTime=1&stationID='+stationID;
	 $.getJSON(url, function(data) {
		 var result = data.result;
		 var Week = "Week";
		 var Satur = "Satur";
		 var Sun = "Sun";
		 str += '<div align="center">';
		 str += '<button type="button" onclick="TrainTime('+Week+');" class="realtime" id="realtime1" style="background-color:#70c745;float:left;color:white;">WeekDay</button>';
		 str += '<button type="button" onclick="TrainTime('+Satur+');" class="realtime" id="realtime2" >SaturDay</button>';
		 str += '<button type="button" onclick="TrainTime('+Sun+');" class="realtime" id="realtime3" style="float:right;">SunDay</button><br>';
		 str += '</div>';
		 var upOrdList,upSatList,upSunList,downOrdList,downSatList,downSunList;
		 if(data.result.OrdList.up != undefined){
			  upOrdList = data.result.OrdList.up.time;
			  upSatList = data.result.SatList.up.time;
			  upSunList = data.result.SunList.up.time;
		 }
		 if(data.result.OrdList.down != undefined){
			  downOrdList = data.result.OrdList.down.time;
			  downSatList = data.result.SatList.down.time;
			  downSunList = data.result.SunList.down.time;
		 }
		 
		 // ===============================하행만 있을 때
		 if(data.result.OrdList.down != undefined && data.result.OrdList.up == undefined){
			 str += '<div class="TrainTimediv" id="Week">';
			 str += '<table class="table table-striped" id="modalTable">';
			 str += '<tr style="font-size:18px;font-weight:bold;"><th style="width:10%;text-align:center;">Time</th><th style="width:45%;">DownWay : '+result.downWay+'</th></tr>';
			 for(var sn=0; sn<downOrdList.length; sn++){
				 var sp = downOrdList[sn].list;
				 var sparray = sp.split(" ");
				 str += '<tr>';
				 str += '<td style="font-size:17px;text-align:center;color:black;">'+downOrdList[sn].Idx+'</td>';
				 var trNumArray = new Array();
				  if(downOrdList[sn].expList != undefined){
					  str += '<td >';
				 	 var gsp = downOrdList[sn].expList;
					 var gsparray = gsp.split(" ");
				 	
					 for(var kn=0; kn<sparray.length;kn++){
				 		var trTime = sparray[kn].substr(0,2);
				 		if(gsparray[kn] != undefined){
				 			var gTime = gsparray[kn].substr(0,2);
				 			trNumArray.push(trTime);
				 			trNumArray.push(gTime);
				 		} else {
				 			trNumArray.push(trTime);
				 		}
				 	}
				 	trNumArray.sort();
				 	 for(var kh=0; kh<trNumArray.length; kh++){
				 		var tgrnum = 0;
				 		for(var kt=0;kt<gsparray.length;kt++){
				 			var gTime = gsparray[kt].substr(0,2);
				 			  if(gTime==trNumArray[kh]){
				 				tgrnum = 1;
				 			}  
				 		}
				 		 if(tgrnum==1){
				 			str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;color:red;">'+trNumArray[kh]+'</button>';
				 		} else{
				 			str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;">'+trNumArray[kh]+'</button>';
				 		} 
				 	
				 	} 
				 	 str += '</td >';
			 	 } else {
			 		str += '<td >';
			 		for(var kn=0; kn<sparray.length;kn++){
				 		var trTime = sparray[kn].substr(0,2); 
				 		str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;">'+trTime+'</button>';
				 	}
			 		str +='</td>';
			 	 }
				 trNumArray = [];
				 str += '</tr>';
			 }
			 str += '</table>';
			 str += '</div>';
			 
			 str += '<div class="TrainTimediv" id="Satur" style="display:none;">';
			 str += '<table class="table table-striped">';
			 str += '<tr style="font-size:18px;font-weight:bold;"><th style="width:10%;text-align:center;">Time</th><th style="width:45%;">DownWay : '+result.downWay+'</th></tr>';
			 for(var sn=0; sn<downSatList.length; sn++){
				 var sp = downSatList[sn].list;
				 var sparray = sp.split(" ");
				 str += '<tr>';
				 str += '<td style="font-size:17px;text-align:center;color:black;">'+downSatList[sn].Idx+'</td>';
				 var trNumArray = new Array();
				  if(downSatList[sn].expList != undefined){
					  str += '<td >';
				 	 var gsp = downSatList[sn].expList;
					 var gsparray = gsp.split(" ");
				 	
					 for(var kn=0; kn<sparray.length;kn++){
				 		var trTime = sparray[kn].substr(0,2);
				 		if(gsparray[kn] != undefined){
				 			var gTime = gsparray[kn].substr(0,2);
				 			trNumArray.push(trTime);
				 			trNumArray.push(gTime);
				 		} else {
				 			trNumArray.push(trTime);
				 		}
				 	}
				 	trNumArray.sort();
				 	 for(var kh=0; kh<trNumArray.length; kh++){
				 		var tgrnum = 0;
				 		for(var kt=0;kt<gsparray.length;kt++){
				 			var gTime = gsparray[kt].substr(0,2);
				 			  if(gTime==trNumArray[kh]){
				 				tgrnum = 1;
				 			}  
				 		}
				 		 if(tgrnum==1){
				 			str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;color:red;">'+trNumArray[kh]+'</button>';
				 		} else{
				 			str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;">'+trNumArray[kh]+'</button>';
				 		} 
				 	
				 	} 
				 	 str += '</td >';
			 	 } else {
			 		str += '<td >';
			 		for(var kn=0; kn<sparray.length;kn++){
				 		var trTime = sparray[kn].substr(0,2); 
				 		str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;">'+trTime+'</button>';
				 	}
			 		str +='</td>';
			 	 }
				 str += '</tr>';
			 }
			 str += '</table>';
			 str += '</div>';
			 
			 str += '<div class="TrainTimediv" id="Sun" style="display:none;">';
			 str += '<table class="table table-striped">';
			 str += '<tr style="font-size:18px;font-weight:bold;"><th style="width:10%;text-align:center;">Time</th><th style="width:45%;">DownWay : '+result.downWay+'</th></tr>';
			 for(var sn=0; sn<downSunList.length; sn++){
				 var sp = downSunList[sn].list;
				 var sparray = sp.split(" ");
				 str += '<tr>';
				 str += '<td style="font-size:17px;text-align:center;color:black;">'+downSunList[sn].Idx+'</td>';
				 var trNumArray = new Array();
				  if(downSunList[sn].expList != undefined){
					  str += '<td >';
				 	 var gsp = downSunList[sn].expList;
					 var gsparray = gsp.split(" ");
				 	
					 for(var kn=0; kn<sparray.length;kn++){
				 		var trTime = sparray[kn].substr(0,2);
				 		if(gsparray[kn] != undefined){
				 			var gTime = gsparray[kn].substr(0,2);
				 			trNumArray.push(trTime);
				 			trNumArray.push(gTime);
				 		} else {
				 			trNumArray.push(trTime);
				 		}
				 	}
				 	trNumArray.sort();
				 	 for(var kh=0; kh<trNumArray.length; kh++){
				 		var tgrnum = 0;
				 		for(var kt=0;kt<gsparray.length;kt++){
				 			var gTime = gsparray[kt].substr(0,2);
				 			  if(gTime==trNumArray[kh]){
				 				tgrnum = 1;
				 			}  
				 		}
				 		 if(tgrnum==1){
				 			str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;color:red;">'+trNumArray[kh]+'</button>';
				 		} else{
				 			str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;">'+trNumArray[kh]+'</button>';
				 		} 
				 	
				 	} 
				 	 str += '</td >';
			 	 } else {
			 		str += '<td >';
			 		for(var kn=0; kn<sparray.length;kn++){
				 		var trTime = sparray[kn].substr(0,2); 
				 		str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;">'+trTime+'</button>';
				 	}
			 		str +='</td>';
			 	 }
				 
				 trNumArray = [];
				 str += '</tr>';
			 }
			 
			 
		 // 상행만 있을때	 
		 } else if(data.result.OrdList.up != undefined && data.result.OrdList.down == undefined){
			 str += '<div class="TrainTimediv" id="Week">';
			 str += '<table class="table table-striped" id="modalTable">';
			 str += '<tr style="font-size:18px;font-weight:bold;"><th style="width:10%;text-align:center;">Time</th><th style="width:45%;">UpWay : '+result.upWay+'</th></tr>';
			 for(var sn=0; sn<upOrdList.length; sn++){
				 var sp = upOrdList[sn].list;
				 var sparray = sp.split(" ");
				 str += '<tr>';
				 str += '<td style="font-size:17px;text-align:center;color:black;">'+upOrdList[sn].Idx+'</td>';
				 var trNumArray = new Array();
				  if(upOrdList[sn].expList != undefined){
					  str += '<td >';
				 	 var gsp = upOrdList[sn].expList;
					 var gsparray = gsp.split(" ");
				 	
					 for(var kn=0; kn<sparray.length;kn++){
				 		var trTime = sparray[kn].substr(0,2);
				 		if(gsparray[kn] != undefined){
				 			var gTime = gsparray[kn].substr(0,2);
				 			trNumArray.push(trTime);
				 			trNumArray.push(gTime);
				 		} else {
				 			trNumArray.push(trTime);
				 		}
				 	}
				 	trNumArray.sort();
				 	 for(var kh=0; kh<trNumArray.length; kh++){
				 		var tgrnum = 0;
				 		for(var kt=0;kt<gsparray.length;kt++){
				 			var gTime = gsparray[kt].substr(0,2);
				 			  if(gTime==trNumArray[kh]){
				 				tgrnum = 1;
				 			}  
				 		}
				 		 if(tgrnum==1){
				 			str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;color:red;">'+trNumArray[kh]+'</button>';
				 		} else{
				 			str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;">'+trNumArray[kh]+'</button>';
				 		} 
				 	
				 	} 
				 	 str += '</td >';
			 	 } else {
			 		str += '<td >';
			 		for(var kn=0; kn<sparray.length;kn++){
				 		var trTime = sparray[kn].substr(0,2); 
				 		str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;">'+trTime+'</button>';
				 	}
			 		str +='</td>';
			 	 }
				 trNumArray = [];
				 str += '</tr>';
			 }
			 str += '</table>';
			 str += '</div>';
			 
			 str += '<div class="TrainTimediv" id="Satur" style="display:none;">';
			 str += '<table class="table table-striped">';
			 str += '<tr style="font-size:18px;font-weight:bold;"><th style="width:10%;text-align:center;">Time</th><th style="width:45%;">DownWay : '+result.upWay+'</th></tr>';
			 for(var sn=0; sn<upSatList.length; sn++){
				 var sp = upSatList[sn].list;
				 var sparray = sp.split(" ");
				 str += '<tr>';
				 str += '<td style="font-size:17px;text-align:center;color:black;">'+upSatList[sn].Idx+'</td>';
				 var trNumArray = new Array();
				  if(upSatList[sn].expList != undefined){
					  str += '<td >';
				 	 var gsp = upSatList[sn].expList;
					 var gsparray = gsp.split(" ");
				 	
					 for(var kn=0; kn<sparray.length;kn++){
				 		var trTime = sparray[kn].substr(0,2);
				 		if(gsparray[kn] != undefined){
				 			var gTime = gsparray[kn].substr(0,2);
				 			trNumArray.push(trTime);
				 			trNumArray.push(gTime);
				 		} else {
				 			trNumArray.push(trTime);
				 		}
				 	}
				 	trNumArray.sort();
				 	 for(var kh=0; kh<trNumArray.length; kh++){
				 		var tgrnum = 0;
				 		for(var kt=0;kt<gsparray.length;kt++){
				 			var gTime = gsparray[kt].substr(0,2);
				 			  if(gTime==trNumArray[kh]){
				 				tgrnum = 1;
				 			}  
				 		}
				 		 if(tgrnum==1){
				 			str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;color:red;">'+trNumArray[kh]+'</button>';
				 		} else{
				 			str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;">'+trNumArray[kh]+'</button>';
				 		} 
				 	
				 	} 
				 	 str += '</td >';
			 	 } else {
			 		str += '<td >';
			 		for(var kn=0; kn<sparray.length;kn++){
				 		var trTime = sparray[kn].substr(0,2); 
				 		str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;">'+trTime+'</button>';
				 	}
			 		str +='</td>';
			 	 }
				 str += '</tr>';
			 }
			 str += '</table>';
			 str += '</div>';
			 
			 str += '<div class="TrainTimediv" id="Sun" style="display:none;">';
			 str += '<table class="table table-striped">';
			 str += '<tr style="font-size:18px;font-weight:bold;"><th style="width:10%;text-align:center;">Time</th><th style="width:45%;">DownWay : '+result.upWay+'</th></tr>';
			 for(var sn=0; sn<upSunList.length; sn++){
				 var sp = upSunList[sn].list;
				 var sparray = sp.split(" ");
				 str += '<tr>';
				 str += '<td style="font-size:17px;text-align:center;color:black;">'+upSunList[sn].Idx+'</td>';
				 var trNumArray = new Array();
				  if(upSunList[sn].expList != undefined){
					  str += '<td >';
				 	 var gsp = upSunList[sn].expList;
					 var gsparray = gsp.split(" ");
				 	
					 for(var kn=0; kn<sparray.length;kn++){
				 		var trTime = sparray[kn].substr(0,2);
				 		if(gsparray[kn] != undefined){
				 			var gTime = gsparray[kn].substr(0,2);
				 			trNumArray.push(trTime);
				 			trNumArray.push(gTime);
				 		} else {
				 			trNumArray.push(trTime);
				 		}
				 	}
				 	trNumArray.sort();
				 	 for(var kh=0; kh<trNumArray.length; kh++){
				 		var tgrnum = 0;
				 		for(var kt=0;kt<gsparray.length;kt++){
				 			var gTime = gsparray[kt].substr(0,2);
				 			  if(gTime==trNumArray[kh]){
				 				tgrnum = 1;
				 			}  
				 		}
				 		 if(tgrnum==1){
				 			str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;color:red;">'+trNumArray[kh]+'</button>';
				 		} else{
				 			str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;">'+trNumArray[kh]+'</button>';
				 		} 
				 	
				 	} 
				 	 str += '</td >';
			 	 } else {
			 		str += '<td >';
			 		for(var kn=0; kn<sparray.length;kn++){
				 		var trTime = sparray[kn].substr(0,2); 
				 		str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;">'+trTime+'</button>';
				 	}
			 		str +='</td>';
			 	 }
				 
				 trNumArray = [];
				 str += '</tr>';
			 }
		 }
		 
		 
		 // ==================상행/하행 다있을때=================================================
		 else{
			 str += '<div class="TrainTimediv" id="Week">';
			 str += '<table class="table table-striped" id="modalTable">';
			 str += '<tr style="font-size:18px;font-weight:bold;"><th style="width:10%;text-align:center;">Time</th><th style="width:45%;">UpWay : '+result.upWay+'</th><th style="width:45%;">DownWay : '+result.downWay+'</th></tr>';
			 for(var sn=0; sn<upOrdList.length; sn++){
				 
				 var sp = upOrdList[sn].list;
				 var sparray = sp.split(" ");
				 str += '<tr>';
				 str += '<td style="font-size:17px;text-align:center;color:black;">'+upOrdList[sn].Idx+'</td>';
				 var trNumArray = new Array();
				  if(upOrdList[sn].expList != undefined){
					  str += '<td >';
				 	 var gsp = upOrdList[sn].expList;
					 var gsparray = gsp.split(" ");
				 	
					 for(var kn=0; kn<sparray.length;kn++){
				 		var trTime = sparray[kn].substr(0,2);
				 		if(gsparray[kn] != undefined){
				 			var gTime = gsparray[kn].substr(0,2);
				 			trNumArray.push(trTime);
				 			trNumArray.push(gTime);
				 		} else {
				 			trNumArray.push(trTime);
				 		}
				 	}
				 	trNumArray.sort();
				 	 for(var kh=0; kh<trNumArray.length; kh++){
				 		var tgrnum = 0;
				 		for(var kt=0;kt<gsparray.length;kt++){
				 			var gTime = gsparray[kt].substr(0,2);
				 			  if(gTime==trNumArray[kh]){
				 				tgrnum = 1;
				 			}  
				 		}
				 		 if(tgrnum==1){
				 			str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;color:red;">'+trNumArray[kh]+'</button>';
				 		} else{
				 			str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;">'+trNumArray[kh]+'</button>';
				 		} 
				 	
				 	} 
				 	 str += '</td >';
			 	 } else {
			 		str += '<td >';
			 		for(var kn=0; kn<sparray.length;kn++){
				 		var trTime = sparray[kn].substr(0,2); 
				 		str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;">'+trTime+'</button>';
				 	}
			 		str +='</td>';
			 	 }
				 
				 trNumArray = [];
				 
				 if(downOrdList[sn] != undefined){
					 var dp = downOrdList[sn].list;
					 var dparray = dp.split(" ");
					 
					 if(downOrdList[sn].expList != undefined){
						  str += '<td >';
					 	 var gsp = downOrdList[sn].expList;
						 var gsparray = gsp.split(" ");
					 	
						 for(var kn=0; kn<dparray.length;kn++){
					 		var trTime = dparray[kn].substr(0,2);
					 		if(gsparray[kn] != undefined){
					 			var gTime = gsparray[kn].substr(0,2);
					 			trNumArray.push(trTime);
					 			trNumArray.push(gTime);
					 		} else {
					 			trNumArray.push(trTime);
					 		}
					 	}
					 	trNumArray.sort();
					 	 for(var kh=0; kh<trNumArray.length; kh++){
					 		var tgrnum = 0;
					 		for(var kt=0;kt<gsparray.length;kt++){
					 			var gTime = gsparray[kt].substr(0,2);
					 			  if(gTime==trNumArray[kh]){
					 				tgrnum = 1;
					 			}  
					 		}
					 		 if(tgrnum==1){
					 			str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;color:red;">'+trNumArray[kh]+'</button>';
					 		} else{
					 			str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;">'+trNumArray[kh]+'</button>';
					 		} 
					 	
					 	} 
					 	 str += '</td >';
				 	 } else {
				 		str += '<td >';
				 		for(var kn=0; kn<dparray.length;kn++){
					 		var trTime = dparray[kn].substr(0,2); 
					 		str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;">'+trTime+'</button>';
					 	}
				 		str +='</td>';
				 	 }
				 } else {
					 str +='<td></td>';
				 }
				 str += '</tr>';
			 }
			 str += '</table>';
			 str += '</div>';
			 
			 str += '<div class="TrainTimediv" id="Satur" style="display:none;">';
			 str += '<table class="table table-striped">';
			 str += '<tr style="font-size:18px;font-weight:bold;"><th style="width:10%;text-align:center;">Time</th><th style="width:45%;">UpWay : '+result.upWay+'</th><th style="width:45%;">DownWay : '+result.downWay+'</th></tr>';
			 for(var sn=0; sn<upSatList.length; sn++){
				 var sp = upSatList[sn].list;
				 var sparray = sp.split(" ");
				 str += '<tr>';
				 str += '<td style="font-size:17px;text-align:center;color:black;">'+upSatList[sn].Idx+'</td>';
				 var trNumArray = new Array();
				  if(upSatList[sn].expList != undefined){
					  str += '<td >';
				 	 var gsp = upSatList[sn].expList;
					 var gsparray = gsp.split(" ");
				 	
					 for(var kn=0; kn<sparray.length;kn++){
				 		var trTime = sparray[kn].substr(0,2);
				 		if(gsparray[kn] != undefined){
				 			var gTime = gsparray[kn].substr(0,2);
				 			trNumArray.push(trTime);
				 			trNumArray.push(gTime);
				 		} else {
				 			trNumArray.push(trTime);
				 		}
				 	}
				 	trNumArray.sort();
				 	 for(var kh=0; kh<trNumArray.length; kh++){
				 		var tgrnum = 0;
				 		for(var kt=0;kt<gsparray.length;kt++){
				 			var gTime = gsparray[kt].substr(0,2);
				 			  if(gTime==trNumArray[kh]){
				 				tgrnum = 1;
				 			}  
				 		}
				 		 if(tgrnum==1){
				 			str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;color:red;">'+trNumArray[kh]+'</button>';
				 		} else{
				 			str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;">'+trNumArray[kh]+'</button>';
				 		} 
				 	
				 	} 
				 	 str += '</td >';
			 	 } else {
			 		str += '<td >';
			 		for(var kn=0; kn<sparray.length;kn++){
				 		var trTime = sparray[kn].substr(0,2); 
				 		str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;">'+trTime+'</button>';
				 	}
			 		str +='</td>';
			 	 }
				 if(downSatList[sn] != undefined){
					 trNumArray = [];
					 var dp = downSatList[sn].list;
					 var dparray = dp.split(" ");
					 
					 if(downSatList[sn].expList != undefined){
						  str += '<td >';
					 	 var gsp = downSatList[sn].expList;
						 var gsparray = gsp.split(" ");
					 	
						 for(var kn=0; kn<dparray.length;kn++){
					 		var trTime = dparray[kn].substr(0,2);
					 		if(gsparray[kn] != undefined){
					 			var gTime = gsparray[kn].substr(0,2);
					 			trNumArray.push(trTime);
					 			trNumArray.push(gTime);
					 		} else {
					 			trNumArray.push(trTime);
					 		}
					 	}
					 	trNumArray.sort();
					 	 for(var kh=0; kh<trNumArray.length; kh++){
					 		var tgrnum = 0;
					 		for(var kt=0;kt<gsparray.length;kt++){
					 			var gTime = gsparray[kt].substr(0,2);
					 			  if(gTime==trNumArray[kh]){
					 				tgrnum = 1;
					 			}  
					 		}
					 		 if(tgrnum==1){
					 			str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;color:red;">'+trNumArray[kh]+'</button>';
					 		} else{
					 			str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;">'+trNumArray[kh]+'</button>';
					 		} 
					 	
					 	} 
					 	 str += '</td >';
				 	 } else {
				 		str += '<td >';
				 		for(var kn=0; kn<dparray.length;kn++){
					 		var trTime = dparray[kn].substr(0,2); 
					 		str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;">'+trTime+'</button>';
					 	}
				 		str +='</td>';
				 	 }
				 } else {
					 str += '<td></td>';
				 }
				 str += '</tr>';
			 }
			 str += '</table>';
			 str += '</div>';
			 
			 str += '<div class="TrainTimediv" id="Sun" style="display:none;">';
			 str += '<table class="table table-striped">';
			 str += '<tr style="font-size:18px;font-weight:bold;"><th style="width:10%;text-align:center;">Time</th><th style="width:45%;">UpWay : '+result.upWay+'</th><th style="width:45%;">DownWay : '+result.downWay+'</th></tr>';
			 for(var sn=0; sn<upSunList.length; sn++){
				 var sp = upSunList[sn].list;
				 var sparray = sp.split(" ");
				 str += '<tr>';
				 str += '<td style="font-size:17px;text-align:center;color:black;">'+upSunList[sn].Idx+'</td>';
				 var trNumArray = new Array();
				  if(upSunList[sn].expList != undefined){
					  str += '<td >';
				 	 var gsp = upSunList[sn].expList;
					 var gsparray = gsp.split(" ");
				 	
					 for(var kn=0; kn<sparray.length;kn++){
				 		var trTime = sparray[kn].substr(0,2);
				 		if(gsparray[kn] != undefined){
				 			var gTime = gsparray[kn].substr(0,2);
				 			trNumArray.push(trTime);
				 			trNumArray.push(gTime);
				 		} else {
				 			trNumArray.push(trTime);
				 		}
				 	}
				 	trNumArray.sort();
				 	 for(var kh=0; kh<trNumArray.length; kh++){
				 		var tgrnum = 0;
				 		for(var kt=0;kt<gsparray.length;kt++){
				 			var gTime = gsparray[kt].substr(0,2);
				 			  if(gTime==trNumArray[kh]){
				 				tgrnum = 1;
				 			}  
				 		}
				 		 if(tgrnum==1){
				 			str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;color:red;">'+trNumArray[kh]+'</button>';
				 		} else{
				 			str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;">'+trNumArray[kh]+'</button>';
				 		} 
				 	
				 	} 
				 	 str += '</td >';
			 	 } else {
			 		str += '<td >';
			 		for(var kn=0; kn<sparray.length;kn++){
				 		var trTime = sparray[kn].substr(0,2); 
				 		str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;">'+trTime+'</button>';
				 	}
			 		str +='</td>';
			 	 }
				 
				 trNumArray = [];
				 if(downSunList[sn] != undefined){
					 var dp = downSunList[sn].list;
					 var dparray = dp.split(" ");
				
					 if(downSunList[sn].expList != undefined){
						  str += '<td >';
					 	 var gsp = downSunList[sn].expList;
						 var gsparray = gsp.split(" ");
					 	
						 for(var kn=0; kn<dparray.length;kn++){
					 		var trTime = dparray[kn].substr(0,2);
					 		if(gsparray[kn] != undefined){
					 			var gTime = gsparray[kn].substr(0,2);
					 			trNumArray.push(trTime);
					 			trNumArray.push(gTime);
					 		} else {
					 			trNumArray.push(trTime);
					 		}
					 	}
					 	trNumArray.sort();
					 	 for(var kh=0; kh<trNumArray.length; kh++){
					 		var tgrnum = 0;
					 		for(var kt=0;kt<gsparray.length;kt++){
					 			var gTime = gsparray[kt].substr(0,2);
					 			  if(gTime==trNumArray[kh]){
					 				tgrnum = 1;
					 			}  
					 		}
					 		 if(tgrnum==1){
					 			str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;color:red;">'+trNumArray[kh]+'</button>';
					 		} else{
					 			str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;">'+trNumArray[kh]+'</button>';
					 		} 
					 	
					 	} 
					 	 str += '</td >';
				 	 } else {
				 		str += '<td >';
				 		for(var kn=0; kn<dparray.length;kn++){
					 		var trTime = dparray[kn].substr(0,2); 
					 		str += '<button style="background:none;border:none;width:40px;margin-left:3px;font-size:16px;">'+trTime+'</button>';
					 	}
				 		str +='</td>';
				 	 }
				 } else {
					 str += '<td></td>';
				 }
				 str += '</tr>';
			 }
		 } 
		 str += '</table>';
		 str += '</div>';
		$('#modal-content').html(str);
		
		;
	}); 
}


//전철/버스 시간표 모달 닫기
function closeModal() {
	$('#getDirectionslModal').css('display','none');
}