//
//  Global_Change.m
//  weather forecast
//
//  Created by JACK on 2017/9/4.
//  Copyright © 2017年 JACK. All rights reserved.
//

#import "Global_Change.h"

@implementation Global_Change
+ (Global_Change *)sharedSingleton{
    static Global_Change *sharedSingleton;
    
    @synchronized (self) {
        sharedSingleton = [[Global_Change alloc]init];
        
        return sharedSingleton;
    }
}
@end
