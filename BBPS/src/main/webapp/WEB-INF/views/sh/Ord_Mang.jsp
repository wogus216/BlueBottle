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
.ref, .ord, #ordWholeCk, #refWholeCk{
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
input[type='button']:focus{outline:none;}
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
.on{
	font-weight: bold;
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
	$("#ordWholeCk").on("click",function(){
		if($("#ordWholeCk").prop("checked")){
			$(".ord").prop("checked", true);
		}else{
			$(".ord").prop("checked", false);
		}
	});
	$("#refWholeCk").on("click",function(){
		if($("#refWholeCk").prop("checked")){
			$(".ref").prop("checked", true);
		}else{
			$(".ref").prop("checked", false);
		}
	});
	$(".ord").click(function(){ 
		   if($(".ord:checked").length==5){ 
		       $("#ordWholeCk").prop("checked",true); 
		    }else{ 
		       $("#ordWholeCk").prop("checked",false); 
		    }
		});
	$(".ref").click(function(){ 
		   if($(".ref:checked").length==4){ 
		       $("#refWholeCk").prop("checked",true); 
		    }else{ 
		       $("#refWholeCk").prop("checked",false); 
		    }
		});
	$("input[type=checkbox]").click(function(){
		for(var i=0; i<5; i++){
			if($("#ck"+i+"").is(":checked")==true){
				$("#ord"+i+"").prop("value", ""+i+"")
			}if($("#ck"+i+"").is(":checked")==false){
				$("#ord"+i+"").prop("value", null)
			}
		}
		for(var i=5; i<9; i++){
			if($("#ck"+i+"").is(":checked")==true){
				$("#ref"+i+"").prop("value", ""+i+"")
			}if($("#ck"+i+"").is(":checked")==false){
				$("#ref"+i+"").prop("value", null)
			}
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
		<input type = "checkbox" id="ordWholeCk" checked="checked"/><label for="ordWholeCk">전체</label>
		<input type = "checkbox" id="ck0" class="ord" checked="checked" value="0"/><label for="ck0">주문요청</label>
		<input type = "checkbox" id="ck1" class="ord" checked="checked" value="1"/><label for="ck1">주문요청취소</label>
		<input type = "checkbox" id="ck2" class="ord" checked="checked" value="2"/><label for="ck2">주문승인</label>
		<input type = "checkbox" id="ck3" class="ord" checked="checked" value="3"/><label for="ck3">주문승인거부</label>
		<input type = "checkbox" id="ck4" class="ord" checked="checked" value="4"/><label style = "margin-right:0px;" for="ck4">발송완료</label>
		
	</fieldset>
	<fieldset style =  "float:right; margin-bottom: 20px;">
		<legend>환불선택</legend>
		<input type = "checkbox" id="refWholeCk" checked="checked"/><label for="refWholeCk">전체</label>
		<input type = "checkbox" id="ck5" class="ref" checked="checked" value="5"/><label for="ck5">환불요청</label>
		<input type = "checkbox" id="ck6" class="ref" checked="checked" value="6"/><label for="ck6">환불요청취소</label>
		<input type = "checkbox" id="ck7" class="ref" checked="checked" value="7"/><label for="ck7">환불승인</label>
		<input type = "checkbox" id="ck8" class="ref" checked="checked" value="8"/><label style = "margin-right:0px;" for="ck8">환불승인거부</label>
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
			<input type = "hidden" id = "menuNo" name = "menuNo" value="1"/>
			<input type = "hidden" id = "uNo" name = "uNo" value="${sUSERNo}"/>
			<input type = "hidden"  id = "depNo" name="depNo" value="${sDEPNo}">
			<input type = "hidden" id = "ord0" name = "ord0" value="0"/>
			<input type = "hidden" id = "ord1" name = "ord1" value="1"/>
			<input type = "hidden" id = "ord2" name = "ord2" value="2"/>
			<input type = "hidden" id = "ord3" name = "ord3" value="3"/>
			<input type = "hidden" id = "ord4" name = "ord4" value="4"/>
			<input type = "hidden" id = "ref5" name = "ref5" value="5"/>
			<input type = "hidden" id = "ref6" name = "ref6" value="6"/>
			<input type = "hidden" id = "ref7" name = "ref7" value="7"/>
			<input type = "hidden" id = "ref8" name = "ref8" value="8"/>
			
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