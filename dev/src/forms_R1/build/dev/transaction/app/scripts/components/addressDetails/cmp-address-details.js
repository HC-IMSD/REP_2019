/**
 * Created by Abdessamad on 6/29/2016.
 */


(function () {
    'use strict';

    angular
        .module('addressModule', [
            'hpfbConstants',
            'dataLists',
            'filterLists',
            'ui.select',
            'errorMessageModule'

        ])
})();

(function () {
    'use strict';
    angular
        .module('addressModule')
        .config(function (uiSelectConfig) {
            //choices: select2, bootstrap, selectize
            uiSelectConfig.theme = 'select2';
        })
        .component('cmpAddressDetails', {
            templateUrl: 'app/scripts/components/addressDetails/tpl-address-details.html',
            controller: addressCtrl,
            controllerAs: 'adr',
            bindings: {
                addressRecord: '<',
                onUpdate: '&', //no longer used TBD should be removed
                showErrors: '&',
                isAmend: '<',
                updateErrorSummary:'&',
                fieldSuffix:'<',
                countryEditable:'<',
                updateCountry:'<'
            }
        });
    addressCtrl.$inject = ['getCountryAndProvinces','$translate','CANADA','USA','$scope'];

    function addressCtrl( getCountryAndProvinces,$translate, CANADA,USA, $scope) {

        var vm = this;
        vm.isEditable = true;
        //put model updates in ng-change but defer on blur. Now model updates on blur only if it changed
        vm.ngModelOptSetting = {updateOn: 'blur'};
        vm.lang = $translate.proposedLanguage() || $translate.use();
        vm.addressModel = {
            addressID: "",
            isDetailValid: false,
            street: "",
            city: "",
            country: "",
            countryHtml: "",
            countryDisplay:"",
            stateLov: "",
            stateText: "",
            postalCode: ""
        };

        vm.countryIsEditable=true; //default to true in case binding not set
        vm.canadianPostalCodePattern = '^(?!.*[DFIOQU])[A-VXYa-vxy][0-9][A-Za-z] ?[0-9][A-Za-z][0-9]$';

        vm.usaZipCode = '^[0-9]{5}(?:-[0-9]{4})?$';
        vm.hideProvinceText = false;
        vm.showProvince = false;
        vm.showState = false;
        vm.countryList= getCountryAndProvinces.getCountries();
        vm.fdId="";
       // vm.postalError="MSG_ERR_POSTAL";
        vm.requiredOnly = [{type: "required", displayAlias: "MSG_ERR_MAND"}];
        vm.postalErrorList = [{type: "required", displayAlias: "MSG_ERR_MAND"},{type: "pattern", displayAlias: "POSTAL_FORMAT"}];
        vm.provStateErrorName = "PROVSTATE";
        vm.focusOnProvinceState = false;
        vm.$onInit = function () {

            if (vm.addressRecord) {
                //vm.addressModel = angular.extend({},vm.addressRecord); THIS causes focus grief
                vm.addressModel = vm.addressRecord;
                vm.provListLabel = getProvinceListLabel();
                vm.postalLabel = getPostalLabel();
                vm.isPostalRequired = isPostalRequiredFn();
                vm.provinces = getProvinceStateList();
                vm.hideProvinceText = getProvinceTextState();
                vm.postalPattern = getPostalPattern();
                vm.hideProvinceDdl = !vm.hideProvinceText;
            }
            _setIdNames();
        };
        /**
         * @ngdoc method updates if the model changes
         * @param changes
         */
        vm.$onChanges = function (changes) {
            if (changes.addressRecord) {
                vm.addressModel = changes.addressRecord.currentValue;
                vm.countryChanged();
            }
            if (changes.isAmend) {
                vm.isEditable = changes.isAmend.currentValue;
            }
            if(changes.fieldSuffix) {
                vm.fldId = changes.fieldSuffix.currentValue;
                if (!vm.fldId) {
                    vm.fldId = "";
                }
            }
             if(changes.updateCountry){
                 vm.countryChanged();
             }

            if(changes.countryEditable){
                vm.countryIsEditable=changes.countryEditable.currentValue;
                if(angular.isUndefined(vm.countryIsEditable)){
                    vm.countryIsEditable=true;
                }
            }
        };
        /**
         * Updates the display value for the object for summary display
         */
        vm.countryChanged=function(){
           // console.log("jang test:" + vm.addressModel.country.id);
            if( vm.addressModel.country.id !== undefined && (vm.addressModel.country.en === vm.addressModel.countryHtml || vm.addressModel.country.fr === vm.addressModel.countryHtml)) {
                vm.addressModel.countryDisplay = vm.addressModel.country.id;
                vm.provListLabel = getProvinceListLabel();
                vm.postalLabel = getPostalLabel();
                vm.isPostalRequired = isPostalRequiredFn();
                vm.provinces = getProvinceStateList();
                vm.hideProvinceText = getProvinceTextState();
                vm.postalPattern = getPostalPattern();
                vm.hideProvinceDdl = !vm.hideProvinceText;
                vm.isCountryCanada();
            }
            else {
                vm.addressModel.countryHtml = "";
                vm.addressModel.countryDisplay = "";
                vm.isPostalRequired = false;
                vm.hideProvinceText = false;
                vm.showProvince = false;
                vm.showState = false;
                vm.hideProvinceDdl = !vm.hideProvinceText;
                vm.postalLabel = getPostalLabel();
            }
            vm.updateErrorSummary();
        };

        vm.isCountryCanada=function(){
          if(!vm.addressModel || !vm.addressModel.country){
              vm.postalErrorList = [{type: "required", displayAlias: "MSG_ERR_MAND"},{type: "pattern", displayAlias: "POSTAL_FORMAT"}];
              return false;
          }
           else if(vm.addressModel.country.id===CANADA){
              vm.postalErrorList = [{type: "required", displayAlias: "MSG_ERR_MAND"},{type: "pattern", displayAlias: "POSTAL_FORMAT"}];
                return true;
            }else{
              vm.postalErrorList = [{type: "required", displayAlias: "MSG_ERR_MAND"},{type: "pattern", displayAlias: "POSTAL_FORMAT"}];
            }
            return false
        };

        vm.showError = function (ctrl) {

            if (!ctrl) {
                return false
            }
            if ((ctrl.$invalid && ctrl.$touched) || (vm.showErrors() && ctrl.$invalid )) {
                return true
            }
            return false
        };


        vm.onDeleteButtonClick = function () {
            vm.onDelete({addressId: vm.addressModel.addressID});
        };

        vm.onDiscardButtonClick = function () {
            vm.addressModel = angular.extend({}, vm.addressRecord);
            vm.addressForm.$setPristine();
        };
        vm.isCountryEditable=function(){
          return(vm.isEditable &&vm.countryIsEditable)
        };


        /**
         * @ngdoc method formats canadian postal code to upper and space
         */
        vm.postalCodeChanged=function(){
            var postal=vm.addressModel.postalCode;
            if(!postal) return;
            postal= postal.toUpperCase();
            if(postal.length==6 && vm.addressModel.country.id === CANADA){
                postal=postal.substring(0,3)+" "+postal.substring(3,postal.length)
            }
            vm.addressModel.postalCode=postal;
            vm.updateErrorSummary();
        };
        var getProvinceTextState = function () {

            var isCanOrUsa = isPostalRequiredFn();

            if (isCanOrUsa) {
                vm.addressModel.stateText = "";

            } else {
                vm.addressModel.stateList = "";
            }

            return isCanOrUsa;
        };

        var isPostalRequiredFn = function () {
            return (vm.addressModel.country.id === CANADA || vm.addressModel.country.id === USA);
        };

        var getProvinceStateList = function () {

            if (vm.addressModel.country.id === CANADA) {
                vm.showProvince = true;
                vm.showState = false;
                return getCountryAndProvinces.getProvinces();

            }
            else if (vm.addressModel.country.id === USA) {
                vm.showProvince = false;
                vm.showState = true;
                return getCountryAndProvinces.getUSStates();
            } else {
                vm.showProvince = false;
                vm.showState = false;
            }
        };

        var getProvinceListLabel = function () {
           // if(!vm.addressModel || !vm.addressModel.country) return "PROVINCE";
            var label = (vm.addressModel.country.id === USA) ? "STATE" : "PROVINCE";
            return label;
        };


        var getPostalLabel = function () {
            var label = (vm.addressModel.country.id === USA) ? "ZIP" : "POSTAL";
            return label;
        };

        var getPostalPattern = function () {
            var postalPtrn = null;
            if (vm.addressModel.country.id === USA) {
                postalPtrn = /^[0-9]{5}(?:-[0-9]{4})?$/;
            } else if (vm.addressModel.country.id === CANADA) {
                postalPtrn = /^(?!.*[DFIOQU])[A-VXYa-vxy][0-9][A-Za-z] ?[0-9][A-Za-z][0-9]$/;
            }

            return postalPtrn;
        }


        function _setIdNames() {
            var scopeId = vm.fldId+ "_" + $scope.$id;
            vm.streetId = "STREET" + scopeId;
            vm.cityId = "CITY" + scopeId;
            vm.countryId = "COUNTRY" + scopeId;
            vm.stateTextId = "proveState" + scopeId;
            vm.stateListId = "state" + scopeId;
            vm.provinceListId = "province" + scopeId;
            vm.postalId = "postal" + scopeId;
            vm.zipId = "zip" + scopeId;
        }
        vm.countryChange = function() {
            var found = false;
            for(var i = 0; i < vm.countryList.length; i++) {
                var option =vm.countryList[i];
                if(option[vm.lang] === vm.addressModel.countryHtml) {
                    vm.addressModel.country = option;
                    found = true;
                    break;
                }
            }
            if( ! found ){
                vm.addressModel.countryHtml = "";
                if(vm.addressModel.country != "" && vm.addressModel.country.id != ""){
                    vm.addressModel.country = {};
                }
                vm.addressModel.countryDisplay = "";
            }
            vm.countryChanged();
        }
        vm.countryTabKey = function(){
            vm.focusOnProvinceState = true;
        }
        vm.leaveProvinceState = function(){
            vm.focusOnProvinceState = false;
        }
        // component only has one field, just watch this field for changes to update error summary
        $scope.$watch('adr.addressForm.$error', function () {
            vm.updateErrorSummary();
        }, true);

    }

})();


