'use strict';

angular.module('femaApp')
  .controller('ContextDetailCtrl', 
    [ '$scope',
      '$resource',
      '$routeParams',
      function ($scope, $resource, $routeParams) {
        var Context = $resource('http://staging.varkek.com/api/v1/contexts/:id');
        var context = Context.get({id: $routeParams.id});
        $scope.context = context;
      }
    ]
  );