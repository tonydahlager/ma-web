'use strict';

angular.module('maappApp', [
  'ngResource',
])

angular.module('maappApp')
  .controller('TopicsCtrl', ['$scope', '$http', function ($scope, $http) {
    
    var api = 'http://staging.varkek.com/api/v1/';
    var apiTopics = api + 'topics.json';
    
    $http.get(apiTopics).success(function(data){
      console.log(data);
      $scope.topics = data;
    });
  }]);
