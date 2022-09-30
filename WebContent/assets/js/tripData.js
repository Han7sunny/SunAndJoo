
fetch(
  "https://apis.data.go.kr/B551011/KorService/areaCode?numOfRows=20&MobileOS=ETC&MobileApp=enjoyTrip&serviceKey=bQM2J69bOM2ZkqPg%2B3%2BjBuSwZ1G0QRRvS%2F8ZIdINx6N4ulhlyHBCpUKbzWpSQe4ZOUbur4gl34jO8VNZBXK9pg%3D%3D&_type=json"
)
  .then((response) => response.json())
  .then((data) => makeAreaList(data));

fetch(
  "https://apis.data.go.kr/B551011/KorService/areaCode?numOfRows=50&MobileOS=ETC&MobileApp=enjoyTrip&serviceKey=bQM2J69bOM2ZkqPg%2B3%2BjBuSwZ1G0QRRvS%2F8ZIdINx6N4ulhlyHBCpUKbzWpSQe4ZOUbur4gl34jO8VNZBXK9pg%3D%3D&areaCode=1&_type=json"
)
  .then((response) => response.json())
  .then((data) => makeSigunguList(data));

  // Default : 서울 강남구 컨텐츠 선택(전체)
  fetch("https://apis.data.go.kr/B551011/KorService/areaBasedList?numOfRows=100&MobileOS=ETC&MobileApp=enjoyTrip&serviceKey=bQM2J69bOM2ZkqPg%2B3%2BjBuSwZ1G0QRRvS%2F8ZIdINx6N4ulhlyHBCpUKbzWpSQe4ZOUbur4gl34jO8VNZBXK9pg%3D%3D&_type=json&areaCode=1&sigunguCode=1")
  .then((response) => response.json())
  .then(function (data) {
    kakaoMap(data.response.body.items.item);
  });


// 한옥
// fetch("https://apis.data.go.kr/B551011/KorService/searchStay?numOfRows=100&MobileOS=ETC&MobileApp=enjoyTrip&serviceKey=bQM2J69bOM2ZkqPg%2B3%2BjBuSwZ1G0QRRvS%2F8ZIdINx6N4ulhlyHBCpUKbzWpSQe4ZOUbur4gl34jO8VNZBXK9pg%3D%3D&_type=json&arrange=B&hanOk=1")
// .then((response) => response.json())
//   .then((data) => hanOkList(data));

// 메인화면 - 지역 선택 기능
function makeAreaList(data) {
  let areaList = document.querySelector(".area"); // select append
  let select = document.createElement("select");
  select.setAttribute("class", "form-select border-0 py-3 text-center");

  data.response.body.items.item.forEach((area) => {
    // options
    let option = document.createElement("option");
    option.setAttribute("value", area.rnum);
    if (area.rnum == 1) {
      option.setAttribute("selected", true);
    }

    option.appendChild(document.createTextNode(area.name)); // 서울
    select.appendChild(option);
  });

  select.addEventListener("change", function () {
    initSigunguList(); // 기존 시군구 select 삭제
    let selectedAreaNum = select[select.selectedIndex].value;
    let url =
      `https://apis.data.go.kr/B551011/KorService/areaCode?numOfRows=50&MobileOS=ETC&MobileApp=enjoyTrip&serviceKey=bQM2J69bOM2ZkqPg%2B3%2BjBuSwZ1G0QRRvS%2F8ZIdINx6N4ulhlyHBCpUKbzWpSQe4ZOUbur4gl34jO8VNZBXK9pg%3D%3D&areaCode=` +
      selectedAreaNum +
      `&_type=json`;
    fetch(url)
      .then((response) => response.json())
      .then((data) => makeSigunguList(data)); // 시군구
  });

  areaList.appendChild(select); // options 다 들어간 select 넣기
}

// 메인화면 - 시/군/구 선택 기능
function makeSigunguList(data) {
  let sigunguList = document.querySelector(".sigungu");
  let select = document.createElement("select");
  select.setAttribute("class", "form-select border-0 py-3 text-center");
  data.response.body.items.item.forEach((sigungu) => {
    let option = document.createElement("option");
    option.setAttribute("value", sigungu.rnum);
    option.appendChild(document.createTextNode(sigungu.name));
    select.appendChild(option);
  });
  sigunguList.appendChild(select);
}

function initSigunguList() {
  let sigunguOptions = document.querySelector(".sigungu>select");
  document.querySelector(".sigungu").removeChild(sigunguOptions);
}

