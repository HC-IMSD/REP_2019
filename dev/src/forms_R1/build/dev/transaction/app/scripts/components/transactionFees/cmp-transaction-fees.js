(function () {
    'use strict';
    angular
        .module('transactionFeesModule', [
            'services',
            'hpfbConstants',
            'errorMessageModule'
        ]);

})();

(function () {
    'use strict';

    angular
        .module('transactionFeesModule')
        .component('cmpTransactionFees', {
            templateUrl: 'app/scripts/components/transactionFees/tpl-transaction-fees.html',
            controller: transactionFeesController,
            controllerAs: 'transFeeCtrl',
            bindings: {
                feeRecord: '<',
                language:'<',
                showErrorSummary: '<',
                updateErrorSummary:'&'
            }
        });

    transactionFeesController.$inject = ['$scope', '$window', '$translate', 'TransactionLists', 'YES', 'NO','ENGLISH','FRENCH','ADVANCE_FEE_PAYMENT_EN','ADVANCE_FEE_PAYMENT_FR'];

    function transactionFeesController($scope, $window, $translate, TransactionLists, YES, NO,ENGLISH,FRENCH, ADVANCE_FEE_PAYMENT_EN,ADVANCE_FEE_PAYMENT_FR) {

        var vm = this;
        vm.currencyFrench = new Intl.NumberFormat('fr-CA', {
            style: 'currency',
            currency: 'CAD',
            minimumFractionDigits: 2
        });
        vm.currencyEnglish = new Intl.NumberFormat('en-CA', {
            style: 'currency',
            currency: 'CAD',
            minimumFractionDigits: 2
        });
        vm.model = {};
        vm.submissionType = {};
        vm.onePaymentSelected = "";
        vm.oneFeeDocSelected = "";
        vm.yesNoList = [YES, NO];
        vm.feeDocKeys = ['estMarketShare', 'comparison', 'salesHistory', 'marketPlan', 'avgSalePrice', 'other'];
        vm.requiredOnly = [{type: "required", displayAlias: "MSG_ERR_MAND"}];
        vm.requiredOnlyError = [{type: "required", displayAlias: "MSG_ERR_MAND"},
                                {type: "number", displayAlias: "TYPE_NUMBER"}
                                ];
        vm.onePaymentError = [{type: "required", displayAlias: "MSG_ERR_MAND"}];
        vm.oneFeeDocError = [{type: "required", displayAlias: "MSG_ERR_MAND"}];
        vm.alerts = [false, false, false];
        vm.lang=$translate.use();
        /**
         * Called after onChanges evnet, initializes
         */
        vm.$onInit = function () {
            _setIdNames();
            vm.submissionType = TransactionLists.getFeeList();
            vm.mitigationList = TransactionLists.getMitigationList();
            vm.alerts = [false, false, false];
            for(var i=0; i < vm.submissionType.length; i++){
                vm.submissionType[i]['text'] = vm.submissionType[i][$translate.use()];
            }
        };

        vm.errorsTemp = function () {
            return true;
        };
        /**
         * Called on binding changes
         */
        vm.$onChanges = function (changes) {

            if(changes.language){
                vm.lang=changes.language.currentValue;
            }
            if (changes.feeRecord) {
                vm.model = changes.feeRecord.currentValue;
            }
            if(changes.showErrorSummary){
                vm.showSummary=changes.showErrorSummary.currentValue;

            }

        };

        vm.showError = function (ctrl) {

            if (!ctrl) return false;

            if ((ctrl.$invalid && ctrl.$touched) || (vm.showSummary && ctrl.$invalid )) {
                return true
            }
        };

        vm.isPaymentSelected = function () {
            var methodSelected = false;
            var keys = Object.keys(vm.model.paymentMethod);
            for (var i = 0; i < keys.length; i++) {
                if (vm.model.paymentMethod[keys[i]] === true) {
                    methodSelected = true;
                    break;
                }
            }
            vm.onePaymentSelected = "";

            if (methodSelected) {
                vm.onePaymentSelected = true;
                return true
            } else {
                vm.onePaymentSelected = false;
                return false
            }

        };

        vm.isFeeDocSelected = function () {
            var feeDocSelected = false;
            for (var i = 0; i < vm.feeDocKeys.length; i++) {
                if (vm.model.requiredDocs[vm.feeDocKeys[i]] === true) {
                    feeDocSelected = true;
                    break;
                }
            }
            vm.oneFeeDocSelected = "";

            if (feeDocSelected) {
                vm.oneFeeDocSelected = true;
                return true;
            } else {
                vm.oneFeeDocSelected = false;
                return false;
            }

        };

        vm.isFeeRemit = function () {
            if (vm.model.feeRemission === YES) {
                return true;
            }
            vm.model.grossRevenue = 0;
            vm.model.percentGross = 0;
            return false;

        };
        vm.calcValue = function () {
            var result = parseFloat(vm.model.grossRevenue) * 0.1;
            if (isNaN(result)) result = 0;
            vm.model.percentGross = result.toFixed(2);
        };

        /**
         * Sets the deferral state information
         * @returns {boolean}
         */
        vm.isDeferral = function () {
            if (!vm.model) return false;

            if (vm.model.deferralRequest === YES) {

                return true;
            }

            vm.model.requiredDocs.deferralStat = false;
            return false;
        };

        /**
         * Determines if the entire documentation section should be  shown
         * @returns {boolean}
         */
        vm.showDocumentationSection = function () {
            if (vm.isEligible() || vm.isDeferral()) {
                return true;
            }
            return false;

        };
        /**
         * Determines if payment methods should be shown
         * @returns {boolean}
         */
        vm.showPaymentMethods = function () {
            if (!vm.model) return false;
            var showPM = !vm.isDeferral() && (!vm.isEligible() && vm.isLess10K()) || (vm.isEligible() );
            if (!showPM) {
                vm.model.paymentMethod = {
                    creditCard: false,
                    cheque: false,
                    moneyOrder: false,
                    bankDraft: false,
                    existingCredit: false,
                    bankWire: false,
                    billPayment: false
                };
            }
            return showPM;
        };

        /**
         * Determines if no fees should be sent
         * @returns {boolean}
         */
        vm.isSendNoFees = function () {
            if (!vm.model || !vm.model.submissionClass || !vm.model.submissionClass.fee)
            {
                return false;
            }
            return (!vm.isLess10K() && !vm.isEligible() && !vm.isDeferral() && !vm.isFeeRemit());

        };
        vm.isFrench = function () {
            return (vm.lang !== ENGLISH);
        };

        /**
         * Determines if show Payment title
         * @returns {boolean}
         */
        vm.showPaymentSection = function () {
            return ((!vm.isDeferral() && vm.isFeeRemit()) ||
                (vm.isEligible() && vm.isLess10K()) ||
                (vm.isEligible() && !vm.isLess10K()) ||
                (vm.isDeferral() && !vm.isEligible())
            );
        };

        vm.showPaymentPanel = function () {
            if (!vm.model || !vm.model.submissionClass || !vm.model.submissionClass.fee)
            {
                return false;
            }
            // isSendNoFees -more than 10K, isDeferral - yes, isFeeRemit - yes
            if(vm.isSendNoFees() || vm.isDeferral() || vm.isFeeRemit())
            {
                return false;
            }

            return true;
         };

        /**
         * Returns if the fees are elgible for remissions
         * @returns {boolean}
         */
        vm.isEligible = function () {

            //check if there is no model or submission class chosen
            if (!vm.model || !vm.model.submissionClass || !vm.model.submissionClass.fee) {
                clearRemitRequiredDocs();
                return false;
            }

          //  console.log("percentGross :" +  parseInt(vm.model.percentGross) );
         //   console.log("percentGross :" +  parseInt(vm.model.submissionClass.fee) );
            if (vm.isFeeRemit() && ( parseInt(vm.model.percentGross) < parseInt(vm.model.submissionClass.fee))) {
                return true;
            }
            clearRemitRequiredDocs();
            return false
        };
        vm.isLess10K = function () {
            if (!vm.model || !vm.model.submissionClass) {
                return false;
            }
            return vm.model.submissionClass.fee < 10000
        };

        vm.openPaymentForm = function () {
            var feelink=ADVANCE_FEE_PAYMENT_EN;

            if(vm.lang === FRENCH){

                feelink=ADVANCE_FEE_PAYMENT_FR;
            }

            $window.open(feelink, '_blank');
        };

        vm.setDocOther = function () {
            if (!vm.model) return false;
            if (vm.model.requiredDocs.other) {
                return true;
            }
            vm.model.requiredDocs.otherDetails = "";
            return false
        };
        vm.getFee = function() {
            if(! vm.model || ! vm.model.submissionClass || ! vm.model.submissionClass.fee){
                return '';
            }
            return vm.getCurrency(vm.model.submissionClass.fee);
        }
        vm.getPpercentGross = function() {
            return vm.getCurrency(vm.model.percentGross)
        }
        vm.getCurrency = function(money){
            if(! money){
                return '';
            }
            if(vm.lang == ENGLISH){
                return vm.currencyEnglish.format(money);
            }else{
                return vm.currencyFrench.format(money);
            }

        }
        /**
         * Clears the required data related to remit
         */
        function clearRemitRequiredDocs() {
            if (!vm.model) return;

            vm.model.requiredDocs.revStat = false;
            vm.model.requiredDocs.estMarketShare = false;
            vm.model.requiredDocs.comparison = false;
            vm.model.requiredDocs.salesHistory = false;
            vm.model.requiredDocs.marketPlan = false;
            vm.model.requiredDocs.avgSalePrice = false;
            vm.model.requiredDocs.other = false;
            vm.model.requiredDocs.otherDetails = "";

        }

        function _setIdNames() {
            var scopeId = "_" + $scope.$id;
            vm.submClassId = "sub_class" + scopeId;
            vm.descriptId = "fee_description" + scopeId;
            vm.feeId = "fee_amount" + scopeId;
            vm.remitId = "fee_remission" + scopeId;
            vm.paymentSelectedId = "one_payment_method" + scopeId; //PAYMENT_METHODS
            vm.feeDocSelectedId = "one_fee_doc" + scopeId;
            vm.revenueId = "GROSS_REVENUE" + scopeId;
            vm.percentId = "calcPercent" + scopeId;
            vm.deferralStateId = "DEFER_STATEMENT" + scopeId; //statement supporting deferral
            vm.statement10Id = "STATEMENT_REVENUE" + scopeId;
           // vm.statement10Id = "required_doc" + scopeId;
            vm.otherId = "other" + scopeId;
            vm.otherDetailsId = "other_doc_details" + scopeId;
            vm.paymentFsId="fs_payment_methods" + scopeId;
            vm.feeDocFsId="fs_fee_docs" + scopeId;
            vm.deferId = "defer_fees" + scopeId;
            vm.mitigationTypeId = "mitigation_type" + scopeId;
            vm.certifyOrganizationId = "certify_organization" + scopeId;
            vm.smallBusinessFeeApplicationId = "small_business_fee_application" + scopeId;
            // vm.firstSubmissionId = "first_submission" + scopeId;
            vm.certifyFundedHealthInstitutionId = "certify_funded_health_institution" + scopeId;
            vm.certifyUrgentHealthNeedId = "certify_urgent_health_need" + scopeId;
            vm.certifyGovermentOrganizationId = "certify_goverment_organization" + scopeId;
            vm.certifyIsadId = "certify_isad" + scopeId;

        }
        /**
         * Closes the instruction alerts
         * @param value
         */
        vm.closeAlert = function (value) {
            if (angular.isUndefined(value)) return;
            if (value < vm.alerts.length) {
                vm.alerts[value] = false;
            }
        };

        vm.addInstruct = function (value) {

            if (angular.isUndefined(value)) return;
            if (value < vm.alerts.length) {
                vm.alerts[value] = true;
            }
        };

        vm.isSmallBusiness = function () {
            if (vm.model) {
                if (vm.model.mitigation.mitigationType && vm.model.mitigation.mitigationType.id === 'SMALL_BUSINESS') {
                    return true;
                } else {
                    vm.model.mitigation.certifyOrganization = false;
                    vm.model.mitigation.smallBusinessFeeApplication = "";
                    // vm.model.mitigation.firstSubmission = null;

                    return false;
                }
            } else {
                return false;
            }
        };

        vm.isUrgentHealthNeed = function () {
            if (vm.model) {
               if (vm.model.mitigation.mitigationType && vm.model.mitigation.mitigationType.id === 'URGENT_HEALTH_NEED') {
                   return true;
               } else {
                   vm.model.mitigation.certifyUrgentHealthNeed = false;
                   return false;
               }
            } else {
                return false;
            }
        };

        vm.isFundedHealthInstitution = function () {
            if (vm.model) {
                if (vm.model.mitigation.mitigationType && vm.model.mitigation.mitigationType.id === 'FUNDED_INSTITUTION') {
                    return true;
                } else {
                    vm.model.mitigation.certifyFundedHealthInstitution = false;
                    return false;
                }
            } else {
                return false;
            }
        };

        vm.isGovermentOrganization = function () {
            if (vm.model) {
                if (vm.model.mitigation.mitigationType && vm.model.mitigation.mitigationType.id === 'GOVERMENT_ORGANIZATION') {
                    return true;
                } else {
                    vm.model.mitigation.certifyGovermentOrganization = false;
                    return false;
                }
            } else {
                return false;
            }
        };

        vm.isISAD = function () {
            if (vm.model) {
                if (vm.model.mitigation.mitigationType && vm.model.mitigation.mitigationType.id === 'ISAD') {
                    return true;
                } else {
                    vm.model.mitigation.certifyIsad = false;
                    return false;
                }
            } else {
                return false;
            }
        };

        vm.setTouch = function (ctrl) {
            if (!ctrl) return;
            ctrl.$setTouched();
        };

    }
})();