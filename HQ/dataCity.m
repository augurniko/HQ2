//
//  dataCity.m
//  HQ
//
//  Created by Mac on 12/11/2015.
//  Copyright © 2015 Mac. All rights reserved.
//

#import "dataCity.h"

@implementation dataCity

- (id)initWithCity:(NSString*)city weather:(NSMutableArray*)weather
{
    self = [super init];
    if (self)
    {
        _cityName   = city;
        _dayWeather = weather;
    }
    return self;
}

@end
