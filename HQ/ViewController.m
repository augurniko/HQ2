//
//  ViewController.m
//  HQ
//
//  Created by Mac on 13/11/2015.
//  Copyright © 2015 Mac. All rights reserved.
//

#import "ViewController.h"
#import "manager.h"
#import "UIImageView+AFNetworking.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITableView    *countryTableView;
    
    NSArray                 *countryList;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [[manager sharedSingleton] parseTheJson];
    countryList = [[manager sharedSingleton] getJson];
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
    
    return [countryList count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"tableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [[countryList objectAtIndex:indexPath.row] countryName];
    
    NSString *pictUrl = [[countryList objectAtIndex:indexPath.row] countryImageUrl];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL: [NSURL URLWithString:pictUrl]];
    
    __weak UITableViewCell *weakCell = cell;
    [cell.imageView setImageWithURLRequest:urlRequest
                          placeholderImage:[UIImage imageNamed:@"placeHolder.png"]
                                   success: ^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                       
                                       __strong UITableViewCell *strongCell = weakCell;
                                       
                                       strongCell.imageView.image = image;
                                       
                                       [tableView reloadRowsAtIndexPaths: @[indexPath]
                                                        withRowAnimation: UITableViewRowAnimationNone];
                                       NSLog(@"Your image request succeeded!");
                                   } failure: ^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                       NSLog(@"Your image request failed...");
                                       
                                       NSLog(@"Error: %@", error);
                                       NSLog(@"Error: %@", response);
                                   }
     
     ];
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[manager sharedSingleton] setCityForCountry:[[countryList objectAtIndex:indexPath.row] countryName]];
    [self performSegueWithIdentifier:@"pushcityview" sender:self];
}

@end
