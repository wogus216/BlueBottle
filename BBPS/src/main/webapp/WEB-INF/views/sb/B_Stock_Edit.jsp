<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.top {
   width: 100%;
   padding: 0;
   margin: 0;
   background-color: white;
   display: inline-block;
   min-width: 1400px;
    height: 62px;
}

.top_menu{
	display: inline-block;
	vertical-align: top;
	float: right ;
	width: 1050px;
}

body {
   margin: 0;
   padding: 0;
   background-color: #f2f2f2;
}

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
}

.main_menu{
   display: inline-block;
   color: black;
   padding: 20px 30px;
   text-decoration: none;
   font-weight: bold;
   font-size: 17px;
}

.main_menu:hover {
   background-color: #f1f1f1;
}


.logo {
   padding: 13px 30px;
  
  
}

.sub {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 128px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
    font-size: 15px;
    text-align: center;
}
.sub a{
	color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    
}

.log_out{
	display:inline-block;
	text-decoration: none;
	color: gray;
	padding:10px 20px;
	line-height: 42px;
}

.sub a:hover {
     background-color: #f1f1f1;
}

.menu_a:hover .sub, .menu_b:hover .sub ,.menu_c:hover .sub,.menu_d:hover .sub,
.menu_e:hover .sub,.menu_f:hover .sub, .menu_g:hover .sub  {
    display: block;
}
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

h1 {
 margin-bottom: 40px;
 font-size: 30px;
}

.sell_string{
	margin: 10px;
 	font-size: 20px;
}
table {
    width: 100%;
    table-layout: fixed;
    background: #ffffff;
	margin: 10px 0 0 1px;
	border-top: 2px solid #3498db;
	border-bottom: 2px solid #d9d9d9;
}

td:nth-child(4){
	padding : 0px;
	text-align: center;
}

