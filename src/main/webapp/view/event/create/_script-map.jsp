<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1T8WNE6ZMkuTFTfXBrAdV7PC4RcoIJ48&signed_in=true&callback=map_init"></script>
<script>

var map;
	

function map_init() 
{
	var myLatLng = {lat: 48.8534100, lng: 2.3488000};
	map = new google.maps.Map(document.getElementById('map'), {
	  zoom: 11,
	  center: myLatLng
	});
}
	

function map_addMarker(title, lat, lng)
{
	var marker = new google.maps.Marker({
	  position: {lat: lat, lng: lng},
	  map: map,
	  title: title
	});
}
	
</script>