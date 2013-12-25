'use strict';

angular.module('femaApp')
  .controller('TopicsListCtrl', 
    ['$scope', 
      '$resource',
      '$routeParams',
      function ($scope, $resource, $routeParams) {
        var Topic = $resource('http://staging.varkek.com/api/v1/topics');
        var topics = Topic.query();
        $scope.topics = topics;
      }
    ]
  );