//
//  Global_Change.h
//  weather forecast
//
//  Created by JACK on 2017/9/4.
//  Copyright © 2017年 JACK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Global_Change : NSObject
+ (Global_Change *)sharedSingleton;
@property(nonatomic,strong)NSString *ktext;
@end
