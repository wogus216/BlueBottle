<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../jh/B_Menu.jsp">
	<c:param name="menuno" value="14"></c:param>
</c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

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
.filter_area{
	text-align: right;
	margin-bottom: 10px;
}

select{
	font-size: 15px;	
	height: 40px;
	width : 100px;
}
.add_btn{
	height: 40px;
	padding: 0;
	vertical-align: bottom;
}
h1 {
 margin-bottom: 40px;
 font-size: 30px;
}
table {
    width: 100%;
    table-layout: fixed;
    background: #ffffff;
	margin: 10px 0 0 1px;
	border-top: 2px solid #3498db;
	border-bottom: 2px solid #d9d9d9;
}

tr {
    display: table-row;
    cursor: pointer;
}

tr:hover{
	background-color: #f1f1f1;
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

.edit_submit_btn,.edit_cnl_btn,.discard_submit_btn,.discard_cnl_btn{
	display:none;
}

.edit_btn,.search_btn,.edit_submit_btn,.discard_submit_btn{
	color: white;
	width: 100px;
	height: 40px;
	text-align:center;
	border:0;
	border-radius: 3px;
	font-size:18px;
	margin:10px;
	cursor: pointer;
	background-color: #01a1dd;
	outline:none;
	vertical-align: middle;
	margin:0px 0px 0px 10px;
}

.discard_btn,.edit_cnl_btn,.discard_cnl_btn{
	color: white;
	width: 100px;
	height: 40px;
	text-align:center;
	border:0;
	border-radius: 3px;
	font-size:18px;
	margin:10px;
	cursor: pointer;
	background-color: #bf4040;
	outline:none;
	vertical-align: middle;
	margin:0px 0px 0px 10px;
}

.search_info,.page_area, .page_btn{
	text-align: center;
}
.page_area, .page_btn{
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
}
.page_btn button:hover{
	color: #01a1dd;
}

.page_btn button:focus{
	outline:none;
}
.search_filter{
	width : 120px;
}

.search_input{
	height: 34px;
	width : 280px;
	outline:none;
}

.search_filter,.search_input{
	vertical-align: top;
}

.page_btn button{
	background-color: white;
}

.on{
	background-color: blue;
	font-weight: bold;
}
.start_date, .end_date{
	width: 150px;
	font-size: 15px;
	height: 36px;
}
.editcurCnt,.editsafeCnt{
	margin: 0px;
	width : 80%;
}
</style>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	if("${param.search_filter}" != ""){
		$("#search_filter").val("${param.search_filter}");
	}
	
	if("${param.cate}" != ""){
		$(".cate").val("${param.cate}");
	}
	
	reloadList();
	
	$(".search_btn").on("click",function(){
		$("#cate").val($(".cate").val());
		$("#Old_search_input").val($(".search_input").val());
		$("#page").val(1);
		reloadList();	
	});
	
	$(".cate").change(function(){
		$("#cate").val($(".cate").val());
		$(".search_input").val($("#Old_search_input").val());
		$("#page").val(1);
 		reloadList();
 	});
	
	
	$(".top_menu").on("click","a",function(){
		$(".top_menu a").attr("style","color: black");
		$(this).css("color", "#01a1dd");
		$(this).parent().parent().children(1).css("color", "#01a1dd");
	});
	$(".sub").hover(function(){
		$("li").css("background-color","white");
		$(this).parent("li").css("background-color","#f1f1f1");
	
	},function(){
			$("li").css("background-color","white");
	});
	
	$(".page_btn").on("click","button",function(){
		$("#page").val($(this).attr("page"));
		$(".search_input").val($("#Old_search_input").val());
		reloadList();
	});
	
	$("tbody").on("click","tr",function(){
		$("#itemNo").val($(this).attr("itemNo"));
		$("#safeCnt").val($(this).attr("safeCnt"));
		$(".search_input").val($("#Old_search_input").val());
		$("#actionForm").attr("action","B_Stock_Dtl");
		$("#actionForm").submit();
	}); 
	
	/* $(".edit_btn").on("click",function(){
		$(".search_input").val($("#Old_search_input").val());
		$("#actionForm").attr("action","B_Stock_Edit");
		$("#actionForm").submit();
	}); //나중에 마감 시 나오는 페이지로 변경 예정 */
	
}); //ready end

function reloadList(){
	var params = $("#actionForm").serialize();
	
	$.ajax({
		url : "B_Stock_Lists",
		type : "post",  
		dataType :"json",
		data : params,
		success : function(res){
			drawbrchstockList(res.list,res.result);
			drawdiscardPaging(res.pb);
		},
		error : function(request,status,error){
			console.log(error);
		}
	});
}

