<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>서울시 공공와이파이 검색지도</title>
    <style>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
   <style>
          html {
      height: 100%;
   }
   
   body {
       width:100%;
       height:100%;
       margin: 0;
        padding-top: 0;
        padding-bottom: 40px;
        font-family: "Nanum Gothic", arial, helvetica, sans-serif;
        background-repeat: no-repeat;
        background:linear-gradient(to bottom right, #0098FF, #6BA8D1);
   }
   
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-top: 100px; /* Added */
        margin-bottom: 100px; /* Added */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
   }
   
   .form-signin .form-control {
        position: relative;
        height: auto;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
            box-sizing: border-box;
        padding: 10px;
        font-size: 16px;
   } 
   .map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
   
    </style>
</head>
   <body>
   <!-- Navigation Bar -->
   <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #3F729B ;">

     <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
       <a class="navbar-brand" href="#">서울시 공공와이파이</a>
       
     </div>
   </nav>

   <!-- form start -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

   <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
         <div class="card align-middle" style="width:20rem; border-radius:20px;">
            <div class="card-title" style="margin-top:30px;">
            <h2 class="card-title text-center" style="color:#113366;">서울시 공공와이파이</h2>
         </div>
         <div class="card-body">
         
            <form class="form-signin" method="POST" onSubmit="logincall();return false">
              <h5 class="form-signin-heading">장소를 입력하세요</h5>
              <label for="inputEmail" class="sr-only">장소명 입력</label>
              <input type="text" id="keyword" class="form-control" placeholder="장소명 입력" required autofocus><BR>
   
              <button type="submit" id="btn" class="btn btn-lg btn-primary btn-block" >검색</button>
            </form>
         </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>

      
    <script src="/js/jquery-3.5.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>      

   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=584122908c5e5b6321790a074641d512&libraries=services"></script>
