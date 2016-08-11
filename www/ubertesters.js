var ubertesters = {
	initialize: function(successCallback, failureCallback, args) {
		func = window.onerror;
		window.onerror = function (errorMsg, url, lineNumber) {
			if(func != null){
				func(errorMsg, url, lineNumber)
			}
			errorStr = 'Error2: ' + errorMsg + ' Script: ' + url + ' Line: ' + lineNumber;
			cordova.exec(null, null, "UbertestersCordova", "logError", [errorStr]);
		}
        cordova.exec(null, null, "UbertestersCordova", "initialize", args != null? args: []);
	},
	showUtPage: function(successCallback, failureCallback) {
		cordova.exec(null, null, "UbertestersCordova", "showUtPage", []);	
	},
	hideUtPage: function(successCallback, failureCallback) {
		cordova.exec(null, null, "UbertestersCordova", "hideUtPage", []);	
	},
	takeScreenshot: function(successCallback, failureCallback) {
		cordova.exec(null, null, "UbertestersCordova", "takeScreenshot", []);	
	},
	logInfo: function(successCallback, failureCallback, info) {
		cordova.exec(null, null, "UbertestersCordova", "logInfo", [info]);	
	},	
	logError: function(successCallback, failureCallback, error) {
		cordova.exec(null, null, "UbertestersCordova", "logError", [error]);	
	},	
	logWarn: function(successCallback, failureCallback, warn) {
		cordova.exec(null, null, "UbertestersCordova", "logWarn", [warn]);	
	}	
};
module.exports = ubertesters;
