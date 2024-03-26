"use strict";
/**
 * Created by dkilty on 10/03/2018.
 */
/**
 * @ngdoc Model for creating the three lists based the lead type
 */
(function () {
    angular
        .module('activityFormFilterModule', ['hpfbConstants']);

})();

(function () {
    angular
        .module('activityFormFilterModule')
        .factory('ActivityFormFilterService', getService);

    /* @ngInject */
    getService.inject = [];

    function getService() {
        var vm = this;

        var service = {
            getPharmaRAList: _getPharmaRAList,
            getBiolRAList: _getBiolRAList,
            getConsumHealthList: _getConsumHealthList,
            getPostMarketRAList: _getPostMarketRAList,
            getVeterinaryList: _getVeterinaryList,
            getClinicalBioList: _getClinicalBioList,
            getClinicalPhaList: _getLinicalPhaList
        };
        return service;

        /**
         * Creates the pharmalist based on the incomining global list
         * @param raList - the full list of regulatory activity values
         * @returns {Array}
         * @private
         */
        function _getPharmaRAList(raList){
            var newList=[];
            for(var i=0; i<raList.length;i++) {
                switch(raList[i].id) {
                    case 'B02-20160301-001': //ANDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-031': //EU NDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-032': //EU SNDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-038': //Level III
                        newList.push(raList[i]);
                        break;
                    // case 'B02-20160301-046': //MPNC
                    //     newList.push(raList[i]);
                    //     break;
                    case 'B02-20160301-047': //MPNDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-049': //MPSNDS
                        newList.push(raList[i]);
                        break;
                    // case 'B02-20160301-050': //NC
                    //     newList.push(raList[i]);
                    //     break;
                    case 'B02-20160301-051': //NDS
                        newList.push(raList[i]);
                        break;
                    // case 'B02-20160301-067': //PAND
                    //     newList.push(raList[i]);
                    //     break;
                    // case 'B02-20160301-068': //PBRER-C
                    //     newList.push(raList[i]);
                    //     break;
                    case 'B02-20160301-075': //PRNDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-077': //PRSNDS
                        newList.push(raList[i]);
                        break;
                    // case 'B02-20160301-078': //PSUR-C
                    //     newList.push(raList[i]);
                    //     break;
                    case 'B02-20160301-082': //SANDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-084': //SNDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-085': //SNDS-C
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-088': //UDRA
                        newList.push(raList[i]);
                        break;
                    /* case 'B02-20160301-089': //YBPR
                         newList.push(raList[i]);
                         break; */
                    /*case 'B02-20160301-028': //DSUR
                        newList.push(raList[i]);
                        break;*/
                    case 'B02-20160301-018': //DINA
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-020': //DIND
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-021': //DINF
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-043': //MPDIN
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-070': //PDC
                        newList.push(raList[i]);
                        break;
                    case 'B02-20190627-07': //EUANDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20190627-08': //EUSANDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160819-01': //Post-DIN
                        newList.push(raList[i]);
                        break;
                    case 'B02-20190627-06': //SANDS-C
                        newList.push(raList[i]);
                        break;
                    // case 'B02-20200417-01': //COVID-19
                    //     newList.push(raList[i]);
                    //     break;
                    // case 'B02-20200417-02': //COVID-19AMD
                    //     newList.push(raList[i]);
                    //     break;
                    // case 'B02-20201028-01': //MPCOV
                    //     newList.push(raList[i]);
                    //     break;
                    // case 'B02-20201214-01': //MPCOVA
                    //     newList.push(raList[i]);
                    //     break;
                    case 'B02-20210108-01': //NDS CV
                        newList.push(raList[i]);
                        break;
                }
            }//for
            return newList;
        }

        /***
         * Creates the list if hte RA lead is biological
         * @param raList -the full list of values
         * @returns {Array}
         * @private
         */
        function _getBiolRAList(raList){
            var newList=[];
            for(var i=0; i<raList.length;i++) {
                switch(raList[i].id) {
                    case 'B02-20160301-001': //ANDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-031': //EU NDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-032': //EU SNDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-038': //Level III
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-046': //MPNC
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-047': //MPNDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-049': //MPSNDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-050': //NC
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-051': //NDS
                        newList.push(raList[i]);
                        break;
                    // case 'B02-20160301-067': //PAND
                    //     newList.push(raList[i]);
                    //     break;
                    // case 'B02-20160301-068': //PBRER-C
                    //     newList.push(raList[i]);
                    //     break;
                    case 'B02-20160301-075': //PRNDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-077': //PRSNDS
                        newList.push(raList[i]);
                        break;
                    // case 'B02-20160301-078': //PSUR-C
                    //     newList.push(raList[i]);
                    //     break;
                    case 'B02-20160301-082': //SANDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-084': //SNDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-085': //SNDS-C
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-088': //UDRA
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-089': //YBPR
                        newList.push(raList[i]);
                        break;
                    /*case 'B02-20160301-028': //DSUR
                        newList.push(raList[i]);
                        break;*/
                    case 'B02-20160301-019': //DINB
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-043': //MPDIN
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-071': //PDC-B
                        newList.push(raList[i]);
                        break;
                    case 'B02-20190627-07': //EUANDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20190627-08': //EUSANDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20190627-06': //SANDS-C
                        newList.push(raList[i]);
                        break;
                    // case 'B02-20200417-01': //COVID-19
                    //     newList.push(raList[i]);
                    //     break;
                    // case 'B02-20200417-02': //COVID-19AMD
                    //     newList.push(raList[i]);
                    //     break;
                    // case 'B02-20201028-01': //MPCOV
                    //     newList.push(raList[i]);
                    //     break;
                    // case 'B02-20201214-01': //MPCOVA
                    //     newList.push(raList[i]);
                    //     break;
                    case 'B02-20210108-01': //NDS CV
                        newList.push(raList[i]);
                        break;
                    case 'B02-20180522-01': //BE
                        newList.push(raList[i]);
                        break;
                }
            }//for
            return newList;
        }

        /**
         * Activity Lead = postmarket  activity list
         * @param raList
         * @returns {Array}
         * @private
         */
        function _getPostMarketRAList(raList){
            var newList=[];
            for(var i=0; i<raList.length;i++) {
                switch(raList[i].id) {

                    case 'B02-20160301-069': //PBRER-PV
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-078': //PSUR-C
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-079': //PSUR-PV
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-080': //RMP-PV
                        newList.push(raList[i]);
                        break;
                    case 'B02-20190627-01': //IRSRPV
                        newList.push(raList[i]);
                        break;
                    case 'B02-20190627-02': //PA-PV
                        newList.push(raList[i]);
                        break;
                    case 'B02-20190627-03': //PSA-PV
                        newList.push(raList[i]);
                        break;
                    case 'B02-20190627-04': //RC-PV
                        newList.push(raList[i]);
                        break;
                    case 'B02-20190627-05': //REG-PV
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-068': //PBRER-C
                        newList.push(raList[i]);
                        break;
                    // case 'B02-20200417-01': //COVID-19
                    //     newList.push(raList[i]);
                    //     break;
                    // case 'B02-20200417-02': //COVID-19AMD
                    //     newList.push(raList[i]);
                    //     break;
                }
            }//for
            return newList;
        }
        /**
         * Creates the ConsumHealthList based on the incomining global list
         * @param raList - the full list of regulatory activity values
         * @returns {Array}
         * @private
         */
        function _getConsumHealthList(raList){
            var newList=[];
            for(var i=0; i<raList.length;i++) {
                switch(raList[i].id) {
                    case 'B02-20160301-001': //ANDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-031': //EU NDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-032': //EU SNDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-038': //Level III
                        newList.push(raList[i]);
                        break;
                    // case 'B02-20160301-046': //MPNC
                    //     newList.push(raList[i]);
                    //     break;
                    case 'B02-20160301-047': //MPNDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-049': //MPSNDS
                        newList.push(raList[i]);
                        break;
                    // case 'B02-20160301-050': //NC
                    //     newList.push(raList[i]);
                    //     break;
                    case 'B02-20160301-051': //NDS
                        newList.push(raList[i]);
                        break;
                    // case 'B02-20160301-067': //PAND
                    //     newList.push(raList[i]);
                    //     break;
                    // case 'B02-20160301-068': //PBRER-C
                    //     newList.push(raList[i]);
                    //     break;
                    case 'B02-20160301-075': //PRNDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-077': //PRSNDS
                        newList.push(raList[i]);
                        break;
                    // case 'B02-20160301-078': //PSUR-C
                    //     newList.push(raList[i]);
                    //     break;
                    case 'B02-20160301-082': //SANDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-084': //SNDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-085': //SNDS-C
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-088': //UDRA
                        newList.push(raList[i]);
                        break;
                    /* case 'B02-20160301-089': //YBPR
                         newList.push(raList[i]);
                         break; */
                    /*case 'B02-20160301-028': //DSUR
                        newList.push(raList[i]);
                        break;*/
                    case 'B02-20160301-018': //DINA
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-020': //DIND
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-021': //DINF
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-043': //MPDIN
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160301-070': //PDC
                        newList.push(raList[i]);
                        break;
                    case 'B02-20190627-07': //EUANDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20190627-08': //EUSANDS
                        newList.push(raList[i]);
                        break;
                    case 'B02-20160819-01': //Post-DIN
                        newList.push(raList[i]);
                        break;
                    case 'B02-20190627-06': //SANDS-C
                        newList.push(raList[i]);
                        break;
                    case 'B02-20210108-01': //NDS CV
                        newList.push(raList[i]);
                        break;
                    // case 'B02-20200417-01': //COVID-19
                    //     newList.push(raList[i]);
                    //     break;
                    // case 'B02-20200417-02': //COVID-19AMD
                    //     newList.push(raList[i]);
                    //     break;
                }
            }//for
            return newList;
        }

        // getVeterinaryList: _getVeterinaryList,
        //     getClinicalTrailBio: _getClinicalTrailBioList,
        //     getClinicalTrailPha: _getLinicalTrailPhaList

        function _getVeterinaryList(raList){
            var newList=[];
            var veterinaryArray = ['B02-20160301-001', 'B02-20160301-022','B02-20160301-038','B02-20160301-041','B02-20160301-043',
                'B02-20160301-046','B02-20160301-047','B02-20160301-048','B02-20160301-049','B02-20160301-050','B02-20160301-051','B02-20210108-01',
                'B02-20160301-076','B02-20160301-079','B02-20180912-01','B02-20160301-082','B02-20160301-084','B02-20160301-088'
            ];
            for(var i=0; i<veterinaryArray.length; i++){
                for(var j=0; j< raList.length; j++){
                    if(veterinaryArray[i] == raList[j].id){
                        newList.push(raList[j]);
                        break;
                    }
                }
            }
            return newList;
        }

        function _getClinicalBioList(raList){
            var newList=[];
            var veterinaryArray = [ 'B02-20160301-014','B02-20160301-015','B02-20160301-072'];
            for(var i=0; i<veterinaryArray.length; i++){
                for(var j=0; j< raList.length; j++){
                    if(veterinaryArray[i] == raList[j].id){
                        newList.push(raList[j]);
                        break;
                    }
                }
            }
            return newList;
        }
        function _getLinicalPhaList(raList){
            var newList=[];
            var veterinaryArray = ['B02-20160301-014','B02-20160301-015','B02-20160301-072'];
            for(var i=0; i<veterinaryArray.length; i++){
                for(var j=0; j< raList.length; j++){
                    if(veterinaryArray[i] == raList[j].id){
                        newList.push(raList[j]);
                        break;
                    }
                }
            }
            return newList;
        }

    }//end service function
})();