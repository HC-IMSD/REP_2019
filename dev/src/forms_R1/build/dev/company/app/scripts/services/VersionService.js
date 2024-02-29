(function () {
    'use strict';

    angular
        .module('VersionServiceModule', []);

})();


(function () {
    'use strict';

    angular
        .module('VersionServiceModule')
        .factory('VersionService', getService);

    /* @ngInject */
    getService.inject = [];
    function getService() {
        var vm = this;
        vm.ver = [];
        var service = {
            getVer: _getVerString,
            setVer: _setVerString
        };
        return service;

        ////////////////

        function _getVerString() {
            if (vm.ver) {
                return vm.ver;
            } else {
                return '@@verValue';
            }
        }

        function _setVerString(value) {
            vm.ver = value.ver;
        }
    }

})();