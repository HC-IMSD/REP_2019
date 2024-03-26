/**
 * Created by Abdessamad on 7/6/2016.
 */

(function () {
    'use strict';

    angular
        .module('companyService', ['dataLists', 'hpfbConstants', 'VersionServiceModule']);
})();

(function () {
    'use strict';
    angular
        .module('companyService')
        .factory('CompanyService', CompanyService);

    CompanyService.$inject = ['$filter', '$translate', 'getCountryAndProvinces', 'XSL_PREFIX', 'VersionService'];
    function CompanyService($filter, $translate, getCountryAndProvinces, XSL_PREFIX, VersionService) {

        var versions = VersionService.getVer();
        // console.log(JSON.stringify(versions.CO));
        var xslName = "REP_CO_" + versions.CO.major + "_" + versions.CO.minor + ".xsl";
        var currentSoftwareVersion = versions.CO.major + "." + versions.CO.minor + "." + versions.CO.patch;
        console.log("CO version is "+currentSoftwareVersion);

        // Define the CompanyService function
        function CompanyService() {
            //construction logic
            var defaultCompanyData = {
                dataChecksum: "",
                enrolmentVersion: "0.0",
                dateSaved: "",
                applicationType: "NEW",
                softwareVersion: currentSoftwareVersion,
                companyId: "",
                reasonAmend:"",
                addressList: [],
                contactList: []

                /**importerProducts: {
                    selectedProducts: "",
                    dossierIdList: []
                }*/

            };
            angular.extend(this._default, defaultCompanyData);
            this.addressID = 0;
            this.contactId = 0;
            // this.xslFileName = XSL_PREFIX + "REP_CO_2_2.xsl";
            this.xslFileName = xslName;
            this.helpTextSequences = {
                loadFileInx: 0,
                enrolIdx: 0,
                fillingIdx:0,
                addressIdx: 0,
                businessIdx: 0,
                addRoleIdx: 0,
                companyRepIdx: 0,
                routingIdIdx: 0
            };

            var keys = Object.keys(this.helpTextSequences);
            for (var i = 0; i < keys.length; i++) {
                this.helpTextSequences[keys[i]] = i + 1;
            }
        }
        //TODO rewrite this object to proper prototype syntax
        CompanyService.prototype = {
            _default: {},

            getNumberKeys: function (obj) {
                var numKeys = 0;
                //get the number of keys in the model
                for (var prop in obj) {
                    if (obj.hasOwnProperty(prop)) {
                        numKeys++;
                    }
                }
                return numKeys;
            },
            getApplicationTypes: function () {
                return (["NEW", "AMEND", "FINAL"])
            },
            getApprovedType: function () {
                return "FINAL";
            },
            getAmendType: function () {
                return "AMEND";
            },
            getXSLFileName: function () {
                return this.xslFileName;
            },
            createAddressRole: function () {
                var defaultAddressRole = {
                    manufacturer: false,
                    mailing: false,
                    billing: false
                    // importer: false
                };
                return (defaultAddressRole);
            },
            createContactRole: function () {
                var defaultContactRole = {
                    manufacturer: false,
                    mailing: false,
                    billing: false,
                   // importer: false,
                   //  repPrimary: false
                    // repSecondary: false
                };
                return (defaultContactRole);
            },
            createAddressRecord: function () {
                var defaultAddress = {
                    addressID: 1,
                    companyName: "",
                    businessNumber: "",
                    // importerID: "",
                    addressRole: {
                        manufacturer: false,
                        mailing: false,
                        billing: false
                        // importer: false
                    },
                    street: "",
                    city: "",
                    stateList: "",
                    stateText: "",
                    country: "",
                    postalCode: ""

                    /**importerProducts: {
                        selectedProducts: "",
                        dossierIdList: []
                    }*/

                };
                defaultAddress.addressID = this.getNextAddressID();
                return (defaultAddress);
            },
            createContactRecord: function () {

                var defaultContact = {
                    contactId: 1,
                    addressRole: {
                        manufacturer: false,
                        mailing: false,
                        billing: false,
                        // importer: false,
                        // repPrimary: false
                        // repSecondary: false
                    },
                    contactRole: "",
                   // salutation: "",
                    givenName: "",
                    surname: "",
                    initials: "",
                    title: "",
                    phone: "",
                    phoneExt: "",
                    fax: "",
                    email: "",
                    routingId: ""
                    // impCompanyName: ""
                };
                defaultContact.contactId = this.getNextContactID();
                return (defaultContact);
            },
            /**createImporterProductRecord: function () {
                var importerRecord = {
                    "selectedProducts": "",
                    "dossierIdList": []
                };
                return importerRecord;
            },*/

            updateAddressID: function (value) {
                if (isNaN(value)) return;
                if (value > this.addressID) {
                    this.addressID = value;
                }
            },
            getNextAddressID: function () {
                this.addressID = this.addressID + 1;
                return (this.addressID);
            },
            resetAddressID: function (value) {
                if (!value) {
                    this.addressID = 0;
                } else {
                    this.addressID = value;
                }
            },
            updateContactID: function (value) {
                if (isNaN(value)) return;
                if (value > this.contactId) {
                    this.contactId = value;
                }
            },
            getNextContactID: function () {
                this.contactId = this.contactId + 1;
                return (this.contactId);
            },
            resetContactID: function (value) {
                if (!value) {
                    this.contactId = 0;
                } else {
                    this.contactId = value;
                }
            },
            getRootTag:function(){
                return "COMPANY_ENROL";
            },
            /**
             * @ngdoc mehtod converts the file json to object model
             * @param jsonObj
             */
            transformFromFileObj: function (jsonObj) {
                var rootTag = this.getRootTag();
                var companyInfo = this.getCompanyInfo(jsonObj[rootTag]);
                var addressInfo = {addressList: this.getAddressList(jsonObj[rootTag].address_record)};
                var contactInfo = {contactList: this.getContactList(jsonObj[rootTag].contact_record)};
                //get rid of previous default
                this._default = {};
                angular.extend(this._default, companyInfo, addressInfo, contactInfo)
            },
            transformToFileObj: function (jsonObj) {
                //transform back to needed
                var rootTag = "COMPANY_ENROL"; //TODO needs to be a global
                var resultJson = {
                    COMPANY_ENROL: {
                        template_type: "PHARMA",
                        data_checksum: jsonObj.dataChecksum,
                        enrolment_version: jsonObj.enrolmentVersion,
                        date_saved: jsonObj.dateSaved,
                        application_type: jsonObj.applicationType,
                        software_version: currentSoftwareVersion,
                        company_id: jsonObj.companyId,
                        reason_amend: jsonObj.reasonAmend,
                        address_record: _mapAddressListToOutput(jsonObj.addressList, $translate), //TODOremoved zero index
                        contact_record: _mapContactListToOutput(jsonObj.contactList, $translate)
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
                    reasonAmend: info.reason_amend,
                    addressList: [],
                    contactList: []
                }
            },
            //not sure why this is needed anymore
            getAddressList: function (adrList) {
                var list = [];
                if (!adrList) return list;
                if (!(adrList instanceof Array)) {
                    //make it an array, case there is only one
                    adrList = [adrList]
                }


                for (var i = 0; i < adrList.length; i++) {
                    this.updateAddressID(parseInt(adrList[i].address_id));
                    var address = {};
                    address.addressID = adrList[i].address_id;
                    address.companyName = adrList[i].company_name;
                    address.businessNumber = adrList[i].business_number;
                    // address.importerID = adrList[i].importer_id;
                    address.addressRole = {};
                    address.addressRole.manufacturer = adrList[i].manufacturer === 'Y';
                    address.addressRole.mailing = adrList[i].mailing === 'Y';
                    address.addressRole.billing = adrList[i].billing === 'Y';
                    // address.addressRole.importer = adrList[i].importer === 'Y';
                    address.street = adrList[i].company_address_details.street_address;
                    address.city = adrList[i].company_address_details.city;
                    // address.stateList = adrList[i].company_address_details.province_lov;
                    if (adrList[i].company_address_details.province_lov) {
                        address.stateList = adrList[i].company_address_details.province_lov._id;
                        if(address.stateList === "MO"){
                            address.stateList = "MOS";
                        }
                    } else {
                        address.stateList = "";
                    }
                    address.stateText = adrList[i].company_address_details.province_text;
                    address.country = "";
                    var currentLang = $translate.proposedLanguage() || $translate.use();
                    if (adrList[i].company_address_details.country._id) {
                        address.country = $filter('filter')(getCountryAndProvinces.getCountries(), {id: adrList[i].company_address_details.country._id})[0];
                        address.countryHtml = $translate.instant(address.country.id, "", '', currentLang);
                        address.countryDisplay = address.country.id;
                    }
                    address.postalCode = adrList[i].company_address_details.postal_code;
                   // if(address.addressRole.importer){
                       // address.importerProducts= this.getImporterInfo(adrList[i].importer_products);

                    //}
                    list.push(address);
                }

                return list;
            },
            /**getImporterInfo: function(jsonObj){
                var result=this.createImporterProductRecord();

                if(!jsonObj) return result;
                result.selectedProducts=jsonObj.selected_products;
                var dossierIdList=jsonObj.dossier_id;
                if(!dossierIdList) return result; //case where ALL selected
                if (!(dossierIdList instanceof Array)) {
                    dossierIdList=[dossierIdList];
                }
                for(var i=0;i<dossierIdList.length;i++){
                    var newRec={"dossierId":dossierIdList[i]};
                    result.dossierIdList.push(newRec);
                }
                return result;
            },*/

            //right side is original json left side is translation ;oading
            getContactList: function (contacts) {
                var list = [];
                if (!contacts) return list;
                if (!(contacts instanceof Array)) {
                    //make it an array, case there is only one
                    contacts = [contacts]
                }

                for (var i = 0; i < contacts.length; i++) {
                    var contact = {};
                    var contact_rec_index = contacts[i].contact_id;
                    contact.contactId = contact_rec_index;
                    this.updateContactID(contact_rec_index);
                    contact.addressRole = {};
                    contact.addressRole.manufacturer = contacts[i].manufacturer === 'Y';
                    contact.addressRole.mailing = contacts[i].mailing === 'Y';
                    contact.addressRole.billing = contacts[i].billing === 'Y';
                    // contact.addressRole.importer = contacts[i].importer === 'Y';
                    // contact.addressRole.repPrimary = contacts[i].rep_primary === 'Y';
                    contact.addressRole.repSecondary = contacts[i].rep_secondary === 'Y';
                    //contact.contactRole = contacts[i].company_contact_details.rep_contact_role;
                   // contact.salutation = contacts[i].company_contact_details.salutation;
                    contact.givenName = contacts[i].company_contact_details.given_name;
                    contact.initials = contacts[i].company_contact_details.initials;
                    contact.surname = contacts[i].company_contact_details.surname;
                    contact.title = contacts[i].company_contact_details.job_title;
                    contact.language = contacts[i].company_contact_details.language_correspondance._id;
                    contact.phone = contacts[i].company_contact_details.phone_num;
                    contact.phoneExt = contacts[i].company_contact_details.phone_ext;
                    contact.fax = contacts[i].company_contact_details.fax_num;
                    contact.email = contacts[i].company_contact_details.email;
                    contact.routingId = contacts[i].company_contact_details.RoutingID;
                    // contact.impCompanyName = contacts[i].company_contact_details.imp_company_name;
                    list.push(contact);
                }
                return list;
            },

            concatenateContactRole: function (contactModel) {
                var roles = contactModel.addressRole;
                var result = "";

                if (roles.manufacturer) {
                    result = result + " MFR"
                }
                if (roles.billing) {
                    result = result + " BILL"
                }
                if (roles.mailing) {
                    result = result + " MAIL"
                }
                return result;
            }
        };

        // Return a reference to the object
        return CompanyService;
    }

    String.prototype.capitalizeFirstLetter = function () {
        return this.charAt(0).toUpperCase() + this.slice(1).toLowerCase();
    };

    function _mapAddressListToOutput(adrList, $translate) {
        var addressList = [];
        var currentLang = $translate.proposedLanguage() || $translate.use();
        if (adrList) {
            for (var i = 0; i < adrList.length; i++) {
                var address = {};
                address.address_id = adrList[i].addressID;
                address.manufacturer = adrList[i].addressRole.manufacturer === true ? 'Y' : 'N';
                address.mailing = adrList[i].addressRole.mailing === true ? 'Y' : 'N';
                address.billing = adrList[i].addressRole.billing === true ? 'Y' : 'N';
                // address.importer = adrList[i].addressRole.importer === true ? 'Y' : 'N';
                address.company_name = adrList[i].companyName;
                address.business_number = adrList[i].businessNumber;
                // address.importer_id = adrList[i].importerID;
                address.company_address_details = {};
                address.company_address_details.street_address = adrList[i].street;
                address.company_address_details.city = adrList[i].city;
                // address.company_address_details.province_lov = adrList[i].stateList;
                if (adrList[i].stateList) {
                    if (adrList[i].stateList === "MOS") {
                    address.company_address_details.province_lov = {
                            _id: "MO",
                            __text: "Missouri"
                        };
                    } else {
                        address.company_address_details.province_lov = {
                            _id: adrList[i].stateList,
                            __text: $translate.instant(adrList[i].stateList, "", '', currentLang)
                        };
                    }
                } else {
                    address.company_address_details.province_lov = "";
                }
                address.company_address_details.province_text = adrList[i].stateText;
                address.company_address_details.country = "";
                if (adrList[i].country) {
                    address.company_address_details.country = {
                        _id: adrList[i].country.id,
                        _label_en: adrList[i].country.en,
                        _label_fr: adrList[i].country.fr,
                        __text: $translate.instant(adrList[i].country.id, "", '', currentLang)
                    };
                }
                // address.company_address_details.country = adrList[i].country;
                address.company_address_details.postal_code = adrList[i].postalCode;
                //if(adrList[i].addressRole.importer){
                  //  address.importer_products=_mapImporterInfoToOutput( adrList[i].importerProducts);
                //}



                addressList.push(address);
            }
        }
        return addressList;
    }

    function _mapContactListToOutput(contacts, $translate) {
        var contactList = [];
        var currentLang = $translate.proposedLanguage() || $translate.use();
        if (contacts) {
            for (var i = 0; i < contacts.length; i++) {
                var contact = {};
                contact.contact_id = contacts[i].contactId;
                contact.manufacturer = contacts[i].addressRole.manufacturer === true ? 'Y' : 'N';
                contact.mailing = contacts[i].addressRole.mailing === true ? 'Y' : 'N';
                contact.billing = contacts[i].addressRole.billing === true ? 'Y' : 'N';
               // contact.importer = contacts[i].addressRole.importer === true ? 'Y' : 'N';
               //  contact.rep_primary = contacts[i].addressRole.repPrimary === true ? 'Y' : 'N';
                // contact.rep_secondary = contacts[i].addressRole.repSecondary === true ? 'Y' : 'N';
                //contact.rep_contact_role = contacts[i].addressRole.contactRole === true ? 'Y' : 'N';
                contact.company_contact_details = {};
               // contact.company_contact_details.salutation = contacts[i].salutation;
                contact.company_contact_details.given_name = contacts[i].givenName;
                contact.company_contact_details.initials = contacts[i].initials;
                contact.company_contact_details.surname = contacts[i].surname;
                contact.company_contact_details.job_title = contacts[i].title;
                contact.company_contact_details.language_correspondance = {
                    _id: contacts[i].language,
                    __text: $translate.instant(contacts[i].language, "", '', currentLang)
                };
                contact.company_contact_details.phone_num = contacts[i].phone;
                contact.company_contact_details.phone_ext = contacts[i].phoneExt;
                contact.company_contact_details.fax_num = contacts[i].fax;
                contact.company_contact_details.email = contacts[i].email;
                contact.company_contact_details.RoutingID = contacts[i].routingId;
                // contact.company_contact_details.imp_company_name = contacts[i].impCompanyName;
                contactList.push(contact);
            }
        }
        return contactList;
    }

    /***
     * Maps the adress importer information to the output xml definition
     * @param jsonObj
     * @returns object
     * @private
     */
    /**function _mapImporterInfoToOutput(jsonObj){
        var importerInfo={};
        if(!jsonObj) return importerInfo;
        importerInfo.selected_products=jsonObj.selectedProducts;
        if(jsonObj.dossierIdList && jsonObj.dossierIdList.length>0){
            importerInfo.dossier_id=[];
            for(var i=0;i<jsonObj.dossierIdList.length;i++){
                importerInfo.dossier_id.push(jsonObj.dossierIdList[i].dossierId);
            }
        }
        return importerInfo;
    }*/

})();
