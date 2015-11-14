//
//  dataCity.h
//  HQ
//
//  Created by Mac on 12/11/2015.
//  Copyright © 2015 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dataWeather.h"

@interface dataCity : NSObject

@property (nonatomic, strong, readonly) NSString*         cityName;
@property (nonatomic, strong, readonly) NSMutableArray*   dayWeather;

- (id)initWithCity:(NSString*)city weather:(NSMutableArray*)weather;

@end
