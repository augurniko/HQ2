//
//  dataCountry.h
//  HQ
//
//  Created by Mac on 13/11/2015.
//  Copyright © 2015 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dataCity.h"

@interface dataCountry : NSObject

@property (nonatomic, strong, readonly) NSString*         countryName;
@property (nonatomic, strong, readonly) NSString*         countryImageUrl;
@property (nonatomic, strong, readonly) NSMutableArray*   city;

- (id)initWithCountry:(NSString*)country flag:(NSString*)flag city:(NSMutableArray*)city;

@end
