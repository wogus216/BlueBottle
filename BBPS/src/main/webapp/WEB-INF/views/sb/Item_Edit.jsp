<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 상단 바 */
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

.edit_btn, .cnl_btn{
	background-color: #01a1dd;
	float: right;
}
.cnl_btn{
	background-color: #bf4040;
	float: right;
}

.Item_Name,.cnl_btn,.edit_btn{
	vertical-align: middle;
}

table {
    width: 100%;
    table-layout: fixed;
    background: #ffffff;
	margin: 10px 0;
	border-top: 2px solid #01a1dd;
	border-bottom: 2px solid #d9d9d9;
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
	margin:0 10px;
}
.price_re{
	margin-top:50px;
}
.price_re input{
	width: 370px;
	height:40px;
	margin:0 10px;
}

button{
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
button:focus{outline:none;}

/*라디오버튼(완제품여부) 생김새*/
input[type=radio]{
	margin: 0;
	height: 25px;
	width: 30px;
	vertical-align: middle;
}

/* 가격 히스토리 테이블 스크롤 생성*/
.price_history thead{
	display : table;
	table-layout : fixed;
	width : 1250px;
}

.price_history tbody{
	display : block;
	max-height : 287px;
	width : 1250px;
	overflow : auto;
	overflow-x : hidden;
}

.price_history tr{
	display : table;
	table-layout : fixed;
	width : 1250px;
}

</style>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	drawhistoryList(); // 가격변동 테이블 그리기
	
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

	$("tbody").on("click", "[type='radio']", function() {
		$(this).parent().children("#itemComProdFlag").val($(this).val());
	});
	
	$(".cnl_btn").on("click",function(){
		$("#goForm").submit();
	});
	
	$(".edit_btn").on("click",function(){
		if($.trim($(".itemName").val()) == ""){
			alert("품목명을 입력해주세요.")
		   $(".itemName").focus;
		}else if($.trim($(".itemPrice").val()) == ""){
			alert("가격을 입력해주세요.")
		   $(".itemPrice").focus;
		}else if($.trim($(".itemMinOrdUnit").val()) == ""){
			alert("최소주문단위를 입력해주세요.")
		   $(".itemMinOrdUnit").focus;
		}else{
			
		   var params = $("#editForm").serialize();
		   
		   $.ajax({
		      url : "Item_Edits",//접속주소
		      type : "post", //전송방식 : get,post // >>문자열을 줬지만 알아서 포스트 형식으로 
		      dataType :"json", //받아올 데이터 형식
		      data : params,//보낼데이터(문자열 형태)
		      success : function(res){
		         if(res.msg == "success"){
		        	 $("#editForm").attr("action","Item_Dtl");
					$("#editForm").submit();
					$("#goForm").submit();
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

function drawhistoryList(){ //쿼리 실행 시 itemNo넘겨줘야 해서 넘겨주는 데이터가 있어야함
	var params = $("#goForm").serialize();
	
	$.ajax({
		url : "Item_Dtl_Price_History",
		type : "post",  
		dataType :"json",
		data : params,
		success : function(res){
			drawpricehistory(res.pricehistorylist);
		},
		error : function(request,status,error){
			console.log(error);
		}
	});
	
}

function drawpricehistory(pricehistorylist){
	var html = "";
	
	for(var d of pricehistorylist){
		html += "<tr>";
		html += "<td>"+d.ENROLL_DATE+"</td>";
		html += "<td>"+d.OLD_PRICE+"</td>";
		html += "<td>"+d.NEW_PRICE+"</td>";
		html += "<td>"+d.ID+"</td>";
		html += "</tr>";
	}
	
	$(".price_history tbody").html(html);
}
</script>
</head>
<body>
   <div class="top">
     <ul>
         <li>
         <a href="#">
         <img class="logo" alt="logo" src="./logo.png" width="250px"></a>
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
<h1>품목수정</h1>
<div class="btn_area">
<span class = "Item_Name">품목번호 : ${data.ITEM_NO}</span>
<button class="cnl_btn" style="margin-right: 0px;">취소</button>
<button class="edit_btn">수정</button>
</div>
<form action = "Item_Dtl" id = "goForm" method = "post">
<input type = "hidden" name ="itemNo" value = "${data.ITEM_NO}"/>
<input type = "hidden" name = "page" value = "${param.page}"/> <!-- 파람 붙여줘야 전 페이지에서 온 걸 받는 것 // 페이지는 목록에서 준 것 컨트롤러에서 주는 것이 아님 그래서 파람 있어야함 -->
<input type = "hidden" name = "search_filter" value = "${param.search_filter}"/>
<input type = "hidden" name = "search_input" value = "${param.search_input}"/>
</form>
<form action = "#" id = "editForm" method = "post">
<input type = "hidden" name ="itemNo" value = "${data.ITEM_NO}"/>
<table cellspacing="0">
	<colgroup>
		<col width="20%" />
		<col width="20%" />
		<col width="20%" />
		<col width="20%" />
		<col width="20%" />
	</colgroup>
	<tr>
		<th scope=col style= "border-left: none;">카테고리</th>
		<th scope=col>품목명</th>
		<th scope=col>가격(원)</th>
		<th scope=col>최소주문단위</th>
		<th scope=col>완제품여부</th>
	</tr>
	<tr>
	<td><select name = "itemCate" id = "itemCate">
        <c:forEach items="${catelist}" var = "d">
       	 <c:choose>
			<c:when test = "${data.CATE_NO eq d.CATE_NO}">
                 <option selected = "selected" value="${d.CATE_NO}">
                 <c:out value="${d.CATE_NAME}"/> </option>
             </c:when>
             <c:otherwise>
             	<option value="${d.CATE_NO}">
             	<c:out value="${d.CATE_NAME}"/> </option>
             </c:otherwise>
    		</c:choose>        
        </c:forEach>
		</select></td>
	<td><input class = "itemName" type="text" maxlength="10"  name = "itemName" value="${data.ITEM_NAME}"></td>
	<td><input class = "itemPrice" type="number" maxlength="10" name = "itemPrice" value="${data.PRICE}">
		<input type = "hidden" name = "OlditemPrice" value = "${data.PRICE}"/></td>
	<td><input class = "itemMinOrdUnit" type="number" maxlength="10" name = "itemMinOrdUnit" value="${data.MIN_ORD_UNIT}"></td>
	<td style = "text-align: center;">
	<c:choose>
				<c:when test = "${data.COM_PROD_FLAG eq 0}">
					<input type="radio" name = "itemComProdFlag" checked = "checked" value = "0"/><label style= "padding-right: 20px;">Y</label>
					<input type="radio" name = "itemComProdFlag" value = "1"/><label>N</label>
				</c:when>
				<c:when test = "${data.COM_PROD_FLAG eq 1}">
					<input type="radio" name = "itemComProdFlag" value = "0"/><label style= "padding-right: 20px;">Y</label>
					<input type="radio" name = "itemComProdFlag" checked = "checked" value = "1"/><label>N</label>
				</c:when>
	</c:choose>
	<input type = "hidden" id = "itemComProdFlag" name = "itemComProdFlag" value = "${data.COM_PROD_FLAG}"/></td>
	</tr>
</table>
</form>
<div class=price_history>
<h3>가격변동내역</h3>
<table cellspacing="0">
	<colgroup>
		<col width="25%" />
		<col width="25%" />
		<col width="25%" />
		<col width="25%" />
	</colgroup>
	<thead>
	<tr>
		<th scope=col style= "border-left: none;">변동날짜</th>
		<th scope=col>변동전 가격</th>
		<th scope=col>변동후 가격</th>
		<th scope=col>변경자</th>
	</tr>
	</thead>
	<tbody></tbody>
</table>
</div>
</div>
</div>
</body>
</html>