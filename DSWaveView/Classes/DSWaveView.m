//
//  DSWaveView.m
//  DSWaveViewDemo
//
//  Created by XXL on 2017/9/4.
//  Copyright © 2017年 CustomUI. All rights reserved.
//

#import "DSWaveView.h"

@interface DSProxy : NSObject

@property (nonatomic, weak) id executor;

@end

@implementation DSProxy

- (void)proxyAction {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    //
    [_executor performSelector:@selector(timerAction)];
    
#pragma clang diagnostic pop
    
}

@end

@interface DSWaveView ()

@property (nonatomic, assign) CGFloat offset;

@property (nonatomic, strong) CAShapeLayer *mainWaveLayer;

@property (nonatomic, strong) CAShapeLayer *shadeWaveLayer;

@property (nonatomic, strong) NSMutableArray <CAShapeLayer *> *waveLayers;

@property (nonatomic, assign) NSUInteger waveCount;

@property (nonatomic, strong) CADisplayLink *displayLink;

@property (nonatomic, strong) NSArray <UIColor *> *waveColors;

@end

@implementation DSWaveView

- (void)dealloc {
    
    [self stopTimer];
}

- (NSMutableArray *)waveLayers {
    
    if (!_waveLayers) {
        
        _waveLayers = [NSMutableArray array];
    }
    return _waveLayers;
}

- (CGFloat)waveWidth {
    
    if (_waveWidth == 0) {
        
        _waveWidth = CGRectGetWidth(self.frame) * 2/3;
    }
    
    return _waveWidth;
}

- (CGFloat)waveHeight {
    
    if (_waveHeight == 0) {
        _waveHeight = CGRectGetHeight(self.frame)*0.5;
    }
    return _waveHeight;
}


+ (instancetype)waveWithWaveCount:(NSUInteger)count {
    
    return [[DSWaveView alloc] initWithWaveCount:count waveColors:nil];
}

+ (instancetype)waveWithWaveColors:(NSArray <UIColor *>*)waveColors {
    
    return [[DSWaveView alloc] initWithWaveCount:waveColors.count waveColors:waveColors];
}

- (instancetype)initWithWaveCount:(NSUInteger)count waveColors:(NSArray <UIColor *>*)waveColors {
    
    self = [super init];
    _waveColors = waveColors;
    _waveCount = count;
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setUpData {
    
    CGFloat alpha = 1;
    
    for (NSUInteger i = 0; i < _waveCount; i++) {
        
        CAShapeLayer *waveLayer = [CAShapeLayer layer];
        
        UIColor *color = self.waveColors[i];
        
        UIColor *waveColor;
        
        if (color) {
            
            waveColor = color;
            
        }else {
            
            if (_waveCount) {
                
                waveColor = _waveColor;
                
            }else {
                
                waveColor = [UIColor blueColor];
            }
            
            waveColor = [waveColor colorWithAlphaComponent:alpha];
        }
        
        waveLayer.strokeColor = [UIColor clearColor].CGColor;
        waveLayer.fillColor = waveColor.CGColor;
        
        [self.layer addSublayer:waveLayer];
        [self.layer insertSublayer:waveLayer atIndex:0];
        [self.waveLayers addObject:waveLayer];
        
        alpha = alpha*0.5;
    }
    
    _offset = 0.5;
}

- (void)startTimer {
    
    if (_waveCount == 0) {
        
        _waveCount = 1;
    }
        
    [self setUpData];
    
    DSProxy *proxy = [DSProxy new];
    proxy.executor = self;
    self.displayLink = [CADisplayLink displayLinkWithTarget:proxy selector:@selector(proxyAction)];
    
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)stopTimer {
    
    [self.displayLink invalidate];
    self.displayLink = nil;
}

- (void)timerAction {
    
    _offset += self.waveSpeed;
    
    [self createWaveLayer];
}

- (void)createWaveLayer {
    
    CGFloat width = CGRectGetWidth(self.frame);
    
    [self.waveLayers enumerateObjectsUsingBlock:^(CAShapeLayer * _Nonnull waveLayer, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        
        [path moveToPoint:CGPointMake(0, 0)];
        
        for (NSUInteger x = 0; x <= width; x++) {
            
            CGFloat y = self.waveHeight * sinf(M_PI/self.waveWidth*x + (idx + 1)*20 + (_offset*0.005)/(idx + 1)*20) + self.waveHeight;
            
            [path addLineToPoint:CGPointMake(x, y)];
        }
        
        [path addLineToPoint:CGPointMake(width, CGRectGetHeight(self.frame))];
        
        [path addLineToPoint:CGPointMake(0, CGRectGetHeight(self.frame))];
        
        [path closePath];
        
        waveLayer.path = path.CGPath;
        
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self startTimer];
}


@end
