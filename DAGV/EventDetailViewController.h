//
//  EventDetailViewController.h
//  DAGV
//
//  Created by Nathan Hegedus on 08/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import "BaseViewController.h"

@interface EventDetailViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>


@property (strong,nonatomic)IBOutlet UIImageView *topImageView;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;




@property (strong, nonatomic) NSArray *infoDict;

@end
