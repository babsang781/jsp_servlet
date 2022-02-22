<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Geolocation</title>
<style>
#map {
	height: 300px;
	width: 300px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyACh8pWLz6hMAzNdtVVUXqnXvqmoHvx5zI&language=ko&v=weekly&channel=2&callback=initMap"
		async></script>


	<div id="map"></div>
	<div class="latlng">
		lat:
		<div id="lat"></div>
		lng:
		<div id="lng"></div>
	</div>

	<div>
		address:
		<div id="address"></div>
	</div>
	<input id="latlng" type="text"></input>
	<div id="latlng2" type="text"></div>
	<button id="submit" type="button">Reverse Geocode</button>

	<script>
// https://developers.google.com/maps/documentation/javascript/maptypes?hl=en
// map API 를 사용하기 위한 maptype 오브젝트, 지도 타일을 웹에 문제 없이 보여주기 위한 것.
// 각각의 맵 타입은 시각적 표시를 위해 몇몇의 함수와 프로퍼티 타일을 포함해야 함.
// styled Maps or custom map tyes로 modify 해서 사용 가능
		let infoWindow, pos, sampleLat, sampleLng;	
		let geocoder;
		let map;
		let sampleLatLng;
		
		
	   	  document.getElementById("submit").addEventListener("click", () => {
	   		  console.log("클릭이 되니?");
	  	    geocodeLatLng(geocoder, map, infoWindow);
	  	  });
	   	  
	function initMap(){
		// 맵 div에 맵 타입 변수를 만들고, "," 뒤에 Map option으로 내용을 넣음.
		// google.maps.Map(document.getElementById('map'), [Map option]);
		// Map option의 형태는 다양하게 나타날 수 있고,다양한 속성을 넣을 수도 안 넣을 수도 있음.  
		
		map = new google.maps.Map(document.getElementById('map'), {
			zoom: 8,
			center: {lat: 35.1, lng: 126.8},
		 });
		
		// 위 내용을 보면 center: 값의 위치만 들어가 있지만 
		// 아래 주석의 형태처럼 Map option을 따로 만들어서 속정을 정의하고 변수 채로 넣을 수도 있음.
		
		/* var myLatlng = new google.maps.LatLng(-34.397, 150.644);
		var mapOptions = {
			zoom: 8,
    		center: myLatlng,
   			mapTypeId: 'satellite'
			};
		var map = new google.maps.Map(document.getElementById('map'),
    		mapOptions); */
		
		
		// 2. 지오코딩 
		/* https://developers.google.com/maps/documentation/javascript/geocoding?hl=en
		-지오코딩이란 text 주소를 지도에서 사용 가능한 'geographic coordinates'(지도그림 좌표: latitude , longitude) 로 변환하는 것을 말함
		역지오코딩은 좌표를 인간이 읽을 수 있는 주소로 바꾸는 것, place ID 를 통해 주소를 찾을 수 있음.
		Geocoder class 는 지오코딩, 역지오코딩 둘 다 가능 (Dynamic!) 
		
		-지오코딩 요청 requests
		지오코딩에 접속은 비동기적/ 구글api는 외부 서버이기 때문에 당신은 요청을 완성하기 위해 callback 함수를 사용해야 함.
		이 callback method 는 결과를 처리하고 geocoder 가 결과를 반환해줌.
		*/
		 geocoder = new google.maps.Geocoder();
		 infoWindow = new google.maps.InfoWindow();
		 console.log(infoWindow);

		/* 
		google.maps.Geocoder() 라는 생성자 객체를 통해 구글 지도api에 접속함. 
		Geocoder.geocode() 메소드는 지오코딩 서비스 요청을 시작하고 
		응답(response)시, 실행할 입력 용어(terms) 및 callback 함수를 담은 GeocoderRequest 객체 값(literal)을 전달한다.
		
		{  // 아래는 GeocoderRequest 가 담을 수 있는 필드(field: 클래스에서 선언한 변수) 이다. 
			 address: string,
			 location: LatLng,
			 placeId: string,
			 bounds: LatLngBounds,
			 componentRestrictions: GeocoderComponentRestrictions,
			 region: string
			}
		*** 단 위 중에서 address/location/placeId는 셋 중 하나만 써야 함
		1. address: 지오코딩 할 주소 -> 좌표
		2. location: 역지오코딩할 좌표(LatLng or LatLngLiteral )
		3. placeId: 검색하고 싶은 곳의 가장 가까운 위치주소 -> 어디 근처 검색인 듯함. 00동 맛집 같은
		
		*/
	
		
	 }
	
	
	 function search() {
	     // Try HTML5 geolocation.
	     if (navigator.geolocation) {
	         navigator.geolocation.getCurrentPosition(
	        	(position) => {
	        		pos = {
        				lat: position.coords.latitude,
	        			lng: position.coords.longitude,
	        		};
	        		
	                 document
	                     .getElementById('lat')
	                     .innerText = parseFloat(position.coords.latitude);
	                 document
	                     .getElementById('lng')
	                     .innerText = parseFloat(position.coords.longitude);
	                 document
	                 
	                 sampleLat = position.coords.latitude;
	                 sampleLng = position.coords.longitude;
	                 
	                 Coords(position.coords.latitude, position.coords.longitude);
	                 
	             }, 
	             () => {
	                 handleLocationError(true, infoWindow, map.getCenter());
	             });
	     } else {
	         // Browser doesn't support Geolocation
	         handleLocationError(false, infoWindow, map.getCenter());
	     }
	 }
	 // 에러 발생시 작동하는 함수
	 function handleLocationError(browserHasGeolocation, infoWindow, pos) {
	     infoWindow.setPosition(pos);
	     infoWindow.setContent(
	         browserHasGeolocation
	             ? "Error: The Geolocation service failed."
	             : "Error: Your browser doesn't support geolocation."
	     );
	     infoWindow.open(map);
	 }

	 // search() 에서 좌표 값을 가져오는 callback 함수를 통해 데이터 변경
	 function Coords(latMem, lngMem){
		 
		 let coordslatlng = latMem + "," + lngMem;
		 /* sampleLatLng = new google.map.LatLng(coordslatlng); 이거 애러남 */
		 console.log(coordslatlng);
		 console.log(sampleLatLng);
		 document.getElementById('latlng').innerText =coordslatlng;
		 document.getElementById('latlng2').innerText =coordslatlng;
		 // console.log($('#latlng').val()); 이건 안 나옴.
		 console.log($('#latlng').text());
		 
	 }
	 
	 function geocodeLatLng(geocoder, map, infoWindow) {
		 /* const input = document.getElementById('latlng2').text();  
			이것도 에러남 document.getElementById(...).text is not a function at geocodeLatLng*/
		 const input = document.getElementById('latlng2').text();  // 현재 방법 에러 
   	 	 const latlngStr = input.split(",", 2);
		 const latlng = {
	   	    lat: parseFloat(latlngStr[0]),
	   	    lng: parseFloat(latlngStr[1]),
	   	  };

	   	  geocoder
	   	    .geocode({ location: latlng })
	   	    .then((response) => {
	   	    	infoWindow(response.results[0].formatted_address);
	   	    	alert(response.results[0].formatted_address);
	   	    })
	   	    .catch((e) => window.alert("Geocoder failed due to: " + e));
	   	}
	 
  	  function info(formatted_address){
		  alert(formatted_address);
	  };	
	 
	 search();
	 
	 

	</script>


</body>
</html>