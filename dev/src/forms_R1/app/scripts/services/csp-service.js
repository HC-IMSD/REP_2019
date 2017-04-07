/**
 * Created by dkilty on 04/04/2017.
 */

(function () {
    'use strict';

    angular
        .module('cspService', ['hpfbConstants']);
})();

(function () {
    'use strict';
    angular
        .module('cspService')
        .factory('CspService', CspService);

    CspService.$inject = ['$filter', 'NO', 'YES', 'PHARMA_TYPE'];
    function CspService($filter, NO, YES, PHARMA_TYPE) {

        function CspService() {
            //constructorlogic
            /*var defaultCSPData = {
             dataChecksum: "",
             enrolmentVersion: "0.0",
             dateSaved: "",
             softwareVersion: "1.0.0"
             }; //TODO appl Info*/

            var defaultCSPData = this.getEmptyInternalModel();
            this.rootTag = "CERTIFICATE_SUPPLEMENTARY_PROTECTION";
            this.billingType = "BILLING";
            this.applicantType = "APPLICANT";
            angular.extend(this._default, defaultCSPData);
        }


        CspService.prototype._default = {};

        CspService.prototype.getRootTag = function () {
            return (this.rootTag);
        };
        CspService.prototype.getModelInfo = function () {
            return this._default;
        };

        /**
         * Transforms the internal data model to the external data model
         *
         * @param jsonObj
         */
        CspService.prototype.transformToFileObj = function (jsonObj) {
            //this.createExternalApplicantRecord()
            if (!jsonObj) return null;
            var model = {};
            var rootTag = this.getRootTag();
            model[rootTag] = {};
            model[rootTag] = this.createEmptyExternalModel();
            console.log("empty model");
            console.log(model);
            model[rootTag].template_type = PHARMA_TYPE;
            model[rootTag].enrolment_version = jsonObj.enrolmentVersion;
            model[rootTag].date_saved = jsonObj.dateSaved;
            model[rootTag].software_version = "1.0.0";
            model[rootTag].data_checksum = "";
            var hcOnly = model[rootTag].health_canada_only;
            hcOnly.company_id = jsonObj.healthCanadaOnly.companyId;
            hcOnly.date_received = jsonObj.healthCanadaOnly.dateReceived;
            hcOnly.hc_notes = jsonObj.healthCanadaOnly.hcNotes;

            //application info mapping
            var extInfo = model[rootTag].application_info;
            var intInfo = jsonObj, applicationInfo;
            extInfo.control_number = intInfo.controlNumber;
            extInfo.drug_use = intInfo.drugUse;
            extInfo.time_application = intInfo.timeApplication;
            extInfo.medicinal_ingredient = intInfo.medicinalIngredient;
            extInfo.applicant_statement = intInfo.applicantStatement;
            //patent info
            var extPatent = extInfo.patent_info;
            var intPatent = jsonObj.patent;
            extPatent.patent_number = intPatent.patentNumber;
            extPatent.filing_date = intPatent.filingDate;
            extPatent.granted_date = intPatent.grantedDate;
            extPatent.expiry_date = intPatent.expiryDate;
            var extTimely = model[rootTag].timely_submission_info;
            var intTimely = jsonObj.timelySubmission;
            extTimely.timely_submission_statement = intTimely.submissionStatement;
            extTimely.marketing_approval_date = intTimely.approvalDate;
            extTimely.marketing_country = intTimely.country;
            extTimely.marketing_country_eu = intTimely.otherCountry;
            var extPayment = model[rootTag].advanced_payment;
            var intPayment = jsonObj.payment;
            extPayment.advanced_payment_type = intPayment.advancedPaymentType;
            extPayment.advanced_payment_fee = intPayment.advancedPaymentFee;
            var extCertification = model[rootTag].certification;
            var intCertification = jsonObj.certification;
            extCertification.given_name = intCertification.givenName;
            extCertification.initials = intCertification.initials;
            extCertification.surname = intCertification.surname;
            extCertification.job_title = intCertification.jobTitle;
            extCertification.date_signed = intCertification.dateSigned;

            model[rootTag].applicant = this._transformApplicantInfoForOutput(jsonObj.applicant);

            return model;
        };
        /***
         * Transform to the internal data model
         * @param jsonObj
         * @returns {*}
         */
        CspService.prototype.transformFromFileObj = function (jsonObj) {
            var resultJson = this.getEmptyInternalModel();
            //TODO
            return resultJson;
        };


        /* CspService.prototype.createApplicantRecord = function () {
         var record=this.createContactRecord();
         record.applicantName="";
         return record
         };*/

        CspService.prototype.createApplicantRecord = function (isApplicant) {
            var record = this.createContactRecord();
            record.applicantName = "";
            if (!isApplicant) {
                record.role.applicant = false;
                record.role.billing = true;
            } else {
                record.role.applicant = true;
                record.role.billing = true;
            }
            return record;
        };
        CspService.prototype.createContactRecord = function () {
            var applicant = {};
            applicant.role = {
                applicant: true,
                billing: true
            };
            applicant.contact = {
                salutation: "",
                givenName: "",
                surname: "",
                initials: "",
                title: "",
                phone: "",
                phoneExt: "",
                fax: "",
                email: ""
            };
            applicant.address = {
                street: "",
                city: "",
                stateList: "",
                stateText: "",
                country: "",
                postalCode: ""

            };
            return applicant
        };
        /**
         * Adds an applicant to the model. Determines if it should be a billing applicant
         * and updates the roles as appropiate
         */
        CspService.prototype.addApplicantToModel = function () {
            if (!this._default.applicant) {
                this._default.applicant = [];
            }
            var numberRecords = this._default.applicant.length;
            if (numberRecords === 0) {
                //this should never happen.....
                this._default.applicant.push(this.createApplicantRecord(true));
            } else if (numberRecords == 1) {
                this._default.applicant[0].role.applicant = true;
                this._default.applicant[0].role.billing = false;
                this._default.applicant.push(this.createApplicantRecord(false));
            } else {
                console.warn("Tried to add an applicant when there were 2 records")
            }
            // defaultCSPData.applicant=[this.createApplicantRecord()];
        };
        /**
         * Deletes the billing address only. Checks each record for billing role to be true
         */
        CspService.prototype.deleteApplicant = function () {
            if (!this._default.applicant) {
                this._default.applicant = [];
            }
            var numberRecords = this._default.applicant.length;
            if (numberRecords === 0 || numberRecords === 1) {
                //console.warn("Tried to delete applicant when there was only 1 or zero")
                //this case can happen as a record could be doing this blind
                return;
            } else {

                for (var i = 0; i < numberRecords; i++) {
                    var record = this._default.applicant[i];
                    if (record.role.billing === true) {
                        this._default.applicant.splice(i, 1);
                    }
                }
                //update the remaining record to have both the billing and applicant roles
                this._default.applicant[0].role.applicant = true;
                this._default.applicant[0].role.billing = true;
            }
        };
        CspService.prototype.getMarketingCountries = function () {
            return ([
                'USA',
                'CHE',
                'AUS',
                'EU',
                'JPN',
                'EU_OTHER'
            ]);
        };
        CspService.prototype.getAdvancedPaymentTypes = function () {
            return ([
                'FINANCIAL',
                'CHEQUE',
                'CREDIT_CARD',
                'CREDIT',
                'WIRE'
            ]);
        };
        CspService.prototype.getDrugUses = function () {
            return ([
                "HUMAN",
                "VETERINARY"
            ]);
        };

        CspService.prototype.getEmptyInternalModel = function () {
            var defaultCSPData = {};
            defaultCSPData.dataChecksum = "";
            defaultCSPData.enrolmentVersion = "0.0";
            defaultCSPData.dateSaved = "";
            defaultCSPData.softwareVersion = "";
            //TODO appl Info
            defaultCSPData.applicant = [this.createApplicantRecord(true)];
            defaultCSPData.healthCanadaOnly = {};
            defaultCSPData.healthCanadaOnly.companyId = "";
            defaultCSPData.healthCanadaOnly.dateReceived = "";
            defaultCSPData.healthCanadaOnly.applicationId = "";
            defaultCSPData.healthCanadaOnly.hcNotes = "";
            defaultCSPData.patent = {};
            defaultCSPData.patent.patentNumber = "";
            defaultCSPData.patent.filingDate = "";
            defaultCSPData.patent.grantedDate = "";
            defaultCSPData.patent.expiryDate = "";
            defaultCSPData.applicationInfo = {};
            defaultCSPData.applicationInfo.controlNumber = "";
            defaultCSPData.applicationInfo.drugUse = "";
            defaultCSPData.applicationInfo.timeApplication = "";
            defaultCSPData.applicationInfo.medicinalIngredient = "";
            defaultCSPData.applicationInfo.applicantStatement = "";
            defaultCSPData.timelySubmission = {};
            defaultCSPData.timelySubmission.submissionStatement = "";
            defaultCSPData.timelySubmission.approvalDate = "";
            defaultCSPData.timelySubmission.country = "";
            defaultCSPData.timelySubmission.otherCountry = "";
            defaultCSPData.payment = {};
            defaultCSPData.payment.advancedPaymentFee = null;
            defaultCSPData.payment.advancedPaymentType = "";
            defaultCSPData.certification = {};
            defaultCSPData.certification.givenName = "";
            defaultCSPData.certification.initials = "";
            defaultCSPData.certification.surname = "";
            defaultCSPData.certification.jobTitle = "";
            defaultCSPData.certification.dateSigned = "";

            return (defaultCSPData);
        };
        CspService.prototype.createEmptyExternalModel = function () {
            var defaultCSPData = {};
            defaultCSPData.template_type = "";
            defaultCSPData.data_checksum = "";
            defaultCSPData.enrolment_version = "";
            defaultCSPData.date_saved = "";
            defaultCSPData.software_version = "";
            defaultCSPData.data_checksum = "";

            //TODO appl Info
            defaultCSPData.applicant = [];
            defaultCSPData.health_canada_only = {};
            var hc = defaultCSPData.health_canada_only;
            hc.company_id = "";
            hc.date_received = "";
            hc.company_id = "";
            hc.hc_notes = "";
            defaultCSPData.application_info = {};
            defaultCSPData.application_info.patent_info = {};
            var patent = defaultCSPData.application_info.patent_info;
            patent.patent_number = "";
            patent.filing_date = "";
            patent.granted_date = "";
            patent.expiry_date = "";
            var info = defaultCSPData.application_info;
            info.control_number = "";
            info.drug_use = "";
            info.time_application = "";
            info.medicinal_ingredient = "";
            info.applicant_statement = "";
            defaultCSPData.timely_submission_info = {};
            var timely = defaultCSPData.timely_submission_info;
            timely.timely_submission_statement = "";
            timely.marketing_approval_date = "";
            timely.marketing_country = "";
            timely.marketing_country_eu = "";
            defaultCSPData.advanced_payment = {};
            var payment = defaultCSPData.advanced_payment;
            payment.advanced_payment_type = null;
            payment.advanced_payment_fee = "";

            defaultCSPData.certification = {};
            var cert = defaultCSPData.certification;
            cert.given_name = "";
            cert.initials = "";
            cert.surname = "";
            cert.job_title = "";
            cert.date_signed = "";
            return (defaultCSPData);
        };
        /**
         * Creates an empty applicant record that is meets the XML schema standard
         * @returns {{}}
         */
        CspService.prototype.createExternalApplicantRecord = function () {
            var record = {};
            record.billing_role = NO;
            record.applicant_role = NO;
            record.applicant_name = "";
            record.contact = {};
            record.contact.given_name = "";
            record.contact.initials = "";
            record.contact.surname = "";
            record.contact.job_title = "";
            // record.contact.language_correspondance="";
            record.contact.phone_num = "";
            record.contact.phone_ext = "";
            record.contact.fax_num = "";
            record.contact.email = "";
            record.address = {};
            record.address.street_address = "";
            record.address.city = "";
            record.address.province_lov = "";
            record.address.province_text = "";
            record.address.country = "";
            record.address.postal_code = "";
            return record;
        };
        CspService.prototype._transformApplicantInfoForOutput = function (inputJson) {

            var outputArray = [];
            if (!(inputJson instanceof Array)) {
                console.log("This is not an instance of an Array");
                inputJson = [inputJson];
            }
            ;
            //should never happen error catch
            if (inputJson.length == 0) {
                outputArray.push(this.createExternalApplicantRecord());
                console.log("no data");
                return;
            }
            for (var i = 0; i < inputJson.length; i++) {
                var record = this.createExternalApplicantRecord();
                record.billing_role = inputJson[i].role.billing === true ? YES : NO;
                record.applicant_role = inputJson[i].role.applicant === true ? YES : NO;
                record.applicant_name = inputJson[i].applicantName;
                record.contact.given_name = inputJson[i].contact.givenName;
                record.contact.initials = inputJson[i].contact.initials;
                record.contact.surname = inputJson[i].contact.surname;
                record.contact.job_title = inputJson[i].contact.jobTitle;
                record.contact.phone_num = inputJson[i].contact.phone;
                record.contact.phone_ext = inputJson[i].contact.phoneExt;
                record.contact.fax_num = inputJson[i].contact.fax;
                record.contact.email = inputJson[i].contact.email;
                record.address.street_address = inputJson[i].address.street;
                record.address.city = inputJson[i].address.city;
                record.address.province_lov = inputJson[i].address.stateList;
                record.address.province_text = inputJson[i].address.stateText;

                if (inputJson[i].address.country) {
                    record.address.country = {
                        _label_en: inputJson[i].address.country.en,
                        _label_fr: inputJson[i].address.country.fr,
                        __text: inputJson[i].address.country.id
                    };
                }
                record.address.postal_code = inputJson[i].address.postalCode;
                outputArray.push(record);
            }
            console.log(outputArray);
            return outputArray;
        };

        return CspService;
    }

})();
