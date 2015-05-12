//
//  LDHDayItemSpec.m
//  LDHCalenderViewDemo
//
//  Created by lidehua on 15/5/4.
//  Copyright 2015年 李德华. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "LDHDayItem.h"


SPEC_BEGIN(LDHDayItemSpec)

describe(@"LDHDayItem", ^{
    context(@"create dayItem", ^{
        LDHDayItem * item = [[LDHDayItem alloc] init];
        it(@"item should exist", ^{
            [[item shouldNot] beNil];
        });
        NSDate * date = [NSDate date];
        item.currentDate = date;
        it(@"item'date should exist", ^{
            [[item.currentDate shouldNot] beNil];
        });
        it(@"item'date should equal date", ^{
            [[item.currentDate should] equal:date];
        });
    });
});

SPEC_END
