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
$(document).ready(function () {
	if("${param.searchGbn}" != ""){
		$("#searchGbn").val("${param.searchGbn}");
	}
	reloadList();
	
	$("tbody").on("click", "tr", function(){
		$("#sNo").val($(this).attr("sno"));
		$("#actionForm").attr("action", "jsgDetail");
		$("#actionForm").submit();
	});
	
	$("#addBtn").on("click",function(){
		$("#searchTxt").val($("#searchOldTxt").val());
		$("#actionForm").attr("action", "jsgWrite");
		$("#actionForm").submit();
	});
	
	$("#searchBtn").on("click",function(){
		$("#page").val(1);
		$("#searchOldTxt").val($("#searchTxt").val());
		reloadList();
	});
	
	$("#paging_Wrap").on("click","span",function(){
		$("#page").val($(this).attr("name"));
		$("#searchTxt").val($("#searchOldTxt").val());
		reloadList();
	});
});

function reloadList() {
	var params = $("#actionForm").serialize(); //name이 있는 것들만 전송
	
	$.ajax({
		url:"jsgLists", //접속주소
		type:"post", //전송방식 : get, post
		dataType:"json",//받아올데이터형식
		data:params, //보낼 데이터(문자열 형태)
		success : function (res) {//성공 시 다음함수 실행
			drawList(res.list);
			drawPaging(res.pb);
		},
		error : function (request, status, error) { //실패 시 다음함수 실행
			console.log(error);
		}
	});
}

function drawList(list) {
	var html = "";
	for(var d of list){
		html += "<tr sno=\"" + d.SELL_NO + "\">";
		html += "<td>" + d.SELL_NO+ "</td>";
		html += "<td>" + d.ITEM_NAME + "</td>";
		html += "<td>" + d.COUNT + "</td>";
		html += "<td>" + d.S_DT + "</td>";
		html += "</tr>";
		
	}
	
	$("tbody").html(html);
}

function drawPaging(pb) {
	var html="";
	
	html += "<span name=\"1\">처음</span>";
	
	if($("#page").val() == "1"){
		html += "<span name=\"1\">이전</span>";
	} else {
		html += "<span name=\"" + ($("#page").val() -1) + "\">이전</span>";
	}
	
	for(var i = pb.startPcount; i<=pb.endPcount; i++){
		if($("#page").val() == i){
			html += "<span class=\"" + i + "\"><b>" + i + "</b></span>";		} else {
			html += "<span name=\"" + i + "\">" + i + "</span>";
		}
	}
	
	if($("#page").val() == pb.maxPCount){
		html += "<span name=\"" + pb.maxPCount + "\">다음</span>";
	} else {
		html += "<span name=\"" + ($("#page").val() * 1 + 1) + "\">다음</span>";
	}
	
	
	html += "<span name=\"" + pb.maxPCount + "\">마지막</span>";
	
	$("#paging_Wrap").html(html);
}

</script>
</head>
<body>
<form action="#" id="actionForm" method="post">
<input type="hidden" id="sNo" name="sNo"/>
<input type="hidden" id="page" name="page" value="${page}">
<select name="searchGbn">
<option value="0">상품명</option>
<option value="1">개수</option>
</select>
<input type="hidden" id="searchOldTxt" value="${param.searchTxt}"/>
<input type="text" name="searchTxt" id="searchTxt" value="${param.searchTxt}">
<input type="button" value="검색" id="searchBtn"/>
<input type="button" value="등록" id="addBtn"/>
</form>
<table>
	<thead>
		<tr>
			<th>SELL_NO</th>
			<th>ITEM_NAME</th>
			<th>COUNT</th>
			<th>SELL_DT</th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<div id="paging_Wrap">
</div>
</body>
</html>