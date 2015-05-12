
//
//  NSCalendar+LDHDateTransform.m
//  LDHCalenderViewDemo
//
//  Created by lidehua on 15/5/4.
//  Copyright (c) 2015年 李德华. All rights reserved.
//

#import "NSCalendar+LDHDateTransform.h"

@implementation NSCalendar (LDHDateTransform)
- (NSDate *)correctDateFromComponents:(NSDateComponents *)components {
    NSDate * date = [self dateFromComponents:components];
    NSTimeZone * zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate * localeDate = [date dateByAddingTimeInterval:interval];
    return localeDate;
}
@end
