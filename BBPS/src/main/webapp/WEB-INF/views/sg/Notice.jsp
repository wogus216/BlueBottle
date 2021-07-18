<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset= "UTF-8">

<title>본사공지사항리스트</title>
<style type="text/css">
/* 상단 바 */
.top {
   width: 100%;
   padding: 0;
   margin: 0;
   background-color: white;
   
   display: inline-block;
   min-width: 1820px;
   height: 62px;
}

.top_menu{
	display: inline-block;
	vertical-align: top;
	float: right ;
	width: 1500px;
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
   height: 62px;
}

.main_menu{
   display: inline-block;
   color: black;
   padding: 20px 30px;
   text-decoration: none;
   font-weight: bold;
   font-size: 17px;
}

.menu_f li .sub {
	width: 162px;
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

.log_out{
	display:inline-block;
	text-decoration: none;
	color: gray;
	padding:10px 20px;
	line-height: 42px;
}

.sub a:hover {
     background-color: #f1f1f1;
}

.menu_a:hover .sub, .menu_b:hover .sub ,.menu_c:hover .sub,.menu_d:hover .sub,
.menu_e:hover .sub,.menu_f:hover .sub, .menu_g:hover .sub  {
    display: block;
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
/* 품목등록 */

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
	text-align: center;
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
	cursor: pointer;
}

 td:first-child{
	border-left: none;
}
input{
	width:200px;
	height:40px;
}

.input_btn_area{
display: inline-block;
text-align: left;
}

.filter_area{
	display : inline-block;
	float : right;
	text-align: right;
	margin-bottom: 20px;
}
[name=r]{
	margin: 0;
	height: 20px;
	width: 30px;
	vertical-align: middle;
}
label{
	vertical-align: middle;
}
.search_btn{
display : inline-block;
	height: 40px;
	margin: 0 ; 	
	padding: 0;
	vertical-align: bottom;
}

.input_btn{
	display : inline-block;
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

.start_date, .end_date{
	width: 150px;
	font-size: 15px;
	height: 36px;
}
/* 일반버튼 */
input[type='button']{
	display : inline-block;
	color: white;
	width: 100px;
	height: 40px;
	text-align:center;
	border:0;
	border-radius: 3px;
	font-size:18px;
	margin : 0px 0px 0px 10px;
	cursor: pointer;
	background-color: #01a1dd;
	outline:none;
}
/* 검색 과 페이지 */
.search_area, .page_btn{
	text-align: center;
}
.page_btn button{
	background-color : white;
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
</style>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" 
		src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if("${param.searchGbn}" != ""){
		$("#searchGbn").val("${param.searchGbn}");
	}
	reloadList();
	
	$("#searchBtn").on("click",function(){
		$("#page").val(1);
		$("#searchOldTxt").val($("#searchTxt").val());
		reloadList();
	});
	
	$(".page_btn").on("click","button",function(){
		$("#page").val($(this).attr("page"));
		console.log($(this).attr("page"));
		$("#searchTxt").val($("#searchOldTxt").val());
		reloadList();
	});
	
	$("#writeBtn").on("click", function () {
		$("#searchTxt").val($("#searchOldTxt").val());
		//location.href = "Notice_Write";
		$("#actionForm").attr("action", "Notice_Write");
		$("#actionForm").submit();
	});
	
	$(".list_wrap tbody").on("click","tr", function () {
		$("#nNo").val($(this).attr("nno"));
		
		$("#actionForm").attr("action", "Notice_Detail");
		$("#actionForm").submit();
	});
	
	
}); //ready end

function reloadList() {
	var params = $("#actionForm").serialize(); //name이 있는 것들만 전송
	
	$.ajax({
		url:"Notices", //접속주소
		type:"post", //전송방식 : get, post
		dataType:"json",//받아올데이터형식
		data:params, //보낼 데이터(문자열 형태)
		success : function (res) {//성공 시 다음함수 실행
			drawList(res.list);
			drawPaging(res.pb);
		},
		error : function (request, status, error) { //실패 시 다음함수 실행
			console.log(error);
		}
	});
}
function drawList(list) {
	var html = "";
	
	for(var d of list){
		html += "<tr nno=\"" + d.TXT_NO + "\">";
		html += "<td>" + d.TXT_NO+ "</td>";
		html += "<td>" + d.TITLE + "</td>";
		html += "<td>" + d.S_DT + "</td>";
		html += "<td>" + d.USER_NAME + "</td>";
		html += "</tr>";
		
		
	}
	
	$("tbody").html(html);
}

function drawPaging(pb) {
	var html="";
	//처음
	html += "<button page=\"1\"><<</button>";
	
	//이전페이지
	if($("#page").val() == "1"){
		html += "<button page=\"1\"><</button>";
	} else {
		html += "<button page=\"" + ($("#page").val() -1) + "\"><</button>";
	}
	//처음페이지
	for(var i = pb.startPcount; i<=pb.endPcount; i++){
		if($("#page").val() == i){
			html += "<button page=\"" + i + "\"><b>" + i + "</b></button>";		
			} 
		else {
			html += "<button page=\"" + i + "\">" + i + "</button>";
		}
	}
	
	if($("#page").val() == pb.maxPCount){
		html += "<button page=\"" + pb.maxPCount + "\">></button>";
	} else {
		html += "<button page=\"" + ($("#page").val() * 1 + 1) + "\">></button>";
	}
	
	html += "<button page=\"" + pb.maxPCount + "\">>></button>";
	
	$(".page_btn").html(html);
}


</script>
</head>
<body>
<!-- 상단 -->
  <div class="top">
   </div>


<!--컨텐츠 -->
<div class="content_area">
<div class="content">
<h1>공지사항</h1>
<div class="input_btn_area">
<input type="button" value="작성" id="writeBtn" class="input_btn"/>
</div>
	
	<div class="filter_area">
			<select class="cate">
				<option value="0" selected="selected">전체</option>
				<option value="1">이벤트</option>
				<option value="2">주문관련</option>
				<option value="3">재고관련</option>
				<option value="4">시스템</option>
				<option value="4">기타</option>
			</select>
			<input type = "date" value="2021-01-01" class="start_date" />
			<input type = "date" value="2021-01-01" class="end_date"/>
			<input type="button" value="검색" id="Date_searchBtn" class="search_btn"/>
		</div>
		
<div class="list_wrap">
<table>
	<colgroup>
		<col width="15%">
		<col width="45%">
		<col width="20%">
		<col width="20%">
	</colgroup>
	<thead>
		<tr>
			<th>NO.</th>
			<th>제목</th>
			<th>날짜</th>
			<th>작성자</th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
</div>
<form action="#" id="actionForm" method="post">
<div class="search_area" style = "margin-top : 30px;">
	<input type="hidden" id="nNo" name="nNo"/>
	<input type="hidden" id="page" name="page" value="${page}">
			<select id="searchGbn" name="searchGbn" class="search_filter">
				<option value="0" selected="selected">제목+내용</option>
				<option value="1">제목</option>
				<option value="2">내용</option>
				<option value="3">작성자</option>
			</select>
			<input type="hidden" id="searchOldTxt" value="${param.searchTxt}"/>
			<input type="text" class="search_input" name="searchTxt" id="searchTxt" value="${param.searchTxt}">
			<input type="button" value="검색" id="searchBtn" class="search_btn"/>
</div>
</form>
<div class="paging_wrap">
		<div class="page_btn">
		</div>
</div>
	</div>
</div>
</body>
</html>