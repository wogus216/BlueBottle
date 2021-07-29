<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../jh/H_Menu.jsp">
	<c:param name="menuno" value="2"></c:param>
</c:import>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 상단 바 */
ul {
   list-style-type: none;
   margin: 0;
   padding: 0;
  
}

ul:after {
   content: '';
   display: block;
   clear: both;
}

li {
   float: left;
    height: 62px;
}

/* 미들 부분 */
.content_area{
	width: 1250px;
	height: 100%;
	margin: 0 auto;
	margin-top: 50px;
}

.content{
	max-width: 1250px;
    min-width: 700px;
    margin-left: 30px;
    width: 1250px;
}

/* 품목등록 */

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

/*팝업디자인*/
.popup_Content table{
	width: 100%;
    background: #ffffff;
	margin: 10px 0;
	border-top: 2px solid #01a1dd;
	border-bottom: 2px solid #d9d9d9;
}

.popup_Content th{
	background: #e8e8e8;
    padding: 0px;
    border-bottom: 1px solid #ffffff;
    border-left: 1px solid #ffffff;
    font-size:15px;
}


.popup_Content td{
	font-size:15px;
	padding:0px;
	border-top: 1px solid #eaeaea;
	border-left: 1px solid #eaeaea;
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

.popup_Content thead{
	display : table;
	table-layout : fixed;
	width : 100%;
}

.popup_Content tbody{
	display : block;
	max-height : 120px;
	width : 100%px;
	overflow : auto;
	overflow-x : hidden;
}

.popup_Content tr{
	display : table;
	table-layout : fixed;
	width : 100%;
}

.stock_rel_history thead,.stock_discard_history thead{
	display : table;
	table-layout : fixed;
	width : 1250px;
}

.stock_rel_history tbody,.stock_discard_history tbody{
	display : block;
	max-height : 287px;
	width : 1250px;
	overflow : auto;
	overflow-x : hidden;
}

.stock_rel_history tr,.stock_discard_history tr{
	display : table;
	table-layout : fixed;
	width : 1250px;
}

td:first-child{
	border-left: none;
}

.stock_discard_history td:nth-child(7){
	padding : 0px;
	text-align: center;
}

.discard_cnt,.discard_{
	width:220px;
	height:20px;
}

.stock_discard_btn{
	color: white;
	width: 60px;
	height: 30px;
	text-align:center;
	border:0;
	border-radius: 3px;
	font-size:15px;
	margin:0px;
	cursor: pointer;
	background-color: #bf4040;
	outline:none;
}



.item_info, .button_area{
	display: inline-block;
	vertical-align: top;
}

.button_area{
	float: right;
}


label{
	font-weight: bold;
	font-size : 15pt;
	margin-bottom : 50px;
}

.item_info li{
	font-size:19px;
	margin:10px;
	height : 40px;
	
}
.item_info ul{
	max-width: 1000px; 
}

.stock_add_btn,.discard_btn,.discard_cnl_btn,.discard_submit_btn{
	height: 40px;
	margin: 0 ;
	padding: 0;
	vertical-align: middle;
}

.stock_add_btn,.discard_submit_btn{
	background-color: #01a1dd;
}

.discard_btn,.discard_cnl_btn{
	background-color: #bf4040;
}

.discard_cnl_btn,.discard_submit_btn{
	display: none;
}

.discard_cnl2_btn{ /* 원복 버튼에 사용할 것 이름 다시 지어야함*/
	background-color: #bf4040;
	width: 50px;
	height: 30px;
	font-size:15px;
	margin: 0px;
}
select{
	font-size: 15px;	
	height: 40px;
	width : 100px;
	
}
/* 일반버튼 */
.stock_add_btn,.discard_btn,.discard_submit_btn,.discard_cnl_btn{
	color: white;
	width: 100px;
	height: 40px;
	text-align:center;
	border:0;
	border-radius: 3px;
	font-size:18px;
	margin: 10px;
	cursor: pointer;
	outline:none;
}

.list_btn{
	text-align:center;
}

.list_btn button{
	width:200px;
	height: 50px;
	background-color: #01a1dd;
	font-weight: bold;
	font-size: 22px;
}


/*입고이력버튼*/
.stor_history_btn{ 
	color: white;
	background-color: #b5b5b5;
	width: 80px;
	height: 30px;
	font-size:15px;
	margin: 0px;
	text-align:center;
	border:0;
	border-radius: 3px;
	cursor: pointer;
	outline:none;
}

.stock_tb td:nth-child(4),.stock_tb td:nth-child(5),.stock_tb td:nth-child(3){
	padding : 0px;
	text-align: center;
}

/*최하단 목록 버튼*/
.list_btn_area{
	text-align:center;
}

.list_btn{
	width:200px;
	height: 50px;
	background-color: #01a1dd;
	font-weight: bold;
	font-size: 22px;
	cursor: pointer;
	color: white;	
	text-align:center;
	border:0;
	border-radius: 3px;
	margin:0px;
	outline:none;
}

/*팝업*/

.bg{
	display: inline-block;
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0px;
	left: 0px;
	background-color: #000000;
	z-index: 200;
	opacity: 0.6; /* 0.0(투명)~1.0(불투명)*/
}
.popup_Area {
	display: inline-block;
	width: 500px;
	height: 300px;
	background-color: #ffffff;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	position: absolute;
	top: calc(50% - 150px); /*높이의 반만큼 뺌*/
	left: calc(50% - 250px); /*너비의 반만큼 뺌*/
	z-index: 300;
}
.popup_Head{
	height: 30px;
	font-size: 16pt;
	background-color: #01a1dd;
	color:white;
	padding:10px;
	font-weight:bold;
}
.popup_Btn{
	text-align:center;
}
.popup_Btn input[type='button']{
	color: white;
	width: 120px;
	height: 30px;
	text-align:center;
	border:0;
	border-radius: 3px;
	font-size:15px;
	margin:10px;
	cursor: pointer;
}
.popup_Content{
	margin-bottom:80px;
	margin-top:20px;
	margin-left:20px;
	margin-right:20px;
	text-align:center;
	font-size:18px;
	color: black
}
input[type='button']:focus{outline:none;}

.popup_Head > .close_Btn{
	width: 25px;
	height: 25px;
	background-color: #01a1dd;
	float: right;
	margin: 0px;
	font-size: 18px;
	text-align: center;
	color: #ffffff;
	border: none;
}

</style>


<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	stockloadList(); //유통기한별 재고 리스트 그리기
	relloadList(); // 재고 출고 리스트 그리기
	discardloadList(); //폐기 리스트 그리기
	
	$(".stock_add_btn").on("click",function(){
		$("#goForm").attr("action","Stock_Add");
		$("#goForm").submit();
	});
	
	$(".list_btn").on("click",function(){
		$("#goForm").attr("action","Item_List");
		$("#goForm").submit();
	});
	
	$(".discard_btn").on("click",function(){
		stockdiscardloadList();
		$(".discard_btn").hide();
		$(".stock_add_btn").hide();
		$(".discard_cnl_btn").show();
		$(".discard_submit_btn").show();
	});
	
	$(".discard_cnl_btn").on("click",function(){
		stockloadList();
		$(".discard_btn").show();
		$(".stock_add_btn").show();
		$(".discard_cnl_btn").hide();
		$(".discard_submit_btn").hide();
	});
	
	$(".discard_submit_btn").on("click",function(){
		stockloadList();
		$(".discard_btn").show();
		$(".stock_add_btn").show();
		$(".discard_cnl_btn").hide();
		$(".discard_submit_btn").hide();
	});
	
	$(".discard_submit_btn").on("click",function(){
		
		var cnt = 0; //빈 값이 있는지 체크할 변수 (빈 값이 존재하는 경우 작업불가 alert)
		var cnt2 = 0; // 0 값이 있는지 체크할 변수 (모두 0값인 경우 작업불가 alert)
		
		$(".discardCnt").each(function(){
				if($(this).val() == ""){
					cnt++;
				}else if($(this).val() == "0"){
					cnt2++;
				}
		});
		
		if(cnt > 0){
			makePopup("재고폐기","폐기수량을 입력해주세요. 폐기가 필요없는 경우 0입력",function(){});
		   $(".discardCnt").focus;
		   stockdiscardloadList();
		  	$(".discard_btn").hide();
			$(".stock_add_btn").hide();
			$(".discard_cnl_btn").show();
			$(".discard_submit_btn").show();
		   
		}else if(cnt2 == $(".stock_tb tbody tr").size()){
			makePopup("재고폐기","현재 폐기수량이 모두 0입니다.",function(){});
			stockdiscardloadList();
		  	$(".discard_btn").hide();
			$(".stock_add_btn").hide();
			$(".discard_cnl_btn").show();
			$(".discard_submit_btn").show();
		}else{
		 var params = $("#tb_Form").serialize();
		   
		 $.ajax({
		      url : "Stock_Discards",//접속주소
		      type : "post", //전송방식 : get,post // >>문자열을 줬지만 알아서 포스트 형식으로 
		      dataType :"json", //받아올 데이터 형식
		      data : params,///보낼데이터(문자열 형태)
		      success : function(res){
		         if(res.msg == "success"){
		        	 stockloadList();
		        	 discardloadList();
		        	 relloadList();
					$(".discard_btn").show();
					$(".stock_add_btn").show();
					$(".discard_cnl_btn").hide();
					$(".discard_submit_btn").hide();
		      	  }else if (res.msg == "failed"){
		      		makePopup("재고폐기","재고폐기에 실패하였습니다.",function(){});
		         }else {
		        	makePopup("재고폐기","재고페기 중 문제가 발생하였습니다.",function(){});
		         }
		      },
		      error : function(request,status,error){
		         console.log(error);
		      }
		   });
		 
		}
	});
	
	  $(document).on("click",".stor_history_btn",function(){
		$("#itemNo").val($(this).parent().parent().attr("itemNo"));
		$("#expDate").val($(this).parent().parent().attr("expDate"));
		storHistoryloadList();
	}); 
	 
}); //ready end

