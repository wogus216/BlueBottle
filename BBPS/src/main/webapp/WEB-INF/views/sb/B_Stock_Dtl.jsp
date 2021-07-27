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

.stock_use_history thead,.stock_discard_history thead,.stock_stor_history thead{
	display : table;
	table-layout : fixed;
	width : 1250px;
}

.stock_use_history tbody,.stock_discard_history tbody,.stock_stor_history tbody{
	display : block;
	max-height : 287px;
	width : 1250px;
	overflow : auto;
	overflow-x : hidden;
}

.stock_use_history tr,.stock_discard_history tr,.stock_stor_history tr{
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
.discard_btn,.discard_cnl_btn{
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

.safeCnt{
	width : 50px;
	background-color: #e6e6e6;
}

.safeCnt_edit_btn{
	color: white;
	width: 50px;
	height: 21px;
	text-align:center;
	border:0;
	border-radius: 3px;
	font-size:14px;
	margin:10px;
	cursor: pointer;
	background-color: #01a1dd;
	outline:none;
}

.safeCnt,.safeCnt_edit_btn{
	vertical-align: middle;
}

.safeCnt_area{
	float : right;
}

.discard_btn,.discard_cnl_btn,.discard_submit_btn{
	height: 40px;
	margin: 0 ;
	padding: 0;
	vertical-align: middle;
}

.discard_cnl_btn,.discard_submit_btn{
	display: none;
}

select{
	font-size: 15px;	
	height: 40px;
	width : 100px;
	
}

.discard_submit_btn{
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
	
	console.log()
	
	stockloadList(); //유통기한별 재고 리스트 그리기
	storloadList(); // 재고 입고 리스트 그리기
	useloadList(); // 재고 출고 리스트 그리기
	discardloadList(); //폐기 리스트 그리기
	
	$(".top_menu").on("click","a",function(){
		$(".top_menu a").attr("style","color: black");
		$(this).css("color", "#01a1dd");
		$(this).parent().parent().children(1).css("color", "#01a1dd");
	});
	$(".sub").hover(function(){
		$(".top li").css("background-color","white");
		$(this).parent("li").css("background-color","#f1f1f1");
	
	},function(){
			$(".top li").css("background-color","white");
	});
	
	$(".stock_add_btn").on("click",function(){
		$("#goForm").attr("action","Stock_Add");
		$("#goForm").submit();
	});
	
	$(".list_btn").on("click",function(){
		$("#goForm").attr("action","B_Stock_List");
		$("#goForm").submit();
	});
	
	$(".discard_btn").on("click",function(){
		stockdiscardloadList();
		$(".discard_btn").hide();
		$(".discard_cnl_btn").show();
		$(".discard_submit_btn").show();
	});
	
	$(".discard_cnl_btn").on("click",function(){
		stockloadList();
		$(".discard_btn").show();
		$(".discard_cnl_btn").hide();
		$(".discard_submit_btn").hide();
	});
	
	$(".discard_submit_btn").on("click",function(){
		stockloadList();
		$(".discard_btn").show();
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
			alert("폐기수량을 입력해주세요. 폐기가 필요없는 경우 0입력");
		   $(".discardCnt").focus;
		   stockdiscardloadList();
		  	$(".discard_btn").hide();
			$(".discard_cnl_btn").show();
			$(".discard_submit_btn").show();
			
		}else if(cnt2 == $(".stock_tb tbody tr").size()){
			alert("현재 폐기수량이 모두 0입니다.");
			stockdiscardloadList();
		  	$(".discard_btn").hide();
			$(".discard_cnl_btn").show();
			$(".discard_submit_btn").show();
		}else{
		 var params = $("#tb_Form").serialize();
		 console.log(params) ;
		 
		  $.ajax({
		      url : "B_Stock_Discards",//접속주소
		      type : "post", //전송방식 : get,post // >>문자열을 줬지만 알아서 포스트 형식으로 
		      dataType :"json", //받아올 데이터 형식
		      data : params,///보낼데이터(문자열 형태)
		      success : function(res){
		         if(res.msg == "success"){
		        	 stockloadList();
		        	 storloadList();
		        	 discardloadList();
		        	 useloadList();
					$(".discard_btn").show();
					$(".discard_cnl_btn").hide();
					$(".discard_submit_btn").hide();
		      	  }else if (res.msg == "failed"){
		            alert("재고폐기에 실패하였습니다."); // 팝업 변경 필요
		         }else {
		            alert("재고폐기 중 문제가 발생하였습니다."); // 팝업 변경 필요
		         }
		      },
		      error : function(request,status,error){
		         console.log(error);
		      }
		   }); 
		 
		}
	});
	
	$(document).on("dblclick",".safeCnt",function(){
        $(this).attr("readonly",false);//더블클릭 시 수정이 가능하도록 disabled 해제
        $(this).css("background-color","white");
     });
	
	$(document).click(function(e){
        if (!$(e.target).is(".safeCnt")) {
        	$(".safeCnt").attr("readonly",true); //해당 클래스가 없는 곳 클릭 시 인풋 disabled설정
        	$(".safeCnt").css("background-color","#e6e6e6");
        }
    });
	
	$(".safeCnt_edit_btn").on("click",function(){
		if($.trim($(".safeCnt").val()) == ""){
			alert("안전재고 수량을 입력해주세요.");
		   $(".itemName").focus;
		}else{
			var params = $("#safeCntForm").serialize();
			   
			 $.ajax({
			      url : "B_Safe_Stock_edit",//접속주소
			      type : "post", //전송방식 : get,post // >>문자열을 줬지만 알아서 포스트 형식으로 
			      dataType :"json", //받아올 데이터 형식
			      data : params,///보낼데이터(문자열 형태)
			      success : function(res){
			         if(res.msg == "success"){
			        	 makePopup("안전재고수정","안전재고수정에 성공하였습니다.",function(){
			        		 
			        	 });
			      	  }else if (res.msg == "failed"){
			            alert("안전재고 수정에 실패하였습니다."); // 팝업 변경 필요
			         }else {
			            alert("안전재고 수정 중 문제가 발생하였습니다."); // 팝업 변경 필요
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
		url : "B_Stock_ExpList",
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
			
			var to_exp = "";
			to_exp = splitdate(d.EXPIRY_DATE);
			
			if(to_exp < 3){ //현재일 기준 유통기한이 3일 이하로 남은 재고
				html += "<tr itemNo = \""+${param.itemNo}+"\" expDate = \""+d.EXPIRY_DATE+"\" style = \"color:red; font-weight : bold;\">";
			} else{
				html += "<tr itemNo = \""+${param.itemNo}+"\" expDate = \""+d.EXPIRY_DATE+"\">";
			}
			html += "<td>"+d.ITEM_NAME+"</td>";
			html += "<td>"+d.HSTOCK+"</td>";
			html += "<td>"+d.EXPIRY_DATE+"</td>";
			html += "<td><input type = \"button\" class = \"stor_history_btn\" value = \"이력확인\"/></td>";
			html += "</tr>";
		}
	}
	
	
	
	$(".stock_tb tbody").html(html);
}

//재고 입고 리스트 그리기
function storloadList(){
	var params = $("#goForm").serialize();
	
	$.ajax({
		url : "B_Stock_StorList",
		type : "post",  
		dataType :"json",
		data : params,
		success : function(res){
			drawstorList(res.storlist,res.result);
		},
		error : function(request,status,error){
			console.log(error);
		}
	});
}

function drawstorList(storlist,result){
	var html ="";
	
	html += "<tr>";
	html += "<th style=\"border-left: none;\">주문번호</th>";
	html += "<th>품목명</th>";
	html += "<th>입고수량</th>";
	html += "<th>유통기한</th>";
	html += "<th>입고일자</th>";
	html += "</tr>";
	
	$(".stock_stor_history thead").html(html);
	
	html ="";
	
	if(result == 0){ //결과 행이 존재하지 않는 경우
		html += "<tr>";
		html += "<td colspan = \"5\" style = \"text-align: center;\">해당 품목의 재고가 존재하지 않습니다.</td>";
		html += "</tr>";	
	} else if (result > 0){
		for(var d of storlist){ //결과 행이 존재하는 경우
			
			html += "<tr>";
			html += "<td><a href = \"http://localhost:8090/bbps/B_Ord_dtl?oNo="+d.ORD_NO+"\">"+d.ORD_NO+"</a></td>";
			html += "<td>"+d.ITEM_NAME+"</td>";
			html += "<td>"+d.CNT+"</td>";
			html += "<td>"+d.EXPIRY_DATE+"</td>";
			html += "<td>"+d.ENROLL_DATE+"</td>";
			html += "</tr>";
		}
	}
	
	
	
	$(".stock_stor_history tbody").html(html);
}


//재고사용리스트 그리기
function useloadList(){
	var params = $("#goForm").serialize();
	
	$.ajax({
		url : "B_Stock_UseList",
		type : "post",  
		dataType :"json",
		data : params,
		success : function(res){
			drawuseList(res.uselist,res.result);
		},
		error : function(request,status,error){
			console.log(error);
		}
	});
}

function drawuseList(uselist,result){
	var html ="";
	
	html += "<tr>";
	html += "<th style=\"border-left: none;\">품목명</th>";
	html += "<th>사용수량</th>";
	html += "<th>유통기한</th>";
	html += "<th>사용일</th>";
	html += "</tr>";
	
	
	$(".stock_use_history thead").html(html);
	
	html ="";
	
	if(result == 0){ //결과 행이 존재하지 않는 경우
		html += "<tr>";
		html += "<td colspan = \"5\" style = \"text-align: center;\">해당 품목의 출고 이력이 존재하지 않습니다.</td>";
		html += "</tr>";	
	} else if (result > 0){
		for(var d of uselist){ //결과 행이 존재하는 경우
			html += "<tr>";
			html += "<td>"+d.ITEM_NAME+"</th>";
			html += "<td>"+d.CNT+"</td>";
			html += "<td>"+d.EXPIRY_DATE+"</td>";
			html += "<td>"+d.ENROLL_DATE+"</td>";
			html += "</tr>";	
		}
	}
	
	$(".stock_use_history tbody").html(html);
}

//폐기기능 리스트 그리기
function stockdiscardloadList(){
	var params = $("#goForm").serialize();
	
	$.ajax({
		url : "B_Stock_Discard",
		type : "post",  
		dataType :"json",
		data : params,
		success : function(res){
			drawstockdiscardList(res.stockdiscardlist,res.result);
		},
		error : function(request,status,error){
			console.log(error);
		}
	});
}

function drawstockdiscardList(stockdiscardlist,result){
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
	
	if(result == 0){ //결과 행이 존재하지 않는 경우
		html += "<tr>";
		html += "<td colspan = \"5\" style = \"text-align: center;\">폐기할 재고가  존재하지 않습니다.</td>";
		html += "</tr>";	
	} else if (result > 0){
	
	for(var d of stockdiscardlist){
		
		var to_exp = "";
		to_exp = splitdate(d.EXPIRY_DATE);
		
		if(to_exp < 3){ //현재일 기준 유통기한이 3일 이하로 남은 재고
			html += "<tr itemNo = \""+${param.itemNo}+"\" expDate = \""+d.EXPIRY_DATE+"\" style = \"color:red; font-weight : bold;\">";
		} else{
			html += "<tr itemNo = \""+${param.itemNo}+"\" expDate = \""+d.EXPIRY_DATE+"\">";
		}
		html += "<td>"+d.ITEM_NAME+"<input type = \"hidden\" name = \"itemNo\" value = \""+${param.itemNo}+"\"/></td>";
		html += "<td>"+d.HSTOCK+"</td>";
		html += "<td><input type = \"number\" min = 0 class = \"discardCnt\" id = \"discardCnt\" name = \"discardCnt\" value = \"0\"/></td>";
		html += "<td><input type = \"text\" id = \"discardNote\" name = \"discardNote\"/></td>";
		html += "<td>"+d.EXPIRY_DATE+"<input type = \"hidden\" id = \"expDate\" name = \"expDate\" value = \""+d.EXPIRY_DATE+"\" /></td>";
		html += "</tr>";	
		}
	}
	$(".stock_tb tbody").html(html);
}


//재고 폐기 목록 리스트(기능xx) @@@@@@@여기가 폐기 목록임@@@@@@@
function discardloadList(){
	var params = $("#goForm").serialize();
	
	$.ajax({
		url : "B_Stock_DiscardList",
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
	html += "<th style=\"border-left: none;\">품목명</th>";
	html += "<th>폐기수량</th>";
	html += "<th>유통기한</th>";
	html += "<th>비고</th>";
	html += "<th>폐기날짜</th>";
	html += "</tr>";
	
	$(".stock_discard_history thead").html(html);
	
	html ="";
	
	if(result == 0){ //결과 행이 존재하지 않는 경우
		html += "<tr>";
		html += "<td colspan = \"5\" style = \"text-align: center;\">해당 품목의 폐기 이력이 존재하지 않습니다.</td>";
		html += "</tr>";	
	} else if (result > 0){
		for(var d of discardlist){
			html += "<tr>";
			html += "<td>"+d.ITEM_NAME+"</td>";
			html += "<td>"+d.CNT+"</td>";
			html += "<td>"+d.EXPIRY_DATE+"</td>";
			if(d.NOTE == null){
				html += "<td></td>";
			}else{
				html += "<td>"+d.NOTE+"</td>";
			}
			html += "<td>"+d.ENROLL_DATE+"</td>";
			html += "</tr>";	
		}
	}
	
	$(".stock_discard_history tbody").html(html);
}

function storHistoryloadList(){
	var params = $("#storHistoryForm").serialize();
	
	$.ajax({
		url : "B_Stock_Stor_History",
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
	shhtml += "<th style=\"border-left: none;\">주문번호</th>";
	shhtml += "<th>입고수량</th>";
	shhtml += "<th>입고날짜</th>";
	shhtml += "</tr>";
	shhtml += "</thead>";
	
	shhtml += "<tbody>";
	for(var d of StorHistorylist){
	shhtml += "<tr>";
	shhtml += "<td>"+d.ORD_NO+"</td>";
	shhtml += "<td>"+d.CNT+"</td>";
	shhtml += "<td>"+d.ENROLL_DATE+"</td>";
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
  <!--컨텐츠 -->
<div class="content_area">
<div class="content">
<form action = "#" id = "goForm" method = "post">
<input type="hidden" id="brchNo" name="brchNo" value="${sBRCHNo}"/>
<input type = "hidden" name ="itemNo" value = "${param.itemNo}"/>
<input type = "hidden" name ="itemName" value = "${param.itemName}"/>
<input type = "hidden" name = "page" value = "${param.page}"/> <!-- 파람 붙여줘야 전 페이지에서 온 걸 받는 것 // 페이지는 목록에서 준 것 컨트롤러에서 주는 것이 아님 그래서 파람 있어야함 -->
<input type = "hidden" name = "search_filter" value = "${param.search_filter}"/>
<input type = "hidden" name = "search_input" value = "${param.search_input}"/>
</form>
<form action="#" id = "storHistoryForm" method = "post">
<input type="hidden" id="brchNo" name="brchNo" value="${sBRCHNo}"/>
<input type = "hidden" id = "itemNo" name ="itemNo" />
<input type = "hidden" id = "expDate"name ="expDate"/>
</form>
<h1>재고상세조회</h1>
<ul class="item_info">
<li><strong>품목번호 : </strong>${param.itemNo}</li>
</ul>
<div class="button_area">
			<input type = "button" class="discard_btn" style= "margin:0px 0px 0px 10px;" value = "폐기"/>
			<input type = "button" class="discard_submit_btn" value = "완료" />
			<input type= "button" class="discard_cnl_btn" style= "margin:0px 0px 0px 10px;" value = "취소"/>
		</div>

<form action = "#" id = "tb_Form" method = "post">
<input type="hidden" id="brchNo" name="brchNo" value="${sBRCHNo}"/>
<div class = "stock_tb">
<table cellspacing="0">
	
	<thead></thead>
	<tbody></tbody>
</table>
</div>
</form>
<form action = "#" id = "safeCntForm" method = "post">
<input type="hidden" id="brchNo" name="brchNo" value="${sBRCHNo}"/>
<div class = "safeCnt_area">
안전재고수량 : <input readonly type = "number" min = "0" class = "safeCnt" name = "safeCnt" value = "${param.safeCnt}"/><input type = "button" class = "safeCnt_edit_btn"value = "저장"/>
<input type = "hidden" name ="itemNo" value = "${param.itemNo}"/>
</div>
</form>
<div class = "stock_stor_history">
<h2 style ="padding-top: 50px;">재고입고이력</h2>
<table cellspacing="0">
	<thead></thead>
	<tbody></tbody>
</table>
</div>
<div class = "stock_use_history">
<h2 style ="padding-top: 50px;">재고사용이력</h2>
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