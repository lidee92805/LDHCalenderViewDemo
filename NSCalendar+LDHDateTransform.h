//
//  NSCalendar+LDHDateTransform.h
//  LDHCalenderViewDemo
//
//  Created by lidehua on 15/5/4.
//  Copyright (c) 2015年 李德华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCalendar (LDHDateTransform)
- (NSDate *)correctDateFromComponents:(NSDateComponents *)components;
@end
