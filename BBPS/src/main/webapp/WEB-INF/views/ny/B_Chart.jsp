<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../jh/B_Menu.jsp">
	<c:param name="menuno" value="22"></c:param>
</c:import>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지점 매출차트</title>
<style type="text/css">
/
/* 미들 부분 */
.content_area{
	width: 1250px;
	height: 900px;
	margin: 0 auto;
	margin-top: 50px;
}

.content{
	max-width: 1250px;
    min-width: 700px;
    margin-left: 30px;
    width: 1250px;
}

h1 {
 width: 90%;
 display: inline-block;
 vertical-align: top;
 margin-bottom: 30px;
 font-size: 30px;
 float: left;
}
.search_btn, .list_btn{
	width: 100px;
	background-color: #01a1dd;
}
.list_btn{
	margin: 0 auto;
}
.graph_btn{
    width: 100px;
	background-color: #bf4040;
	margin-right: 0px;
}
.reset_btn {
    width: 100px;
	background-color: #b3b3b3;
}

select{
	width: 115px;
	height:40px;
	margin:10px 3px;
	font-size: 17px;
	padding: 5px;
}

input[type='button']{
	color: white;
	height: 40px;
	text-align:center;
	border:0;
	border-radius: 3px;
	font-size:18px;
	margin: 10px 5px;
	cursor: pointer;
	outline:none;
}


.info{
	display:inline-block;
	vertical-align: top;
	float: right;
}

.daily{
	display: block;
}
.monthly{
	display: none;
}
.cate{
	display: none;
}
.menu{
	display: none;
}
.select_type{
	display:inline-block;
	vertical-align: top;
	float: left;
}
.cate_btn{
	width: 115px;
	background-color: #df9f9f;
}

.menu_btn{
	width: 100px;
	background-color: #df9f9f;
}
.daily_btn, .monthly_btn {
	width: 90px;
	background-color: #df9f9f;
}

input:focus{
	outline: none; 
}

/*팝업*/
.bg{
	display: inline-block;
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0px;
	left: 0px;
	background-color: #000000;
	z-index: 200;
	opacity: 0.6; /* 0.0(투명)~1.0(불투명)*/
}
.popup_area {
	display: inline-block;
	width: 400px;
	height: 240px;
	background-color: #ffffff;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	position: absolute;
	top: calc(50% - 120px); /*높이의 반만큼 뺌*/
	left: calc(50% - 200px); /*너비의 반만큼 뺌*/
	z-index: 300;
}
.popup_head{
	height: 30px;
	font-size: 16pt;
	background-color: #01a1dd;
	color:white;
	padding:10px;
	font-weight:bold;
}
.popup_btn{
	text-align:center;
}
.popup_btn input[type='button']{
	color: white;
	width: 150px;
	height: 40px;
	text-align:center;
	border:0;
	border-radius: 3px;
	font-size:18px;
	margin:10px;
	cursor: pointer;
}
.popup_content{
	margin-bottom:80px;
	margin-top:20px;
	margin-left:20px;
	text-align:center;
	font-size:18px;
	color: black
}
input[type='button']:focus{outline:none;}

.popup_head .close_btn{
	width: 25px;
	height: 25px;
	background-color: #01a1dd;
	float: right;
	margin: 0px;
	font-size: 18px;
	text-align: center;
	color: #ffffff;
	border: none;
}
</style>
<!-- jQuery Script -->
<script type="text/javascript" 
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
		
<!-- highcharts Script -->
<script src="resources/script/highcharts/highcharts.js"></script>
<script src="resources/script/highcharts/modules/exporting.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	viewChange(".daily_btn");
	
	$(".reset_btn").on("click", function() {
		setDateBox();
	});
	
	$(".list_btn").on("click", function() {
		location.href = "B_Sales";
	});
	
	$(".select_type").on("click", "input", function() {
		viewChange(this);
		
	});
	
	$("form").on("click", ".search_btn", function() {
		getData(this);
	});
	
	
});//document ready end

function viewChange(btn) {
	
	$(".daily_btn").css("background-color","#df9f9f");
	$(".monthly_btn").css("background-color","#df9f9f");
	$(".cate_btn").css("background-color","#df9f9f");
	$(".menu_btn").css("background-color","#df9f9f");
	
	if($(btn).css("background-color") != "#bf4040") {
		$(btn).css("background-color","#bf4040");
		$(".info div").css("display","none");
		if($(btn).attr("class") == "daily_btn"){
			$(".info .daily").css("display","block");
		} else if($(btn).attr("class") == "monthly_btn"){
			$(".info .monthly").css("display","block");
		} else if($(btn).attr("class") == "cate_btn"){
			$(".info .cate").css("display","block");
		} else {
			$(".info .menu").css("display","block");
		}
	}
	
	setDateBox();
	getCateList();
	
	if($(btn).attr("class") == "daily_btn"){
		getData("#actionFormDaily .search_btn");
	} else if($(btn).attr("class") == "monthly_btn") {
		getData("#actionFormMonthly .search_btn");
	} else if($(btn).attr("class") == "cate_btn"){
		getData("#actionFormCate .search_btn");
	} else {
		getData("#actionFormMenu .search_btn");
	}
	
	
}