function drawbrchstockList(list,result){
	
	var html ="";
	
	if(result == 0){ //결과 행이 존재하지 않는 경우
		html += "<tr onclick=\"event.cancelBubble=true\" style = \"pointer-events: none;\">";
		html += "<td colspan = \"5\" style = \"text-align: center;\">검색조건에 맞는 데이터가 없거나 품목이 존재하지 않습니다.</td>";
		html += "</tr>";	
	} else if (result > 0){ //결과 행이 존재하는 경우 
		for(var d of list){
			
			var to_exp = "";
			to_exp = splitdate(d.EXPIRY_DATE);
			
			html += "<tr itemNo = \""+d.ITEM_NO+"\" safeCnt = \""+d.SAFECNT+"\"" ;
			
			if(to_exp < 3){ //현재일 기준 유통기한이 3일 이하로 남은 재고
				html += "style = \"background-color:#F6CED8;\"";
			}
			
			html += ">";
			html += "<td>"+d.CATE_NAME+"</td>";
			html += "<td>"+d.ITEM_NO+"</td>";
			html += "<td>"+d.ITEM_NAME+"</td>";
			if(d.HSTOCK<d.SAFECNT){//재고수량이 안전재고 수량보다 작은경우
				html += "<td style = \"color:red; font-weight : bold;\">"+d.HSTOCK+"</td>";
				html += "<td style = \"color:red; font-weight : bold;\">"+d.SAFECNT+"</td>";
			}else{
				html += "<td>"+d.HSTOCK+"</td>";
				html += "<td>"+d.SAFECNT+"</td>";
			}
			html += "</tr>";
		}
		
	}
	
	$("tbody").html(html);
}


function drawdiscardPaging(pb){
	var html = "";
	                                    
	html += "<button page = \"1\"><<</button>";
	if($("#page").val()=="1"){
		html += "<button page = \"1\"><</button>";
	}else{
		html += "<button page = \""+ ($("#page").val()-1) + "\" ><</button>";
		
	}
	
	for(var i = pb.startPcount; i <= pb.endPcount; i++){
		if($("#page").val() == i){ //현재 페이지의 값이랑 같을 때
			html += "<button class = \"on\" page = \""+ i +"\" >"+ i +"</button>";	
		}else{
			html += "<button  page = \""+ i +"\" >"+ i +"</button>";	
		}
		
	}
	
	if($("#page").val() == pb.maxPcount){
		html += "<button page = \""+ pb.maxPcount +"\" >></button>";
	}else{
		html += "<button page = \""+ ($("#page").val()*1+1) +"\" >></button>";/* -는 알아서 숫자 빠지는데 더하기는 문자열 처리가 됨  그래서 *1 해줘야됨*/
	}
	
	html += "<button page = \""+ pb.maxPcount +"\" >>></button>";
	
	$(".page_btn").html(html);
}

function curdate(){ //현재 날짜 yyyy-mm-dd 형태로 구하기
	var today = new Date(); //오늘날짜 체크

	var dd = today.getDate();
	var mm = today.getMonth()+1;
	var yyyy = today.getFullYear();
		if(dd < 10){
			dd = "0" + dd;
		}
		if(mm < 10){
			mm = "0" + mm;
		} //1월인 경우 01로 표기

		today = yyyy+"-"+mm+"-"+dd;
		
		return today;
}

function splitdate(splitarr){
	
	var today = curdate(); //현재날짜 yyyy mm dd 형태로
	
	todayarr = today.split('-');//오늘날짜 배열 잘라넣기
	exparr = splitarr.split('-'); //유통기한 배열 잘라넣기
	
	var split_arr = new Date(exparr[0],(exparr[1]*1)-1,exparr[2]); //*1 -1 처리는 date객체가 되면서 알아서 month에+1 되는 것으로 보여서 해당 처리 진행
	var today_arr = new Date(todayarr[0],(todayarr[1]*1)-1,todayarr[2]); //*1 -1 처리는 date객체가 되면서 알아서 month에+1 되는 것으로 보여서 해당 처리 진행
	
	var cha = split_arr.getTime() - today_arr.getTime(); //결과값 밀리세컨 단위
	var chadate = cha/(1000*60*60*24); //결과로 받은 밀리세컨 일자로 표현되도록 계산
	
	return chadate; //날짜 차이 일수 리턴
}


</script>
</head>
<body>
<div class="top">
   </div>
<div class="content_area">
<div class="content">
<h1>재고 목록</h1>
<div class="filter_area">
			<select class= "cate">
               <option selected="selected" value = "">전체</option>
                  <c:forEach items="${catelist}" var = "d">
                   <option value="${d.CATE_NO}">
                   <c:out value="${d.CATE_NAME}"/> </option>
                  </c:forEach>
            </select>
		</div>
<div class = "Stock_List">
<table cellspacing="0">
	<colgroup>
	<col width = "18%">
	<col width = "18%">
	<col width = "28%">
	<col width = "18%">
	<col width = "18%">
	</colgroup>
	<thead>
	<tr>
		<th scope = "col" style="border-left: none;">카테고리</th>
		<th scope = "col">품목코드</th>
		<th scope = "col">품목명</th>
		<th scope = "col">현재 재고 수량</th>
		<th scope = "col">안전 재고 수량</th>
	</tr>
	</thead>
	<tbody></tbody>
</table>
</div>
<div class="search_area" style = "margin-top : 30px;">
		<div class="search_info">
		<form action = "#" id = "actionForm" method = "post">
			<input type = "hidden" id = "Old_search_input" name = "Old_search_input" value ="${param.search_input}" />
			<input type = "hidden" id = "page" name = "page" value = "${page}"/>
		<select id="search_filter" name = "search_filter">
				<option value="0" selected="selected">품목코드</option>
				<option value="1">품목명</option>
			</select>
			<input type="text" class="search_input" name = "search_input" value = "${param.search_input}"/>
			<input type= "button" class="search_btn" value = "검색"/>
			<input type = "hidden" id = "cate" name = "cate"/>
			<input type = "hidden" id = "itemNo" name = "itemNo"/>
			<input type = "hidden" id = "safeCnt" name = "safeCnt"/>
			<input type="hidden" id="brchNo" name="brchNo" value="${sBRCHNo}"/>
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