//
//  AppDelegate.m
//  Tune Out
//
//  Created by David Mazza on 10/14/14.
//  Copyright (c) 2014 Peaking. All rights reserved.
//

#import "AppDelegate.h"
#import "TripViewController.h"
#import "UIColor+CustomColors.h"
#import "UIImage+withColor.h"
#import <AudioToolbox/AudioServices.h>
#import "GAI.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  NSDictionary *titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                       [UIFont fontWithName:@"Quicksand-Bold" size:20.0], NSFontAttributeName,
                                       [UIColor whiteColor],                              NSForegroundColorAttributeName, nil];

  [[UINavigationBar appearance] setTitleTextAttributes:titleTextAttributes];
  //[[UINavigationBar appearance] setShadowImage:[UIImage imageWithColor:[UIColor colorWithWhite:0 alpha:0.2]]];
  [[UINavigationBar appearanceWhenContainedIn:[UIViewController class], nil] setBackgroundImage:[UIImage imageWithColor:[UIColor flatRedColor]] forBarMetrics:UIBarMetricsDefault];
  [[UINavigationBar appearanceWhenContainedIn:[UITableViewController class], nil] setBackgroundImage:[UIImage imageWithColor:[UIColor darkBlueGrayColor]] forBarMetrics:UIBarMetricsDefault];
  
    // Optional: automatically send uncaught exceptions to Google Analytics.
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    
    // Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
    [GAI sharedInstance].dispatchInterval = 20;
    
    // Optional: set Logger to VERBOSE for debug information.
    [[[GAI sharedInstance] logger] setLogLevel:kGAILogLevelWarning];
    
    // Initialize tracker. Replace with your tracking ID.
    [[GAI sharedInstance] trackerWithTrackingId:@"UA-40632324-1"];
    
    return YES;
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    NSString *path  = [[NSBundle mainBundle] pathForResource:@"subwayAlarm" ofType:@"m4a"];
    NSURL* filePath = [NSURL fileURLWithPath: path isDirectory: NO];
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)filePath, &soundID);
    
    //AudioServicesPlaySystemSound(soundID);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
