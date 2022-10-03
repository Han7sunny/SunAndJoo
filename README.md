# S&J EnjoyTrip
써니앤쥬의 국내 여행지 정보 사이트

#### 프로젝트 소개
> 메인 페이지에 구현된 지도와 로그인, 회원가입, 커뮤니티 기능을 통해 여행 후기, 여행 메이트를 찾아 보고
> 
> 여행 테마와 한옥 숙박 정보도 얻을 수 있는 여행 정보 사이트 웹 프로젝트입니다.


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


> 여행 테마 소개 - [추천 여행 코스](https://www.data.go.kr/data/15101578/openapi.do)를 보여주는 기능
<br/>
![trip-theme](/uploads/68b9b27c81542eed42faf98ae294d31f/trip-theme.JPG)
<br/><br/>


    > '더 많은 여행테마 보기' 클릭 시 theme-total.jsp 로 이동
<br/><br/>


> 여행 메이트 찾기 - 아직 마감되지 않은 여행 메이트 모집글 4개 출력
<br/>
![trip-mate](/uploads/056794ee71067527170b21eec23d73f3/trip-mate.JPG)
<br/><br/>

    > '자세히보기' 클릭 시 community-tripMate.jsp 내의 해당 게시글로 이동
<br/><br/>

> 여행 후기 - 슬라이드 모션으로 여행 후기글 출력
<br/>
![trip-review](/uploads/15033dfbb993f480f9868e4f7469281a/trip-review.JPG)
<br/><br/>

    > 후기 클릭 시 community-tripReview.jsp 내의 해당 게시글로 이동
<br/><br/>



> 한옥 소개 - 한국에서만 경험할 수 있는 한옥 체험 소개
<br/>
![hanok-info](/uploads/255f4db857413dfee32cdcc49e1e60cc/hanok-info.JPG)
<br/><br/>

    > '더 많은 한옥 보기' 클릭 시 : 한옥 체험 가능한 숙박 정보 리스트 화면 hanok_list.jsp 로 이동
<br/><br/><br/>



-----------------------------------------------------------

### 2. 로그인 / 회원가입 기능 - login.jsp / joinin.jsp
> 메인 페이지의 상단 바를 통해 이용 가능한 로그인 / 회원가입 기능
<br/>

![login](/uploads/23c8f3fd0fb79f1d79fcbeebbc66372e/login.JPG)
<br/><br/>

![joinin](/uploads/ca2a9dca7492cbdb799f0a13149de93c/joinin.JPG)
<br/><br/>


-----------------------------------------------------------

### 3. 아이디 찾기 / 비밀번호 찾기 - find-id.jsp / find-pwd.jsp
> 로그인 페이지에서 이용 가능한 아이디 찾기 기능
<br/>

![find-id](/uploads/56ef5b936f6caeafb7e760a4a4351e29/find-id.JPG)
<br/><br/>

>  이메일 인증번호 전송으로 구현한 비밀번호 찾기 기능
<br/>

![find-pwd](/uploads/ec7b84d15a5ff0b9e0839ec85c851b7e/find-pwd.GIF)
<br/><br/>

![find-pwd-result](/uploads/8470fff7436e24af77628b8926d83012/find-pwd-result.GIF)


>  사용자가 이메일로 받아볼 수 있는 비밀번호 찾기 결과
<br/>
![find_pwd_email](/uploads/6d0c50bd7a7b67eef828a6ef18685d07/find_pwd_email.GIF)

<br/><br/><br/>





-----------------------------------------------------------



### 4. 마이페이지 - mypage.jsp
> 가입 정보를 수정할 수 있는 마이페이지  
<br/>

> 사용자가 작성한 글, 댓글을 모두 조회할 수 있는 기능 
<br/>


![mypage](/uploads/bfc8d828bb8716c0b851748b5dc7c139/mypage.JPG)
<br/><br/>

> 관리자가 로그인한 경우, 작성한 공지사항들을 모두 조회할 수 있다.
<br/>
![mypage2](/uploads/ada3c9488079a55f0fc02b92ab8290d6/mypage2.JPG)
<br/><br/>



    > '탈퇴하기' 클릭 시 : 재확인 후 탈퇴 진행
![join-delete-check](/uploads/084adc233f80fde2f0e8a80efd456d4d/join-delete-check.JPG)
<br/><br/><br/>



    > '정보 수정하기' 클릭 시 : 정보 수정 완료 창
![mypage-modify](/uploads/6a8531a35847efd9421ad42de0d8d3b1/mypage-modify.JPG)
<br/><br/><br/>

-----------------------------------------------------------

### 5. 여행 테마 - theme-total.jsp
> 여행 테마 전체를 조회할 수 있는 페이지
<br/>
![theme-list](/uploads/241269dc801c4037154de0f9bfcd4b8d/theme-list.JPG)
<br/><br/>


    > 각 게시글 클릭 시 : 상세 페이지 theme-single.jsp 로 이동
![theme-view](/uploads/69dfefea93aae3d7d9d5c3f80bd0d151/theme-view.JPG)
<br/><br/><br/>




------------------------------------------------------------

### 6. 한옥 숙소 소개 - hanok_list.jsp
> index.jsp에서 '더 많은 한옥 보기' 클릭 시 이동할 수 있는 한옥 숙소 소개 페이지
<br/>
![hanok-list](/uploads/b2fcfda35cf2955b5a0b60c3010e6d80/hanok-list.JPG)
<br/><br/>


    > 각 숙소 클릭 시 : 상세 페이지 hanok_single.jsp 로 이동
![hanok-detail](/uploads/2f50874b52e5a17bf4bbec1a204c59b0/hanok-detail.JPG)
<br/><br/><br/>


------------------------------------------------------------



### 7. 커뮤니티 - community.jsp
> 여행 메이트 / 여행 후기 글을 조회할 수 있는 페이지

<br/>
![community-review](/uploads/e508258dde2aca54173389cba093ac24/community-review.JPG)
<br/><br/>

<br/>
![community-mate](/uploads/8e5003c9677f94dedabab44a51e921be/community-mate.JPG)
<br/><br/>


    > 각 게시글 클릭 시 : 게시글 상세 페이지 board_detail_view.jsp 로 이동
<br/>


> 게시글 작성 - 위치, 글 제목, 작성자명, 날짜, 카테고리 선택
<br/>
![board-regist](/uploads/067ab65554e0f718270470e5bf40b9c6/board-regist.JPG)
<br/><br/>
<br/>
![board-regist2](/uploads/e1a818b4f4ac6cd082a5ea74b309ad04/board-regist2.jpg)
<br/><br/>


    > 글 작성 내용에 맞는 도시, 군구 선택 가능
    > 시작 날짜 선택 시 종료 날짜는 시작 날짜 이후로 선택 가능
    > 글 카테고리 선택 가능 (여행 후기, 여행 메이트, 여행 메이트 후기)
    > 별점 선택
<br/><br/><br/>


-----------------------------------------------------------

### 8. 여행 후기 - community-tripReview.jsp
> 작성된 여행 후기 및 여행 메이트 후기 게시글을 볼 수 있는 페이지
<br/>
![tripReview-list](/uploads/a80bef94a2c4edbb340f8b8a08c869a4/tripReview-list.JPG)
<br/><br/>


    > 각 게시글 클릭 시 : 상세 페이지 board_detail_view.jsp 로 이동
    >                   : 클릭할 때마다 해당 게시글 조회수 증가
![tripReview-view](/uploads/506db8c304f2b288e391c60f05dccdaf/tripReview-view.JPG)
<br/><br/><br/>

-----------------------------------------------------------

### 9. 여행 메이트 - community-tripMate.jsp
> 작성된 여행 메이트 모집글 전체를 볼 수 있는 페이지
<br/>
![tripMate-list](/uploads/5bc01dc793f4745a1ad52216a1e2c424/tripMate-list.JPG)
<br/><br/>


    > 각 게시글 클릭 시 : 상세 페이지 board_detail_view.jsp 로 이동
    >                   : 클릭할 때마다 해당 게시글 조회수 증가
![tripMate-view](/uploads/1cbfd976dc8103b67c1237f8b651cf6e/tripMate-view.JPG)
<br/><br/><br/>

-----------------------------------------------------------


### 10. 게시글 수정 기능
> 글 작성자와 세션에 저장된 로그인 아이디가 같을 때에만 수정, 삭제 버튼 활성화
<br/>
![board-modify](/uploads/2748e8eba59c90e1846d7b5ee04a6dcb/board-modify.jpg)
<br/><br/>


    > 수정하기 클릭 시 : 수정 페이지 board_modify.jsp 로 이동
    > 수정 후 등록하기 버튼 클릭 시 : 마이 페이지 mypage.jsp 로 이동
![board-modify-complete](/uploads/507c1655dc969ae625c62d29ed3de36a/board-modify-complete.JPG)
<br/><br/><br/>


    > 삭제하기 클릭 시 : 재확인 후 삭제 진행
![board-delete-check](/uploads/38936a0d185f5cf460a96bbc8a4ededc/board-delete-check.JPG)
<br/><br/>

<br/>



-----------------------------------------------------------


### 11. 댓글 기능
> 모든 게시글 하단에 구현되어 있는 댓글 작성 폼
> 댓글 작성자와 세션에 저장된 로그인 아이디가 같을 때에만 수정, 삭제버튼 활성화
<br/>
![reply-regist](/uploads/9a106ce414cd969b217059eebeca7c17/reply-regist.JPG)
<br/><br/>


> 수정 버튼 클릭 시 : input textarea 형식으로 전환
<br/>
![reply-modify](/uploads/8ebcbc3925487fd18a40e97120c5896c/reply-modify.JPG)
<br/><br/><br/>
 
 

> 삭제 버튼 클릭 시 : alert창으로 재확인 후 삭제 진행
<br/>
![reply-delete](/uploads/a2a2e7a23a7ffea0b08d9d71d9b80f8e/reply-delete.JPG)
<br/><br/><br/>
 
 
