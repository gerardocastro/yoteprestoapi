'use strict';

/**
 * @ngdoc service
 * @name yoteprestoapiApp.users
 * @description
 * # users
 * Factory in the yoteprestoapiApp.
 */
angular.module('yoteprestoapiApp')
  .factory('users', function () {
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
