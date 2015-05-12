//
//  LDHWeekView.h
//  LDHCalenderViewDemo
//
//  Created by lidehua on 15/5/4.
//  Copyright (c) 2015年 李德华. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LDHWeekItem;
@class LDHWeekView;
@protocol LDHWeekItemDelegate <NSObject>
- (void) dayItemClickWithDate:(NSDate *)date weekView:(LDHWeekView *)weekView;
@end
@interface LDHWeekView : UIView
@property (weak, nonatomic) LDHWeekItem * dataSource;
@property (weak, nonatomic) id<LDHWeekItemDelegate> delegate;
- (void)updateDayViews;
- (void)resetDayViews;
@end
