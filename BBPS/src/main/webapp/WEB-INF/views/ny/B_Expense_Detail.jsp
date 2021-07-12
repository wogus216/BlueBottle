<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지점지출액상세조회</title>
<style type="text/css">

/* 상단 바 */
.top {
   width: 100%;
   padding: 0;
   margin: 0;
   background-color: white;
   display: inline-block;
   min-width: 1300px;
    height: 62px;
}

.top_menu{
	display: inline-block;
	vertical-align: top;
	float: right ;
	width: 800px;
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

.sub a:hover {
     background-color: #f1f1f1;
}

.menu_a:hover .sub, .menu_b:hover .sub ,.menu_c:hover .sub,.menu_d:hover .sub,
.menu_e:hover .sub  {
    display: block;
}

.log_out{
	display:inline-block;
	text-decoration: none;
	color: gray;
	padding:10px 20px;
	line-height: 42px;
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

/* 게시판 */

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
	width:150px;
	height:40px;
	margin:10px 5px;
}

.tot_spend_price ul{
	max-width: 1000px; 
   
}
.tot_spend_price li{
	font-size:19px;
	margin:10px;
	float:right;
}


.sales_info{
	float: left;
	font-size: 20px;
	margin-bottom: 10px;
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
	outline:none;
}
/* 페이지 하단 */
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

button:focus{outline:none;}

</style>


</head>
<body>
 <div class="top">
     <ul>
         <li>
         <a href="#">
         <img class="logo" alt="logo" src="./이미지(권재현)/logo.png" width="250px"></a>
         </li>
         
         <div class="top_menu">
         
          <div class="menu_a">
        	 <li>
         		<a class="main_menu" href="#">재고관리</a>
	        	 <div class="sub">
		        	 <a href="#">현재재고조회</a>
		             <a href="#">입고재고조회</a>
		             <a href="#">사용재고조회</a>
		             <a href="#">폐기조회</a>
	            </div>
             </li>
         </div>
         
         <div class="menu_b">
       		  <li>
         		<a class="main_menu" style="padding: 20px 40px;" href="#">주문관리 </a>
	          	<div class="sub">
	     			<a href="#">주문조회 및 환불</a>
	     			<a href="#">주문요청</a>
		            <a href="#">환불조회</a>
	            </div>
          	</li>
         </div>
         
          <div class="menu_c">
        	 <li>
				<a class="main_menu" href="#">매출조회</a>
             </li>
         </div>
        
          <div class="menu_d">
         	<li>
         		<a class="main_menu" href="#">공지사항</a>
	        </li>
          </div>
      
          <div class="menu_e">
           	<li>
               <a class="main_menu" href="#">마이페이지</a>
          	</li>
          </div>
          
           <a class="log_out" href="#">로그아웃</a>
      	</div><!-- top_munu end -->
      </ul>
 </div>  <!-- top end -->

<!--컨텐츠 -->
<div class="content_area">
<div class="content">
<h1 >지출액조회</h1>
<div class="sales_info">
	
		<strong>조회날짜 : </strong>2021-05-28
	
</div>
<table cellspacing="0">
	<colgroup>
		<col width="25%">
		<col width="25%">
		<col width="25%">
		<col width="25%">
	</colgroup>
	<tbody>
	<tr>
		<th scope="col" style="border-left: none;">품목</th>
		<th scope="col">수량</th>
		<th scope="col">가격(원)</th>
		<th scope="col">총지출</th>
	</tr>
	<tr>
		<td>에스프레소</td>
		<td>10</td>
		<td>3000</td>
		<td>50,000</td>
	</tr>
	<tr>
		<td>에스프레소</td>
		<td>10</td>
		<td>3000</td>
		<td>50,000</td>
	</tr>
	<tr>
		<td>에스프레소</td>
		<td>10</td>
		<td>3000</td>
		<td>50,000</td>
	</tr>
	<tr>
		<td>에스프레소</td>
		<td>10</td>
		<td>3000</td>
		<td>50,000</td>
	</tr>
	<tr>
		<td>에스프레소</td>
		<td>10</td>
		<td>3000</td>
		<td>50,000</td>
	</tr>
	</tbody>
</table>

	<ul class="tot_spend_price">
		<li><strong> 총지출액: </strong>4,000,000원</li>
	</ul>
		<div class="page_area">
			<div class="page_btn">
				<button style="background-color: white"><</button>
				<button style="background-color: white">1</button>
				<button style="background-color: white">2</button>
				<button style="background-color: white">3</button>
				<button style="background-color: white">></button>
			</div>
		</div>
		
	</div> <!--content end  -->
</div> <!--content_area end -->
</html>