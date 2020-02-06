(function () {
    'use strict';
    angular
        .module('companyHelpText', [
            'services',
            'filterLists'
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
        '$scope'];

    function CompanyHelpTextCtrl( $translate, $scope) {

        var vm = this;
        vm.lang = $translate.proposedLanguage() || $translate.use();

        vm.$onInit = function () {
        };

    }
})();

