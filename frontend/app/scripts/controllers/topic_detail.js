'use strict';

angular.module('femaApp')
  .controller('TopicDetailCtrl', 
    [ '$scope', 
      '$routeParams',
      '$resource',
      function ($scope, $routeParams, $resource) {
        var Topic = $resource('http://staging.varkek.com/api/v1/topics/:id', {id: '@id'});
        var topic = Topic.get({ id: $routeParams.id });
        $scope.topic = topic;
      }
    ]
  );
