//
//  ParseStarterProjectAppDelegate.m
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

#import <Parse/Parse.h>

// If you want to use any of the UI components, uncomment this line
// #import <ParseUI/ParseUI.h>

// If you are using Facebook, uncomment this line
// #import <ParseFacebookUtils/PFFacebookUtils.h>

// If you want to use Crash Reporting - uncomment this line
// #import <ParseCrashReporting/ParseCrashReporting.h>

#import "ParseStarterProjectAppDelegate.h"
#import "ParseStarterProjectViewController.h"

@implementation ParseStarterProjectAppDelegate

#pragma mark -
#pragma mark UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    self.viewController = [[ParseStarterProjectViewController alloc] initWithNibName:nil bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    [Parse setApplicationId:@"r9ug3GFnrFhcMZgyEQtz6pkd3QhzduVZyGrLeQj0"
                  clientKey:@"HFuHyStdxc6qmnAbtiCQTDSZrowJMJbKACKINox0"];
    
    return YES;
    
}

@end
