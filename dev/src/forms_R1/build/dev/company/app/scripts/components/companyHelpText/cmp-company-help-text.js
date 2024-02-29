(function () {
    'use strict';
    angular
        .module('companyHelpText', [
            'services',
            'filterLists',
            'hpfbConstants',
            'dataLists'
        ])

})();


(function () {
    'use strict';
    angular
        .module('companyHelpText')
        .component('cmpCompanyHelpText', {
            templateUrl: 'app/scripts/components/companyHelpText/tpl-company-help-text.html',
            controller: CompanyHelpTextCtrl,
            controllerAs: 'help',
            bindings: {
                htIndxList: '<'
            }
        });

    CompanyHelpTextCtrl.$inject = [
        '$translate',
        '$scope',
        'getCountryAndProvinces',
        'PROD'];

    function CompanyHelpTextCtrl( $translate, $scope, getCountryAndProvinces, PROD) {

        var vm = this;
        vm.lang = $translate.proposedLanguage() || $translate.use();
        vm.isForProd = PROD === getCountryAndProvinces.getEnv();

        vm.$onInit = function () {
        };

    }
})();

