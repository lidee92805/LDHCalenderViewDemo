//
//  LDHMonthItem.h
//  LDHCalenderViewDemo
//
//  Created by lidehua on 15/5/4.
//  Copyright (c) 2015年 李德华. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface LDHMonthItem : NSObject
@property (strong, nonatomic) NSMutableArray * weekArray;
@property (assign, nonatomic) NSInteger weekCount;
- (void)setYear:(NSInteger)year month:(NSInteger)month;
@end
