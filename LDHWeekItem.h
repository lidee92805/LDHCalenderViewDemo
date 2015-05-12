//
//  LDHWeekItem.h
//  LDHCalenderViewDemo
//
//  Created by lidehua on 15/5/4.
//  Copyright (c) 2015年 李德华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LDHWeekItem : NSObject
@property (strong, nonatomic) NSMutableArray * dayArray;
- (void)setYear:(NSInteger)year month:(NSInteger)month weekOfMonth:(NSInteger)weekOfMonth;
@end
