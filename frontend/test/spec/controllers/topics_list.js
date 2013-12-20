'use strict';

describe('Controller: TopicsListCtrl', function () {

  // load the controller's module
  beforeEach(module('femaApp'));

  var TopicsListCtrl
  , scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    TopicsListCtrl = $controller('TopicsListCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    // expect(scope.awesomeThings.length).toBe(3);
  });
});