//유통기한 별 재고 리스트 그리기
function stockloadList(){
	var params = $("#goForm").serialize();
	
	$.ajax({
		url : "Item_Stock_List",
		type : "post",  
		dataType :"json",
		data : params,
		success : function(res){
			drawstockList(res.stocklist,res.result);
		},
		error : function(request,status,error){
			console.log(error);
		}
	});
}

function drawstockList(stocklist,result){
	var html ="";
	
	html += "<tr>";
	html += "<th style=\"border-left: none;\">품목명</th>";
	html += "<th>재고수량</th>";
	html += "<th>유통기한</th>";
	html += "<th>입고이력</th>";
	html += "</tr>";
	
	$(".stock_tb thead").html(html);
	
	html ="";
	
	if(result == 0){ //결과 행이 존재하지 않는 경우
		html += "<tr>";
		html += "<td colspan = \"4\" style = \"text-align: center;\">해당 품목의 재고가 존재하지 않습니다.</td>";
		html += "</tr>";	
	} else if (result > 0){
		for(var d of stocklist){ //결과 행이 존재하는 경우
			html += "<tr itemNo = \""+${param.itemNo}+"\" expDate = \""+d.EXPIRY_DATE+"\">";
			html += "<td>"+d.ITEM_NAME+"</td>";
			html += "<td>"+d.PPSUM+"</td>";
			html += "<td>"+d.EXPIRY_DATE+"</td>";
			html += "<td><input type = \"button\" class = \"stor_history_btn\" value = \"이력확인\"/></td>";
			html += "</tr>";
		}
	}
	
	
	
	$(".stock_tb tbody").html(html);
}

