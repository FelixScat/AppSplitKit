//
//  TestAppDelegate.m
//  AppSplitKit_Example
//
//  Created by Felix on 2019/9/25.
//  Copyright © 2019 Felix. All rights reserved.
//

#import "TestAppDelegate.h"

@implementation TestAppDelegate

+ (void)load {
    [ASManager registClass:self];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions {
    
    
    return false;
}

@end
