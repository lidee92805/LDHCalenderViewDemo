//
//  NSCalendar+ChineseCalendar.h
//  LDHCalenderViewDemo
//
//  Created by lidehua on 15/5/11.
//  Copyright (c) 2015年 李德华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCalendar (ChineseCalendar)
+ (NSCalendar *)chineseCurrentCalendar;
- (NSDate *)correctDateFromComponents:(NSDateComponents *)components;
@end
