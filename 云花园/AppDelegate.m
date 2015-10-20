//
//  AppDelegate.m
//  云花园
//
//  Created by 白彬涵 on 15/10/15.
//  Copyright © 2015年 BBH工作室. All rights reserved.
//

#import "AppDelegate.h"
#import "HomePageViewController.h"
#import "MyGardenViewController.h"
#import "MarketViewController.h"
#import "SelfCenterViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc]init];
    _window.frame = [[UIScreen mainScreen]bounds];
    _window.backgroundColor = [UIColor whiteColor];
    
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    [[UINavigationBar appearance]setBarTintColor:[UIColor colorWithRed:42.0/255.0 green:182.0/255.0 blue:83.0/255.0 alpha:1.0]];
    [[UINavigationBar appearance]setBarStyle:UIBarStyleBlack];
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    tabBarController.tabBar.tintColor = [UIColor colorWithRed:42.0/255.0 green:182.0/255.0 blue:83.0/255.0 alpha:1.0];//设置高亮时候button颜色
    
    
    HomePageViewController *homePageVC = [[HomePageViewController alloc]init];
    homePageVC.title = @"主页";
    [homePageVC.tabBarItem setImage:[UIImage imageNamed:@"首页"]];
    [homePageVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"首页highlight"]];
    UINavigationController *homePageNavi = [[UINavigationController alloc]initWithRootViewController:homePageVC];
    [tabBarController addChildViewController:homePageNavi];
    
    
    
    MyGardenViewController *myGardenVC = [[MyGardenViewController alloc]init];
    myGardenVC.title = @"我的花园";
    [myGardenVC.tabBarItem setImage:[UIImage imageNamed:@"我的花园"]];
    [myGardenVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"我的花园highlight"]];
    UINavigationController *myPlantNavi = [[UINavigationController alloc]initWithRootViewController:myGardenVC];
    [tabBarController addChildViewController:myPlantNavi];
    
    
    MarketViewController *marketVC = [[MarketViewController alloc]init];
    marketVC.title = @"市场";
    [marketVC.tabBarItem setImage:[UIImage imageNamed:@"市场"]];
    [marketVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"市场highlight"]];
    UINavigationController *marketPlaceNavi = [[UINavigationController alloc]initWithRootViewController:marketVC];
    [tabBarController addChildViewController:marketPlaceNavi];
    
    
    SelfCenterViewController *selfCenterVC = [[SelfCenterViewController alloc]init];
    selfCenterVC.title = @"个人中心";
    [selfCenterVC.tabBarItem setImage:[UIImage imageNamed:@"个人中心"]];
    [selfCenterVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"个人中心highlight"]];
    UINavigationController *selfCenterNavi = [[UINavigationController alloc]initWithRootViewController:selfCenterVC];
    [tabBarController addChildViewController:selfCenterNavi];
    
    _window.rootViewController = tabBarController;
    // Override point for customization after application launch.
    return YES;
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
