//
//  SeletedViewController.m
//  weather forecast
//
//  Created by JACK on 2017/8/11.
//  Copyright © 2017年 JACK. All rights reserved.
//

#import "SeletedViewController.h"
#import "MainViewController.h"

extern NSString *text;
@interface SeletedViewController (){
    UIButton *urbanButton;
    UITextField *urbanTextField;
}
@end

@implementation SeletedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    UIImageView *navigationImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"background_main"]];
    navigationImageView.frame = CGRectMake(0, 0, 375, 64);
    [self.view addSubview:navigationImageView];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    backButton.imageView.image = [UIImage imageNamed:@"back"];
    [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(5, 30, 20, 20);
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"添加城市";
    titleLabel.frame = CGRectMake(25, 30, 80, 20);
    [navigationImageView addSubview:titleLabel];
    NSArray *urbanArray = [NSArray arrayWithObjects:@"西安", @"长沙",@"武汉",@"成都",@"贵州",@"兰州",@"南昌",@"拉萨",@"宝鸡",@"渭南",@"大连",@"上海",@"郑州",@"深圳",@"哈尔滨",@"武威",nil];
    urbanTextField = [[UITextField alloc]initWithFrame:CGRectMake(100, 27, 200, 30)];
    urbanTextField.backgroundColor = [UIColor whiteColor];
    [navigationImageView addSubview:urbanTextField];
    UIButton *goButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [goButton setTitle:@"确定"  forState:UIControlStateNormal];
    [goButton setTitle:@"确定" forState:UIControlStateSelected];
    [goButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    goButton.frame = CGRectMake(250,32,40,20);
    [goButton addTarget:self action:@selector(go) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goButton];
    for (int i = 1,key = 0; i<5; i++) {
        for (int j = 1; j<5; j++,key++) {
            urbanButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [urbanButton setTitle:[urbanArray objectAtIndex:key]  forState:UIControlStateNormal];
            urbanButton.layer.cornerRadius = 4.0;
            [urbanButton setBackgroundImage:[UIImage imageNamed:@"background_main"] forState:UIControlStateHighlighted];
            [urbanButton.layer setBorderWidth:1.0];
            [urbanButton setTitle:[urbanArray objectAtIndex:key]  forState:UIControlStateSelected];
            [urbanButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            urbanButton.frame = CGRectMake(68*j, 40+60*i, 60, 20);
            [urbanButton addTarget:self action:@selector(touch:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:urbanButton];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)go{
    text = urbanTextField.text;
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
   }
- (void)touch:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (!sender.selected) {
        urbanTextField.text = @"";
    }else{
    urbanTextField.text = sender.titleLabel.text;
    }
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
