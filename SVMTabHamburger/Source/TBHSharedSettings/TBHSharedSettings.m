//
//  TBHSharedSettings.m
//  SVMTabHamburger
//
//  Created by staticVoidMan on 21/04/16.
//  Copyright © 2016 svmLogics. All rights reserved.
//

#import "TBHSharedSettings.h"
#import "TBHTabVC.h"

@implementation TBHSharedSettings

static TBHSharedSettings *_sharedInstance = nil;
+ (TBHSharedSettings *)sharedInstance {
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
}

+(void)loadTabWithType:(TBHTabType)type {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    [[TBHSharedSettings sharedInstance].vTBHTabVC showViewControllerWithTabType:type];
}

@end
