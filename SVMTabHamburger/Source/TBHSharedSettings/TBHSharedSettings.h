//
//  TBHSharedSettings.h
//  SVMTabHamburger
//
//  Created by staticVoidMan on 21/04/16.
//  Copyright © 2016 svmLogics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBHCommon.h"

@class TBHTabVC;

@interface TBHSharedSettings : NSObject

@property (nonatomic, strong) TBHTabVC *vTBHTabVC;

+(TBHSharedSettings *)sharedInstance;
+(void)loadTabWithType:(TBHTabType)type;

@end
