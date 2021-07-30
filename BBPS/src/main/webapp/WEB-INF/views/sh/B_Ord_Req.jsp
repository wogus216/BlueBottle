<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../jh/B_Menu.jsp">
	<c:param name="menuno" value="19"></c:param>
</c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점주문요청</title>
<style type="text/css">
/* 미들 부분 */
.content_area{
 	width: 1380px;
    height: 900px;
    margin: 0 auto;
    margin-top: 60px;
}

.content_1{
   display: inline-block;
   vertical-align: top;
   max-width: 640px;
    min-width: 300px;
    margin-left: 30px;
    margin-right: 5px;
    width: 640px;
}
.content_2{
   display: inline-block;
   vertical-align: top;
  	max-width: 670px;
   min-width: 300px; 
   width: 670px;
}

/* 게시판 */
h1 {
    margin-bottom: 40px;
    font-size: 30px;
}
.title_1, .title_2{
   font-size: 26px;
   font-weight: bold;
   margin-bottom: 20px;
}

select{
   font-size: 15px;   
   width: 100px;
   height: 40px;
   cursor: pointer;
}
.blank{
   height: 40px;
   font-size: 0;
}


table{
    width: 100%;
    table-layout: fixed;
    background: #ffffff;
   	margin: 10px 0;
   	border-top: 2px solid #01a1dd;
   	border-bottom: 2px solid #d9d9d9;   
   	text-align: center;
}
tr{
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
   height: 25px;
   border-left: 1px solid #eaeaea;
   border-bottom: 1px solid #eaeaea;
}
#item td:nth-child(1), #item th:nth-child(1) {
  width: 14%;
}
#item td:nth-child(2), #item th:nth-child(2) {
  width: 10%;
}
#item td:nth-child(3), #item th:nth-child(3) {
  width: 39%;
}
#item td:nth-child(4), #item th:nth-child(4) {
  width: 13%;
}
#item td:nth-child(5), #item th:nth-child(5) {
  width: 10%;
}
#item td:nth-child(6), #item th:nth-child(6) {
  width: 15%;
}

#choose td:nth-child(1), #choose th:nth-child(1) {
  width: 13%;
}
#choose td:nth-child(2), #choose th:nth-child(2) {
  width: 9%;
}
#choose td:nth-child(3), #choose th:nth-child(3) {
  width: 33%;
}
#choose td:nth-child(4), #choose th:nth-child(4) {
  width: 12%;
}
#choose td:nth-child(5), #choose th:nth-child(5) {
  width: 9%;
}
#choose td:nth-child(6), #choose th:nth-child(6) {
  width: 12%;
}
#choose td:nth-child(7), #choose th:nth-child(7) {
  width: 10%;
}

#item tbody{
   overflow-y:auto;
   overflow-x:hidden;
   float:left;
   width:640px; 
   height:400px;
   display:block;
}
#choose tbody{
   overflow-y:auto;
   overflow-x:hidden;
   float:left;
   width:670px; 
   height:400px;
   display:block;
}
#item thead{
    display : table;
    table-layout : fixed;
    width :640px;
}
#choose thead{
    display : table;
    table-layout : fixed;
    width :670px;
}

#item tr{
    display : table;
    table-layout : fixed;
    width :640px;
}
#choose tr{
    display : table;
    table-layout : fixed;
    width :670px;
}
td:first-child, th:first-child{
   border-left: none;
}

.ord_cnt{
   height: 25px;
   width: 50px;
   text-align: center;
   font-size: 15px;
   font-family: 'Malgun Gothic'
}
.del_btn{
   cursor: pointer;
}

.itemCk{ 
   margin: 0;
   height: 20px;
   width: 30px;
   vertical-align: middle;
   
}

#tot_ref_price li{
   font-size:19px;
   margin:0 10px;
   float: right;
}
#tot_ref_price{
   max-width: 1000px;
   list-style-type: none;
   padding: 0;
}

textarea:focus{
   outline: none;
}

button:focus{outline:none;}

input:focus{outline:none;}

.ord_req_btn{
   width:180px;
   background-color: #01a1dd;
   font-weight: bold;
   margin-buttom: 10px 0px;
   color: white;
   height: 50px;
   text-align:center;
   border:0;
   border-radius: 3px;
   background-color: #01a1dd;
   font-size:22px;
   margin-button:0px;
   cursor: pointer;
}
.search_area, .page_area {
   width: 100%;
   margin-top: 15px;
}
.page_area{
   margin-top: 10px;
}
.search_info,.page_area, .page_btn{
   text-align: center;
}

