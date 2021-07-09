<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본사공지사항상세조회</title>
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

/* 타이틀 */

h1 {
 margin-bottom: 40px;
 font-size: 30px;
}
 

 

.top_tb{
position: relative;
    width: 100%;
    height: 35px;
}

 table{
    width: 100%;
    max-width: 100%;
    height: 100%;
    border-spacing: 0;
    border-collapse: collapse;
    table-layout: fixed;
 }
.tb1{
    border-top: 2px solid #ccc;
    border-bottom: 2px solid #ccc;
 }
.tb1 > .tbody{
     display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
 }
 .tb1 > .td{
    border-bottom: 1px solid #ccc;
    text-align: center;
 }
 .tb1 > .tr{
     display: table-row;
    vertical-align: inherit;
    border-color: inherit;
 }
 
 
  .txt_content{
 position: relative;
width: 100%;
 }
 
 
 
.edit_btn, .del_btn{
color: white;
	text-align:center;
	border: 0;
	border-radius: 3px;
	margin:10px 0px;
	cursor: pointer;
	background-color: #01a1dd;
	outline:none;
	width:100px;
	height: 40px;
	font-weight: bold;
	 font-size: 15px;
}


button:focus{
outline:none;
}

 
 .edit_info
 {
 	float: right;
 	display : inline-block;
	text-align: center;
	margin : 10px 0px;
}
 
 .btm_tb{
 position: relative;
width: 100%;
  height: 30px;
 }
 .tb2{
    text-align: center;
    border: 2px solid #ccc;
}
 .tb2 > .tbody{
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
 }
 .tb2 > .tr{
    border-bottom: 1px solid #ccc;
 }
 .tb2 > .th{
 background-color: #000000;
 }
 </style>
 
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
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
	
	
}); //ready end

$(document).ready(function() {
	$("#listBtn").on("click", function() {
		$("#goForm").attr("action", "Notice");
		$("#goForm").submit();
	});
	 
	$("#updateBtn").on("click", function () {
		$("#goForm").attr("action", "Notice_Update");
		$("#goForm").submit();
	});
	$("#deleteBtn").on("click", function () {
		if(confirm("삭제하시겠습니까?")){
			var params = $("#goForm").serialize();
			
			$.ajax({
				url:"Notice_Deletes", //접속주소
				type:"post", //전송방식 : get, post
				dataType:"json",//받아올데이터형식
				data:params, //보낼 데이터(문자열 형태)
				success : function (res) {//성공 시 다음함수 실행
					if (res.msg == "success") {
						location.href = "Notice";
					} else if(res.msg == "failed") {
						alert("작성에 실패하였습니다.")
					} else {
						alert("작성중 문제가 발생하였습니다.");
					}
				},
				error : function (request, status, error) { //실패 시 다음함수 실행
					console.log(error); //값이 돌아오지 않던지 애초에 터졌든지에 대한 에러
				}
			});
		}
	});
});

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

<!--컨텐츠 -->
<div class="content_area">
<div class="content">
<h1>공지사항</h1>
<form action="#" id="goForm" method="post">
	<input type="hidden" name="nNo" value="${data.TXT_NO}" />
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
</form>
<div class="titile"><h2>${data.TITLE}</h2></div>
<div class="top_tb">
<table class="tb1">
<tbody>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>${data.USER_NO}</td>
<td>${data.B_DT}</td>
<td></td>
</tr>
</tbody>
</table>
</div>


<div class="txt_content">
${data.CONTENT}
<br/>
<c:if test="${!empty data.ATT_FILE}">
<!-- set : 변수 -->
<%--
<c:set var="len" value="${fn:length(data.B_FILE)}"></c:set>
첨부파일 : <!-- a의 download : 해당 주소를 다운로드 하겠다. 값이 있는 경우 해당 이름으로 다운받겠다. -->
<a href="resources/upload/${data.B_FILE}" download="${fn:substring(data.B_FILE,20, len)}">
${fn:substring(data.B_FILE,20, len)}</a><br/>
 --%>
 첨부파일 :<a href="resources/upload/${data.ATT_FILE}" download="${data.ATT_UFILE}">
${data.ATT_UFILE}</a><br/>
 </c:if>
</div>



<div class="btm_btn_area" style = "margin-top : 30px;">
	<input type="button" value="목록으로" id="listBtn" />
		<div class="edit_info">
<input type="button" value="수정" class="edit_btn" id="updateBtn" />
<input type="button" value="삭제" class="del_btn" id="deleteBtn" />
		</div>
	</div>

<div class="btm_tb">
<table class="tb2">
<tbody>
<tr>
<th>&nbsp;윗글</th>
<td>&nbsp;해당 글이 없습니다.</td>
</tr>
<tr>
<th>&nbsp;아랫글</th>
<td>&nbsp;</td>
</tr>
</tbody>
</table>
</div>


</div>
</div>
</body>
</html>