(function() {
  "use strict";
  angular.module("app").controller("patients", ["$scope", "$http", "$q", function($scope, $http, $q) {

    $scope.setup = function() {
      $http.get("http://localhost:3000/api/v1/patients/").then(function(response) {
        $scope.patients = response.data;
      });
    };
    $scope.test = "hello";
    $scope.checkIn = function(patient) {
      console.log(patient);
      $http.get("http://localhost:3000/api/v1/patients/" + patient.id).then(function(response) {
        console.log(response.data);
        patient.status = "Checked In";
      });
    };

    $scope.calculateStartTime = function(string_date) {
      return new Date() - new Date(string_date);
    };
    window.$scope = $scope;
  }]);
})();