//출고재고리스트 그리기
function relloadList(){
	var params = $("#goForm").serialize();
	
	$.ajax({
		url : "Item_Rel_List",
		type : "post",  
		dataType :"json",
		data : params,
		success : function(res){
			drawrelList(res.Rellist,res.result);
		},
		error : function(request,status,error){
			console.log(error);
		}
	});
}

function drawrelList(Rellist,result){
	var html ="";
	
	html += "<tr>";
	html += "<th style=\"border-left: none;\">주문번호</th>";
	html += "<th>품목코드</th>";
	html += "<th>품목명</th>";
	html += "<th>수량</th>";
	html += "<th>유통기한</th>";
	html += "<th>등록일</th>";
	html += "<th>지점명</th>";
	html += "</tr>";
	
	
	$(".stock_rel_history thead").html(html);
	
	html ="";
	
	if(result == 0){ //결과 행이 존재하지 않는 경우
		html += "<tr>";
		html += "<td colspan = \"7\" style = \"text-align: center;\">해당 품목의 출고 이력이 존재하지 않습니다.</td>";
		html += "</tr>";	
	} else if (result > 0){
		for(var d of Rellist){ //결과 행이 존재하는 경우
			html += "<tr>";
			html += "<td><a href = \"http://localhost:8090/bbps/Ord_Mang_dtl?oNo="+d.ORD_NO+"\">"+d.ORD_NO+"</a></td>";
			html += "<td>"+d.ITEM_NO+"</td>";
			html += "<td>"+d.ITEM_NAME+"</th>";
			html += "<td>"+d.CNT+"</td>";
			html += "<td>"+d.EXPIRY_DATE+"</td>";
			html += "<td>"+d.ORD_ENROLL_DATE+"</td>";
			html += "<td>"+d.BRCH_NAME+"</td>";
			html += "</tr>";	
		}
	}
	
	$(".stock_rel_history tbody").html(html);
}

