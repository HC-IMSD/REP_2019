/**
 * Created by dkilty on 16/01/2017.
 */

(function () {
    'use strict';
    angular
        .module('transactionLoadService', ['dataLists', 'hpfbConstants','services'])
})();

(function () {
    'use strict';
    angular
        .module('transactionLoadService')
        .factory('customLoad', ['$http', '$q', '$filter', 'getCountryAndProvinces', 'CANADA', 'USA','OTHER','RELATIVE_FOLDER_DATA', 'getContactLists','TransactionLists', function ($http, $q, $filter, getCountryAndProvinces, CANADA, USA, OTHER,RELATIVE_FOLDER_DATA, getContactLists,TransactionLists) {

            return function (options) {
                var deferred = $q.defer();
                console.log(RELATIVE_FOLDER_DATA);
                var versionsUrl = RELATIVE_FOLDER_DATA + "versions.json";
                var envUrl = RELATIVE_FOLDER_DATA + "env.json";
                var countryUrl = RELATIVE_FOLDER_DATA + "countries.json";
                var raTypeUrl= RELATIVE_FOLDER_DATA + "raType.json";
                var feeUrl= RELATIVE_FOLDER_DATA + "feeClass.json";
                var mitigationUrl = RELATIVE_FOLDER_DATA + "mitigationType.json";
                var resultTranslateList = {};
                $http.get(versionsUrl)
                    .then(function (response) {
                        TransactionLists.setVer(response.data);
                    });
                $http.get(envUrl)
                    .then(function (response) {
                        //PROCESS env data
                        TransactionLists.setEnv(response.data);
                        // return $http.get(countryUrl);
                    });
                $http.get(countryUrl).then(function (response) {
                        //PROCESS country list data
                        var newList = _createSortedArrayNAFirst(response.data, options.key);
                        var translateList = _createTranslateList(newList, options.key);
                        getCountryAndProvinces.createCountryList(newList);
                        angular.extend(resultTranslateList, translateList);
                        // return $http.get(raTypeUrl);
                    });
                $http.get(raTypeUrl).then(function (response) {
                        //PROCESS raType list data
                        var newList = _createSortedArrayRAType(response.data, options.key);
                        var translateList = _createTranslateList(newList, options.key);
                        TransactionLists.createRaTypes(newList);
                        angular.extend(resultTranslateList, translateList);
                      // return $http.get(feeUrl);
                    });
                $http.get(feeUrl)
                .then(function (response) {
                        //PROCESS fee  list data
                        var newList = _createSortedArray(response.data, options.key);
                        var translateList = _createTranslateList(newList, options.key);
                        TransactionLists.createFeeTypes(newList);
                        angular.extend(resultTranslateList, translateList);
                        // return $http.get(mitigationUrl);
                    });
                $http.get(mitigationUrl)
                    .then(function (response) {
                        //PROCESS mitigation url list data
                        var newList = _createSortedArray(response.data, options.key);
                        var translateList = _createTranslateList(newList, options.key);
                        TransactionLists.createMitigationList(newList);
                        angular.extend(resultTranslateList, translateList);
                        // return response.data;
                    })

                    .catch(function (error) {
                        // this catches errors from the $http calls as well as from the explicit throw
                        console.warn("An error occurred with transaction List Load: " + error.status);
                        deferred.reject(resultTranslateList);
                    })
                    .finally(function () {
                        deferred.resolve(resultTranslateList);
                    });
                return deferred.promise;
            };


            /**
             * Creates the list of key value pairs for the translate service. Converts the complex json
             * Of the format {id:xxx,en:xxx,fr:xxxx}. (Can contain other keys)
             * @param jsonList
             * @param lang
             * @returns {{}}
             * @private
             */
            function _createTranslateList(jsonList, lang) {
                // var langIndex=1;
                if (!lang) lang = 'en';
                var resultList = {};
                for (var i = 0; i < jsonList.length; i++) {
                    resultList[jsonList[i].id] = jsonList[i][lang];
                }
                return resultList;
            }

            /**
             * Replaces the original key with one that is prefixed with the passed in string
             * @param oldList
             * @param prefix
             * @returns {{}}
             * @private
             */
            function _createNewKeyArray(oldList, prefix) {
                var keys = Object.keys(oldList);
                var newList = {};
                for (var i = 0; i < keys.length; i++) {
                    var newKey = "";
                    if (DossierLists.getOtherValue() === keys[i]) {
                        newKey = keys[i];
                    } else {
                        newKey = prefix + keys[i];
                    }
                    var newObj = {};
                    newList[newKey] = oldList[keys[i]];
                }
                return newList;
            }

            function _createSortedArrayNAFirst(jsonList, lang) {
                var result = [];
                var canadaRecord = null;
                var usaRecord = null;
                angular.forEach($filter('orderByLocale')(jsonList, lang), function (sortedObject) {
                    if (sortedObject.id === USA) {
                        usaRecord = sortedObject;
                    } else if (sortedObject.id === CANADA) {
                        canadaRecord = sortedObject;
                    }
                    else {
                        result.push(sortedObject);
                    }

                });
                if (usaRecord) result.unshift(usaRecord);
                if (canadaRecord) result.unshift(canadaRecord);
                return result;
            }

            function _createSortedArray(jsonList, lang) {
                var result = [];
                angular.forEach($filter('orderByLocale')(jsonList, lang), function (sortedObject) {
                    result.push(sortedObject);
                });
                return result;
            }

            function _createSortedArrayRAType(jsonList, lang) {
                var result = [];
                var placeLast = [];
                angular.forEach($filter('orderByLocale')(jsonList, lang), function (sortedObject) {
                    // If UDRA place last
                    if (sortedObject.id === "B02-20160301-088") {
                        // Collect items that are placed last separately
                        placeLast.push(sortedObject);
                    } else {
                        // Add other items to result
                        result.push(sortedObject);
                    }

                });

                // Append items at the end
                result = result.concat(placeLast);
                return result;
            }

        }]);
})();

