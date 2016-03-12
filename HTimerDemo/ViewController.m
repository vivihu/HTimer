//
//  ViewController.m
//  HTimerDemo
//
//  Created by dj-xxzx-10065 on 16/3/12.
//  Copyright © 2016年 Dong jing Ltd. All rights reserved.
//

#import "ViewController.h"
#import "NSTimer+HWW.h"

@interface ViewController ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (IBAction)开启或暂停定时器:(id)sender
{
    if ([self.timer paused])
        [self.timer start];
    else
        [self.timer pause];
}

- (NSTimer *)timer
{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f repeats:YES callback:^{
            NSLog(@"hello world!");
        }];
    }
    return _timer;
}

@end
