'use strict';

angular.module('femaApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute'
])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
      })
      .when('/topics',  {
        controller: 'TopicsListCtrl',
        templateUrl: 'views/topics.html'
      })
      .when('/topics/:id', {
        controller: 'TopicDetailCtrl',
        templateUrl: 'views/topic.html'
      })
      .when('/barriers/:id', {
       controller: 'BarrierDetailCtrl',
       templateUrl: 'views/barrier.html'
      })
      .when('/contexts/:id', {
        controller: 'ContextDetailCtrl',
        templateUrl: 'views/context.html'
      })
      .when('/steps/:id', {
        controller: 'StepDetailCtrl', 
        templateUrl: 'views/step.html'
      })
      
      // non-default object model
      
      .when('/barriers', {
        controller: 'BarriersListCtrl', 
        templateUrl: 'views/barriers.html'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
