//
//  ExtrasViewController.h
//  DAGV
//
//  Created by Nathan Hegedus on 11/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import "BaseViewController.h"

@interface ExtrasViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSString *type;

@end
