<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../jh/H_Menu.jsp">
	<c:param name="menuno" value="2"></c:param>
</c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
.filter_area{
	text-align: right;
	margin-bottom: 10px;
}
.search_btn{
	
}
select{
	font-size: 15px;	
	height: 40px;
	width : 100px;
}
.add_btn{
	height: 40px;
	padding: 0;
	vertical-align: bottom;
}
h1 {
 margin-bottom: 40px;
 font-size: 30px;
}
table {
    width: 100%;
    table-layout: fixed;
    background: #ffffff;
	margin: 10px 0 0 1px;
	border-top: 2px solid #3498db;
	border-bottom: 2px solid #d9d9d9;
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
.search_btn{
	color: white;
	width: 100px;
	height: 40px;
	text-align:center;
	border:0;
	border-radius: 3px;
	font-size:18px;
	margin:10px;
	cursor: pointer;
	background-color: #01a1dd;
	outline:none;
	vertical-align: middle;
}
.search_info,.page_area, .page_btn{
	text-align: center;
}
.page_area, .page_btn{
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
}
.page_btn button:hover{
	color: #01a1dd;
}

.page_btn button:focus{
	outline:none;
}
.search_filter{
	width : 120px;
	vertical-align: middle;
}

.search_input{
	height: 34px;
	vertical-align: middle;
	width : 280px;
	outline:none;
}

.page_btn button{
	background-color: white;
}

.on{
	background-color: blue;
	font-weight: bold;
}
.start_date, .end_date{
	width: 150px;
	font-size: 15px;
	height: 36px;
}
</style>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	
	if("${param.search_filter}" != ""){
		$("#search_filter").val("${param.search_filter}");
	}
	
	if("${param.cate}" != ""){
		$(".cate").val("${param.cate}");
	}
	
	reloadList();
	
	$(".cate").change(function(){
		$("#cate").val($(".cate").val());
		$(".search_input").val($("#Old_search_input").val());
		$("#page").val(1);
 		reloadList();
 	});
	
	$(".search_btn").on("click",function(){
		$("#cate").val($(".cate").val());
		$("#start_date").val($(".start_date").val());
		$("#end_date").val($(".end_date").val());
		$("#page").val(1);
		console.log($("#actionForm").serialize());
		reloadList();	
	});
	
	$(".top_menu").on("click","a",function(){
		$(".top_menu a").attr("style","color: black");
		$(this).css("color", "#01a1dd");
		$(this).parent().parent().children(1).css("color", "#01a1dd");
	});
	$(".sub").hover(function(){
		$("li").css("background-color","white");
		$(this).parent("li").css("background-color","#f1f1f1");
	
	},function(){
			$("li").css("background-color","white");
	});
	
	$(".page_btn").on("click","button",function(){
		$("#page").val($(this).attr("page"));
		$(".search_input").val($("#Old_search_input").val());
		reloadList();
	});
	
	$(".start_date").val(lastWeek());
	$(".end_date").val(today());
}); //ready end

function reloadList(){
	var params = $("#actionForm").serialize();
	
	$.ajax({
		url : "Stock_Discard_Lists",
		type : "post",  
		dataType :"json",
		data : params,
		success : function(res){
			drawstockdiscardList(res.list,res.result);
			drawdiscardPaging(res.pb);
		},
		error : function(request,status,error){
			console.log(error);
		}
	});
}

function drawstockdiscardList(list,result){
	var html ="";
	
	if(result == 0){ //결과 행이 존재하지 않는 경우
		html += "<tr>";
		html += "<td colspan = \"7\" style = \"text-align: center;\">검색조건에 맞는 폐기품목이 존재하지 않습니다.</td>";
		html += "</tr>";	
	} else if (result > 0){ //결과 행이 존재하는 경우 
		for(var d of list){
			html += "<tr>";
			html += "<td>"+d.CATE_NAME+"</a></td>";
			html += "<td>"+d.ITEM_NO+"</a></td>";
			html += "<td>"+d.ITEM_NAME+"</td>";
			html += "<td>"+d.CNT+"</td>";
			html += "<td>"+d.EXPIRY_DATE+"</td>";
			if(d.NOTE != null){
				html += "<td>"+d.NOTE+"</td>";
			}else{
				html += "<td></td>";
			}
			html += "<td>"+d.ENROLL_DATE+"</td>";
			html += "</tr>";	
		}
		
	}
	
	$("tbody").html(html);
}

function drawdiscardPaging(pb){
	var html = "";
	                                    
	html += "<button page = \"1\"><<</button>";
	if($("#page").val()=="1"){
		html += "<button page = \"1\"><</button>";
	}else{
		html += "<button page = \""+ ($("#page").val()-1) + "\" ><</button>";
		
	}
	
	for(var i = pb.startPcount; i <= pb.endPcount; i++){
		if($("#page").val() == i){ //현재 페이지의 값이랑 같을 때
			html += "<button class = \"on\" page = \""+ i +"\" >"+ i +"</button>";	
		}else{
			html += "<button  page = \""+ i +"\" >"+ i +"</button>";	
		}
		
	}
	
	if($("#page").val() == pb.maxPcount){
		html += "<button page = \""+ pb.maxPcount +"\" >></button>";
	}else{
		html += "<button page = \""+ ($("#page").val()*1+1) +"\" >></button>";/* -는 알아서 숫자 빠지는데 더하기는 문자열 처리가 됨  그래서 *1 해줘야됨*/
	}
	
	
	
	html += "<button page = \""+ pb.maxPcount +"\" >>></button>";
	
	$(".page_btn").html(html);
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

</script>
</head>
<body>
<div class="top"></div>
<div class="content_area">
<div class="content">
<h1>폐기 목록</h1>
<form action = "#" id = "filter_Form" method = "post">
<div class="filter_area">
			<select class= "cate">
               <option selected="selected" value = "">전체</option>
                  <c:forEach items="${catelist}" var = "d">
                   <option value="${d.CATE_NO}">
                   <c:out value="${d.CATE_NAME}"/> </option>
                  </c:forEach>
            </select>
			<input type = "date" name = "start_date"  class="start_date" />
			<input type = "date" name = "end_date"  class="end_date" />
		</div>
</form>
<div class = "Discard_List">
<table cellspacing="0">
	<colgroup>
	<col width = "10%">
	<col width = "10%">
	<col width = "20%">
	<col width = "10%">
	<col width = "15%">
	<col width = "20%">
	<col width = "15%">
	</colgroup>
	<thead>
	<tr>
		<th scope = "col" style="border-left: none;">카테고리</th>
		<th scope = "col">품목코드</th>
		<th scope = "col">품목명</th>
		<th scope = "col">수량</th>
		<th scope = "col">유통기한</th>
		<th scope = "col">비고</th>
		<th scope = "col">폐기날짜</th>
	</tr>
	</thead>
	<tbody></tbody>
</table>
</div>
<div class="search_area" style = "margin-top : 30px;">
		<div class="search_info">
		<form action = "#" id = "actionForm" method = "post">
			<input type = "hidden" id = "Old_search_input" name = "Old_search_input" value ="${param.search_input}" />
			<input type = "hidden" id = "page" name = "page" value = "${page}"/>
		<select id="search_filter" name = "search_filter">
				<option value="0" selected="selected">품목코드</option>
				<option value="1">품목명</option>
			</select>
			<input type="text" class="search_input" name = "search_input" value = "${param.search_input}"/>
			<input type= "button" class="search_btn" value = "검색"/>
			<input type = "hidden" id = "cate" name = "cate"/>
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