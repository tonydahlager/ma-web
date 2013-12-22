'use strict';

describe('Controller: BarriersListCtrl', function () {

  // load the controller's module
  beforeEach(module('femaApp'));

  var BarriersListCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    BarriersListCtrl = $controller('BarriersListCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
