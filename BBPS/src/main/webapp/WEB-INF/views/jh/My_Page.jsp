<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<c:import url="H_Menu.jsp">
	<c:param name="menuno" value="13"></c:param>
</c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본사 마이페이지</title>
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

.wrap{
	width: 450px;
	display: inline-block;
}
.left{
	display: inline-block;
    width: 200px;
    height: 100%;
    float: left;
}
.right{
	display: inline-block;
    line-height: 60px;
    font-size: 20px;
}
</style>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	/* 신박한 방법 유저번호 받는 방법
	if("${empty data}" == "true"){
		$("#send_form").attr("action","My_Page");
		$("#send_form").submit();
	}
	*/
	
	$(".edit_btn").on("click",function(){
		$("#send_form").attr("action","My_Page_Edit");
		$("#send_form").submit();
	});
	$(".list_btn").on("click",function(){
		history.back();
	});
}); //ready end
</script>
</head>
<body>
<!--컨텐츠 -->
<div class="content_area">
<div class="content">
<h1>마이페이지</h1>
<form action="#" id="send_form" method="post">
<input type="hidden" id="uNo" name="uNo" value="${sUSERNo}"/>
<!-- 본문 -->
	<div class="main_content_area">
		<div class="wrap">
			<div class="left">
				<div class="user_no"><h3>사용자 번호</h3></div>
			</div>
			<div class="right">
				<div class="user_no">${data.UNO}</div>
			</div>
		</div>
		<div class="wrap">
			<div class="left">
				<div class="auth_no"><h3>권한번호</h3></div>
			</div>
			<div class="right">
				<div class="auth_no">${data.ANO} </div>
			</div>
		</div>
		<div class="wrap">
			<div class="left">
				<div class="dep_nm"><h3>부서명</h3></div>
			</div>
			<div class="right">
				<div class="dep_nm">${data.DNM}</div>
			</div>
		</div>
		<div class="wrap">
			<div class="left">
				<div class="id"><h3>ID</h3></div>
			</div>
			<div class="right">
				<div class="id">${data.ID}</div>
			</div>
		</div>
			<div class="wrap">
			<div class="left">
				<div class="pw"><h3>PW</h3></div>
			</div>
			<div class="right">
				<div class="pw">${data.PW}</div>
			</div>
		</div>
		<div class="wrap">
			<div class="left">
				<div class="user_name"><h3>사용자명</h3></div>
			</div>
			<div class="right">
				<div class="user_name">${data.UNM}</div>
			</div>
		</div>
		<div class="wrap">
			<div class="left">
				<div class="phone_num"><h3>휴대폰 번호</h3></div>
			</div>
			<div class="right">
				<div class="phone_num">${data.PNUM}</div>
			</div>
		</div>
		<div class="wrap">
			<div class="left">
				<div class="enroll_date"><h3>등록일</h3></div>
			</div>
			<div class="right">
				<div class="enroll_date">${data.ENROLL}</div>
			</div>
		</div>
	</div>
</form>
<!-- 버튼 -->
		<div class="btm_btn_area">
			<input type="button" class="edit_btn" value="수정" >
			<input type="button" class="list_btn" value="목록" >
		</div>
	</div>
</div>
</body>
</html>