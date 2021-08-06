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
 
### 4-1 로그인 페이지
 
 ![로그인](https://user-images.githubusercontent.com/71995287/128507816-03641424-20de-41aa-b688-97abb2fc0893.PNG)
 
 * ID와 PW 입력 후  로그인 시 비동기로 확인합니다. 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/2e3f4c6608c94cf9924c29fccb64f6c86f473ed3/BBPS/src/main/java/com/gdj35/bbps/web/controller/jhController.java#L58)
 * ID 또는 PW가 틀릴 시에 로그인 실패하고 팝업창이 나옵니다. 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/2e3f4c6608c94cf9924c29fccb64f6c86f473ed3/BBPS/src/main/webapp/WEB-INF/views/jh/H_Login.jsp#L235)
 
 ### 4-2 상단 메뉴바
 * 권한에 따라 메뉴가 구성됩니다.
 ![메뉴바 1](https://user-images.githubusercontent.com/71995287/128507825-85ac1abe-164d-47fd-b24c-e0b82df04b43.PNG)
 ![메뉴바2](https://user-images.githubusercontent.com/71995287/128507839-6131d386-f361-4825-bd35-ba43ea932acb.PNG)
 
* 상위메뉴와 하위 메뉴가 존재해 계층형 쿼리를 사용했습니다. 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/2e3f4c6608c94cf9924c29fccb64f6c86f473ed3/BBPS/src/main/resources/mapper/JH_SQL.xml#L22)
* 조건문을 통해 권한에 맞게 그립니다. 🔎[코드확인](https://github.com/wogus216/BlueBottle/blob/2e3f4c6608c94cf9924c29fccb64f6c86f473ed3/BBPS/src/main/webapp/WEB-INF/views/jh/H_Menu.jsp#L210)
 
#### 더욱 자세한 정리는 블로그에 있습니다.
* [메뉴 블로그글](https://velog.io/@wogus216/%EB%B8%94%EB%A3%A8%EB%B3%B4%ED%8B%80-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-%EB%A9%94%EB%89%B4%EB%B0%94)


### 4-3 포스
 ![포스](https://user-images.githubusercontent.com/71995287/128507995-b7fa61ec-8ece-486b-b4e5-39eac57dfe83.PNG)
 ![포스2](https://user-images.githubusercontent.com/71995287/128514547-30eb37a0-3f45-4b4f-8af9-59dcd496db62.PNG)
 
 

 
</div>
</details>

