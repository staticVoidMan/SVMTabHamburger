//
//  TBHTabHamburgerVC.m
//  TabHamburger
//
//  Created by staticVoidMan on 21/04/16.
//  Copyright © 2016 svmLogics. All rights reserved.
//

#import "TBHTabHamburgerVC.h"

#import "TBHSharedSettings.h"
@class TBHTabVC;

@interface TBHTabHamburgerVC () <UITabBarDelegate>
{
    IBOutlet UITabBar *tbhTabbar;
    IBOutlet UIView *vwContainer_vTBHTabVC;
}
@end

@implementation TBHTabHamburgerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - UITabBar Delegate
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    TBHTabType type = [tabBar.items indexOfObject:item];
    [TBHSharedSettings loadTabWithType:type];
}

#pragma mark - SlideNavigationController Methods
- (BOOL)slideNavigationControllerShouldDisplayLeftMenu {
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu {
    return YES;
}

#pragma mark - UIStoryboard Methods
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"embedTBHTabVC"]) {
        [TBHSharedSettings sharedInstance].vTBHTabVC = (TBHTabVC *)segue.destinationViewController;
    }
}

@end
