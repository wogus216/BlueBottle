<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../jh/H_Menu.jsp">
	<c:param name="menuno" value="19"></c:param>
</c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점환불요청</title>
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
/* 게시판 */

h1 {
	 margin-bottom: 40px;
	 font-size: 30px;
}
table {
    width: 100%;
    table-layout: fixed;
    background: #ffffff;
	margin: 10px 0;
	border-top: 2px solid #01a1dd;
	border-bottom: 2px solid #d9d9d9;	
	text-align: center;
}

tr {
    display: table-row;
}
th{
	background: #e8e8e8;
    padding: 10px;
    border-bottom: 1px solid #ffffff;
    border-left: 1px solid #ffffff;
}
td{
	font-size:15px;
	padding:10px;
	border-top: 1px solid #eaeaea;
	border-left: 1px solid #eaeaea;
}

td:first-child{
	border-left: none;
}
.ref_cnt, .rsn_note{
	height:30px;
	width:110px;
	text-align: center;
}
.rsn_note{
	width: 220px;
	text-align: left;
}

button:hover::-webkit-inner-spin-button {  
    width: 30px;
    height: 30px;
}

.ref, #ck1{ 
	margin: 0;
	height: 20px;
	width: 30px;
	vertical-align: middle;
}
input{
	width:150px;
	height:40px;
	margin:10px 5px;
	font-size:15px;
}
.tot_ref_price li{
	float:right;
}
.ord_info li, .tot_ref_price li{
	font-size:19px;
	margin:10px;
	
}
.ord_info ul, .tot_ref_price ul{
	max-width: 1000px; 
}

.log_out{
	display:inline-block;
	text-decoration: none;
	color: gray;
	padding:10px 20px;
	line-height: 42px;
}

input:focus{
	outline: none;
}

button:focus{outline:none;}

.btn_area{
	text-align: center;
}
.ref_req_btn{
	width:180px;
	height:50px;
	background-color: #01a1dd;
	font-weight: bold;
	float: center;
	color: white;
	text-align:center;
	border:0;
	border-radius: 3px;
	font-size:22px;
	margin:10px;
	cursor: pointer;
}

