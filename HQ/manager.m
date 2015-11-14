//
//  manager.m
//  HQ
//
//  Created by Mac on 13/11/2015.
//  Copyright © 2015 Mac. All rights reserved.
//

#import "manager.h"

@implementation manager

@synthesize jsonArray;

+ (id)sharedSingleton
{
    static manager *sharedSingleton = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedSingleton = [[self alloc] init];
    });
    
    return sharedSingleton;
}

- (void)parseTheJson
{
    jsonParser *parser = [jsonParser new];
    jsonArray = [parser parseJsonFile];
}

- (NSArray*)getJson
{
    return jsonArray;
}

- (void)setCityForCountry:(NSString*)country
{
    for (NSInteger nbCountry = 0;nbCountry < [jsonArray count];nbCountry ++)
    {
        if ([[[jsonArray objectAtIndex:nbCountry] countryName] isEqualToString:country])
        {
            _cityArray = [[jsonArray objectAtIndex:nbCountry] city];
        }
    }
}

- (NSArray*)getCity
{
    return _cityArray;
}

- (void)setWeatherForCity:(NSString*)city
{
    for (NSInteger nbCity = 0;nbCity < [_cityArray count];nbCity ++)
    {
        if ([[[_cityArray objectAtIndex:nbCity] cityName] isEqualToString:city])
        {
            _weatherArray = [[_cityArray objectAtIndex:nbCity] dayWeather];
        }
    }
}

- (NSArray*)getWeather
{
    return _weatherArray;
}

@end

