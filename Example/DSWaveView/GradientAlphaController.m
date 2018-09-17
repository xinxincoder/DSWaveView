//
//  GradientAlphaController.m
//  DSWaveViewDemo
//
//  Created by XXL on 2017/9/5.
//  Copyright © 2017年 CustomUI. All rights reserved.
//

#import "GradientAlphaController.h"
#import <DSWaveView/DSWaveView-umbrella.h>

@interface GradientAlphaController ()

@property (strong, nonatomic) IBOutlet UISlider *slider;

@property (strong, nonatomic) IBOutlet UILabel *label;

@property (nonatomic, strong) DSWaveView *waveView;

@end

@implementation GradientAlphaController

- (IBAction)sliderAction:(UISlider *)sender {
    
    self.label.text = [NSString stringWithFormat:@"%.2f",sender.value];
    
    self.waveView.waveSpeed = sender.value;
    
}

- (void)dealloc {
    
    NSLog(@"dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DSWaveView *waveView = [DSWaveView waveWithWaveCount:5];
    waveView.waveColor = [UIColor orangeColor];
    waveView.waveHeight = 10;
    waveView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 300);
    [self.view addSubview:self.waveView = waveView];
    
    self.slider.minimumValue = 0;
    self.slider.maximumValue = 1;
    
}



@end
