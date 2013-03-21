//
//  ProjectDetailViewController.h
//  DAGV
//
//  Created by Nathan Hegedus on 10/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import "BaseViewController.h"

@interface ProjectDetailViewController : BaseViewController

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UITextView *descriptionLabel;
@property (strong, nonatomic) IBOutlet UIImageView *thumbImageView;

@end
