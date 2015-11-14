//
//  manager.h
//  HQ
//
//  Created by Mac on 13/11/2015.
//  Copyright © 2015 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

//#import "myConstant.h"
#import "parserJson.h"

@interface manager : NSObject

@property (nonatomic, strong)		NSMutableArray		*jsonArray;
@property (nonatomic, strong)		NSMutableArray		*cityArray;
@property (nonatomic, strong)		NSMutableArray		*weatherArray;

// Prototypes
+ (id)sharedSingleton;

- (void)parseTheJson;
- (NSArray*)getJson;

- (void)setCityForCountry:(NSString*)country;
- (NSArray*)getCity;

- (void)setWeatherForCity:(NSString*)city;
- (NSArray*)getWeather;

@end
