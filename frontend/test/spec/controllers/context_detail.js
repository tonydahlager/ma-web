'use strict';

describe('Controller: ContextDetailCtrl', function () {

  // load the controller's module
  beforeEach(module('femaApp'));

  var ContextDetailCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    ContextDetailCtrl = $controller('ContextDetailCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
