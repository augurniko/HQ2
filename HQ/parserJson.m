//
//  modelData.m
//  HQ
//
//  Created by Mac on 12/11/2015.
//  Copyright © 2015 Mac. All rights reserved.
//

#import "parserJson.h"

@implementation jsonParser

-(NSMutableArray*)parseJsonFile
{
    NSString* fileLocation = @"country_data.json";
    NSString* filePath = [[NSBundle mainBundle] pathForResource:[fileLocation stringByDeletingPathExtension] ofType:[fileLocation pathExtension]];
    NSData* data = [NSData dataWithContentsOfFile:filePath];

    NSError* error = nil;
    NSDictionary* jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                               options:NSJSONReadingAllowFragments
                                                                 error:&error];
    NSMutableArray *jsonResult;
    if (error != nil)
    {
        NSLog(@"Error parsing JSON: %@", error);
    }
    else
    {
        jsonResult = [self fillArray:jsonObject];
    }
    return jsonResult;
}

- (NSMutableArray*)fillArray:(NSDictionary*)jsonObject
{
    NSMutableArray *countryArray = [NSMutableArray new];
    NSDictionary* countryObject = [jsonObject objectForKey:@"countries"];
    
    for (NSDictionary* country in countryObject)
    {
        NSString* countryName       = [country objectForKey:@"country_name"];
        NSString* countryImageUrl   = [country objectForKey:@"flag_image_url"];
        countryImageUrl = [countryImageUrl stringByReplacingOccurrencesOfString:@"d3xm8g2fmv6ji.cloudfront.net"
                                      withString:@"backend.hotelquickly.com"];
        
        NSMutableArray  *cityArray  = [NSMutableArray new];
        NSDictionary *cityObject    = [country objectForKey:@"cities"];
        
        for (NSDictionary* city in cityObject)
        {
            NSString* cityName  = [city objectForKey:@"city_name"];
            
            if ((cityName != nil) && (![cityName isEqualToString:@"NULL"]))
            {
                NSMutableArray  *weatherArray   = [NSMutableArray new];
                NSDictionary* weatherObject = [[city objectForKey:@"weather"] objectForKey:@"daily"];
                NSArray* weatherKeys = [weatherObject allKeys];
                for (int keys = 0;keys < [weatherKeys count];keys ++)
                {
                    NSDictionary* weather = [weatherObject objectForKey:[weatherKeys objectAtIndex:keys]];
                    NSString *dayName         = [weather objectForKey:@"timeString"];
                    NSString *daySummary      = [weather objectForKey:@"summary"];
                    NSNumber *dayMaxCelcius   = [weather objectForKey:@"tempMaxCelcius"];
                    NSNumber *dayMinCelcius   = [weather objectForKey:@"tempMinCelcius"];
                    NSString *dayIconUrl      = [weather objectForKey:@"iconUrl"];
 /*                   dayIconUrl = [dayIconUrl stringByReplacingOccurrencesOfString:@"d3xm8g2fmv6ji.cloudfront.net"
                                                  withString:@"backend.hotelquickly.com"];
 */
                    dataWeather *weatherTemp = [[dataWeather alloc] initWithWeather:dayName
                                                                               icon:dayIconUrl
                                                                         maxCelcius:dayMaxCelcius
                                                                         minCelcius:dayMinCelcius
                                                                            summary:daySummary];
                    [weatherArray addObject:weatherTemp];
                }
                [self alphabeticArray:weatherArray withKey:@"dayName"];
                
                dataCity *cityTemp = [[dataCity alloc] initWithCity:cityName
                                                            weather:weatherArray];
                
                [cityArray addObject:cityTemp];
            }
        }
        dataCountry *countryTemp = [[dataCountry alloc] initWithCountry:countryName
                                                                   flag:countryImageUrl
                                                                   city:cityArray];
        [countryArray addObject:countryTemp];
    }
    return countryArray;
}

- (void)alphabeticArray:(NSMutableArray*)array withKey:(NSString*)key
{
    if (key != nil)
    {
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:key ascending:YES];
        [array sortUsingDescriptors:[NSArray arrayWithObject:sort]];
    }
    else
    {
        [array sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    }
}


@end
