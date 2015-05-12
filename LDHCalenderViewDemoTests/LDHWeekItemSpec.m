//
//  LDHWeekItemSpec.m
//  LDHCalenderViewDemo
//
//  Created by lidehua on 15/5/4.
//  Copyright 2015年 李德华. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "LDHWeekItem.h"
#import "LDHDayItem.h"
SPEC_BEGIN(LDHWeekItemSpec)

describe(@"LDHWeekItem", ^{
    context(@"create weekItem", ^{
        LDHWeekItem * item = [[LDHWeekItem alloc] init];
        it(@"item should exist", ^{
            [[item shouldNot] beNil];
        });
        [item setYear:2015 month:5 weekOfMonth:2];
        it(@"array should contain 7 element", ^{
            [[item.dayArray should] haveCountOf:7];
        });
        it(@"element in array should beKindOf LDHDayItem", ^{
            [[[item.dayArray objectAtIndex:0] should] beKindOfClass:[LDHDayItem class]];
        });
    });
});

SPEC_END
