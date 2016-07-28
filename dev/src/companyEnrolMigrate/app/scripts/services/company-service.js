/**
 * Created by Abdessamad on 7/6/2016.
 */

(function () {
    'use strict';
    angular
        .module('dossierApp')
        .factory('CompanyService', CompanyService)

    function CompanyService() {
        // Define the CompanyService function
        function CompanyService() {
            //construction logic
           /* var defaultAddress = {
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
                provState: "",
                province_text: "",
                country: "",
                postalCode: ""
            };

            var defaultContact = {
                amendRecord: false,
                manufacturer: false,
                mailing: false,
                billing: false,
                importer: false,
                contactRole: "",
                salutation: "",
                givenName: "Test defualt",
                initials: "",
                surname: "",
                title: "",
                language: "",
                phone: "",
                phoneExt: "",
                fax: "",
                email: ""
            };*/

            var defaultCompanyData = {
                dataChecksum: "",
                enrolmentVersion: "0.0",
                dateSaved: "",
                applicationType: "NEW",
                softwareVersion: "1.0.0",
                companyId: "test",
                addressList: [],
                contactList: []
            };
            angular.extend(this._default, defaultCompanyData);
            this.addressID=0;
            this.contactID = 0;
        }

        CompanyService.prototype = {
            _default: {},
            createAddressRecord: function () {
                console.log("starting create recored")
                var defaultAddress = {
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
                    provState: "",
                    province_text: "",
                    country: "",
                    postalCode: ""
                };
                defaultAddress.addressID=this.getNextAddressID();
                return(defaultAddress);
            },
            createContactRecord: function () {
                console.log("starting create recored")
                var defaultContact = {
                    contactID: "",
                    amendRecord: false,
                    addressRole: {
                        manufacturer: false,
                        mailing: false,
                        billing: false,
                        importer: false
                    },
                    contactRole: "",
                    salutation: "",
                    givenName: "",
                    surname: "",
                    initials: "",
                    title: "",
                    phone: "",
                    phoneExt: "",
                    fax: ""
                };
                defaultContact.contactID = this.getNextContactID();
                return (defaultContact);
            },
            updateAddressID:function(value){
                if(isNaN(value)) return;
                if (value > this.addressID) {
                    this.addressID = value;
                }
            },
            getNextAddressID:function(){
                this.addressID=this.addressID+1;
              return (this.addressID);
            },
            resetAddressID:function(value){
              if(!value){
                  this.addressID = 0;
              }else {
                  this.addressID = value;
              }
            },
            updateContactID: function (value) {
                if (isNaN(value)) return;
                if (value > this.contactID) {
                    this.contactID = value;
                }
            },
            getNextContactID: function () {
                this.contactID = this.contactID + 1;
                return (this.contactID);
            },
            resetContactID: function (value) {
                if (!value) {
                    this.contactID = 0;
                } else {
                    this.contactID = value;
                }
            },


            transformFromFileObj: function (jsonObj) {
                var rootTag="COMPANY_ENROL"
                var companyInfo = this.getCompanyInfo(jsonObj[rootTag]);
                var addressInfo = this.getAddressList(jsonObj[rootTag].address_record);
                var contactInfo = this.getContactList(jsonObj[rootTag].contact_record);
                //get rid of previous default
                this._default = {};
                angular.extend(this._default, companyInfo, addressInfo, contactInfo)
                console.log("This is the transform " + JSON.stringify(this._default))
            },
            transformToFileObj: function () {
                //transform back to needed
                var jsonObj = this._default
                var resultJson = {
                    COMPANY_ENROL: {
                        data_checksum: jsonObj.dataChecksum,
                        enrolment_version: jsonObj.enrolmentVersion,
                        date_saved: jsonObj.dateSaved,
                        application_type: jsonObj.applicationType,
                        software_version: jsonObj.softwareVersion,
                        company_id: jsonObj.companyId,
                        address_record: _mapAddressListToOutput(jsonObj.addressList),
                        contact_record: _mapContactListToOutput(jsonObj.contactList)
                    }
                }
                return (resultJson);
            },
            getModelInfo: function () {
                return this._default;
            },
            //not sure why this is needed anymore
            getCompanyInfo: function (info) {
                if (!info)
                    return this._default;
                return {
                    dataChecksum: info.data_checksum,
                    enrolmentVersion: info.enrolment_version,
                    dateSaved: info.date_saved,
                    applicationType: info.application_type,
                    softwareVersion: info.software_version,
                    companyId: info.company_id,
                    addressList: [],
                    contactList: []
                }
            },
            //not sure why this is needed anymore
            getAddressList: function (adrList) {
                var list = [];
                if (adrList) {
                    for (var i = 0; i < adrList.length; i++) {
                        this.updateAddressID(parseInt(adrList[i].address_id))
                        var address = {};
                        address.addressID = adrList[i].address_id;
                        address.companyName = adrList[i].company_name;
                        address.amendRecord = adrList[i].amend_record === 'Y';
                        address.addressRole = {};
                        address.addressRole.manufacturer = adrList[i].manufacturer === 'Y';
                        address.addressRole.mailing = adrList[i].mailing === 'Y';
                        address.addressRole.billing = adrList[i].billing === 'Y';
                        address.addressRole.importer = adrList[i].importer === 'Y';
                        address.street = adrList[i].company_address_details.street_address;
                        address.city = adrList[i].company_address_details.city;
                        address.provState = adrList[i].company_address_details.province_lov;
                        address.country = adrList[i].company_address_details.country;
                        address.postalCode = adrList[i].company_address_details.postal_code;
                        list.push(address);
                    }
                }
                return list;
            },
            //right side is original json left side is translation
            getContactList: function (contacts) {
                var list = [];
                if (contacts) {
                    for (var i = 0; i < contacts.length; i++) {
                        var contact = {};
                        contact.contactID = contacts[i].contact_id;
                        contact.amendRecord = contacts[i].amend_record=== 'Y';
                        contact.manufacturer = contacts[i].manufacturer=== 'Y';
                        contact.mailing = contacts[i].mailing=== 'Y';
                        contact.billing = contacts[i].billing=== 'Y';
                        contact.importer = contacts[i].importer=== 'Y';
                        contact.contactRole = contacts[i].company_contact_details.rep_contact_role;
                        contact.salutation = contacts[i].company_contact_details.salutation;
                        contact.givenName = contacts[i].company_contact_details.given_name;
                        contact.initials = contacts[i].company_contact_details.initials;
                        contact.surname = contacts[i].company_contact_details.surname;
                        contact.title = contacts[i].company_contact_details.job_title;
                        contact.language = contacts[i].company_contact_details.language_correspondance;
                        contact.phone = contacts[i].company_contact_details.phone_num;
                        contact.phoneExt = contacts[i].company_contact_details.phone_ext;
                        contact.fax = contacts[i].company_contact_details.fax_num;
                        contact.email = contacts[i].company_contact_details.email;
                        list.push(contact);
                    }
                }
                return list;
            }
        };
        // Return a reference to the object
        return CompanyService;
    }

    String.prototype.capitalizeFirstLetter = function () {
        return this.charAt(0).toUpperCase() + this.slice(1).toLowerCase();
    };

    function _mapAddressListToOutput(adrList) {
        var addressList = [];
        if (adrList) {
            for (var i = 0; i < adrList.length; i++) {
                var address = {};
                address.address_id = adrList[i].addressID;
                address.amend_record = adrList[i].amendRecord === true ? 'Y' : 'N';
                address.manufacturer = adrList[i].manufacturer === true ? 'Y' : 'N';
                address.mailing = adrList[i].mailing;
                address.billing = adrList[i].billing;
                address.importer = adrList[i].importer;
                address.company_name = adrList[i].companyName;
                address.company_address_details = {};
                address.company_address_details.street_address = adrList[i].street;
                address.company_address_details.city = adrList[i].city;
                address.company_address_details.province_lov = adrList[i].provState;
                address.company_address_details.province_text = adrList[i].stateText;
                address.company_address_details.country = adrList[i].country;
                address.company_address_details.postal_code = adrList[i].postalCode;
                addressList.push(address);
            }
        }
        return addressList;
    }

    function _mapContactListToOutput(contacts) {
        var contactList = [];
        if (contacts) {
            for (var i = 0; i < contacts.length; i++) {
                var contact = {};
                contact.contact_id = contacts[i].contactID;
                contact.amend_record = contacts[i].amendRecord === true ? 'Y' : 'N';
                contact.manufacturer = contacts[i].manufacturer === true ? 'Y' : 'N';
                contact.mailing = contacts[i].mailing === true ? 'Y' : 'N';
                contact.billing = contacts[i].billing === true ? 'Y' : 'N';
                contact.importer = contacts[i].importer === true ? 'Y' : 'N';
                contact.rep_contact_role = contacts[i].contactRole;
                contact.company_contact_details = {};
                contact.company_contact_details.salutation = contacts[i].salutation;
                contact.company_contact_details.given_name = contacts[i].givenName;
                contact.company_contact_details.initials = contacts[i].initials;
                contact.company_contact_details.surname = contacts[i].surname;
                contact.company_contact_details.job_title = contacts[i].title;
                contact.company_contact_details.language_correspondance = contacts[i].language;
                contact.company_contact_details.phone_num = contacts[i].phone;
                contact.company_contact_details.phone_ext = contacts[i].phoneExt;
                contact.company_contact_details.fax_num = contacts[i].fax;
                contact.company_contact_details.email = contacts[i].email;
                contactList.push(contact);
            }
        }
        return contactList;
    }
})();
