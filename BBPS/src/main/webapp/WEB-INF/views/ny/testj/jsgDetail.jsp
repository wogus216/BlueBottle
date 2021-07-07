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
<script type="text/javascript">
$(document).ready(function(){
	$("#listBtn").on("click",function(){
		$("#actionForm").attr("action", "jsgList" );
		$("#actionForm").submit();
	}); //listBtn end
	
	$("#updateBtn").on("click",function(){
		$("#actionForm").attr("action", "jsgUpdate");
		$("#actionForm").submit();
	}); //up Btn end
	
	$("#deleteBtn").on("click",function(){
		if(confirm("삭제하시겠습니까?")){
			var params = $("#actionForm").serialize();
			
			$.ajax({
				url:"jsgDeletes", //접속주소
				type:"post", //전송방식 : get, post
				dataType:"json",//받아올데이터형식
				data:params, //보낼 데이터(문자열 형태)
				success : function (res) {//성공 시 다음함수 실행
				if(res.msg == "success"){
					location.href = "jsgList";
				}else if(res.msg == "failed"){
					alert("삭제에 실패하였습니다.");
				}else {
					alert("삭제 중 문제가 발생하였습니다.")
				}
				
				},
				error : function (request, status, error) { //실패 시 다음함수 실행
					console.log(error);
				}
			});
		}
	}); //del Btn end
}); //ready end
	

</script>
</head>
<body>
<form action="#" id="actionForm" method="post">
	<input type="hidden" name="sNo" value="${data.SELL_NO}"/>
	<input type="hidden" name="page" value="${param.page}" />
	<input type="hidden" name="searchGbn" value="${param.searchGbn}" />
	<input type="hidden" name="searchTxt" value="${param.searchTxt}" /> 
</form>
번호:${data.SELL_NO}<br/>
이름:${data.ITEM_NAME}<br/>
개수:${data.COUNT}<br/>
날짜:${data.SELL_DT}<br/>
<input type="button" value="수정" id="updateBtn"/>
<input type="button" value="삭제" id="deleteBtn"/>
<input type="button" value="목록으로" id="listBtn"/>
</body>
</html>