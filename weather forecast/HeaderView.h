//
//  HeaderView.h
//  weather forecast
//
//  Created by JACK on 2017/8/10.
//  Copyright © 2017年 JACK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderView : UIView

@property(nonatomic,strong)UILabel *area;
@property(nonatomic,strong)UILabel *temperature;
@property(nonatomic,strong)UILabel *weather;
@property(nonatomic,strong)UIImageView *weather_pic;
@property(nonatomic,strong)UILabel *airQualityIndex;
@property(nonatomic,strong)UILabel *wind_direction;
@property(nonatomic,strong)UILabel *wind_power;
@property(nonatomic,strong)UILabel *sdLabel;
@property(nonatomic,strong)UILabel *sd;
@property(nonatomic,strong)UILabel *GetTemperatureLabel;
@property(nonatomic,strong)UILabel *temperature_time;


@end
