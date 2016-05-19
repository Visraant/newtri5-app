function initMap() {
  $.get('/api/v1/emts', {
  }).then(function(response) {
    console.log(response)
    var map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 41.8781, lng: -87.6298},
      zoom: 12
    });
    for(var i = 0; i < response.length; i++){
      if(response[i].coordinates){
        var infoWindow = new google.maps.InfoWindow({
          content: '<h1 id="firstHeading" class="firstHeading">' + 'Patient Name: ' + response[i].patient_name + '</h1>' 
          + "<br />" + 'Patient Symptoms: ' + response[i].patient_symptoms
          + "<br />" + 'Patient Condition: ' + response[i].patient_conditions
          + "<br />" + 'Patient Age: ' + response[i].patient_age
          + "<br />" + 'Patient Gender: ' + response[i].patient_gender
          + "<br />" + 'EMT Name: ' + response[i].emt_name
          + "<br />" + 'EMT Phone Number: ' + response[i].phone_number
        });
        var marker = new google.maps.Marker({
          position: {lat: response[i].coordinates[0], lng: response[i].coordinates[1]},
          map: map,
          title: 'Hello World!'
        });

        marker.addListener('click', function() {
          infoWindow.open(map, marker);
        });
        
      }
    }


  })
}

// var marker = new google.maps.Marker({
//   position: myLatLng,
//   map: map,
//   title: 'Hello World!'
// });

//   var infoWindow = new google.maps.InfoWindow({map: map});

//   // Try HTML5 geolocation.
//   if (navigator.geolocation) {
//     navigator.geolocation.getCurrentPosition(function(position) {
//       var pos = {
//         lat: position.coords.latitude,
//         lng: position.coords.longitude
//       };

//       infoWindow.setPosition(pos);
//       infoWindow.setContent('Location found.');
//       map.setCenter(pos);
//     }, function() {
//       handleLocationError(true, infoWindow, map.getCenter());
//     });
//   } else {
//     // Browser doesn't support Geolocation
//     handleLocationError(false, infoWindow, map.getCenter());
//   }
// }

//   function handleLocationError(browserHasGeolocation, infoWindow, pos) {
//     infoWindow.setPosition(pos);
//     infoWindow.setContent(browserHasGeolocation ?
//                           'Error: The Geolocation service failed.' :
//                           'Error: Your browser doesn\'t support geolocation.');
//   }
//   })

  