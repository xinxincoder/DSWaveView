//
//  RainbowController.m
//  DSWaveViewDemo
//
//  Created by XXL on 2017/9/5.
//  Copyright © 2017年 CustomUI. All rights reserved.
//

#import "RainbowController.h"
#import <DSWaveView/DSWaveView-umbrella.h>

@interface RainbowController ()
@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UILabel *label;

@property (nonatomic, strong) DSWaveView *waveView;

@end

@implementation RainbowController
- (IBAction)sliderAction:(UISlider *)sender {
    
    self.label.text = [NSString stringWithFormat:@"%.2f",sender.value];
    
    self.waveView.waveSpeed = sender.value;

}

- (void)dealloc {
    
    NSLog(@"RainbowController = dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *colors = @[UIColor.redColor,UIColor.orangeColor,UIColor.yellowColor,UIColor.greenColor,UIColor.cyanColor,UIColor.blueColor,UIColor.purpleColor];
    
    DSWaveView *waveView = [DSWaveView waveWithWaveColors:colors];
    waveView.waveSpeed = 0.5;
    waveView.waveHeight = 10;
    waveView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 300);
    [self.view addSubview:self.waveView = waveView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
