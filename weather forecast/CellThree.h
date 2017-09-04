//
//  CellThree.h
//  weather forecast
//
//  Created by JACK on 2017/8/9.
//  Copyright © 2017年 JACK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellThree : UITableViewCell
@property (nonatomic,strong)UILabel *date;
@property (nonatomic,strong)UIImageView *weather_pic;
@property(nonatomic,strong)UILabel *weather;
@property(nonatomic,strong)UILabel *quality;
@property(nonatomic,strong)UILabel *temperature;
@end
