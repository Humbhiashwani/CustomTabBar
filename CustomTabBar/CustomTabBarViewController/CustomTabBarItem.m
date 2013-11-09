//
//  CustomTabBarItem.m
//  CustomTabBar
//
//  Created by Sergey Demchenko on 11/9/13.
//  Copyright (c) 2013 antrix1989@gmail.com. All rights reserved.
//

#import "CustomTabBarItem.h"

@implementation CustomTabBarItem

- (id)initWithName:(NSString *)name andViewController:(UIViewController *)viewController
{
    self = [super init];
    if (self) {
        _itemName = name;
        _itemViewController = viewController;
    }
    return self;
}

@end
