(function () {
    'use strict';
    angular
        .module('administrativeSubmission',  ['hpfbConstants','drugProductService','errorSummaryModule','errorMessageModule'])
})();

(function () {
    'use strict';
    angular
        .module('administrativeSubmission')
        .component('cmpAdministrativeSubmission', {
            templateUrl: 'app/scripts/components/administrativeSubmission/tpl-administrative-submission.html',
            controller: adminSubCtrl,
            controllerAs: 'adminSubCtrl',
            bindings: {
                subType: '<record',
                onUpdate: '&',
                showErrors: '&',
                updateErrorSummary: '&'
            }
        });

    adminSubCtrl.$inject=['$scope', 'DrugProductService'];

    function adminSubCtrl($scope,DrugProductService) {
        var vm = this;
        vm.drugProductService = new DrugProductService();
        vm.requiredOnly = [{type: "required", displayAlias: "MSG_ERR_MAND"}];
        vm.lang = vm.drugProductService.getCurrentLang();

        vm.$onInit = function () {
            // console.log("$onInit record=" + JSON.stringify(vm.record) +" vm.subType=" + JSON.stringify(vm.subType));
            _setIdNames();
            loadAdminSubData();
        };

        vm.$onChanges = function (changes) {
            if (changes.record) {
                vm.updateErrorSummary();
            }
        };

        function _setIdNames() {
            var scopeId="_"+  $scope.$id;
            vm.adminSubTypeId = "admin_sub_type" + scopeId;
        }

        function loadAdminSubData() {
            vm.drugProductService.getAdminSubTypeList()
                .then(function (data) {
                    vm.adminSubTypeList = data;
                    return true;
                });
        }

        vm.showErrorMissing = function () {
            return (vm.adminSubTypeForm.$touched || vm.showErrors());
        };

        vm.updateSubType = function () {
            // console.log("updateSubType record=" + JSON.stringify(vm.record) +" vm.subType=" + JSON.stringify(vm.subType));
            vm.updateErrorSummary();
            vm.onUpdate({record: vm.subType});
        };

        vm.isFrench = function () {
            return vm.drugProductService.isFrench(vm.lang);
        };

    }
})();
