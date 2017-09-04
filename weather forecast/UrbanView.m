//
//  UrbanView.m
//  weather forecast
//
//  Created by JACK on 2017/9/4.
//  Copyright © 2017年 JACK. All rights reserved.
//

#import "UrbanView.h"
#import "CellOne.h"
#import "CellTwo.h"
#import "CellThree.h"
#import "MyGroup.h"
#import "HeaderView.h"
#import "SeletedViewController.h"

NSString *text;
int kindex;
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@implementation UrbanView{
    MyGroup *data;
    UILabel *label;
    HeaderView *headerView;
    UIImageView *imageView;
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (id)init{
    self = [super init];
    if (self) {
        data = [[MyGroup alloc]init];
        _tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self addSubview:_tableView];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
        [_tableView registerClass:[CellOne class] forCellReuseIdentifier:@"cellId1"];
        [_tableView registerClass:[CellTwo class] forCellReuseIdentifier:@"cellId2"];
        [_tableView registerClass:[CellThree class] forCellReuseIdentifier:@"cellId3"];
        //tableFooterView
        UIView *viewFoot = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 40)];
        viewFoot.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1];
        label = [[UILabel alloc]initWithFrame:CGRectMake(120, 15,130, 10)];
        label.font = [UIFont systemFontOfSize:12];
        label.text = @"气象数据来自彩云天气";
        _tableView.tableFooterView = viewFoot;
        [viewFoot addSubview:label];
        //tabelHeaderView
        
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 375,260)];
        imageView.image = [UIImage imageNamed:@"jna"];
        imageView.alpha = 0.2;
        headerView = [[HeaderView alloc]init];
        headerView.frame = CGRectMake(0, 0, 375, 260);
        headerView.backgroundColor = [UIColor whiteColor];
        _tableView.tableHeaderView = headerView;
        [headerView addSubview:imageView];
        
        [self getData];
        UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [deleteButton setImage:[UIImage imageNamed:@"删除"] forState:UIControlStateNormal];
        deleteButton.frame = CGRectMake(330, 25, 30, 30);
        [deleteButton addTarget:self action:@selector(deleteUrban) forControlEvents:UIControlEventTouchUpInside];
        [headerView addSubview:deleteButton];
        
    }
    return self;
}
- (void)deleteUrban{
    [self removeFromSuperview];
    text = nil;
}
- (void)getData{
    //异步请求
    //        String *area = [String ]
    dispatch_queue_t  queue =dispatch_queue_create("ss", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSURLSession *session = [NSURLSession sharedSession];
        NSURL *url = [NSURL URLWithString:@"https://route.showapi.com/9-2"];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        request.HTTPMethod = @"POST";
        request.HTTPBody = [[NSString stringWithFormat:@"area=%@&showapi_appid=43537&showapi_sign=bc234eaa18cc47e29374fa69f0067154",text] dataUsingEncoding:NSUTF8StringEncoding];
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
//            NSLog(@"%@",dict);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                _showapi_res_body = [dict objectForKey: @"showapi_res_body"];
                _cityInfo = [_showapi_res_body objectForKey:@"cityInfo"];
                _now = [_showapi_res_body objectForKey:@"now"];
                _f2 = [_showapi_res_body objectForKey:@"f2"];
                _f3 = [_showapi_res_body objectForKey:@"f3"];
                _aqiDetail = [_now objectForKey:@"aqiDetail"];
                [self updateUI];
            });
            //解析数据
            
            //        [self performSelectorOnMainThread:@selector(updateUI) withObject:nil waitUntilDone:NO];
        }];
        [dataTask resume];
    });
    
}
- (void)updateUI {
    headerView.area.text = [_cityInfo objectForKey:@"c3"];
    headerView.temperature.text = [_now objectForKey:@"temperature"];
    headerView.weather.text = [_now objectForKey:@"weather"];
    NSData * dataImage = [NSData dataWithContentsOfURL:[NSURL URLWithString:[_now objectForKey:@"weather_pic"]]];
    [headerView.weather_pic setImage:[UIImage imageWithData: dataImage]];
    headerView.airQualityIndex.text = [NSString stringWithFormat:@"轻度污染: %@>",[_now objectForKey:@"aqi"]];
    headerView.wind_direction.text = [_now objectForKey:@"wind_direction"];
    headerView.wind_power.text = [_now objectForKey:@"wind_power"];
    headerView.sd.text = [_now objectForKey:@"sd"];
    headerView.temperature_time.text = [_now objectForKey:@"temperature_time"];
    [self.tableView reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *gg = data.group[section];
    return gg.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  data.group.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 8.0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *gg = data.countAll[indexPath.section];
    return (CGFloat)[[gg objectAtIndex:indexPath.row] integerValue];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //判断天气状况
    if ( [[_now objectForKey:@"weather"] isEqualToString:@"晴"]) {
        kindex = 0;
    }else if ([[_now objectForKey:@"weather"] isEqualToString:@"多云"]){
        kindex = 1;
    }else{
        kindex = 2;
    }
    if (indexPath.section == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
        [cell addSubview:data.weather_pic[kindex]];
        return cell;
    }else if (indexPath.row == 0 && indexPath.section > 1) {
        CellTwo *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId2" forIndexPath:indexPath];
        NSArray *gg = data.group[indexPath.section];
        cell.label.text = gg[indexPath.row];
        return cell;
    }else if(indexPath.row >0 && indexPath.section>1){
        CellOne *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId1" forIndexPath:indexPath];
        NSArray *gg = data.group[indexPath.section];
        if (indexPath.row == 1 && indexPath.section == 2){
            cell.imageView.image = [UIImage imageNamed:gg[indexPath.row]];
            cell.title.text = data.titleWear[kindex];
            cell.advice.text = data.adviceWear[kindex];
        }else if (indexPath.row == 2 && indexPath.section == 2){
            cell.imageView.image = [UIImage imageNamed:gg[indexPath.row]];
            cell.title.text = data.titleRay[kindex];
            cell.advice.text = data.adviceRay[kindex];
        }else if (indexPath.row == 1 && indexPath.section == 3){
            cell.imageView.image = [UIImage imageNamed:gg[indexPath.row]];
            cell.title.text = data.titleSport[kindex];
            cell.advice.text = data.adviceSport[kindex];
        }else{
            cell.imageView.image = [UIImage imageNamed:gg[indexPath.row]];
            cell.title.text = data.titleDrive[kindex];
            cell.advice.text = data.adviceDrive[kindex];
        }
        return cell;
    }else if( indexPath.section == 0){
        if(indexPath.row == 0){
            CellThree *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId3" forIndexPath:indexPath];
            NSArray *gg = data.group[indexPath.section];
            cell.date.text =  gg[indexPath.row];
            NSData * dataImage = [NSData dataWithContentsOfURL:[NSURL URLWithString:[_now objectForKey:@"weather_pic"]]];
            [cell.weather_pic setImage:[UIImage imageWithData: dataImage]];
            cell.weather.text = [_now objectForKey:@"weather"];
            cell.quality.text = [_aqiDetail objectForKey:@"quality"];
            cell.temperature.text = [_now objectForKey:@"temperature"];
            return cell;
        }else if (indexPath.row == 1){
            CellThree *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId3" forIndexPath:indexPath];
            NSArray *gg = data.group[indexPath.section];
            cell.date.text =  gg[indexPath.row];
            NSData * dataImage = [NSData dataWithContentsOfURL:[NSURL URLWithString:[_f2 objectForKey:@"day_weather_pic"]]];
            [cell.weather_pic setImage:[UIImage imageWithData: dataImage]];
            cell.weather.text = [_f2 objectForKey:@"day_weather"];
            cell.quality.text = [_aqiDetail objectForKey:@"quality"];
            cell.temperature.text = [_f2 objectForKey:@"day_air_temperature"];
            return cell;
        }else{
            CellThree *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId3" forIndexPath:indexPath];
            NSArray *gg = data.group[indexPath.section];
            cell.date.text =  gg[indexPath.row];
            NSData * dataImage = [NSData dataWithContentsOfURL:[NSURL URLWithString:[_f3 objectForKey:@"day_weather_pic"]]];
            [cell.weather_pic setImage:[UIImage imageWithData: dataImage]];
            cell.weather.text = [_f3 objectForKey:@"day_weather"];
            cell.quality.text = [_aqiDetail objectForKey:@"quality"];
            cell.temperature.text = [_f3 objectForKey:@"day_air_temperature"];
            return cell;
        }
    }else{
        CellTwo *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId2" forIndexPath:indexPath];
        //        NSArray *gg = data.group[indexPath.section];
        //        cell.label.text = [dataResource.cityInfo objectForKey:@"c3"];
        //        NSLog(@"----------------------------%@",[dataResource.cityInfo objectForKey:@"c3"]);
        return  cell;
    }
    
}

@end
