<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
		src="resources/script/ckeditor/ckeditor.js">
</script>
<script type="text/javascript">
$(document).ready(function(){

	$("#backBtn").on("click", function(){
		history.back();
	});
	//form에서 작성하다 엔터누를 시 실행 방지 
	$("#updateForm").on("keypress", "input", function(event){
		if(event.keyCode ==13 ){
			return false;
		}
	});
	
	$("#updateBtn").on("click",function(){
	
		//입력된게 없는 경우
		if($.trim($("#sNm").val()) == ""){
			alert("제품명을 입력해주세요");
			$("#sNm").focus();
		} else if($.trim($("#sCnt").val()) == ""){
			alert("개수를 입력해주세요");
			$("#sCnt").focus();
		} else{
			var params = $("#updateForm").serialize();
			
			$.ajax({
				url:"jsgUpdates", //접속주소
				type:"post", //전송방식 : get, post
				dataType:"json",//받아올데이터형식
				data:params, //보낼 데이터(문자열 형태)
				success : function (res) {//성공 시 다음함수 실행
				if(res.msg == "success"){
					location.href = "jsgList";
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
}); //ready end
</script>
</head>
<body>
<form action="jsgDetail" id="goForm" method="post">
	<input type="hidden" name="sNo" value="${data.SELL_NO}"/>
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
</form>
<form action="#" id="updateForm" method="post">
<input type="hidden" name="sNo" value="${data.SELL_NO}"/>
제품명 <input type="text" id="sNm" name="sNm" value="${data.ITEM_NAME}"/><br/>
개수 <input type="text" id="sCnt" name="sCnt" value="${data.COUNT}"/><br/>
날짜: ${data.SELL_DT}<br/>
</form>
<input type="button" value="수정" id="updateBtn"/>
<input type="button" value="뒤로가기" id="backBtn"/>
</body>
</html>