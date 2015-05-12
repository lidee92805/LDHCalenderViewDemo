//
//  LDHWeekItem.m
//  LDHCalenderViewDemo
//
//  Created by lidehua on 15/5/4.
//  Copyright (c) 2015年 李德华. All rights reserved.
//

#import "LDHWeekItem.h"
#import "LDHDayItem.h"
#import "NSCalendar+ChineseCalendar.h"
@implementation LDHWeekItem
- (instancetype)init {
    self = [super init];
    if (self) {
        _dayArray = [NSMutableArray arrayWithCapacity:kDAYCOUNT];
    }
    return self;
}
- (void)setYear:(NSInteger)year month:(NSInteger)month weekOfMonth:(NSInteger)weekOfMonth {
    NSCalendar * calendar = [NSCalendar chineseCurrentCalendar];
    NSDateComponents * components = [[NSDateComponents alloc] init];
    [components setYear:year];
    [components setMonth:month];
    [components setWeekOfMonth:weekOfMonth];
    for (NSInteger i = 0; i < kDAYCOUNT; i ++) {
        [components setWeekday:i + 1];
        NSDate * localeDate = [calendar correctDateFromComponents:components];
        LDHDayItem * item = [[LDHDayItem alloc] init];
        item.currentDate = localeDate;
        [_dayArray addObject:item];
    }
}
@end
