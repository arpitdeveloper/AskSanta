//
//  AppDelegate.m
//  AskSanta
//
//  Created by Apple on 06/03/19.
//  Copyright © 2019 Rajesh Shinde. All rights reserved.
//

#import "AppDelegate.h"
@import Firebase;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // Use Firebase library to configure APIs
    [FIRApp configure];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
 // Receive displayed notifications for iOS 10 devices.
 // Handle incoming notification messages while app is in the foreground.
 - (void)userNotificationCenter:(UNUserNotificationCenter *)center
 willPresentNotification:(UNNotification *)notification
 withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
 NSDictionary *userInfo = notification.request.content.userInfo;
 
 // With swizzling disabled you must let Messaging know about the message, for Analytics
 // [[FIRMessaging messaging] appDidReceiveMessage:userInfo];
 
 // Print message ID.
 if (userInfo[kGCMMessageIDKey]) {
 NSLog(@"Message ID: %@", userInfo[kGCMMessageIDKey]);
 }
 
 // Print full message.
 NSLog(@"%@", userInfo);
 
 // Change this to your preferred presentation option
 completionHandler(UNNotificationPresentationOptionNone);
 }
 
 // Handle notification messages after display notification is tapped by the user.
 - (void)userNotificationCenter:(UNUserNotificationCenter *)center
 didReceiveNotificationResponse:(UNNotificationResponse *)response
 withCompletionHandler:(void(^)(void))completionHandler {
 NSDictionary *userInfo = response.notification.request.content.userInfo;
 if (userInfo[kGCMMessageIDKey]) {
 NSLog(@"Message ID: %@", userInfo[kGCMMessageIDKey]);
 }
 
 // Print full message.
 NSLog(@"%@", userInfo);
 
 completionHandler();
 }
 */
@end