//폐기기능 리스트 그리기
function stockdiscardloadList(){
	var params = $("#goForm").serialize();
	
	$.ajax({
		url : "Item_Stock_Discard_List",
		type : "post",  
		dataType :"json",
		data : params,
		success : function(res){
			drawstockdiscardList(res.stockdiscardlist);
		},
		error : function(request,status,error){
			console.log(error);
		}
	});
}

function drawstockdiscardList(stockdiscardlist){
	var html ="";
	
	html += "<tr>";
	html += "<th style=\"border-left: none;\">품목명</th>";
	html += "<th>재고수량</th>";
	html += "<th>폐기수량</th>";
	html += "<th>비고</th>";
	html += "<th>유통기한</th>";
	html += "</tr>";
	
	$(".stock_tb thead").html(html);
	
	html ="";
	
	for(var d of stockdiscardlist){
		html += "<tr itemNo = \""+${param.itemNo}+"\" expDate = \""+d.EXPIRY_DATE+"\">";
		html += "<td>"+d.ITEM_NAME+"<input type = \"hidden\" name = \"itemNo\" value = \""+${param.itemNo}+"\"/></td>";
		html += "<td>"+d.PPSUM+"</td>";
		html += "<td><input type = \"number\" min = 0 class = \"discardCnt\" id = \"discardCnt\" name = \"discardCnt\" value = \"0\"/></td>";
		html += "<td><input type = \"text\" id = \"discardNote\" name = \"discardNote\"/></td>";
		html += "<td>"+d.EXPIRY_DATE+"<input type = \"hidden\" id = \"expDate\" name = \"expDate\" value = \""+d.EXPIRY_DATE+"\" /></td>";
		html += "</tr>";	
	}
	
	$(".stock_tb tbody").html(html);
}


//폐기 목록 리스트(기능xx) @@@@@@@여기가 폐기 목록임@@@@@@@
function discardloadList(){
	var params = $("#goForm").serialize();
	
	$.ajax({
		url : "Item_Discard_List",
		type : "post",  
		dataType :"json",
		data : params,
		success : function(res){
			drawdiscardList(res.discardlist,res.result);
		},
		error : function(request,status,error){
			console.log(error);
		}
	});
}

function drawdiscardList(discardlist,result){
	var html ="";
	
	html += "<tr>";
	html += "<th style=\"border-left: none;\">폐기날짜</th>";
	html += "<th>폐기수량</th>";
	html += "<th>유통기한</th>";
	html += "<th>비고</th>";
	html += "<th>변경자</th>";
	html += "</tr>";
	
	$(".stock_discard_history thead").html(html);
	
	html ="";
	
	if(result == 0){ //결과 행이 존재하지 않는 경우
		html += "<tr>";
		html += "<td colspan = \"6\" style = \"text-align: center;\">해당 품목의 폐기 이력이 존재하지 않습니다.</td>";
		html += "</tr>";	
	} else if (result > 0){
		for(var d of discardlist){
			html += "<tr>";
			html += "<td>"+d.ENROLL_DATE+"</td>";
			html += "<td>"+d.CNT+"</td>";
			html += "<td>"+d.EXPIRY_DATE+"</td>";
			html += "<td>"+d.NOTE+"</td>";
			html += "<td>"+d.ID+"</td>";
			html += "</tr>";	
		}
	}
	
	$(".stock_discard_history tbody").html(html);
}

function storHistoryloadList(){
	var params = $("#storHistoryForm").serialize();
	
	$.ajax({
		url : "Stock_Stor_History",
		type : "post",  
		dataType :"json",
		data : params,
		success : function(res){
			makePopup("입고이력",drawstorHistory(res.StorHistorylist),function(){});
		},
		error : function(request,status,error){
			console.log(error);
		}
	});
	
}

