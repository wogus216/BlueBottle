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
<title>지점사용자조회</title>
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
input[type='button'] {
	color: white;
	width: 150px;
	height: 50px;
	text-align:center;
	border:0;
	border-radius: 3px;
	font-size:20px;
	margin:10px;
	cursor: pointer;
	outline:none;
	font-weight: bold;
}
.btm_btn_area{
	text-align: center;
	margin : 40px;
}

.list_btn{
	background-color: #b3b3b3;
}

.edit_btn{
	background-color: #01a1dd;
}
.none_act_btn{
background-color: #bf4040; 

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
 margin : 51px 20px;
 }
.btm_info_area > div{
margin : 55px 20px;
}
.wrap{
	width: 500px;
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
    float: right;
    line-height: 60px;
    font-size: 20px;
}



/* 팝업메시지 */

.bg{
	display: inline-block;
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0px;
	left: 0px;
	background-color: #000000;
	z-index: 200;
	opacity: 0.6; /* 0.0(투명)~1.0(불투명)*/
}
.popup_area {
	display: inline-block;
	width: 400px;
	height: 240px;
	background-color: #ffffff;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	position: absolute;
	top: calc(50% - 120px); /*높이의 반만큼 뺌*/
	left: calc(50% - 200px); /*너비의 반만큼 뺌*/
	z-index: 300;
}
.popup_head{
	height: 30px;
	font-size: 16pt;
	background-color: #01a1dd;
	color:white;
	padding:10px;
	font-weight:bold;
}
.popup_btn{
	text-align:center;
}
.popup_btn input[type='button']{
	color: white;
	width: 150px;
	height: 40px;
	text-align:center;
	border:0;
	border-radius: 3px;
	font-size:18px;
	margin:10px;
	cursor: pointer;
}
.popup_content{
	margin-bottom:80px;
	margin-top:20px;
	margin-left:20px;
	text-align:center;
	font-size:18px;
	color: black; 
}

input[type='button']:focus{outline:none;}

.popup_head > .close_btn{
	width: 25px;
	height: 25px;
	background-color: #01a1dd;
	float: right;
	margin: 0px;
	font-size: 18px;
	text-align: center;
	color: #ffffff;
	border: none;
}
</style>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" 
		src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#updateBtn").on("click", function () {
		$("#goForm").attr("action", "User_Update_Brch");
		$("#goForm").submit();
	});
	
	$("#listBtn").on("click", function () {
		$("#goForm").attr("action", "User_List");
		$("#goForm").submit();
	});
	
	
	
	$("#delBtn").on("click",function(){
		if(confirm("삭제하시겠습니까?")){
			var params = $("#goForm").serialize();
			
			$.ajax({
				url:"User_Delete_Brchs", //접속주소
				type:"post", //전송방식 : get, post
				dataType:"json",//받아올데이터형식
				data:params, //보낼 데이터(문자열 형태)
				success : function (res) {//성공 시 다음함수 실행
				if(res.msg == "success"){
					location.href = "User_List";
				}else if(res.msg == "failed"){
					makePopup("","삭제에 실패하였습니다.",function(){});
				}else {
					makePopup("","삭제 중 문제가 발생하였습니다.",function(){});
				}
				
				},
				error : function (request, status, error) { //실패 시 다음함수 실행
					console.log(error);
				}
			});
		}
	}); //del Btn end
}); //ready end




/* 팝업 */
function makePopup(title, contents, func) {
	
	var html ="";
	html+= "<div class=\"bg\"></div>";	
	html+= "<div class=\"popup_area\">";	
	html+= "<div class=\"popup_head\">"+ title +"";	
	html+= 		"<input type=\"button\" value=\"X\" class=\"close_btn\">";	
	html+= "</div>";	
	html+= "<div class=\"popup_content\">"+ contents +"</div>";	
	html+= 		"<div class=\"popup_btn\">";	
	html+= 			"<input type=\"button\" value=\"확인\"  class=\"confirm_btn\"style=\"background-color: rgb(41, 128, 185)\">";	
	html+= 			"<input type=\"button\"  value=\"취소\" class=\"close_btn\" style=\"background-color: rgb(190, 190, 190)\">";	
	html+= 	 	"</div>";
	html+= "</div>";	
	
	$("body").prepend(html);
	$(".popup_area").hide().show();
	
	$(".popup_btn .close_btn").on("click",function(){
		if(func !=null){
			func.call();
		}
			closePopup();
		});
	
	$(".popup_head .close_btn").on("click",function(){
		if(func !=null){
			func.call();
		}
			closePopup();
	
	});

	$(".confirm_btn").on("click",function(){
		closePopup();
		});
	}

function closePopup() {
	$(".bg, .popup_area").fadeOut(function(){
		$(".bg, .popup_area").remove();
	}); //popup_btn end
}	
</script>
</head>
<body>
<!--컨텐츠 -->
<div class="content_area">
<div class="content">
<h1>사용자 조회</h1>

<form action="#" id="goForm" method="post">
	<input type="hidden" id="uNo" name="uNo"  value="${data.BRCH_NO}"/>
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />

<!-- 본문 -->
<div class="main_content_area">
<div class="wrap">
	<div class="left">
		<div class="brch_no"><h3>지점번호</h3></div>
	</div>
	<div class="right">
		<div class="brch_no">${data.BRCH_NO}</div>
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
			<div class="brch_name"><h3>지점명</h3></div>
		</div>
		<div class="right">
			<div class="brch_name">${data.BRCH_NAME}</div>
		</div>
	</div>
	<div class="wrap">
		<div class="left">
			<div class="post_num"><h3>우편번호</h3></div>
		</div>
		<div class="right">
			<div class="post_num">${data.POST_NUM}</div>
		</div>
	</div>
	<div class="wrap">
		<div class="left">
			<div class="dft_address"><h3>기본주소</h3></div>
		</div>
		<div class="right">
			<div class="dft_address">${data.DFT_ADDRESS}</div>
		</div>
	</div>
	<div class="wrap">
		<div class="left">
			<div class="dtl_address"><h3>상세주소</h3></div>
		</div>
		<div class="right">
			<div class="dtl_address">${data.DTL_ADDRESS}</div>
		</div>
	</div>
	<div class="wrap">
		<div class="left">
			<div class="brch_call"><h3>지점전화번호</h3></div>
		</div>
		<div class="right">
			<div class="call_num">${data.CALL_NUM}</div>
		</div>
	</div>
	<div class="wrap">
		<div class="left">
			<div class="mgr_name"><h3>점장명</h3></div>
		</div>
		<div class="right">
			<div class="mgr_name">${data.MGR_NAME}</div>
		</div>
	</div>
	<div class="wrap">
		<div class="left">
			<div class="mgr_phone_num"><h3>점장휴대전화번호</h3></div>
		</div>
		<div class="right">
			<div class="mgr_phone_num">${data.MGR_PHONE_NUM}</div>
		</div>
	</div>
</div>
</div>
</form>
<!-- 버튼 -->
	<div class="btm_btn_area">
	<input type="button" value="목록" id="listBtn" class="list_btn">
	<input type="button" value="수정" class="edit_btn" id="updateBtn" >
	<input type="button" value="비활성화" class="none_act_btn" id="delBtn">
	</div>
</div>
</div>
</body>
</html>