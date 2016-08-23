/**
 * Created by dkilty on 16/08/2016.
 */

(function () {
    'use strict';

    angular
        .module('transactionInfo', ['contactModule25', 'lifecycleList'])
})();

(function () {
    'use strict';

    angular
        .module('transactionInfo')
        .component('cmpTransactionInfo', {
            templateUrl: 'app/scripts/components/transactionInfo/tpl-transaction-info.html',
            controller: transactionInfoCtrl,
            controllerAs: 'transInfoCtrl',
            bindings: {
                transactionRoot: '<',
                 onUpdate: '&',
                 isAmend: '<',
                showErrors: '&',
                getTransaction: '&',
                getRepContact: '&',
                resetEctd: '&'
            }
        });

    transactionInfoCtrl.$inject = ['TransactionService']
    function transactionInfoCtrl(TransactionService) {
        var vm = this;
        vm.ngModelOptSetting = {updateOn: 'blur'}
        vm.transactionModel = vm.transactionRoot;
        vm.yesNoList = ['Y', 'N'];
        vm.showEctdSection = true;
        vm.showSolicitedDetail = false;
        vm.activityEditable = true;
        vm.$onInit = function () {
            vm.updateEctdState()
        }
        //TODO rename
        vm.$onChanges = function (changes) {
            if (changes.transactionRoot) {
                vm.updateEctdState();
                vm.setSolicitedState();
            }
        }
        vm.getNewTransaction = function () {
            return (vm.getTransaction());
        }
        vm.getNewRepContact = function () {
            return (vm.getRepContact());
        }

        vm.showError = function (ctrl) {
            if (!ctrl) return;
            if ((ctrl.$invalid && ctrl.$touched) || (vm.showErrors() && ctrl.$invalid )) {
             return true
            }
            return false
        }
        vm.updateEctdState = function () {
            if (isEctdValue()) {
                vm.showEctdSection = true;
            } else {
                //clear data
                vm.resetEctd();
                vm.showEctdSection = false;
            }
        }
        function isEctdValue() {
            //TODO magic number
            return vm.transactionModel.isEctd === 'Y';
        }

        function isSolicitedValue() {
            //TODO magic number
            return vm.transactionModel.isSolicited === 'Y';
        }

        function isActivityChangesValue() {
            //TODO magic number
            return vm.transactionModel.isActivityChanges === 'Y';
        }


        /**
         * @ngdoc method sets the visibilty of the solicited requester field. Clears
         * the data if the field is hidden
         */
        vm.setSolicitedState = function () {
            if (isSolicitedValue()) {
                vm.showSolicitedDetail = true;
            } else {
                vm.showSolicitedDetail = false;
                vm.transactionModel.solicitedRequester = "";
            }
        }
        vm.updateActivityChanges = function () {
            vm.activityEditable = isActivityChangesValue();
        }

    }

})();

