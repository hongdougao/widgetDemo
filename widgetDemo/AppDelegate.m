//
//  AppDelegate.m
//  widgetDemo
//
//  Created by Yangyue on 15/3/12.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "AppDelegate.h"
#import "NextViewController.h"
#import "ViewController.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
//    NextViewController *next = [[NextViewController alloc]init ];
//     UINavigationController *nav = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"storyNav"]; 
//    [nav pushViewController:next animated:YES];
//    UITabBarController *vc = (UITabBarController*)self.window.rootViewController;
//    vc.selectedIndex = 1;
    return YES;
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSString* prefix = @"todayWidgetIOS://action=";
    if ([[url absoluteString] rangeOfString:prefix].location != NSNotFound) {
        NSString* action = [[url absoluteString] substringFromIndex:prefix.length];
        if ([action isEqualToString:@"GotoHomePage"]) {
            
        }
        else if([action isEqualToString:@"GotoOtherPage"]) {
//            NextViewController *next = [[NextViewController alloc]init ];
//             UINavigationController *nav = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"storyNav"];
            UITabBarController *vc = (UITabBarController*)self.window.rootViewController;
            vc.selectedIndex = 1;
        }
    }
    
    return  YES;
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