//입고이력 버튼 눌렸을 때 그려지는 테이블
function drawstorHistory(StorHistorylist){
	var shhtml ="";
	
	shhtml += "<table cellspacing=\"0\">";
	shhtml += "<thead>";
	shhtml += "<tr>";
	shhtml += "<th style=\"border-left: none;\">입고날짜</th>";
	shhtml += "<th>입고수량</th>";
	shhtml += "<th>변경자</th>";
	shhtml += "</tr>";
	shhtml += "</thead>";
	
	shhtml += "<tbody>";
	for(var d of StorHistorylist){
	shhtml += "<tr>";
	shhtml += "<td>"+d.ENROLL_DATE+"</td>";
	shhtml += "<td>"+d.CNT+"</td>";
	shhtml += "<td>"+d.ID+"</td>";
	shhtml += "</tr>";
	} 
	shhtml += "</tbody>";
	shhtml += "</table>";
	
	return shhtml;
}

//팝업
function makePopup(title, contents, func) {
	var html ="";
	html+= "<div class=\"bg\"></div>";	
	html+= "<div class=\"popup_Area\">";	
	html+= "<div class=\"popup_Head\">"+ title +"";	
	html+= 		"<input type=\"button\" value=\"X\" class=\"close_Btn\">";
	html+= "</div>";	
	html+= "<div class=\"popup_Content\">"+ contents +"</div>";	
	html+= 		"<div class=\"popup_Btn\">";	
	html+= 			"<input type=\"button\" value=\"확인\"  class=\"confirm_Btn\"style=\"background-color: rgb(41, 128, 185)\">";	
	html+= 	 	"</div>";	
	html+= "</div>";	
	
	$("body").prepend(html);
	$(".popup_Area").hide().show();
	
	$(".popup_Btn, .close_Btn").on("click",function(){
		if(func !=null){
			func.call();
		}
		closePopup();
		});
	
}

function closePopup() {
	$(".bg, .popup_Area").fadeOut(function(){
		$(".bg, .popup_Area").remove();
	}); //popup_Btn end
}

</script>
</head>
<body>
   <div class="top"></div>
  <!--컨텐츠 -->
<div class="content_area">
<div class="content">
<form action = "#" id = "goForm" method = "post">
<input type="hidden"  id="menuNo" name="menuNo" value="${param.menuNo}">
<input type = "hidden" id = "uNo" name = "uNo" value = "${sUSERNo}"/>
<input type = "hidden" name ="itemNo" value = "${param.itemNo}"/>
<input type = "hidden" name ="itemName" value = "${param.itemName}"/>
<input type = "hidden" name = "page" value = "${param.page}"/> <!-- 파람 붙여줘야 전 페이지에서 온 걸 받는 것 // 페이지는 목록에서 준 것 컨트롤러에서 주는 것이 아님 그래서 파람 있어야함 -->
<input type = "hidden" name = "search_filter" value = "${param.search_filter}"/>
<input type = "hidden" name = "search_input" value = "${param.search_input}"/>
</form>
<form action="#" id = "storHistoryForm" method = "post">
<input type = "hidden" id = "itemNo" name ="itemNo" />
<input type = "hidden" id = "expDate"name ="expDate"/>
</form>
<h1>재고상세조회</h1>
<ul class="item_info">
<li><strong>품목번호 : </strong>${param.itemNo}</li>
</ul>
<c:if test="${auth eq 2}" >
<div class="button_area">
			<input type = "button" class="stock_add_btn" value = "추가"/>
			<input type = "button" class="discard_btn" style= "margin:0px 0px 0px 10px;" value = "폐기"/>
			<input type = "button" class="discard_submit_btn" value = "완료"/>
			<input type = "button" class="discard_cnl_btn"style= "margin:0px 0px 0px 10px;"  value = "취소"/>
		</div>
</c:if>
<form action = "#" id = "tb_Form" method = "post">
<input type = "hidden" id = "uNo" name = "uNo" value = "${sUSERNo}"/>
<div class = "stock_tb">
<table cellspacing="0">
	
	<thead></thead>
	<tbody></tbody>
</table>
</div>
</form>
<div class = "stock_rel_history">
<h2 style ="padding-top: 50px;">재고출고이력</h2>
<table cellspacing="0">
	<thead></thead>
	<tbody></tbody>
</table>
</div>
<div class = "stock_discard_history">
<h2 style ="padding-top: 50px;">재고폐기이력</h2>
<table cellspacing="0">
	<thead></thead>
	<tbody></tbody>
</table>
</div>
<div class="list_btn_area">
<input class="list_btn" type = "button" style = "margin:50px 0 50px 0;" value = "목록"/>
		</div>
	</div>
</div>
</body>
</html>