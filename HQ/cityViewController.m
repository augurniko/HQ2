//
//  cityViewController.m
//  HQ
//
//  Created by Mac on 13/11/2015.
//  Copyright © 2015 Mac. All rights reserved.
//

#import "cityViewController.h"
#import "manager.h"

@interface cityViewController () <UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITableView    *cityTableView;
    
    NSArray                 *cityList;
}

@end

@implementation cityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.   
    cityList = [[manager sharedSingleton] getCity];
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
    
    return [cityList count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"tableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [[cityList objectAtIndex:indexPath.row] cityName];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[manager sharedSingleton] setWeatherForCity:[[cityList objectAtIndex:indexPath.row] cityName]];
    [self performSegueWithIdentifier:@"pushweatherview" sender:self];
}


@end
