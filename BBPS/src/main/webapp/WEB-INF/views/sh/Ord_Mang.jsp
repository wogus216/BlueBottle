<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../jh/H_Menu.jsp">
	<c:param name="menuno" value="1"></c:param>
</c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본사주문조회</title>
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
}
tbody td{
	cursor: pointer;
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
input{
	width:200px;
	height:40px;
}
.filter_area{
	text-align: right;
	margin-bottom: 10px;
}
.ref, .ord, #ck1, #ck7{
	margin: 0;
	height: 20px;
	width: 30px;
	vertical-align: middle;
	cursor: pointer;
}
fieldset{
	display:inline;
	border:1px solid;
	margin:0;
	padding-right:10px;
	padding-left:10px;
}
legend{
	font-size:15px;
}
label{
	margin-right:5px;
	vertical-align: middle;
	cursor: pointer;
}
button:focus{outline:none;}

.search_btn{
	height: 40px;
	margin: 0 ;
	padding: 0;
	vertical-align: bottom;
}

select{
	font-size: 15px;	
	height: 40px;
	width : 100px;
}
.start_date, .end_date{
	width: 150px;
	font-size: 15px;
	height: 36px;
}
/* 일반버튼 */
input[type=button]{
	color: white;
	width: 100px;
	height: 40px;
	text-align:center;
	border:0;
	border-radius: 3px;
	font-size:18px;
	cursor: pointer;
	background-color: #01a1dd;
	outline:none;
}
/*검색영역*/
.search_info,.page_area, .page_btn{
	text-align: center;
}

.page_btn button{
	color: black;
	width: 40px;
	height: 40px;
	border:0;
	border-radius: 3px;
	font-size:18px;
	margin:40px 3px;
	box-shadow: 0px 2px 4px 0px rgba(0,0,0,0.2);
	cursor: pointer;
}

.page_btn button:hover{
	color: #01a1dd;
}
.page_btn button:focus{
	outline:none;
}

#search_filter{
	width : 120px;
	vertical-align: middle;
}

#search_input{
	height: 34px;
	vertical-align: middle;
	width : 280px;
	outline:none;
}
.page_btn .on{
	color: #01a1dd;
}
</style>
<script type="text/javascript"
		src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	if("${param.search_filter}" != ""){
		$("#search_filter").val("${param.search_filter}");
	}
	if("${param.BRCH_NO}" != ""){
		$(".brch").val("${param.BRCH_NO}");
	}
	reloadList();
	
	$(".brch").change(function(){
		$("#bNo").val($(".brch").val());
		$("#page").val(1);
		$(".search_input").val($("#Old_search_input").val());
		reloadList();
 	});
	
	$("#search_btn").on("click",function(){
		$("#search_old_txt").val($("#search_input").val());
		$("#start_date").val($(".start_date").val());
		$("#end_date").val($(".end_date").val());
		$("#page").val(1);
		reloadList();
	});
	$(".page_area").on("click", "button", function(){
		$("#search_input").val($("#search_old_txt").val());
		$("#page").val($(this).attr("page"));
		reloadList();
	});
	$("#ck1").on("click",function(){
		if($("#ck1").prop("checked")){
			$(".ord").prop("checked", true);
		}else{
			$(".ord").prop("checked", false);
		}
	});
	$("#ck7").on("click",function(){
		if($("#ck7").prop("checked")){
			$(".ref").prop("checked", true);
		}else{
			$(".ref").prop("checked", false);
		}
	});
	$(".ord").click(function(){ 
		   if($(".ord:checked").length==5){ 
		       $("#ck1").prop("checked",true); 
		    }else{ 
		       $("#ck1").prop("checked",false); 
		    }
		});
	$(".ref").click(function(){ 
		   if($(".ref:checked").length==4){ 
		       $("#ck7").prop("checked",true); 
		    }else{ 
		       $("#ck7").prop("checked",false); 
		    }
		});
	$("input[type=checkbox]").click(function(){
			if($("#ck2").is(":checked")==true){
				$("#ordReq").prop("value", "0")
			}if($("#ck2").is(":checked")==false){
				$("#ordReq").prop("value", null)
			}if($("#ck3").is(":checked")==true){
				$("#ordCnl").prop("value", "1");
			}if($("#ck3").is(":checked")==false){
				$("#ordCnl").prop("value", null)
			}if($("#ck4").is(":checked")==true){
				$("#ordApv").prop("value", "2");
			}if($("#ck4").is(":checked")==false){
				$("#ordApv").prop("value", null)
			}if($("#ck5").is(":checked")==true){
				$("#ordNonApv").prop("value", "3");
			}if($("#ck5").is(":checked")==false){
				$("#ordNonApv").prop("value", null)
			}if($("#ck6").is(":checked")==true){
				$("#sendCom").prop("value", "4");
			}if($("#ck6").is(":checked")==false){
				$("#sendCom").prop("value", null)
			}if($("#ck8").is(":checked")==true){
				$("#refReq").prop("value", "5");
			}if($("#ck8").is(":checked")==false){
				$("#refReq").prop("value", null)
			}if($("#ck9").is(":checked")==true){
				$("#refCnl").prop("value", "6");
			}if($("#ck9").is(":checked")==false){
				$("#refCnl").prop("value", null)
			}if($("#ck10").is(":checked")==true){
				$("#refApv").prop("value", "7");
			}if($("#ck10").is(":checked")==false){
				$("#refApv").prop("value", null)
			}if($("#ck11").is(":checked")==true){
				$("#refNonApv").prop("value", "8");
			}if($("#ck11").is(":checked")==false){
				$("#refNonApv").prop("value", null);
			}
		$("#page").val(1);
		$(".search_input").val($("#Old_search_input").val());
		reloadList();
		});
	
	$("tbody").on("click","tr",function(){
		$("#oNo").val($(this).attr("ord_no"));
		$("#search_input").val($("#search_old_txt").val());
		$("#actionForm").prop("action","Ord_Mang_dtl");
		$("#actionForm").submit();
	}); //tr 클릭 시에는 재고 상세조회 페이지로 이동
	
	$(".start_date").val(lastWeek());
	$(".end_date").val(today());
}); //ready end