</style>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
var ref_item_arr = [];
$(document).ready(function(){
	if("${param.search_filter}" != ""){
		$("#search_filter").val("${param.search_filter}");
	}
	reloadList();
		$("#ck1").on('change', function(){
			$(".ref").prop("checked", this.checked);
		});
	$(document).on("click", ".ref", function(){
		if($(".ref:checked").length==$('tbody tr').length){ 
		    $("#ck1").prop("checked",true);
		}else{ 
		    $("#ck1").prop("checked",false);
		}
		checkBox_check();
		});
	$("#ck1").on("click",function(){
		if($("#ck1").is(":checked") == true){
			$(".rsn_note").prop("disabled",false);
			$(".ref_cnt").prop("disabled",false);
			$(".iNo").prop("disabled",false);
			$(".oNo").prop("disabled",false);
			$(".price").prop("disabled",false);
			$(".rsn_note").prop("value", "");
			$(".ref_cnt").prop("value", "");
		}else{
			$(".rsn_note").prop("disabled",true);
			$(".ref_cnt").prop("disabled",true);
			$(".iNo").prop("disabled",true);
			$(".oNo").prop("disabled",true);
			$(".price").prop("disabled",true);
			$(".rsn_note").prop("value", "환불사유를 입력해주세요.");
			$(".ref_cnt").prop("value", "0");
		}
     });
	$(".ref_req_btn").on("click",function(){
		if($(".ref").is(":checked")==false){
			alert("환불할 물건을 선택해주세요.");
		}else{
			var refCnt = 0;
			var rsnCnt = 0;
			$(".ref_cnt").each(function(){
				if($(this).val() == ""){
					refCnt++;
				}
			});
			
			$(".rsn_note").each(function(){
				if($(this).val() == ""){
					rsnCnt++;
				}
			});
			if(refCnt > 0){
				alert("환불수량을 입력해주세요.");
			}else if(rsnCnt > 0){
				alert("환불사유를 입력해주세요.");
			}else{
				if(confirm("환불 처리하시겠습니까?")){ //팝업 변경 필요
				var params = $("#tbForm").serialize();
				console.log($("#tbForm").serialize());
				$.ajax({
					url : "ref",
					type : "post",  
					dataType :"json",
					data : params,
					success : function(res){
						$("#goForm").submit();
						alert("환불요청이 완료되었습니다.");
						location.href="B_Ord_List";
					},
					error : function(request,status,error){
						console.log(error);
					}
				});
			}
		}
		}
	});
	$(document).on("click", ".ref, #ck1,.ref_cnt", function(){
		var sum = 0;
		$('.ref').each(function(){
			if($(this).is(":checked") == true ){
				sum+=parseInt($(this).parents('tr').find('.price').val())*$(this).parents('tr').find('.ref_cnt').val();
			}
		});
		document.getElementById('sum').innerText=sum;
	});
}); //ready end
function checkBox_check(){
	$(document).on("change", ".ref", function(){
			if(this.checked){
				$(this).parent().parent().children(6).children(".ref_cnt").prop("disabled", false);
				$(this).parent().parent().children(7).children(".rsn_note").prop("disabled", false);
				$(this).parent().parent().children(8).children(".iNo").prop("disabled", false);
				$(this).parent().parent().children(9).children(".oNo").prop("disabled", false);
				$(this).parent().parent().children(10).children(".price").prop("disabled", false);
				$(this).parent().parent().children(7).children(".rsn_note").prop("value", "");
				$(this).parent().parent().children(6).children(".ref_cnt").prop("value", "");
			}else{
				$(this).parent().parent().children(6).children(".ref_cnt").prop("disabled", true);
				$(this).parent().parent().children(7).children(".rsn_note").prop("disabled", true);
				$(this).parent().parent().children(8).children(".iNo").prop("disabled", true);
				$(this).parent().parent().children(9).children(".oNo").prop("disabled", true);
				$(this).parent().parent().children(10).children(".price").prop("disabled", true);
				$(this).parent().parent().children(7).children(".rsn_note").prop("value", "환불사유를 입력해주세요.");
				$(this).parent().parent().children(6).children(".ref_cnt").prop("value", "0");
			}
	});
}
function reloadList(){
	var params = $("#goForm").serialize();
		
	$.ajax({
		url : "RefItem",
		type : "post",  
		dataType :"json",
		data : params,
		success : function(res){
			drawList(res.list);
		},
		error : function(request,status,error){
			console.log(error);
		}
	});
}
function drawList(list){
	var html ="";
	for(var d of list){
			html += "<tr>";
			html += "<td><input type=\"checkbox\" class=\"ref\"></td>";
			html += "<td><input type = \"hidden\" class = \"iNo\" disabled name = \"iNo\" value=\""+d.ITEM_NO+"\"/>"+d.ITEM_NO+"</td>";
			html += "<td><input type = \"hidden\" class = \"oNo\" disabled name = \"oNo\" value=\""+${param.oNo}+"\"/>"+d.ITEM_NAME+"</td>";
			html += "<td>"+d.CNT+"</td>";
			html += "<td><input type = \"hidden\" class = \"price\" disabled value=\""+d.PRICE+"\"/>"+d.PRICE+"</td>";
			if(d.EXPIRY_DATE==null){
				html += "<td></td>";
			}else{
			html += "<td>"+d.EXPIRY_DATE+"</td>";
			}
			html += "<td><input class=\"ref_cnt\" disabled type=\"number\" value=\"0\" name=\"ref_cnt\" maxlength=\"5\" min=\"0\" max=\""+d.CNT+"\"/></td>";
			html += "<td><input class=\"rsn_note\" disabled name=\"rsn_note\" value=\"환불사유를 입력해주세요.\" type=\"text\" /></td>";
			html += "</tr>";
	}
	$("tbody").html(html);
}
</script>
<style type="text/css"></style>
</head>
<body>
<!--컨텐츠 -->
<form action = "#" id = "goForm" method = "post">
	<input type = "hidden" id = "oNo" name = "oNo" value="${param.oNo}"/>
</form>
<div class="content_area">
<div class="content">
<h1 >환불요청</h1>
<ul class="ord_info">
<li><strong>주문번호 : </strong>${param.oNo}</li>
<li><strong>주문날짜 : </strong>${param.erDate}</li>
</ul>
<form action="#" id="tbForm" method="post">
<table cellspacing="0">
	<colgroup>
		<col width="5.5%">
		<col width="10%">
		<col width="12.5%">
		<col width="12.5%">
		<col width="12.5%">
		<col width="12.5%">
		<col width="12.5%">
		<col width="22%">
	</colgroup>
	<thead>
	<tr>
		<th scope="col" style="border-left: none;">
			<input id="ck1" type="checkbox">
		</th>
		<th scope="col">품목코드</th>
		<th scope="col">품목명</th>
		<th scope="col">주문수량(개)</th>
		<th scope="col">상품가격(원)</th>
		<th scope="col">유통기한</th>
		<th scope="col">환불수량</th>
		<th scope="col">환불사유(필수)</th>
	</tr>
	</thead>
	<tbody></tbody>
</table>
<input type = "hidden" id = "oNo" name = "oNo" value="${param.oNo}"/>
</form>
<ul class="tot_ref_price">
	<li><strong>총 환불 예상 금액 : </strong><div style="display: inline;" id="sum">0</div> 원</li>
</ul>
<div class="btn_area">
	<input type="button" class="ref_req_btn" value="환불요청"/>
</div>
</div>
</div>
</body>
</html>