# ☕ Blue Bottle 통합재고관리 웹사이트
![프로젝트개요](https://user-images.githubusercontent.com/71995287/128670411-152ffcf4-e057-4375-8fe7-3327ee45366e.PNG)
<br/>


##  🗓 개발기간 & 참여인원
- 2021년 6월 30일 ~ 8월 1일
- 팀프로젝트 (5명)



<br/>

##  ⛏ 사용 기술
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
#### `Tools`
- Eclipse
- SQL Developer


<br/>

##  🖌 디자인 기획

* 카카오 오븐 활용

![오븐](https://user-images.githubusercontent.com/71995287/129475873-46659033-6a22-419e-b99b-adcab3a25c27.PNG)

<br/>

##  ⚒ DB 설계

* diagrams 활용
![진짜3](https://user-images.githubusercontent.com/71995287/128507795-107c7f19-6c83-42c6-9521-10a36298dd25.PNG)

---
<br/>

* 데이터를 기준으로 테이블 정의서 작성
![테이블 정의서](https://user-images.githubusercontent.com/71995287/129476034-c6a4ee4c-dadf-44d7-bdaf-3c4921669408.PNG)

---
<br/>

* 메뉴 권한 별 데이터 작성
![메뉴 별 권한 정리](https://user-images.githubusercontent.com/71995287/129476119-8918abd4-b8b3-4062-91c4-aded1450ac49.PNG)


<br/>

##  ⌨ 개발

> 코드 확인 하실 때 windows 분들은 ctrl + 클릭, mac 분들은 cmd + 클릭 부탁드립니다. <br/>
target 속성이 안되서 새창으로 안됩니다.<br/>
[출처](https://stackoverflow.com/questions/41915571/open-link-in-new-tab-with-github-markdown-using-target-blank)
<br/>



<details>
 <summary><b> HttpSession을 활용해 로그인 구현 </b></summary>
<div markdown="1">
<br/>
	
 ![로그인](https://user-images.githubusercontent.com/71995287/128507816-03641424-20de-41aa-b688-97abb2fc0893.PNG)
* 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/2e3f4c6608c94cf9924c29fccb64f6c86f473ed3/BBPS/src/main/java/com/gdj35/bbps/web/controller/jhController.java#L46)
</div>
</details>
<br/>

<details>
<summary><b> RequestParam 활용해 값 저장 </b></summary>
<div markdown="1">
<br/>
	
 ![메뉴바 1](https://user-images.githubusercontent.com/71995287/128507825-85ac1abe-164d-47fd-b24c-e0b82df04b43.PNG)
* 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/2e3f4c6608c94cf9924c29fccb64f6c86f473ed3/BBPS/src/main/java/com/gdj35/bbps/web/controller/jhController.java#L111)
</div>
</details>
<br/>

<details>
<summary><b> @Autowired을 활용해 객체 주입 </b></summary>
<div markdown="1">
<br/>
	
* 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/c047965aa2c761c827926f25914b5d4515d1342b/BBPS/src/main/java/com/gdj35/bbps/web/controller/jhController.java#L27)
</div>
</details>
<br/>

<details>
<summary><b> Ajax를 활용해 비동기 전송방식 구현 </b></summary>
<div markdown="1">
<br/>
	
![지점 메뉴](https://user-images.githubusercontent.com/71995287/129477301-67483bb9-49f8-4ef9-8e2c-44c6a4622d13.PNG)

* Controller 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/2e3f4c6608c94cf9924c29fccb64f6c86f473ed3/BBPS/src/main/java/com/gdj35/bbps/web/controller/jhController.java#L564)
* Ajax🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/c047965aa2c761c827926f25914b5d4515d1342b/BBPS/src/main/webapp/WEB-INF/views/jh/B_Menu.jsp#L183)
</div>
</details>
<br/>

<details>
<summary><b> c:import,c:param 활용해 출력 및 값 전송  </b></summary>
<div markdown="1">
<br/>
	
 ![메뉴바2](https://user-images.githubusercontent.com/71995287/128507839-6131d386-f361-4825-bd35-ba43ea932acb.PNG)
* 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/c047965aa2c761c827926f25914b5d4515d1342b/BBPS/src/main/webapp/WEB-INF/views/jh/Menu_List.jsp#L4)
</div>
</details>
<br/>

<details>
<summary><b> CommonsMultipartResolver 와 Fileform 활용해 이미지 업로드  </b></summary>
<div markdown="1">
<br/>
	
 ![포스관리2](https://user-images.githubusercontent.com/71995287/128507900-34bf8a2a-3cb5-42e8-a963-0ce818176336.PNG)	
	
  *  CommonsMultipartResolver  🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/6bda7a26da6a00f5857362bf4e260ac0a4b31ab0/BBPS/src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml#L30)	
  *  Fileform 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/c047965aa2c761c827926f25914b5d4515d1342b/BBPS/src/main/webapp/WEB-INF/views/jh/Menu_Edit.jsp#L267)
</div>
</details>
<br/>

<details>
<summary><b> Paging </b></summary>
<div markdown="1">
<br/>
	
![포스관리1](https://user-images.githubusercontent.com/71995287/128507876-cd28d39b-a3dc-49a2-a677-28160f97e018.PNG)	
	
	
 * Controller 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/c047965aa2c761c827926f25914b5d4515d1342b/BBPS/src/main/java/com/gdj35/bbps/web/controller/jhController.java#L166)
 *  PagingBean 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/6bda7a26da6a00f5857362bf4e260ac0a4b31ab0/BBPS/src/main/java/com/gdj35/bbps/common/bean/PagingBean.java#L3)
 *  PagingService 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/6bda7a26da6a00f5857362bf4e260ac0a4b31ab0/BBPS/src/main/java/com/gdj35/bbps/common/service/PagingService.java#L9)

</div>
</details>
<br/>

<details>
<summary><b> AOP @Aspect를 활용 </b></summary>
<div markdown="1">
<br/>
	
>  비 로그인시 로그인 페이지 제외 페이지 이동 시 로그인페이지로 이동	
		
   *  🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/6bda7a26da6a00f5857362bf4e260ac0a4b31ab0/BBPS/src/main/java/com/gdj35/bbps/common/controller/CommonAOP.java#L14)
 	
</div>
</details>
<br/>
	

<details>
<summary><b> AES 방식 암호화 활용 </b></summary>
<div markdown="1">
<br/>
	
* Controller  🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/2e3f4c6608c94cf9924c29fccb64f6c86f473ed3/BBPS/src/main/java/com/gdj35/bbps/web/controller/jhController.java#L68)

* AES  🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/2e3f4c6608c94cf9924c29fccb64f6c86f473ed3/BBPS/src/main/java/com/gdj35/bbps/util/Utils.java#L30)
 	
</div>
</details>
<br/>

<details>
<summary><b> 계층형 쿼리 활용 </b></summary>
<div markdown="1">
<br/>
	
![블루보틀 1](https://user-images.githubusercontent.com/71995287/129477637-2636e8a4-a0de-4337-998e-c10519c2eb7b.PNG)
		
  * Query 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/2e3f4c6608c94cf9924c29fccb64f6c86f473ed3/BBPS/src/main/resources/mapper/JH_SQL.xml#L22)
  * jsp 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/2e3f4c6608c94cf9924c29fccb64f6c86f473ed3/BBPS/src/main/webapp/WEB-INF/views/jh/H_Menu.jsp#L210)
 
 ####  블로그 정리
 <br/>
	
> [블로그](https://velog.io/@wogus216/%EB%B8%94%EB%A3%A8%EB%B3%B4%ED%8B%80-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-%EB%A9%94%EB%89%B4%EB%B0%94)	
</div>
</details>
<br/>


<details>
<summary><b> 동적 쿼리 활용 </b></summary>
<div markdown="1">
<br/>
	
![주문번호 추가](https://user-images.githubusercontent.com/71995287/128585747-2f5b2f00-e730-41c3-b4e8-1fdd7c550ebb.PNG)
		
  * Query 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/0b7bc5e66d6db3f1d32f923f93e12a8610cf8709/BBPS/src/main/resources/mapper/JH_SQL.xml#L165)
  * jsp 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/c047965aa2c761c827926f25914b5d4515d1342b/BBPS/src/main/webapp/WEB-INF/views/jh/Pos.jsp#L706)
 	
</div>
</details>
<br/>
	


 ##   🌋 핵심 트러블 슈팅
 <br/>
 
 ### 1. 주문번호 생성
  <br/>

![매출테이블](https://user-images.githubusercontent.com/71995287/128622355-ce342a8c-c8f5-4860-af16-f4c6db64edf7.PNG)
  <br/>
  
 * 문제점: 주문번호로 인해 매출금액, 매출 품목무결성 제약조건 위배 발생
 * 해결책: 주문번호를 생성 후 매출금액,매출품목의 주문번호로 삽입

    * Controller🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/689a8a5b87e0c6ef5eb1faba60d34281a55afe9f/BBPS/src/main/java/com/gdj35/bbps/web/controller/jhController.java#L809)
     * Query 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/689a8a5b87e0c6ef5eb1faba60d34281a55afe9f/BBPS/src/main/resources/mapper/JH_SQL.xml#L214)
     * 주문번호 생성 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/689a8a5b87e0c6ef5eb1faba60d34281a55afe9f/BBPS/src/main/webapp/WEB-INF/views/jh/Pos.jsp#L789)
<br/>
 
 ### 2. 포스메뉴 갯수 변경 시 적용
 <br/>
 
 * 문제점 : 갯수 변경 시 변경 전,후 값에 맞춰서 주문 개수와 결제금액이 변경 오류 발생
 * 해결책 : 함수 focus를 통해 변경 전 값을 담았고, 변경 후 값은 함수 change를 통해 해결
 
   * 갯수 변경 적용 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/689a8a5b87e0c6ef5eb1faba60d34281a55afe9f/BBPS/src/main/webapp/WEB-INF/views/jh/Pos.jsp#L533)
 <br/>
 
 
#### 블로그 정리
 <br/>
 
 > [주문번호 생성](https://velog.io/@wogus216/%EC%A3%BC%EB%AC%B8%EB%B2%88%ED%98%B8-%EC%83%9D%EC%84%B1%EA%B3%BC-DB%EC%97%90-%EB%84%A3%EA%B8%B0)
 <br/>[변경 적용](https://velog.io/@wogus216/%ED%8F%AC%EC%8A%A4%EB%A9%94%EB%89%B4-%EA%B0%9C%EC%88%98-%EB%B3%80%EA%B2%BD)
  
 <br/>
 
##  💣 각종 트러블 슈팅들
<br/>
  
 <details>
<summary>테이블 연결 오류</summary>
<div markdown="1">
<br/>
	
*  jdbc.properties에서 설정을 안해서 오류가 발생했습니다.
<br/>
	
![Untitled (5)](https://user-images.githubusercontent.com/71995287/128625178-7c049d80-22d8-4e28-9725-6c31305a7b8d.png)

</div>
</details>

 <details>
<summary>form id 중복</summary>
<div markdown="1">
<br/>
	
* jsp 파일 안에서 form id 중복으로 인해 오류가 발생했습니다.

**수정 전 코드**
 
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
**수정 후 코드**
 
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
 * ul 태그 중복으로 인해서 중첩 오류가 발생했습니다.
 
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
	
* 대부분 콤마(,) 띄어쓰기 세미콜론(;) 등 의 오타나 문법에 의해 발생한 오류입니다.
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
 <br/>	
	
 **트러블 슈팅모음**
	
  >  [노션](https://steel-mitten-08e.notion.site/c5e52f2274324ee198a381671a780d26)
	
<br/>
	
  ##  🎞 회고 및 느낀 점
<br/>
	
> [프로젝트 회고](https://velog.io/@wogus216/%EB%B8%94%EB%A3%A8%EB%B3%B4%ED%8B%80-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-%ED%9A%8C%EA%B3%A0)
	
	