function reloadList(){
	var params = $("#actionForm").serialize();
	console.log($("#actionForm").serialize());
	$.ajax({
		url : "Ord_Mangs",
		type : "post",  
		dataType :"json",
		data : params,
		success : function(res){
			drawList(res.list);
			drawPaging(res.pb);
		},
		error : function(request,status,error){
			console.log(error);
		}
	});
}
function drawList(list){
	var html ="";
	for(var d of list){
				html += "<tr ord_no = \""+d.ORD_NO+"\">";
				html += "<td>"+d.ORD_NO+"</td>";
				html += "<td>"+d.ENROLL_DATE+"</td>";
				html += "<td>"+d.BRCH_NAME+"</td>";
				html += "<td>"+d.CODE_NAME+"</th>";
				if(d.PROCESS_DATE == null){
					html += "<td></td>"
				}else{
				html += "<td>"+d.PROCESS_DATE+"</td>"
				}
				html += "</tr>";
	}
	$("tbody").html(html);
}
function today() { //오늘날짜 구하기
	
	  var d = new Date();
	  return splitdate(d);
}

function lastWeek() { //일주일전 날짜 구하기
	  var d = new Date();
	  var dayOfMonth = d.getDate();
	  d.setDate(dayOfMonth - 7);
	  return splitdate(d);
}

function splitdate(resdate){
	
	var dd = resdate.getDate(); // 현재 기준 하루 전까지 min으로 잡을 예정이므로
	var mm = resdate.getMonth()+1;
	var yyyy = resdate.getFullYear();
		if(dd < 10){
			dd = "0" + dd;
		}
		if(mm < 10){
			mm = "0" + mm;
		} //1월인 경우 01로 표기
		
	return yyyy+"-"+mm+"-"+dd;
}
function drawPaging(pb){
	var html = "";
                                    
	html += "<button page = \"1\" style=\"background-color: white\"><<</button>";
	if($("#page").val()=="1"){
		html += "<button page = \"1\" style=\"background-color: white\"><</button>";
	}else{
		html += "<button page = \""+ ($("#page").val()-1) + "\" style=\"background-color: white\"><</button>";
	}

	for(var i = pb.startPcount; i <= pb.endPcount; i++){
		if($("#page").val() == i){
			html += "<button class = \"on\" page = \""+ i +"\" style=\"background-color: white\">"+ i +"</button>";	
		}else{
			html += "<button  page = \""+ i +"\" style=\"background-color: white\">"+ i +"</button>";	
		}
	
	}

	if($("#page").val() == pb.maxPcount){
		html += "<button page = \""+ pb.maxPcount +"\" style=\"background-color: white\">></button>";
	}else{
		html += "<button page = \""+ ($("#page").val()*1+1) +"\" style=\"background-color: white\">></button>";;
	}



	html += "<button page = \""+ pb.maxPcount +"\" style=\"background-color: white\">>></button>";

	$(".page_btn").html(html);
}
</script>
</head>
<body>
<div class="content_area">
<div class="content">
<h1>주문조회</h1>

