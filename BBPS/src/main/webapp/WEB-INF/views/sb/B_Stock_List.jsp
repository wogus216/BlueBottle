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
	}); //????????? ?????? ??? ????????? ???????????? ?????? ?????? */
	
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
	
	if(result == 0){ //?????? ?????? ???????????? ?????? ??????
		html += "<tr onclick=\"event.cancelBubble=true\" style = \"pointer-events: none;\">";
		html += "<td colspan = \"5\" style = \"text-align: center;\">??????????????? ?????? ???????????? ????????? ????????? ???????????? ????????????.</td>";
		html += "</tr>";	
	} else if (result > 0){ //?????? ?????? ???????????? ?????? 
		for(var d of list){
			
			var to_exp = "";
			to_exp = splitdate(d.EXPIRY_DATE);
			
			html += "<tr itemNo = \""+d.ITEM_NO+"\" safeCnt = \""+d.SAFECNT+"\"" ;
			
			if(to_exp < 3){ //????????? ?????? ??????????????? 3??? ????????? ?????? ??????
				html += "style = \"background-color:#F6CED8;\"";
			}
			
			html += ">";
			html += "<td>"+d.CATE_NAME+"</td>";
			html += "<td>"+d.ITEM_NO+"</td>";
			html += "<td>"+d.ITEM_NAME+"</td>";
			if(d.HSTOCK<d.SAFECNT){//??????????????? ???????????? ???????????? ????????????
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
		if($("#page").val() == i){ //?????? ???????????? ????????? ?????? ???
			html += "<button class = \"on\" page = \""+ i +"\" >"+ i +"</button>";	
		}else{
			html += "<button  page = \""+ i +"\" >"+ i +"</button>";	
		}
		
	}
	
	if($("#page").val() == pb.maxPcount){
		html += "<button page = \""+ pb.maxPcount +"\" >></button>";
	}else{
		html += "<button page = \""+ ($("#page").val()*1+1) +"\" >></button>";/* -??? ????????? ?????? ???????????? ???????????? ????????? ????????? ???  ????????? *1 ????????????*/
	}
	
	html += "<button page = \""+ pb.maxPcount +"\" >>></button>";
	
	$(".page_btn").html(html);
}

function curdate(){ //?????? ?????? yyyy-mm-dd ????????? ?????????
	var today = new Date(); //???????????? ??????

	var dd = today.getDate();
	var mm = today.getMonth()+1;
	var yyyy = today.getFullYear();
		if(dd < 10){
			dd = "0" + dd;
		}
		if(mm < 10){
			mm = "0" + mm;
		} //1?????? ?????? 01??? ??????

		today = yyyy+"-"+mm+"-"+dd;
		
		return today;
}

function splitdate(splitarr){
	
	var today = curdate(); //???????????? yyyy mm dd ?????????
	
	todayarr = today.split('-');//???????????? ?????? ????????????
	exparr = splitarr.split('-'); //???????????? ?????? ????????????
	
	var split_arr = new Date(exparr[0],(exparr[1]*1)-1,exparr[2]); //*1 -1 ????????? date????????? ????????? ????????? month???+1 ?????? ????????? ????????? ?????? ?????? ??????
	var today_arr = new Date(todayarr[0],(todayarr[1]*1)-1,todayarr[2]); //*1 -1 ????????? date????????? ????????? ????????? month???+1 ?????? ????????? ????????? ?????? ?????? ??????
	
	var cha = split_arr.getTime() - today_arr.getTime(); //????????? ???????????? ??????
	var chadate = cha/(1000*60*60*24); //????????? ?????? ???????????? ????????? ??????????????? ??????
	
	return chadate; //?????? ?????? ?????? ??????
}


</script>
</head>
<body>
<div class="top">
   </div>
<div class="content_area">
<div class="content">
<h1>?????? ??????</h1>
<div class="filter_area">
			<select class= "cate">
               <option selected="selected" value = "">??????</option>
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
		<th scope = "col" style="border-left: none;">????????????</th>
		<th scope = "col">????????????</th>
		<th scope = "col">?????????</th>
		<th scope = "col">?????? ?????? ??????</th>
		<th scope = "col">?????? ?????? ??????</th>
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
				<option value="0" selected="selected">????????????</option>
				<option value="1">?????????</option>
			</select>
			<input type="text" class="search_input" name = "search_input" value = "${param.search_input}"/>
			<input type= "button" class="search_btn" value = "??????"/>
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