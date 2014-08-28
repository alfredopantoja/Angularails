;'use strict';
angular.module('ui-multi-gravatar', [])
  .directive('multiAvatar', [function () {
    return {
      restrict: 'E',
      link:function(scope, element, attrs) {
        
        var facebookId = attrs.facebookId;
        var githubUsername = attrs.githubUsername;
        var email = attrs.email;
        
        var tag = '';
        if ((facebookId !== null) && (facebookId !== undefined)  && (facebookId !== '')) {
          tag = '<img src="http://graph.facebook.com/' + facebookId + '/picture?type=large" class="img-responsive"/>';
        } else if ((githubUsername !== null) && (githubUsername !== undefined) && (githubUsername !== '')) {
          tag = '<img src="https://identicons.github.com/' + githubUsername + '.png" class="img-responsive"/>';
        } else {
          tag = '<h6>Use gravatar</h6>';
        }

        element.append(tag);
      }
    };
  }]);
