//
//  ViewController.m
//  DSWaveViewDemo
//
//  Created by XXL on 2017/9/4.
//  Copyright © 2017年 CustomUI. All rights reserved.
//

#import "ViewController.h"
#import <DSWaveView/DSWaveView-umbrella.h>

@interface ViewController ()<UITableViewDataSource>

@end

@implementation ViewController

- (void)dealloc {
    
    NSLog(@"dealloc = dealloc ");
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    return cell;
}

@end
