//
//  ConnectionTest.m
//  MeuAmigo
//
//  Created by Nathan Hegedus on 3/13/12.
//  Copyright (c) 2012 Nathan Hegedus. All rights reserved.
//

#import "ConnectionTest.h"
#import "Reachability.h"

@implementation ConnectionTest

+(BOOL)testInternetAndWifiConnection{
    
    Reachability *internetReach = [Reachability reachabilityForInternetConnection];
    NetworkStatus netStatusInternet = [internetReach currentReachabilityStatus];
    [internetReach startNotifier];
    
    Reachability *wifiReach = [Reachability reachabilityForLocalWiFi];
    NetworkStatus netStatusWifi = [internetReach currentReachabilityStatus];
    [wifiReach startNotifier];
    
    if (netStatusInternet == NotReachable && netStatusWifi == NotReachable) {
        return NO;
    }else{
        return YES;
    }
    
}

@end
