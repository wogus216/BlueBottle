<!DOCTYPE html>
<html>
<head>
<meta charset= "UTF-8">

<title>본사공지사항리스트</title>
<style type="text/css">
/* 상단 바 */
.top {
   width: 100%;
   padding: 0;
   margin: 0;
   background-color: white;
   
   display: inline-block;
   min-width: 1820px;
   height: 62px;
}

.top_menu{
	display: inline-block;
	vertical-align: top;
	float: right ;
	width: 1500px;
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
   height: 62px;
}

.main_menu{
   display: inline-block;
   color: black;
   padding: 20px 30px;
   text-decoration: none;
   font-weight: bold;
   font-size: 17px;
}

.menu_f li .sub {
	width: 162px;
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
	cursor: pointer;
}

 td:first-child{
	border-left: none;
}
input{
	width:200px;
	height:40px;

}

.input_btn_area{
display: inline-block;
text-align: left;
}

.filter_area{
float : right;
	text-align: right;
	margin-bottom: 20px;
}
[name=r]{
	margin: 0;
	height: 20px;
	width: 30px;
	vertical-align: middle;
}

label{
	vertical-align: middle;
}
.search_btn, .input_btn{
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
/* 검색 과 페이지 */

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
}

.page_btn button:hover{
	color: #01a1dd;
}

.page_btn button:focus{
	outline:none;
}

.search_filter{
	width : 120px;
	vertical-align: middle;
}

.search_input{
	height: 34px;
	vertical-align: middle;
	width : 280px;
	outline:none;
}
</style>
<script type="text/javascript"
	src="../script/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript">
$(document).ready(function(){
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
	
	
}); //ready end
</script>
</head>
<body>
<!-- 상단 -->
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
         		발주관리</a>
	         <div class="sub">
	            <a href="#">
	            	발주요청조회</a>
	             <a href="#">
	            	발주완료조회</a>
	         </div>
          </li>
         </div>
         
         <div class="menu_b">
         <li>
         	<a class="main_menu" href="#">
         		발송관리</a>
	         <div class="sub">
	            <a href="#">
	            	발송요청조회</a>
	             <a href="#">
	            	발송완료조회</a>
	         </div>
          </li>
         </div>
         
         <div class="menu_c">
         <li>
         	<a class="main_menu" href="#">
         		환불관리</a>
	         <div class="sub">
	            <a href="#">
	            	환불요청조회</a>
	             <a href="#">
	            	환불완료조회</a>
	         </div>
          </li>
         </div>
         
         <div class="menu_d">
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
         
         <div class="menu_e">
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
         
            <div class="menu_f">
	         <li>
			<a class="main_menu" href="#"> 
		        		카테고리관리</a>
		          	<div class="sub">
					<a href="#">
		            	공지카테고리</a>
		            <a href="#">
		            	품목카테고리</a>
		            <a href="#">
		            	메뉴카테고리</a>
		            </div>
	          </li>
         </div>
         
         <div class="menu_g">
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
          <div class="menu_h">
         	<li>
         		<a class="main_menu" href="#"> 
         			공지사항</a>
	        </li>
         </div>
         <div class="menu_i">
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
          <div class="menu_j">
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


<!--컨텐츠 -->
<div class="content_area">
<div class="content">
<h1>공지사항</h1>
<div class="input_btn_area">
<button class="input_btn">글쓰기</button>
</div>

	<div class="filter_area">
			<select class="cate">
				<option value="0" selected="selected">전체</option>
				<option value="1">이벤트</option>
				<option value="2">주문관련</option>
				<option value="3">재고관련</option>
				<option value="4">시스템</option>
				<option value="4">기타</option>
			</select>
			<input type = "date" value="2021-01-01" class="start_date" />
			<input type = "date" value="2021-01-01" class="end_date"/>
			<button class="search_btn">검색</button>
		</div>
	
<table>
	<colgroup>
		<col width="15%">
		<col width="45%">
		<col width="20%">
		<col width="20%">
	</colgroup>
	<thead>
	<tr>
			<th>NO.</th>
			<th>제목</th>
			<th>날짜</th>
			<th>작성자</th>
		</tr>
	</thead>
	<tbody>
	<tr>
		<th scope="col" style="border-left: none;">No.</th>
		<th scope="col">제목</th>
		<th scope="col">날짜</th>
		<th scope="col">작성자</th>
	</tr>
	<tr>
		<td>160</td>
		<td><a href="#">5월 9일 새벽 시스템 오류 관련 공지사항</a></td>
		<td>2021.5.9</td>
		<td>admin</td>
	</tr>
	<tr>
		<td>159</td>
		<td><a href="#">여의도 카페점 이벤트 유의사항</a></td>
		<td>2021.5.9</td>
		<td>admin</td>
	</tr>
	<tr>
		<td>158</td>
		<td><a href="#">자재 출고일 변경사항 관련 안내</a></td>
		<td>2021.5.8</td>		
		<td>admin</td>
	</tr>
	<tr>
		<td>157</td>
		<td><a href="#">전 지점 대상 이벤트 예정</a></td>
		<td>2021.5.8</td>
		<td>admin</td>
	</tr>
	<tr>
		<td>156</td>
		<td><a href="#">994</a></td>
		<td>2021.5.8</td>
		<td>admin</td>
	</tr>
	<tr>
		<td>155</td>
		<td><a href="#">993</a></td>
		<td>2021.5.8</td>
		<td>admin</td>
	</tr>
	<tr>
		<td>154</td>
		<td><a href="#">992</a></td>
		<td>2021.5.7</td>
		<td>admin</td>
	</tr>
	<tr>
		<td>153</td>
		<td><a href="#">991</a></td>
		<td>2021.5.7</td>
		<td>admin</td>
	</tr>
	<tr>
		<td>152</td>
		<td><a href="#">990</a></td>
		<td>2021.5.6</td>
		<td>admin</td>
	</tr>
	<tr>
		<td>151</td>
		<td><a href="#">989</a></td>
		<td>2021.5.6</td>
		<td>admin</td>
	</tr>
	<tr>
		<td>150</td>
		<td><a href="#">988</a></td>
		<td>2021.5.6</td>
		<td>admin</td>
	</tr>
	<tr>
		<td>149</td>
		<td><a href="#">987</a></td>
		<td>2021.5.6</td>
		<td>admin</td>
	</tr>

	</tbody>
</table>
	<div class="search_area" style = "margin-top : 30px;">
		<div class="search_info">
		<form action="#" id="actionForm" method="post">
	<input type="hidden" id="sNo" name="sNo"/>
	<input type="hidden" id="page" name="page" value="${page}">
			<select class="search_filter">
				<option value="0" selected="selected">제목+내용</option>
				<option value="1">제목</option>
				<option value="2">내용</option>
				<option value="3">작성자</option>
			</select>
			<input type="hidden" id="searchOldTxt" value="${param.searchTxt}"/>
			<input type="text" class="search_input" name="searchTxt" id="searchTxt" value="${param.searchTxt}">
			<button class="search_btn" id="searchBtn">검색</button>
			</form>
		</div>
	</div>
	<div class="page_area">
		<div class="page_btn">
		<button style="background-color: white"><</button>
		<button style="background-color: white">1</button>
		<button style="background-color: white">2</button>
		<button style="background-color: white">3</button>
		<button style="background-color: white">></button>
		</div>
	</div>
	
	</div>
</div>

</body>
</html>