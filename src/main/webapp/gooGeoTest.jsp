<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Geolocation</title>
</head>
<body>
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
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyACh8pWLz6hMAzNdtVVUXqnXvqmoHvx5zI&callack=initMap&v=weekly"
		async></script>


	<script>
	  let lat, lng;
	  var geocoder = new kakao.maps.services.Geocoder();

	  var coord = new kakao.maps.LatLng(lat, lng);
	  var callback = function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	        	document.getElementById('address').innerText = result[0].address.address_name;
	        }
	    };
	  
	function search(){
		 // Try HTML5 geolocation.
	    if (navigator.geolocation) {
      		navigator.geolocation.getCurrentPosition(
    		  (position) => {
    	          lat = position.coords.latitude;
    	          lng = position.coords.longitude;
	          document.getElementById('lat').innerText = lat;
	          document.getElementById('lng').innerText = lng;
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
		 
		 
	
		function searchDetailAddrFromCoords(coords, callback) {
		    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
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