document.querySelector(".search").addEventListener("click", function () {
  let contentType = document.querySelector(".contentType>select");
  let contentTypeId = contentType.options[contentType.selectedIndex].value;
  console.log("콘텐츠 번호 : " + contentTypeId + ", " + typeof contentTypeId);
  let area = document.querySelector(".area>select");
  let areaNum = area.options[area.selectedIndex].value;
  let sigungu = document.querySelector(".sigungu>select");
  let sigunguNum = sigungu.options[sigungu.selectedIndex].value;

  let url = `https://apis.data.go.kr/B551011/KorService/areaBasedList?numOfRows=1000&MobileOS=ETC&MobileApp=enjoyTrip&serviceKey=bQM2J69bOM2ZkqPg%2B3%2BjBuSwZ1G0QRRvS%2F8ZIdINx6N4ulhlyHBCpUKbzWpSQe4ZOUbur4gl34jO8VNZBXK9pg%3D%3D&_type=json`;
  if (contentTypeId == "0") {
    // 전체 조회
    url += `&areaCode=` + areaNum + `&sigunguCode=` + sigunguNum;
  } else {
    url +=
      `&contentTypeId=` + contentTypeId + `&areaCode=` + areaNum + `&sigunguCode=` + sigunguNum;
  }
  fetch(url)
    .then((response) => response.json())
    .then(function (data) {
      console.log(data.response.body.items.item);
      kakaoMap(data.response.body.items.item);
    });

  var scrollTo = document.querySelector("#map-div"); // 지도를 표시할 div
  window.scrollBy({ top: scrollTo.getBoundingClientRect().top, behavior: "smooth" });
});

// 한옥 소개 기능
// function hanOkList(data) {
//   // let mainImg = document.querySelector(".img-about");
//   // // <!-- <img src="assets/images/hero_bg_3.jpg" alt="Image" class="img-fluid" /> -->
//   // let img = document.createElement("img");
//   // img.setAttribute("src",data.response.body.items.item[0].firstimage);
//   // img.setAttribute("class", "img-fluid");
//   // mainImg.appendChild(img);
// }

// numOfRows=16 : 조회수 상위 16개 목록
let ThemeUrl = `https://apis.data.go.kr/B551011/KorService/areaBasedList?serviceKey=8j8%2BHTEceNBIBvoybL5cuXGqceXrENUQzYPCagOY8%2FN3lXIAQl0Bbuah5DSjlBVq6iVOwEoj1Iaj5ZQV3ZQgSg%3D%3D&numOfRows=16&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=P&contentTypeId=25`;
fetch(ThemeUrl)
  .then((response) => response.json())
  .then(function (data) {

    let propertyItemDiv = document.querySelectorAll(".property-item");
    let idx = 0;
    data.response.body.items.item.forEach((theme) => {

      let a = document.createElement("a");
      a.setAttribute("class", "img");
      a.setAttribute("href", "theme-single.html");
      
      let image = document.createElement("img");
      image.setAttribute("src", theme.firstimage);
      image.setAttribute("class", "img-fluid");

      a.appendChild(image);
      propertyItemDiv[idx].appendChild(a);

      let propertyContent = document.createElement("div");
      propertyContent.setAttribute("class", "property-content");

      let divEmpty = document.createElement("div");
      let span = document.createElement("span");
      span.setAttribute("class", "city d-block mb-3");
      span.appendChild(document.createTextNode(theme.title));

      let div = document.createElement("div");
      div.setAttribute("class", "specs d-flex mb-4");

      let span1 = document.createElement("span");
      span1.setAttribute("class", "d-block d-flex align-items-center me-3");
      let span2 = document.createElement("span");
      span2.setAttribute("class", "icon-read me-2");
      let i = document.createElement("i");
      i.setAttribute("class", "bi bi-book");
      span2.appendChild(i);
      let span3 = document.createElement("span");
      span3.setAttribute("class", "caption");
      span3.appendChild(document.createTextNode(theme.readcount))

      span1.appendChild(span2);
      span1.appendChild(span3);

      div.appendChild(span1);

      let a1 = document.createElement("a");
      a1.setAttribute("href", "theme-single.html");
      a1.setAttribute("class", "btn btn-4 py-2 px-3");
      a1.appendChild(document.createTextNode("See detail"));

      divEmpty.appendChild(span);
      divEmpty.appendChild(div);
      divEmpty.appendChild(a1);

      propertyContent.appendChild(divEmpty);

      propertyItemDiv[idx++].appendChild(propertyContent);

    });
  });
