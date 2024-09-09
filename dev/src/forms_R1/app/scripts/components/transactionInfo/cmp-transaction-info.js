/**
 * Created by dkilty on 16/08/2016.
 */

(function () {
    'use strict';

    angular
        .module('transactionInfo',
            ['lifecycleList',
                'transactionService',
                'services',
                'filterLists',
                'hpfbConstants',
                'ui.bootstrap',
                'dataLists',
                'ui.select',
                'addressModule',
                'contactModule',
                'transactionFeesModule',
                'alertModule',
                'errorMessageModule'
            ])
})();

(function () {
    'use strict';

    angular
        .module('transactionInfo')
        .config(function (uiSelectConfig) {
            //choices: select2, bootstrap, selectize
            uiSelectConfig.theme = 'select2';
        })
        .component('cmpTransactionInfo', {
            templateUrl: 'app/scripts/components/transactionInfo/tpl-transaction-info.html',
            controller: transactionInfoCtrl,
            controllerAs: 'transInfoCtrl',
            bindings: {
                transactionRoot: '<',
                //onUpdate: '&',
                isAmend: '<',
                isFinal: '<',
                isFileLoaded: '<',
                getTransaction: '&',
                setStartingSequence:'&',
                getRepContact: '&',
                getFee:'&',
                resetEctd: '&',
                deprecateSequence: '&',
                language:'<',
                sequenceUpdated:'<',
                getCurrentSequence:'&',
                showErrorSummary: '<',
                updateErrorSummary:'&',
                defaultLifecycleRecord: '&',
                htIndxList: '<'
            }
        });

    transactionInfoCtrl.$inject = ['$scope', 'OTHER', 'YES', 'NO', 'PROD', 'TransactionLists', 'TransactionService', 'getRoleLists', 'ENGLISH', 'FRENCH'];
    function transactionInfoCtrl($scope,OTHER,YES,NO,PROD,TransactionLists,TransactionService,getRoleLists, ENGLISH,FRENCH) {
        var vm = this;
        vm.transactionService = new TransactionService();
        vm.ngModelOptSetting = {updateOn: 'blur'};
        vm.transactionModel = {
        };
        vm.yesNoList = [YES, NO];
        // vm.newExistingList = [NEW, EXISTING];
        // vm.showNewActivityFields = false;
        // vm.showThirdPartyNote = false;
        vm.showAdminSub = false;
        vm.showEctdSection = true;
        vm.showSolicitedDetail = false;
        vm.showOtherSolicitedDetail = false;
        vm.activityEditable = true;
        vm.isEctd = false;
        vm.hideRaLead = false;
        vm.selectedDossierType = '';
        vm.alerts = [false, false, false, false, false, false, false, false, false];
        // vm.requesterList = [];
        vm.userList = [];
        vm.isForProd = PROD === TransactionLists.getEnv();
        vm.formTypeList = getRoleLists.getFormTypes(vm.isForProd);
        vm.lang=ENGLISH;
        vm.sequenceChange=false;
        vm.requiredOnly = [{type: "required", displayAlias: "MSG_ERR_MAND"}];
        vm.min5Error = [
            {type: "required", displayAlias: "MSG_ERR_MAND"},
            {type: "minlength", displayAlias: "MSG_LENGTH_MIN5"}
        ];
        vm.formatError = [
            {type: "required", displayAlias: "MSG_ERR_MAND"},
            {type: "minlength", displayAlias: "FORMAT_TYPE_MINLENGTH"},
            {type: "pattern", displayAlias: "FORMAT_TYPE_PATTERN"}
        ];
        vm.showSummary=false;
        vm.disablePtclNum = false;

        vm.$onInit = function () {
            _setIdNames();
            // vm.updateActivityType();
            vm.setThirdParty();
            vm.setAdminSubmission();
            vm.updateEctdState();
            vm.updateDossierTypeState();
            // vm.setSolicitedState();
            loadAdminSubData();
            // loadUserListData();
            vm.finalState=false;
            vm.displayResetBtn = false;
            vm.getFee();

        };


        vm.$onChanges = function (changes) {
            if (changes.transactionRoot) {
                vm.transactionModel = changes.transactionRoot.currentValue;
                //   vm.updateActivityType();
                vm.setThirdParty();
                vm.setAdminSubmission();
                vm.updateEctdState();
                //   vm.setSolicitedState();
                vm.selectedDossierType = vm.transactionModel.ectd.dossierType;
                if(vm.transactionModel.ectd.productProtocol === 'UNASSIGNED') {
                    vm.disablePtclNum = true;
                }
            }

            if(changes.language){

                vm.lang=changes.language.currentValue;
            }
            if(changes.sequenceUpdated){
                vm.sequenceChange=changes.sequenceUpdated.currentValue;
            }
            if(changes.showErrorSummary){
                vm.showSummary=changes.showErrorSummary.currentValue;
            }
            if(changes.isFinal){
                vm.finalState = changes.isFinal.currentValue;
            }
        };

        vm.isPB = function() {
            if (vm.transactionModel.ectd.dossierType === 'D21' || vm.transactionModel.ectd.dossierType === 'D22') {
                return true;
            } else {
                vm.transactionModel.ectd.isPriority = "";
                vm.transactionModel.ectd.isNoc = "";
                return false;
            }
        };

        vm.isPBV = function() {
            if (vm.transactionModel.ectd.dossierType === 'D21' || vm.transactionModel.ectd.dossierType === 'D22'
                || vm.transactionModel.ectd.dossierType === 'D24') {
                return true;
            } else {
                vm.transactionModel.ectd.isPriority = "";
                vm.transactionModel.ectd.isNoc = "";
                return false;
            }
        };

        vm.isFeesIndicated=function() {
            return vm.transactionModel.isFees !== NO;
        };



        vm.getNewTransaction = function () {
            return (vm.getTransaction());
        };

        vm.setSequence=function(start){

            if(isNaN(start) ||start === null){
                start=0;
            }
            vm.setStartingSequence({startVal:start});

        };

        vm.getNewRepContact = function () {
            return (vm.getRepContact());
        };

        vm.subtractSequence = function () {
            vm.deprecateSequence();
        };

        //temp used for autimation testing. Ignore for coding
        vm.showFormErrors = function () {

            //  return (vm.showErrors())
        };

        //TODO : needed for subcomponents, replace with one way binding?
        vm.showErrors=function(){

            return  vm.showSummary;
        };

        vm.showError = function (ctrl) {
            if (!ctrl) return;

            if ((ctrl.$invalid && ctrl.$touched) || (vm.showSummary && ctrl.$invalid )) {
                return true;
            }
            return false;
        };

        vm.setTouch = function (ctrl) {
            if (!ctrl) return;
            ctrl.$setTouched();
        };

        vm.updateActivityType = function () {
            //  vm.showNewActivityFields = isNewActivity();
            //if(!vm.showNewActivityFields){
            // vm.transactionModel.isThirdParty = "";
            vm.transactionModel.isPriority = "";
            vm.transactionModel.isNoc = "";
            vm.transactionModel.isAdminSub = "";
            vm.transactionModel.subType = "";
            // vm.showThirdPartyNote = false;
            vm.showAdminSub = false;

            // }
        };

        vm.setThirdParty = function () {
            vm.showThirdPartyNote = (vm.transactionModel.isThirdParty === YES);
            if (vm.transactionModel.isThirdParty === NO) {
                vm.transactionModel.companyName = "";
                vm.transactionModel.activityAddress =
                    {
                        street: "",
                        city: "",
                        stateList: "",
                        stateText: "",
                        country: "",
                        countryDisplay: "",
                        postalCode: ""
                    };
            }
        };

        vm.updateEctdState = function () {
            if (isEctdValue()) {
                vm.isEctd = true;
            } else {
                vm.isEctd = false;
            }
        };

        vm.updateDossierTypeState = function () {
               vm.selectedDossierType = vm.transactionModel.ectd.dossierType ;
               if(vm.selectedDossierType === 'D26'){
                   vm.transactionModel.isPriority = '';
                   vm.transactionModel.isNoc = '';
                   vm.transactionModel.isAdminSub = '';
                   vm.transactionModel.subType = '';
                   vm.showAdminSub = false;
                   vm.hideRaLead = false;
                   // vm.transactionModel.isFees = YES;
               } else {
                   vm.transactionModel.ectd.productProtocol = '';
                   vm.disablePtclNum = false;
                   if(vm.selectedDossierType === 'D24') {
                       vm.transactionModel.isPriority = '';
                       vm.transactionModel.isNoc = '';
                       // vm.transactionModel.isFees = YES;
                       vm.hideRaLead = true;
                   } else {
                       vm.transactionModel.isFees = '';
                       vm.transactionModel.feeDetails = null;
                       vm.hideRaLead = false;
                   }
               }
        };
        vm.faxMandatory = function () {
            if(vm.selectedDossierType === 'D21' || vm.selectedDossierType === 'D22'){
                return true;
            }
            return false;
        };

        function pharmaceuticalDossierType() {
            return vm.transactionModel.ectd.dossierType === 'D21';
        }

        function biologicDossierType() {
            return vm.transactionModel.ectd.dossierType === 'D22';
        }

        vm.updateFeeState=function(){
            if(vm.transactionModel.isFees === NO){
                //clear out all the fee details
                vm.transactionModel.feeDetails = null;
            }else{
                vm.transactionModel.feeDetails = vm.getFee();
            }

        };

        function isEctdValue() {
            return vm.transactionModel.isEctd === YES;
        }

        // function isSolicitedValue() {
        //    return true; //vm.transactionModel.isSolicited === YES;
        //  }

        function isActivityChangesValue() {
            return vm.transactionModel.isActivityChanges === YES;
        }

        //   function isNewActivity() {
        //        return vm.transactionModel.transactionType === NEW;
        //    }

        function loadAdminSubData() {
            vm.transactionService.getAdminSubTypeList()
                .then(function (data) {
                    vm.adminSubTypeList = data;
                    return true;
                });
        }

        // function loadContactData() {
        //     getContactLists.getInternalContacts()
        //         .then(function (data) {
        //             vm.requesterList = data;
        //             return true;
        //         });
        // }

        // function loadUserListData() {
        //     getContactLists.getInternalContactsWithoutOther()
        //         .then(function (data) {
        //             vm.userList = data;
        //             return true;
        //         });
        // }


        /**
         * @ngdoc method sets the visibilty of the solicited requester field. Clears
         * the data if the field is hidden
         vm.setSolicitedState = function () {
            if (isSolicitedValue()) {
                vm.showSolicitedDetail = true;
            } else {
                vm.showSolicitedDetail = false;
                vm.transactionModel.solicitedRequesterReord = [];
            }
        };
         */

        vm.updateActivityChanges = function () {
            vm.activityEditable = isActivityChangesValue();
        };

        vm.updateRequesterList = function(list){
            if(!list) return;
            vm.transactionModel.solicitedRequesterReord = list;
        };

        /**
         * Sets the visibility and state of the related activities
         */
        vm.setAdminSubmission = function () {
            if (vm.transactionModel.isAdminSub === YES) {
                vm.showAdminSub = true;
            } else {
                vm.showAdminSub = false;
                vm.transactionModel.subType = "";
            }
        };

        /**
         * Open the instruction alerts
         * @param value
         */
        vm.addInstruct = function (value) {

            if (angular.isUndefined(value)) return;
            if (value < vm.alerts.length) {
                vm.alerts[value] = true;
            }
        };

        /**
         * Close the instruction alerts
         * @param value
         */
        vm.closeAlert = function (value) {
            if (angular.isUndefined(value)) return;
            if (value < vm.alerts.length) {
                vm.alerts[value] = false;
            }
        };

        /***
         * used to determine the form language
         * @returns {boolean}
         */
        vm.isFrench=function(){
            return(vm.lang===FRENCH);
        };



        /**
         * @Clear specific Values - Business wanted these values cleared on Reset
         * Changes to row 11, 12, 13, 15, 16, 17, 22, 37, 41, 43, 44, 46, 93
         */
        vm.resetSpecificValues = function () {
            if( vm.finalState )
            {
                // vm.transactionModel.ectd.productName= ""; //11 - product name- just hidden
                // vm.transactionModel.transactionType = ""; //12 - new or exsiting
                // vm.updateDossierTypeState();
                vm.updateActivityType();
                vm.setThirdParty();
                vm.setAdminSubmission();
                // vm.transactionModel.isSolicited = "";
                // vm.setSolicitedState();
                vm.transactionModel.ectd.lifecycleModel = vm.getNewTransaction(); //22 - Transaction Details Record
                vm.transactionModel.ectd.lifecycleRecord = angular.copy(vm.transactionModel.ectd.lifecycleModel);
                // vm.transactionModel.projectManager1 = ""; //43 - projectManager1
                // vm.transactionModel.projectManager2 = ""; // 44 -projectManager2
                // vm.transactionModel.isFees = YES; // 46 - fee
                vm.transactionModel.feeDetails = null;
                vm.transactionModel.confirmContactValid = false; //93 confirmation
                vm.transactionModel.resetBtnClicked = true;
            }
        };

        vm.showRoutingId = function(){
            return 0;
        };

        /**
         * Once Reset button clicked
         * Hide - productName,
         vm.disableProductName = function(){
            return (vm.finalState);
        };
         */

        $scope.$watch('transInfoCtrl.transInfoForm.$error', function () {
            //vm.updateErrorSummaryState();
            vm.updateErrorSummary();
        }, true);

        function _setIdNames(){
            var scopeId = "_" + $scope.$id;
            vm.companyId="company_id"+scopeId;
            vm.dossierId="dossier_id"+scopeId;
            vm.productNameId="prod_name"+scopeId;
            vm.productProtocolId="prod_protocol"+scopeId;
            vm.isEctdId="is_ectd"+scopeId;
            //  vm.isSolicitedId="is_solicited"+scopeId;
            vm.solictedRqId="solicited_rq"+scopeId;
            vm.solicitedOtherId="solicited_rq_other"+scopeId;
            vm.companyNameId="company_noabbrev"+scopeId;
            vm.contactSameId="confirm_contact_valid"+scopeId;
            vm.isFeesId="is_fee_transaction"+scopeId;
            vm.typeId="dossier_type"+ scopeId;
            // vm.isNewActivityId="is_new_activity"+ scopeId;
            vm.thirdPartyId = "is_signed_3rd_party" + scopeId;
            vm.isAdminSubId = "is_admin_submission" + scopeId;
            vm.adminSubTypeId = "admin_sub_type" + scopeId;
            vm.isPriorityId = "is_priority" + scopeId;
            vm.isNocId = "is_noc" + scopeId;
        }

        vm.updateProductProtocol = function (value) {
            vm.disablePtclNum = value;
            if (value) {
                vm.transactionModel.ectd.productProtocol = "UNASSIGNED";
            } else if (vm.transactionModel.ectd.productProtocol === 'UNASSIGNED') {
                vm.transactionModel.ectd.productProtocol = "";
            }
        }
    }

})
();