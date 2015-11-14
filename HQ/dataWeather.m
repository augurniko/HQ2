//
//  dataWeather.m
//  HQ
//
//  Created by Mac on 12/11/2015.
//  Copyright © 2015 Mac. All rights reserved.
//

#import "dataWeather.h"

@implementation dataWeather

- (id)initWithWeather:(NSString*)day icon:(NSString*)icon maxCelcius:(NSNumber*)maxCelcius minCelcius:(NSNumber*)minCelcius summary:(NSString*)summary
{
    self = [super init];
    if (self)
    {
        _dayName        = day;
        _dayIconUrl     = icon;
        _dayMaxCelsius  = maxCelcius;
        _dayMinCelsius  = minCelcius;
        _daySummery     = summary;
    }
    return self;
}
@end
