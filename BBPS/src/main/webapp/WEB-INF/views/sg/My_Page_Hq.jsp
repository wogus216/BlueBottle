<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본사마이페이지</title>
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
/* 타이틀*/

h1 {
 margin-bottom: 40px;
 font-size: 30px;
}


/* 이게일반 */
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
	background-color: #01a1dd;
	outline:none;
}
.btm_btn_area{
	text-align: center;
	margin : 40px;
}

.edit_btn, .none_act_btn{
	width:130px;
	height: 50px;
	background-color: #01a1dd;
	font-weight: bold;
	 font-size: 20px;
}

button:focus{outline:none;}


.main_content_area {
margin : 0px 300px;
}
 .main_content_area > div{
 display : inline-block;
 margin : 0px 50px;
 }
 .top_info_area > div {
 margin : 50px 20px;
 }
.btm_info_area > div{
margin : 54px 20px;
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
	});
	$(".sub").hover(function(){
		$("li").css("background-color","white");
		$(this).parent("li").css("background-color","#f1f1f1");
	
	},function(){
			$("li").css("background-color","white");
	});
	
}); //ready end
</script>
</head>
<body>
<!-- 상단 -->
  <div class="top">
   </div>

<!--컨텐츠 -->
<div class="content_area">
<div class="content">
<h1>마이페이지</h1>

<!-- 본문 -->
<div class="main_content_area">
<div class="top_info_area">
	<div class="user_no"><h3>사용자번호</h3></div>
	<div class="auth_no"><h3>권한번호</h3></div>
	<div class="dep_no"><h3>부서번호</h3></div>
	<div class="id"><h3>ID</h3></div>
	<div class="pw"><h3>PW</h3></div>
	<div class="user_name"><h3>사용자명</h3></div>
	<div class="phone_num"><h3>휴대전화번호</h3></div>
	<div class="enroll_date"><h3>등록일</h3></div>
	<div class="del_date"><h3>삭제일</h3></div>
</div>
<div class="btm_info_area">
	<div class="user_no">23</div>
	<div class="auth_no">22</div>
	<div class="dep_no">3</div>
	<div class="id">blue999</div>
	<div class="pw">ㅇㅇㅇㅇㅇㅇ</div>
	<div class="user_name">심청이</div>
	<div class="phone_num">010-xxxx-xxxx</div>
	<div class="enroll_date">2020.06.06</div>
	<div class="del_date">-</div>
</div>
</div>

<!-- 버튼 -->
	<div class="btm_btn_area">
		<input type="button" class="edit_btn" value="수정" id="" name="">
	</div>
</div>
</div>
</body>
</html>