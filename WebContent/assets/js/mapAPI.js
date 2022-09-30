const nullAlert = document.getElementById("null-alert");
const sleep = (delay) => new Promise((resolve) => setTimeout(resolve, delay));

function nullAlarm() {
  nullAlert.style.display = "block";
  sleep(3000).then(() => (nullAlert.style.display = "none"));
}

function kakaoMap(data) {
  // 마커를 담을 배열입니다
	
	console.log("enter kakaomap");
	
  var markers = [];

  var mapContainer = document.getElementById("map"), // 지도를 표시할 div
    mapOption = {
      center: new kakao.maps.LatLng(37.5012428, 127.0395859), // 지도의 중심좌표
      level: 4, // 지도의 확대 레벨
    };

  // 지도를 생성합니다
  var map = new kakao.maps.Map(mapContainer, mapOption);

  // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
  var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });
  // 검색 목록과 마커를 표출합니다

  // 공공데이터에서 불러올 data가 없으면 알림창을 띄웁니다
  if (data == undefined) {
    nullAlarm();
  } else displayPlaces(data); // data

  // 검색 결과 목록과 마커를 표출하는 함수입니다
  function displayPlaces(places) {
    // data

    var listEl = document.getElementById("placesList"),
      menuEl = document.getElementById("menu_wrap"),
      fragment = document.createDocumentFragment(),
      bounds = new kakao.maps.LatLngBounds();
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();

    // 공공데이터에서 불러올 data가 없으면 알림창을 띄웁니다
    if (places == undefined) {
      nullAlarm();
    } else {
    	console.log("in mapAPI , size()" + places.length);
      for (var i = 0; i < places.length; i++) {
        // 마커를 생성하고 지도에 표시합니다
    	  
    	console.log(places[i].content_type_id +", typeof " + typeof(places[i].content_type_id));
    	  
        var placePosition = new kakao.maps.LatLng(places[i].mapy, places[i].mapx),
          marker = addMarker(placePosition, places[i].content_type_id),
          itemEl = getListItem(places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        if (placePosition.La == 0 && placePosition.Ma == 0)
          continue;
        bounds.extend(placePosition);
        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function (marker, title) {
          kakao.maps.event.addListener(marker, "mouseover", function () {
            displayInfowindow(marker, title);
          });

          kakao.maps.event.addListener(marker, "mouseout", function () {
            infowindow.close();
          });

          itemEl.onmouseover = function () {
            displayInfowindow(marker, title);
          };

          itemEl.onmouseout = function () {
            infowindow.close();
          };
        })(marker, places[i].title);

        fragment.appendChild(itemEl);
      }

      // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
      listEl.appendChild(fragment);
      menuEl.scrollTop = 0;

      // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
      // map.setBounds(bounds);
      map.setBounds(bounds);
    }
  }

  // 검색결과 항목을 Element로 반환하는 함수입니다
  function getListItem(places) {
    var el = document.createElement("li");
      
    var itemStr = '<span class="markerbg"><img src="./assets/images/marker_';
    var content_type_id;
    if (places.content_type_id == "12") { // 관광지
    	content_type_id = "12";
    }
    else if (places.content_type_id == "14") { // 문화시설
    	content_type_id = "14";
    }
    else if (places.content_type_id == "15") { // 행사/공연/축제
    	content_type_id = "15";
    }
    else if (places.content_type_id == "25") { // 여행코스
    	content_type_id = "25";
    }
    else if (places.content_type_id == "28") { // 레포츠
    	content_type_id = "28";
    }
    else if (places.content_type_id == "32") { // 숙박
    	content_type_id = "32";
    }
    else if (places.content_type_id == "38") { // 쇼핑
    	content_type_id = "38";
    }
    else if (places.content_type_id == "39") { // 음식점
    	content_type_id = "39";
    }

itemStr += content_type_id +
        '.png" style="width:40px;height:40px"></img></span><div class="info"><h5>' +
        places.title +
        "</h5><span>" + places.addr1 + "</span>";

    if (places.tel) {
      itemStr += '  <span class="tel">' + places.tel + "</span></div>";
    }

    el.innerHTML = itemStr;
    el.className = "item";

    return el;
  }

  // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
  function addMarker(position, contentTypeId) {
    // https://www.flaticon.com/kr/authors/flat_circular/flat
    var imageSrc="./assets/images/marker_";
    if (contentTypeId == "12") { // 관광지
      imageSrc += "12.png";
    }
    else if (contentTypeId == "14") { // 문화시설
      imageSrc += "14.png";
    }
    else if (contentTypeId == "15") { // 행사/공연/축제
      imageSrc += "15.png";
    }
    else if (contentTypeId == "25") { // 여행코스
      imageSrc += "25.png";
    }
    else if (contentTypeId == "28") { // 레포츠
      imageSrc += "28.png";
    }
    else if (contentTypeId == "32") { // 숙박
      imageSrc += "32.png";
    }
    else if (contentTypeId == "38") { // 쇼핑
      imageSrc += "38.png";
    }
    else if (contentTypeId == "39") { // 음식점
      imageSrc += "39.png";
    }
      var marker = new kakao.maps.Marker({
        position: position, // 마커의 위치
        image: new kakao.maps.MarkerImage(
          imageSrc,
          new kakao.maps.Size(24, 24)
        ),
      });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker); // 배열에 생성된 마커를 추가합니다

    return marker;
  }

  // 지도 위에 표시되고 있는 마커를 모두 제거합니다
  function removeMarker() {
    for (var i = 0; i < markers.length; i++) {
      markers[i].setMap(null);
    }
    markers = [];
  }

  // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
  // 인포윈도우에 장소명을 표시합니다
  function displayInfowindow(marker, title) {
    var content = '<div style="width: fit-content;padding:5px;">' + title + "</div>"; //z-index:1;
    infowindow.setContent(content);
    infowindow.open(map, marker);
  }

  // 검색결과 목록의 자식 Element를 제거하는 함수입니다
  function removeAllChildNods(el) {
    while (el.hasChildNodes()) {
      el.removeChild(el.lastChild);
    }
  }
}
