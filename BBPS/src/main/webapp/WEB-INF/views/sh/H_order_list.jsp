<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본사주문조회</title>
<style type="text/css">
/*상단바*/
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
.menu_e:hover .sub,.menu_f:hover .sub, .menu_g:hover .sub, .menu_h:hover .sub , .menu_i:hover .sub {
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
input{
	width:200px;
	height:40px;
}
.filter_area{
	text-align: right;
	margin-bottom: 10px;
}
[name=ref], [name=order]{
	margin: 0;
	height: 20px;
	width: 30px;
	vertical-align: middle;
	cursor: pointer;
}
fieldset{
	display:inline;
	border:1px solid;
	margin:0;
	padding-right:20px;
	padding-left:20px;
}
legend{
	font-size:15px;
}
label{
	margin-right:10px;
	vertical-align: middle;
	cursor: pointer;
}
button:focus{outline:none;}

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
.start_date, .end_date{
	width: 150px;
	font-size: 15px;
	height: 36px;
}
/* 일반버튼 */
button{
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
}
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
	src="../script/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	reloadList();
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
		reloadList();
	});

	$("tr").on("click",function(){
		location.href = "H_stock_detail.html";
	});

	$(".add_btn").on("click",function(){
		location.href = "H_product_add.html";
	});
}); //ready end

function reloadList(){
	var params = $("#actionForm").serialize();

	$.ajax({
		url : "H_order_lists",
		type : "post",  
		dataType :"json",
		data : params,
		success : function(res){
			drawproductList(res.list);
			drawproductPaging(res.pb);
		},
		error : function(request,status,error){
			console.log(error);
		}
	});
}

function drawproductList(list){
	var html ="";

	for(var d of list){
		html += "<tr ord_no = \""+d.ORD_NO+"\">";
		html += "<td>"+d.ORD_NO+"</td>";
		html += "<td>"+d.BRCH_NAME+"</td>";
		html += "<td>"+d.STAT_NAME+"</th>";
		html += "<td>"+d.PROCESS_DATE+"</td>";
		html += "</tr>";	
	}

	$("tbody").html(html);
}

function drawproductPaging(pb){
	var html = "";
                                    
	html += "<button page = \"1\" style=\"background-color: white\"<<<</button>";
	if($("#page").val()=="1"){
		html += "<button page = \"1\" style=\"background-color: white\"><</button>";
	}else{
		html += "<button page = \""+ ($("#page").val()-1) + "\" style=\"background-color: white\"><</button>";
	}

	for(var i = pb.startPcount; i <= pb.endPcount; i++){
		if($("#page").val() == i){ //현재 페이지의 값이랑 같을 때
			html += "<button class = \"on\" page = \""+ i +"\" style=\"background-color: white\">"+ i +"</button>";	
		}else{
			html += "<button  page = \""+ i +"\" style=\"background-color: white\">"+ i +"</button>";	
		}
	
	}

	if($("#page").val() == pb.maxPcount){
		html += "<button page = \""+ pb.maxPcount +"\" style=\"background-color: white\">></button>";
	}else{
		html += "<button page = \""+ ($("#page").val()*1+1) +"\" style=\"background-color: white\">></button>";;/* -는 알아서 숫자 빠지는데 더하기는 문자열 처리가 됨  그래서 *1 해줘야됨*/
	}



	html += "<button page = \""+ pb.maxPcount +"\" style=\"background-color: white\">>></button>";

	$(".page_btn").html(html);
}
</script>
</head>
<body>
<!-- 상단 -->
  <div class="top">
     <ul>
         <li>
         <a href="#">
         <img class="logo" alt="logo" src="./logo.png" width="250px"></a>
         </li>
         
         <div class="top_menu">
         
         <div class="menu_a">
         <li>
         	<a class="main_menu" href="#">
         		발주관리</a>
	         <div class="sub">
	            <a href="#">
	            	발주요청조회</a>
	             <a href="#">
	            	발주완료조회</a>
	         </div>
          </li>
         </div>
         
         <div class="menu_b">
         <li>
         	<a class="main_menu" href="#">
         		발송관리</a>
	         <div class="sub">
	            <a href="#">
	            	발송요청조회</a>
	             <a href="#">
	            	발송완료조회</a>
	         </div>
          </li>
         </div>
         
         <div class="menu_c">
         <li>
         	<a class="main_menu" href="#">
         		환불관리</a>
	         <div class="sub">
	            <a href="#">
	            	환불요청조회</a>
	             <a href="#">
	            	환불완료조회</a>
	         </div>
          </li>
         </div>
         
         <div class="menu_d">
         <li>
         	<a class="main_menu" href="#">
         		재고관리</a>
	          	<div class="sub">
     			<a href="#">		
	            	재고조회</a>
     			<a href="#">
	            	재고등록</a>
	            <a href="#">	
	            	입출고조회</a>
	            <a href="#">
	            	폐기조회</a>
	            </div>
          </li>
         </div>
         
         <div class="menu_e">
	         <li>
			<a class="main_menu" href="#"> 
		        		품목관리</a>
		          	<div class="sub">
					<a href="#">
		            	품목조회</a>
		            <a href="#">
		            	품목등록</a>
		            </div>
	          </li>
         </div>
         
            <div class="menu_f">
	         <li>
			<a class="main_menu" href="#"> 
		        		카테고리관리</a>
		          	<div class="sub">
					<a href="#">
		            	공지카테고리</a>
		            <a href="#">
		            	품목카테고리</a>
		            <a href="#">
		            	메뉴카테고리</a>
		            </div>
	          </li>
         </div>
         
         <div class="menu_g">
         <li>
         	<a class="main_menu" href="#"> 
         		POS관리</a>
	          <div class="sub" >
				<a href="#">
	            	메뉴조회</a>
				<a href="#">
	            	메뉴등록</a>
            </div>	
          </li>
         </div>
          <div class="menu_h">
         	<li>
         		<a class="main_menu" href="#"> 
         			공지사항</a>
	        </li>
         </div>
         <div class="menu_i">
         	<li>
         	<a class="main_menu" href="#"> 
         			사용자관리</a>
         		 <div class="sub" style="min-width: 145px;">
			<a href="#">
	            	사용자조회</a>
	          <a href="#">
	            	사용자등록</a>
            </div>	
	        </li>
         </div>
          <div class="menu_j">
          <li>
          <a class="main_menu" href="#"> 
         		마이페이지</a>
           </li>
         </div>
         <a class="log_out" href="#">
         		로그아웃</a>
      	</div>
      </ul>
   </div>
