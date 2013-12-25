'use strict';

angular.module('femaApp')
  .controller('StepDetailCtrl', 
    [ '$scope', 
      '$resource', 
      '$routeParams',
      function ($scope, $resource, $routeParams) {
        var Step = $resource('http://staging.varkek.com/api/v1/steps/:id');
        var step = Step.get({id: $routeParams.id});
        $scope.step = step;
      }
    ]
  );