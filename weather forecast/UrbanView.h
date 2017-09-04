//
//  UrbanView.h
//  weather forecast
//
//  Created by JACK on 2017/9/4.
//  Copyright © 2017年 JACK. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UrbanView : UIView<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSDictionary *showapi_res_body;
@property(nonatomic,strong)NSDictionary *cityInfo;
@property(nonatomic,strong)NSDictionary *now;
@property(nonatomic,strong)NSDictionary *f2;
@property(nonatomic,strong)NSDictionary *f3;
@property(nonatomic,strong)NSDictionary *aqiDetail;

@end
