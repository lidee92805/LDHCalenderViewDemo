//
//  ViewController.m
//  LDHCalenderViewDemo
//
//  Created by lidehua on 15/5/4.
//  Copyright (c) 2015年 李德华. All rights reserved.
//

#import "ViewController.h"
#import "LDHCalendarView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LDHCalendarView * calendarView = [[LDHCalendarView alloc] initWithFrame:CGRectMake(0, 150, kScreenWidth, 80)];
    [self.view addSubview:calendarView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
