<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../jh/B_Menu.jsp">
	<c:param name="menuno" value="19"></c:param>
</c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점주문조회</title>
<style type="text/css">

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
 margin-bottom: 40px;
 font-size: 30px;
}
table {
    width: 100%;
    table-layout: fixed;
    background: #ffffff;
	margin: 10px 0;
	border-top: 2px solid #01a1dd;
	border-bottom: 2px solid #d9d9d9;
	
}
tbody td{
	cursor: pointer;
}
tr {
    display: table-row;
}
th{
	background: #e8e8e8;
    padding: 10px;
    border-bottom: 1px solid #ffffff;
    border-left: 1px solid #ffffff;
}
td{
	font-size:15px;
	padding:10px;
	border-top: 1px solid #eaeaea;
	border-left: 1px solid #eaeaea;
}

 td:first-child{
	border-left: none;
}
button{
	width:200px;
	height:40px;
}
.filter_area{
	text-align: right;
	margin-bottom: 10px;
}
[name=r]{
	margin-right: 10px;
	height: 20px;
	width: 30px;
	vertical-align: middle;
	cursor: pointer;
}

label{
	vertical-align: middle;
	cursor: pointer;
}
.search_btn{
	height: 40px;
	margin: 0 ;
	padding: 0;
	vertical-align: bottom;
}
select{
	font-size: 15px;	
	height: 40px;
	width : 100px;
}
.search_btn{
	color: white;
	width: 100px;
	border:0;
	border-radius: 3px;
	font-size:18px;
	cursor: pointer;
	background-color: #01a1dd;
	outline:none;
}
.start_date, .end_date{
	width: 150px;
	font-size: 15px;
	height: 36px;
}
button:focus{outline:none;}

/*검색영역*/
.search_info,.page_area, .page_btn{
	text-align: center;
}

.page_btn button{
	color: black;
	width: 40px;
	height: 40px;
	border:0;
	border-radius: 3px;
	font-size:18px;
	margin:40px 3px;
	box-shadow: 0px 2px 4px 0px rgba(0,0,0,0.2);
	cursor:pointer;
}

.page_btn button:hover{
	color: #01a1dd;
}
.page_btn button:focus{
	outline:none;
}

#search_filter{
	width : 120px;
	vertical-align: middle;
}

#search_input{
	height: 34px;
	vertical-align: middle;
	width : 280px;
	outline:none;
}
.page_btn .on{
	color: #01a1dd;
}
</style>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
var radioVal=0;
$(document).ready(function(){
	if("${param.search_filter}" != ""){
		$("#search_filter").val("${param.search_filter}");
	}
	
	if("${param.start_date}" != ""){
		$("#start_date").val($(".start_date").val());
		$("#end_date").val($(".end_date").val());
		history.replaceState({}, null, location.pathname);
	}else{
		$(".start_date").val(lastWeek());
		$(".end_date").val(today());
	}
	reloadList();
	
	$("#search_btn").on("click",function(){
		$("#search_old_txt").val($("#search_input").val());
		$("#start_date").val($(".start_date").val());
		$("#end_date").val($(".end_date").val());
		$("#page").val(1);
		reloadList();
	});
	$(".page_area").on("click", "button", function(){
		$("#search_input").val($("#search_old_txt").val());
		$("#page").val($(this).attr("page"));
		reloadList();
	});
	$("[name=r]").click(function(){ 
		if($('input[name="r"]:checked')){
			$("#rCk").val($(this).val());
		}
		$(".search_input").val($("#Old_search_input").val());
		$("#page").val(1);
		reloadList();
		});
	$("tbody").on("click","tr",function(){
		$("#oNo").val($(this).attr("ord_no"));
		$("#search_input").val($("#search_old_txt").val());
		$("#actionForm").attr("action","B_Ord_dtl");
		$("#actionForm").submit();
	}); //tr 클릭 시에는 재고 상세조회 페이지로 이동
}); //ready end

function reloadList(){
	var params = $("#actionForm").serialize();
	$.ajax({
		url : "B_Ord_Lists",
		type : "post",  
		dataType :"json",
		data : params,
		success : function(res){
			drawList(res.list);
			drawPaging(res.pb);
		},
		error : function(request,status,error){
			console.log(error);
		}
	});
}
function today() { //오늘날짜 구하기
	
	  var d = new Date();
	  return splitdate(d);
}

