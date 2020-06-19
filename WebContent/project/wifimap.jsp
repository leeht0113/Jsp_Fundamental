
  1
  2
  3
  4
  5
  6
  7
  8
  9
 10
 11
 12
 13
 14
 15
 16
 17
 18
 19
 20
 21
 22
 23
 24
 25
 26
 27
 28
 29
 30
 31
 32
 33
 34
 35
 36
 37
 38
 39
 40
 41
 42
 43
 44
 45
 46
 47
 48
 49
 50
 51
 52
 53
 54
 55
 56
 57
 58
 59
 60
 61
 62
 63
 64
 65
 66
 67
 68
 69
 70
 71
 72
 73
 74
 75
 76
 77
 78
 79
 80
 81
 82
 83
 84
 85
 86
 87
 88
 89
 90
 91
 92
 93
 94
 95
 96
 97
 98
 99
100
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131
132
133
134
135
136
137
138
139
140
141
142
143
144
145
146
147
148
149
150
151
152
153
154
155
156
157
158
159
160
161
162
163
164
165
166
167
168
169
170
171
172
173
174
175
176
177
178
179
180
181
182
183
184
185
186
187
188
189
190
191
192
193
194
195
196
197
198
199
200
201
202
203
204
205
206
207
208
209
210
211
212
213
214
215
216
217
218
219
220
221
222
223
224
225
226
227
228
229
230
231
232
233
234
235
236
237
238
239
240
241
242
243
244
245
246
247
248
249
250
251
252
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
   request.setCharacterEncoding("utf-8");
   String keyword = request.getParameter("keyword");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>와이파이 지도</title>
    <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:300px;height:margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
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
<div class="map_wrap">
    <div id="map" style="width:100%; height:200%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                    키워드 : <input type="text" id="keyword" size="15"> 
                    <button type="submit" id ="btn">검색하기</button> 
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
<script type="text/javascript" src="/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=584122908c5e5b6321790a074641d512&libraries=services"></script>
<script>
// 마커를 담을 배열입니다
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
          
        $('#btn').click(function(){
            loadData();
        });
        function executeAjax(){
           
        }
         function loadData(){   
            $.ajax({
                 url : 'seoulwifi.json', 
                 type : 'GET',
                 dataType : 'json',
                 error : function(){
                     alert('검색된 결과가 없습니다.!!');
                 },
                 success : function(obj){
                    const listArray = obj.DATA;   
                        var keyword = $("#keyword").val();
                        if(keyword){
                           var list = new Array();
                           var index =0;    
                           for(var i=0; i<listArray.length; i++){
                               const listObj = listArray[i];
                               var placename =listObj.place_name;
                               if(placename.indexOf(keyword)!=-1){
                                  list[index++] = listObj; 
                               }   
                           }
                        if(list[0]){
                         displayPlaces(list);
                         displayPagination(pagination);
                        }else{
                           alert('검색된 결과가 없습니다.!!');
                           
                           }
                       }else{
                              alert('키워드를 입력해주세요!!');
                           }
                    }
             });
         }
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
         // 지도위에 표시되고 있는 마커를 모두 제거합니다
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
        