<script>
// 마커를 담을 배열입니다

			
             $('#btn').click(function(){
                console.log("zzzzzzzzzzzzzzzzzz");
            var markers = [];
         
         var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
             mapOption = {
                 center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                 level: 3 // 지도의 확대 레벨
             };  
         
         // 지도를 생성합니다    
         var map = new kakao.maps.Map(mapContainer, mapOption); 
         
         // 장소 검색 객체를 생성합니다
         var ps = new kakao.maps.services.Places();  
         
         // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
         var infowindow = new kakao.maps.InfoWindow({zIndex:1});
         
         // 키워드로 장소를 검색합니다
      
             // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
         ps.keywordSearch($("#keyword").val(), placesSearchCB); 
         
      
         // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
         function placesSearchCB(data, status, pagination) {
            console.log("zzzzzzzzzzzzzzzzzz");
                       $.ajax({
                           url : 'seoulwifiTest.json', 
                           type : 'GET',
                           dataType : 'json',
                           error : function(){
                               alert('error');
                           },
                           success : function(obj){
                              const listArray = obj.DATA;
                              
                                  var keyword = $("#keyword").val()//document.getElementById('keyword').value;
                                  if(keyword){
                                     var list = new Array();
                                     var index =0;    
                                     for(var i=0; i<listArray.length; i++){
                                          const listObj = listArray[i];
                                          
                                         var placename =listObj.place_name;
                                         console.log(placename);
                                         
                                         if(placename.indexOf(keyword)!=-1){
                                            list[index++] = listObj; 
                                         }   
                                     }
                                  if(list[0]){
                                displayPlaces(list);
                                displayPagination(pagination);
                                  }else{
                                     alert('검색된 결과가 없습니다.!!');
                                     var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                                  mapOption = {
                                      center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                                      level: 3 // 지도의 확대 레벨
                                  };  
                              
                                 // 지도를 생성합니다    
                                 var map = new kakao.maps.Map(mapContainer, mapOption); 
                                 
                                 // 장소 검색 객체를 생성합니다
                                 var ps = new kakao.maps.services.Places();  
                                 
                                 // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
                                 var infowindow = new kakao.maps.InfoWindow({zIndex:1});
                                           return;
                                     };
                                 }else{
                                        alert('키워드를 입력해주세요!!');
                                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                                   mapOption = {
                                       center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                                       level: 3 // 지도의 확대 레벨
                                   };  
                               
                                  // 지도를 생성합니다    
                                  var map = new kakao.maps.Map(mapContainer, mapOption); 
                                  
                                  // 장소 검색 객체를 생성합니다
                                  var ps = new kakao.maps.services.Places();  
                                  
                                  // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
                                  var infowindow = new kakao.maps.InfoWindow({zIndex:1});
                                              return;
                                        };
                              }
                       });
                   }
             });

       
         
         // 검색 결과 목록과 마커를 표출하는 함수입니다
         function displayPlaces(places) {
         
             var listEl = document.getElementById('placesList'), 
             menuEl = document.getElementById('menu_wrap'),
             fragment = document.createDocumentFragment(), 
             bounds = new kakao.maps.LatLngBounds(), 
             listStr = '';
             
             // 검색 결과 목록에 추가된 항목들을 제거합니다
             removeAllChildNods(listEl);
         
             // 지도에 표시되고 있는 마커를 제거합니다
             removeMarker();
             
             for ( var i=0; i<places.length; i++ ) {
         
                 // 마커를 생성하고 지도에 표시합니다
                 var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                     marker = addMarker(placePosition, i), 
                     itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
         
                 // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                 // LatLngBounds 객체에 좌표를 추가합니다
                 bounds.extend(placePosition);
         
                 // 마커와 검색결과 항목에 mouseover 했을때
                 // 해당 장소에 인포윈도우에 장소명을 표시합니다
                 // mouseout 했을 때는 인포윈도우를 닫습니다
                 (function(marker, title) {
                     kakao.maps.event.addListener(marker, 'mouseover', function() {
                         displayInfowindow(marker, title);
                     });
         
                     kakao.maps.event.addListener(marker, 'mouseout', function() {
                         infowindow.close();
                     });
         
                     itemEl.onmouseover =  function () {
                         displayInfowindow(marker, title);
                     };
         
                     itemEl.onmouseout =  function () {
                         infowindow.close();
                     };
                 })(marker, places[i].place_name);
         
                 fragment.appendChild(itemEl);
             }
         
             // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
             listEl.appendChild(fragment);
             menuEl.scrollTop = 0;
         
             // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
             map.setBounds(bounds);
         }
         
         // 검색결과 항목을 Element로 반환하는 함수입니다
         function getListItem(index, places) {
         
             var el = document.createElement('li'),
             itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                         '<div class="info">' +
                         '   <h5>' + places.place_name + '</h5>';

             itemStr += '    <span>' + places.road_address_name + '</span>';
            
             el.innerHTML = itemStr;
             el.className = 'item';
         
             return el;
         }
         
         // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
         function addMarker(position, idx, title) {
             var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                 imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
                 imgOptions =  {
                     spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                     spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                     offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                 },
                 markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                     marker = new kakao.maps.Marker({
                     position: position, // 마커의 위치
                     image: markerImage 
                 });
         
             marker.setMap(map); // 지도 위에 마커를 표출합니다
             markers.push(marker);  // 배열에 생성된 마커를 추가합니다
         
             return marker;
         }
         
         // 지도 위에 표시되고 있는 마커를 모두 제거합니다
         function removeMarker() {
             for ( var i = 0; i < markers.length; i++ ) {
                 markers[i].setMap(null);
             }   
             markers = [];
         }
         
         // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
         function displayPagination(pagination) {
             var paginationEl = document.getElementById('pagination'),
                 fragment = document.createDocumentFragment(),
                 i; 
         
             // 기존에 추가된 페이지번호를 삭제합니다
             while (paginationEl.hasChildNodes()) {
                 paginationEl.removeChild (paginationEl.lastChild);
             }
         
             for (i=1; i<=pagination.last; i++) {
                 var el = document.createElement('a');
                 el.href = "#";
                 el.innerHTML = i;
         
                 if (i===pagination.current) {
                     el.className = 'on';
                 } else {
                     el.onclick = (function(i) {
                         return function() {
                             pagination.gotoPage(i);
                         }
                     })(i);
                 }
         
                 fragment.appendChild(el);
             }
             paginationEl.appendChild(fragment);
         }
         
         // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
         // 인포윈도우에 장소명을 표시합니다
         function displayInfowindow(marker, title) {
             var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
         
             infowindow.setContent(content);
             infowindow.open(map, marker);
         }
         
          // 검색결과 목록의 자식 Element를 제거하는 함수입니다
         function removeAllChildNods(el) {   
             while (el.hasChildNodes()) {
                 el.removeChild (el.lastChild);
             }
         }
</script>   
</body>
</html>
