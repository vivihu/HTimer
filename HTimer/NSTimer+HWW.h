//
//  NSTimer+HWW.h
//  HTimerDemo
//
//  Created by dj-xxzx-10065 on 16/3/12.
//  Copyright © 2016年 Dong jing Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TimerAction)();

@interface NSTimer (HWW)

@property (nonatomic, readonly, assign) BOOL paused;

/**
 *  创建Timer
 *
 *  @param interval 每隔interval秒就回调一次callback
 *  @param repeats  是否重复
 *  @param callback 回调block
 *
 *  @return NSTimer对象
 */
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                    repeats:(BOOL)repeats
                                   callback:(TimerAction)callback;

/**
 *  创建Timer
 *
 *  @param interval 每隔interval秒就回调一次callback
 *  @param count    回调次数，如果count <= 0，则表示无限次，否则表示具体的次数
 *  @param callback 回调block
 *
 *  @return NSTimer对象
 */
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      count:(NSInteger)count
                                   callback:(TimerAction)callback;

/**
 *  开始启动定时器
 */
- (void)start;

/**
 *  暂停定时器
 */
- (void)pause;

@end
