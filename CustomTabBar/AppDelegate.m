//
//  AppDelegate.m
//  CustomTabBar
//
//  Created by Sergey Demchenko on 11/9/13.
//  Copyright (c) 2013 antrix1989@gmail.com. All rights reserved.
//

#import "AppDelegate.h"
#import "NamedViewController.h"
#import "CustomTabBarViewController.h"
#import "CustomTabBarItem.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    CustomTabBarViewController *customTabBarViewController = [CustomTabBarViewController new];
    
    for (int i = 0; i < 10; i++) {
        NSString *name = [NSString stringWithFormat:@"# %i", i];
        
        NamedViewController *namedViewController = [NamedViewController new];
        namedViewController.name = name;
        
        [customTabBarViewController.topTabBarItems addObject:[[CustomTabBarItem alloc] initWithName:name andViewController:namedViewController]];
    }
    
    self.window.rootViewController = customTabBarViewController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
