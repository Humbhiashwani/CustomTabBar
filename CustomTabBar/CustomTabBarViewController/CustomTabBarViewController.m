//
//  CustomTabBarViewController.m
//  CustomTabBar
//
//  Created by Sergey Demchenko on 11/9/13.
//  Copyright (c) 2013 antrix1989@gmail.com. All rights reserved.
//

#import "CustomTabBarViewController.h"
#import "CustomTabBarItem.h"
#import "CustomTabBarCell.h"

static NSString *kTopTabBarCellIdentifier = @"CustomTabBarCell";

@interface CustomTabBarViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UICollectionView *tobBarItemsCollectionView;
@property (assign, nonatomic) NSUInteger selectedTopTabIndex;

@end

@implementation CustomTabBarViewController

- (id)init
{
    self = [super init];
    if (self) {
        _selectedTopTabIndex = NSNotFound;
        _topTabBarItems = [NSMutableArray new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tobBarItemsCollectionView registerNib:[UINib nibWithNibName:kTopTabBarCellIdentifier bundle:nil] forCellWithReuseIdentifier:kTopTabBarCellIdentifier];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Select first tab by default.
    NSArray *selectedItems = [self.tobBarItemsCollectionView indexPathsForSelectedItems];
    if ([selectedItems count] == 0) {
        [self selectTabAtIndex:0];
    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.topTabBarItems count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomTabBarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kTopTabBarCellIdentifier forIndexPath:indexPath];
    
    CustomTabBarItem *tobBarItem = [self.topTabBarItems objectAtIndex:indexPath.row];
    
    cell.tabBarItem = tobBarItem;
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.selectedTopTabIndex != [indexPath row]) {
        [self removeViewControllerFromSuperView:self.selectedTopTabViewController];
        
        self.selectedTopTabIndex = [indexPath row];
        [self addChildViewController:self.selectedTopTabViewController toView:self.contentView];
    }
}

#pragma mark - Private

- (void)selectTabAtIndex:(NSUInteger)tabIndex
{
    NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:tabIndex inSection:0];
    [self.tobBarItemsCollectionView selectItemAtIndexPath:selectedIndexPath animated:NO scrollPosition:UICollectionViewScrollPositionLeft];
    [self collectionView:self.tobBarItemsCollectionView didSelectItemAtIndexPath:selectedIndexPath];
}

- (UIViewController *)selectedTopTabViewController
{
    if (self.selectedTopTabIndex > [self.topTabBarItems count]) {
        return nil;
    }
    
    return [[self.topTabBarItems objectAtIndex:self.selectedTopTabIndex] itemViewController];
}

- (void)addChildViewController:(UIViewController *)childController toView:(UIView *)view
{
	[self addChildViewController:childController];
	childController.view.frame = view.bounds;
	[view addSubview:childController.view];
	[childController didMoveToParentViewController:self];
}

- (void)removeViewControllerFromSuperView:(UIViewController *)childController
{
    [childController willMoveToParentViewController:nil];
	[childController.view removeFromSuperview];
	[childController removeFromParentViewController];
}
@end
