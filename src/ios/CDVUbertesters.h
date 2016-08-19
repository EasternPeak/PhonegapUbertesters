//
//  CDVUbertesters.h
//  Ubertesters
//
//  Created by Dmytro Kalachniuk on 3/28/14.
//  Copyright (c) 2014 Ubertesters. All rights reserved.
//

#import <Cordova/CDVPlugin.h>

@interface CDVUbertesters : CDVPlugin

- (void) initialize:(CDVInvokedUrlCommand*)command;
- (void) showUtPage:(CDVInvokedUrlCommand*)command;
- (void) hideUtPage:(CDVInvokedUrlCommand*)command;
- (void) takeScreenshot:(CDVInvokedUrlCommand*)command;
- (void) logInfo:(CDVInvokedUrlCommand*)command;
- (void) logError:(CDVInvokedUrlCommand*)command;
- (void) logWarn:(CDVInvokedUrlCommand*)command;

@end
