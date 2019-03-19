//
//  ViewController.m
//  JFTimerDemo
//
//  Created by 李继峰 on 2019/3/18.
//  Copyright © 2019 sss. All rights reserved.
//

#import "ViewController.h"
#import "BViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    BViewController *bVC = [[BViewController alloc]init];
    
    [self.navigationController pushViewController:bVC animated:YES];
    
}


@end
