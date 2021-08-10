# ☕Blue Bottle 통합재고관리 웹사이트
![프로젝트개요](https://user-images.githubusercontent.com/71995287/128670411-152ffcf4-e057-4375-8fe7-3327ee45366e.PNG)
<br/>


## 1.제작기간 & 참여인원
- 2021년 6월 30일 ~ 8월 1일
- 팀프로젝트 (5명)



<br/>

## 2. 사용 기술
#### `Back - end`
 - Java 8
 - Spring 4.3.4
 - Maven
 - mybatis 3.2.7
 - Oracle 11g
#### `Front - end`
 - HTML
 - CSS
 - Javascript
 - jQuery


<br/>

## 3. ERD 설계
![진짜3](https://user-images.githubusercontent.com/71995287/128507795-107c7f19-6c83-42c6-9521-10a36298dd25.PNG)

<br/>

## 4. 담당 파트
구현 파트는 `로그인 페이지, 상단메뉴바, 포스, 포스메뉴관리, 마이페이지` 입니다.
<br/>

<details>
 <summary><b>담당파트 설명 펼치기</b></summary>
<div markdown="1">
<br/>
	
> 코드 확인 하실 때 windows 분들은 ctrl + 클릭, mac 분들은 cmd + 클릭 부탁드립니다. <br/>
target 속성이 안되서 새창으로 안됩니다.
<br/>참고 : [https://stackoverflow.com/questions/41915571/open-link-in-new-tab-with-github-markdown-using-target-blank](https://stackoverflow.com/questions/41915571/open-link-in-new-tab-with-github-markdown-using-target-blank)
<br/>
 
### 4-1 로그인 페이지
 <br/>
	
 ![로그인](https://user-images.githubusercontent.com/71995287/128507816-03641424-20de-41aa-b688-97abb2fc0893.PNG)
 <br/>
	
 * ID와 PW 입력 후  로그인 시 비동기로 확인합니다. 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/2e3f4c6608c94cf9924c29fccb64f6c86f473ed3/BBPS/src/main/java/com/gdj35/bbps/web/controller/jhController.java#L58)
 * ID 또는 PW가 틀릴 시에 로그인 실패하고 팝업창이 나옵니다. 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/2e3f4c6608c94cf9924c29fccb64f6c86f473ed3/BBPS/src/main/webapp/WEB-INF/views/jh/H_Login.jsp#L235)
 * 세션을 통해 로그인과 비로그인 상태에 따른 다른 페이지 출력됩니다. 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/c047965aa2c761c827926f25914b5d4515d1342b/BBPS/src/main/java/com/gdj35/bbps/web/controller/jhController.java#L45)
 <br/>
	
 ### 4-2 상단 메뉴바
<br/>
	
 * 권한에 따라 메뉴가 구성됩니다.
 ![메뉴바 1](https://user-images.githubusercontent.com/71995287/128507825-85ac1abe-164d-47fd-b24c-e0b82df04b43.PNG)
 ![메뉴바2](https://user-images.githubusercontent.com/71995287/128507839-6131d386-f361-4825-bd35-ba43ea932acb.PNG)
<br/> 
	
* 상위메뉴와 하위 메뉴가 존재해 계층형 쿼리를 사용했습니다. 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/2e3f4c6608c94cf9924c29fccb64f6c86f473ed3/BBPS/src/main/resources/mapper/JH_SQL.xml#L22)	
* 조건문을 통해 권한에 맞게 그립니다. 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/2e3f4c6608c94cf9924c29fccb64f6c86f473ed3/BBPS/src/main/webapp/WEB-INF/views/jh/H_Menu.jsp#L210)
 
**자세한 정리는 블로그에 있습니다.**
 <br/>
	
> [상단메뉴](https://velog.io/@wogus216/%EB%B8%94%EB%A3%A8%EB%B3%B4%ED%8B%80-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-%EB%A9%94%EB%89%B4%EB%B0%94)
 <br/>

### 4-3 포스
 * 기능 : 주문, 결제, 환불
 
![주문번호  추가](https://user-images.githubusercontent.com/71995287/128585747-2f5b2f00-e730-41c3-b4e8-1fdd7c550ebb.PNG)
![주문번호 추가2](https://user-images.githubusercontent.com/71995287/128585756-d2dfe76d-ae14-40ed-a483-b34805879375.PNG)
 
 ### 포스결제흐름
 ![결제흐름](https://user-images.githubusercontent.com/71995287/128618372-e4c753c1-883c-4dfc-a186-8a697d7ed47b.PNG)

 #### 1. 주문
 * 카테고리 클릭 시 카테고리 번호를 히든값으로 form에 담아 전송 후 비동시 방식으로 그려줍니다.
 
   * 카테고리선택🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/0b7bc5e66d6db3f1d32f923f93e12a8610cf8709/BBPS/src/main/webapp/WEB-INF/views/jh/Pos.jsp#L705)
   * Query🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/0b7bc5e66d6db3f1d32f923f93e12a8610cf8709/BBPS/src/main/resources/mapper/JH_SQL.xml#L165)

 * 메뉴 클릭 시 중복 체크 후 주문상황에 넣어줍니다.🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/d2a9229a0ac32a7ae24598bcf1ff559ba9141bfc/BBPS/src/main/webapp/WEB-INF/views/jh/Pos.jsp#L512)
 
 #### 2. 결제
 * 받은 금액을 입력 후 확인 클릭 시 받은금액 과 결제금액을 비교 후 조건 통과 시 결제 성공합니다.
	
   * 현금, 카드결제 코드🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/d2a9229a0ac32a7ae24598bcf1ff559ba9141bfc/BBPS/src/main/webapp/WEB-INF/views/jh/Pos.jsp#L616)
   * 받은 금액, 결제금액 비교 코드🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/c047965aa2c761c827926f25914b5d4515d1342b/BBPS/src/main/webapp/WEB-INF/views/jh/Pos.jsp#L679)
 
#### 3. 환불
  * 환불 클릭 시 매출 날짜를 출력합니다.
 
    * Controller🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/689a8a5b87e0c6ef5eb1faba60d34281a55afe9f/BBPS/src/main/java/com/gdj35/bbps/web/controller/jhController.java#L911)
    * Query 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/689a8a5b87e0c6ef5eb1faba60d34281a55afe9f/BBPS/src/main/resources/mapper/JH_SQL.xml#L292)
 
 <br/>
	
 ### 4-4 포스메뉴 관리
 ![포스관리1](https://user-images.githubusercontent.com/71995287/128507876-cd28d39b-a3dc-49a2-a677-28160f97e018.PNG)
 ![포스관리2](https://user-images.githubusercontent.com/71995287/128507900-34bf8a2a-3cb5-42e8-a963-0ce818176336.PNG)
 
 * 비동기 방식으로 메뉴 목록, 페이징 취득합니다.
	
     * Controller 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/c047965aa2c761c827926f25914b5d4515d1342b/BBPS/src/main/java/com/gdj35/bbps/web/controller/jhController.java#L166)
     *  ajax 실행 코드 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/c047965aa2c761c827926f25914b5d4515d1342b/BBPS/src/main/webapp/WEB-INF/views/jh/Menu_List.jsp#L204)
     *  메뉴 이미지 변경 후 이미지 적용 코드 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/c047965aa2c761c827926f25914b5d4515d1342b/BBPS/src/main/webapp/WEB-INF/views/jh/Menu_Edit.jsp#L196)
<br/>
	
### 4-4 마이페이지
 ![마이페이지](https://user-images.githubusercontent.com/71995287/128619039-4cf6200a-954a-47ca-9561-86f62f2fc9ad.PNG)
 ![마이페이지 개인정보확인](https://user-images.githubusercontent.com/71995287/128507951-b4889786-fdc1-4264-950a-073c622f512f.PNG)
 ![마이페이지 수정](https://user-images.githubusercontent.com/71995287/128507973-ddec089f-4df4-499b-9369-0c1a490d64d7.PNG)

 * 수정 클릭 후 비밀번호로 한번 더 개인정보를 확인합니다.
     * Controller🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/689a8a5b87e0c6ef5eb1faba60d34281a55afe9f/BBPS/src/main/java/com/gdj35/bbps/web/controller/jhController.java#L404)
     * Query 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/689a8a5b87e0c6ef5eb1faba60d34281a55afe9f/BBPS/src/main/resources/mapper/JH_SQL.xml#L228)
 
 </div>
</details>
<br/>

 ##  5. 🌋핵심 트러블 슈팅
 <br/>
  
 ### 5-1 주문번호 생성
 ![매출테이블](https://user-images.githubusercontent.com/71995287/128622355-ce342a8c-c8f5-4860-af16-f4c6db64edf7.PNG)
 * 문제점: 매출금액,매출품목은 부모자식 관계이면서, 동일한 주문번호가 필요했습니다.
 * 해결책: 주문번호를 먼저 생성 후 히든 값으로 담은 뒤 form를 통해 매출금액,매출품목의 주문번호로 넣어주었습니다.
    * Controller🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/689a8a5b87e0c6ef5eb1faba60d34281a55afe9f/BBPS/src/main/java/com/gdj35/bbps/web/controller/jhController.java#L809)
     * Query 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/689a8a5b87e0c6ef5eb1faba60d34281a55afe9f/BBPS/src/main/resources/mapper/JH_SQL.xml#L214)
     * 주문번호 생성 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/689a8a5b87e0c6ef5eb1faba60d34281a55afe9f/BBPS/src/main/webapp/WEB-INF/views/jh/Pos.jsp#L789)
<br/>
 
 ### 5-2 포스메뉴 갯수 변경 시 적용
 <br/>
 
 * 문제점 : 갯수 변경 시 변경 전,후 값에 맞춰서 주문 개수와 결제금액이 변경이 안됐습니다.
 * 해결책 : focus를 통해 변경 전 값을 담았고, 변경 후 값은 change를 통해서 해결했습니다.
   * 갯수 변경 적용 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/689a8a5b87e0c6ef5eb1faba60d34281a55afe9f/BBPS/src/main/webapp/WEB-INF/views/jh/Pos.jsp#L533)
 
**자세한 내용은 블로그에 있습니다.**
 <br/>
 
 > [주문번호 생성](https://velog.io/@wogus216/%EC%A3%BC%EB%AC%B8%EB%B2%88%ED%98%B8-%EC%83%9D%EC%84%B1%EA%B3%BC-DB%EC%97%90-%EB%84%A3%EA%B8%B0)
 <br/>[변경 적용](https://velog.io/@wogus216/%ED%8F%AC%EC%8A%A4%EB%A9%94%EB%89%B4-%EA%B0%9C%EC%88%98-%EB%B3%80%EA%B2%BD)

 <br/>
 
##  6. 💣각종 트러블 슈팅들
<br/>
  
 <details>
<summary>테이블 연결 오류</summary>
<div markdown="1">
<br/>
	
*  jdbc.properties 설정을 안해놨습니다.
<br/>
	
![Untitled (5)](https://user-images.githubusercontent.com/71995287/128625178-7c049d80-22d8-4e28-9725-6c31305a7b8d.png)

</div>
</details>

 <details>
<summary>form id 중복</summary>
<div markdown="1">
<br/>
	
* jsp 파일 안에서 form id 중복으로 인해 오류가 발생했습니다.

 ** 수정 전 코드**
 
 ```javascript
 <form action="#" id="actionForm" method="post">
   <input type="hidden"  id="hUserNo" name="hUserNo" value="${hUserNo}">
   <input type="hidden"  id="hDt" name="hDt" value="${hDt}">
 </form>
 
<form action="#" id="actionForm" method="post">
			<input type="hidden" id="menuNo" name="menuNo"/>
			<input type="hidden" id="cateNo" name="cateNo"/>
			<input type="hidden" id="page" name="page" value="${page}"/>
			<div class="search_info">
				<select class="search_filter">
					<option value="0" selected="selected">메뉴이름</option>
					<option value="1">카테고리</option>
					<option value="2">가격</option>
				</select>
				<input type="text" class="search_input" value="${param.search_input}"/>
				<button class="search_btn">검색</button>
			</div>
		</form>
 ```
 ** 수정 후 코드**
 
 ```javascript
 <form action="#" id="hMenuForm" method="post">
		<input type="hidden"  id="hUserNo" name="hUserNo" value="${hUserNo}">
		<input type="hidden"  id="hDt" name="hDt" value="${hDt}">
</form>
 
<form action="#" id="menuForm" method="post">
			<input type="hidden" id="menuNo" name="menuNo"/>
			<input type="hidden" id="cateNo" name="cateNo"/>
			<input type="hidden" id="page" name="page" value="${page}"/>
			<div class="search_info">
				<select class="search_filter">
					<option value="0" selected="selected">메뉴이름</option>
					<option value="1">카테고리</option>
					<option value="2">가격</option>
				</select>
				<input type="text" class="search_input" value="${param.search_input}"/>
				<button class="search_btn">검색</button>
			</div>
		</form>
 ```

</div>
</details>

<details>
<summary>주문 중첩 오류</summary>
<div markdown="1">
<br/>
	
![Untitled (6)](https://user-images.githubusercontent.com/71995287/128625376-0964a20d-7d68-4dd8-8aad-f4feae88e06e.png)
 * ul 태그 중복으로 인해서 중첩 오류
 
 ```javascript
 <form action="#" id="menu_form" method="post">
		<input type="hidden" id="cateNo" name="cateNo" value="${param.cateNo}"/> 
		<input type="hidden" id="menuCnt" name="menuCnt" /> 
			<div class="left">
					<div class="ord_area">
						<ul class="table_ord" cellspacing="0">
							
						</ul>
					</div>
   ```  
  **수정 전 코드**  
    
  ```javascript
    function inputOrd(ord){
	var order ="";
	// "+ + "
	
	order+= "<ul mNo=\""+ ord.MNO +"\" class=\"table_ord\" cellspacing=\"0\">";                                                         
	order+= 		"<li mNo=\""+ ord.MNO +"\">";
	order+= 			"<img src=\"resources/upload/"+ord.MIMG+"\" class=\"choice_img\">";
	order+= 		"</li>";
	order+= 		"<li>";
	order+= 			"<input type=\"text\" value=\""+ ord.MNAME + "\" class=\"choice_menu\">";
	order+= 		"</li>";
	order+= 		"<li>";
	order+= 			"<input type=\"text\" value=\""+ ord.MPRICE + "\" class=\"choice_price\">";
	order+= 		"</li>";
	order+= 		"<li>";
	order+= 			"<input type=\"text\" value=1 class=\"choice_num\">";
	order+= 		"</li>";
	order+= 		"<li>";
	order+= 			"<input type=\"button\" value=\"+\" class=\"choice_plus\">";
	order+=		 "<br/>";
	order+= 			"<input type=\"button\" value=\"-\" class=\"choice_minus\">";
	order+= 		"</li>";
	order+= "</ul>";
	
	
	
	$(".table_ord").append(order);
 ```
   **수정 후 코드**  
    
```javascript
  //현재 주문 넣기
function inputOrd(ord){
	var order ="";
	
	// "+ + "
	order+= 		"<div class=\"ord_stat\">";
	order+= 			"<div class=\"ord_img\" mNo=\""+ ord.MNO +"\">";
	order+= 				"<img src=\"resources/upload/"+ord.MIMG+"\" class=\"choice_img\">";
	order+= 			"</div>";
	order+= 			"<div class=\"ord_div\">";
	order+= 				"<input type=\"text\" value=\""+ ord.MNAME + "\" class=\"choice_menu\">";
	order+= 			"</div>";
	order+= 			"<div class=\"ord_div\">";
	order+= 				"<input type=\"text\" value=\""+ ord.MPRICE + "\" class=\"choice_price\">";
	order+= 			"</div >";
	order+= 			"<div class=\"ord_div\">";
	order+= 				"<select id=\"ord_cnt\" name=\"ord_cnt\">";
	order+= 					"<option value=\"1\" selected=\"selected\">1</option>";
	order+= 					"<option value=\"2\">2</option>";
	order+= 					"<option value=\"3\">3</option>";
	order+= 					"<option value=\"4\">4</option>";
	order+= 					"<option value=\"5\">5</option>";
	order+= 					"<option value=\"6\">6</option>";
	order+= 					"<option value=\"7\">7</option>";
	order+= 					"<option value=\"8\">8</option>";
	order+= 					"<option value=\"9\">9</option>";
	order+= 					"<option value=\"10\">10</option>";
	order+= 				"</select>";
	order+= 			"</div>";
	order+= 			"<div class=\"ord_div\">";
	order+= 				"<input type=\"button\" value=\"취소\" class=\"choice_cnl\">";
	order+= 			"</div >";
	order+= 		"</div>";
	
	$(".ord_area").append(order);
	ordCnt();
} 
```

</div>
</details>

<details>
<summary>name 값 전달 오류</summary>
<div markdown="1">
<br/>
	
* input타입이 아닌 태그들은 form에 의해서 `name값`으로 전달이 불가능해 값을 담아줘서 보내야합니다.
* @RequestParam 변수명과 값을 던져주는 jsp에 있는 네임값과 일치해야합니다.

#### Controller
```java
 @ResponseBody
		public String input_Menus(
				@RequestParam ArrayList<String> menuNo, 
				@RequestParam ArrayList<String> oMCnt,
				@RequestParam ArrayList<String> ordNo) throws Throwable{
```
#### Pos.jsp
```javascript
 	order+= 		"<div class=\"ord_stat\" mNo=\""+ ord.MNO +"\">";
	order+= 			"<div class=\"ord_img\" mNo=\""+ ord.MNO +"\" >";
	order+= 				"<img src=\"resources/upload/"+ord.MIMG+"\" class=\"choice_img\">";
	order+=" <input type=\"hidden\" id=\"menuNo\" name=\"menuNo\" value=\""+ ord.MNO + "\"/>";
	order+= 			"</div>";
	order+= 			"<div class=\"ord_div\">";
	order+= 				"<input type=\"text\" value=\""+ ord.MNAME + "\" class=\"choice_menu\" >";
	order+= 			"</div>";
	order+= 			"<div class=\"ord_div\">";
	order+= 				"<input type=\"text\" value=\""+ ord.MPRICE + "\" class=\"choice_price\">";
	order+= 			"</div >";
	order+= 			"<div class=\"ord_div\">";
	order+= 				"<select class=\"ord_cnt\" name=\"oMCnt\" mNo=\""+ ord.MNO +"\" value=\"\">";
```

</div>
</details>

<details>
<summary>ORA-00923: FROM 키워드가 필요한 위치에 없습니다.</summary>
<div markdown="1">
<br/>
	
* 대부분 콤마(,) 띄어쓰기 세미콜론(;) 등 의 오타나 문법에 의해 발생한 오류였다.
* 나의 경우 `콤마`실수로 콤마를 추가해 문제를 해결했다.
```sql
 <!-- 지점 마이페이지 -->
	<select id="getBUser" parameterType="hashmap" resultType="hashmap">
		SELECT BRCH_NO AS BNO, ID, `PW 오류지점` BRCH_NAME AS BNM, POST_NUM AS PNUM, DFT_ADDRESS AS DFADDR, DTL_ADDRESS AS DTADDR, CALL_NUM AS CNUM, MGR_NAME AS MNM, MGR_PHONE_NUM AS MGPNUM
		FROM BRCH
		WHERE BRCH_NO = #{brchNo}
	</select> 
```

</div>
</details>
	
 **트러블 슈팅모음**
	
  >  [노션](https://steel-mitten-08e.notion.site/c5e52f2274324ee198a381671a780d26)
	
<br/>
	
  ##  7. 회고 및 느낀 점
<br/>
	
> [프로젝트 회고](https://velog.io/@wogus216/%EB%B8%94%EB%A3%A8%EB%B3%B4%ED%8B%80-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-%ED%9A%8C%EA%B3%A0)
	
	

