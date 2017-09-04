//
//  MyGroup.m
//  weather forecast
//
//  Created by JACK on 2017/8/9.
//  Copyright © 2017年 JACK. All rights reserved.
//

#import "MyGroup.h"
#import <UIKit/UIKit.h>


@implementation MyGroup
- (MyGroup *)init{
//    [super init];
    self = [super init];
    if (self) {
        _array0 = [NSArray arrayWithObjects:@"今天",@"明天",@"后天",nil];
        _array1 = [NSArray arrayWithObjects:@"11111" ,nil];
        _array2 = [NSArray arrayWithObjects:@"出行建议",@"1",@"2" ,nil];
        _array3 = [NSArray arrayWithObjects:@"运动建议",@"3" ,nil];
        _array4 = [NSArray arrayWithObjects:@"驾车建议",@"4" ,nil];
        _group = [NSArray arrayWithObjects:_array0,_array1,_array2,_array3,_array4, nil];
        _count0 = [NSArray arrayWithObjects:@50,@50,@50, nil];
        _count1 = [NSArray arrayWithObjects:@150,@150 ,nil];
        _count2 = [NSArray arrayWithObjects:@40,@80,@80 ,nil];
        _count3 = [NSArray arrayWithObjects:@40,@80 ,nil];
        _count4 = [NSArray arrayWithObjects:@40,@80 ,nil];
        _countAll = [NSArray arrayWithObjects:_count0,_count1,_count2,_count3,_count4,nil];
        
        _titleWear = [NSArray arrayWithObjects:@"适合短袖",@"适合长袖",@"适合外套", nil];
        _adviceWear = [NSArray arrayWithObjects:@"热战酷暑，换个姿势花样过夏吧",@"二八月就应该长袖，和她约在小树林里溜达",@"寒意来袭，宝宝抗不住了，赶紧回家换外套", nil];
        _titleRay = [NSArray arrayWithObjects:@"紫外线较强",@"紫外线正常",@"紫外线很弱", nil];
        _adviceRay = [NSArray arrayWithObjects:@"涂防晒霜谨慎选择产品哦，避免皮肤过敏",@"户外运动走起来，但是不要太剧烈了哦，你懂的",@"这天气，再也不用担心被晒黑了，不过有点冷，我还是回去吧", nil];
        _titleSport = [NSArray arrayWithObjects:@"适宜户外运动",@"控制运动时间",@"记得保护措施", nil];
        _adviceSport = [NSArray arrayWithObjects:@"舒适的天气别浪费，快集结好友出门运动",@"又是这种想干嘛就干嘛的天气，不过我还是喜欢在云上的日子",@"运动一下就不会冷了，但是小心别受伤了", nil];
        _titleDrive = [NSArray arrayWithObjects:@"适宜洗车",@"适宜自驾游",@"减少驾车出行", nil];
        _adviceDrive = [NSArray arrayWithObjects:@"今日适宜洗车，快给爱车冲凉吧", @"今日适宜自驾游，赶紧和小伙伴们约起来吧",@"城市套路深，开车有点滑",nil];
        _weather_pic = [[NSMutableArray alloc]init];
        for( int i =1;i< 4;i++){
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 375, 150)];
            NSString *str = [NSString stringWithFormat:@"image%d",i];
            imageView.image = [UIImage imageNamed:str];
            [_weather_pic addObject:imageView];
        }

    }
    return self;
}

@end

