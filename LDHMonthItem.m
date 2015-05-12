//
//  LDHMonthItem.m
//  LDHCalenderViewDemo
//
//  Created by lidehua on 15/5/4.
//  Copyright (c) 2015年 李德华. All rights reserved.
//

#import "LDHMonthItem.h"
#import "LDHWeekItem.h"
#import "NSCalendar+ChineseCalendar.h"
@interface LDHMonthItem()

@end
@implementation LDHMonthItem
- (instancetype)init
{
    self = [super init];
    if (self) {
        _weekArray = [NSMutableArray array];
    }
    return self;
}
- (void)setYear:(NSInteger)year month:(NSInteger)month {
    NSCalendar * calendar = [NSCalendar chineseCurrentCalendar];
    NSDateComponents * components = [[NSDateComponents alloc] init];
    [components setYear:year];
    [components setMonth:month];
    [components setDay:1];
    NSDate * date = [calendar correctDateFromComponents:components];
    _weekCount = [calendar rangeOfUnit:NSCalendarUnitWeekOfMonth inUnit:NSCalendarUnitMonth forDate:date].length;
    for (NSInteger i = 0; i < _weekCount; i ++) {
        LDHWeekItem * item = [[LDHWeekItem alloc] init];
        [item setYear:year month:month weekOfMonth:i + 1];
        [_weekArray addObject:item];
    }
}
@end
