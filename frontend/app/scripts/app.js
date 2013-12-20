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
      .when('/topics/:topicId', {
        controller: 'TopicDetailCtrl',
        templateUrl: 'views/topic.html'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
