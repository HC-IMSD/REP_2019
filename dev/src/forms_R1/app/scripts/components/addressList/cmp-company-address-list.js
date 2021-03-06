/**
 * Created by Abdessamad on 7/5/2016.
 */

(function () {
    'use strict';

    angular
        .module('addressList', ['addressRecord','hpfbConstants','errorSummaryModule'])
})();
//test
(function () {
    'use strict';

    angular
        .module('addressList')
        .component('cmpCompanyAddressList', {
            templateUrl: 'app/scripts/components/addressList/tpl-company-address-list.html',
            bindings: {
                addresses: '<',
                onUpdate: '&',
                getNewAddress: '&',
                isAmend: '<',
                companyService: '<',
                showErrorSummary:'<',
                errorSummaryUpdate:'<'
            },
            controller: addressListCtrl,
            controllerAs: 'addressListCtrl'
        });

    addressListCtrl.$inject = ['$filter', 'CompanyService','CANADA'];

    function addressListCtrl($filter, CompanyService, CANADA) {

        var vm = this;
        vm.selectRecord = -1; //the record to select, initially select non
        vm.isDetailsValid = true; //used to track if details valid. If they are  not do not allow expander collapse
        vm.allRolesSelected = "";
        vm.resetCollapsed = false;
        vm.updateSummary=0; //sends signal to update error summary object
        vm.showSummary=false;
        vm.addressList = [];
        vm.columnDef = [
            {
                label: "COMPANY",
                binding: "companyName",
                width: "30"
            },
            {
                label: "CITY",
                binding: "city",
                width: "25"
            },
            {
                label: "COUNTRY",
                binding: "countryDisplay",
                width: "25"
            },
            {
                label: "ROLES",
                binding: "roleConcat",
                width: "20"
            }
        ];

        vm.alias = {
            "roleMissing": {
                "type": "fieldset",
                "parent": "fs_roleMissing"
            },
            "addressRolesValid": {
                "type": "element",
                "target": "addAddressBtn"
            }
        };
        vm.exclusions = {
            "addressRec.addressRecForm": "true"
        };


        vm.$onInit = function () {
            //local var from binding
            vm.addressList = vm.addresses;
            vm.allRolesSelected = vm.isAllRolesSelected();
            updateRolesConcat();
        };

        vm.$onChanges = function (changes) {
            if (changes.addresses && changes.addresses.currentValue) {
                vm.addressList = changes.addresses.currentValue;
                vm.allRolesSelected = vm.isAllRolesSelected();
                updateRolesConcat();
                vm.isDetailsValid=true;
                vm.updateErrorSummaryState();
            }

            if(changes.showErrorSummary){
                vm.showSummary=changes.showErrorSummary.currentValue;
                vm.updateErrorSummaryState();
            }
            if(changes.errorSummaryUpdate){

                vm.updateErrorSummaryState();
            }

        };

        function updateRolesConcat() {
            if (!vm.addressList) return;
            for (var i = 0; i < vm.addressList.length; i++) {

                _setRolesConcat(vm.addressList[i]);
            }
        }

        //this is needed on load. Bit of a hack
        //TODO move to a service
        function _setRolesConcat(addressModel) {
            var addressRoles = addressModel.addressRole;
            var result = "";

            if (addressRoles.manufacturer) {
                result = result + " MFR"
            }
            if (addressRoles.billing) {
                result = result + " BILL"
            }
            if (addressRoles.mailing) {
                result = result + " MAIL"
            }
            if (addressRoles.importer) {
                result = result + " IMP"
            }
            addressModel.roleConcat = result;
        };


        vm.deleteAddress = function (aID) {
            var idx = vm.addressList.indexOf(
                $filter('filter')(vm.addressList, {addressID: aID}, true)[0]);
            vm.addressList.splice(idx, 1);
            vm.onUpdate({newList: vm.addressList});
            vm.selectRecord = 0;
            vm.isDetailsValid = true; //case that incomplete record is deleted
            vm.allRolesSelected = vm.isAllRolesSelected();
            vm.resetCollapsed = !vm.resetCollapsed;
            vm.updateErrorSummaryState();
        };

        vm.addAddress = function () {
            var defaultAddress = vm.getNewAddress();
            vm.addressList.push(defaultAddress);
            vm.isDetailsValid = true; //set to true to exapnd?
            vm.selectRecord = (vm.addressList.length - 1);
            vm.isDetailsValid = false;
        };

        vm.disableAddAddress = function () {
            //TODO don't hard code length
            return (!(vm.addressList.length < 4 && vm.isDetailsValid))

        };

        vm.setValid = function (detailValid) {
            vm.isDetailsValid = detailValid;
        };
        vm.onUpdateAddressRecord = function (address) {
            var idx = vm.addressList.indexOf(
                $filter('filter')(vm.addressList, {addressID: address.addressID}, true)[0]
            );
            vm.addressList[idx] = angular.copy(address);
            vm.allRolesSelected = vm.isAllRolesSelected();
            vm.isDetailsValid = true;
            vm.resetCollapsed = !vm.resetCollapsed;
        };

        //TODO move to the service
        vm.isREPRoleSelected = function (roleToCheck, recordID) {
            var rolesSelected = 0;
            //if no role to check, see if all selected
            if (!vm.addressList) return false;
            for (var i = 0; i < vm.addressList.length; i++) {
                if (vm.addressList[i].addressRole[roleToCheck] == true) {
                    //don't count it if it is the existing record
                    if (vm.addressList[i].addressID !== recordID) {
                        rolesSelected = rolesSelected + 1;
                    }
                    if (rolesSelected > 0) {
                        return true;
                    }
                }
            }
            return false;
        };
        /**
         * @ngdoc method determines the state of the list errors
         *
         * @returns {boolean}
         */
        vm.showError = function () {

            // Could show on not pristine&&!vm.addressListForm.$pristine
            return(!vm.isAllRolesSelected());
        };

        vm.updateErrorSummaryState=function(){
            vm.updateSummary= vm.updateSummary+1;
        };

        /**
         * @ngdoc method determines if all the roles have been selected for the address
         * @returns {boolean}
         */
            //TODO move to a service, can this be simplified?
        vm.isAllRolesSelected = function () {
            var rolesSelected = 0;
            var importerSelected = false;

            if (!vm.addressList) return false;
            var companyRole = vm.companyService.createAddressRole();
            var numKeys = vm.companyService.getNumberKeys(companyRole);
            for (var i = 0; i < vm.addressList.length; i++) {
                var obj = vm.addressList[i].addressRole;
                for (var key in obj) {
                    var attrName = key;
                    var attrValue = obj[key];
                    if (attrValue && companyRole.hasOwnProperty(attrName)) {
                        rolesSelected++;
                        if (attrName === "importer") importerSelected = true;
                    }
                }
            }
            if (rolesSelected === numKeys) {
                return true;
            }
            else if ((rolesSelected === (numKeys - 1)) && (!importerSelected)) {
                return true;
            } else {
                return false
            }
        }
    }
})();