(function () {
    'use strict';
    angular
        .module('companyApp', [
            'pascalprecht.translate',
            'companyMain',
            'companyLoadService',
            'translations'
        ])
})();
//TODO replace with service for incrememnting version
(function () {
    'use strict';
    angular
        .module('companyApp')
        .controller('MainController', MainController);

    function MainController() {

        var vm = this;
        vm.formType = 'EXT';

    }
})();

(function () {
    'use strict';
    angular
        .module('companyApp')
        .config(['$translateProvider','$locationProvider', function ($translateProvider,$locationProvider) {

            $locationProvider.html5Mode(
                {enabled : true,
                    requireBase: false,
                    rewriteLinks : false});

            $translateProvider.preferredLanguage('fr');
            $translateProvider.useLoader('customLoad');
            //this prevents conflicts with ngMessage
            $translateProvider.directivePriority(1);
            $translateProvider.useSanitizeValueStrategy(null);
            $translateProvider.forceAsyncReload(true); //needed for the custom loader
        }]);
})();
