//
//  CellThree.m
//  weather forecast
//
//  Created by JACK on 2017/8/9.
//  Copyright © 2017年 JACK. All rights reserved.
//

#import "CellThree.h"

@implementation CellThree

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.date];
        [self.contentView addSubview:self.weather_pic];
        [self.contentView addSubview:self.weather];
        [self.contentView addSubview:self.quality];
        [self.contentView addSubview:self.temperature];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
- (UILabel *)date {
    if (!_date) {
        _date = [[UILabel alloc]init];
        _date.frame = CGRectMake(20,10, 80, 20);
    }
    return _date;
}
- (UIImageView *)weather_pic {
    if (!_weather_pic) {
        _weather_pic = [[UIImageView alloc]init];
        _weather_pic.frame = CGRectMake(100, 10, 30, 20);
    }
    return _weather_pic;
}
- (UILabel *)weather {
    if (!_weather) {
        _weather = [[UILabel alloc]init];
        _weather.frame = CGRectMake(130, 10, 60, 20);
    }
    return _weather;
}
- (UILabel *)quality {
    if (!_quality) {
        _quality = [[UILabel alloc]init];
        _quality.frame = CGRectMake(190,10, 80, 20);
    }
    return _quality;
}
- (UILabel *)temperature {
    if (!_temperature) {
        _temperature = [[UILabel alloc]init];
        _temperature.frame = CGRectMake(300, 10, 50, 20);
    }
    return _temperature;
}



@end
