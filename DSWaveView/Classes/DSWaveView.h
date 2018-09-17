//
//  DSWaveView.h
//  DSWaveViewDemo
//
//  Created by XXL on 2017/9/4.
//  Copyright © 2017年 CustomUI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSWaveView : UIView

/** 一个波的高 */
@property (nonatomic, assign) CGFloat waveHeight;
/** 一个波的宽 */
@property (nonatomic, assign) CGFloat waveWidth;
/** 浪的速度 */
@property (nonatomic, assign) CGFloat waveSpeed;
/** 浪的颜色 */
@property (nonatomic, strong) UIColor *waveColor;

/**
 初始化

 @param count 浪的个数
 @return DSWaveView
 */
+ (instancetype)waveWithWaveCount:(NSUInteger)count;

/**
 初始化

 @param waveColors 颜色的数组
 @return DSWaveView
 */
+ (instancetype)waveWithWaveColors:(NSArray <UIColor *>*)waveColors;

@end
