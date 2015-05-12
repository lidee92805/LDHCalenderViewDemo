//
//  NSCalendar+ChineseCalendar.m
//  LDHCalenderViewDemo
//
//  Created by lidehua on 15/5/11.
//  Copyright (c) 2015年 李德华. All rights reserved.
//

#import "NSCalendar+ChineseCalendar.h"

@implementation NSCalendar (ChineseCalendar)
+ (NSCalendar *)chineseCurrentCalendar {
    NSCalendar * calendar = [NSCalendar currentCalendar];
    calendar.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    return calendar;
}
- (NSDate *)correctDateFromComponents:(NSDateComponents *)components {
    NSDate * date = [self dateFromComponents:components];
    NSTimeZone * zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate * localeDate = [date dateByAddingTimeInterval:interval];
    return localeDate;
}
@end
