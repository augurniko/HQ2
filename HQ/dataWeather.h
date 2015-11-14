//
//  dataWeather.h
//  HQ
//
//  Created by Mac on 12/11/2015.
//  Copyright © 2015 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dataWeather : NSObject

@property (nonatomic, strong, readonly) NSString* dayName;
@property (nonatomic, strong, readonly) NSString* dayIconUrl;
@property (nonatomic, strong, readonly) NSNumber* dayMaxCelsius;
@property (nonatomic, strong, readonly) NSNumber* dayMinCelsius;
@property (nonatomic, strong, readonly) NSString* daySummery;

- (id)initWithWeather:(NSString*)day icon:(NSString*)icon maxCelcius:(NSNumber*)maxCelcius minCelcius:(NSNumber*)minCelcius summary:(NSString*)summary;

@end
