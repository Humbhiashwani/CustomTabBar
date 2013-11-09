//
//  ColoredViewController.m
//  CustomTabBar
//
//  Created by Sergey Demchenko on 11/9/13.
//  Copyright (c) 2013 antrix1989@gmail.com. All rights reserved.
//

#import "NamedViewController.h"

@interface NamedViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation NamedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _nameLabel.text = _name;
}

- (void)setName:(NSString *)name
{
    _name = name;
    
    _nameLabel.text = _name;
}

@end
