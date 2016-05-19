(function() {
  "use strict";
  angular.module("app").controller("patients", ["$scope", "$http", "$q", function($scope, $http, $q) {

    $scope.setup = function() {
      $http.get("http://localhost:3000/api/v1/patients/").then(function(response) {
        $scope.patients = response.data;
        $scope.patients.sort(function (a, b) {
          return b.patient_score - a.patient_score;
        });
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

    $scope.sortByTime = function() {
      $scope.patients.sort(function(a, b) {
        return $scope.calculateStartTime(a.created_at) - $scope.calculateStartTime(b.created_at)
      })
    }



    $scope.calculateStartTime = function(string_date) {
      return new Date(string_date).valueOf();
    };
    window.$scope = $scope;
  }]);
})();
