//
//  ClubCell.m
//  DAGV
//
//  Created by Nathan Hegedus on 10/01/13.
//  Copyright (c) 2013 Claudio Jundi Sassaki. All rights reserved.
//

#import "ClubCell.h"

@implementation ClubCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)configureCell{
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 281, 271, 21)];
    [button setBackgroundColor:[UIColor clearColor]];
    [button addTarget:self action:@selector(openLink) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:button];
    [self.contentView setFrame:CGRectMake(10, 112, 291, 309)];
    
}



@end
