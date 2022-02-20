<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Geolocation</title>

</head>
<body>
	<div id="map"></div>
	<div>
		lat:
		<div id="lat"></div>
	</div>
	<div>
		lng:
		<div id="lng"></div>
	</div>
	<button id="btn" onclick="search()">search!</button>
	<button id="btn2">search!</button>

	<div>
		address:
		<div id="address"></div>
	</div>

	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyACh8pWLz6hMAzNdtVVUXqnXvqmoHvx5zI&language=ko&v=weekly&channel=2"
		async></script>

	<script>
		

	
	 var lat, lng;

	 function initMap(){

		 const map = new google.maps.Map(document.getElementById('map'), {
		   center: {lat: -34.397, lng: 150.644},
		   zoom: 8
		 });
		 const geocoder = new google.maps.Geocoder();
		 const infowindow = new google.maps.InfoWindow();
		 
		 
	 }
	 
	 function search() {
	     // Try HTML5 geolocation.
	     if (navigator.geolocation) {
	         navigator
	             .geolocation
	             .getCurrentPosition((position) => {
	                 lat = position.coords.latitude;
	                 lng = position.coords.longitude;
	                 document
	                     .getElementById('lat')
	                     .innerText = lat;
	                 document
	                     .getElementById('lng')
	                     .innerText = lng;
	                 document.getElementById("btn2").addEventListener("click", () => {
	     			    geocodeLatLng(geocoder, map, infowindow);
	     		 });
	             }, () => {
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
	
	 function geocodeLatLng(geocoder, map, infowindow) {
	     const latlng = {
	         lat: lat,
	         lng: lng,
	     };
	
	     geocoder
	         .geocode({location: latlng})
	         .then((response) => {
	             if (response.results[0]) {
	                 document
	                     .getElementById('lat')
	                     .innerText = 
	                 response.results[0].formatted_address;
	             } else {
	                 window.alert("No results found");
	             }
	         })
	         .catch((e) => window.alert("Geocoder failed due to: " + e));
	 }
		
	</script>

</body>
</html>