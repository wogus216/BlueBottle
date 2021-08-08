# ☕BlueBottle
>블루보틀 재고관리, POS 웹사이트

<br/>

## 1.제작기간 & 참여인원
- 2021년 3월 30일 ~ 8월 1일
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
 
## 3. ERD 설계
![진짜3](https://user-images.githubusercontent.com/71995287/128507795-107c7f19-6c83-42c6-9521-10a36298dd25.PNG)


## 4. 담당 파트
제가 맡은 부분은 로그인 페이지, 상단메뉴바, 포스, 포스메뉴관리, 마이페이지 입니다.

<details>
 <summary><b>담당파트 설명 펼치기</b></summary>
<div markdown="1">
<br/>
 
### 4-1 로그인 페이지
 
 ![로그인](https://user-images.githubusercontent.com/71995287/128507816-03641424-20de-41aa-b688-97abb2fc0893.PNG)
 
 * ID와 PW 입력 후  로그인 시 비동기로 확인합니다. 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/2e3f4c6608c94cf9924c29fccb64f6c86f473ed3/BBPS/src/main/java/com/gdj35/bbps/web/controller/jhController.java#L58){:target="_blank"}
 * ID 또는 PW가 틀릴 시에 로그인 실패하고 팝업창이 나옵니다. 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/2e3f4c6608c94cf9924c29fccb64f6c86f473ed3/BBPS/src/main/webapp/WEB-INF/views/jh/H_Login.jsp#L235)
 * 세션을 통해 로그인과 비로그인 상태에 따른 다른 페이지 출력 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/c047965aa2c761c827926f25914b5d4515d1342b/BBPS/src/main/java/com/gdj35/bbps/web/controller/jhController.java#L45)
 
 ### 4-2 상단 메뉴바
 * 권한에 따라 메뉴가 구성됩니다.
 ![메뉴바 1](https://user-images.githubusercontent.com/71995287/128507825-85ac1abe-164d-47fd-b24c-e0b82df04b43.PNG)
 ![메뉴바2](https://user-images.githubusercontent.com/71995287/128507839-6131d386-f361-4825-bd35-ba43ea932acb.PNG)
 
* 상위메뉴와 하위 메뉴가 존재해 계층형 쿼리를 사용했습니다. 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/2e3f4c6608c94cf9924c29fccb64f6c86f473ed3/BBPS/src/main/resources/mapper/JH_SQL.xml#L22)
* 조건문을 통해 권한에 맞게 그립니다. 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/2e3f4c6608c94cf9924c29fccb64f6c86f473ed3/BBPS/src/main/webapp/WEB-INF/views/jh/H_Menu.jsp#L210)
 
**자세한 정리는 블로그에 있습니다.**
 <br/>
* [상단메뉴](https://velog.io/@wogus216/%EB%B8%94%EB%A3%A8%EB%B3%B4%ED%8B%80-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-%EB%A9%94%EB%89%B4%EB%B0%94)


### 4-3 포스
 * 기능 : 주문, 결제, 환불
 
![주문번호  추가](https://user-images.githubusercontent.com/71995287/128585747-2f5b2f00-e730-41c3-b4e8-1fdd7c550ebb.PNG)
![주문번호 추가2](https://user-images.githubusercontent.com/71995287/128585756-d2dfe76d-ae14-40ed-a483-b34805879375.PNG)
 
 ### 포스결제흐름
 ![결제흐름](https://user-images.githubusercontent.com/71995287/128618372-e4c753c1-883c-4dfc-a186-8a697d7ed47b.PNG)

 #### 1. 주문
 * 카테고리 클릭 시 카테고리 번호를 히든값으로 form에 담아 전송 후 비동시 방식으로 그려줍니다.
 
   - Javascript🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/0b7bc5e66d6db3f1d32f923f93e12a8610cf8709/BBPS/src/main/webapp/WEB-INF/views/jh/Pos.jsp#L705)
   - mybatis🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/0b7bc5e66d6db3f1d32f923f93e12a8610cf8709/BBPS/src/main/resources/mapper/JH_SQL.xml#L165)

 * 메뉴 클릭 시 중복 체크 후 주문상황에 넣어줍니다.🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/d2a9229a0ac32a7ae24598bcf1ff559ba9141bfc/BBPS/src/main/webapp/WEB-INF/views/jh/Pos.jsp#L512)
 
 #### 2. 결제
 * 현금, 카드 결제 클릭 시 숫자 키보드가 출력되고 받은 금액을 입력 후 확인 클릭 시 받은금액 과 결제금액을 비교 후 문제없을 시 결제 성공합니다.
   * 현금, 카드결제 코드🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/d2a9229a0ac32a7ae24598bcf1ff559ba9141bfc/BBPS/src/main/webapp/WEB-INF/views/jh/Pos.jsp#L616)
   * 받은 금액, 결제금액 비교 코드🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/c047965aa2c761c827926f25914b5d4515d1342b/BBPS/src/main/webapp/WEB-INF/views/jh/Pos.jsp#L679)
 
#### 3. 환불
  * 환불 클릭 시 매출 날짜를 출력합니다.
 
    * Controller🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/689a8a5b87e0c6ef5eb1faba60d34281a55afe9f/BBPS/src/main/java/com/gdj35/bbps/web/controller/jhController.java#L911)
    * Query 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/689a8a5b87e0c6ef5eb1faba60d34281a55afe9f/BBPS/src/main/resources/mapper/JH_SQL.xml#L292)
 
 
 ### 4-4 포스메뉴 관리
 ![포스관리1](https://user-images.githubusercontent.com/71995287/128507876-cd28d39b-a3dc-49a2-a677-28160f97e018.PNG)
 ![포스관리2](https://user-images.githubusercontent.com/71995287/128507900-34bf8a2a-3cb5-42e8-a963-0ce818176336.PNG)
 
 비동기 방식으로 메뉴 목록, 페이징 취득
* Controller 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/c047965aa2c761c827926f25914b5d4515d1342b/BBPS/src/main/java/com/gdj35/bbps/web/controller/jhController.java#L166)
* ajax 실행 코드 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/c047965aa2c761c827926f25914b5d4515d1342b/BBPS/src/main/webapp/WEB-INF/views/jh/Menu_List.jsp#L204)
* 메뉴 이미지 변경 후 이미지 적용 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/c047965aa2c761c827926f25914b5d4515d1342b/BBPS/src/main/webapp/WEB-INF/views/jh/Menu_Edit.jsp#L196)
 
### 4-4 마이페이지
 ![마이페이지](https://user-images.githubusercontent.com/71995287/128619039-4cf6200a-954a-47ca-9561-86f62f2fc9ad.PNG)
 ![마이페이지 개인정보확인](https://user-images.githubusercontent.com/71995287/128507951-b4889786-fdc1-4264-950a-073c622f512f.PNG)
 ![마이페이지 수정](https://user-images.githubusercontent.com/71995287/128507973-ddec089f-4df4-499b-9369-0c1a490d64d7.PNG)

 * 수정 클릭 후 비밀번호로 한번 더 개인정보를 확인합니다.
  * Controller🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/689a8a5b87e0c6ef5eb1faba60d34281a55afe9f/BBPS/src/main/java/com/gdj35/bbps/web/controller/jhController.java#L404)
  * Query 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/689a8a5b87e0c6ef5eb1faba60d34281a55afe9f/BBPS/src/main/resources/mapper/JH_SQL.xml#L228)
 
 ##  5. 🌋핵심 트러블 슈팅
 
 ### 5-1 주문번호 생성
 ![매출테이블](https://user-images.githubusercontent.com/71995287/128622355-ce342a8c-c8f5-4860-af16-f4c6db64edf7.PNG)
 * 문제점 :매출번호는 매출금액, 매출품목에 필요하다. 그리고 두 테이블의 매출번호는 같은 번호가 필요했고, 그래서 `시퀀스.NEXTVAL`를 사용할 수 없었다.
 * 해결책 : 주문번호를 먼저 생성한 후 jsp에서 히든 값으로 담은 뒤 form를 통해서 매출금액,매출품목의 주문번호로 넣어주었다.
    * Controller🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/689a8a5b87e0c6ef5eb1faba60d34281a55afe9f/BBPS/src/main/java/com/gdj35/bbps/web/controller/jhController.java#L809)
     * Query 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/689a8a5b87e0c6ef5eb1faba60d34281a55afe9f/BBPS/src/main/resources/mapper/JH_SQL.xml#L214)
     * 주문번호 생성 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/689a8a5b87e0c6ef5eb1faba60d34281a55afe9f/BBPS/src/main/webapp/WEB-INF/views/jh/Pos.jsp#L789)

 ### 5-2 포스메뉴 갯수 변경 시 적용
 * 문제점 : 갯수 변경 시 변경 전,후 값에 맞춰서 주문 개수와 결제금액이 변경이 안됐다.
 * 해결책 : focus를 통해 변경 전 값을 담아서 처리했고, 변경 후 값을 change를 통해서 해결했다.
   * 갯수 변경 적용 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/689a8a5b87e0c6ef5eb1faba60d34281a55afe9f/BBPS/src/main/webapp/WEB-INF/views/jh/Pos.jsp#L533)
 
**자세한 정리를 블로그에 있습니다.**
 <br/>
 *  [주문번호 생성](https://velog.io/@wogus216/%EC%A3%BC%EB%AC%B8%EB%B2%88%ED%98%B8-%EC%83%9D%EC%84%B1%EA%B3%BC-DB%EC%97%90-%EB%84%A3%EA%B8%B0)
 *  [갯수 변경 적용](https://velog.io/@wogus216/%ED%8F%AC%EC%8A%A4%EB%A9%94%EB%89%B4-%EA%B0%9C%EC%88%98-%EB%B3%80%EA%B2%BD)
</div>
</details>