function lastWeek() { //일주일전 날짜 구하기
	  var d = new Date();
	  var dayOfMonth = d.getDate();
	  d.setDate(dayOfMonth - 7);
	  return splitdate(d);
}

function splitdate(resdate){
	
	var dd = resdate.getDate(); // 현재 기준 하루 전까지 min으로 잡을 예정이므로
	var mm = resdate.getMonth()+1;
	var yyyy = resdate.getFullYear();
		if(dd < 10){
			dd = "0" + dd;
		}
		if(mm < 10){
			mm = "0" + mm;
		} //1월인 경우 01로 표기
		
	return yyyy+"-"+mm+"-"+dd;
}
function drawList(list){
	var html ="";
	for(var d of list){
			html += "<tr ord_no = \""+d.ORD_NO+"\">";
			html += "<td>"+d.ORD_NO+"</td>";
			html += "<td>"+d.ENROLL_DATE+"</td>";
			html += "<td>"+d.PRICE+"원</td>";
			html += "<td>"+d.CODE_NAME+"</td>";
			html += "</tr>";
	}
	$("tbody").html(html);
}
function drawPaging(pb){
	var html = "";
                                    
	html += "<button page = \"1\" style=\"background-color: white\"><<</button>";
	if($("#page").val()=="1"){
		html += "<button page = \"1\" style=\"background-color: white\"><</button>";
	}else{
		html += "<button page = \""+ ($("#page").val()-1) + "\" style=\"background-color: white\"><</button>";
	}

	for(var i = pb.startPcount; i <= pb.endPcount; i++){
		if($("#page").val() == i){
			html += "<button class = \"on\" page = \""+ i +"\" style=\"background-color: white\">"+ i +"</button>";	
		}else{
			html += "<button  page = \""+ i +"\" style=\"background-color: white\">"+ i +"</button>";	
		}
	
	}

	if($("#page").val() == pb.maxPcount){
		html += "<button page = \""+ pb.maxPcount +"\" style=\"background-color: white\">></button>";
	}else{
		html += "<button page = \""+ ($("#page").val()*1+1) +"\" style=\"background-color: white\">></button>";;
	}



	html += "<button page = \""+ pb.maxPcount +"\" style=\"background-color: white\">>></button>";

	$(".page_btn").html(html); //
}
</script>
</head>
<body>

<div class="content_area">
<div class="content">
<h1>주문조회</h1>
<div class="filter_area">
			<input type = "radio" id="r1" name="r" value="0" checked="checked"/><label id="l1" for="r1">전체</label>
			<input type = "radio" id="r2" name="r" value="1"/><label id="l2" for="r2">주문</label>
			<input type = "radio" id="r3" name="r"	value="2"/><label id="l3" for="r3" style="margin-right: 30px">환불</label>
<input class="start_date" type = "date" value="${param.start_date}"/>
<input class="end_date" type = "date" value="${param.end_date}"/>
</div>
<table cellspacing="0">
	<colgroup>
		<col width="25%" />
		<col width="25%" />
		<col width="25%" />
		<col width="25%" />
	</colgroup>
	<thead>
	<tr>
		<th scope=col style= "border-left: none;" scope=col>주문번호</th>
		<th scope=col>주문날짜</th>
		<th scope=col>주문금액</th>
		<th scope=col>처리상태</th>
	</tr>
	</thead>
	<tbody></tbody>
</table>
<div class="search_area" style = "margin-top : 30px;">
	<div class="search_info">
		<form action = "#" id = "actionForm" method = "post">
			<input type = "hidden" id = "oNo" name = "oNo"/>
			<input type = "hidden" id = "bNo" name = "bNo" value="${sBRCHNo}"/>
			<input type = "hidden" id = "page" name = "page" value = "${page}"/>
			<select id ="search_filter" name="search_filter">
				<option value="0" selected="selected">주문번호</option>
			</select>
			<input type="text" name="search_input" id="search_input" value="${param.search_input}"/>
			<input type="hidden" name="search_old_txt" id="search_old_txt" value="${param.search_input}"/>
			<input type="button" class="search_btn" id="search_btn" value="검색"/>
			<input type="hidden" name="rCk" id="rCk" value="0"/>
			
			<input type = "hidden" id = "start_date" name = "start_date"/>
			<input type = "hidden" id = "end_date" name = "end_date"/>
		</form>
	</div>
</div>
<div class="page_area">
		<div class="page_btn"></div>
	</div>
</div>
</div>
</body>
</html>