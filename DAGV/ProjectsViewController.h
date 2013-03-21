//
//  ProjectsViewController.h
//  DAGV
//
//  Created by Nathan Hegedus on 10/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import "BaseViewController.h"

@interface ProjectsViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSString *item;

@end
