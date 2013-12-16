'use strict';

angular.module('femaApp')
  .controller('TopicsCtrl', ['$scope', '$http', function($scope, $http) {
    
    var url = '/api/v1/';
    var resourceUrl = url + 'topics';
    
    $http.get(resourceUrl).success(function(data){
      console.log(data);
      $scope.topics = data;  
    });
  }]);
