
To add this plugin just type:

	cordova plugin add https://github.com/EasternPeak/PhonegapUbertesters.git
			
To remove this plugin type:
	
	cordova plugin remove com.ubertesters.sdk

-- IOS integration
    1.Add "Ubertesters Organization token" to your app's "Info.plist" with key "ubertesters_organization_token"

    Don't forget to build your application with:

        cordova build ios

    2.
    Use Ubertesters initialize function in the "deviceready" function

        onDeviceReady: function() {
            cordova.exec(null, null, "UbertestersCordova", "initialize", []);
            },

    You can use Ubertesters with Cordova command:

        cordova.exec(null, null, "UbertestersCordova", "initialize", []);

    Or you can add ubertesters.js to your sources  and call ubertesters in this way:

        ubertesters.initialize(null, null);

    If you want to use specific locking mode or activation mode in initialization,
    you can call initialize function with parameters:

        ubertesters.initialize(null, null, [/*LOCKING_MODE*/, /*ACTIVATION_MODE*/]);
    OR

        cordova.exec(null, null, "UbertestersCordova", "initialize", [/*LOCKING_MODE*/, /*ACTIVATION_MODE*/]);

    Examples:
  
    1...
        ubertesters.initialize(null, null, ['DisableUbertesters']);

    2...
        ubertesters.initialize(null, null, ['DisableUbertesters', 'Shake']);

    3...
    cordova.exec(null, null, "UbertestersCordova", "initialize",
    ['DisableUbertesters', 'Shake']);

--ANDROID INTEGRATION:

	After adding android platform, please add next line into AndroidManifest.xml file:

		<application>
		...
		<meta-data android:name="ubertesters_organization_token" android:value="your organization token"/>
		...
		</application>

	Read http://ubertesters.com/download-sdk-android/ for more details.
	Also make sure your specify correct android:versionCode and android:versionName for your build.

	Don't forget to build your application with:
		cordova build android

    Also, please add UT intitialization into your Application class:

        public class MyApplication extends Application {
            @Override
            public void onCreate() {
                super.onCreate();
                Ubertesters.initialize(this, LockingMode.DisableUbertesters, ActivationMode.Widget);
                ...
            }
        }



Available LockingMode (Must be the third argument): 

    DisableUbertesters
If build not exists Ubertesters will be disabled.

    LockApplication
If build not exists tested application will be locked.

Available ActivationMode (Must be the fourth argument):

    Widget
Mode with displaying Ubertesters button.

    Shake
Mode without Ubertesters button. User has to shake device to open Ubertesters page.

    Manually
Mode without Ubertesters button. Developer has to use functions ShowUtPage() and HideUtPage().

All other Ubertesters functions you can see in com.ubertesters.sdk/www/ubertesters.js
