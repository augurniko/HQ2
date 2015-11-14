//
//  weatherTableViewCell.h
//  HQ
//
//  Created by Mac on 13/11/2015.
//  Copyright © 2015 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface weatherTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView    *weatherImage;
@property (nonatomic, weak) IBOutlet UILabel        *weatherTitle;
@property (nonatomic, weak) IBOutlet UILabel        *weatherMaxCelcius;
@property (nonatomic, weak) IBOutlet UILabel        *weatherMinCelcius;
@property (nonatomic, weak) IBOutlet UILabel        *weatherSummery;

@end