function getData(btn) {
	
	var params =  $(btn).parent().serialize();
		
	var urlName = "";
	if($(btn).parent().attr("id") == "actionFormDaily") {
		urlName = "getDailyChartData";
	}
	else if($(btn).parent().attr("id") == "actionFormMonthly") {
		urlName = "getMonthlyChartData";
	}
	else if($(btn).parent().attr("id") == "actionFormCate") {
		urlName = "getMenuChartData";
	}
	else{
		urlName = "getMenuChartDataDetail";		
	}
	
	console.log(urlName);
	
	$.ajax({
		type : "post",
		url : urlName,
		dataType : "json",
		data : params,
		success : function(result) {
			
			console.log(result.status);
			
			if(result.status == "null"){
				makePopup("결과", "해당 조건의 조회 결과가 없습니다.")
			}
			else {
				if(urlName == "getDailyChartData") {
					makeDailyChart(result.list, result.day);
				} 
				else if(urlName == "getMonthlyChartData"){
					makeMonthlyChart(result.list, result.month);
				}
				else if(urlName == "getMenuChartData"){
					makeMenuChart(result.list, result.month);
				} 
				else{
					makeMenuChartDetail(result.list, result.color, result.name);
				}
			}
			
			
		},
		error : function(request,status,error) {
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function makeDailyChart(list, day) {
	console.log(list);
	
	$('#container').highcharts({
       
        title: {
            text: ''
        },
        
       	colors : ['#00cfd6','#ffad99', '#ffad33'
       		
       	],
        xAxis: {
        	 categories: day,
        	 
        },
        yAxis: {
            title: {
                text: '금액'
            },
            labels: {
                format: '{value} 원'
            },
            
        },
        series: list
    });
}

function makeMonthlyChart(list, month) {
	
	$('#container').highcharts({
       
        title: {
            text: ''
        },
        
       	colors : ['#00cfd6','#ffad99', '#ffad33'
       		
       	],
        xAxis: {
        	 categories: month,
        	
        },
        yAxis: {
            title: {
                text: '금액'
            },
            labels: {
                format: '{value} 원'
            }
            
        },
        series: list
    });
}

function makeMenuChart(list, month) {
	
	$('#container').highcharts({
       
        title: {
            text: ''
        },
        
       	colors : ['#66B032','#FCCC1A', '#347C98', '#FC600A'
       		
       	],
        xAxis: {
        	 categories: month,
        	 
        },
        yAxis: {
            title: {
                text: '수량'
            }
            
        },
        series: list
    });
}

function makeMenuChartDetail(list, color, name) {
	
		$('#container').highcharts({
		       
	        title: {
	            text: ''
	        },
	        
	       	colors : color,
	       	
	        xAxis: {
	        	 categories: ['메뉴명'],
	        	
	       		 title: name
	        },
	        yAxis: {
	            title: {
	                text: '수량'
	            }
	            
	        },
	        series: list
	    });
	
}

// select box 연도 , 월 표시
function setDateBox() {
 
  var dt = new Date();
  var year = "";
  var today_year = dt.getFullYear();
  var today_month = dt.getMonth() + 1;

  // 올해 기준으로 -30년을 보여준다.
  for (var y = (today_year - 30); y <= (today_year); y++) {
	  if( y == today_year){
		  $(".daily #year").append("<option value='" + y + "' selected>" + y + " 년" + "</option>");
		  $(".monthly #year").append("<option value='" + y + "' selected>" + y + " 년" + "</option>");
		  $(".cate #year").append("<option value='" + y + "' selected>" + y + " 년" + "</option>");
		  $(".menu #year").append("<option value='" + y + "' selected>" + y + " 년" + "</option>");
	  } else {
		  $(".daily #year").append("<option value='" + y + "'>" + y + " 년" + "</option>");
		  $(".monthly #year").append("<option value='" + y + "' selected>" + y + " 년" + "</option>");
		  $(".cate #year").append("<option value='" + y + "' selected>" + y + " 년" + "</option>");
		  $(".menu #year").append("<option value='" + y + "' selected>" + y + " 년" + "</option>");
	  }
   
  }

  // 월 (1월부터 12월)
  var month;
  
  for (var i = 1; i <= 9; i++) {
	  if( i == today_month){
		  $(".daily #month").append("<option value='0" + i + "' selected>" + i + " 월" + "</option>");
		  $(".menu #month").append("<option value='0" + i + "' selected>" + i + " 월" + "</option>");
	  } else{
		  $(".daily #month").append("<option value='0" + i + "'>" + i + " 월" + "</option>");
		  $(".menu #month").append("<option value='0" + i + "'>" + i + " 월" + "</option>");
	  } 
  }
  for (var i = 10; i <= 12; i++) {
	  if( i == today_month){
		  $(".daily #month").append("<option value='" + i + "' selected>" + i + " 월" + "</option>");
		  $(".menu #month").append("<option value='" + i + "' selected>" + i + " 월" + "</option>");
	  } else{
		  $(".daily #month").append("<option value='" + i + "'>" + i + " 월" + "</option>");
		  $(".menu #month").append("<option value='" + i + "'>" + i + " 월" + "</option>");
	  } 
  }
  
}

//메뉴카테고리 리스트
function getCateList(){
	
	$.ajax({
		url: "getMenuCate",
		type: "post",
		dataType: "json",
		success: function(res) {
			
			console.log(res.list);
			
			var html = "";
			
			for(d of res.list) {
				if(d.CATE_NO ==  "0"){
					html += "<option value=" + d.CATE_NO+ " selected>" + d.CATE_NAME + "</option>";
				}
				else{
					html += "<option value=" + d.CATE_NO+ ">" + d.CATE_NAME + "</option>";
				}
			}

			$("#actionFormMenu #menuCate").html(html);
		
		},
		error: function(request, status, error) {
			console.log(error);
		}
		
	}); //ajax end
	 
}

//팝업
function makePopup(title, contents) {
	
	var html ="";
	html+= "<div class=\"bg\"></div>";	
	html+= "<div class=\"popup_area\">";	
	html+= "<div class=\"popup_head\">"+ title +"";	
	html+= 		"<input type=\"button\" value=\"X\" class=\"close_btn\">";	
	html+= "</div>";	
	html+= "<div class=\"popup_content\">"+ contents +"</div>";	
	html+= 		"<div class=\"popup_btn\">";	
	html+= 			"<input type=\"button\" value=\"확인\"  class=\"confirm_btn\" style=\"background-color: rgb(41, 128, 185)\">";	
	html+= 	 	"</div>";
	html+= "</div>";	
	
	$("body").prepend(html);
	$(".popup_area").hide().show();
	
	$(".close_btn").on("click",function(){
		closePopup();		
	});
	$(".confirm_btn").on("click",function(){
		closePopup();
	});
	
}

function closePopup() {
	$(".bg, .popup_area").fadeOut(function(){
		$(".bg, .popup_area").remove();
	}); //popup_btn end
}	
</script>
</head>
<body>
<div class="content_area">
	<div class="content">
		<h1 >매출그래프</h1>
		<div class="select_type">
			<input type="button" class="daily_btn" value="일별"/>
			<input type="button" class="monthly_btn" value="월별"/>
			<input type="button" class="cate_btn" value="카테고리별 "/>
			<input type="button" class="menu_btn" value="메뉴별 "/>
		</div>
		<div class="info">
			<div class="daily">
				<form action="#" method="post" id="actionFormDaily">
					<input type="button" class="reset_btn" value="당월" />
					<select name="year" id="year"></select>
					<select name="month" id="month"></select>	
					<input type="button" class="search_btn" value="조회" />
					<input type="hidden" id="brchNo" name="brchNo" value="${sBRCHNo}"/>
				</form>
			</div>
			<div class="monthly">
				<form action="#" method="post" id="actionFormMonthly">
					<input type="button" class="reset_btn" value="올해" />
					<select name="year" id="year"></select>	
					<input type="button" class="search_btn" value="조회" />
					<input type="hidden" id="brchNo" name="brchNo" value="${sBRCHNo}"/>
				</form>
			</div>
			<div class="cate">
				<form action="#" method="post" id="actionFormCate">
					<input type="button" class="reset_btn" value="올해" />
					<select name="year" id="year"></select>	
					<input type="button" class="search_btn" value="조회" />
					<input type="hidden" id="brchNo" name="brchNo" value="${sBRCHNo}"/>
				</form>
			</div>
			<div class="menu">
				<form action="#" method="post" id="actionFormMenu">
					<input type="button" class="reset_btn" value="당월" />
					<select name="year" id="year"></select>	
					<select name="month" id="month"></select>
					<select name="menuCate" id="menuCate"></select>	
					<input type="button" class="search_btn" value="조회" />
					<input type="hidden" id="brchNo" name="brchNo" value="${sBRCHNo}"/>
				</form>
			</div>
		</div>
		<div id="container" style="min-width: 400px; height: 400px; margin-bottom: 160px"></div>
		<input type="button" class="list_btn" value="목록" />
	</div>
</div>
</body>
</html>