<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점사용자등록</title>
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
			alert("아이디를 입력해주세요");
			$("#bId").focus();
		} else if($.trim($("#bPwRe").val()) != $.trim($("#bPw").val())){
			alert("비밀번호가 정확하지 않습니다.");
			$("#bPw").val("");
			$("#bPwRe").val("");
			$("#bPw").focus();
		} else if($.trim($("#bNm").val()) == ""){
			alert("지점명을 입력주세요");
			$("#bNm").focus();
		} else if($.trim($("#bPost").val()) == ""){
			alert("우편번호를 입력주세요");
			$("#bPost").focus();
		} else if($.trim($("#bDft").val()) == ""){
			alert("기본주소를 입력주세요");
			$("#bDft").focus();
		} else if($.trim($("#bDtl").val()) == ""){
			alert("상세주소를 입력해주세요.");
			$("#bDtl").focus();
		} else if($.trim($("#bCall").val()) == ""){
			alert("지점 전화번호를 입력해주세요.");
			$("#bCall").focus();
		} else if($.trim($("#bMgrNm").val()) == ""){
			alert("매니저 이름을 입력해주세요.");
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
						alert("등록에 실패하였습니다.");
					}else {
						alert("등록 중 문제가 발생하였습니다.")
					}
					
					},
					error : function (request, status, error) { //실패 시 다음함수 실행
						console.log(error);
					}
				});
		}
		
	}); //addBtn end
	
	
});//ready end
</script>
</head>
<body>
<!-- 상단 -->
  <div class="top">
  </div>
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