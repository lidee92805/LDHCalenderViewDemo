//
//  LDHCalendarView.m
//  LDHCalenderViewDemo
//
//  Created by lidehua on 15/5/5.
//  Copyright (c) 2015年 李德华. All rights reserved.
//

#import "LDHCalendarView.h"
#import "LDHMonthView.h"
#import "LDHMonthItem.h"
#import "NSCalendar+ChineseCalendar.h"

#define kSymbolHeight 30
#define kTitleHeight 15

@interface LDHCalendarView()
@property (assign, nonatomic) NSInteger currentYear;
@property (assign, nonatomic) NSInteger currentMonth;
@property (strong, nonatomic) NSCalendar * calendar;
@property (strong, nonatomic) UILabel * titleDateLabel;
@property (weak, nonatomic) LDHMonthView * currentMonthView;
@end
@implementation LDHCalendarView
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _calendar = [NSCalendar chineseCurrentCalendar];
        NSDateComponents * components = [_calendar components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:[NSDate date]];
        _currentYear = components.year;
        _currentMonth = components.month;
        [self setupSubViews];
        [self addSwipeAction];
    }
    return self;
}
- (void)setupSubViews {
    CGFloat left = self.frame.size.width / 7;
    [self addSubview:self.titleDateLabel];
    [[_calendar weekdaySymbols] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(left * idx, kTitleHeight, left, kSymbolHeight)];
        NSString * symbol = obj;
        label.text = [symbol substringFromIndex:symbol.length - 1];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }];
    LDHMonthView * monthView = [self setMonthViewWithYear:_currentYear month:_currentMonth];
    [self addSubview:monthView];
    _currentMonthView = monthView;
    CGRect calendarRect = self.frame;
    calendarRect.size.height = kSymbolHeight + monthView.frame.size.height;
    self.frame = calendarRect;
}
- (void)addSwipeAction {
    UISwipeGestureRecognizer * leftSwipe = [[UISwipeGestureRecognizer alloc] init];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [leftSwipe addTarget:self action:@selector(swipeAction:)];
    [self addGestureRecognizer:leftSwipe];
    UISwipeGestureRecognizer * rightSwipe = [[UISwipeGestureRecognizer alloc] init];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [rightSwipe addTarget:self action:@selector(swipeAction:)];
    [self addGestureRecognizer:rightSwipe];
}
- (LDHMonthView *)setMonthViewWithYear:(NSInteger)year month:(NSInteger)month {
    LDHMonthView * monthView = [[LDHMonthView alloc] initWithFrame:CGRectMake(0, kSymbolHeight, self.bounds.size.width, 50)];
    LDHMonthItem * monthItem = [[LDHMonthItem alloc] init];
    [monthItem setYear:year month:month];
    monthView.dataSource = monthItem;
    return monthView;
}
- (void)swipeAction:(UISwipeGestureRecognizer *)swipe {
    CGFloat width = swipe.direction - 1?self.bounds.size.width:-self.bounds.size.width;
    [self computeDateWithSwipeDirection:swipe.direction];
    [self switchMonthViewWithDistance:width];
    _titleDateLabel.text = [NSString stringWithFormat:@"%ld年%ld月",(long)_currentYear,(long)_currentMonth];
}
- (void)computeDateWithSwipeDirection:(UISwipeGestureRecognizerDirection)direction {
    if (direction == UISwipeGestureRecognizerDirectionRight) {
        if (_currentMonth == 1) {
            _currentMonth = 12;
            _currentYear --;
        } else {
            _currentMonth --;
        }
    } else if (direction == UISwipeGestureRecognizerDirectionLeft) {
        if (_currentMonth == 12) {
            _currentMonth = 1;
            _currentYear ++;
        } else {
            _currentMonth ++;
        }
    }
}
- (void)switchMonthViewWithDistance:(CGFloat)distance {
    LDHMonthView * monthView = [self setMonthViewWithYear:_currentYear month:_currentMonth];
    CGRect rect = self.frame;
    rect.size.height = kSymbolHeight + monthView.frame.size.height;
    monthView.transform = CGAffineTransformMakeTranslation(-distance, 0);
    [self addSubview:monthView];
    [UIView animateWithDuration:0.3 animations:^{
        _currentMonthView.transform = CGAffineTransformMakeTranslation(distance, 0);
        monthView.transform = CGAffineTransformIdentity;
        self.frame = rect;
    } completion:^(BOOL finished) {
        [_currentMonthView removeFromSuperview];
        _currentMonthView = nil;
        _currentMonthView = monthView;
    }];
}
- (UILabel *)titleDateLabel {
    _titleDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, kTitleHeight)];
    _titleDateLabel.text = [NSString stringWithFormat:@"%ld年%ld月",(long)_currentYear,(long)_currentMonth];
    _titleDateLabel.textAlignment = NSTextAlignmentCenter;
    return _titleDateLabel;
}
@end
