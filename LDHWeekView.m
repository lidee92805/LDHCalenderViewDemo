//
//  LDHWeekView.m
//  LDHCalenderViewDemo
//
//  Created by lidehua on 15/5/4.
//  Copyright (c) 2015年 李德华. All rights reserved.
//

#import "LDHWeekView.h"
#import "LDHWeekItem.h"
#import "LDHDayItem.h"
@interface LDHWeekView()
@property (strong, nonatomic) LDHWeekItem * weekItem;
@property (assign, nonatomic) CGFloat dayItemLenght;
@property (strong, nonatomic) NSMutableArray * dayViewArray;
@property (assign, nonatomic) NSInteger clickDayIndex;
@end
@implementation LDHWeekView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _dayViewArray = [NSMutableArray array];
        _clickDayIndex = NSNotFound;
    }
    return self;
}
- (void)setDataSource:(LDHWeekItem *)dataSource {
    _dataSource = dataSource;
    [self setDayViews];
}
- (void)setDayViews {
    _dayItemLenght = self.frame.size.width / 7;
    [_dataSource.dayArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(idx * _dayItemLenght, 0, _dayItemLenght, self.frame.size.height)];
        NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd"];
        LDHDayItem * item = obj;
        NSString * dateString = [formatter stringFromDate:item.currentDate];
        [btn setTitle:dateString forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        btn.tag = 1000 + idx;
        [btn addTarget:self action:@selector(dayBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [_dayViewArray addObject:btn];
    }];
}
- (void)dayBtnClick:(UIButton *)btn {
    [self resetDayViews];
    _clickDayIndex = btn.tag;
    if ([_delegate respondsToSelector:@selector(dayItemClickWithDate:weekView:)]) {
        LDHDayItem * item = [_dataSource.dayArray objectAtIndex:_clickDayIndex - 1000];
        [_delegate dayItemClickWithDate:item.currentDate weekView:self];
    }
}
- (void)updateDayViews {
    if (_clickDayIndex != NSNotFound) {
        UIButton * btn = [_dayViewArray objectAtIndex:_clickDayIndex - 1000];
        btn.layer.borderColor = [UIColor redColor].CGColor;
        btn.layer.borderWidth = 0.5;
    }
}
- (void)resetDayViews {
    if (_clickDayIndex != NSNotFound) {
        UIButton * btn = [_dayViewArray objectAtIndex:_clickDayIndex - 1000];
        btn.layer.borderColor = [UIColor clearColor].CGColor;
        btn.layer.borderWidth = 0;
        _clickDayIndex = NSNotFound;
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
