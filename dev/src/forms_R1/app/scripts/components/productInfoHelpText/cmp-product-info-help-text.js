(function () {
    'use strict';
    angular
        .module('productInfoHelpText', [
            'services',
            'filterLists'
        ])

})();


(function () {
    'use strict';
    angular
        .module('productInfoHelpText')
        .component('cmpProductInfoHelpText', {
            templateUrl: 'app/scripts/components/productInfoHelpText/tpl-product-info-help-text.html',
            controller: ProductInfoHelpTextCtrl,
            controllerAs: 'helpCtrl',
            bindings: {
                htIndxList: '<',
                isForProd: '<'
            }
        });

    ProductInfoHelpTextCtrl.$inject = [
        '$translate',
        '$scope'];

    function ProductInfoHelpTextCtrl( $translate, $scope) {

        var vm = this;
        var asdf = 'sdfsdfdsf';
        vm.lang = $translate.proposedLanguage() || $translate.use();

        vm.$onInit = function () {
            //vm.updateSummary=vm.updateSummary+1;
            // console.log('indx list: ' + vm.htIndxList);
        };

    }
})();