<div class="content_area">
<div class="content">
<h1>주문조회</h1>

<div class="filter_area">
	<select class="brch">
		<option value="0" selected="selected">지점명</option>
		<option value="1">가산디지털단지역점</option>
		<option value="2">건대점</option>
		<option value="3">구로점</option>
		<option value="3">롯데타워점</option>
		<option value="3">성신여대점</option>
		<option value="3">잠실점</option>
	</select>
	<input class="start_date" type = "date" value="2021-01-01"/>
	<input class="end_date" type = "date" value="2021-01-01"/>
	<button class="search_btn">검색</button>
</div>
<fieldset style = "margin-right:10px;">
		<legend>주문선택</legend>
		<input type = "checkbox" id="ck1" name="order" checked="checked"/><label id="l1" for="ck1">전체</label>
		<input type = "checkbox" id="ck2" name="order"/><label id="ck2" for="r2">주문요청</label>
		<input type = "checkbox" id="ck3" name="order"/><label id="ck3" for="r3">주문요청취소</label>
		<input type = "checkbox" id="ck4" name="order"/><label id="ck4" for="r4">주문승인</label>
		<input type = "checkbox" id="ck5" name="order"/><label id="ck5" for="r5">주문승인거부</label>
	</fieldset>
	<fieldset style =  "float:right; margin-bottom: 20px;">
		<legend>환불선택</legend>
		<input type = "checkbox" id="ck6" name="ref" checked="checked"/><label id="l6" for="ck6">전체</label>
		<input type = "checkbox" id="ck7" name="ref"/><label id="l6" for="ck7">환불요청</label>
		<input type = "checkbox" id="ck8" name="ref"/><label id="l7" for="ck8">환불요청취소</label>
		<input type = "checkbox" id="ck9" name="ref"/><label id="l8" for="ck9">환불승인</label>
		<input type = "checkbox" id="ck10" name="ref"/><label id="l9" for="rck0">환불승인거부</label>
	</fieldset>
<table cellspacing="0">
	<colgroup>
		<col width="20%" />
		<col width="20%" />
		<col width="20%" />
		<col width="20%" />
		<col width="20%" />
	</colgroup>
	<thead>
	<tr>
		<th scope=col style= "border-left: none;" scope=col>주문번호</th>
		<th scope=col>주문날짜</th>
		<th scope=col>지점명</th>
		<th scope=col>처리상태</th>
		<th scope=col>처리날짜</th>
	</tr>
	</thead>
	<tbody></tbody>
</table>
<div class="search_area" style = "margin-top : 30px;">
		<div class="search_info">
			<select class="search_filter">
				<option value="0" selected="selected">주문번호</option>
				<option value="1">본문 내용</option>
			</select>
			<input type="text" class="search_input"/>
			<button class="search_btn">검색</button>
		</div>
	</div>
<div class="page_area">
		<div class="page_btn"></div>
	</div>
	</div>
</div>
</body>
</html>