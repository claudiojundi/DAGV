//
//  LinksCell.h
//  DAGV
//
//  Created by Claudioj Sassaki on 1/29/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LinksCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIButton *linkButton;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *typeImageView;

@end
