<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chart Sample</title>
<style type="text/css">
/* 상단 바 */
.top {
   width: 100%;
   padding: 0;
   margin: 0;
   background-color: white;
   display: inline-block;
   min-width: 1300px;
    height: 62px;
}

.top_menu{
	display: inline-block;
	vertical-align: top;
	float: right ;
	width: 800px;;
}

body {
   margin: 0;
   padding: 0;
   background-color: #f2f2f2;
}

ul {
   list-style-type: none;
   margin: 0;
   padding: 0;
  
}

ul:after {
   content: '';
   display: block;
   clear: both;
}

li {
   float: left;
}

.main_menu{
   display: inline-block;
   color: black;
   padding: 20px 30px;
   text-decoration: none;
   font-weight: bold;
   font-size: 17px;
}

.main_menu:hover {
   background-color: #f1f1f1;
}


.logo {
   padding: 13px 30px;
  
  
}

.sub {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 128px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
    font-size: 15px;
    text-align: center;
}
.sub a{
	color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    
}

.sub a:hover {
     background-color: #f1f1f1;
}

.menu_a:hover .sub, .menu_b:hover .sub ,.menu_c:hover .sub,.menu_d:hover .sub,
.menu_e:hover .sub  {
    display: block;
}

.log_out{
	display:inline-block;
	text-decoration: none;
	color: gray;
	padding:10px 20px;
	line-height: 42px;
}

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
 margin-bottom: 40px;
 margin-left: 30px;
 font-size: 30px;
}
.search_btn, .list_btn{
	background-color: #01a1dd;
}
.graph_btn{
	background-color: #bf4040;
	margin-right: 0px;
}
.reset_btn {
	background-color: #b3b3b3;
}

select{
	width: 150px;
	height:40px;
	margin:10px 5px;
	font-size: 17px;
	padding: 5px;
}

input[type='button']{
	color: white;
	width: 100px;
	height: 40px;
	text-align:center;
	border:0;
	border-radius: 3px;
	font-size:18px;
	margin:10px;
	cursor: pointer;
	outline:none;
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
	
	setDateBox();
	
	$(".reset_btn").on("click", function() {
		setDateBox();
	});
	
	$(".list_btn").on("click", function() {
		location.href = "B_Sales";
	});
	
});//document ready end

function getData() {
	var params =  $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "getBChartData",
		dataType : "json",
		data : params,
		success : function(result) {
			makeChart(result.list);
		},
		error : function(request,status,error) {
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function makeChart() {
	$('#container').highcharts({
       
        title: {
            text: '월별 매출조회'
        },
        
        xAxis: {
        	 categories: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', 
		        		 '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', 
		        		 '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31']
        },
        labels: {
            items: [{
                html: '총매출 및 총지출',
                style: {
                    left: '50px',
                    top: '18px',
                    color: ( // theme
                        Highcharts.defaultOptions.title.style &&
                        Highcharts.defaultOptions.title.style.color
                    ) || 'black'
                }
            }]
        },
        series: [{
            type: 'column',
            name: 'Jane',
            data: [3, 2, 1, 3, 4, 3, 2, 1, 3, 4, 3, 2, 1, 3, 4, 3, 2, 1, 3, 4, 3, 2, 1, 3, 4, 3, 2, 3, 5, 7, 6]
        }, {
            type: 'column',
            name: 'John',
            data: [2, 3, 5, 7, 6, 2, 3, 5, 7, 6, 2, 3, 5, 7, 6, 2, 3, 5, 7, 6, 2, 3, 5, 7, 6, 3, 2, 3, 5, 7, 6]
        }, {
            type: 'spline',
            name: 'Average',
            data: [3, 2.67, 3, 6.33, 3.33, 3, 2.67, 3, 6.33, 3.33, 3, 2.67, 3, 6.33, 3.33, 3, 2.67, 3, 6.33, 3.33, 3, 2.67, 3, 6.33, 3.33, 3, 2.67, 3, 6.33, 3.33],
            marker: {
                lineWidth: 2,
                lineColor: Highcharts.getOptions().colors[3],
                fillColor: 'white'
            }
        }, {
            type: 'pie',
            name: 'Total consumption',
            data: [{
                name: 'Jane',
                y: 13,
                color: Highcharts.getOptions().colors[0] // Jane's color
            }, {
                name: 'John',
                y: 23,
                color: Highcharts.getOptions().colors[1] // John's color
            },],
            center: [100, 80],
            size: 100,
            showInLegend: false,
            dataLabels: {
                enabled: false
            }
        }]
    });
}


// select box 연도 , 월 표시
function setDateBox() {
  var dt = new Date();
  var year = "";
  var today_year = dt.getFullYear();
  var today_month = dt.getMonth() + 1;

  // 연도
  $("#year").append("<option value=''>년도</option>");

  // 올해 기준으로 -30년을 보여준다.
  for (var y = (today_year - 30); y <= (today_year); y++) {
	  if( y == today_year){
		  $("#year").append("<option value='" + y + "' selected>" + y + " 년" + "</option>");
	  } else {
		  $("#year").append("<option value='" + y + "'>" + y + " 년" + "</option>");
	  }
   
  }

  // 월 (1월부터 12월)
  var month;
  $("#month").append("<option value=''>월</option>");
  for (var i = 1; i <= 12; i++) {
	  if( i == today_month){
		  $("#month").append("<option value='" + i + "' selected>" + i + " 월" + "</option>");
	  } else{
		  $("#month").append("<option value='" + i + "'>" + i + " 월" + "</option>");
	  }
    
  }
  
}
</script>
</head>
<body>
<div class="top">
     <ul>
         <li>
         <a href="#">
         <img class="logo" alt="logo" src="resources/images/bb/logo.png" width="250px"></a>
         </li>
         
         <div class="top_menu">
         
    <div class="menu_a">
        	 <li>
         		<a class="main_menu" href="#">재고관리</a>
	        	 <div class="sub">
		        	 <a href="#">현재재고조회</a>
		             <a href="#">입고재고조회</a>
		             <a href="#">사용재고조회</a>
		             <a href="#">폐기조회</a>
	            </div>
             </li>
         </div>
         
         <div class="menu_b">
       		  <li>
         		<a class="main_menu" style="padding: 20px 40px;" href="#">주문관리 </a>
	          	<div class="sub">
	     			<a href="#">주문조회 및 환불</a>
	     			<a href="#">주문요청</a>
		            <a href="#">환불조회</a>
	            </div>
          	</li>
         </div>
         
          <div class="menu_c">
        	 <li>
				<a class="main_menu" href="#">매출조회</a>
             </li>
         </div>
        
          <div class="menu_d">
         	<li>
         		<a class="main_menu" href="#">공지사항</a>
	        </li>
          </div>
      
          <div class="menu_e">
           	<li>
               <a class="main_menu" href="#">마이페이지</a>
          	</li>
          </div>
          
           <a class="log_out" href="#">로그아웃</a>
      	</div><!-- top_munu end -->
      </ul>
 </div>  <!-- top end -->
 
 
<div class="content_area">
	<div class="content">
		<h1 >매출그래프</h1>
		<div class="sales_info">
			<form action="#" method="post" id="actionForm">
				<input type="button" class="reset_btn" value="당월" />
				<span><strong>연도</strong></span>
				<select name="year" id="year"></select>
				<span><strong>월</strong></span>
				<select name="month" id="month"></select>	
				<input type="button" class="search_btn" value="조회" />
			</form>
		</div>
		<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
		<input type="button" class="list_btn" value="목록형" />
	</div>
</div>
</body>
</html>