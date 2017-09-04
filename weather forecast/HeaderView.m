//
//  HeaderView.m
//  weather forecast
//
//  Created by JACK on 2017/8/10.
//  Copyright © 2017年 JACK. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView
- (id)init{
    self = [super init];
    if (self) {
        _area = [[UILabel alloc]initWithFrame:CGRectMake(40, 35, 100, 10)];
        _temperature = [[UILabel alloc]initWithFrame:CGRectMake(40, 40, 100, 100)];
        _temperature.font = [UIFont systemFontOfSize:55];
        _weather = [[UILabel alloc]initWithFrame:CGRectMake(20, 140, 50, 10)];
        _weather_pic = [[UIImageView alloc]initWithFrame:CGRectMake(50, 125, 40, 40)];
        _airQualityIndex = [[UILabel alloc]initWithFrame:CGRectMake(90, 140, 130, 10)];
        _wind_direction = [[UILabel alloc]initWithFrame:CGRectMake(50, 200, 70, 10)];
        _wind_power = [[UILabel alloc]initWithFrame:CGRectMake(50, 225, 50, 20)];
        _wind_power.font = [UIFont systemFontOfSize:25];
        _sdLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 200, 80, 10)];
        _sdLabel.text = @"相对湿度";
        _sd = [[UILabel alloc]initWithFrame:CGRectMake(160, 225, 50, 20)];
        _sd.font = [UIFont systemFontOfSize:25];
        _GetTemperatureLabel = [[UILabel alloc]initWithFrame:CGRectMake(260, 200, 80, 10)];
        _GetTemperatureLabel.text = @"获取时间";
        _temperature_time = [[UILabel alloc]initWithFrame:CGRectMake(260, 225, 80, 20)];
        _temperature_time.font = [UIFont systemFontOfSize:23];
  
        [self  addSubview:_area];
        [self addSubview:_temperature];
        [self addSubview:_weather];
        [self addSubview:_weather_pic];
        [self addSubview:_airQualityIndex];
        [self addSubview:_wind_direction];
        [self addSubview:_wind_power];
        [self addSubview:_sdLabel];
        [self addSubview:_sd];
        [self addSubview:_GetTemperatureLabel];
        [self addSubview:_temperature_time];
    }
    return self;
}


@end
