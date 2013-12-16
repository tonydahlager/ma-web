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
        templateUrl: 'views/topics.html'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
