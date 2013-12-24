'use strict';

angular.module('femaApp')
  .controller('BarrierDetailCtrl', 
    [ '$scope',
      '$resource', 
      '$routeParams',
      function ($scope, $resource, $routeParams) {
        var Barrier = $resource('staging.varke.com/api/v1/barriers/:id');
        var barrier = Barrier.get({ id: $routeParams.id, 
                                    topic_id: $routeParams.topic_id });

        $scope.barrier = barrier;
      }
    ]
  );
