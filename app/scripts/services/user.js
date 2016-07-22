'use strict';

/**
 * @ngdoc service
 * @name yoteprestoapiApp.user
 * @description
 * # user
 * Factory in the yoteprestoapiApp.
 */
angular.module('yoteprestoapiApp')
  .factory('user', function () {
    // Service logic
    // ...

    var meaningOfLife = 42;

    // Public API here
    return {
      someMethod: function () {
        return meaningOfLife;
      }
    };
  });
