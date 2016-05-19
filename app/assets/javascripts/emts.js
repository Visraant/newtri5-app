/* global angular, google */
(function() {
  angular.module('app').controller('emtsCtrl', function($scope, $http) {
    $scope.setup = function() {
      $http.get('/api/v1/emts').then(function(response) {
        $scope.emts = response.data;
        setupMap($scope.emts);
      });
      $http.get('/api/v1/tags.json').then(function(response) {
        $scope.tags = response.data;
      });
    };

    $scope.filterByTag = function(tag) {
      $scope.tagFilterId = tag.id;
    };

    $scope.resetFilterByTag = function() {
      $scope.tagFilterId = null;
    };

    $scope.matchTag = function(emt) {
      if ($scope.tagFilterId) {
        // Use a for loop to see if $scope.tagFilterId exists in emt.tags
        for (var i = 0; i < emt.tags.length; i++) {
          var tag = emt.tags[i];
          if (tag.id === $scope.tagFilterId) {
            return true;
          }
        }
        return false;
        // Or accomplish the same thing in one line:
        // return emt.tags.map(tag => tag.id).indexOf($scope.tagFilterId) !== -1;
      } else {
        return true;
      }
    };

    $scope.changeOrderAttribute = function(inputAttribute) {
      if (inputAttribute !== $scope.orderAttribute) {
        $scope.orderDescending = false;
      } else {
        $scope.orderDescending = !$scope.orderDescending;
      }
      $scope.orderAttribute = inputAttribute;
    };

    $scope.createEmt = function(name, address, startTime, endTime, notes, tags) {
      var params = {
        name: name,
        address: address,
        start_time: startTime,
        end_time: endTime,
        notes: notes,
        tags: tags
      };
      $http.post('/api/v1/emts.json', params).then(function(response) {
        console.log(response);
        $scope.emts.push(response.data);
      });
    };

    function setupMap(emts) {
      var geocoder = new google.maps.Geocoder();
      var map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: -34.397, lng: 150.644},
        zoom: 8
      });
      var markers = [];
      var bounds = new google.maps.LatLngBounds();
      emts.forEach(function(emt) {
        console.log(emt);
        geocoder.geocode({address: emt.address}, function(results, status) {
          if (status === google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
              position: results[0].geometry.location,
              map: map,
              title: 'Hello World!'
            });
            markers.push(marker);
            for (var i = 0;i < markers.length; i++) {
              bounds.extend(markers[i].getPosition());
            }
            map.fitBounds(bounds);
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
      });
    }
  });
})();