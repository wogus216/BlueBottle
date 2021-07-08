<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
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
	
	$("#addBtn").on("click", function(){
		
		//입력X인 경우
		if($.trim($("#sNo").val()) == ""){
			alert("번호를 입력해주세요");
			$("#sNo").focus();
		} else if($.trim($("#sNm").val()) == ""){
			alert("제품명을 입력해주세요");
			$("#sNm").focus();
		} else if($.trim($("#sCnt").val()) == ""){
			alert("개수를 입력해주세요");
			$("#sCnt").focus();
		} else if($.trim($("#sDt").val()) == ""){
			alert("날짜를 입력해주세요");
			$("#sDt").focus();
		} else{
				var params = $("#actionForm").serialize();
				
				$.ajax({
					url:"jsgWrites", //접속주소
					type:"post", //전송방식 : get, post
					dataType:"json",//받아올데이터형식
					data:params, //보낼 데이터(문자열 형태)
					success : function (res) {//성공 시 다음함수 실행
					if(res.msg == "success"){
						location.href = "jsgList";
					}else if(res.msg == "failed"){
						alert("등록에 실패하였습니다.");
					}else {
						alert("등록 중 문제가 발생하였습니다.");
					}
					
					},
					error : function (request, status, error) { //실패 시 다음함수 실행
						console.log(error);
					}
				});
			}	
		
	}); 
}); //ready end
</script>
</head>
<body>
<form action="jsgList" id="goForm" method="post">
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" />
</form>
<form action="#" id="actionForm" method="post">
번호 <input type="text" id="sNo" name="sNo"/><br/>
제품명 <input type="text" id="sNm" name="sNm"/><br/>
개수 <input type="text" id="sCnt"  name="sCnt"/><br/>
날짜 <input type="date" id="sDt" name="sDt"/><br/>
</form>
<input type="button" value="등록" id="addBtn"/>
<input type="button" value="목록으로" id="listBtn"/>
</body>
</html>