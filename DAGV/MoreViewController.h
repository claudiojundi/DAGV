//
//  MoreViewController.h
//  DAGV
//
//  Created by Claudioj Sassaki on 12/3/12.
//  Copyright (c) 2012 Claudio Jundi Sassaki. All rights reserved.
//

#import "BaseViewController.h"

@interface MoreViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *itensTableView;

@end
