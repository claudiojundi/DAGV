//
//  FeedWithImageCell.h
//  DAGV
//
//  Created by Nathan Hegedus on 08/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedWithImageCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *topBackgroundView;

@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (weak, nonatomic) IBOutlet UIImageView *thumbImageView;


@end
