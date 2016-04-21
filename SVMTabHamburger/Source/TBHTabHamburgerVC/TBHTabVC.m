//
//  TBHTabVC.m
//  TabHamburger
//
//  Created by staticVoidMan on 21/04/16.
//  Copyright © 2016 svmLogics. All rights reserved.
//

#import "TBHTabVC.h"

@interface TBHTabVC ()

@end

@implementation TBHTabVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)showViewControllerWithTabType:(TBHTabType)type {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    switch (type) {
        case eTBH_TabType_FirstVC: {
            [self performSegueWithIdentifier:@"embedSVMFirstVC"
                                      sender:nil];
            break;
        }
        case eTBH_TabType_SecondVC: {
            [self performSegueWithIdentifier:@"embedSVMSecondVC"
                                      sender:nil];
            break;
        }
        case eTBH_TabType_ThirdVC: {
            [self performSegueWithIdentifier:@"embedSVMThirdVC"
                                      sender:nil];
            break;
        }
        case eTBH_TabType_FourthVC: {
            [self performSegueWithIdentifier:@"embedSVMFourthVC"
                                      sender:nil];
            break;
        }
        case eTBH_TabType_FifthVC: {
            [self performSegueWithIdentifier:@"embedSVMFifthVC"
                                      sender:nil];
            break;
        }
    }
}

#pragma mark - UIStoryboard Methods
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *existingVC;
    for (UIViewController *currentVC in self.childViewControllers) {
        if ([currentVC.restorationIdentifier isEqualToString:segue.destinationViewController.restorationIdentifier]) {
            existingVC = currentVC;
        }
        
        if([currentVC.view isDescendantOfView:self.view]) {
            NSLog(@"Removing Existing: %@",currentVC.restorationIdentifier);
            [currentVC.view removeFromSuperview];
        }
    }
    
    if (existingVC) {
        NSLog(@"Loading Existing: %@", existingVC.restorationIdentifier);
        [self.view addSubview:existingVC.view];
        [existingVC didMoveToParentViewController:self];
        [existingVC.view setFrame:self.view.bounds];
    }
    else {
        NSLog(@"Creating New: %@",segue.destinationViewController.restorationIdentifier);
        [self addChildViewController:segue.destinationViewController];
        [self.view addSubview:((UIViewController *)segue.destinationViewController).view];
        [segue.destinationViewController didMoveToParentViewController:self];
        [segue.destinationViewController.view setFrame:self.view.bounds];
    }
}

@end
