//
//  weatherViewController.m
//  HQ
//
//  Created by Mac on 13/11/2015.
//  Copyright © 2015 Mac. All rights reserved.
//

#import "weatherViewController.h"
#import "manager.h"
#import "weatherTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@interface weatherViewController () <UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITableView    *weatherTableView;
    
    NSArray                 *weatherList;
}

@end

@implementation weatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.    
    weatherList = [[manager sharedSingleton] getWeather];
    weatherTableView.allowsSelection = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if ([weatherList count] > 5)
        return 5;
    else
        return [weatherList count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"myWeatherCell";
    
    weatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    NSArray *titleDay = [[[weatherList objectAtIndex:indexPath.row] dayName] componentsSeparatedByString:@" "];
    cell.weatherTitle.text = [titleDay objectAtIndex:0];
    cell.weatherMaxCelcius.text = [NSString stringWithFormat:@"Max : %@°",[[[weatherList objectAtIndex:indexPath.row] dayMaxCelsius] stringValue]];
    cell.weatherMinCelcius.text = [NSString stringWithFormat:@"Min : %@°",[[[weatherList objectAtIndex:indexPath.row] dayMinCelsius] stringValue]];
    cell.weatherSummery.text = [[weatherList objectAtIndex:indexPath.row] daySummery];
    
    NSString *pictUrl = [[weatherList objectAtIndex:indexPath.row] dayIconUrl];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL: [NSURL URLWithString:pictUrl]];
    
    __weak weatherTableViewCell *weakCell = cell;
    [cell.weatherImage setImageWithURLRequest:urlRequest
                          placeholderImage:[UIImage imageNamed:@"placeHolder.png"]
                                   success: ^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                       
                                       __strong weatherTableViewCell *strongCell = weakCell;
                                       
                                       strongCell.imageView.image = image;
                                       
                                       [tableView reloadRowsAtIndexPaths: @[indexPath]
                                                        withRowAnimation: UITableViewRowAnimationNone];
                                       NSLog(@"Weather Your image request succeeded!");
                                   } failure: ^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                       NSLog(@"Your image request failed...");
                                       
                                       NSLog(@"Error: %@", error);
                                       NSLog(@"Error: %@", response);
                                   }
     
     ];
    
    return cell;
}


@end
