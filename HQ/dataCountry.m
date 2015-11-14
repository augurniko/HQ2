//
//  dataCountry.m
//  HQ
//
//  Created by Mac on 12/11/2015.
//  Copyright © 2015 Mac. All rights reserved.
//

#import "dataCountry.h"

@implementation dataCountry

- (id)initWithCountry:(NSString*)country flag:(NSString*)flag city:(NSMutableArray*)city
{
    self = [super init];
    if (self)
    {
        _countryName        = country;
        _countryImageUrl    = flag;
        _city               = city;
    }
    return self;
}

@end
