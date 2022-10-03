# S&J EnjoyTrip
써니앤쥬의 국내 여행지 정보 사이트

#### 프로젝트 소개
> 메인 페이지에 구현된 지도와 로그인, 회원가입, 커뮤니티 기능을 통해 여행 후기, 여행 메이트를 찾아 볼 수 있는 웹사이트 프로젝트입니다.


----------------------------------------------------------------------------


#### 구현 기능

### 1. 메인 페이지 - index.jsp

> 지역별 관광지 정보 조회 - [시도, 구군, 컨텐츠별 관광지 정보](https://www.data.go.kr/data/15101578/openapi.do)
<br/>
![main-index](/uploads/bbb0324f344ebbc314b46d5bd3ab4999/main-index.JPG)
<br/><br/>


> 시, 구, 컨텐츠타입 선택 후 search버튼 클릭 시 - 하단 맵으로 자동 스크롤 이동
<br/>
![kakaomap](/uploads/d77431353e4a902e7e3d6c2973abae76/kakaomap.JPG)
<br/><br/>

    > 선택한 컨텐츠 별로 다르게 표시되는 마커들  
<br/><br/><br/>
![map-shopping](/uploads/e7ed7869f4f96d6320cbc47ebb7ab959/map-shopping.png)
![map-festival](/uploads/5fe1ffadd04fd558e8a3a8b9a0d2df97/map-festival.png)
![map-food](/uploads/ae4123ead18a0ba98b537185fac020c0/map-food.png)
<br/><br/><br/>


> 여행 테마 소개 - [추천하는 여행 코스](https://www.data.go.kr/data/15101578/openapi.do)를 보여주는 기능
<br/>
![trip-theme](/uploads/68b9b27c81542eed42faf98ae294d31f/trip-theme.JPG)
<br/><br/>

> 여행 메이트 찾기 - 아직 마감되지 않은 여행 메이트 모집글 4개 출력
<br/>
![trip-mate](/uploads/056794ee71067527170b21eec23d73f3/trip-mate.JPG)
<br/><br/>

    > '자세히보기' 클릭 시 community-tripMate.jsp 내의 해당 게시글로 이동
<br/><br/>

> 여행 후기 - 별점 기준 상위 4개의 후기 출력
<br/>
![trip-review](/uploads/15033dfbb993f480f9868e4f7469281a/trip-review.JPG)
<br/><br/>

    > 후기 클릭 시 community-tripReview.jsp 내의 해당 게시글로 이동
<br/><br/>



> 한옥 소개 - 한국에서만 경험할 수 있는 한옥 체험 소개
<br/>
![hanok-info](/uploads/255f4db857413dfee32cdcc49e1e60cc/hanok-info.JPG)
<br/><br/>

    > 더 많은 한옥 보기 : 추후 전국 한옥 체험 가능한 숙박 정보 업데이트
<br/><br/><br/>



-----------------------------------------------------------

### 2. 로그인 / 회원가입 기능 - login.jsp / joinin.jsp
> 메인 페이지의 상단 바를 통해 이용 가능한 로그인 / 회원가입 기능
<br/>


![로그인](/assets/readme/login.jpg)
<br/><br/>

![가입](/assets/readme/joinin.jpg)  
<br/><br/>


-----------------------------------------------------------

### 3. 마이페이지 - mypage.jsp
> 가입 정보를 수정할 수 있는 마이페이지  
<br/>


![마이페이지](/assets/readme/mypage.jpg)  
<br/><br/>

![마이페이지](/assets/readme/mypage2.jpg)  
<br/><br/>

-----------------------------------------------------------

### 4. 커뮤니티 - community.jsp
> 여행 메이트 / 여행 후기 보기를 할 수 있는 페이지
<br/>
![메인](/assets/readme/community-main.JPG)  
<br/><br/>


<br/>
![여행리뷰](/assets/readme/community-review.jpg)  
<br/><br/>

<br/>
![여행메이트](/assets/readme/community-mate.jpg)  
<br/><br/>


> 게시글 작성 - 위치, 글 제목, 작성자명, 날짜, 카테고리 선택
<br/>
![작성](/assets/readme/board-regist.jpg)  
<br/><br/>
<br/>
![작성](/assets/readme/board-regist2.jpg)  
<br/><br/>


    > 시작 날짜 선택 시 종료 날짜는 시작 날짜 이후로 선택 가능
    > 글 카테고리 선택 가능(여행 후기, 여행 메이트, 여행 메이트 후기)
    > 별점 선택
<br/><br/><br/>


-----------------------------------------------------------

### 5. 여행 후기 - community-tripReview.jsp
> 작성된 여행 후기 및 여행 메이트 후기 게시글을 볼 수 있는 페이지
<br/>
![후기](/assets/readme/tripReview-list.jpg)

-----------------------------------------------------------

### 6. 여행 메이트 - community-tripMate.jsp
> 작성된 여행 메이트 게시글(모집글)을 볼 수 있는 페이지
<br/>
![메이트](/assets/readme/tripMate-list.jpg)


 
