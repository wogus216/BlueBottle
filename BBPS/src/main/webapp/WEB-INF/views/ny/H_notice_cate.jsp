<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지카테고리등록</title>
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

.row_add, .row_del{
	background-color: #01a1dd;
	float: right;
}
.row_del{
	background-color: #bf4040;
}

table {
    width: 800px;
    table-layout: fixed;
    background: #ffffff;
	margin: 10px 0  0 220px;
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
}

 td:first-child{
	border-left: none;
}
input{
	width:200px;
	height:40px;

}
.selectBox, .tot_price li{
	float:right;
}
.ord_info li, .tot_price li{
	font-size:19px;
	margin:10px;
	
}
.ord_info ul, .tot_price ul{
	max-width: 1000px; 
   
}

.apv_info, .send{
	float:right;
	font-size:19px;
}

.apv_stat{
	 color:red;
}
/* 이게일반 */
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
.submit_area{
	text-align: center;
}

.submit{
	width:100px;
	height: 45px;
	background-color: #01a1dd;
	font-weight: bold;
	 font-size: 20px;
	 vertical-align: middle;
}

button:focus{outline:none;}
/* 카테고리 */
.cate_add{
	text-align: center;
	margin-bottom: 80px;
}

.cate_name{
	font-size: 20px;
	font-weight: bold;
	margin-right: 10px;
}

.edit_btn, .del_btn{
	width: 80px;
	color: white;
    height: 40px;
    text-align: center;
    border: 0;
    border-radius: 3px;
    font-size: 18px;
    margin: 10px;
    cursor: pointer;
    background-color: #01a1dd;
    outline: none;
    font-weight: bold;
 
}
.edit_btn{
 	background-color: #01a1dd;
}
.del_btn{
	background-color: #bf4040;
}
 

</style>

<script type="text/javascript"
	src="../script/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".top_menu").on("click","a",function(){
		$(".top_menu a").attr("style","color: black");
		$(this).css("color", "#01a1dd");
		$(this).parent().parent().children(1).css("color", "#01a1dd");
	}); //top menu click end
	
	$(".sub").hover(function(){
		$("li").css("background-color","white");
		$(this).parent("li").css("background-color","#f1f1f1");
	
	},function(){
			$("li").css("background-color","white");
	}); //sub menu hover end
	
	
	
	
}); //ready end
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

<!--컨텐츠 -->
<div class="content_area">
<div class="content">
<h1>공지카테고리</h1>

<div class="cate_add">
		<span class="cate_name">카테고리명</span>
		<input type="text" maxlength="10" style="font-size: 15px;">
		<button class="submit">등록</button>
</div>
	<table cellspacing="0">
			<colgroup>
				<col width="5%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<tbody>
			<tr>
				<th scope="col" style="border-left: none;">No.</th>
				<th scope="col">카테고리명</th>
				<th scope="col"></th>
			</tr>
			<tr>
				<td>1</td>
				<td>이벤트</td>
				<td>
						<input  class="edit_btn"type="button" value="수정"/>
						<input class="del_btn" type="button" value="삭제"/>
				</td>
			</tr>
			<tr>
				<td>2</td>
				<td>주문</td>
				<td>
						<input  class="edit_btn"type="button" value="수정"/>
						<input class="del_btn" type="button" value="삭제"/>
				</td>
			</tr>
			<tr>
				<td>3</td>
				<td>재고</td>
				<td>
						<input  class="edit_btn"type="button" value="수정"/>
						<input class="del_btn" type="button" value="삭제"/>
				</td>
			</tr>
			<tr>
				<td>4</td>
				<td>시스템</td>
				<td>
						<input  class="edit_btn"type="button" value="수정"/>
						<input class="del_btn" type="button" value="삭제"/>
				</td>
			</tr>
			<tr>
				<td>5</td>
				<td>기타</td>
				<td>
						<input  class="edit_btn"type="button" value="수정"/>
						<input class="del_btn" type="button" value="삭제"/>
				</td>
			</tr>
</div>
</div>
</body>
</html>