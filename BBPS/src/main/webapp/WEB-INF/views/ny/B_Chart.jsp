<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chart Sample</title>
<style type="text/css">
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

input[type='date'] hover {
    cursor: pointer;
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
	getData();
	
	$(".list_btn").on("click", function() {
		loction.href="B_Sales";
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

function makeChart(list) {
	$('#container').highcharts.chart('container', {
	    title: {
	        text: 'Combination chart'
	    },
	    xAxis: {
	        categories: ['Apples', 'Oranges', 'Pears', 'Bananas', 'Plums']
	    },
	    labels: {
	        items: [{
	            html: 'Total fruit consumption',
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
	        data: [3, 2, 1, 3, 4]
	    }, {
	        type: 'column',
	        name: 'John',
	        data: [2, 3, 5, 7, 6]
	    }, {
	        type: 'column',
	        name: 'Joe',
	        data: [4, 3, 3, 9, 0]
	    }, {
	        type: 'spline',
	        name: 'Average',
	        data: [3, 2.67, 3, 6.33, 3.33],
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
	        }, {
	            name: 'Joe',
	            y: 19,
	            color: Highcharts.getOptions().colors[2] // Joe's color
	        }],
	        center: [100, 80],
	        size: 100,
	        showInLegend: false,
	        dataLabels: {
	            enabled: false
	        }
	    }]
	});
}
</script>
</head>
<body>
<div class="content_area">
	<div class="content">
		<h1 >매출그래프</h1>
		<div class="sales_info">
			<form action="#" method="post" id="actionForm">
				<input type="button" class="reset_btn" value="초기화" />
				<span>시작일</span>
				<input type = "date" id="start_date" name="start_date" value="${param.start_date}" />
				<span>종료일</span>
				<input type = "date" id="end_date" name="end_date" value="${param.end_date}" />
				<input type="button" class="search_btn" value="검색" />
			</form>
		</div>
		<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
		<input type="button" class="list_btn" value="목록형" />
	</div>
</div>
</body>
</html>