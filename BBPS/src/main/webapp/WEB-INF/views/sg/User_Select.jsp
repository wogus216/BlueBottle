<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../jh/H_Menu.jsp">
	<c:param name="menuno" value="12"></c:param>
</c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>사용자등록선택창</title>
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
/* 품목등록 */

h1 {
 margin-bottom: 40px;
 font-size: 30px;
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

button:focus{outline:none;}

.main_content_area {
margin : 60px 300px 0px 300px;
}
 
 
.hq_user {
width : 300px;
height: 350px;
background-color : #01a1dd;
color : white;
float : left;
display: inline-block;
text-align: center;
border-radius: 15px;
box-shadow: 3px 3px 5px 0px grey;
cursor: pointer;
}
.brch_user {
width : 300px;
height: 350px;
background-color : white;
color : #01a1dd;
float : right;
text-align: center;
border-radius: 15px;
box-shadow: 3px 3px 5px 0px grey;
cursor: pointer;
}

.brch_txt, .hq_txt{
font-size : x-large;
font-weight: bolder;
text-align: center;
margin : 30px 0px 50px 0px;
}


</style>



<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" 
		src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#hq_user").on("click", function() {
		//location.href = "User_Add_Hq"
		$("#goForm").attr("action", "User_Add_Hq");
		$("#goForm").submit();
	});
	$("#brch_user").on("click", function() {
		//location.href = "User_Add_Brch"
		$("#goForm").attr("action", "User_Add_Brch");
		$("#goForm").submit();
	});
	
	
}); //ready end
</script>
</head>
<body>
<!--컨텐츠 -->
<div class="content_area">
	<div class="content">
		<h1>사용자 등록</h1>

<!-- 본문 -->
<form action="#" id="goForm" method="post">
<input type="hidden" name="page" value="${param.page}" />
<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
	<div class="main_content_area">
			<div class="hq_user" id="hq_user">
				<div class="hq_txt">
					본사사용자
				</div>
				<div class="hq_user_bottom">
					 <img alt="hq" src="resources/images/bb/hq1.png" width="200px">
				</div>
			</div>
			<div class="brch_user" id="brch_user">
				<div class="brch_txt">
					지점사용자
				</div>
				<div class="brch_user_bottom">
					<img alt="brch" src="resources/images/bb/brch1.png" width="210px">
				</div>
			</div>
	</div>
</form>
<!-- 버튼 -->
	
	</div>
</div>
</body>
</html>