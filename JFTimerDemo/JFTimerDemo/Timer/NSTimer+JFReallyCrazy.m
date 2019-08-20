//
//  NSTimer+JFReallyCrazy.m
//  JFTimerDemo
//
//  Created by 李继峰 on 2019/3/18.
//  Copyright © 2019 sss. All rights reserved.
//

#import "NSTimer+JFReallyCrazy.h"

@implementation NSTimer (JFReallyCrazy)

+ (NSTimer*)scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats blockTimer:(void (^)(NSTimer *timer))block{
    
    NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(timered:) userInfo:[block copy] repeats:repeats];
    
    return timer;
}

+ (void)timered:(NSTimer*)timer {
    
    void (^block)(NSTimer *timer)  = timer.userInfo;
    if (block) {
        block(timer);
    }
}

@end
