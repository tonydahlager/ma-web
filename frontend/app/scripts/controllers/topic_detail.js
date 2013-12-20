'use strict';

angular.module('femaApp')
  .controller('TopicDetailCtrl', 
    ['$scope', 
      '$http', 
      '$routeParams',
      '$resource',
      function ($scope, $http, $routeParams, $resource) {
        
        
        
        var Topic = $resource('/api/v1/topics/:id', {id: '@id'});
        var topic = Topic.get({id: $routeParams.topicId});
        
        console.log(topic);
        
        $scope.topic = topic;
        
      }
    ]
  );
