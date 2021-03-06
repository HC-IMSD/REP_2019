(function () {
    'use strict';


    //TODO: Lazy load modules
    angular.module('dossierApp', ['pascalprecht.translate', 'dossierLoadModule', 'dossierModule', 'dataLists', 'translations'])
        .controller('MainController', MainController);

  /*  angular.element(document).ready(function () {
        angular.bootstrap(document, ['dossierApp']);
    })*/
    MainController.$inject = ['$translate', 'getCountryAndProvinces'];
    function MainController($translate, getCountryAndProvinces) {
        var vm = this;
        vm.formType = '@@SET_FORM';
    }
})();

(function () {
    'use strict';
    angular
        .module('dossierApp')
        .config(['$translateProvider','$httpProvider', function ($translateProvider, $httpProvider) {
            //this prevents conflicts with ngMessage
            $translateProvider.directivePriority(1);
            $translateProvider.preferredLanguage('@@prefLang');
            $translateProvider.useLoader('customLoad');
            $translateProvider.useSanitizeValueStrategy(null);
            $translateProvider.forceAsyncReload(true); //needed for the custom loader
            //this disables caching for all files including json. File timestamps no longer needed!
            if (!$httpProvider.defaults.headers.get) {
             $httpProvider.defaults.headers.get = {};
             }
             //disable IE ajax request caching
             $httpProvider.defaults.headers.get['If-Modified-Since'] = 'Mon, 26 Jul 1997 05:00:00 GMT';
             // extra
             $httpProvider.defaults.headers.get['Cache-Control'] = 'no-cache';
             $httpProvider.defaults.headers.get['Pragma'] = 'no-cache';
        }]);
})();
