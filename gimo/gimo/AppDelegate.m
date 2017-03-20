//
//  AppDelegate.m
//  gimo
//
//  Created by 吳隆筠 on 3/12/17.
//  Copyright © 2017 Cyrus Goh. All rights reserved.
//

#import "AppDelegate.h"

#import <Lock/Lock.h>
#import <ChameleonFramework/Chameleon.h>
#import <FlatUIKit/FlatUIKit.h>

#import "ViewController.h"
#import "HomeViewController.h"
#import "ProfileViewController.h"
#import "DataViewController.h"

#import "YALFirstTestViewController.h"
#import "YALSecondTestViewController.h"
#import "YALThirdTestViewController.h"
#import "YALFourthTestViewController.h"

#import "YALTabBarItem.h"
#import "YALFoldingTabBarController.h"
#import "YALAnimatingTabBarConstants.h"

//#import <FoldingTabBar/YALTabBarItem.h>
//#import <FoldingTabBar/YALFoldingTabBarController.h>
//#import <FoldingTabBar/YALAnimatingTabBarConstants.h>


@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    // reference this next time

    /*
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[CTPViewController alloc] initWithNibName:@"CTPViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
    */

    // 1 show logo
    ViewController *showVC = [[ViewController alloc]init];

    // 2 prompt lock for login
    A0Lock *lock = [[MyApplication sharedInstance] lock];
    [lock applicationLaunchedWithOptions:launchOptions];

    // 3 home
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    homeVC.tabBarItem.title = @"Home";

    // 4 profile
    ProfileViewController *profileVC = [[ProfileViewController alloc]init];
    profileVC.tabBarItem.title = @"Profile";

    // 5 data
    DataViewController *dataVC = [[DataViewController alloc]init];
    dataVC.tabBarItem.title = @"Data";

    // 6 first
    YALFirstTestViewController *firstVC = [[YALFirstTestViewController alloc]init];
    firstVC.tabBarItem.title = @"First";

    // 7 second
    YALSecondTestViewController *secondVC = [[YALSecondTestViewController alloc]init];
    secondVC.tabBarItem.title = @"Second";

    // 8 third
    YALThirdTestViewController *thirdVC = [[YALThirdTestViewController alloc]init];
    thirdVC.tabBarItem.title = @"Third";

    // 9 fourth
    YALFourthTestViewController *fourthVC = [[YALFourthTestViewController alloc]init];
    fourthVC.tabBarItem.title = @"Fourth";

    // 10 init tabbarcontroller
    YALFoldingTabBarController *tabBarController = [[YALFoldingTabBarController alloc]init];
    self.tabBarController.viewControllers = @[firstVC,secondVC,thirdVC,fourthVC];

//    YALFoldingTabBarController *tabBarController = (YALFoldingTabBarController *) self.window.rootViewController;


    // start rootViewController
    [self.window setRootViewController:showVC];
    [self.window makeKeyAndVisible];



    //prepare leftBarItems
    YALTabBarItem *item1 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"nearby_icon"]
                                                      leftItemImage:nil
                                                     rightItemImage:nil];


    YALTabBarItem *item2 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"profile_icon"]
                                                      leftItemImage:nil
                                                     rightItemImage:nil];

    tabBarController.leftBarItems = @[item1, item2];

    //prepare rightBarItems
    YALTabBarItem *item3 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"chats_icon"]
                                                      leftItemImage:nil
                                                     rightItemImage:nil];


    YALTabBarItem *item4 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"settings_icon"]
                                                      leftItemImage:nil
                                                     rightItemImage:nil];

    YALTabBarItem *item5 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"settings_icon"]
                                                      leftItemImage:nil
                                                     rightItemImage:nil];

    tabBarController.rightBarItems = @[item3, item4, item5];

    tabBarController.centerButtonImage = [UIImage imageNamed:@"plus_icon"];

    tabBarController.selectedIndex = 2;

    //customize tabBarView
    tabBarController.tabBarView.extraTabBarItemHeight = YALExtraTabBarItemsDefaultHeight;
    tabBarController.tabBarView.offsetForExtraTabBarItems = YALForExtraTabBarItemsDefaultOffset;
    tabBarController.tabBarView.backgroundColor = [UIColor colorWithRed:94.f/255.f green:91.f/255.f blue:149.f/255.f alpha:1.f];
    tabBarController.tabBarView.tabBarColor = [UIColor colorWithRed:72.f/255.f green:211.f/255.f blue:178.f/255.f alpha:1.f];
    tabBarController.tabBarViewHeight = YALTabBarViewDefaultHeight;
    tabBarController.tabBarView.tabBarViewEdgeInsets = YALTabBarViewHDefaultEdgeInsets;
    tabBarController.tabBarView.tabBarItemsEdgeInsets = YALTabBarViewItemsDefaultEdgeInsets;

    //    [self setupYALTabBarController];

    return YES;
}


//- (void)setupYALTabBarController {
//    YALFoldingTabBarController *tabBarController = (YALFoldingTabBarController *) self.window.rootViewController;
//
//    //prepare leftBarItems
//    YALTabBarItem *item1 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"nearby_icon"]
//                                                      leftItemImage:nil
//                                                     rightItemImage:nil];
//
//
//    YALTabBarItem *item2 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"profile_icon"]
//                                                      leftItemImage:nil
//                                                     rightItemImage:nil];
//
//    tabBarController.leftBarItems = @[item1, item2];
//
//    //prepare rightBarItems
//    YALTabBarItem *item3 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"chats_icon"]
//                                                      leftItemImage:nil
//                                                     rightItemImage:nil];
//
//
//    YALTabBarItem *item4 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"settings_icon"]
//                                                      leftItemImage:nil
//                                                     rightItemImage:nil];
//
//    YALTabBarItem *item5 = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"settings_icon"]
//                                                      leftItemImage:nil
//                                                     rightItemImage:nil];
//
//    tabBarController.rightBarItems = @[item3, item4, item5];
//
//    tabBarController.centerButtonImage = [UIImage imageNamed:@"plus_icon"];
//
//    tabBarController.selectedIndex = 2;
//
//    //customize tabBarView
//    tabBarController.tabBarView.extraTabBarItemHeight = YALExtraTabBarItemsDefaultHeight;
//    tabBarController.tabBarView.offsetForExtraTabBarItems = YALForExtraTabBarItemsDefaultOffset;
//    tabBarController.tabBarView.backgroundColor = [UIColor colorWithRed:94.f/255.f green:91.f/255.f blue:149.f/255.f alpha:1.f];
//    tabBarController.tabBarView.tabBarColor = [UIColor colorWithRed:72.f/255.f green:211.f/255.f blue:178.f/255.f alpha:1.f];
//    tabBarController.tabBarViewHeight = YALTabBarViewDefaultHeight;
//    tabBarController.tabBarView.tabBarViewEdgeInsets = YALTabBarViewHDefaultEdgeInsets;
//    tabBarController.tabBarView.tabBarItemsEdgeInsets = YALTabBarViewItemsDefaultEdgeInsets;
//}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    A0Lock *lock = [[MyApplication sharedInstance] lock];
    return [lock handleURL:url sourceApplication:sourceApplication];
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

@end
