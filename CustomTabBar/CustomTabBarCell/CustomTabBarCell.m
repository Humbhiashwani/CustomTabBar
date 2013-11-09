//
//  CustomTabBarCell.m
//  CustomTabBar
//
//  Created by Sergey Demchenko on 10/29/13.
//  Copyright (c) 2013 antrix1989@gmail.com. All rights reserved.
//

#import "CustomTabBarCell.h"
#import "CustomTabBarItem.h"

@interface CustomTabBarCell ()

@property (weak, nonatomic) IBOutlet UILabel *tabTitleLabel;

@end

@implementation CustomTabBarCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    UIView *selectedView = [[UIView alloc] init];
    selectedView.backgroundColor = [UIColor redColor];
    self.selectedBackgroundView = selectedView;
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    if (!selected) {
        self.backgroundColor = [UIColor greenColor];
    }
}

- (void)setTabBarItem:(CustomTabBarItem *)tobBarItem
{
    _tabBarItem = tobBarItem;
    
    self.tabTitleLabel.text = tobBarItem.itemName;
}

@end