<div class="filter_area">
	<select class="brch">
		<option selected="selected" value="">지점명</option>
		<c:forEach items="${brchList}" var = "d">
           <option value="${d.BRCH_NO}">
           <c:out value="${d.BRCH_NAME}"/></option>
         </c:forEach>
	</select>
	<input class="start_date" type = "date"/>
	<input class="end_date" type = "date"/>
</div>
<fieldset style = "margin-right:10px;">
		<legend>주문선택</legend>
		<input type = "checkbox" id="ck1" checked="checked"/><label id="ck1" for="ck1">전체</label>
		<input type = "checkbox" id="ck2" class="ord" checked="checked" value="0"/><label for="ck2">주문요청</label>
		<input type = "checkbox" id="ck3" class="ord" checked="checked" value="1"/><label for="ck3">주문요청취소</label>
		<input type = "checkbox" id="ck4" class="ord" checked="checked" value="2"/><label for="ck4">주문승인</label>
		<input type = "checkbox" id="ck5" class="ord" checked="checked" value="3"/><label for="ck5">주문승인거부</label>
		<input type = "checkbox" id="ck6" class="ord" checked="checked" value="4"/><label style = "margin-right:0px;" for="ck6">발송완료</label>
		
	</fieldset>
	<fieldset style =  "float:right; margin-bottom: 20px;">
		<legend>환불선택</legend>
		<input type = "checkbox" id="ck7" checked="checked"/><label id="ck6" for="ck7">전체</label>
		<input type = "checkbox" id="ck8" class="ref" checked="checked" value="5"/><label for="ck8">환불요청</label>
		<input type = "checkbox" id="ck9" class="ref" checked="checked" value="6"/><label for="ck9">환불요청취소</label>
		<input type = "checkbox" id="ck10" class="ref" checked="checked" value="7"/><label for="ck10">환불승인</label>
		<input type = "checkbox" id="ck11" class="ref" checked="checked" value="8"/><label style = "margin-right:0px;" for="ck11">환불승인거부</label>
	</fieldset>
<table cellspacing="0">
	<colgroup>
		<col width="20%" />
		<col width="20%" />
		<col width="20%" />
		<col width="20%" />
		<col width="20%" />
	</colgroup>
	<thead>
	<tr>
		<th scope=col style= "border-left: none;" scope=col>주문번호</th>
		<th scope=col>주문날짜</th>
		<th scope=col>지점명</th>
		<th scope=col>처리상태</th>
		<th scope=col>처리날짜</th>
	</tr>
	</thead>
	<tbody></tbody>
</table>
<div class="search_area" style = "margin-top : 30px;">
	<div class="search_info">
		<form action = "#" id = "actionForm" method = "post">
			<input type = "hidden" id = "oNo" name = "oNo"/>
			<input type = "hidden" id = "page" name = "page" value = "${page}"/>
			<select id ="search_filter" name="search_filter">
				<option value="0" selected="selected">주문번호</option>
			</select>
			<input type="text" name="search_input" id="search_input" value="${param.search_input}"/>
			<input type="hidden" name="search_old_txt" id="search_old_txt" value="${param.search_input}"/>
			<input type = "hidden" id = "bNo" name = "bNo"/>
			
			<input type = "hidden" id = "ordReq" name = "ordReq" value="0"/>
			<input type = "hidden" id = "ordCnl" name = "ordCnl" value="1"/>
			<input type = "hidden" id = "ordApv" name = "ordApv" value="2"/>
			<input type = "hidden" id = "ordNonApv" name = "ordNonApv" value="3"/>
			<input type = "hidden" id = "sendCom" name = "sendCom" value="4"/>
			<input type = "hidden" id = "refReq" name = "refReq" value="5"/>
			<input type = "hidden" id = "refCnl" name = "refCnl" value="6"/>
			<input type = "hidden" id = "refApv" name = "refApv" value="7"/>
			<input type = "hidden" id = "refNonApv" name = "refNonApv" value="8"/>
			
			<input type = "hidden" id = "start_date" name = "start_date"/>
			<input type = "hidden" id = "end_date" name = "end_date"/>
			
			<input type="button" class="search_btn" id="search_btn" value="검색"/>
		</form>
	</div>
</div>
<div class="page_area">
		<div class="page_btn"></div>
</div>
</div>
</div>
</body>
</html>