package com.ubertesters.sdk;

import android.app.Application;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.PluginResult;
import org.json.JSONArray;
import org.json.JSONException;

public class UbertestersCordova extends CordovaPlugin {


    @Override
    public boolean execute(String action, final JSONArray args, final CallbackContext callbackContext) throws JSONException {
        PluginResult result = new PluginResult(PluginResult.Status.ERROR);
        if (action.equals("showUtPage")) {
            Ubertesters.showMenu();
            callbackContext.success();
            return true;
        } else if (action.equals("hideUtPage")) {
            Ubertesters.hideMenu();
            callbackContext.success();
            return true;
        } else if (action.equals("takeScreenshot")) {
            Ubertesters.takeScreenshot();
            callbackContext.success();
            return true;
        } else if (action.equals("logInfo")) {
            String message = args.getString(0);
            Ubertesters.logger().info(message);
            callbackContext.success();
            return true;
        } else if (action.equals("logError")) {
            String message = args.getString(0);
            Ubertesters.logger().error(message);
            callbackContext.success();
        } else if (action.equals("logWarn")) {
            String message = args.getString(0);
            Ubertesters.logger().warn(message);
            callbackContext.success();
        }

        callbackContext.sendPluginResult(result);
        return false;
    }
}
