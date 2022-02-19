<!DOCTYPE html>
<html>
<head>
<title>Geolocation</title>
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 70%;
}

/* Optional: Makes the sample page fill the window. */
html, body {
	height: 70%;
	margin: 0;
	padding: 0;
}

.custom-map-control-button {
	background-color: #fff;
	border: 0;
	border-radius: 2px;
	box-shadow: 0 1px 4px -1px rgba(0, 0, 0, 0.3);
	margin: 10px;
	padding: 0 0.5em;
	font: 400 18px Roboto, Arial, sans-serif;
	overflow: hidden;
	height: 40px;
	cursor: pointer;
}

.custom-map-control-button:hover {
	background: #ebebeb;
}
</style>
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

	<div>
		address:
		<div id="address"></div>
	</div>

	<!-- Async script executes immediately and must be after any DOM elements used in callback. -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyACh8pWLz6hMAzNdtVVUXqnXvqmoHvx5zI&callback=initMap&v=weekly"
		async></script>

	<script>
	// Note: This example requires that you consent to location sharing when
	// prompted by your browser. If you see the error "The Geolocation service
	// failed.", it means you probably did not give permission for the browser to
	// locate you.
	/* let map, infoWindow;

	function initMap() {
	  map = new google.maps.Map(document.getElementById("map"), {
	    center: { lat: -34.397, lng: 150.644 },
	    zoom: 6,
	  });
	  infoWindow = new google.maps.InfoWindow(); */

	  const locationButton = document.getElementById("btn");
	function search(){
		 // Try HTML5 geolocation.
	    if (navigator.geolocation) {
      		navigator.geolocation.getCurrentPosition(
    		  (position) => {
    	          const pos = {
    	            lat: position.coords.latitude,
    	            lng: position.coords.longitude,
    	          };
	          document.getElementById('lat').innerText = position.coords.latitude;
	          document.getElementById('lng').innerText = position.coords.longitude;
	        },
	        () => {
	          handleLocationError(true, infoWindow, map.getCenter());
	        }
	      );
	    } else {
	      // Browser doesn't support Geolocation
	      handleLocationError(false, infoWindow, map.getCenter());
	    }
	}
	// 
	function handleLocationError(browserHasGeolocation, infoWindow, pos) {
	  infoWindow.setPosition(pos);
	  infoWindow.setContent(
	    browserHasGeolocation
	      ? "Error: The Geolocation service failed."
	      : "Error: Your browser doesn't support geolocation."
	  );
	  infoWindow.open(map);
	}
	
	
	
	
	
	
	</script>
</body>
</html>