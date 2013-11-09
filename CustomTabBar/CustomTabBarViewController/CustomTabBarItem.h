//
//  CustomTabBarItem.h
//  CustomTabBar
//
//  Created by Sergey Demchenko on 11/9/13.
//  Copyright (c) 2013 antrix1989@gmail.com. All rights reserved.
//

@interface CustomTabBarItem : NSObject

@property (strong, nonatomic) NSString *itemName;
@property (strong, nonatomic) UIViewController *itemViewController;

- (id)initWithName:(NSString *)name andViewController:(UIViewController *)viewController;

@end
