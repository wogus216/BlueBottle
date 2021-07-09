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
[name=ref], [name=ord]{
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
	padding-right:10px;
	padding-left:10px;
}
legend{
	font-size:15px;
}
label{
	margin-right:5px;
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
var ord_ck_arr = [];
var ref_ck_arr = [];
$(document).ready(function(){
	if("${param.search_filter}" != ""){
		$("#search_filter").val("${param.search_filter}");
	}
	ord_ckBox_check();
	ref_ckBox_check();
	reloadList();
	
	$("#search_btn").on("click",function(){
		$("#page").val(1);
		$("#search_old_txt").val($("#search_input").val());
		reloadList();
	});
	$(".paging_area").on("click", "div", function(){
		$("#search_input").val($("#search_old_txt").val());
		$("#page").val($(this).attr("page"));
		reloadList();
	});
	$("#ck1").on("click",function(){
		if($("input:checkbox[id='ck1']").prop("checked")){
			$("input[name=ord]").prop("checked", true);
		}else{
			$("input[name=ord]").prop("checked", false);
		}
		ord_ckBox_check();
		ref_ckBox_check();
		reloadList();
	});
	$("#ck7").on("click",function(){
		if($("input:checkbox[id='ck7']").prop("checked")){
			$("input[name=ref]").prop("checked", true);
		}else{
			$("input[name=ref]").prop("checked", false);
		}
		ord_ckBox_check();
		ref_ckBox_check();
		reloadList();
	});
	$(".ord").click(function(){ 
		   if($("input[class=ord]:checked").length==5){ 
		       $("#ck1").prop("checked",true); 
		    }else{ 
		       $("#ck1").prop("checked",false); 
		    }
		   ord_ckBox_check();
		   reloadList();
		});
	$(".ref").click(function(){ 
		   if($("input[class=ref]:checked").length==4){ 
		       $("#ck7").prop("checked",true); 
		    }else{ 
		       $("#ck7").prop("checked",false); 
		    }
			ref_ckBox_check();
			reloadList();
		});
	$("tbody").on("click","tr",function(){
		$("#oNo").val($(this).attr("ord_no"));
		$("#search_input").val($("#search_old_txt").val());
		$("#actionForm").attr("action","Ord_Mang_dtl");
		$("#actionForm").submit();
	}); //tr 클릭 시에는 재고 상세조회 페이지로 이동
}); //ready end

function reloadList(){
	var params = $("#actionForm").serialize();
	
	$.ajax({
		url : "Ord_Mangs",
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
function ord_ckBox_check(){
ord_ck_arr = [];
$(".ord:checked").each(function(){
	ord_ck_arr.push(this.value*1);
});
console.log(ord_ck_arr);
}
function ref_ckBox_check(){
ref_ck_arr = [];
$(".ref:checked").each(function(){
	ref_ck_arr.push(this.value*1);
	
});
console.log(ref_ck_arr);
}
function drawList(list){
	var html ="";
	for(var d of list){
		for(var i=0; i<ord_ck_arr.length; i++){
			if(d.CODE_S_CATE == ord_ck_arr[i]){
				html += "<tr ord_no = \""+d.ORD_NO+"\">";
				html += "<td>"+d.ORD_NO+"</td>";
				html += "<td>"+d.ENROLL_DATE+"</td>";
				html += "<td>"+d.BRCH_NAME+"</td>";
				html += "<td>"+d.CODE_NAME+"</th>";
				if(d.PROCESS_DATE == null){
					html += "<td></td>"
				}else{
				html += "<td>"+d.PROCESS_DATE+"</td>"
				}
				html += "</tr>";
			}
		}
		for(var i=0; i<ref_ck_arr.length; i++){
			if(d.CODE_S_CATE == ref_ck_arr[i]){
				html += "<tr ord_no = \""+d.ORD_NO+"\">";
				html += "<td>"+d.ORD_NO+"</td>";
				html += "<td>"+d.ENROLL_DATE+"</td>";
				html += "<td>"+d.BRCH_NAME+"</td>";
				html += "<td>"+d.CODE_NAME+"</th>";
				if(d.PROCESS_DATE == null){
					html += "<td></td>"
				}else{
				html += "<td>"+d.PROCESS_DATE+"</td>"
				}
				html += "</tr>";
			}
		}
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
<!-- 상단 -->
  <div class="top">
     <ul>
         <li>
         <a href="#">
         <img class="logo" alt="logo" src="resources/images/bb/logo.png" width="250px"></a>
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
		<input type = "checkbox" id="ck1" name="ord" value="2" checked="checked"/><label id="ck1" for="ck1">전체</label>
		<input type = "checkbox" id="ck2" class="ord" name="ord" value="0" checked="checked"/><label for="ck2">주문요청</label>
		<input type = "checkbox" id="ck3" class="ord" name="ord" value="1" checked="checked"/><label for="ck3">주문요청취소</label>
		<input type = "checkbox" id="ck4" class="ord" name="ord" value="2" checked="checked"/><label for="ck4">주문승인</label>
		<input type = "checkbox" id="ck5" class="ord" name="ord" value="3" checked="checked"/><label for="ck5">주문승인거부</label>
		<input type = "checkbox" id="ck6" class="ord" name="ord" value="4" checked="checked"/><label style = "margin-right:0px;" for="ck6">발송완료</label>
		
	</fieldset>
	<fieldset style =  "float:right; margin-bottom: 20px;">
		<legend>환불선택</legend>
		<input type = "checkbox" id="ck7" name="ref" checked="checked"/><label id="ck6" for="ck7">전체</label>
		<input type = "checkbox" id="ck8" class="ref" name="ref" value="5" checked="checked"/><label for="ck8">환불요청</label>
		<input type = "checkbox" id="ck9" class="ref" name="ref" value="6" checked="checked"/><label for="ck9">환불요청취소</label>
		<input type = "checkbox" id="ck10" class="ref" name="ref" value="7" checked="checked"/><label for="ck10">환불승인</label>
		<input type = "checkbox" id="ck11" class="ref" name="ref" value="8" checked="checked"/><label style = "margin-right:0px;" for="ck11">환불승인거부</label>
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
		<form action = "#" id = "actionForm" method = "post">
			<input type = "hidden" id = "oNo" name = "oNo"/>
			<input type = "hidden" id = "page" name = "page" value = "${page}"/>
			<select id ="search_filter" name="search_filter">
				<option value="0" selected="selected">주문번호</option>
			</select>
			<input type="text" name="search_input" id="search_input" value="${param.search_input}"/>
			<input type="hidden" name="search_old_txt" id="search_old_txt" value="${param.search_input}"/>
			<button class="search_btn" id="search_btn">검색</button>
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