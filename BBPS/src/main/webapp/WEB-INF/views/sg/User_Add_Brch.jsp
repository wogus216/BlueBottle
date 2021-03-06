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
<title>지점사용자등록</title>
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


.add_btn{
color: white;
	width: 150px;
	height: 50px;
	text-align:center;
	border:0;
	border-radius: 3px;
	font-size:18px;
	margin:10px;
	cursor: pointer;
	background-color: #01a1dd;
	outline:none;
	font-weight: bold;
}
.list_btn{
	color: white;
	width: 150px;
	height: 50px;
	text-align:center;
	border:0;
	border-radius: 3px;
	font-size:18px;
	margin:10px;
	cursor: pointer;
	background-color: #b3b3b3;
	outline:none;
	font-weight: bold;
}
.submit_area{
	text-align: center;
}

button:focus{outline:none;}

.main_content_area {
margin : 0px 300px;
}
.note{
margin : 0px 30px;
}
 .main_content_area .top_info_area{
display : inline-block;
 margin: 0px 5px 0px 50px;
 }
 
  .main_content_area .btm_info_area{
 display : inline-block;
 margin: 0px 5px 0px 50px;
  }
 .top_info_area > div {
 margin : 53px 20px;
 }
.btm_info_area > div{
margin : 37px 20px;
}
.btm_info_area input {
height : 35px;
width: 230px;
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
	$("#listBtn").on("click",function(){
		$("#goForm").submit();
	}); 
	
	$("#addForm").on("keypress", "input", function(event){
		if(event.keyCode == 13){
			return false;
		}
	});
	
	
	$("#addBtn").on("click", function () {
		if($.trim($("#bId").val())== ""){
			makePopup("ID","아이디를 입력해주세요.",function(){});
			$("#bId").focus();
		} else if($.trim($("#bPwRe").val()) != $.trim($("#bPw").val())){
			makePopup("PW","비밀번호가 정확하지 않습니다.",function(){});
			$("#bPw").val("");
			$("#bPwRe").val("");
			$("#bPw").focus();
		} else if($.trim($("#bNm").val()) == ""){
			makePopup("지점명","지점명을 입력해주세요.",function(){});
			$("#bNm").focus();
		} else if($.trim($("#bPost").val()) == ""){
			makePopup("우편번호","우편번호를 입력해주세요.",function(){});
			$("#bPost").focus();
		} else if($.trim($("#bDft").val()) == ""){
			makePopup("기본주소","기본주소를 입력해주세요.",function(){});
			$("#bDft").focus();
		} else if($.trim($("#bDtl").val()) == ""){
			makePopup("상세주소","상세주소를 입력해주세요.",function(){});
			$("#bDtl").focus();
		} else if($.trim($("#bCall").val()) == ""){
			makePopup("지점 전화번호","지점 전화번호를 입력해주세요.",function(){});
			$("#bCall").focus();
		} else if($.trim($("#bMgrNm").val()) == ""){
			makePopup("매니저이름","매니저이름을 입력해주세요.",function(){});
			$("#bMgrNm").focus();
		} else {
				var params = $("#addForm").serialize();
				
				$.ajax({
					url:"User_Add_Brchs", //접속주소
					type:"post", //전송방식 : get, post
					dataType:"json", //받아올데이터형식
					data:params, //보낼 데이터(문자열 형태)
					success : function (res) {//성공 시 다음함수 실행
					if(res.msg == "success"){
						location.href = "User_List";
					}else if(res.msg == "failed"){
						makePopup("","등록에 실패하였습니다.",function(){});
					}else {
						makePopup("","등록 중 문제가 발생하였습니다.",function(){});
					}
					
					},
					error : function (request, status, error) { //실패 시 다음함수 실행
						console.log(error);
					}
				});
		}
		
	}); //addBtn end
	
	
});//ready end


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
<h1>사용자 등록</h1>

<!-- 본문 -->
<form action="User_List" id="goForm" method="post">
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
</form>
<form action="#" id="addForm" method="post">
<div class="main_content_area">
<div class=note><h5>* 표시는 필수 입력창</h5></div>
<div class="top_info_area">
	<!-- <div class="brch_no"><h3>* 지점번호</h3></div> -->
	<div class="id"><h3>* ID</h3></div>
	<div class="pw"><h3>* PW</h3></div>
	<div class="pw"><h3>* PW확인</h3></div>
	<div class="brch_name"><h3>* 지점명</h3></div>
	<div class="post_num"><h3>* 우편번호</h3></div>
	<div class="dft_address"><h3>* 기본주소</h3></div>
	<div class="dtl_address"><h3>* 상세주소</h3></div>
	<div class="call_num"><h3>* 전화번호</h3></div>
	<div class="mgr_name"><h3>* 사용자명</h3></div>
	<div class="mgr_phone_num"><h3>매니저 휴대전화번호</h3></div>
	
</div>
<div class="btm_info_area">

	<!-- <div class="brch_no_input">
	<input type="text" placeholder="지점번호를 입력하시오."/>
	</div> -->
	<div class="id_input">
	<input type="text" id="bId" name="bId" placeholder="ID를 입력하시오."/>
	</div>
	<div>
	<input type="password" id="bPw" name="bPw" placeholder="패스워드를 입력하시오." class="pw_input">
	</div>
	<div>
	<input type="password" id="bPwRe" name="bPwRe" placeholder="패스워드를 재입력하시오." class="pw_input">
	</div>
	<div class="brch_name_input">
	<input type="text" id="bNm" name="bNm" placeholder="지점명을 입력하시오 .">
	</div>
	<div class="post_num_input">
	<input type="text" id="bPost" name="bPost" placeholder="우편번호를 입력하시오">
	</div>
	<div class="dft_address_input">
	<input type="text" placeholder="기본주소를 입력하시오" id="bDft" name="bDft">
	</div>
	<div class="dtl_address_input">
	<input type="text" placeholder="상세주소를 입력하시오" id="bDtl" name="bDtl">
	</div>
	<div class="call_num_input">
	<input type="text" placeholder="지점 전화번호를 입력하시오." id="bCall" name="bCall">
	</div>
	<div>
	<input type="text" id="bMgrNm" name="bMgrNm" placeholder="매니저 이름을 입력하시오." class="mgr_name_input">
	</div>
	<div>
	<input type="text" id="bPhone" name="bPhone" placeholder="점장 전화번호를 입력하시오" class="mgr_phone_num_input">
	</div>
	
	
</div>
</div>
</form>
<!-- 버튼 -->
	<div class="submit_area">
	<input type="button" class="add_btn" value="등록" id="addBtn"/>
	<input type="button" value="취소" id="listBtn" class="list_btn"/>
	</div>
</div>
</div>
</body>
</html>