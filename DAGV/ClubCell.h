//
//  ClubCell.h
//  DAGV
//
//  Created by Nathan Hegedus on 10/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClubCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *typeLabel;
@property (strong, nonatomic) IBOutlet UIImageView *thumbImageView;

@property (strong, nonatomic) IBOutlet UILabel *placeLabel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UILabel *daysLabel;
@property (strong, nonatomic) IBOutlet UILabel *guestsLabel;
@property (strong, nonatomic) IBOutlet UILabel *productsLabel;
@property (strong, nonatomic) IBOutlet UILabel *discountLabel;
@property (strong, nonatomic) IBOutlet UIButton *siteLabel;

@end