.editcurCnt{
	height: 30px;
	margin: 0px;
	width : 60%;
	cursor: pointer;
	background-color: #e6e6e6;
	border-radius: 2px;
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

thead{
    display : table;
    table-layout : fixed;
    width : 800px;
}

tbody{
    display : block;
    max-height : 400px;
    width : 800px;
    overflow : auto;
    overflow-x : hidden;
}

tr{
    display : table;
    table-layout : fixed;
    width : 800px;
}

.search_info{
	text-align: center;
}

.search_filter{
	width : 120px;
}

.search_input{
	height: 34px;
	width : 200px;
	outline:none;
}

.search_filter,.search_input,.search_btn{
	vertical-align: middle;
}
.search_info{
	float: right;
}

/*최하단 버튼*/
.submit_area{
	text-align: center;
	width: 800px;
}

.edit_btn,.edit_cnl_btn,.search_btn{
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
.search_btn{
	margin: 10px 0px 10px 10px;
}

.edit_btn{
	width: 180px;
	height: 50px;
	background-color: #01a1dd;
	font-weight: bold;
	 font-size: 22px;
}

.edit_cnl_btn{
	background-color: #b3b3b3;
    width: 180px;
    height: 50px;
    font-weight: bold;
    font-size: 22px;
}

.today_sell{
	width: 50px;
	height: 50px;
}

.today_sell_tb_area{
	width: 200px;
	height: 100%;
}

.Stock_List,.submit_area{
	width: 800px;
	float: right;
	
}

.today_sell_tb_area,.Stock_List{
	display: inline-block;
	vertical-align: top;
}

.today_sell_tb_area table{
	width: 400px;
}

.today_sell_tb_area thead{
    display : table;
    table-layout : fixed;
    width : 400px;
}

.today_sell_tb_area tbody{
    display : block;
    max-height : 400px;
    width : 400px;
    overflow : auto;
    overflow-x : hidden;
}

.today_sell_tb_area tr{
    display : table;
    table-layout : fixed;
    width : 400px;
}


</style>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	if("${param.search_filter}" != ""){
		$("#search_filter").val("${param.search_filter}");
	}
	
	reeditloadList();
	today_sell();
	resellloadList();
	
	$(".search_btn").on("click",function(){
		$("#cate").val($(".cate").val());
		$("#page").val(1);
		reeditloadList();	
	});
	
	$(".cate").change(function(){
		$("#cate").val($(".cate").val());
		$(".search_input").val($("#Old_search_input").val());
		$("#page").val(1);
		reeditloadList();
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
	
	$(document).on("dblclick",".editcurCnt",function(){
        $(this).attr("readonly",false);//더블클릭 시 수정이 가능하도록 disabled 해제
        $(this).css("background-color","white");
     });
	
	$(document).click(function(e){
        if (!$(e.target).is(".editcurCnt")) {
        	$(".editcurCnt").attr("readonly",true); //해당 클래스가 없는 곳 클릭 시 인풋 disabled설정
        	$(".editcurCnt").css("background-color","#e6e6e6");
        }
    });
	
	$(".edit_cnl_btn").on("click",function(){
		location.href = "B_Stock_List";
	});
	
	$(".edit_btn").on("click",function(){
		var chkcurCnt = 0; //현재 재고 수량 빈 값이 있는지 체크할 변수 (빈 값이 존재하는 경우 작업불가 alert)
		var chksafeCnt = 0; //안전 재고 수량 빈 값이 있는지 체크할 변수 (빈 값이 존재하는 경우 작업불가 alert)

		$(".editcurCnt").each(function(){
			if($(this).val() == ""){
				chkcurCnt++;
			}
		});
		
		if(chkcurCnt > 0){
			alert("재고 수량이 빈 항목이 존재합니다.");
		   $(".editcurCnt").focus;
		}else{
			
		   var params = $("#tb_Form").serialize();
		   console.log($("#tb_Form").serialize());
		   
		    $.ajax({
		      url : "B_Stock_edit",//접속주소
		      type : "post", //전송방식 : get,post // >>문자열을 줬지만 알아서 포스트 형식으로 
		      dataType :"json", //받아올 데이터 형식
		      data : params,///보낼데이터(문자열 형태)
		      success : function(res){
		         if(res.msg == "success"){
		            location.href = "B_Stock_List";
		         }else if (res.msg == "failed"){
		            alert("수정에 실패하였습니다."); // 팝업 변경 필요
		         }else {
		            alert("수정 중 문제가 발생하였습니다."); // 팝업 변경 필요
		         }
		      },
		      error : function(request,status,error){
		         console.log(error);
		      }
		   }); 
		}
	});
	
}); //ready end

function reeditloadList(){
	var params = $("#actionForm").serialize();
	
	$.ajax({
		url : "B_Stock_edit_Lists", //재고 리스트를 불러오지만 페이징 기능은 사용하지 않을 것임
		type : "post",  
		dataType :"json",
		data : params,
		success : function(res){
			drawbrchstockeditList(res.list,res.result);
		},
		error : function(request,status,error){
			console.log(error);
		}
	});
}

function drawbrchstockeditList(list,result){
	
	var html ="";
	
	if(result == 0){ //결과 행이 존재하지 않는 경우
		html += "<tr>";
		html += "<td colspan = \"5\" style = \"text-align: center;\">검색조건에 맞는 데이터가 없거나 품목이 존재하지 않습니다.</td>";
		html += "</tr>";	
	} else if (result > 0){ //결과 행이 존재하는 경우 
		for(var d of list){
			
			var to_exp = "";
			to_exp = splitdate(d.EXPIRY_DATE);
			
			html += "<tr ";
			
			if(to_exp < 3){ //현재일 기준 유통기한이 3일 이하로 남은 재고
				html += "style = \"background-color:#F6CED8;\"";
			}
				
			html += ">";
			html += "<td>"+d.CATE_NAME+"</td>";
			html += "<td>"+d.ITEM_NO+"<input type = \"hidden\" name = \"itemNo\" value = \""+d.ITEM_NO+"\"/></td>";
			html += "<td>"+d.ITEM_NAME+"</td>";
			html += "<td><input readonly type = \"number\" class = \"editcurCnt\" name = \"editcurCnt\" min = \"0\" value = \""+d.CURCNT+"\"/><input type = \"hidden\" name = \"chkcurCnt\" value = \""+d.CURCNT+"\"/></td>";
			html += "<td>"+d.EXPIRY_DATE+"<input type = \"hidden\" name = \"expDate\" value = \""+d.EXPIRY_DATE+"\"/></td>";
			html += "</tr>";
		}
		
	}
	
	$(".Stock_List tbody").html(html);
}

function resellloadList(){
	
	$.ajax({
		url : "B_Stock_sell_List", 
		type : "post",  
		dataType :"json",
		success : function(res){
			drawbrchstocksellList(res.Selllist,res.result);
		},
		error : function(request,status,error){
			console.log(error);
		}
	});
}

function drawbrchstocksellList(Selllist,result){
	
	var html ="";
	
	if(result == 0){ //결과 행이 존재하지 않는 경우
		html += "<tr>";
		html += "<td colspan = \"3\" style = \"text-align: center;\">해당 일자에 판매된 품목이 존재하지 않습니다.</td>";
		html += "</tr>";	
	} else if (result > 0){ //결과 행이 존재하는 경우 
		for(var d of Selllist){
			
			html += "<tr> ";
			html += "<td>"+d.CATE_NAME+"</td>";
			html += "<td>"+d.MENU_NAME+"<input type = \"hidden\" name = \"itemNo\" value = \""+d.ITEM_NO+"\"/></td>";
			html += "<td>"+d.CNT+"</td>";
			html += "</tr>";
		}
	}
	
	$(".today_sell_tb_area tbody").html(html);
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

function today_sell(){
	
	var today = new Date(); //오늘날짜 체크
	
	var todaystring =""; // 날짜 문자열로 받을 것
	
	var dd = today.getDate();
	var mm = today.getMonth()+1;
	var yyyy = today.getFullYear();
	
	todaystring = yyyy+"년"+mm+"월"+dd+"일  판매목록";
	
	$(".sell_string").html(todaystring);
}

</script>
</head>
<body>
<div class="top">
     <ul>
         <li>
         <a href="#">
         <img class="logo" alt="logo" src="resources/images/bb/logo.png" width="250px"></a>
         </li>
         
         <div class="top_menu">
         
         <div class="menu_a">
         <li>
         	<a class="main_menu" href="#">
         	주문관리</a>
	         <div class="sub">
	        	 <a href="#">
	            	주문조회</a>
	            <a href="#">
	            	환불요청조회</a>
	             <a href="#">
	            	환불완료조회</a>
	      </div>
         </li>
         </div>
         
         <div class="menu_b">
         <li>
         	<a class="main_menu" href="#">
         		재고관리</a>
	          	<div class="sub">
     			<a href="#">		
	            	재고조회</a>
     			<a href="#">
	            	재고등록</a>
	            <a href="#">	
	            	입출고조회</a>
	            <a href="#">
	            	폐기조회</a>
	            </div>
          </li>
         </div>
         
           <div class="menu_c">
         <li>
		<a class="main_menu" href="#"> 
	        		품목관리</a>
	          	<div class="sub">
				<a href="#">
	            	품목조회</a>
	            <a href="#">
	            	품목등록</a>
	            </div>
          </li>
         </div>
         
         <div class="menu_d">
         <li>
         	<a class="main_menu" href="#"> 
         		POS관리</a>
	          <div class="sub" >
				<a href="#">
	            	메뉴조회</a>
				<a href="#">
	            	메뉴등록</a>
            </div>	
          </li>
         </div>
          <div class="menu_e">
         	<li>
         		<a class="main_menu" href="#"> 
         			공지사항</a>
	        </li>
         </div>
         <div class="menu_f">
         	<li>
         	<a class="main_menu" href="#"> 
         			사용자관리</a>
         		 <div class="sub" style="min-width: 145px;">
			<a href="#">
	            	사용자조회</a>
	          <a href="#">
	            	사용자등록</a>
            </div>	
	        </li>
         </div>
          <div class="menu_g">
          <li>
          <a class="main_menu" href="#"> 
         		마이페이지</a>
           </li>
         </div>
         <a class="log_out" href="#">
         		로그아웃</a>
      	</div>
      </ul>
   </div>
<div class="content_area">
<div class="content">
<h1>재고 수정</h1>
<div class="filter_area">
<div class="search_area" style = "margin-top : 30px;">
		<div class="search_info">
		<form action = "#" id = "actionForm" method = "post">
			<input type = "hidden" id = "Old_search_input" name = "Old_search_input" value ="${param.search_input}" />
			<input type = "hidden" id = "page" name = "page" value = "${page}"/>
			<select class= "cate">
               <option selected="selected" value = "">전체</option>
                  <c:forEach items="${catelist}" var = "d">
                   <option value="${d.CATE_NO}">
                   <c:out value="${d.CATE_NAME}"/> </option>
                  </c:forEach>
            </select>
		<select id="search_filter" name = "search_filter">
				<option value="0" selected="selected">품목코드</option>
				<option value="1">품목명</option>
			</select>
			<input type="text" class="search_input" name = "search_input" value = "${param.search_input}"/>
			<input type= "button" class="search_btn" value = "검색"/>
			<input type = "hidden" id = "cate" name = "cate"/>
			</form>
		</div>
	</div>
</div>
<div class = "today_sell"></div>
<h1 class = "sell_string"></h1>
<div class = "today_sell_tb_area">
<table cellspacing="0">
	
	<thead>
	<tr>
		<th scope=col style= "border-left: none;">카테고리</th>
		<th scope=col>메뉴명</th>
		<th scope=col>수량</th>
	</tr>
	</thead>
	<tbody></tbody>
</table>
</div>
<div class = "Stock_List">
<form action = "#" id = "tb_Form" method = "post">
<table cellspacing="0">
	<colgroup>
	<col width = "15%">
	<col width = "10%">
	<col width = "40%">
	<col width = "15%">
	<col width = "20%">
	</colgroup>
	<thead>
	<tr>
		<th scope = "col" style="border-left: none;">카테고리</th>
		<th scope = "col">품목코드</th>
		<th scope = "col">품목명</th>
		<th scope = "col">현재 재고 수량</th>
		<th scope = "col">유통기한</th>
	</tr>
	</thead>
	<tbody></tbody>
</table>
</form>
</div>
<div class="submit_area" style = "margin-top: 30px;">
	<input type= "button" class="edit_btn" value = "수정"/>
	<input type= "button" class="edit_cnl_btn" value = "취소"/>
</div>
</div>
</div>
</body>
</html>