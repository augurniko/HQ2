//
//  HQTests.m
//  HQTests
//
//  Created by Mac on 11/11/2015.
//  Copyright © 2015 Mac. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "manager.h"

@interface HQTests : XCTestCase

@end

@implementation HQTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSetAllOption
{
    NSArray *json = [[manager sharedSingleton] getJson];
    for (NSInteger nbCountry = 0;nbCountry < [json count];nbCountry ++)
    {
        NSString *country = [[json objectAtIndex:nbCountry] countryName];
        [[manager sharedSingleton] setCityForCountry:country];
        NSArray *resultCity = [[manager sharedSingleton] getCity];
        XCTAssertGreaterThan([resultCity count], 0);
        NSLog(@"%@ return %i city",country,[resultCity count]);
        for (NSInteger nbCity = 0;nbCity < [resultCity count];nbCity ++)
        {
            NSString *city = [[resultCity objectAtIndex:nbCity] cityName];
            [[manager sharedSingleton] setWeatherForCity:city];
            NSArray *resultWeather = [[manager sharedSingleton] getWeather];
            XCTAssertGreaterThan([resultWeather count], 0);
            NSLog(@"%@ return %i weather",city,[resultWeather count]);
        }
    }
}

- (void)testSetCityForCountry
{
    [[manager sharedSingleton] setCityForCountry:@"Australia"];
    NSArray *result = [[manager sharedSingleton] getCity];
    XCTAssertGreaterThan([result count], 0);
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
