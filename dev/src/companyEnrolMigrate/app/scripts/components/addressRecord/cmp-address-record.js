/**
 * Created by dkilty on 8/5/2016.
 */

(function () {
    'use strict';

    angular
        .module('addressRecord', [])
})();

(function () {
    'use strict';

    angular
        .module('addressRecord')
        .component('cmpAddressRecord', {
            templateUrl: 'app/scripts/components/addressRecord/tpl-address-record.html',
            controller: addressRecCtrl,
            controllerAs: 'addressRec',
            require: {
                trackRecordCtrl:    '^trackRecord'
            },
            bindings: {
                addressRecord: '<',
                onUpdate: '&',
                updateValid:'&',
                checkRoles:'&',
                onDelete:'&',
                isAmend:'&',
                isDetailValid:'&',
                isRoleSelected:'&'
            }
        });
        addressRecCtrl.$inject=['$scope']
    function addressRecCtrl($scope) {
        var vm = this;
        vm.savePressed = false;
        vm.isContact = true; //used to set the state of the role
        //TODO get  model from a servide
        vm.addressModel = {
            addressID: 1,
            companyName: "",
            amendRecord: false,
            addressRole: {
                manufacturer: false,
                mailing: false,
                billing: false,
                importer: false
            },
            street: "",
            city: "",
            provLov: "",
            stateList: "",
            stateText: "",
            country: "",
            postalCode: ""
        };
        vm.isOneSelected = function (type) {
            return (vm.isRoleSelected({roleName: type, id: vm.addressModel.addressId}));
        };
        vm.$onInit = function () {
            //after init do not initialise variables here onchanges is called first
            var rec = vm.trackRecordCtrl.trackRecord();
            //only bind if there is a record. Should never happen that there is no record
            if (rec) {
                vm.addressModel = angular.copy(rec);
                vm.addressModel.roleConcat = _getRolesConcat();
                //TODO check if empty, don't change focus
                angular.element(saveContact).trigger('focus');
            }
        };

        function _getRolesConcat() {
            var addressRoles = vm.addressModel.addressRole;
            var result = "";

            if (addressRoles.manufacturer) {
                result = result + " MAN"
            }
            if (addressRoles.billing) {
                result = result + " BILL"
            }
            if (addressRoles.mailing) {
                result = result + " MAIL"
            }
            if (addressRoles.repPrimary) {
                result = result + " IMP"
            }
            return result
        }

        /**
         * Due to binding with table expander this method does not get called
         * @param changes
         */
        vm.$onChanges = function (changes) {
            //how this is currently wired, this will never fire!
            if (changes.addressRecord.currentValue) {
                vm.addressModel = angular.copy(changes.addressRecord.currentValue);

            }
        };

        /**
         *  calls the delete function on the parent
         */
        vm.delete = function () {
            vm.onDelete({contactId: vm.addressModel.contactId});
        };
        /* @ngdoc method -discards the changes and reverts to the model
         *
         */
        vm.discardChanges = function () {
            if (vm.addressRecForm.$pristine) return;
            var currRecord = vm.trackRecordCtrl.trackRecord();
            vm.addressModel = angular.copy(currRecord);
            vm.isDetailValid({state: vm.addressRecForm.$valid});
            vm.savePressed = false;
        };

        vm.onContactRoleUpdate = function (newRole) {
            var aRole = {};
            angular.extend(aRole, newRole);
            vm.addressModel.addressRole = aRole;
            vm.updateContactModel2();
        };
        /**
         * @ngdoc method -Updates the parent on whether this record is valid or not
         */
        vm.updateValid = function () {
            vm.isDetailValid({state: (vm.addressRecForm.$valid && !vm.addressRecForm.$dirty)});
        };

        $scope.$watch('addressRec.addressRecForm.$dirty', function () {
            if (vm.addressRecForm.$dirty) {
                vm.isDetailValid({state: false})
            }
        }, true);

        /**
         * Updates the contact model used by the save button
         */
        vm.updateContactModel2 = function () {
            vm.addressModel.roleConcat = _getRolesConcat();
            if (vm.addressRecForm.$valid) {
                if (vm.addressRecForm.$valid) {
                    vm.isDetailValid({state: true});
                    vm.addressRecForm.$setPristine();
                    vm.onUpdate({rec: vm.addressModel});
                }
                vm.savePressed = true;
            }
            /**
             * @ngdoc method toggles error state to make errors visible
             * @returns {boolean}
             */
            vm.showErrors = function () {

                return (vm.savePressed)
            };
            /**
             * @ngdoc method used to determine if record should be editable. Used for amend
             * @returns {boolean}
             */
            vm.setNotEditable = function () {

                if (vm.isAmend() && !vm.addressModel.amendRecord) {
                    return true;
                }
                return false;
            }

        }
    }

})();