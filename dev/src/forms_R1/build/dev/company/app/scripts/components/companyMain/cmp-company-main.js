(function () {
    'use strict';
    angular
        .module('companyMain', [
            'companyService',
            'applicationInfoService',
            'companyHelpText',
            'ngMessages',
            'ngAria',
            'addressList',
            'contactList2',
            'fileIO',
            'ngSanitize',
            'applicationInfo',
            'filterLists',
            'hpfbConstants',
            'ui.bootstrap',
            'errorSummaryModule',
            'alertModule',
            'updateLang',
            'focus-if'
        ])
})();

(function () {
    'use strict';
    angular
        .module('companyMain')
        .component('cmpCompanyMain', {
            templateUrl: 'app/scripts/components/companyMain/tpl-company-main.html',
            controller: companyMainCtrl,
            controllerAs: 'main',
            bindings: {
                formType: '@'
            }
        });

    companyMainCtrl.$inject = ['CompanyService', 'ApplicationInfoService', 'hpfbFileProcessing', '$filter', '$scope', 'INTERNAL_TYPE', 'EXTERNAL_TYPE', 'APPROVED_TYPE', 'AMEND_TYPE','ENGLISH','getRoleLists','$translate','$anchorScroll','$location'];

    function companyMainCtrl(CompanyService, ApplicationInfoService, hpfbFileProcessing, $filter, $scope, INTERNAL_TYPE, EXTERNAL_TYPE, APPROVED_TYPE, AMEND_TYPE, ENGLISH, getRoleLists, $translate, $anchorScroll, $location) {

        var vm = this;
        vm.userType = EXTERNAL_TYPE;
        vm.isIncomplete = true;
        vm.formAmendType = false;
        vm.saveXMLLabel = "SAVE_DRAFT";
        vm.updateValues = 0;
        vm.applicationInfoService = new ApplicationInfoService();
        vm.showContent = _loadFileContent;
        vm.disableXML = true;
        vm.disableDraftButton = false;
        vm.mailtoLabel = "MAILTO";
        vm.showMailToHelpText = false;
        vm.disableMailtoLink = true;
        vm.mailToSubjectManufacturerCompName = '';
        vm.mailToSubjectCompId = '';
        vm.showAmendNote = false;
            vm.configCompany = {
            "label": "COMPANY_ID",
            "minFieldLength": "5",
            "fieldLength": "6",
            "tagName": "companyId",
            "minErrorMsg": "MSG_LENGTH_MIN5",
            "errorMsg": "MSG_LENGTH_6NUM"
        };
        vm.companyService = new CompanyService();
        vm.rootTag = '';
        if (vm.companyService) {
            vm.rootTag = vm.companyService.getRootTag();
        }
        vm.applTypes = vm.companyService.getApplicationTypes();
        vm.formTypeList = getRoleLists.getFormTypes();
        vm.company = vm.companyService.getModelInfo();
        vm.addressList = [];
        // vm.addrImpCompanyName =[];
        vm.indexList = vm.companyService.helpTextSequences;
        vm.alerts = [false, false, false, false, false, false];
        /**vm.alertAnchors = ["load-instructions-toggle",
            "load-instructions-toggle",
            "load-instructions-toggle",
            "load-instructions-toggle",
            "load-instructions-toggle",
            "load-instructions-toggle"]; **/
        vm.updateSummary=false;
        vm.showErrorSummary=false;
        vm.privacyStat=false;
        vm.isFileLoaded=false;
        vm.savePressed=false; //used for focus
        vm.focusSummary = 0; //messaging to set focus on the error summary
        vm.lang = $translate.proposedLanguage() || $translate.use();
        vm.requiredOnlyError = [{type: "required", displayAlias: "MSG_ERR_MAND"}];
        vm.exclusions = {
            "contactRec.contactRecForm": "true",
            "addressRec.addressRecForm": "true"
        };
        vm.alias={

            "contactRolesValid": {
                "type": "element",
                "target": "contactList"
            },
            "addressRolesValid": {
                "type": "element",
                "target": "addressList"
            }
            // "importerIdValid": {
            //     "type": "element",
            //     "target": "addressList"
            // }
            // "contactImporterVaild":{
            //     "type": "element",
            //     "target": "contactList"
            // }
        };

        vm.initUser = function (id) {

        };

        vm.$onInit = function () {
            //add init code here
            //reset instructions
            _setIdNames();

            vm.alerts = [false, false, false, false, false, false];
            vm.updateSummary=false;
            vm.showErrorSummary=false;
            vm.savePressed=false;

            $('#privacyNoticeStatement').trigger( "wb-init.wb-details" );
            $('#securityDisclaimer').trigger( "wb-init.wb-details" );
            $('#footnoteInstruction').trigger( "wb-init.wb-details" );
        };

        vm.$onChanges = function (changes) {
            if (changes.formType) {
                vm.userType = changes.formType.currentValue;
                if (vm.userType == INTERNAL_TYPE) {
                    vm.saveXMLLabel = "APPROVE_FINAL"
                } else {
                    vm.saveXMLLabel = "SAVE_DRAFT"
                }
            }
        };

        /**
         * @ngdoc method -returns whether this application is an amendment
         * @returns {boolean}
         */
        vm.setAmend = function () {

            vm.formAmendType = (vm.company.applicationType === AMEND_TYPE);
            /**
            if(vm.company.applicationType === APPROVED_TYPE && vm.userType === EXTERNAL_TYPE){
                vm.company.reasonAmend="";
            }*/
        };

        /**
         *
         * @ngdoc method Saves the model content in JSON format
         */
        vm.saveJson = function () {
            var writeResult = _transformFile();
            hpfbFileProcessing.writeAsJson(writeResult, _createFilename(), vm.rootTag);
        };
        /**
         * @ngdoc method - saves the data model as XML format
         */
        vm.saveXML = function () {
                if (vm.companyEnrolForm.$invalid) {
                    vm.showErrorSummary = true;
                    vm.updateErrorSummary();
                    vm.savePressed = true;
                    vm.focusSummary++;
                    goToErrorSummary();
                } else {
                    if (vm.companyEnrolForm["addressListCtrl.addressListForm"].$pristine && vm.companyEnrolForm["contactListCtrl.contactListForm"].$pristine) {
                        var writeResult = _transformFile();
                        hpfbFileProcessing.writeAsXml(writeResult, _createFilename(), vm.rootTag,
                            vm.companyService.getXSLFileName());
                        vm.showErrorSummary = false;
                        vm.companyEnrolForm.$setPristine();
                        vm.savePressed = false;
                    } else {
                        if (vm.lang === ENGLISH) {
                            alert("Please save the unsaved input data before generating XML file.");
                        } else {
                            alert("Veuillez sauvegarder les données d'entrée non enregistrées avant de générer le fichier XML.");
                        }
                    }
                }
        };

        function goToErrorSummary() {
            var masterError = angular.element(document.querySelector('#master-error'));
            if (masterError) {
                $location.hash('master-error');
                $anchorScroll();
            }
        }

        /**
         * Creates a filename based on HC specifications
         * @returns {string}
         * @private
         */
        function _createFilename() {
            var draft_prefix = "DRAFTREPCO";
            var final_prefix = "HCREPCO";
            var filename = "";
            var separator="-";
            if (vm.userType === INTERNAL_TYPE) {

                filename = final_prefix;
            } else {
                filename = draft_prefix;
            }
            if (vm.company.companyId) {
                filename = filename + separator+ vm.company.companyId;
            }
            if (vm.company.enrolmentVersion) {
                filename = filename + separator+  vm.company.enrolmentVersion;
            }
            filename=filename.replace(".",separator);
            return filename.toLowerCase();
        }

        /**
         * @ngdcc method updates data and increments version before creating json
         */
        function _transformFile() {
            updateDate();
            if (!vm.isExtern()) {
                if(!vm.companyEnrolForm.$pristine) {
                    vm.company.enrolmentVersion = vm.applicationInfoService.incrementMajorVersion(vm.company.enrolmentVersion);
                    vm.company.applicationType = ApplicationInfoService.prototype.getApprovedType();
                }
            } else {
                vm.company.enrolmentVersion = vm.applicationInfoService.incrementMinorVersion(vm.company.enrolmentVersion)
            }
            return vm.companyService.transformToFileObj(vm.company);
        }

        $scope.$watch("main.companyEnrolForm.$error", function () {
            //disableXMLSave()
            vm.updateErrorSummary();
        }, true);

        function disableXMLSave() {
            var isApprovedExternal = (vm.company.applicationType === vm.companyService.getApprovedType() && vm.isExtern());
            vm.disableDraftButton = isApprovedExternal;
            vm.disableXML = vm.companyEnrolForm.$invalid || isApprovedExternal; //used to disable the generate xml button
            //vm.showErrorSummary=true;

        }

        function disableJSONSave() {

            vm.disableJson = (vm.company.applicationType === vm.companyService.getApprovedType() && vm.isExtern())
        }

        function _setComplete() {
            vm.isIncomplete = !vm.company.companyId;
        }

        function _loadFileContent(fileContent) {
            if (!fileContent)return;
            vm.companyService = new CompanyService();
            var resultJson = fileContent.jsonResult;
            if (resultJson) {
                vm.companyService.transformFromFileObj(resultJson);
                vm.company = {};
                angular.extend(vm.company, vm.companyService.getModelInfo());
                // vm.hasAddrImpCompanyName(vm.company.addressList);
                _setComplete();
                vm.setAmend();
                vm.isFileLoaded = true;
                vm.showErrorSummary=false;
                vm.companyEnrolForm.$setDirty();
                vm.showAmendNote = (vm.company.applicationType === vm.companyService.getApprovedType() && vm.isExtern());
                vm.company.applicationTypeText = $translate.instant(vm.company.applicationType);
                // vm.privacyStat=false;
            }
            disableXMLSave();
        }

        /**
         * ngdoc method to set the application type to amend
         * @private
         */
        vm.setApplType = function (type) {

            vm.company.applicationType = type;
            vm.company.applicationTypeText = $translate.instant(vm.company.applicationType);
            disableXMLSave();
            vm.setAmend();
            vm.company.reasonAmend="";
            vm.privacyStat=false;
        };

        //used on update
        vm.onUpdateAddressList = function (newList) {
            vm.company.addressList = newList;
        };

        vm.getNewAddress = function () {
            return vm.companyService.createAddressRecord();
        };

        vm.getNewContact = function () {
            return vm.companyService.createContactRecord();
        };

        //TODO remove?
        vm.updateAddressRecord = function (address) {
            if (!address) return;
            var idx = vm.company.addressList.indexOf(
                $filter('filter')(vm.company.addressList, {addressID: address.addressID}, true)[0]
            );
            vm.company.addressList[idx] = address;
            var temp = vm.company.addressList;
            vm.company.addressList = [];
            vm.company.addressList = temp;
         };

        // vm.hasAddrImpCompanyName = function (addressList) {
        //     vm.addrImpCompanyName = [];
        //     for (var i =0; i< addressList.length; i++){
        //         if(addressList[i].addressRole.importer){
        //             vm.addrImpCompanyName.push(addressList[i].companyName);
        //         }
        //     }
        //     return vm.addrImpCompanyName;
        // };
        //
        //
        // vm.isImpCompanyNameUsed = function (companyName) {
        //
        //    for (var i=0; i< vm.company.contactList.length; i++){
        //         if(companyName !=="" && companyName === vm.company.contactList[i].impCompanyName){
        //             return true;
        //         }
        //     }
        //     return false;
        // };

        //TODO remove?
        vm.onUpdateContactList = function (newList) {
            vm.company.contactList = newList;
        };

        /**
         * @ngdoc method -updates the date field to the current date
         */
        function updateDate() {
            if (vm.company) {
                vm.company.dateSaved = vm.applicationInfoService.getTodayDate()
            }
        }

        vm.isExtern = function () {
            return vm.userType === EXTERNAL_TYPE;
        };
        /**
         * @ngdoc method when a form gets approved
         * remove any amendment checkboxes
         */


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

        /*
        Makes an instruction visible baseed on an index passed in
        Index sets the UI state in the alerts array
         */
        vm.addInstruct = function (value) {

            if (angular.isUndefined(value)) return;
            if (value < vm.alerts.length) {
                vm.alerts[value] = true;
            }
        };

        /**
         * Increments the conunter to send a signal to update the error summary module
          */
        vm.updateErrorSummary=function(){
            vm.updateSummary= vm.updateSummary+1;

        };
        /**
         * Determines if the current language is french
         * @returns {boolean}
         */
        vm.isFrench=function(){
            return(vm.lang!== ENGLISH);
        };

        vm.temp=function(){
            console.log($scope)
        };



        function _setIdNames() {
            var scopeId="_"+  $scope.$id;
            vm.formId = "company_form" +scopeId;
            vm.privacyStatementID = "privacy_statement" +scopeId;
            vm.typeId="dossier_type"+ scopeId;
        }

        /**
         * For individual controls, whether to show the error for a fiedl
         * @param ctrl.isInvalid - control $invalid flag
         * @param ctrl.isTouched -control $touched flag
         * @returns {*|dossierCtrl.showErrors}
         */
        vm.showError = function (ctrl) {
            if (vm.showErrorSummary) {
                return true;
            }
            if(!ctrl || ctrl.$untouched){
                return false;
            }
            return ((ctrl.$invalid && ctrl.$touched) || (vm.showErrorSummary && ctrl.$invalid));
        };

        vm.mailto = function () {
            var mailToSubjectManufacturerCompName = _getManufacturerCompanyName(vm.company.addressList) ;
            var mailToSubjectCompId = vm.company.companyId === "" ? '' : ' - ' + vm.company.companyId;

            vm.showMailToHelpText = true;
            vm.mailtoExplanation = $translate.instant("MAILTO_EXPLANATION");
            vm.emailSubject = $translate.instant("MAILTO_SUBJECT_TEXT") + mailToSubjectManufacturerCompName + mailToSubjectCompId;
            var emailAddress = 'client.information@hc-sc.gc.ca';
            var body = $translate.instant("MAILTO_BODY_TEXT");

            vm.mailToLink = 'mailto:' + emailAddress + '?subject=' + vm.emailSubject + '&body=' + body;

        };

        function _getManufacturerCompanyName(addressList) {
            var manufacturerAddress = $filter('filter')(addressList, {addressRole: {manufacturer: true}})[0];
            if (angular.isUndefined(manufacturerAddress))
                return '';
            else
                return " - " + manufacturerAddress.companyName;
        }

        vm.disableMailtoLink = function() {
            // disable the mailto link for internal, or
            // when there are errors for the external
            return (!vm.isExtern() || vm.companyEnrolForm.$invalid);
        }
    }

})();
