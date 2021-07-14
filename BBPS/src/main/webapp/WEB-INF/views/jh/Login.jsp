<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 로그인 페이지</title>
<style type="text/css">

body{
	background-color: #1bc1fe;
	font-family:system-ui;
	color: white;
	
}

.content{
	margin-top: 50px;
	margin-left: 60px;
	text-align: center;
}


/* 사진 */
.main_img{
	display: inline-block;
	width: 65vw;
	
}
#img1{
	width : 100%;
	height: 100%;
}
/* 로그인 */
.login_Area{
	display: inline-block;
	vertical-align: top;
	width: 25vw;
	min-width: 390px;
	height: 100%;
	text-align: center;
	
	
}
.title{
	font-size: 2vw;
	margin: 20px 0;
}

.choice_Img{
	margin-top: 60px;
	width: 5vw;
	padding: 0 10px;
 	cursor: pointer;
}
.sys_Img{
	padding: 0px;
	list-style: none;
 	margin: 0;
 	height: 200px;
	margin-left: 50px;
}

.sys_Img li {
	border: 0;
	float: left;
	font-size: 1.2vw;
	width: 30%;
}
.info{
    font-size:  1.3vw;
    margin-top: 60px;
}

.log_Input{
	list-style: none;
	padding: 0;
}

.input{
	margin-top: 10px;
	margin-left: 20px;
    font-size: 20px;
    outline: none;
}
.input:focus{
	animation-name: border-focus;
	animation-duration: 1s;
	animation-fill-mode: forwards;
}
@keyframes border-focus{

	from{
		border-radius: 0;
	}
	to {
		border-radius: 15px;
	}
}

.submit{
	font-size: 30px;
    margin: 30px 120px 0 120px;
    border-radius: 10px;
}

.submit:hover{
	background-color: #1bc1fe;
}
</style>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//본사 로그인 페이지
	$("#HQ").on("click",function(){
		location.href = "H_Login";
	});
	//지점 로그인 페이지
	$("#B").on("click",function(){
		location.href = "B_Login";
	});
	
	$("#POS").on("click",function(){
		location.href = "Pos_Login";
	});
	
}); //ready end




var imgs = ["resources/images/bb/블루보틀2.jpg","resources/images/bb/블루보틀0.jpg","resources/images/bb/블루보틀5.jpg","resources/images/bb/블루보틀4.jpg"]
var now = 0;
var interval = null;

function start(){
	if(interval == null){
	interval = setInterval(changeImg, 3000);
	}
}

function changeImg(){
	now++;
	
	if(now == imgs.length){
		now = 0;
	}
	document.getElementById("img1").src =imgs[now];
}
</script>
</head>
<body>

<div class="content">
	<div class="main_img">
	<img alt="이미지" src="resources/images/bb/블루보틀2.jpg" id="img1" onload="start()"/>
	</div>
	<div class="login_Area">
		<div class="title">Blue Bottle</div>
		<div class="choi_area">
			<ul class="sys_Img">
				<li>
					<img src="resources/images/bb/user.png" id="HQ" class="choice_Img"/><br/>
					<span style="font-size:20px">본사</span>
				</li>
				<li>
					<img src="resources/images/bb/user.png" id="B" class="choice_Img"/><br/>
					<span style="font-size:20px">지점</span>
				</li>
				<li>
					<img src="resources/images/bb/pos.PNG" id="POS" class="choice_Img"/><br/>
					<span style="font-size:20px">POS</span>
				</li>
			</ul>
		</div>
		<div class="info">이용할 시스템을 클릭하세요</div>
	</div>
</div>
</body>
</html>
