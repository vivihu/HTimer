//
//  NSTimer+HWW.m
//  HTimerDemo
//
//  Created by dj-xxzx-10065 on 16/3/12.
//  Copyright © 2016年 Dong jing Ltd. All rights reserved.
//

#import "NSTimer+HWW.h"

#define kPausedDate [NSDate dateWithTimeIntervalSince1970:NSTimeIntervalSince1970*4]

@implementation NSTimer (HWW)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                    repeats:(BOOL)repeats
                                   callback:(TimerAction)callback {
    return [NSTimer scheduledTimerWithTimeInterval:interval
                                            target:self
                                          selector:@selector(onTimerUpdateBlock:)
                                          userInfo:[callback copy]
                                           repeats:repeats];
}

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      count:(NSInteger)count
                                   callback:(TimerAction)callback {
    if (count <= 0) {
        return [self scheduledTimerWithTimeInterval:interval repeats:YES callback:callback];
    }
    
    NSDictionary *userInfo = @{@"callback"     : [callback copy],
                               @"count"        : @(count)};
    return [NSTimer scheduledTimerWithTimeInterval:interval
                                            target:self
                                          selector:@selector(onTimerUpdateCountBlock:)
                                          userInfo:userInfo
                                           repeats:YES];
}

+ (void)onTimerUpdateBlock:(NSTimer *)timer {
    TimerAction block = timer.userInfo;
    
    if (block) {
        block();
    }
}

+ (void)onTimerUpdateCountBlock:(NSTimer *)timer {
    static NSUInteger currentCount = 0;
    
    NSDictionary *userInfo = timer.userInfo;
    TimerAction callback = userInfo[@"callback"];
    NSNumber *count = userInfo[@"count"];
    
    if (currentCount < count.integerValue) {
        currentCount++;
        if (callback) {
            callback();
        }
    } else {
        currentCount = 0;
        
        [timer invalidate];
    }
}

- (void)start {
    [self setFireDate:[NSDate distantPast]];
}

- (void)pause {
    [self setFireDate:kPausedDate];
}

- (BOOL)paused
{
    return [[self fireDate] isEqualToDate:kPausedDate];
}

@end
