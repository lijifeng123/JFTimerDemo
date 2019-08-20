//
//  NSTimer+JFReallyCrazy.h
//  JFTimerDemo
//
//  Created by 李继峰 on 2019/3/18.
//  Copyright © 2019 sss. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (JFReallyCrazy)


+ (NSTimer*)scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats blockTimer:(void (^)(NSTimer *))block;

@end

NS_ASSUME_NONNULL_END
