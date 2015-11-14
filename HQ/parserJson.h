//
//  modelData.h
//  HQ
//
//  Created by Mac on 12/11/2015.
//  Copyright © 2015 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dataCountry.h"

@interface jsonParser : NSObject

- (NSMutableArray*)parseJsonFile;
- (void)alphabeticArray:(NSMutableArray*)array withKey:(NSString*)key;

@end
