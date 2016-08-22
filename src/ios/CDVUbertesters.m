//
//  CDVUbertesters.m
//  Rallyware
//
//  Created by Dmytro Kalachniuk on 3/28/14.
//  Copyright (c) 2014 Rallyware. All rights reserved.
//

#import "CDVUbertesters.h"
#import <Cordova/CDVPluginResult.h>
#import <UbertestersSDK/Ubertesters.h>

@implementation CDVUbertesters

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void) initialize:(CDVInvokedUrlCommand*)command{
    UbertestersOptions initOptions = UbertestersOptionsDefault;
    if(command.arguments.count >= 1){
        NSString *lockingMode = command.arguments[0];
        if([lockingMode isEqualToString:@"DisableUbertesters"]){
            initOptions |= UbertestersLockingModeDisableUbertesters;
        }
        if([lockingMode isEqualToString:@"LockApplication"]){
            initOptions |= UbertestersLockingModeLockApplication;
        }
    }
    if (command.arguments.count == 2) {
        NSString *activationMode = command.arguments[1];
        if([activationMode isEqualToString:@"Widget"]){
            initOptions |= UbertestersActivationModeWidget;
        }
        if([activationMode isEqualToString:@"Shake"]){
            initOptions |= UbertestersActivationModeShake;
        }
        if([activationMode isEqualToString:@"Manual"]){
            initOptions |= UbertestersActivationModeManual;
        }
    }
    NSLog(@"%i",initOptions);
    [[Ubertesters shared] initializeWithOptions:initOptions];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void)showUtPage:(CDVInvokedUrlCommand*)command{
    [[Ubertesters shared] showMenu];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void)hideUtPage:(CDVInvokedUrlCommand*)command{
    [[Ubertesters shared] hideMenu];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void)takeScreenshot:(CDVInvokedUrlCommand*)command{
    [[Ubertesters shared] makeScreenshot];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void)logInfo:(CDVInvokedUrlCommand*)command{
    NSString *message = command.arguments[0];
    [[Ubertesters shared] UTLog:message withLevel:UTLogLevelInfo];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void)logError:(CDVInvokedUrlCommand*)command{
    NSString *message = command.arguments[0];
    [[Ubertesters shared] UTLog:message withLevel:UTLogLevelError];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

-(void)logWarn:(CDVInvokedUrlCommand*)command{
    NSString *message = command.arguments[0];
    [[Ubertesters shared] UTLog:message withLevel:UTLogLevelWarning];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