.search_btn{
   height: 40px;
   margin: 0 ;
   padding: 0;
   vertical-align: bottom;
   color: white;
   width: 100px;
   text-align:center;
   border:0;
   border-radius: 3px;
   background-color: #01a1dd;
   font-size:18px;
   cursor: pointer;
}
.btn_area{
	padding-top: 40px;
	text-align: right;
}
.page_btn button{
   color: black;
   width: 40px;
   height: 40px;
   border:0;
   border-radius: 3px;
   font-size:18px;
   margin:10px 3px;
   box-shadow: 0px 2px 4px 0px rgba(0,0,0,0.2);
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
.search_info{
	padding-top: 10px;
}
</style>
<script type="text/javascript"
   src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.slimscroll.js"></script>
<script type="text/javascript">
var rowData = new Array();
var tdArr = new Array();
var cate;
var iNo;
var iName;
var price;
var min;
$(document).ready(function(){
	if("${param.search_filter}" != ""){
		$("#search_filter").val("${param.search_filter}");
	}
	if("${param.cate}" != ""){
		$(".cate").val("${param.cate}");
	}
   	reloadItemList();
   	
   	$(".cate").change(function(){
		$("#cate").val($(".cate").val());
		$(".search_input").val($("#Old_search_input").val());
		$("#page").val(1);
		reloadItemList();
 	});
   	
   	$("#search_btn").on("click",function(){
		$("#cate").val($(".cate").val());
		$("#search_old_txt").val($("#search_input").val());
		$("#page").val(1);
		reloadItemList();
	});
   	
   $(".list_btn").on("click",function(){
      location.href="B_Ord_List";
   });
   $(document).on("click",".itemCk",function(){
	   tdArr = [];
		$(".itemCk:checked").each(function(i){
			var tr = $(this).parent().parent();
			var td =tr.children();
			
			cate=td.eq(0).text();
			iNo=td.eq(1).text();
			iName=td.eq(2).text();
			price=td.eq(3).text();
			min=td.eq(4).text();
			
			tdArr.push(cate);
			tdArr.push(iNo);
			tdArr.push(iName);
			tdArr.push(price);
			tdArr.push(min);
			
    	});
		buyList();	
   });
   $(document).on("click",".del_btn",function(){
	   
	   	var tr = $(this).parent().parent();
		var td =tr.children();
		var pickiNo;
		
		var left_tr = $(".item input").parent().parent();
		var left_td =tr.children();
		
		pickiNo=td.eq(1).text();
		
		$(".itemCk:checked").each(function(i){
			
			if($(this).parent().parent().children().eq(1).text()==pickiNo){
				$(this).parent().parent().children(6).children().prop("checked",false);
				tr.remove();
		}
   	});
		
   });
	$(".ord_req_btn").on("click", function(){
		if(tdArr.length==0){
			alert("주문할 물건을 선택해주세요.");
		}else{
			if(confirm("주문하시겠습니까?")){
			var what;
			var params = $("#actionForm").serialize();
			
			$.ajax({
				url : "ord",
				type : "post",  
				dataType :"json",
				data : params,
				success : function(res){
					if(res.msg == "success"){
						alert("주문요청이 완료되었습니다.");
						location.href="B_Ord_List";
					}else if (res.msg == "failed"){
	                    alert("주문에 실패하였습니다."); // 팝업 변경 필요
	                 }else {
	                    alert("주문 중 문제가 발생하였습니다."); // 팝업 변경 필요
	                 }
				},
				error : function(request,status,error){
					console.log(error);
				}
			});
		}
	}
});
	$(document).on("click", ".itemCk, .ord_cnt, .del_btn", function(){
		var sum = 0;
		$('.ord_cnt').each(function(){
			sum+=parseInt($(this).parents('tr').children().eq(3).text())*$(this).parents('tr').find('.ord_cnt').val();
		});
		document.getElementById('sum').innerText=sum;
	});
	$(document).on("click", ".del_btn", function(){
		if($("#choose tr").size()==1){
			tdArr = [];
			buyList();
		}
	});
}); //ready end
function reloadItemList(){
   var params = $("#goForm").serialize();
      
   $.ajax({
      url : "Ord_Item_Lists",
      type : "post",  
      dataType :"json",
      data : params,
      success : function(res){
         drawItemList(res.list);
      },
      error : function(request,status,error){
         console.log(error);
      }
   });
}
function drawItemList(list){
   var html ="";
   for(var d of list){
            html += "<tr>";
            html += "<td>"+d.CATE_NAME+"</td>";
            html += "<td>"+d.ITEM_NO+"</td>";
            html += "<td style=\"text-align:left;\">"+d.ITEM_NAME+"</td>";
            html += "<td>"+d.PRICE+"</td>";
            html += "<td>"+d.MIN_ORD_UNIT+"</td>";
            html += "<td><input class=\"itemCk\" type=\"checkbox\"></td>";
            html += "</tr>";
   }
   $("#item tbody").html(html);
}
function buyList(){
		var html = "";
		
		var a=0;
		var b=5;
			if(tdArr.length==0){
				html+="<tr>";
	       	 	html += "<td colspan = \"7\" style = \"text-align: center;\">담은 상품이 없습니다.</td>";
	       	 	html+="</tr>";
			}else{
				for(var i=0; i<(tdArr.length/5); i++){
					html += "<tr>";
				for(var j=a; j<b; j++){
        			html += "<td>"+tdArr[j]+"</td>";
				}
			
        	html += "<td style=\"padding:0;\"><input class=\"ord_cnt\" name=\"ord_cnt\" type=\"number\" value=\""+tdArr[b-1]+"\" min=\""+tdArr[b-1]+"\" maxlength=\"5\"/></td>";
       	 	html += "<td><input class=\"del_btn\" type=\"button\" value=\"X\" /><input name=\"iNo\" type = \"hidden\" value=\""+tdArr[b-4]+"\"/><input name=\"price\" type = \"hidden\" value=\""+tdArr[b-2]+"\"/></td>";
        	html += "</tr>";
        	a=a+5;
        	b=b+5;
		}
	}
	$("#choose tbody").html(html);
}
</script>
<style type="text/css"></style>
</head>
<body>
<!--컨텐츠 -->
<div class="content_area">
	<h1>주문요청</h1>
<div class="content_1">
<div class="title_1">주문 가능 품목 리스트</div>
   <select class= "cate">
               <option selected="selected" value = "">전체</option>
                  <c:forEach items="${catelist}" var = "d">
                   <option value="${d.CATE_NO}">
                   <c:out value="${d.CATE_NAME}"/> </option>
                  </c:forEach>
            </select>
<table id="item" cellspacing="0">
   <colgroup>
      <col width="14%">
      <col width="14%">
      <col width="39%">
      <col width="13%">
      <col width="10%">
      <col width="10%">
   </colgroup>
   <thead>
   <tr>
      <th scope="col">카테고리</th>
      <th scope="col">품목코드</th>
      <th scope="col">품목명</th>
      <th scope="col">가격(원)</th>
      <th scope="col">최소수량</th>
      <th scope="col">담기</th>
   </tr>
   </thead>
   <tbody></tbody>
</table>
<div class="search_area">
      <div class="search_info">
         <form action = # id = "goForm" method = "post">
         <input type="hidden"  id="oNo" name="oNo" >
			<input type = "hidden" id = "cate" name = "cate"/>
			<input type="hidden"  id="bNo" name="bNo" value="${sBRCHNo}">
			<select id ="search_filter" name="search_filter">
           		<option value="0" selected="selected">품목코드</option>
            	<option value="1">품목명</option>
         	</select>
         	<input type="text" name="search_input" id="search_input" value="${param.search_input}"/>
			<input type="hidden" name="search_old_txt" id="search_old_txt" value="${param.search_input}"/>
			<input type="button" class="search_btn" id="search_btn" value="검색"/>
         </form>
      </div>
</div>   
</div>
<div class="content_2">
<div class="title_2">담은 목록</div>
<div class="blank"></div>
<form action = "#" id = "actionForm" method = "post">
<input type="hidden"  id="bNo" name="bNo" value="${sBRCHNo}">
<table id="choose" cellspacing="0" >

   <thead>
   <tr>
      <th scope="col">카테고리</th>
      <th scope="col">품목코드</th>
      <th scope="col">품목명</th>
      <th scope="col">가격(원)</th>
      <th scope="col">최소수량</th>
      <th scope="col">수량</th>
      <th scope="col"></th>
   </tr>
   </thead>
   <tbody>
   		<tr>
	  		<td colspan = "7" style = "text-align: center;">담은 상품이 없습니다.</td>
		</tr>
	</tbody>
</table>
</form>
<ul id="tot_ref_price">
   <li><strong>총 주문 금액 : </strong><div style="display: inline;" id="sum">0</div> 원</li>
</ul>
<div class="btn_area">
   <input type="button" class="ord_req_btn" value="주문요청"/>
</div>
</div>
</div>
</body>
</html>