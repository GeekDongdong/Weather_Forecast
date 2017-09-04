//
//  ViewController.m
//  weather forecast
//
//  Created by JACK on 2017/8/7.
//  Copyright © 2017年 JACK. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *animationImageView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    animationImageView.image = [UIImage imageNamed:@"animationImageView"];
    [self.view addSubview:animationImageView];
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(enterMain) userInfo:nil repeats:NO];
}
- (void)enterMain{
    MainViewController *vc = [[MainViewController alloc]init];
    [self presentViewController:vc animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
