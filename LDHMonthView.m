//
//  LDHMonthView.m
//  LDHCalenderViewDemo
//
//  Created by lidehua on 15/5/4.
//  Copyright (c) 2015年 李德华. All rights reserved.
//

#import "LDHMonthView.h"
#import "LDHWeekView.h"
#import "LDHMonthItem.h"
#import "LDHWeekItem.h"
@interface LDHMonthView()<LDHWeekItemDelegate>
@property (strong, nonatomic) NSMutableArray * weekViewArray;
@end
@implementation LDHMonthView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _weekViewArray = [NSMutableArray array];
    }
    return self;
}
- (void)setDataSource:(LDHMonthItem *)dataSource {
    _dataSource = dataSource;
    [self setWeekViews];
}
- (void)setWeekViews {
    __block CGFloat monthHeight = 0;
    [_dataSource.weekArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        LDHWeekView * weekView = [[LDHWeekView alloc] initWithFrame:CGRectMake(0, 44 * idx, self.frame.size.width, 44)];
        weekView.dataSource = obj;
        weekView.delegate = self;
        [self addSubview:weekView];
        monthHeight += 44;
        [_weekViewArray addObject:weekView];
    }];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, monthHeight);
}
- (void)dayItemClickWithDate:(NSDate *)date weekView:(LDHWeekView *)weekView {
    //[self resetWeekViews];
    //[weekView updateDayViews];
    [self updateWeekViewsWithView:weekView];
}
- (void)resetWeekViews {
    for (LDHWeekView * weekView in _weekViewArray) {
        [weekView resetDayViews];
    }
}
- (void)updateWeekViewsWithView:(LDHWeekView *)weekView {
    for (LDHWeekView * view in _weekViewArray) {
        if ([view isEqual:weekView]) {
            [view updateDayViews];
        } else {
            [view resetDayViews];
        }
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
